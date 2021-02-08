# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-buster64"

  # Configure port forwarding. See docs for more information:
  # https://www.vagrantup.com/docs/networking/forwarded_ports.
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook-local.yaml"
  end
end
