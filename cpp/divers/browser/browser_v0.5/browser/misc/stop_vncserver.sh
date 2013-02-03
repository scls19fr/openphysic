#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Stop VNC server" >> $LOGFILE

killall vnc
