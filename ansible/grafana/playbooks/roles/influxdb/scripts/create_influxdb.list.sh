#!/bin/bash
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
. /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
