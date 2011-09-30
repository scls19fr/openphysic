#!/bin/sh
rm -f mini_*

ls *.jpg > images

for image in $(cat images)
  do
  echo $image
  thumbnail="mini_"$image
  echo $thumbnail
  convert -size 120x120 $image -resize 120x120 +profile "*" $thumbnail  
done

rm -f images
