#!/bin/sh
output=index.html

#ls > file_list

rm -f $output

echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">' >> $output # >> copie sans ecrasement
echo '<html>' >> $output
echo '   <head>' >> $output
echo '      <title>index</title>' >> $output
echo '   </head>' >> $output
echo '   <body>' >> $output
echo '      <h1>index</h1>' >> $output

echo ' ' >> $output
#for file in $(cat file_list)
for file in *
do
  echo '<!-- '$file'--> ' >> $output
  echo '<p>' >> $output
  echo '<a href="'$file'">'$file'</a>' >> $output
  echo '</p>' >> $output
done
echo ' ' >> $output

echo '   </body>' >> $output
echo '</html>' >> $output

rm -f file_list
