#!/bin/bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Restart browser using $0" >> $LOGFILE

killall browser
