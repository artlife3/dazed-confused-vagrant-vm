# phpMyAdmin
echo "---------- phpMyAdmin ----------"
PATH_WWW=$1
ADMIN=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$ADMIN

cd $PATH_ADMIN

if [ ! -e $PATH_ADMIN/phpmyadmin ]; then
  wget -q https://files.phpmyadmin.net/phpMyAdmin/4.6.6/phpMyAdmin-4.6.6-all-languages.zip
  unzip -q phpMyAdmin-4.6.6-all-languages.zip
  rm phpMyAdmin-4.6.6-all-languages.zip
  ln -s phpMyAdmin-4.6.6-all-languages phpmyadmin
  #- cd phpmyadmin
  #- composer update
else
  echo "It already exists."
fi