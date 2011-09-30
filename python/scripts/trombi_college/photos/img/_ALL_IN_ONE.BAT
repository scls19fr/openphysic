@echo off

REM ROTATION 90 + RECADRAGE DES IMAGES
REM CE SCRIPT NECESSITE L'INSTALLATION DE LA BIBILIOTHEQUE DE TRAITEMENT D'IMAGE
REM ImageMagick http://www.imagemagick.org/
REM http://www.imagemagick.org/script/binary-releases.php
REM Windows Binary Release

REM SEBASTIEN CELLES
REM http://www.celles.net/

REM Laisser les images d'origine dans le répertoire 5D - origin

echo "NETTOYAGE"
del *.JPG

echo "COPIE DES IMAGES"
copy IM000592.JPG TEST.JPG
copy /y "..\5D - origin"\*.JPG .


ECHO 'ROTATION 90'
mogrify -rotate 90 *.jpg


ECHO 'RECADRAGE (CROP) - ImageMagick'

set /a img_width = 1536
set /a img_height = 2048

set /a x1 = 250
set /a y1 = 600
set /a x2 = %img_width%-x1-150 REM DECALAGE HORIZONTAL
set /a y2 = 1500

echo (%x1%,%y1%)-(%x2%,%y1%)

set /a width = x2 - x1
set /a height = y2 - y1

echo width=%width%
echo height=%height%

REM mogrify -crop %width%x%height%+%x1%+%y1% TEST.JPG
mogrify -crop %width%x%height%+%x1%+%y1% *.JPG