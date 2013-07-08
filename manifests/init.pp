# = Class: logrotate
#
# This class installs logrotate
#
# == Parameters:
#
# $rotation_interval=[ daily | weekly | monthly | yearly]
# $retention_period=[ int ($rotation_interval is unit) ]
#
# == Actions:
#  - Install logrotate
#
# == Requires:
#
# == Sample Usage:
#
class logrotate (
  $package               = $::logrotate::params::package,
  $log_dir               = $::logrotate::params::log_dir,
  $logrotate_archive_dir = $::logrotate::params::logrotate_archive_dir,
  $rotation_interval     = 'daily',
  $retention_period      = '90',
) inherits logrotate::params {

  class {'logrotate::packages': } #->
#  class {'logrotate::config' : } #->
#  class {'logrotate::cronjob' : }

}
