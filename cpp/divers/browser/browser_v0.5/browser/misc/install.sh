#!/bin/bash

LOG=/tmp/browser_install.log

echo "Install" >> $LOG

echo "Add symlink"
rm -f /home/pi/browser
ln -s /home/pi/browser_src/browser/browser_v0.5/browser/ /home/pi/browser
