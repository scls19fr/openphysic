#!/usr/bin/env bash

N=20

for (( i=1; i<=$N; i++ ))
do
    user=`printf "user_%04d" $i`
    #port=$((9000 + $i))
    #echo "Run notebook $user on port $port"
    echo "Run notebook for $user"
    python nbmanage.py configure --user $user
    cd ./users/$user
    ipython notebook --pylab --profile nbserver --no-browser >> ../../log/log_$i.txt 2> ../../log/log_err_$i.txt &
    # --port $port 
    sleep 2
    cd ../..
    echo ""
done

for (( i=1; i<=$N; i++ ))
do
    user=`printf "user_%04d" $i`
    echo "Err Log for $user"
    cat log/log_err_$i.txt
    echo "==="
done