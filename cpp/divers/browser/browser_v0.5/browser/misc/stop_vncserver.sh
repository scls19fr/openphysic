#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

f_LOG "Stop VNC server"

killall vnc
