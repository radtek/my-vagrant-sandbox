#
if [[ ! "$(sudo yum repolist | grep enterprisedb-tools)" == "" ]]; then exit 0; fi
#
if [[ ! "$(rpm -q epel-release)" = "epel-release-"* ]]
then yum install -y epel-release; fi
#
curl -s http://yum.enterprisedb.com/edbrepos/edb-repo-latest.noarch.rpm -q -o edb-repo-latest.noarch.rpm
rpm -Uvh edb-repo-latest.noarch.rpm
#
echo EDB_YUM_USERNAME=$EDB_YUM_USERNAME
echo EDB_YUM_PASSWORD=$EDB_YUM_PASSWORD
if [[ -z "$EDB_YUM_USERNAME" || "$EDB_YUM_USERNAME" == "" ]]; then exit 1; fi
if [[ -z "$EDB_YUM_PASSWORD" || "$EDB_YUM_PASSWORD" == "" ]]; then exit 1; fi
export EDB_YUM_CREDENTIALS="${EDB_YUM_USERNAME}"':'"${EDB_YUM_PASSWORD}"
echo EDB_YUM_CREDENTIALS=$EDB_YUM_CREDENTIALS
sed 's/<username>:<password>/'${EDB_YUM_CREDENTIALS}'/g' -i /etc/yum.repos.d/edb.repo
head /etc/yum.repos.d/edb.repo
#
yum install -y yum-utils # due to "yum-config-manager"
yum-config-manager --quiet --enable enterprisedb-tools | grep "enabled"
#
