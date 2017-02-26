#Elasitcsearch
useradd -c 'elasticsearch' -d /var/empty/elasticsearch -s /sbin/nologin elasticsearch
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
cat << EOT > /etc/yum.repos.d/elastic.repo
[elasticsearch-5.x]
name=Elasticsearch repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOT
sudo yum install -y elasticsearch
sudo chkconfig --add elasticsearch
sed -i -e 's/2g/512m/g' /etc/elasticsearch/jvm.options
sudo -i service elasticsearch start

