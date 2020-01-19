#!/bin/sh
set -e
LOG=/var/log/pull.log
touch $LOG
echo `date`": start pulling" >> $LOG
cd /repo && git pull
echo `date`": done" >> $LOG


