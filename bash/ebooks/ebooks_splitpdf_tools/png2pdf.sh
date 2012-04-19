#!/usr/bin/env bash

source _config.sh

echo "Convert png files to $destFilename"

convert temp2/png/*.png out/$destFilename