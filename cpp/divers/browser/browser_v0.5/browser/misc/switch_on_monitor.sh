#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

f_LOG "Switch on monitor"

/opt/vc/bin/tvservice -p
startx /usr/bin/graphical_launcher `fgconsole`
