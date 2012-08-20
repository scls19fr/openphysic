#!/usr/bin/env bash

source _config.sh

echo "Extracting $srcFilename to .png"

# pour scan (images)
#pdfimages "in/$srcFilename" -j temp/pbm/img


# pour texte
convert -density 200 "in/$srcFilename" temp/png/img%04d.png