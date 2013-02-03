#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

echo "$TIMESTAMP Start all" >> $LOGFILE

#unclutter -display :0 -noevents -grab
bash /home/pi/browser/misc/start_vncserver.sh &
bash /home/pi/browser/misc/start_browser.sh &

