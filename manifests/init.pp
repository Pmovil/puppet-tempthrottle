# == Class: tempthrottle
#
# Full description of class tempthrottle here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the function of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'tempthrottle':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class tempthrottle {
  # main script
  file { '/usr/sbin/temp-throttle':
            owner => root,
            group => root,
            mode  => '0755',
            ensure => present,
            source => "puppet:///extra_files/tempthrottle/temp-throttle/usr/sbin/temp-throttle",
  }
  # config file
	file { '/etc/temp-throttle.conf':
	          owner => root,
            group => root,
            mode  => '0644',
            ensure => present,
	          source => "puppet:///extra_files/tempthrottle/temp-throttle/etc/temp-throttle.conf",
  }
  
  if($::operatingsystem == 'CentOS'){
    # systemd service
	  file { '/usr/lib/systemd/system/temp-throttle.service':
	            owner => root,
	            group => root,
	            mode  => '0644',
	            ensure => present,
	            source => "puppet:///extra_files/tempthrottle/temp-throttle/usr/lib/systemd/system/temp-throttle.service",
	  }
	  
	  service { 'temp-throttle':
	    ensure     => running,
	    enable     => true,
	    hasstatus  => true,
	    hasrestart => true,
	    require    => [
  	    File['/usr/sbin/temp-throttle'],
        File['/etc/temp-throttle.conf'],
        File['/usr/lib/systemd/system/temp-throttle.service'],
	    ],
	  }
  } # TODO - fedora 14 SysV script ?
}
