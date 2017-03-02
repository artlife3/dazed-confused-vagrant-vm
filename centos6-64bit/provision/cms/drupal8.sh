# Drupal8
echo "---------- Drupal8 ----------"
PATH_WWW=$1
DIR_HTML=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args DIR_HTML:$DIR_HTML"
echo "================================================================================"

DRUPAL="drupal-8.2.6"
DIR="drupal8"

mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS drupal8;"

if [ ! -e $PATH_WWW/$DIR_HTML/$DIR ]; then

  cd $PATH_WWW/$DIR_HTML
  wget -q https://ftp.drupal.org/files/projects/$DRUPAL.tar.gz
  tar xvzf $DRUPAL.tar.gz
  rm $DRUPAL.tar.gz

  mv $DRUPAL $DIR

  cd $PATH_WWW/$DIR_HTML/$DIR
  mkdir sites/default/files
  sudo chmod g+w sites/default/files
  cp sites/default/default.settings.php sites/default/settings.php
  sudo chown -R vagrant:vagrant $PATH_WWW/$DIR_HTML/$DIR

else
  echo "CMS '$DIR' already exists. Skip the process."
fi


