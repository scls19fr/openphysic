#!/usr/bin/env bash

echo "Converting .pbm to .png"
for f in temp/pbm/img*.p?m
do
  fullfilename=$(basename $f)
  f2=temp/png/${fullfilename%.*}.png
  echo " Convert $f to $f2"
  convert $f $f2
done

#!/bin/bash
#fullfilename=$(basename $1)
#extension=${fullfilename##*.}
#filename=${fullfilename%.*}

#echo "fullfilename=$fullfilename"
#echo "extension=$extension"
#echo "filename=$filename"

#    ./file_name.sh /path/to/file/toto.txt.truc
#    fullfilename=toto.txt.truc
#    extension=truc
#    filename=toto.txt