#!/usr/bin/env bash

source /home/pi/browser/misc/config.sh

f_LOG "Generate config file"

python /home/pi/browser/misc/make_config.py /home/pi/browser/misc/browser.template.ini /home/pi/display/browser.ini
