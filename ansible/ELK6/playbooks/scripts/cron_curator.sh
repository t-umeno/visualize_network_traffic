#!/bin/sh
while [ -f /tmp/cron.txt ]; do
    sleep 1
done
crontab -l > /tmp/cron.txt
echo "2 5 * * * curator ~/.curator/delete_indices_yaf.yml" >> /tmp/cron.txt
cat /tmp/cron.txt | crontab
rm -f /tmp/cron.txt
