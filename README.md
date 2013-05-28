# ntp module #

Puppet module to manage ntp

# Compatibility #

This module is supported by the following OS families.

 * Debian
 * Redhat
 * Suse 9,10,11
 * Solaris

# Parameters #

See man ntp.conf for more information regarding /etc/ntp.conf settings.


package_latest
--------------
Check if the latest package is in place

- *Default*: false

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
If service has a status option

- *Default*: true

service_hasrestart
------------------
If service has a restart option

- *Default*: true

servers
-------
Array of pools to check time against.

- *Default*: NTP's default american pools

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