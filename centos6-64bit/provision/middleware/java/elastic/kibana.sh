#Elasitcsearch Kibana
echo "---------- Elasitcsearch Kibana----------"
DOMAINNAME=$1
echo "Args DOMAINNAME:$DOMAINNAME"
echo "================================================================================"

sudo yum -y install kibana
sudo chkconfig --add kibana
sudo /etc/init.d/kibana start

cat << EOT > /etc/httpd/conf.d/kibana.conf
<VirtualHost *:80>
  ServerName kibana.$DOMAINNAME

  <Directory />
    Options FollowSymLinks
    AllowOverride None
    ProxyPass  http://localhost:5601/
  </Directory>

</VirtualHost>
EOT

sudo /etc/init.d/httpd restart
