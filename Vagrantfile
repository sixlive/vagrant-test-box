# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define "web01" do |v|
    v.vm.hostname = "web01"
    v.vm.network "private_network", ip: "192.168.33.10"
  end

   # config.vm.define "web02" do |v|
   #   v.vm.hostname = "web02"
   #   v.vm.network "private_network", ip: "192.168.33.11"
   # end

   # config.vm.define "web03" do |v|
   #   v.vm.hostname = "web03"
   #   v.vm.network "private_network", ip: "192.168.33.12"
   # end

   username = `whoami`.chomp

   config.vm.provision "file", source: "~/.ssh/id_rsa.pub/", destination: "/tmp/provision/id_rsa.pub"
   config.vm.provision "file", source: "ssh_keys.tar.gz", destination: "/tmp/provision/ssh_keys.tar.gz"
   config.vm.provision "shell", path: "vagrant.sh", args: [username]
end
