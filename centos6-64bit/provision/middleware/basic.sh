# Basic
echo "---------- Basic ----------"
PATH_WWW=$1
PATH_OPT=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args PATH_OPT:$PATH_OPT"
echo "================================================================================"

#wget
sudo yum -y install wget

#unzip
sudo yum -y install unzip


sudo chown vagrant:vagrant $PATH_OPT
sudo chown -R vagrant:vagrant $PATH_WWW
sudo chmod -R g+w $PATH_WWW



