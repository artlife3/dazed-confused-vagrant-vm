# Memcache test
echo "---------- Memcache test ----------"
PATH_WWW=$1
ADMIN=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$ADMIN


cat << EOT > $PATH_ADMIN/memcache.php
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

