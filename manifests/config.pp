class amavis::config(
  $blacklist                = undef,   # enable blacklisting
  $blacklist_entries,
  $disable_scanning         = undef,   # bypass all scanning
  $final_virus_destiny      = 'D_DISCARD',
  $final_banned_destiny     = 'D_BOUNCE',
  $final_spam_destiny       = 'D_DISCARD',
  $final_bad_header_destiny = 'D_BOUNCE',
  $max_servers              = '2',
  $whitelist                = undef,   # enable whitelisting
  $whitelist_entries,
) {

  include amavis

  $real_blacklist = join($blacklist_entries,"','")
  $real_whitelist = join($whitelist_entries,"','")

  file { '/etc/amavisd/amavisd.conf':
    ensure  => present,
    content => template('amavis/amavisd.conf.erb'),
    notify  => Service['amavisd'],
    require => Exec['amavis'],
  }

}
