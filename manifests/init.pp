class amavis(
  $spamassassin=true
) {
  package{ 'amavisd-new':
    ensure => latest,
    alias  => 'amavis',
    before => Exec['amavis'],
  }
  if $spamassassin {
    package{ 'spamassassin':
      ensure  => latest,
      require => Package['amavis'],
      before  => Exec['amavis'],
    }
  }
  exec { 'amavis':
    command     => 'echo "amavis packages are installed"',
    path        => '/usr/sbin:/bin:/usr/bin:/sbin',
    logoutput   => true,
    refreshonly => true,
  }
  service { 'amavisd':
    ensure  => running,
    require => Exec['amavis'],
  }
}
