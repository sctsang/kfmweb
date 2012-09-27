class apache {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

  package { "apache2":
    ensure => present,
  }

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }

  file { '/etc/apache2/sites-available/default':
     ensure => "present",
     source => "/vagrant/files/httpd-default.conf",
     notify => Service["apache2"],
  }

}

include apache
