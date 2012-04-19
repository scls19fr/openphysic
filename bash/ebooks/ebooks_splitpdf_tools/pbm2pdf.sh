#!/usr/bin/env bash

source _config.sh

echo "Convert pbm files to $destFilename"

convert temp2/pbm/*.pbm out/$destFilename