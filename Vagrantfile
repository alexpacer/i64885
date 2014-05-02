# -*- mode: ruby -*-
# vi: set ft=ruby :

$shell = <<SCRIPT

echo 'cd /www' >> /home/vagrant/.bashrc
echo 'IdentofyFile ~/.ssh1/id_rsa' >> /home/vagrant/.ssh/config

# Setup postgres database
echo 'export i64885_CONNECTION_STRING="postgres://vagrant:@bc123@localhost/i64885"' >> /home/vagrant/.bashrc
echo 'localhost:*:i64885:vagrant:@bc123' >> /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass
chown vagrant:vagrant /home/vagrant/.pgpass

# install gem without rdoc
echo 'gem: --no-document' >> /home/vagrant/.gemrc

# create database
#psql -d i64885 -U vagrant -a -f /sql/createdb.sql


SCRIPT


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.network :forwarded_port, host: 4567, guest: 80    # Incase we want to use nginx (later i mean..)
  config.vm.network :forwarded_port, host: 3000, guest: 3000  # API
  config.vm.network :forwarded_port, host: 5000, guest: 5000  # Site watch
  config.vm.network :forwarded_port, host: 5001, guest: 5001  # Test
  config.vm.network :forwarded_port, host: 5729, guest: 5729  # Livereload


  # use local ssh key in box
  config.vm.synced_folder "~/.ssh", "/home/vagrant/.ssh1", :mount_options => ['fmode=600']

  # bootstrap shell 
  config.vm.provision :shell, :path => "puppet/ubuntu.sh"
  config.vm.provision :shell, :inline => $shell

  # puppet 
  config.vm.synced_folder "puppet", "/puppet"
  config.vm.synced_folder "web", "/www"
  config.vm.synced_folder "sql", "/sql"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "default.pp"
  end

end
