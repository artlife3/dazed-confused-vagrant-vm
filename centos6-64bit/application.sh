su vagrant
umask 002


# Admin
cd /var/www/html
mkdir admin
cd admin
wget http://getbootstrap.com/2.3.2/assets/bootstrap.zip
unzip bootstrap.zip

cat << EOT > /var/www/html/admin/index.php
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Vagrant-vm.dev ADMIM</title>
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css" media="screen, projection" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>　
</head>
<body>
<header>
  <h1>Vagrant-vm.dev ADMIM</h1>
</header>
<article>
  <header>
    <h2>Maintenance tool</h2>
  </header>
  <ul>
    <li><a href="./opcache-status/opcache.php" target="_blank">OPCache monitoring</a></li>
    <li><a href="./apcu/apc.php" target="_blank">APCu monitoring</a></li>
    <li><a href="./phpmemcacheadmin" target="_blank">Memcached monitoring</a></li>
    <li><a href="./memcache.php" target="_blank">Memcached connection test</a></li>
    <li><a href="./phpinfo.php" target="_blank">phpinfo()</a></li>
    <li><a href="./phpmyadmin" target="_blank">phpMyAdmin</a></li>
    <li><a href="./server-status" target="_blank">Apache Server Status</a></li>
    <li><a href="./server-info" target="_blank">Apache Server Information</a></li>
    <li><a href="/tomcat" target="_blank">Tomcat</a></li>
  </ul>
</article>
<hr>
<article>
  <header>
    <h2>CMS</h2>
  </header>
  <ul>
    <li><h4><a href="../drupal" target="_blank">Drupal</a></h4></li>
    <li><h4><a href="../wordpress" target="_blank">Wordpress</a></h4></li>
  </ul>
</article>

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
git clone https://github.com/elijaa/phpmemcacheadmin.git
cd phpmemcacheadmin
sudo chmod +rx *
sudo chmod 0777 Config/Memcache.php
sudo chmod 0777 Temp/


cat << EOT > /var/www/html/admin/memcache.php
<?php
\$memcache = new Memcache;
\$memcache->connect('127.0.0.1', 11211) or die ("Memcache could not connect.");

\$version = \$memcache->getVersion();
echo "Server's version: ".\$version."<br/>\n";

\$tmp_object = new stdClass;
\$tmp_object->str_attr = 'test';
\$tmp_object->int_attr = 123;

\$memcache->set('key', \$tmp_object, false, 10) or die ("Failed to save data at the server");
echo "Store data in the cache (data will expire in 10 seconds)<br/>\n";

\$get_result = \$memcache->get('key');
echo "Data from the cache:<br/>\n";

var_dump(\$get_result);
?>
EOT




#apcu
cd /var/www/html/admin
git clone https://github.com/krakjoe/apcu.git

#opcache
cd /var/www/html/admin
git clone https://github.com/rlerdorf/opcache-status.git

# Permission
sudo chown -R apache:vagrant /var/www/html/admin

# Home
ln -s /var/www/html /home/vagrant/html
ln -s /var/www/html/admin /home/vagrant/admin
ln -s /var/log /home/vagrant/log
