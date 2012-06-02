#!/usr/bin/env bash

source _config.sh

echo "Extracting $srcFilename to .pbm"

# pour scan (images)
pdfimages in/$srcFilename -j temp/pbm/img

# pour texte
#convert -density 200 in/$srcFilename temp/jpg/img%04d.jpg