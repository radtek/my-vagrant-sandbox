set -x
#
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
#
# wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.rpm -O elasticsearch-6.2.4.rpm
if [ ! -f elasticsearch-6.2.4.rpm ]
then cp -v /vagrant/downloads/elasticsearch-6.2.4.rpm .; fi
#
wget -nv https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.4.rpm.sha512 -O elasticsearch-6.2.4.rpm.sha512
sha512sum -c elasticsearch-6.2.4.rpm.sha512
if [[ $? != 0 ]]; then exit 1; fi
#
rpm --install elasticsearch-6.2.4.rpm
#
systemctl start elasticsearch.service
systemctl enable elasticsearch.service
systemctl status elasticsearch.service
#
/usr/share/elasticsearch/bin/elasticsearch --version
#