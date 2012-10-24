#!/bin/bash

LOG=/tmp/browser_xloader.log

echo "Restart browser" >> $LOG

killall browser
