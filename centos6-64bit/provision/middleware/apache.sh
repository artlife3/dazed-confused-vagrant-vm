# Apache
echo "---------- Apache ----------"
PATH_WWW=$1
ADMIN=$2
DOMAINNAME=$3
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "Args DOMAINNAME:$DOMAINNAME"
echo "================================================================================"

sudo chown -R vagrant:vagrant $PATH_WWW
sudo chmod -R g+w $PATH_WWW

sudo yum -y install httpd
sudo yum -y install mod_ssl

sudo chown -R vagrant:vagrant /var/log/httpd
sudo chmod -R g+wrx /var/log/httpd

sudo sed -i -e "s/User apache/User vagrant/g" /etc/httpd/conf/httpd.conf
sudo sed -i -e "s/Group apache/Group vagrant/g" /etc/httpd/conf/httpd.conf

cat << EOT > /etc/httpd/conf.d/vhost.conf
NameVirtualHost *:80

<VirtualHost *:80>

  ServerName $DOMAINNAME
  DocumentRoot "$PATH_WWW"

  <Directory "$PATH_WWW">
    Options Indexes FollowSymLinks
    AllowOverride all
    Order allow,deny
    Allow from all
  </Directory>

</VirtualHost>
EOT

cat << EOT > /etc/httpd/conf.d/server-status.conf
<Location /$ADMIN/server-status>
    SetHandler server-status
</Location>
EOT

cat << EOT > /etc/httpd/conf.d/server-info.conf
<Location /$ADMIN/server-info>
    SetHandler server-info
</Location>
EOT


sudo /etc/init.d/httpd start
sudo chkconfig  httpd on

