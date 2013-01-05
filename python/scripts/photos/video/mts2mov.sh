#!/bin/sh

srcFile="00000.MTS"
dstFile=${srcFile%%.*}.mov

echo "Converting $srcFile to $dstFile"

ffmpeg -i $srcFile -b 185M $dstFile