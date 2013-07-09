# == Define: up_logrotate::rule
#
# Defines a logrotation schedule for a log file.
#
# === Parameters
#
# Full documentation of each parameter's meaning
# can be found at http://linux.die.net/man/8/logrotate .
#
# log
#
# interval
#
# rotation
#
# size
#
# maxage
#
# minsize
#
# options
#
# archive
#
# olddir
#
# olddir_owner
#
# olddir_group
#
# olddir_mode
#
# create
#
# postrotate
#
# === Examples
#
#   logrotate::rule { 'foo':
#     log         => '/var/log/foo.log',
#     interval    => 'daily',
#      rotation   => '90',
#      options    => [
#        'missingok',
#        'notifempty',
#        'sharedscripts',
#      ]
#      postrotate => 'Your command here',
#   }
#
define logrotate::rule (
  $log          = false,
  $interval     = false,
  $rotation     = false,
  $size         = false,
  $maxage       = false,
  $minsize      = false,
  $options      = false,
  $archive      = false,
  $olddir       = 'UNSET',
  $olddir_owner = 'root',
  $olddir_group = 'root',
  $olddir_mode  = '0755',
  $create       = false,
  $postrotate   = false
) {

  include logrotate

  $olddir_real = $olddir ? {
    'UNSET'   => "${logrotate::logrotate_archive_dir}/${name}",
    default   => $olddir,
  }

  if $archive {
    file { $olddir_real:
      ensure  => 'directory',
      owner   => $olddir_owner,
      group   => $olddir_group,
      mode    => $olddir_mode,
      require => File[$logrotate::logrotate_archive_dir],
    }
  }

  file { "/etc/logrotate.d/${name}":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/logrotate_rule.erb"),
    require => File['/etc/logrotate.d'],
  }

}
