# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true  
     vb.memory = "2048"
     vb.cpus = 2
     vb.customize ["modifyvm", :id, "--vram", "128"]
     vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
     vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
  end
  
  config.vm.provision "shell", path: "scripts/setup-ubuntu.sh"
  config.vm.provision "shell", path: "scripts/setup-java.sh"
  config.vm.provision "shell", path: "scripts/setup-python.sh"
  config.vm.provision "shell", path: "scripts/setup-node.sh"
  config.vm.provision "shell", path: "scripts/setup-scala.sh"
  config.vm.provision "shell", path: "scripts/setup-spark.sh"
  config.vm.provision "shell", path: "scripts/setup-riak.sh"
  config.vm.provision "shell", path: "scripts/setup-aarhus-demo.sh"

end