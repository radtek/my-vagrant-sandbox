set -x
yum install -y zip unzip
# requires oracle installation files in /vagrant folder
unzip -q /vagrant/downloads/linuxamd64_12102_database_1of2.zip -d /stage/
unzip -q /vagrant/downloads/linuxamd64_12102_database_2of2.zip -d /stage/