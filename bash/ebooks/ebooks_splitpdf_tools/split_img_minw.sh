#!/usr/bin/env bash

minimal_width=1000
ext='gif'

rm temp2/$ext/*.$ext
for f in temp/$ext/*.$ext
do
  f2=$(basename $f)
  read -r width height <<< $( convert $f -format "%w %h" info:)
  width2=$(( ${width} / 2 ))
  height2=${height}
  if [ $width -gt $minimal_width ]; then
    echo "split $f ${width}x${height} to 2 files ${width2}x${height2}"
    convert $f -crop ${width2}x${height2}+0+0 +repage temp2/$ext/${f2%%.*}a.$ext
    convert $f -crop ${width2}x${height2}+$width2+0 +repage temp2/$ext/${f2%%.*}b.$ext
  else
    echo "copy $f ${width}x${height} (don't split because width<$minimal_width)"
    cp $f temp2/$ext/$f2
  fi
done