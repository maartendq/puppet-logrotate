# = Class: logrotate
#
# This class installs logrotate
#
# == Parameters:
#
# $rotation_interval=[ daily | weekly | monthly | yearly]
# $retention_period=[ pick_a_number_for_log_retention ]
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

  class {'logrotate::packages': }
  class {'logrotate::config' : }

}
