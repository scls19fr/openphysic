#!/usr/bin/env bash

DIR="/home/pi/browser/misc"
#LOGFILE="$DIR/log/browser.log"
#LOGFILE="/tmp/browser.log"
LOGFILE="/home/pi/browser/log/browser.log"
TMPLOGFILE="/tmp/browser.log"

#TIMESTAMP=`date "+%Y-%m-%d %H:%M:%S"`

f_LOG() {
echo "`date '+%Y-%m-%d %H:%M:%S'` $@" >> $LOGFILE
}

#f_LOG 'test'