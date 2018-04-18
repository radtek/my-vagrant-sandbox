#
# https://www.elastic.co/guide/en/kibana/6.x/tutorial-load-dataset.html
#
# wget https://download.elastic.co/demos/kibana/gettingstarted/shakespeare_6.0.json
# gzip shakespeare_6.0.json
if [[ ! -f shakespeare_6.0.json.gz && ! -f shakespeare_6.0.json ]]
then cp /vagrant/downloads/shakespeare_6.0.json.gz .; fi
if [[ -f shakespeare_6.0.json.gz ]]
then gunzip shakespeare_6.0.json.gz; fi
#
yum install -y unzip
#
# wget https://download.elastic.co/demos/kibana/gettingstarted/accounts.zip
if [[ ! -f accounts.zip && ! -f accounts.json ]]
then cp /vagrant/downloads/accounts.zip .; fi
if [[ -f accounts.zip && ! -f accounts.json ]]
then unzip accounts.zip; fi
#
# wget https://download.elastic.co/demos/kibana/gettingstarted/logs.jsonl.gz
if [[ ! -f logs.jsonl.gz && ! -f logs.jsonl ]]
then cp /vagrant/downloads/logs.jsonl.gz .; fi
if [[ ! -f logs.jsonl ]]
then gunzip logs.jsonl.gz; fi
#
curl -s -X PUT "http://localhost:9200/shakespeare" -H 'Content-Type: application/json' -d'
{
 "mappings": {
  "doc": {
   "properties": {
    "speaker": {"type": "keyword"},
    "play_name": {"type": "keyword"},
    "line_id": {"type": "integer"},
    "speech_number": {"type": "integer"}
   }
  }
 }
}
'
#
for dd in 18 19 20
#do echo $dd; done
do
curl -s -X PUT "http://localhost:9200/logstash-2015.05.$dd" -H 'Content-Type: application/json' -d'
{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}
'
done
#
curl -s -H 'Content-Type: application/x-ndjson' \
  -XPOST 'localhost:9200/bank/account/_bulk?pretty' \
  --data-binary @accounts.json \
  > accounts.json.stdout
curl -s -H 'Content-Type: application/x-ndjson' \
  -XPOST 'localhost:9200/shakespeare/doc/_bulk?pretty' \
  --data-binary @shakespeare_6.0.json \
  > shakespeare_6.0.json.stdout
curl -s -H 'Content-Type: application/x-ndjson' \
  -XPOST 'localhost:9200/logs/_bulk?pretty' \
  --data-binary @logs.jsonl \
  > logs.jsonl.stdout
#
curl -s -X GET "http://localhost:9200/_cat/indices?v"
#
