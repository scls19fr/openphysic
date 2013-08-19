#!/usr/bin/env bash

N=3

for (( i=1; i<=$N; i++ ))
do
    user=`printf "user_%04d" $i`
    port=$((9000 + $i))
    echo "Run notebook $user on port $port"
    cd ./users/$user
    ipython notebook --pylab --profile nbserver --no-browser --port $port >> ../../log/log_$i.txt 2> ../../log/log_err_$i.txt &
    sleep 2
    cd ../..
done

for (( i=1; i<=$N; i++ ))
do
    user=`printf "user_%04d" $i`
    echo "Err Log for $user"
    cat log/log_err_$i.txt
    echo "==="
done