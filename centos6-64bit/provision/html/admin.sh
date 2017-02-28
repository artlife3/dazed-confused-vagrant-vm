su vagrant
umask 002

# Admin
cd /var/www/html

mkdir admin
cd admin
wget -q http://getbootstrap.com/2.3.2/assets/bootstrap.zip
unzip -q bootstrap.zip
rm bootstrap.zip

cat << EOT > /var/www/html/admin/index.php
<html lang="ja">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dazed and confused vagrant VM</title>

<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css" media="screen, projection" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>　
<style>
HEADER {
/*background-color: red;*/
}
</style>
</head>
<body>
<div  class="container-fluid hero-unit">
<header class="page-header">
  <h1>Dazed and confused vagrant VM</h1>
</header>
<div class="wrapper row-fluid">

<article class="content-main">
  <header>
    <h2>Server maintenance tool</h2>
  </header>
  <ul>
    <li>Monitoring cache</li>
    <ul>
      <li><a href="./opcache-status/opcache.php" target="_blank">OPCache monitoring</a></li>
      <li><a href="./apcu/apc.php" target="_blank">APCu monitoring</a></li>
      <li><a href="./phpmemcacheadmin" target="_blank">Memcached monitoring</a></li>
      <ul>
        <li><a href="./memcache.php" target="_blank">Memcached connection test</a></li>
      </ul>
    </ul>
    <li>Monitoring apache</li>
    <ul>
      <li><a href="./server-status" target="_blank">Apache Server Status</a></li>
      <li><a href="./server-info" target="_blank">Apache Server Information</a></li>
    </ul>
    <li><a href="./mail_test.php" target="_blank">Mail send test</a></li>
    <li><a href="//tomcat.dazed-vagrant.vm/" target="_blank">Managing Tomcat</a></li>
  </ul>
</article>

<hr>

<article class="content-main">
  <header>
    <h2>Test tool for developers</h2>
  </header>
  <ul>
    <li>Mail test</li>
    <ul>
      <li><a href="//mailcatcher.dazed-vagrant.vm/" target="_blank">MailCatcher</a></li>
    </ul>
      <li><a href="./phpinfo.php" target="_blank">phpinfo();</a></li>
    <li><a href="./phpmyadmin" target="_blank">phpMyAdmin</a></li>
  </ul>
</article>

<hr>

<article class="content-secondary">
  <header>
    <h2>CMS</h2>
  </header>
  <ul>
    <li><h4><a href="../drupal8" target="_blank">Drupal8</a></h4></li>
    <li><h4><a href="../drupal7" target="_blank">Drupal7</a></h4></li>
    <li><h4><a href="../wordpress" target="_blank">Wordpress</a></h4></li>
  </ul>
</article>
</div>
<footer>
</footrer>
</div>
</html>
EOT

# phpinfo.php
cat << EOT > /var/www/html/admin/phpinfo.php
<?php
phpinfo();
EOT

# phpMyAdmin
wget -q https://files.phpmyadmin.net/phpMyAdmin/4.6.6/phpMyAdmin-4.6.6-all-languages.zip
unzip -q phpMyAdmin-4.6.6-all-languages.zip
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

# mail_test.php
cat << EOT > /var/www/html/admin/mail_test.php
<?php

mb_language("ja");
mb_internal_encoding("UTF-8");

\$to = "webmaster-to@example.com";
\$from = "webmaster-from@example.com";

\$subject = "テストのサブジェクト";
\$body = "テスト\nテストテスト\nテストテストテスト\nテストテスト\nテスト";

mb_send_mail(\$to,\$subject,\$body,"From:".\$from);


\$subject = "TEST SUBJECT";
\$body = "TEST BODY";

echo "Send mail: ";
\$result =  mail(\$to,\$subject,\$body,"From:".\$from);

if(\$result){
 echo "Success";
}else{
 echo "failed";
}

EOT
# mail-test.php
cat << EOT > /var/www/html/admin/mail-test.php
<?php

	/*
	DONT FORGET TO DELETE THIS SCRIPT WHEN FINISHED!
	*/

	ini_set( 'display_errors', 1 );
	error_reporting( E_ALL );
	
	\$from = 'webmaster@example.com';
	
	/*
	ini_set( 'SMTP', 'smtp.example.com' );
	ini_set( 'SMTP_PORT', 25 );
	ini_set( 'sendmail_from', \$from );
	*/
	
	\$server = array( 
		'HTTP_HOST', 'SERVER_NAME', 'SERVER_ADDR', 'SERVER_PORT',
 		'SERVER_ADMIN', 'SERVER_SIGNATURE', 'SERVER_SOFTWARE', 
		'REMOTE_ADDR', 'DOCUMENT_ROOT', 'REQUEST_URI', 
		'SCRIPT_NAME', 'SCRIPT_FILENAME',
	);
	
	\$to      = ( isset( \$_GET['email'] ) ? \$_GET['email'] : FALSE );
	\$subject = 'Mail Test Successful for ' . \$_SERVER['HTTP_HOST'];
	\$message = '';
	
	if ( ! \$to )
	{
		echo '<strong>Set \$_GET[\'email\'].</strong>';
		exit;
	};
	
	foreach ( \$server as \$s )
	{
		\$message .= sprintf( '%s: %s', \$s, \$_SERVER[\$s] ) . PHP_EOL;
	};
	
	\$headers = 'From: ' . \$from . PHP_EOL 
		 . 'Reply-To: ' . \$from . PHP_EOL 
		 . 'X-Mailer: PHP/' . phpversion(); 
	
	if ( isset( \$_GET['send'] ) && \$_GET['send'] === 'true' )
	{					
		\$success = mail( \$to, \$subject, \$message, \$headers );
	}
	else
	{
		echo '<strong>Set &quot;<a href="./?email=' . \$to . '&send=true">'
		 . './?email=' . \$to . '&send=true</a>&quot; to send a test e-mail.</strong>';
	};
	
	if ( isset( \$success ) )
	{	
		echo 'E-mail sent to: ' . \$to;
		echo '<br />';
		echo 'Successful mail?: <strong ' . ( \$success ? 'style="color:green;">YES' : 'style="color:red;">NO' ) . '</strong>';
	}
	else
	{
		echo '<br />';
		echo 'E-mail set as: '.\$to;
	};
	
	echo '<hr />';	
	echo '<style>	* { font-family: Helvetica, Arial, sans-serif;  } th { text-align: left; } td { padding: 3px 5px; }	</style>';
	echo '<table>';	
	
	foreach ( \$server as \$s )
	{
		echo '<tr><th>\$_SERVER[\'' . \$s . '\']</th><td>' . \$_SERVER[\$s] . '</td></tr>';
	};
	
	echo '</table>';
	
	if ( isset( \$success ) )
	{
		echo '<!--'; 
		var_dump( \$success );		
		echo '-->';
	};
?>

EOT

# Permission
sudo chown -R vagrant:vagrant /var/www/html

# Home
cd /home/vagrant
ln -s /var/www/html .
ln -s /var/www/html/admin .
ln -s /var/log .

