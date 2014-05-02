class prepare {
  class { 'apt': }
  apt::ppa { 'ppa:chris-lea/node.js': }
}
include prepare


exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

package{ "libpq-dev": }



class { 'rbenv': }

rbenv::plugin { 'sstephenson/ruby-build': }
rbenv::build { '2.1.1': global => true }
rbenv::gem { 'thor': ruby_version => '2.1.1' }
rbenv::gem { 'compass': ruby_version => '2.1.1' }
rbenv::gem { 'pg': ruby_version => '2.1.1' }
rbenv::gem { 'rails': ruby_version => '2.1.1', version => '4.1.0' }


# class { 'nodejs': 
#   version => "v0.10.26"
# }


# package { 'yo':
#   provider => npm
# }


# package {'grunt-cli':
#   provider => npm
# }


class { 'postgresql::globals':
  manage_package_repo => true,
  version             => '9.3',
}->
class { 'postgresql::server': 
}

postgresql::server::db { 'i64885':
  user     => 'vagrant',
  password => postgresql_password('vagrant', '@bc123'),
}

