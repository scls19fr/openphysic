#!/usr/bin/env bash

echo "Flip .jpg"
for f in temp/jpg/img*.jpg
do
  fullfilename=$(basename $f)
  f2=temp2/jpg/${fullfilename%.*}.jpg
  echo " Flip $f"
  convert $f -flip $f2
done