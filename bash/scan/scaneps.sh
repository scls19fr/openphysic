#!/bin/bash

filename=out
device=hp5400:libusb:001:003 # obtenir la liste des scanners avec scanimage --list-device

rm $filename.png $filename.png.eps

scanimage -x 215 -y 297 --device-name=$device > ./$filename.png ;

convert ./$filename.png ./$filename.png.eps ;
