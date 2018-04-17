set -x
#
/u01/app/oraInventory/orainstRoot.sh
#
# execute /u01/app/oracle/product/12.1.0/dbhome_1/root.sh
/u01/app/oracle/product/12.1.0/dbhome_1/root.sh | awk '{print $2}' | xargs -I %  sh -c 'echo %; cat %'
#
if [ ! -f /home/oracle/.bash_profile.default ]
then cp -v /home/oracle/.bash_profile /home/oracle/.bash_profile.default
else cp -v /home/oracle/.bash_profile.default /home/oracle/.bash_profile
fi
#
echo "
TMPDIR=\${TMP:-/usr/tmp}; export TMPDIR
ORACLE_BASE=/u01/app/oracle; export ORACLE_BASE
ORACLE_HOME=\$ORACLE_BASE/product/12.1.0/dbhome_1; export ORACLE_HOME
ORACLE_SID=orcl; export ORACLE_SID
PATH=\$ORACLE_HOME/bin:\$PATH; export PATH
LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib:/usr/lib64; export LD_LIBRARY_PATH
CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib; export CLASSPATH
" | tee -a /home/oracle/.bash_profile
#