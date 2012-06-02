#!/usr/bin/env bash

minimal_width=1500

rm temp2/pbm/*.p?m
for f in temp/pbm/*.p?m
do
  f2=$(basename $f)
  read -r width height <<< $( convert $f -format "%w %h" info:)
  width2=$(( ${width} / 2 ))
  height2=${height}
  if [ $width -gt $minimal_width ]; then
    echo "split $f ${width}x${height} to 2 files ${width2}x${height2}"

    convert $f -crop ${width2}x${height2}+0+0 +repage temp2/pbm/${f2%%.*}a.pbm
    convert $f -crop ${width2}x${height2}+$width2+0 +repage temp2/pbm/${f2%%.*}b.pbm
  else
    echo "copy $f ${width}x${height} (don't split because width<$minimal_width)"
    cp $f temp2/pbm/$f2
  fi
done