#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

f_LOG "Starting VNC Client"

#no tunnelling
#vncviewer 192.168.1.28:0

#SSH tunnelling
vncviewer -via pi@192.168.1.28 localhost:0
# todo : zoom fit to screen

#ssvnc 192.168.1.28:0
