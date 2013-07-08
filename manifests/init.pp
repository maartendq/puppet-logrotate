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
  $rotation_interval = 'daily',
  $retention_period = 90
) {

#  class {'logrotate::install': } ->
#  class {'logrotate::config' : } ->
#  class {'logrotate::cronjob' : }

}
