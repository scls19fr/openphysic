#!/bin/sh
# Un script pour photocopier
# ==========================
# $ scanimage --version
# scanimage (sane-backends) 1.0.14; backend version 1.0.13

# Definir le nom du fichier temporaire et du repertoire
format=pnm # format de fichier
filename=image`ps |tail -n1 |awk '{print $1}'`.$format #imagexxxxx.pnm
directory=~/scanner # ce repertoire doit avoir été créé avec mkdir
# ~ designe le repertoire /home/utilisateur_actuel

# Scanner et sauvegarder dans le fichier temporaire
#scanimage -x 215 -y 297 --format=pnm --resolution=300  --mode Gray >/tmp/$name

device=hp5400:libusb:001:003 # obtenir la liste des scanners avec scanimage --list-device

scanimage -x 215 -y 297 --device-name=$device --format=$format >$directory/$filename

# Imprimer le fichier temporaire
#lpr $directory/$filename

# Effacer le fichier temporaire
#rm $directory/$filename 