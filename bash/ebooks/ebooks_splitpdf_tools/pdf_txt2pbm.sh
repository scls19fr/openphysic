#!/usr/bin/env bash

source _config.sh

echo "Extracting $srcFilename to .pbm"

convert -density 300 in/$srcFilename temp/pbm/img%04d.pbm