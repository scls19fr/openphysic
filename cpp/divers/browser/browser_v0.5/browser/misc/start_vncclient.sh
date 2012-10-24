#!/usr/bin/env bash

#no tunnelling
#vncviewer 192.168.1.28:0

#SSH tunnelling
vncviewer -via pi@192.168.1.28 localhost:0
# todo : zoom fit to screen

#ssvnc 192.168.1.28:0
