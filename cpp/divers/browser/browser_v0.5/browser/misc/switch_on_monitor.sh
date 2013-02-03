#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Switch on monitor" >> $LOGFILE

/opt/vc/bin/tvservice -p
startx /usr/bin/graphical_launcher `fgconsole`
