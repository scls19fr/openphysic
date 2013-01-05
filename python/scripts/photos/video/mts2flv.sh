#!/bin/sh

srcFile="00000.MTS"
dstFile=${srcFile%%.*}.flv

echo "Converting $srcFile to $dstFile"

ffmpeg -i $srcFile -vcodec flv -f flv -r 25 -s 800x450 -aspect 16:9 -b 2000k -g 160 -cmp 2 -subcmp 2 -mbd 2 -flags +aic+cbp+mv0+mv4  -trellis 2 -acodec libmp3lame -ac 2 -ar 44100 -ab 256k $dstFile