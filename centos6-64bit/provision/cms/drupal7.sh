# Drupal7
echo "---------- Bash it ----------"
PATH_WWW=$1
DIR_HTML=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args DIR_HTML:$DIR_HTML"
echo "================================================================================"
DRUPAL='drupal-7.54'
DIR='drupal7'

mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS drupal7;"

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

  cd profiles/standard/translations
  wget -q http://ftp.drupal.org/files/translations/7.x/drupal/$DRUPAL.ja.po

else
  echo "CMS '$DIR' already exists. Skip the process."
fi

