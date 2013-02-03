#!/bin/bash

source /home/pi/browser/misc/config.sh

f_LOG "Install"

f_LOG "Install - Add symlink"
rm -f /home/pi/browser
ln -s /home/pi/browser_src/browser/browser_v0.5/browser/ /home/pi/browser
ln -s /home/pi/browser/misc/browser.template.gte.ini /home/pi/browser/misc/browser.template.ini