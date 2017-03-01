# Drupal8
echo "---------- Drupal8 ----------"
PATH_WWW=$1
echo "Args PATH_WWW:$PATH_WWW"
echo "================================================================================"

DRUPAL="drupal-8.2.6"
DIR="drupal8"

mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS drupal8;"

if [ ! -e $PATH_WWW/$DIR ]; then

  cd $PATH_WWW
  wget -q https://ftp.drupal.org/files/projects/$DRUPAL.tar.gz
  tar xvzf $DRUPAL.tar.gz
  rm $DRUPAL.tar.gz

  mv $DRUPAL $DIR

  cd $PATH_WWW/$DIR
  mkdir sites/default/files
  sudo chmod g+w sites/default/files
  cp sites/default/default.settings.php sites/default/settings.php
  sudo chown -R vagrant:vagrant $PATH_WWW/$DIR

else
  echo "CMS '$DIR' already exists. Skip the process."
fi


