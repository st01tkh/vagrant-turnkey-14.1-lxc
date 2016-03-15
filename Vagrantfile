# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "st01tkh/turnkey-14.1-lxc"
  config.vm.network "public_network", :bridge => "Realtek RTL8139/810x Family Fast Ethernet NIC #2"
  config.vbguest.auto_update = true
  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "1024"
     vb.customize [
	     "modifyvm", :id,
	     "--paravirtprovider", "kvm",
	     #"--cpus", "1"
     ]
  end
  config.vm.provision "shell", path: "import_modules.jessie.sh"
  config.vm.box_check_update = false
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y apache2
  SHELL
  config.vm.provision "puppet" do |puppet|
  #  #logging = ENV['LOGGING']
  #  #puppet.options << "--#{logging}" if ["verbose","debug"].include?(logging)
    puppet.module_path = ["modules", "modules-contrib", "modules-local"]
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "site.pp"
  end
end
