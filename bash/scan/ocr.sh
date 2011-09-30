#!/usr/bin/env bash
echo "Starting OCR"
# input files are .png
# they are converted to .tif using ImageMagick
# OCR software (tesseract) is applied to create .txt file
for file in *.png;
do
  from=$file
  base=$(basename "$file" .png)
  #to=$base.tif
  echo " Processing \"$from\" (basename=\"$base\")"
  echo "  Convert \"$from\" to \"$base.tif\""
  convert "$file" "$base.tif"
  echo "  OCR of \"$base.tif\" to create \"$base.txt\""
  tesseract "$base.tif" "$base" -l fra
done
echo "End of jobs"
rm *.tif
