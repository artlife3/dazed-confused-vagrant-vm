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

#mv vhost.conf /etc/httpd/conf.d/
sudo /etc/init.d/httpd start
sudo chkconfig  httpd on

