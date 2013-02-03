#!/bin/bash

source /home/pi/browser/misc/config.sh

f_LOG "Stop browser (not recommanded)"

killall start_browser.sh
killall browser
