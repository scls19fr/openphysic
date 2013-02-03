#!/bin/bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Disabling screen power savings..." >> $LOGFILE

#fr_FR.UTF-8
#export LC_MEASUREMENT=$LANG
export LC_ALL=$LANG

export DISPLAY=:0
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

sleep 5

echo "$TIMESTAMP Launching infinite loop..." >> $LOGFILE
while true
do
       # generate config file using template
       bash /home/pi/browser/misc/make_config.sh

       # Clean up in case of an unclean exit
       echo "$TIMESTAMP Cleaning up..." >> $LOGFILE
       killall browser
       #rm -f /tmp/browser*

       # Launch client application
       /home/pi/browser/browser >> $TMPLOGFILE 2>&1
done


