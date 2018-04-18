set -x
#
# curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.2.3-x86_64.rpm
if [ ! -f filebeat-6.2.3-x86_64.rpm ]
then cp -v /vagrant/downloads/filebeat-6.2.3-x86_64.rpm .; fi
#
rpm --install filebeat-6.2.3-x86_64.rpm
#
filebeat version
#
if [ ! -f /etc/filebeat/filebeat.yml.default ]
then cp -v /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.default
else cp -v /etc/filebeat/filebeat.yml.default /etc/filebeat/filebeat.yml
fi
#
echo '
filebeat.prospectors:
- type: log
  enabled: true
  paths:
    - /var/log/*.log
filebeat.config.modules:
  path: ${path.config}/modules.d/*.yml
  reload.enabled: false
setup.template.settings:
  index.number_of_shards: 3
output.elasticsearch:
  hosts: ["localhost:9200"]
#output.logstash:
  #hosts: ["localhost:5044"]
setup.kibana:
  #host: "localhost:5601"
' | tee /etc/filebeat/filebeat.yml
#
filebeat setup --template -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'
#
#filebeat export template > filebeat.template.json
#curl -XPUT -H 'Content-Type: application/json' http://localhost:9200/_template/filebeat-6.2.3 -d@filebeat.template.json
#
filebeat setup --dashboards
#
cat /etc/filebeat/filebeat.yml | grep -v '^\s*#' | grep -v '^$'
#
filebeat test config
filebeat test output
#
systemctl start filebeat.service
systemctl enable filebeat.service
systemctl status filebeat.service
#
# less /var/log/filebeat/filebeat
#
# https://www.elastic.co/guide/en/kibana/6.x/tutorial-load-dataset.html
#