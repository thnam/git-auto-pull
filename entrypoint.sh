#!/usr/bin/env sh
echo "*/$INTERVAL * * * * /pull.sh" > crontab.txt && crontab crontab.txt
mkdir -p /root/.ssh && cp /ssh/* /root/.ssh && crond -f
