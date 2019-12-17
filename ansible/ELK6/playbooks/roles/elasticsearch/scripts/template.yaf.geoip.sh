#!/bin/bash
curl -XPUT http://localhost:9200/_template/yaf -H 'Content-Type: application/json' -d '
{
  "template" : "yaf.*",
  "mappings" : {
    "properties" : {
      "src_geoip" : {
        "dynamic" : true,
        "properties" : {
          "ip" : {
            "type" : "ip"
          },
          "latitude" : {
            "type" : "half_float"
          },
          "location" : {
            "type" : "geo_point"
          },
          "longitude" : {
            "type" : "half_float"
          }
        }
      },
      "dst_geoip" : {
        "dynamic" : true,
        "properties" : {
          "ip" : {
            "type" : "ip"
          },
          "latitude" : {
            "type" : "half_float"
          },
          "location" : {
            "type" : "geo_point"
          },
          "longitude" : {
            "type" : "half_float"
          }
        }
      }
    }
  }
}'
