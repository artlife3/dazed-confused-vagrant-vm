cd /opt
git clone git://github.com/sstephenson/rbenv.git
mkdir /opt/rbenv/plugins
cd /opt/rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git

sudo cat << EOT >> /etc/profile
export RBENV_ROOT="/opt/rbenv"
export PATH="\${RBENV_ROOT}/bin:\${PATH}"
eval "\$(rbenv init -)"
EOT

source /etc/profile

sudo yum -y install gcc make openssl-devel libffi-devel
rbenv install 2.3.3
rbenv global 2.3.3
ruby -v

