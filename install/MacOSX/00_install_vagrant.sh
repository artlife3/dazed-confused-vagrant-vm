#!/bin/sh
brew install caskroom/cask/brew-cask
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
vagrant --version
vagrant plugin install vagrant-hostsupdater

