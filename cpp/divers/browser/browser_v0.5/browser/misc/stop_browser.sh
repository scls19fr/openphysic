#!/bin/bash

source /home/pi/browser/misc/config.sh

f_LOG "Stop browser (not recommanded)"

#killall start_browser.sh
#killall browser

kill $(ps aux | grep 'start_browser.sh' | awk '{print $2}')
kill $(ps aux | grep '/home/pi/browser/browser' | awk '{print $2}')
