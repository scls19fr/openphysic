#!/usr/bin/env bash

#mkdir temp2
rm temp2/*

# Convert to PDF
for file in temp/*.jpg;
do
  base=$(basename "$file" .jpg)
  to=$base.pdf
  echo "convert \"$file\" to \"temp2/$to\""
  convert "$file" "temp2/$to"
done

echo "Concatenate pdf files"
pdftk temp2/*.pdf cat output output.pdf
