#!/usr/bin/env bash

source _config.sh

echo "Convert jpg files to $destFilename"

convert temp2/jpg/*.jpg out/$destFilename