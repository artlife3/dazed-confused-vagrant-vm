#!/bin/sh

echo "==== Attention ===="
echo ""
echo " You will be prompted for a password only once."
echo ""

vagrant up

echo `vagrant ssh-config` >> ~/.ssh/config
echo "Add to ~/.ssh/config"
vagrant ssh-config

echo "======================="
echo "====   Completed   ===="
echo "======================="
