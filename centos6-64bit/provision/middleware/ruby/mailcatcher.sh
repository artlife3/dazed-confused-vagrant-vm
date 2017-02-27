sudo setsebool -P httpd_can_network_connect on
sudo setsebool -P httpd_can_sendmail on
sudo  setenforce Permissive

gem install mailcatcher

# Reference source
# @url https://gist.github.com/oppara/c4233b289c86e2b3cb66
#
sudo cat << EOT > /etc/init.d/mailcatcher
#!/bin/sh
# chkconfig: 345 99 1
# description: mailcatcher
# processname: mailcatcher

start() {
    echo -n "starting mailcatcher:"
    /opt/rbenv/shims/mailcatcher --http-ip 0.0.0.0 --smtp-ip 0.0.0.0 -v -f > /var/log/mailcatcher/mailcatcher.log&
    return 0
}

stop() {
    killall mailcatcher
    return 0
}

case "\$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    *)
        echo $"Usage: \$0 {start|stop}"
        exit 2
esac

exit 0
EOT

sudo chmod +x /etc/init.d/mailcatcher
sudo chkconfig --add mailcatcher
sudo chkconfig mailcatcher on

# Added log setting
sudo mkdir /var/log/mailcatcher
sudo chmod 775 /var/log/mailcatcher
sudo touch /var/log/mailcatcher/mailcatcher.log
sudo chown -R vagrant:vagrant /var/log/mailcatcher

sudo /etc/init.d/mailcatcher start

# Added setting to httpd
sudo cat << EOT > /etc/httpd/conf.d/mailcatcher.conf
<VirtualHost *:80>
  ServerName mailcatcher.vagrant-vm.dev

  ProxyPass /assets http://192.168.33.10:1080/assets
  ProxyPass /messages http://192.168.33.10:1080/messages

  <Directory />
    Options FollowSymLinks
    AllowOverride None
    ProxyPass http://192.168.33.10:1080
  </Directory>

</VirtualHost>
EOT

# Added setting to php.ini
sudo sed -i -e "s/sendmail_path = \/usr\/sbin\/sendmail -t -i/sendmail_path = \/usr\/bin\/env \/opt\/rbenv\/shims\/catchmail/g" /etc/php.ini

sudo /etc/init.d/httpd restart



