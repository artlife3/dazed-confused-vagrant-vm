#!/bin/sh
brew install caskroom/cask/brew-cask
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
vagrant --version
vagrant="vagrant"
os_name="centos6-64bit"
box_url="https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box"


mkdir -p ${vagrant}/${os_name}
cd ${vagrant}/${os_name}

vagrant init ${os_name}
vagrant box add ${os_name} ${box_url}

#sudo echo "192.168.88.88 vagrant-vm.dev" >> /etc/hosts

