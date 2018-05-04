#!/bin/sh
rm -f /tmp/cron.txt
crontab -l > /tmp/cron.txt
echo "1 5 * * * find ~/yaf/json -mtime 30 -exec rm -f {} \;" >> /tmp/cron.txt
cat /tmp/cron.txt | crontab
rm -f /tmp/cron.txt
