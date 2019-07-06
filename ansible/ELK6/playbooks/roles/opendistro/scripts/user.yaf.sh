#!/bin/bash
curl -XPUT https://localhost:9200/_opendistro/_security/api/user/yaf -u admin:admin -k -H 'Content-Type: application/json' -d '{    "hash" : "$2y$12$.wnFR4cb9NraGKZ9X8v82OP7IbdYOivWmheY/Fd/Ob7uP1xbA1JhS",    "backend_roles" : [      "yaf"    ],    "attributes" : { },    "description" : "yaf user"}'
