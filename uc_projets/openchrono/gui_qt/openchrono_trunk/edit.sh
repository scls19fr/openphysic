#!/usr/bin/env bash

#EDITOR=gedit # GNOME Editor
EDITOR=kate # KDE Editor
#EDITOR=editor
# use galternatives to select your
# alternative for editor
# (or make symbolic link by yourself)

#FILES="README.TXT *.pro src/*.h src/*.cpp"
FILES="README.TXT *.pro src/main.cpp "
#FILES+="src/*.h src/*.cpp"

for f in src/*.h
do
FILES+=$f
FILES+=" "
if [ -f src/$(basename $f .h).cpp ]; then # tester si le fichier .cpp associé au .h existe
FILES+=src/$(basename $f .h).cpp
FILES+=" "
fi
done

#ToDo : ajouter les autres fichiers .cpp (qui n'ont pas de .h associé)

#echo $FILES
$EDITOR $FILES &
