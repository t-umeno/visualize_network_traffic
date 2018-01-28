#!/bin/sh
sudo  LD_LIBRARY_PATH=/usr/local/lib yaf --force-read-all --mac --silk --verbose --in enp0s3  --out 127.0.0.1 --ipfix-port 18000 --ipfix tcp --caplist --noerror --plugin-name=/usr/local/lib/yaf/dpacketplugin.la --max-payload 4096 --applabel --p0fprint --live pcap

