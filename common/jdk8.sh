# installs JDK8 update 171
#
# requires jdk-8u171-linux-x64.rpm to be placed in /vagrant/downloads/
#
# downloads/ folder must be synced using
#
# config.vm.synced_folder "../downloads/", "/vagrant/downloads/", create: true
#
# if the file is not available yet, it can be downloaded manually from the Oracle website or using following command
#
# yum install -y wget # if no wget on the machine
# wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
# http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm -O jdk-8u171-linux-x64.rpm
#
if [ ! -z $JAVA_HOME ]; then exit 0; fi

if [ ! -f jdk-8u171-linux-x64.rpm ]
then cp -v /vagrant/downloads/jdk-8u171-linux-x64.rpm .; fi
if [ ! -f jdk-8u171-linux-x64.rpm ]; then exit 1; fi

yum localinstall -y jdk-8u171-linux-x64.rpm

echo '
export JAVA_HOME="/usr/java/jdk1.8.0_171/jre"
export PATH=$JAVA_HOME/bin:$PATH
' | tee -a /etc/profile

source /etc/profile

java -version
