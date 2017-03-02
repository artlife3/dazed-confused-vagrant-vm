#!/bin/sh

os_name="centos6-64bit"
box_url="https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box"

vagrant plugin install vagrant-hostsupdater

if [  -e ../../centos6-64bit/.vagrant ]; then
    vagrant init ${os_name}
    vagrant box add ${os_name} ${box_url}

    rm Vagrantfile
    mv .vagrant/ ../../centos6-64bit/
    echo ""
    echo " Completion of virtual box creation."
else
    echo ""
    echo " Already exists.No change."
    echo " Or delete the \". Vagrant\" folder."
fi

echo ""
echo "==== Execute these commands. ==="
echo ""
echo " cd ../../centos6-64bit/"
echo " sh refresh_vagrant.sh"

