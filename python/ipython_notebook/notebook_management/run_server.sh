#!/usr/bin/env bash

for (( c=1; c<=5; c++ ))
do
   echo "Run notebook $c"
   ipython notebook --pylab --profile nbserver --no-browser >> log/log$c.txt 2> log/log_err_$c.txt &
    sleep 2
done
