#!/bin/bash
CONTAINER_ID=$(docker ps|grep odfe-node1|cut -d' ' -f1)
HASH=$(docker exec ${CONTAINER_ID} /bin/sh /usr/share/elasticsearch/plugins/opendistro_security/tools/hash.sh -p yaf123)
curl -XPUT https://localhost:9200/_opendistro/_security/api/user/yaf -u admin:admin -k -H 'Content-Type: application/json' -d '{    "hash" : "'${HASH}'",    "backend_roles" : [      "yaf"    ],    "attributes" : { },    "description" : "yaf user"}'
