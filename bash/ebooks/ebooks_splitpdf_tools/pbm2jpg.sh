#!/usr/bin/env bash

# pbm () ppm ()
echo "Converting .pbm to .jpg"
for f in temp/pbm/img*.p?m
do
  fullfilename=$(basename $f)
  f2=temp/jpg/${fullfilename%.*}.jpg
  echo " Convert $f to $f2"
  #convert $f $f2
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