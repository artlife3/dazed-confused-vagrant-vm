# Timezone
cat << EOT > /etc/sysconfig/clock
ZONE="Asia/Tokyo"
UTC="false"
EOT
source /etc/sysconfig/clock
/bin/cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
