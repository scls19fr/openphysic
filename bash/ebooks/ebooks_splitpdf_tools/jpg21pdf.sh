#!/usr/bin/env bash

source _config.sh
ext='jpg'

echo "Convert jpg files to pdf files"

for f in temp2/$ext/img*.$ext
do
  fullfilename=$(basename $f)
  f2=temp2/pdf/${fullfilename%.*}.pdf
  echo " Convert $f to $f2"
  convert $f $f2
  convert -compress jpeg -quality 30 $f $f2
  #-quality 1-100
done
