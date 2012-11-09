#!/usr/bin/env bash
svn update
make
bash misc/stop_browser.sh
bash misc/start_browser.sh &
