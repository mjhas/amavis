class amavis::config(
  $bypass_virus_checks_maps =undef,
  $bypass_spam_checks_maps  =undef,
  $final_virus_destiny      =undef,
  $final_banned_destiny     =undef,
  $final_spam_destiny       =undef,
  $final_bad_header_destiny =undef,
) {
  include amavis
  file { '/etc/amavis/conf.d/50-user':
    ensure  => present,
    content => template('amavis/50-user'),
    notify  => Service['amavisd'],
    require => Exec['amavis'],
  }
  file { '/etc/amavis/conf.d/15-content_filter_mode':
    ensure  => present,
    content => template('amavis/15-content_filter_mode'),
    require => Exec['amavis'],
    notify  => Service['amavisd'],
  }
}
