#!/bin/sh
INTERFACE="enp0s3"
if [ $# -ge 1 ] ; then
    INTERFACE=$1
fi
sudo ifconfig ${INTERFACE} up
sudo  LD_LIBRARY_PATH=/usr/local/lib yaf --force-read-all --mac --silk --verbose --in ${INTERFACE}  --out 127.0.0.1 --ipfix-port 4739 --ipfix tcp --noerror --plugin-name=/usr/local/lib/yaf/dpacketplugin.la --max-payload 4096 --applabel --p0fprint --ndpi --live pcap
