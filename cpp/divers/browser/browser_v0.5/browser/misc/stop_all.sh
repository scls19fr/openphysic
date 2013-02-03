#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Stop all" >> $LOGFILE

/home/pi/browser/misc/stop_browser.sh &
/home/pi/browser/misc/stop_vncserver.sh &

