# -*- mode: ruby -*-
# vi: set ft=ruby :

$shell = <<SCRIPT

echo 'cd /www' >> /home/vagrant/.bashrc
echo 'IdentofyFile ~/.ssh1/id_rsa' >> /home/vagrant/.ssh/config

# Make sure iptables are off, just lazy to configure ports..
sudo service iptables off

SCRIPT


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-6.5-64-puppet"

  config.vm.network "private_network", type: "dhcp"

  config.vm.network :forwarded_port, host: 4567, guest: 80    # Incase we want to use nginx (later i mean..)
  config.vm.network :forwarded_port, host: 3000, guest: 3000  # API
  config.vm.network :forwarded_port, host: 4567, guest: 5000  # Site watch
  config.vm.network :forwarded_port, host: 5001, guest: 5001  # Test
  config.vm.network :forwarded_port, host: 5729, guest: 5729  # Livereload


  # use local ssh key in box
  config.vm.synced_folder "~/.ssh", "/home/vagrant/.ssh1", :mount_options => ['fmode=600']

  # bootstrap shell 
  config.vm.provision :shell, :inline => $shell

  # puppet 
  config.vm.synced_folder "puppet", "/puppet"
  config.vm.synced_folder "web", "/www"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = "puppet/modules"
    puppet.manifest_file  = "default.pp"
  end

end
