#!/usr/bin/env bash

LOGFILE="iplog.txt"
LAST_IP=`exec wget -q -O - http://www.celles.net/php/whatismyip.php`
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
echo $TIMESTAMP $LAST_IP >> $LOGFILE
