@echo off

REM RECADRAGE DES IMAGES
REM PENSER A CONSERVER UNE COPIE DES IMAGES AVANT DE LANCER CE SCRIPT BATCH
REM CE SCRIPT NECESSITE L'INSTALLATION DE LA BIBILIOTHEQUE DE TRAITEMENT D'IMAGE
REM ImageMagick http://www.imagemagick.org/
REM http://www.imagemagick.org/script/binary-releases.php
REM Windows Binary Release

REM SEBASTIEN CELLES
REM http://www.celles.net/

ECHO 'RECADRAGE (CROP) - ImageMagick'

REM echo "COPIE POUR TEST"
REM copy IM000592.JPG TEST.JPG
REM copy /y "..\5D - origin"\*.JPG .

REM mogrify -rotate 90 *.jpg

set /a img_width = 1536
set /a img_height = 2048

set /a x1 = 250
set /a y1 = 600
set /a x2 = %img_width%-x1
set /a y2 = 1500

echo (%x1%,%y1%)-(%x2%,%y1%)

set /a width = x2 - x1
set /a height = y2 - y1

echo width=%width%
echo height=%height%

REM mogrify -crop %width%x%height%+%x1%+%y1% TEST.JPG
mogrify -crop %width%x%height%+%x1%+%y1% *.JPG