#!/usr/bin/env bash

source _config.sh

echo "Convert pbm files to $destFilename"

convert -compress zip temp2/pbm/*.p?m "out/$destFilename"