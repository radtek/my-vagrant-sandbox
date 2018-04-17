set -x
sudo su - oracle <<EOF
set -x
#
set +x
source ~/.bash_profile
set -x
#
env
#
cd $ORACLE_HOME
pwd
#
EOF