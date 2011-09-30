#/!usr/bin/env bash

echo "Compose"

#mkdir temp
#mkdir temp/recto
#mkdir temp/verso

#mkdir output

rm temp/*

echo "Processing recto"

i=1
for file in recto/*.jpg;
do
  from=$file
  to=temp/$(printf "%03d" $i).jpg
  echo "Copy \"$file\" to \"$to\""
  cp "$file" "$to"
  i=$(($i + 2))
done

i=$(($i - 1))
#echo $i

echo "Processing verso"

for file in verso/*.jpg;
do
  from=$file
  to=temp/$(printf "%03d" $i).jpg
  echo "Copy \"$file\" to \"$to\""
  cp "$file" "$to"
  i=$(($i - 2))
done
