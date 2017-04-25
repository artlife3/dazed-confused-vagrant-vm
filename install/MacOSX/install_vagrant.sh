#!/bin/sh

# brew
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    # https://github.com/mxcl/homebrew/wiki/installation
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
else
    brew --version
fi

# Brew cask
brew install caskroom/cask/brew-cask

# virtualbox
which -s virtualbox
if [[ $? != 0 ]] ; then
    brew cask install virtualbox
else
    brew cask info virtualbox
fi

# vagrant
which -s vagrant
if [[ $? != 0 ]] ; then
    brew cask install vagrant
else
    brew cask info vagrant
fi

# vagrant
which -s vagrant
if [[ $? != 0 ]] ; then
    brew cask install vagrant
else
    brew cask info vagrant
fi

brew cask install vagrant-manager
vagrant plugin install vagrant-hostsupdater
vagrant --version
brew cask cleanup

echo " Installation of vagrant command completed."
echo ""
echo "==== Execute these commands. ==="
echo ""
echo " cd ../../centos6-64bit/"
echo " sh refresh_vagrant.sh"
