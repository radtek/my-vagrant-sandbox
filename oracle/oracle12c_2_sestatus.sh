set -x
sestatus
setenforce enforcing
sudo sed 's/SELINUX=permissive/SELINUX=enforcing/' /etc/selinux/config -i
sestatus