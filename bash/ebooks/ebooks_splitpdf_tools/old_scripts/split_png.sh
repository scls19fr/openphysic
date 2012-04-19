#!/usr/bin/env bash

rm out/*.png
for f in *.png
do
  read -r width height <<< $( convert $f -format "%w %h" info:)
  width2=$(( ${width} / 2 ))
  height2=${height}
  echo "split $f ${width}x${height} to 2 files ${width2}x${height2}"
  convert $f -crop ${width2}x${height2}+0+0 +repage out/${f%%.*}a.png
  convert $f -crop ${width2}x${height2}+$width2+0 +repage out/${f%%.*}b.png
done