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
  $config_file_owner   = 'root',
  $config_file_group   = 'root',
  $config_file_mode    = '0644',
  $package_latest      = 'false',
  $package_name        = 'USE_DEFAULTS',
  $package_noop        = 'USE_DEFAULTS',
  $service_name        = 'USE_DEFAULTS',
  $config_file         = 'USE_DEFAULTS',
  $driftfile           = 'USE_DEFAULTS',
  $service_running     = 'true',
  $service_hasstatus   = 'true',
  $service_hasrestart  = 'true',
  $servers             = ['0.us.pool.ntp.org',
                          '1.us.pool.ntp.org',
                          '2.us.pool.ntp.org'],
  $server_options      = 'UNSET',
  $step_tickers_ensure = 'USE_DEFAULTS',
  $step_tickers_path   = '/etc/ntp/step-tickers',
  $step_tickers_owner  = 'root',
  $step_tickers_group  = 'root',
  $step_tickers_mode   = '0644',
  $orphan_mode_stratum = 'UNSET',
  $fudge_stratum       = '10',
  $enable_stats        = 'false',
  $statsdir            = '/var/log/ntpstats/',
  $logfile             = 'UNSET',
) {

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

  case $::osfamily {
    'debian': {
      $default_package_name     = [ 'ntp' ]
      $default_package_noop     = 'false'
      $default_service_name     = 'ntp'
      $default_config_file      = '/etc/ntp.conf'
      $default_driftfile        = '/var/lib/ntp/ntp.drift'

      # Verified that Ubuntu does not use /etc/ntp/step-tickers by default.
      if $::operatingsystem == 'Ubuntu' {
        $step_tickers_enable = 'false'
      } else {
        $step_tickers_enable = 'true'
      }
    }
    'redhat': {
      $default_package_name     = [ 'ntp' ]
      $default_package_noop     = 'false'
      $default_service_name     = 'ntpd'
      $default_config_file      = '/etc/ntp.conf'
      $default_driftfile        = '/var/lib/ntp/ntp.drift'
      $step_tickers_enable = 'true'
    }
    'suse': {
      $default_package_noop     = 'false'
      $default_service_name     = 'ntp'
      $default_config_file      = '/etc/ntp.conf'
      $default_driftfile        = '/var/lib/ntp/ntp.drift'
      $step_tickers_enable = 'true'

      case $::lsbmajdistrelease {
        '9','10': {
          $default_package_name     = [ 'xntp' ]
        }
        '11': {
          $default_package_name     = [ 'ntp' ]
        }
        default: {
          fail("The ntp module is supported by release 9, 10 and 11 of the Suse OS Family. Your release is ${::lsbmajdistrelease}")
        }
      }
    }
    'solaris': {
      $default_package_name     = [ 'network/ntp' ]
      $default_package_noop     = 'true'
      $default_service_name     = 'ntp'
      $default_config_file      = '/etc/inet/ntp.conf'
      $default_driftfile        = '/var/ntp/ntp.drift'
      $step_tickers_enable = 'false'
    }
    default: {
      fail("The ntp module is supported by OS Families Debian, Redhat, Suse, and Solaris. Your operatingsystem, ${::operatingsystem}, is part of the osfamily, ${::osfamily}")
    }
  }

  if $package_name == 'USE_DEFAULTS' {
    $package_name_real = $default_package_name
  } else {
    $package_name_real = $package_name
  }

  if $package_noop == 'USE_DEFAULTS' {
    $package_noop_real = $default_package_noop
  } else {
    $package_noop_real = $package_noop
  }

  if $service_name == 'USE_DEFAULTS' {
    $service_name_real = $default_service_name
  } else {
    $service_name_real = $service_name
  }

  if $config_file == 'USE_DEFAULTS' {
    $config_file_real = $default_config_file
  } else {
    $config_file_real = $config_file
  }

  if $driftfile == 'USE_DEFAULTS' {
    $driftfile_real = $default_driftfile
  } else {
    $driftfile_real = $driftfile
  }

  case $step_tickers_enable {
    'true': {
      $default_step_tickers_ensure  = present
      $step_tickers_owner_real = $step_tickers_owner
      $step_tickers_group_real = $step_tickers_group
      $step_tickers_mode_real  = $step_tickers_mode
    }
    'false': {
      $default_step_tickers_ensure  = absent
      $step_tickers_owner_real = undef
      $step_tickers_group_real = undef
      $step_tickers_mode_real  = undef
    }
    default: {
      fail("step_tickers_enable must be 'true' or 'false'. Current value is ${step_tickers_enable}")
    }
  }

  if $step_tickers_ensure == 'USE_DEFAULTS' {
    $step_tickers_ensure_real = $default_step_tickers_ensure
  } else {
    $step_tickers_ensure_real = $step_tickers_ensure
  }

  # validate $enable_stats - must be 'true' or 'false'
  case $enable_stats {
    'true','false': {
      # noop - accepting values
    }
    default: {
      fail("enable_stats must be 'true' or 'false' and is ${enable_stats}")
    }
  }

  package { 'ntp_package':
    ensure => $package_ensure,
    name   => $package_name_real,
    noop   => $package_noop_real,
  }

  file { 'ntp_conf':
    ensure  => file,
    path    => $config_file_real,
    owner   => $config_file_owner,
    group   => $config_file_group,
    mode    => $config_file_mode,
    content => template('ntp/ntp.conf.erb'),
    require => Package['ntp_package'],
  }

  file { 'step-tickers':
    ensure  => $step_tickers_ensure_real,
    path    => $step_tickers_path,
    owner   => $step_tickers_owner_real,
    group   => $step_tickers_group_real,
    mode    => $step_tickers_mode_real,
    content => template('ntp/step-tickers.erb'),
    require => Package['ntp_package'],
  }

  service { 'ntp_service':
    ensure     => $service_ensure,
    name       => $service_name_real,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
    subscribe  => [ Package['ntp_package'],
                    File['ntp_conf'],
                  ],
  }
}
