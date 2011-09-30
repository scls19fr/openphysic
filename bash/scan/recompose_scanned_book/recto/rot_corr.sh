#!/usr/bin/env bash

# Rotate

for file in *.jpg;
do
  echo "rotate \"$file\""
  convert -rotate -0.77 "$file" "$file"
done
