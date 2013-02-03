#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

f_LOG "Stop all"

/home/pi/browser/misc/stop_browser.sh &
/home/pi/browser/misc/stop_vncserver.sh &

