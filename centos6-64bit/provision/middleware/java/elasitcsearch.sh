#Elasitcsearch
echo "---------- Elasitcsearch ----------"
MEMORY=$1
JAVA_OPT=$2
echo "Args MEMORY:$MEMORY"
echo "Args JAVA_OPT:$JAVA_OPT"
echo "================================================================================"

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

sed -i -e "s/2g/$MEMORY/g" /etc/elasticsearch/jvm.options
sudo sed -i -e "1s/^/ES_JAVA_OPTS=\"$JAVA_OPT\"\n\n/" /etc/sysconfig/elasticsearch

tee -a /etc/security/limits.conf << EOT
elasticsearch  soft   nofile  65536
elasticsearch  hard   nofile  65536
EOT

tee -a /etc/elasticsearch/elasticsearch.yml << EOT
cluster.name: vagrant-cluster
node.name: $HOSTNAME
network.host: 0.0.0.0
EOT

sudo chown -R elasticsearch:vagrant /etc/elasticsearch/
sudo chmod -R g+w /etc/elasticsearch/
sudo /etc/init.d/elasticsearch start

