echo "---------- phpinfo ----------"
PATH_WWW=$1
DIR_HTML=$2
ADMIN=$3
echo "Args PATH_WWW:$PATH_WWW"
echo "Args DIR_HTML:$DIR_HTML"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$DIR_HTML/$ADMIN

cat << EOT > $PATH_ADMIN/phpinfo.php
<?php
phpinfo();
EOT
