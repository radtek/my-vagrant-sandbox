set -x
#
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
#
# wget https://artifacts.elastic.co/downloads/kibana/kibana-6.2.4-x86_64.rpm -O kibana-6.2.4-x86_64.rpm
if [ ! -f kibana-6.2.4-x86_64.rpm ]
then cp -v /vagrant/downloads/kibana-6.2.4-x86_64.rpm .; fi
#
wget -nv https://artifacts.elastic.co/downloads/kibana/kibana-6.2.4-x86_64.rpm.sha512 -O kibana-6.2.4-x86_64.rpm.sha512
sha512sum -c kibana-6.2.4-x86_64.rpm.sha512
if [[ $? != 0 ]]; then exit 1; fi
#
rpm --install kibana-6.2.4-x86_64.rpm
#
if [ ! -f /etc/kibana/kibana.yml.default ]
then cp -v /etc/kibana/kibana.yml /etc/kibana/kibana.yml.default
else cp -v /etc/kibana/kibana.yml.default /etc/kibana/kibana.yml
fi
#
sed 's/#server.host: "localhost"/server.host: "0.0.0.0"/' -i /etc/kibana/kibana.yml
#
systemctl start kibana.service
systemctl enable kibana.service
systemctl status kibana.service
#
