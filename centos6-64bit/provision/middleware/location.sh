# Timezone
cat << EOT > /etc/sysconfig/clock
ZONE="Asia/Tokyo"
UTC="false"
EOT
source /etc/sysconfig/clock
/bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

export LANG=en_US.UTF-8
sudo sed -i -e "s/LANG=\"de_DE.UTF-8\"/LANG=\"en_US.UTF-8\"/g" /etc/sysconfig/i18n


