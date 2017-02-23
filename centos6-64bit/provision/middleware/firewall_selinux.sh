# Firewall、SELinux OFF
/etc/rc.d/init.d/iptables stop
chkconfig iptables off
chkconfig ip6tables off
cp -p /etc/selinux/config /etc/selinux/config.orig
sed -i -e "s|^SELINUX=.*|SELINUX=disabled|" /etc/selinux/config


