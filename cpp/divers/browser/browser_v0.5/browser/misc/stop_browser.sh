#!/bin/bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Stop browser (not recommanded)" >> $LOGFILE

killall start_browser.sh
killall browser
