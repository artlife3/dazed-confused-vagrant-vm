# Opcache Status
echo "---------- Opcache Status ----------"
PATH_WWW=$1
ADMIN=$2
echo "Args PATH_WWW:$PATH_WWW"
echo "Args ADMIN:$ADMIN"
echo "================================================================================"
PATH_ADMIN=$PATH_WWW/$ADMIN

cd $PATH_ADMIN

if [ ! -e $PATH_ADMIN/opcache-status ]; then
  git clone https://github.com/rlerdorf/opcache-status.git
else
echo "It already exists."
fi