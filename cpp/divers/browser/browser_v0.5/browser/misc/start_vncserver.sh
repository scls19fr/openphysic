#!/usr/bin/env bash

# $ apt-get install x11vnc

echo "Starting VNC server"
# set password using
# $ x11vnc -storepasswd YOUR_PASSWORD ~/.vnc/x11vnc.pass

#x11vnc -bg
#echo "this script need to be restarted after each client connection!!!"

/usr/bin/x11vnc -forever -rfbport 5900 -rfbauth ~/.vnc/x11vnc.pass -o ~/.vnc/x11vnc.log -loop -display :0
