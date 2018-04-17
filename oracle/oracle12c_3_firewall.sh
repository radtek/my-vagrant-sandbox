set -x
firewall-cmd --state
if [ ! "$(firewall-cmd --state)" == "running" ]
then
systemctl start firewalld.service
systemctl status firewalld.service
systemctl enable firewalld.service
firewall-cmd --state
fi
#
firewall-cmd --get-active-zones
firewall-cmd --zone=public --add-port=1521/tcp --permanent
firewall-cmd --zone=public --add-port=1522/tcp --permanent
firewall-cmd --zone=public --add-port=5500/tcp --permanent
firewall-cmd --zone=public --add-port=5501/tcp --permanent
firewall-cmd --zone=public --add-port=5520/tcp --permanent
firewall-cmd --zone=public --add-port=3938/tcp --permanent
firewall-cmd --reload
firewall-cmd --list-ports
firewall-cmd --state
systemctl status firewalld.service