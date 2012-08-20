#!/usr/bin/env bash

source _config.sh

ext='gif' # jpg png ...

echo "Convert $ext files to $destFilename"

convert -compress zip temp2/$ext/*.$ext "out/$destFilename"