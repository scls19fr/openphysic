#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Switch off monitor" >> $LOGFILE

/opt/vc/bin/tvservice -p
/opt/vc/bin/tvservice -o