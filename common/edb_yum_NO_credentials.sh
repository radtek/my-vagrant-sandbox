#
# the credentials can be applied for at EDB sales
#
export EDB_YUM_USERNAME="your_account"
echo EDB_YUM_USERNAME=$EDB_YUM_USERNAME
export EDB_YUM_PASSWORD="secret"
echo EDB_YUM_PASSWORD=$EDB_YUM_PASSWORD
#
#sudo sed 's/ENV\[EDB_YUM_USERNAME]:ENV\[EDB_YUM_PASSWORD]/slavomir.nagy_metafinanz.de:efcd4a19f30dae3f16f2406726269865/g' -i /etc/yum.repos.d/edb.repo
#sudo sed 's/slavomir.nagy_metafinanz.de:efcd4a19f30dae3f16f2406726269865/<username>:<password>/g' -i /etc/yum.repos.d/edb.repo
#sudo sed 's/:@yum./<username>:<password>@yum./g' -i /etc/yum.repos.d/edb.repo
#
