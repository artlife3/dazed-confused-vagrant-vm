echo "---------- phpinfo ----------"
PATH_WWW=$1
ADMIN=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$ADMIN

cat << EOT > $PATH_ADMIN/phpinfo.php
<?php
phpinfo();
EOT
