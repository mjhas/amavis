class amavis::config(
  $bypass_virus_checks_maps = '0',
  $bypass_spam_checks_maps  = '0',
  $final_virus_destiny      = 'D_DISCARD',
  $final_banned_destiny     = 'D_BOUNCE',
  $final_spam_destiny       = 'D_DISCARD',
  $final_bad_header_destiny = 'D_BOUNCE',
  $max_servers              = '2',
) {

  include amavis

  file { '/etc/amavisd/amavisd.conf':
    ensure  => present,
    content => template('amavis/amavisd.conf.erb'),
    notify  => Service['amavisd'],
    require => Exec['amavis'],
  }
}
