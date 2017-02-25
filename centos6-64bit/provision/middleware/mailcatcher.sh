gem install mailcatcher
sudo yum -y install sqlite-devel
#mailcatcher --http-ip 192.168.33.10  --smtp-ip 192.168.33.10 --no-quit
mailcatcher --http-ip 192.168.33.10 --smtp-ip 192.168.33.10
#mailcatcher --http-ip 192.168.33.10 --smtp-ip 192.168.33.10 -v -f > /var/log/mailcatcher.log
sudo setsebool -P httpd_can_network_connect on
sudo setsebool -P httpd_can_sendmail on
sudo  setenforce Permissive

sudo cat << EOT > /etc/httpd/conf.d/mailcatcher.conf
<VirtualHost *:80>
  ServerName mailcatcher.vagrant-vm.dev

  #ProxyRequests Off
  ProxyPass /assets http://192.168.33.10:1080/assets
  ProxyPass /messages ws://192.168.33.10:1080/messages

  <Directory />
    Options FollowSymLinks
    AllowOverride None
    ProxyPass http://192.168.33.10:1080
    ProxyPassReverse http://192.168.33.10:1080
  </Directory>

</VirtualHost>
EOT
sudo sed -i -e "s/sendmail_path = \/usr\/sbin\/sendmail -t -i/sendmail_path = \/usr\/bin\/env \/opt\/rbenv\/shims\/catchmail --smtp-ip 192.168.33.10 --smtp-port 1025/g" /etc/php.ini

sudo /etc/init.d/httpd restart



