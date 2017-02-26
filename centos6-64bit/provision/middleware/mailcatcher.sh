sudo setsebool -P httpd_can_network_connect on
sudo setsebool -P httpd_can_sendmail on
sudo  setenforce Permissive

gem install mailcatcher
#sudo yum -y install sqlite-devel

#wget -q  http://blog.starcklin.com/files/dpkg_1.17.6.tar.xz

#
# https://gist.github.com/EHLOVader/9233230
#
sudo cat << EOT > /etc/init.d/mailcatcher
#!/bin/bash
#chkconfig: 2345 85 15
#descpriction: apache(httpd) Web Server

PID_FILE=/var/run/mailcatcher.pid
NAME=mailcatcher
PROG="/usr/bin/env mailcatcher"
USER=mailcatcher
GROUP=mailcatcher

start() {
        echo -n "Starting MailCatcher"
        if start-stop-daemon --stop --quiet --pidfile \$PID_FILE --signal 0
        then
                echo " already running."
                exit
        fi
        start-stop-daemon \
                --start \
                --pidfile \$PID_FILE \
                --make-pidfile \
                --background \
                --exec \$PROG \
                --user \$USER \
                --group \$GROUP \
                --chuid \$USER \
                -- \
                --foreground \
                --http-ip=0.0.0.0 \
                --http-port=1080 \
                --smtp-port=1025
        echo "."
        return \$?
}

stop() {
        echo -n "Stopping MailCatcher"
        start-stop-daemon \
                --stop \
                --oknodo \
                --pidfile \$PID_FILE
        echo "."
        return \$?
}

restart() {
        stop
        start
}

case "\$1" in
        start)
                start
                ;;
        stop)
                stop
                ;;
        restart)
                restart
                ;;
        *)
                echo "Usage: \$0 {start|stop|restart}"
                exit 1
                ;;
esac
EOT
#sudo chmod +x mailcatcher
#sudo chkconfig --add mailcatcher
#sudo chkconfig mailcatcher on


sudo mkdir /var/log/mailcatcher
sudo chmod 775 /var/log/mailcatcher
sudo touch /var/log/mailcatcher/mailcatcher.log
sudo chown -R vagrant:vagrant /var/log/mailcatcher

#mailcatcher --http-ip 192.168.33.10  --smtp-ip 192.168.33.10 --no-quit
#mailcatcher --http-ip 192.168.33.10 --smtp-ip 127.0.0.1 --smtp-port 1025
#mailcatcher --http-ip 192.168.33.10 --smtp-ip 127.0.0.1  --smtp-port 1025 -v -f > /var/log/mailcatcher.log
/opt/rbenv/shims/mailcatcher --http-ip 0.0.0.0 --smtp-ip 0.0.0.0 -v -f > /var/log/mailcatcher/mailcatcher.log&

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
sudo sed -i -e "s/sendmail_path = \/usr\/sbin\/sendmail -t -i/sendmail_path = \/usr\/bin\/env \/opt\/rbenv\/shims\/catchmail/g" /etc/php.ini

sudo /etc/init.d/httpd restart



