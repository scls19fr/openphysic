#!/bin/bash

LOG=/tmp/browser.log

echo "Stop browser (not recommanded)" >> $LOG

killall start_browser.sh
killall browser
