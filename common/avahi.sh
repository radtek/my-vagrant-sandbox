yum install -y epel-release # needed for nss-mdns
yum install -y avahi nss-mdns
systemctl start avahi-daemon
systemctl enable avahi-daemon

# this is done by "yum install nss-mdns"
grep hosts /etc/nsswitch.conf
sed 's/hosts:      files dns myhostname/hosts: files mdns_minimal [NOTFOUND=return] dns mdns/' -i /etc/nsswitch.conf
grep hosts /etc/nsswitch.conf

systemctl is-active firewalld
if [ "$(systemctl is-active firewalld)" == "active" ]
then
  firewall-cmd --zone=public --permanent --add-service=mdns
  systemctl reload firewalld.service
fi;
systemctl is-active firewalld
# "systemctl is-active firewalld" returns non-zero exit code
# but vagrant requires 0 exit code from provisioning
# hence we use echo here to make sure 0 gets returned back
echo $?

systemctl start avahi-daemon
systemctl enable avahi-daemon
# should be started and enabled
systemctl status avahi-daemon
