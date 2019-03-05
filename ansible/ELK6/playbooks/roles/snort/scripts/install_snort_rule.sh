#!/bin/bash
groupadd snort
useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort

mkdir -p /etc/snort
mkdir -p /etc/snort/rules
mkdir -p /etc/snort/rules/iplists
mkdir -p /etc/snort/preproc_rules
mkdir -p /usr/local/lib/snort_dynamicrules
mkdir -p /etc/snort/so_rules

touch /etc/snort/rules/iplists/black_list.rules
touch /etc/snort/rules/iplists/white_list.rules
touch /etc/snort/rules/local.rules
touch /etc/snort/sid-msg.map

mkdir -p /var/log/snort
mkdir -p /var/log/snort/archived_logs

chmod -R 5775 /etc/snort
chmod -R 5775 /var/log/snort
chmod -R 5775 /var/log/snort/archived_logs
chmod -R 5775 /etc/snort/so_rules
chmod -R 5775 /usr/local/lib/snort_dynamicrules

chown -R snort:snort /etc/snort
chown -R snort:snort /var/log/snort
chown -R snort:snort /usr/local/lib/snort_dynamicrule

(cd ~/snort-${snort_version}/etc/ && cp *.conf* /etc/snort && cp *.map /etc/snort && cp *.dtd /etc/snort )
(cd ~/snort-${snort_version}/src/dynamic-preprocessors/build/usr/local/lib/snort_dynamicpreprocessor/ && cp * /usr/local/lib/snort_dynamicpreprocessor/ )

sed -i "s/include \$RULE\_PATH/#include \$RULE\_PATH/" /etc/snort/snort.conf
