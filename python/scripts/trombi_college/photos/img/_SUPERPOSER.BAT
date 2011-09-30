@echo off

REM SUPERPOSER LES IMAGES (POUR SAVOIR COMMENT RECADRER)
REM CE SCRIPT NECESSITE L'INSTALLATION DE LA BIBILIOTHEQUE DE TRAITEMENT D'IMAGE
REM ImageMagick http://www.imagemagick.org/
REM http://www.imagemagick.org/script/binary-releases.php
REM Windows Binary Release

REM SEBASTIEN CELLES
REM http://www.celles.net/

ECHO 'SUPERPOSER - ImageMagick'

del temp?.jpg
del superposition.jpg

set /a i = 0
set /a num_photo = 592
set /a nb_photo = 3


REM set /a num += 1
REM set /A num = %num% + 1

REM echo IM%num%
echo %i%

composite -dissolve 50.0000% IM000592.jpg IM000593.jpg temp1.jpg
composite -dissolve 75.0000% temp1.jpg IM000594.jpg temp2.jpg

copy temp1.jpg superposition.jpg