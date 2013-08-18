#!/usr/bin/env bash
kill $(ps aux | grep 'ipython notebook' | awk '{print $2}')