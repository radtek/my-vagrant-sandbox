set -x
yum groupinstall -y "X Window System"
yum install -y xeyes
#	
# requires Xming
# https://wiki.centos.org/HowTos/Xming	
#
# convert private_key from openssh format to putty ppk format using puttygen - Conversion
# $ vagrant ssh-config
# and use private key location in the following statement
# $ "C:\APPS\WinSCPPortable\App\winscp\WinSCP.com" /keygen C:/APPS/vagrant/oracle/.vagrant/machines/default/virtualbox/private_key /output=C:/APPS/vagrant/oracle/.vagrant/machines/default/virtualbox/private_key.ppk
#
# use putty to logon via pki (no password) using putty as vagrant (oracle12c)
# + SSH - Auth
# use putty to logon via password using putty as oracle (oracle12cX) - password is "passw0rt"
# + SSH - X11 - Enable X11 forwarding
#
# check:
# oracle@oracle12c$ xeyes
#
# MANUAL X INSTALLATION
# /stage/database/runInstaller