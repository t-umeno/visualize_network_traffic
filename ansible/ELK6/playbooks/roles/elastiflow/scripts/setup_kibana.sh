#!/bin/bash
curl -X POST http://127.0.0.1:5601/api/saved_objects/index-pattern/elastiflow-* -H "Content-Type: application/json" -H "kbn-xsrf: true" -d @elastiflow-master/kibana/elastiflow.index_pattern.json
