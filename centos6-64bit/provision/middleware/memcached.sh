# Memcached
sudo yum -y  install memcached memcached-devel
sudo chkconfig memcached on

sudo mkdir /var/log/memcached
sudo touch /var/log/memcached/memcached.log
sudo chown -R memcached:memcached /var/log/memcached/
sudo sed -i -e 's/OPTIONS=""/OPTIONS="-d -vv 1>> \/var\/log\/memcached.log 2>> \/var\/log\/memcached.log"/g' /etc/sysconfig/memcached

setsebool -P httpd_can_network_memcache 1
sudo /etc/init.d/memcached start

# setsebool -P httpd_can_network_memcache true
# memcached-tool localhost:11211 dump
# netstat -ant | grep 11211
# telnet localhost 11211 | stats | quit

cat << EOT > /etc/logrotate.d/memcached
/var/log/memcached/*.log {
 notifempty
 daily
 rotate 10
 missingok
 dateext
 dateformat -%Y%m%d
 create 0777 memcached memcached
 sharedscripts
 postrotate
  /bin/kill -HUP `cat /var/run/memcached.pid 2> /dev/null` 2> /dev/null || true
 endscript
}
EOT

