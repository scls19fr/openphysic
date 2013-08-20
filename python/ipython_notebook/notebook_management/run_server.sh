#!/usr/bin/env bash

i=1
for user in $(cat users.txt)
do
    echo "Run notebook for $user"
    python nbmanage.py configure --user $user
    cd ./users/$user
    ipython notebook --pylab --profile nbserver --no-browser >> ../../log/log_$i.txt 2> ../../log/log_err_$i.txt &
    # --port $port 
    sleep 2
    cd ../..
    echo ""
    i=$(( $i + 1 ))
done  

i=1
for user in $(cat users.txt)
do
    echo "Error Log file for $user"
    cat log/log_err_$i.txt
    echo "==="
    i=$(( $i + 1 ))
done  
