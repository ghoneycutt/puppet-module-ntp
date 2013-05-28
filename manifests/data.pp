# == Class: ntp::data
#
# Data for ntp module
#
class ntp::data {

  case $::osfamily {
    'debian': {
      $my_package_name     = [ 'ntp' ]
      $my_package_noop     = 'false'
      $my_service_name     = 'ntp'
      $my_config_file      = '/etc/ntp.conf'
      $my_driftfile        = '/var/lib/ntp/ntp.drift'
      $step_tickers_enable = 'true'
    }
    'redhat': {
      $my_package_name     = [ 'ntp' ]
      $my_package_noop     = 'false'
      $my_service_name     = 'ntpd'
      $my_config_file      = '/etc/ntp.conf'
      $my_driftfile        = '/var/lib/ntp/ntp.drift'
      $step_tickers_enable = 'true'
    }
    'suse': {
      $my_package_noop     = 'false'
      $my_service_name     = 'ntp'
      $my_config_file      = '/etc/ntp.conf'
      $my_driftfile        = '/var/lib/ntp/ntp.drift'
      $step_tickers_enable = 'true'

      case $::lsbmajdistrelease {
        '9','10': {
          $my_package_name     = [ 'xntp' ]
        }
        '11': {
          $my_package_name     = [ 'ntp' ]
        }
        default: {
          fail("The ${module_name} module is supported by release 9, 10 and 11 of the Suse OS Family. Your release is ${::lsbmajdistrelease}")
        }
      }
    }
    'solaris': {
      $my_package_name     = [ 'network/ntp' ]
      $my_package_noop     = 'true'
      $my_service_name     = 'ntp'
      $my_config_file      = '/etc/inet/ntp.conf'
      $my_driftfile        = '/var/ntp/ntp.drift'
      $step_tickers_enable = 'false'
    }
    default: {
      fail("The ${module_name} module is supported by OS Families Debian, Redhat, Suse, and Solaris. Your operatingsystem, ${::operatingsystem}, is part of the osfamily, ${::osfamily}")
    }
  }

  $package_name = hiera('ntp::package_name',$my_package_name)
  $package_noop = hiera('ntp::package_noop',$my_package_noop)
  $service_name = hiera('ntp::service_name',$my_service_name)
  $config_file  = hiera('ntp::config_file',$my_config_file)
  $driftfile    = hiera('ntp::driftfile',$my_driftfile)

  case $step_tickers_enable {
    'true': {
      $my_step_tickers_ensure = present
      $step_tickers_owner     = hiera('ntp::step_tickers_owner','root')
      $step_tickers_group     = hiera('ntp::step_tickers_group','root')
      $step_tickers_mode      = hiera('ntp::step_tickers_mode','0644')
    }
    'false': {
      $my_step_tickers_ensure = absent
      $step_tickers_owner     = undef
      $step_tickers_group     = undef
      $step_tickers_mode      = undef
    }
    default: {
      fail("ntp::step_tickers_enable must be 'true' or 'false'. Current value is ${step_tickers_enable}")
    }
  }

  $step_tickers_ensure = hiera('ntp::step_tickers_ensure',$my_step_tickers_ensure)
  $step_tickers_path   = hiera('ntp::step_tickers_path','/etc/ntp/step-tickers')
}
