#!/bin/bash

LOG=/tmp/browser.log

echo "Restart browser" >> $LOG

killall browser
