#!/bin/bash
curl -XPUT https://localhost:9200/_opendistro/_security/api/rolesmapping/yaf -u admin:admin -k -H 'Content-Type: application/json' -d '{    "backend_roles" : [      "yaf"    ],    "hosts" : [ ],    "users" : [ ],    "and_backend_roles" : [ ]}'
