#!/bin/bash

sleep 25
/etc/init.d/filebeat start

# importando modelo do index filebeat
./usr/share/filebeat/scripts/import_dashboards -only-index -es http://elasticsearch:9200

sleep 5

# Disparando mensagens para gerar log no Elasticsearch.
for i in `seq 1 10000`
do
   echo "TESTANDO FLUXO DE LOG" >> /tmp/test.log
   tail -n 50 /tmp/test.log
done
/etc/init.d/filebeat status
