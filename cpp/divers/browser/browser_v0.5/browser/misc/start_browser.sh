#!/bin/bash

source /home/pi/browser/misc/config.sh

f_LOG "Disabling screen power savings..."

#fr_FR.UTF-8
#export LC_MEASUREMENT=$LANG
export LC_ALL=$LANG

export DISPLAY=:0
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

sleep 5

f_LOG "Launching infinite loop..."
while true
do
       # generate config file using template
       bash /home/pi/browser/misc/make_config.sh

       # Clean up in case of an unclean exit
       f_LOG "Cleaning up..."
       killall browser
       #rm -f /tmp/browser*

       # Launch client application
	   echo "`date '+%Y-%m-%d %H:%M:%S'` Run browser" >> $TMPLOGFILE
       /home/pi/browser/browser >> $TMPLOGFILE 2>&1
done


