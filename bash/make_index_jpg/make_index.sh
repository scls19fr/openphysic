#!/bin/sh
ls --ignore="mini_*" | grep .jpg > images

output=index.html

rm -f $output

echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">' >> $output # >> copie sans ecrasement
echo '<html>' >> $output
echo '   <head>' >> $output
echo '      <title>index</title>' >> $output
echo '   </head>' >> $output
echo '   <body>' >> $output
echo '      <h1>index</h1>' >> $output

echo ' ' >> $output
for image in $(cat images)
do
  echo '<!-- '$image'--> ' >> $output
  thumbnail="mini_"$image
  echo '<p>' >> $output
  echo '<a href="'$image'"><img src="'$thumbnail'" border=0 title="photo" alt="photo"></a>' >> $output
  echo '</p>' >> $output
done
echo ' ' >> $output

echo '   </body>' >> $output
echo '</html>' >> $output

rm -f $images
