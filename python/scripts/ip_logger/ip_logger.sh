#!/usr/bin/env bash

LOGFILE="iplog.txt"
LASTIPFILE="lastip.txt"
CURRENT_IP=`exec wget -q -O - http://www.celles.net/php/whatismyip.php`
LAST_IP=`exec /bin/cat $LASTIPFILE 2> /dev/null`
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

#echo "Current IP: " $CURRENT_IP
#echo "Last    IP: " $LAST_IP

if [ "$CURRENT_IP" != "$LAST_IP" ]; then
  echo "New IP - save to $LOGFILE"
  echo $TIMESTAMP $CURRENT_IP >> $LOGFILE
fi

echo $CURRENT_IP > $LASTIPFILE
