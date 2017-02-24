gem install mailcatcher
yum install sqlite-devel
mailcatcher --http-ip 192.168.33.10 --no-quit
setsebool -P httpd_can_network_connect 1

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
sudo sed -i -e "s/sendmail_path = \/usr\/sbin\/sendmail -t -i/sendmail_path = \/usr\/bin\/env \/opt\/rbenv\/shims\/catchmail/g" /etc/php.ini

sudo /etc/init.d/httpd restart



