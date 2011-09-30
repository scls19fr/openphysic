#!/usr/bin/env bash
input=*.txt
output=all.txt
echo "Starting Multicat from $input to $output"
# input files are .txt
# they are concatenat into one all.txt file
rm -f all.txt
for file in $input;
do
  if [ "$file" != "$output" ]
  then
    echo "% ================ $file ================" >> $output
    cat "$file" >> $output
  fi 
done
echo "End of jobs"
