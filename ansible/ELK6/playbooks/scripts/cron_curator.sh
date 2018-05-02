#!/bin/sh
rm -f /tmp/cron.txt
crontab -l > /tmp/cron.txt
echo "2 5 * * * curator ~/.curator/delete_indicies_yaf.yml" >> /tmp/cron.txt
cat /tmp/cron.txt | crontab
rm -f /tmp/cron.txt

