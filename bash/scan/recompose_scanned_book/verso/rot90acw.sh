#!/usr/bin/env bash

# Rotate

for file in *.jpg;
do
  echo "rotate \"$file\" 90° anticlockwise"
  convert -rotate -90 "$file" "$file"
done
