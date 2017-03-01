# Admin
echo "---------- Admin ----------"
PATH_WWW=$1
ADMIN=$2
DOMAINNAME=$3
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "Args DOMAINNAME:$DOMAINNAME"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$ADMIN

cd $PATH_WWW
if [ ! -e $PATH_ADMIN ]; then
mkdir $ADMIN
fi
cd $ADMIN

if [ ! -e $PATH_ADMIN/bootstrap ]; then
  wget -q http://getbootstrap.com/2.3.2/assets/bootstrap.zip
  unzip -q bootstrap.zip
  rm bootstrap.zip
fi

cat << EOT > $PATH_ADMIN/index.php
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
    <li><a href="//tomcat.$DOMAINNAME/" target="_blank">Managing Tomcat</a></li>
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
      <li><a href="//mailcatcher.$DOMAINNAME/" target="_blank">MailCatcher</a></li>
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
