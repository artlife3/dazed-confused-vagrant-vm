#MariaDB
sudo yum -y remove mariadb*
sudo rm -rf /var/lib/mysql/

#wget
sudo yum -y install wget

#links
sudo yum -y install links

#tree
sudo yum -y install tree

#unzip
sudo yum -y install unzip

#telnet
sudo yum -y install telnet

#colordiff
sudo yum -y install colordiff

#vim
sudo yum -y install vim-enhanced

#Java
sudo yum install -y java-1.8.0-openjdk-devel.x86_64

sudo chown vagrant:vagrant /opt

cat << EOT > /home/vagrant/.bashrc
umask 002

export PATH
export TERM=xterm-color
export CLICOLOR="true"

mycolor=$'32m' # Change the color for each environment.
export PS1='\[\e]0;\w\a\]\n\[\e[\$mycolor\]\h@\u \[\e[33m\]\W\[\e[0m\] \$ '

#history
export HISTSIZE=10000
export HISTCONTROL=ignoredups
HISTTIMEFORMAT='%Y-%m-%d %T '; export HISTTIMEFORMAT

alias ll='ls -la'
EOT

