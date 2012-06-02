#!/usr/bin/env bash

source _config.sh

ext='jpg' # jpg png ...
echo "Extracting $srcFilename to $ext"

# pour scan (images)
#pdfimages in/$srcFilename -j temp/pbm/img
# puis pbm2jpg.sh

# pour texte
#convert -density 200 in/$srcFilename temp/jpg/img%04d.jpg