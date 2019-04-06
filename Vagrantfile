# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "77.77.7.77"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get upgrade
    apt-get dist-upgrade
    apt-get install nginx
    wget -qO- https://gist.githubusercontent.com/ishiikurisu/aa610ba14796d0362f0b812127bd8bd9/raw/3fb3dd498db695bfcaa030ec371c37b659791171/nginx.conf > /etc/nginx/nginx.conf
    service nginx start
  SHELL
end
