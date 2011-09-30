#!/bin/bash
format=png
filename=out
directory=~/scanner

device=hp5400:libusb:001:003 # obtenir la liste des scanners avec scanimage --list-device

scanimage -x 215mm -y 297mm --resolution 75 --device-name $device > $directory/$filename.$format


# On peut facilement faire un scanner réseau
# en rajoutant
# Dans Samba /etc/smb.conf
#[scanner]
#	path = /home/scls/scanner
#	read only = No
#	guest ok = Yes