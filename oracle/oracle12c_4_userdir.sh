set -x
groupadd oinstall
groupadd dba
useradd -g oinstall -G dba oracle
echo "passw0rt" | passwd --stdin oracle
#	
mkdir /u01
mkdir /u02
chown -R oracle:oinstall /u01
chown -R oracle:oinstall /u02
chmod -R 775 /u01
chmod -R 775 /u02
chmod g+s /u01
chmod g+s /u02