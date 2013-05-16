# Class: ntp
#
#   This module manages the ntp service.
#
# Actions:
#
#  Installs, configures, and manages the ntp service.
#
# Requires:
#
# Sample Usage:
#   include ntp
#
class ntp (
  $package_latest      = 'false',
  $config_file_owner   = 'root',
  $config_file_group   = 'root',
  $config_file_mode    = '0644',
  $service_running     = 'true',
  $service_hasstatus   = 'true',
  $service_hasrestart  = 'true',
  $servers             = ['0.us.pool.ntp.org',
                          '1.us.pool.ntp.org',
                          '2.us.pool.ntp.org'],
  $server_options      = 'UNSET',
  $orphan_mode_stratum = 'UNSET',
  $fudge_stratum       = '10',
  $enable_stats        = 'false',
  $statsdir            = '/var/log/ntpstats/',
  $logfile             = 'UNSET',
) {

  require 'ntp::data'

  if $package_latest == 'true' {
    $package_ensure = latest
  } else {
    $package_ensure = present
  }

  if $service_running == 'true' {
    $service_ensure = running
    $service_enable = true
  } else {
    $service_ensure = stopped
    $service_enable = false
  }

  # validate $enable_stats - must be 'true' or 'false'
  case $enable_stats {
    'true','false': {
      # noop - accepting values
    }
    default: {
      fail("ntp::enable_stats must be 'true' or 'false' and is ${enable_stats}")
    }
  }

  package { 'ntp_package':
    ensure => $package_ensure,
    name   => $ntp::data::package_name,
    noop   => $ntp::data::package_noop,
  }

  file { 'ntp_conf':
    ensure  => file,
    path    => $ntp::data::config_file,
    owner   => $config_file_owner,
    group   => $config_file_group,
    mode    => $config_file_mode,
    content => template('ntp/ntp.conf.erb'),
    require => Package['ntp_package'],
  }

  file { 'step-tickers':
    ensure  => $ntp::data::step_tickers_ensure,
    path    => $ntp::data::step_tickers_path,
    owner   => $ntp::data::step_tickers_owner,
    group   => $ntp::data::step_tickers_group,
    mode    => $ntp::data::step_tickers_mode,
    content => template('ntp/step-tickers.erb'),
    require => Package['ntp_package'],
  }

  service { 'ntp_service':
    ensure     => $service_ensure,
    name       => $ntp::data::service_name,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
    subscribe  => [ Package['ntp_package'],
                    File['ntp_conf'],
                  ],
  }
}
