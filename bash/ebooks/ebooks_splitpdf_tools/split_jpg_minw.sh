#!/usr/bin/env bash

minimal_width=1500
minimal_width_ignore=10

rm temp2/jpg/*.jpg
for f in temp/jpg/*.jpg
do
  f2=$(basename $f)
  read -r width height <<< $( convert $f -format "%w %h" info:)
  width2=$(( ${width} / 2 ))
  height2=${height}
  if [ $width -gt $minimal_width ]; then
    echo "split $f ${width}x${height} to 2 files ${width2}x${height2}"
    convert $f -crop ${width2}x${height2}+0+0 +repage temp2/jpg/${f2%%.*}a.jpg
    convert $f -crop ${width2}x${height2}+$width2+0 +repage temp2/jpg/${f2%%.*}b.jpg
  else
    if [ $width -gt $minimal_width_ignore ]; then # ignore if with < 10px
      echo "copy $f ${width}x${height} (don't split because width<$minimal_width)"
      cp $f temp2/jpg/$f2
    else
      echo "ignore $f ${width}x${height} width=$width<minimal_width_ignore=$minimal_width_ignore"
    fi

  fi
done