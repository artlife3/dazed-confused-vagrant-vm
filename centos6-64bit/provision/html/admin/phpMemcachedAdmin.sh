# phpMemcachedAdmin
echo "---------- phpMemcachedAdmin ----------"
PATH_WWW=$1
ADMIN=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$ADMIN

cd $PATH_ADMIN

if [ ! -e $PATH_ADMIN/phpmemcacheadmin ]; then
  git clone https://github.com/elijaa/phpmemcacheadmin.git
  cd phpmemcacheadmin
  sudo chmod +rx *
  sudo chmod 0777 Config/Memcache.php
  sudo chmod 0777 Temp/
else
  echo "It already exists."
fi
