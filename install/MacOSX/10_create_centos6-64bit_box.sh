#!/bin/sh

vagrant="vagrant"
os_name="centos6-64bit"
box_url="https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box"



vagrant init ${os_name}
vagrant box add ${os_name} ${box_url}

rm Vagrantfile
mv .vagrant/ ../../centos6-64bit/
cd ../../centos6-64bit/
mkdir share

sudo echo "192.168.33.10 vagrant-vm.dev" | sudo tee -a /etc/hosts

echo " Completion of virtual box creation."
echo ""
echo "==== Execute these commands. ==="
echo ""
echo " cd ../../centos6-64bit/"
echo " sh refresh_vagrant.sh"

