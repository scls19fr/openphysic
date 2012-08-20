#!/usr/bin/env bash

source _config.sh

echo "Convert png files to $destFilename"

convert -compress zip temp2/png/*.png "out/$destFilename"