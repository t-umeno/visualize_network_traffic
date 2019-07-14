#!/bin/bash
export JAVA_HOME=/usr
LOGSTASH_USER=$1
LOGSTASH_PASSWORD=$2
HASH=$(/bin/bash /usr/share/elasticsearch/plugins/opendistro_security/tools/hash.sh -p ${LOGSTASH_PASSWORD})
curl -XPUT https://localhost:9200/_opendistro/_security/api/user/yaf -u admin:admin -k -H 'Content-Type: application/json' -d '{    "hash" : "'${HASH}'",    "backend_roles" : [      "'${LOGSTASH_USER}'"    ],    "attributes" : { },    "description" : "yaf user"}'
