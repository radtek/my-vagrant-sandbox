set -x
#
# wget https://artifacts.elastic.co/downloads/logstash/logstash-6.2.4.rpm
if [ ! -f logstash-6.2.4.rpm ]
then cp -v /vagrant/downloads/logstash-6.2.4.rpm .; fi
#
rpm --install logstash-6.2.4.rpm
#
if [ ! -f /etc/logstash/logstash.yml.default ]
then cp -v /etc/logstash/logstash.yml /etc/logstash/logstash.yml.default
else cp -v /etc/logstash/logstash.yml.default /etc/logstash/logstash.yml
fi
#
echo '
input {
  beats {
    port => 5044
  }
}
output {
  elasticsearch {
    hosts => ["localhost:9200"]
    manage_template => false
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
    document_type => "%{[@metadata][type]}"
  }
}
' | tee /etc/logstash/conf.d/logstash.conf
#
/usr/share/logstash/bin/logstash-plugin update logstash-input-beats
#
systemctl start logstash.service
systemctl enable logstash.service
systemctl status logstash.service
#
# sudo tail -f /var/log/logstash/logs/logstash-plain.log
#

