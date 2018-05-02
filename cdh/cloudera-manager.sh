set -x
#
# disable selinux
SELINUX=$(grep '^SELINUX=' /etc/selinux/config | cut -d= -f2 )
echo SELINUX=$SELINUX
if [[ ! "$SELINUX" == "disabled" ]]
then 
  sed 's/SELINUX=\(enforcing\|permissive\)/SELINUX=disabled/' -i /etc/selinux/config
  echo "Please reboot your system"
  exit 1
fi
#
yum install -y cloudera-manager-daemons cloudera-manager-server
#
systemctl start cloudera-scm-server.service
systemctl status cloudera-scm-server.service
#
# tail -f /var/log/cloudera-scm-server/cloudera-scm-server.log
#
# localhost:7180
# admin/admin
#