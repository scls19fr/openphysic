#!/usr/bin/env bash

source _config.sh

echo "Convert jpg files to $destFilename"

#convert -compress zip temp2/jpg/*.jpg "out/$destFilename"
convert -compress jpeg temp2/jpg/*.jpg "out/$destFilename"