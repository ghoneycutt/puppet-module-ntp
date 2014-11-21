# ntp module
===

Puppet module to manage NTP

[![Build Status](https://api.travis-ci.org/ghoneycutt/puppet-module-ntp.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-ntp)

===

# Compatibility

This module is supported on the following systems with Puppet v3 and Ruby 1.8.7, 1.9.3, 2.0.0 and 2.1.0.

 * Debian 6
 * EL 5
 * EL 6
 * EL 7
 * Solaris 9
 * Solaris 10
 * Solaris 11
 * Suse 9
 * Suse 10
 * Suse 11
 * Suse 12
 * Ubuntu 12.04 LTS

===

# Parameters

See ntp.conf(5) for more information regarding settings.

package_name
------------
String or Array of the related ntp packages. 'USE_DEFAULTS' will choose the appropriate default for the system.

- *Default*: 'USE_DEFAULTS'


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

enable_tinker_for_vm
--------------------
If tinker panic should be disabled for VM.

- *Default*: false

keys
----
Path of the symmetric key file. See ntpd(1).

- *Default*: based on OS

servers
-------
Array of pools to check time against.

- *Default*: NTP's default pools in the US

server_options
--------------
Extra options to provide to ntp servers

- *Default*: none

peers
-----
String or Array or Hash of peer servers.

For the Hash, the following keys can be set: host and comment. See example below.

<pre>
ntp::peers:
  'ntp1':
    host: 'x.x.x.x'
    comment: 'ntp1'
</pre>

- *Default*: 'UNSET'

restrict_options
----------------
String with options to provide to access control configuration (restrict) in ntp.conf

- *Default*: 'default kod notrap nomodify nopeer noquery'

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
