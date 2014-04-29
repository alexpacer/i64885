

class { 'rbenv': }

rbenv::plugin { 'sstephenson/ruby-build': }
rbenv::build { '2.1.1': global => true }
rbenv::gem { 'thor': ruby_version => '2.1.1' }
rbenv::gem { 'compass': ruby_version => '2.1.1' }


class { 'nodejs': 
  version => "v0.10.26"
}


package { 'yo':
  provider => npm
}


package {'grunt-cli':
  provider => npm
}


class { 'postgresql::server': 
  postgres_password => '@bc123',
}

postgresql::server::db { 'i64885':
  user     => 'i64885',
  password => postgresql_password('i64885', 'i64885'),
}

