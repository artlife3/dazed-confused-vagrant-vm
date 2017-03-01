# Bash it
# https://github.com/Bash-it/bash-it
#
echo "---------- Bash it ----------"
echo "Args PATH_OPT:$1"
echo "Args PATH_HOME:$2"
echo "================================================================================"

cd $1
git clone https://github.com/Bash-it/bash-it

/bin/sh $1/bash-it/install.sh --silent

source $2/.bashrc

