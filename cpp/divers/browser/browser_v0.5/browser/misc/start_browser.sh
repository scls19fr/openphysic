#!/bin/bash

LOG=/tmp/browser.log

echo "Disabling screen power savings..." > $LOG

xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

sleep 5

echo "Launching infinite loop..." >> $LOG
while true
do
       # Clean up in case of an unclean exit
       echo "Cleaning up..." >> $LOG
       killall browser
       #rm -f /tmp/browser*

       # Launch client application
       /home/pi/browser/browser >> $LOG 2>&1
done
