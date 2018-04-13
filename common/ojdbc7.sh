if [ -f $JAVA_HOME/lib/ext/ojdbc7.jar ]; then exit 0; fi
#
# wget http://download.oracle.com/otn/utilities_drivers/jdbc/121020/ojdbc7.jar # problem downloading at meta
cp -v /vagrant/downloads/ojdbc7.jar .
if [ ! -f ojdbc7.jar ]; then exit; fi
echo "7c9b5984b2c1e32e7c8cf3331df77f31e89e24c2" "ojdbc7.jar" | tee ojdbc7.sha1
sha1sum --check ojdbc7.sha1
if [[ $? -ne 0 ]]; then exit; fi
#
cp -v ojdbc7.jar $JAVA_HOME/lib/ext
#