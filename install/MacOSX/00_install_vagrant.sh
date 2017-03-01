#!/bin/sh
brew install caskroom/cask/brew-cask
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
vagrant --version

echo " Installation of vagrant command completed."
echo ""
echo "==== Then execute these. ==="
echo ""
echo " sh 10_create_centos6-64bit_box.sh"

