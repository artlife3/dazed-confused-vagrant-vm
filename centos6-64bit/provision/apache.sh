#Apache
sudo yum -y install httpd
sudo yum -y install mod_ssl

cat << EOT > /etc/httpd/conf.d/vhost.conf
DocumentRoot "/var/www/html"
<Directory "/var/www/html">
  Options Indexes FollowSymLinks
  AllowOverride all
  Order allow,deny
  Allow from all
</Directory>
EOT

cat << EOT > /etc/httpd/conf.d/server-status.conf
<Location /admin/server-status>
    SetHandler server-status
</Location>
EOT

cat << EOT > /etc/httpd/conf.d/server-info.conf
<Location /admin/server-info>
    SetHandler server-info
</Location>
EOT



sudo /etc/init.d/httpd start
sudo chkconfig  httpd on


