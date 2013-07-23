# ntp module #

Puppet module to manage ntp

# Compatibility #

This module is supported by the following OS families.

 * Debian
 * Redhat
 * Suse 9, 10, 11
 * Solaris 9, 10, 11

# Parameters #

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
