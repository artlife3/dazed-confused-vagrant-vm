# Ruby
echo "---------- Ruby ----------"
PATH_OPT=$1
echo "Args PATH_OPT:$PATH_OPT"
echo "================================================================================"

cd $PATH_OPT
git clone git://github.com/sstephenson/rbenv.git
mkdir $PATH_OPT/rbenv/plugins
cd $PATH_OPT/rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git

sudo cat << EOT >> /etc/profile
export RBENV_ROOT="$PATH_OPT/rbenv"
export PATH="\${RBENV_ROOT}/bin:\${PATH}"
eval "\$(rbenv init -)"
EOT

source /etc/profile

sudo yum -y install gcc make openssl-devel libffi-devel
rbenv install 2.3.3
rbenv global 2.3.3
ruby -v

