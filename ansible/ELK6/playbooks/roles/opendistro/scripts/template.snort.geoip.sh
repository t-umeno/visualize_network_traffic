#!/bin/bash
curl --noproxy localhost -XPUT https://localhost:9200/_template/snort -u admin:admin -k -H 'Content-Type: application/json' -d '
{
  "template" : "snort.*",
  "mappings" : {
    "properties" : {
      "src.geoip" : {
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
      "dst.geoip" : {
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
