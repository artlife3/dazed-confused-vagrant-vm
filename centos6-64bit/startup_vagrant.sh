#!/bin/sh

echo "==== Attention ===="
echo ""
echo " You will be prompted for a password only once."
echo ""

vagrant up | tee -a vagrant.log

echo "Add to ~/.ssh/config"
vagrant ssh-config

echo "======================="
echo "====   Completed   ===="
echo "======================="
echo ""
echo " All setup has been completed.\nNext please open the following URL in your browser.\n\n"
echo "http://dazed-vagrant.vm/admin/"

