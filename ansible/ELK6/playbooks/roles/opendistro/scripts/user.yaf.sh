#!/bin/bash
LOGSTASH_USER=$1
LOGSTASH_PASSWORD=$2
CONTAINER_ID=$(docker ps|grep odfe-node1|cut -d' ' -f1)
HASH=$(docker exec ${CONTAINER_ID} /bin/sh /usr/share/elasticsearch/plugins/opendistro_security/tools/hash.sh -p ${LOGSTASH_PASSWORD})
curl --noproxy localhost -XPUT https://localhost:9200/_opendistro/_security/api/user/yaf -u admin:admin -k -H 'Content-Type: application/json' -d '{    "hash" : "'${HASH}'",    "backend_roles" : [      "'${LOGSTASH_USER}'"    ],    "attributes" : { },    "description" : "yaf user"}'
