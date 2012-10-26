#!/usr/bin/env bash
make
bash misc/stop_browser.sh
bash misc/start_browser.sh &
