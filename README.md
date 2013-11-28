# ntp module
===

[![Build Status](https://api.travis-ci.org/ghoneycutt/puppet-module-ntp.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-ntp)

Puppet module to manage ntp

===

# Compatibility

This module is supported on the following systems with Puppet v3.

 * Debian 6
 * EL 5
 * EL 6
 * Solaris 9
 * Solaris 10
 * Solaris 11
 * Suse 9
 * Suse 10
 * Suse 11
 * Ubuntu 12.04 LTS

===

# Parameters

See ntp.conf(5) for more information regarding settings.


package_latest
--------------
Use the latest version of the package.

- *Default*: false

package_source
--------------
The source for packages on Solaris 5.10 and earlier.

- *Default*: /var/spool/pkg

package_adminfile
-----------------
Path to the admin file used for installation on Solaris 5.10 and earlier.

config_file_owner
-----------------
ntp.conf's owner

- *Default*: root

config_file_group
-----------------
ntp.conf's group

- *Default*: root

config_file_mode
----------------
ntp.conf's mode

- *Default*: 0644

step_tickers_ensure
-------------------
Ensure step tickers file. Valid values are 'present' and 'absent'.

- *Default*: based on OS

service_running
---------------
If service should be running

- *Default*: true

service_hasstatus
-----------------
Service has a status option

- *Default*: true

service_hasrestart
------------------
Service has a restart option

- *Default*: true

servers
-------
Array of pools to check time against.

- *Default*: NTP's default pools in the US

server_options
--------------
Extra options to provide to ntp servers

- *Default*: none

orphan_mode_stratum
-------------------
Orphan stratum configuration

- *Default*: none

fudge_stratum
-------------
Stratum value

- *Default*: 10

enable_stats
------------
If statistics should be enabled.

- *Default*: false

statdir
-------
Directory for storing ntpstats

- *Default*: '/var/log/ntpstats/'

logfile
-------
Log file name

- *Default*: none
