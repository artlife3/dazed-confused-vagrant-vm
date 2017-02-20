su vagrant
umask 002


# Admin
cd /var/www/html
mkdir admin
cd admin

cat << EOT > /var/www/html/admin/index.php
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Vagrant-vm.dev ADMIM</title>
</head>
<body>
<header>
  <h1>Vagrant-vm.dev ADMIM</h1>
</header>
<ul>
  <li><a href="./opcache-status/opcache.php" target="_blank">OPCache monitoring</a></li>
  <li><a href="./apcu/apc.php" target="_blank">APCu monitoring</a></li>
  <li><a href="./phpMemcachedAdmin" target="_blank">Memcached monitoring</a></li>
  <li><a href="./phpinfo.php" target="_blank">phpinfo()</a></li>
  <li><a href="./phpmyadmin" target="_blank">phpMyAdmin</a></li>
  <li><a href="/server-status" target="_blank">Apache Server Status</a></li>
  <li><a href="/server-info" target="_blank">Apache Server Information</a></li>
</ul>
<hr>
<header>
  <h1>CMS</h1>
</header>
<ul>
  <li><a href="../drupal" target="_blank">Drupal</a></li>
  <li><a href="../wordpress" target="_blank">Wordpress</a></li>
</ul>
<hr>
<footer>
</footrer>
</body>
</html>
EOT

# phpinfo.php
cat << EOT > //var/www/html/admin/phpinfo.php
<?php
phpinfo();
EOT

# phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.6.6/phpMyAdmin-4.6.6-all-languages.zip
unzip phpMyAdmin-4.6.6-all-languages.zip
rm phpMyAdmin-4.6.6-all-languages.zip
ln -s phpMyAdmin-4.6.6-all-languages phpmyadmin
#- cd phpmyadmin
#- composer update

# phpMemcachedAdmin
cd /var/www/html/admin
wget https://blog.elijaa.org/wp-content/uploads/2016/09/phpMemcachedAdmin.tar.gz
tar xvzf phpMemcachedAdmin.tar.gz
rm phpMemcachedAdmin.tar.gz
cd phpMemcachedAdmin
sudo chmod +rx *
sudo chmod 0777 Config/Memcache.php
sudo chmod 0777 Temp/


#apcu
cd /var/www/html/admin
git clone https://github.com/krakjoe/apcu.git

#opcache
cd /var/www/html/admin
git clone https://github.com/rlerdorf/opcache-status.git

# Permission
sudo chown -R apache:apache /var/www/html/admin

# Home
ln -s /var/www/html ~/html
ln -s /var/www/html/admin ~/admin
