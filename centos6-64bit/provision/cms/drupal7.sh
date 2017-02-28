su vagrant
umask 002

DRUPAL="drupal-7.54"
PATH="/var/www/html/"
DIR="drupal7"

#Drupal
mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS drupal7;"

if [ ! -e ${PATH}${DIR} ]; then

  cd ${PATH}
  wget -q https://ftp.drupal.org/files/projects/${DRUPAL}.tar.gz
  tar xvzf ${DRUPAL}.tar.gz
  rm ${DRUPAL}.tar.gz

  mv ${DRUPAL} ${DIR}

  cd ${PATH}${DIR}
  mkdir sites/default/files
  sudo chmod g+w sites/default/files
  cp sites/default/default.settings.php sites/default/settings.php
  sudo chown -R vagrant:vagrant ${PATH}${DIR}

  cd profiles/standard/translations
  wget -q http://ftp.drupal.org/files/translations/7.x/drupal/${DRUPAL}.ja.po

else
  echo "CMS '${DIR}' already exists. Skip the process."
fi

