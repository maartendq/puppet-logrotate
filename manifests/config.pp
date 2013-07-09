# = Class: logrotate::config
#
# Description of logrotate::config
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
class logrotate::config (
  $rotation_interval     = $::logrotate::rotation_interval,
  $retention_period      = $::logrotate::retention_period,
  $logrotate_archive_dir = $::logrotate::logrotate_archive_dir,
) inherits logrotate {

  File {
    owner   => 'root',
    group   => 'root',
    require => Class['logrotate::packages'],
  }

  file { '/etc/logrotate.d/':
    ensure  => 'directory',
    mode    => '0755',
  }

  file {'/etc/logrotate.conf':
    ensure  => 'present',
    mode    => '0644',
    content => template("${module_name}/logrotate.conf.erb"),
  }

  file {'/etc/cron.daily':
    ensure  => 'directory',
    mode    => '0755',
  }

  file {'/etc/cron.daily/logrotate':
    ensure  => 'present',
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/logrotate_cronjob",
  }

  file { "${logrotate_archive_dir}":
    ensure  => directory,
    mode    => '0744',
  }

}
