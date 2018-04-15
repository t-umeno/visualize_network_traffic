#!/bin/sh
#export JRUBY_OPTS="-J-Dhttp.proxyHost=proxy.host -J-Dhttp.proxyPort=3128"
DEBUG=1 JARS_SKIP='true' /usr/share/logstash/bin/logstash-plugin install logstash-output-influxdb
