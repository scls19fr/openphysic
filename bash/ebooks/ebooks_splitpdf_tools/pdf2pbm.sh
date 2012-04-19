#!/usr/bin/env bash

source _config.sh

echo "Extracting $srcFilename to .pbm"

pdfimages in/$srcFilename -j temp/pbm/img

