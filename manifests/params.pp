# = Class: logrotate::params
#
# Description of logrotate::params
#
# == Parameters:
#
# $param::   Description of parameter
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
#
class logrotate::params {

  case $::operatingsystem {
    /(?i:redhat|centos)/: {
      $package                = 'logrotate',
      $log_dir                = '/var/log'
      $logrotate_archive_dir  = "${log_dir}/archives"
    }

    default: {
      fail("Unsupported OS: ${::operatingsystem}, module ${module_name} only supports operatingsystem RedHat/CentOS")
    }
  }
}
