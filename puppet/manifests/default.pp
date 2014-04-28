

class { 'rbenv': }

rbenv::plugin { 'sstephenson/ruby-build': }
rbenv::build { '2.1.1': global => true }
rbenv::gem { 'thor': ruby_version => '2.1.1' }
rbenv::gem { 'compass': ruby_version => '2.1.1' }


class { 'nodejs': 
  version => "v0.10.26"
}


class{ 'postgresql': 
  version => "v9.3.4"
}


# class { 'rbenv':
#   #ensure => present
# }



# node 'development.puppetlabs.vm' {
#   # Configure mysql
#   class { 'mysql::server':
#     config_hash => { 'root_password' => '8ZcJZFHsvo7fINZcAvi0' }
#   }
#   include mysql::php

#   # Configure apache
#   include apache
#   include apache::mod::php
#   apache::vhost   { $::fqdn:
#     port    => '80',
#     docroot => '/var/www/test',
#     require => File['/var/www/test'],
#   }

#   # Configure Docroot and index.html
#   file { ['/var/www', '/var/www/test']:
#     ensure => directory
#   }

#   file { '/var/www/test/index.php':
#     ensure  => file,
#     content => '<?php echo \'<p>Hello World</p>\'; ?> ',
#   }

#   # Realize the Firewall Rule
#   Firewall <||>
# }



# Exec {
#   path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin', '/usr/local/bin' ]
# }


# # -- Preinstall --
# stage { 'preinstall': 
#   before => Stage['main']
# }


# class install_packages {
#   package { [ 'curl', 'build-essential', 'libfontconfig1', 'python', 'g++', 'make', 'wget', 'tar', 'mc', 'htop' ]:
#     ensure =>present
#   }
# }


# # Declare install_packages
# class{ 'install_packages':
#   stage => preinstall,
#   require => Class['apt_get_update']
# }




# class prepare {
#   class { 'apt': }
#   apt::ppa { 'ppa:chris-lea/node.js' }
# }
# include prepare

# package {'nodejs': ensure => present, require => Class['prepare'],}

# package { 'grunt-cli':
#   ensure => present,
#   provider => 'npm',
#   require => Package['nodejs'],
# }