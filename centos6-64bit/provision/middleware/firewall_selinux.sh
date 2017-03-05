# Firewall, SELinux
echo "---------- Firewall, SELinux ----------"

/etc/rc.d/init.d/iptables stop
chkconfig iptables off
chkconfig ip6tables off
cp -p /etc/selinux/config /etc/selinux/config.orig
sed -i -e "s|^SELINUX=.*|SELINUX=disabled|" /etc/selinux/config

sudo setenforce 0

sudo yum install -y libselinux-python

