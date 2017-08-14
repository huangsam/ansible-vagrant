# -*- mode: ruby -*-
# vi: set ft=ruby :

cluster = {
  "master" => { :ip => "192.168.33.10", :cpus => 1, :mem => 1024 },
  "slave1" => { :ip => "192.168.33.11", :cpus => 1, :mem => 1024 },
  "slave2" => { :ip => "192.168.33.12", :cpus => 1, :mem => 1024 },
  "slave3" => { :ip => "192.168.33.13", :cpus => 1, :mem => 1024 }
}

Vagrant.configure("2") do |config|
  cluster.each do |hostname, info|
    config.vm.box = "geerlingguy/ubuntu1604"
    config.vm.define hostname do |cfg|
      cfg.vm.provider :virtualbox do |vb, override|
        override.vm.network :private_network, ip: "#{info[:ip]}"
        override.vm.hostname = hostname
        vb.name = hostname
        vb.customize ["modifyvm", :id, "--memory", info[:mem], "--cpus", info[:cpus]]
      end # end provider
      cfg.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
      cfg.vm.provision "file", source: "~/.ssh/id_rsa", destination: ".ssh/id_rsa"
      cfg.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: ".ssh/id_rsa.pub"
      cfg.vm.synced_folder "./", "/app"
    end # end config
  end # end cluster
end
