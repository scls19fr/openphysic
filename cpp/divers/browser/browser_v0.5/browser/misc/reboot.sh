#!/bin/bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Reboot using $0" >> $LOGFILE

sudo /sbin/reboot
