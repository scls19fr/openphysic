@echo off

REM ROTATION DE 900 DES IMAGES
REM PENSER A CONSERVER UNE COPIE DES IMAGES AVANT DE LANCER CE SCRIPT BATCH
REM CE SCRIPT NECESSITE L'INSTALLATION DE LA BIBILIOTHEQUE DE TRAITEMENT D'IMAGE
REM ImageMagick http://www.imagemagick.org/
REM http://www.imagemagick.org/script/binary-releases.php
REM Windows Binary Release

REM SEBASTIEN CELLES
REM http://www.celles.net/

ECHO 'ROTATE 90 - ImageMagick'

mogrify -rotate 90 *.jpg

REM FOR %%a in (*.jpg) DO convert %%a -rotate 90 NEW_%%a