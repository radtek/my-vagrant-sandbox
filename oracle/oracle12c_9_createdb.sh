set -x
sudo su - oracle <<EOF
set -x
#
dbca -silent \
  -createDatabase \
  -templateName General_Purpose.dbc \
  -gdbname orcl \
  -sid orcl \
  -responseFile NO_VALUE \
  -characterSet AL32UTF8 \
  -sysPassword passw0rt \
  -systemPassword passw0rt \
  -createAsContainerDatabase false \
  -databaseType MULTIPURPOSE \
  -storageType FS \
  -emConfiguration DBEXPRESS \
  -sampleSchema true
#
dbca -silent \
  -createDatabase \
  -templateName General_Purpose.dbc \
  -gdbname bibd \
  -sid bibd \
  -responseFile NO_VALUE \
  -characterSet AL32UTF8 \
  -sysPassword passw0rt \
  -systemPassword passw0rt \
  -createAsContainerDatabase false \
  -databaseType MULTIPURPOSE \
  -storageType FS \
  -emConfiguration DBEXPRESS \
  -sampleSchema false
#
lsnrctl start
lsnrctl status
#
echo ORACLE_HOME=\$ORACLE_HOME
cp -v /vagrant/tnsnames.ora \$ORACLE_HOME/network/admin/
#
EOF

