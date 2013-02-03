#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

f_LOG "Switch off monitor"

/opt/vc/bin/tvservice -p
/opt/vc/bin/tvservice -o