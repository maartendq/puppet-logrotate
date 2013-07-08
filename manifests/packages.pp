# = Class: logrotate::packages
#
# Description of logrotate::packages
#
# == Parameters:
#
# $param::   description of parameter. default value if any.
#
# == Actions:
#
# Describe what this class does. What gets configured and how.
#
# == Requires:
#
# Requirements. This could be packages that should be made available.
#
# == Sample Usage:
#
# == Todo:
#
# * Update documentation
#
class logrotate::packages (
  $package = $::logrotate::package,
) inherits logrotate {

  package { $package:
    ensure => installed;
  }

}

