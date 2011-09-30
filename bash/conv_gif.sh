#!/usr/bin/env bash
for i in *.gif;
do
convert $i $(basename $i .gif).png
done
