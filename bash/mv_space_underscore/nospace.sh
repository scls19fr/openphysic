#!/bin/sh

#____________________________________________________________________
# Script inspire par D. Sanz, Mac OS X, le livre des secrets,
# p. 160 sqq, Paris, 2004
# NOSPACE v 0.1
#____________________________________________________________________

# Ce script remplace les espaces des noms de fichiers
# par des tirets "_"
# ce qui est tres utile pour certaines commandes Unix
# sa syntaxe est la suivante:
# nospace "nom du fichier"
# nospace *     pour tous les fichiers du repertoire courant
# nospace *xxx  pour les fichiers d'un type particulier
# par exemple: nospace *rtf

##
# debut
##

if [ $# -eq 0 ]; then
    echo "SYNTAXE: $(basename $0) [nom du fichier]." >&2
    echo "$(basename $0) [*] pour tous les fichiers du répertoire courant." >&2
    echo "$(basename $0) [*xxx] pour les fichiers d'un type particulier." >&2
    echo "Exemple: $(basename $0) *rtf " >&2
    exit 1
fi

# Pour que le shell reconnaisse les espaces dans les noms de fichiers
# et ne les prenne plus pour des separateurs, il faut modifier le
# separateur standard espace en le remplacant par RETURN:
IFS='
'

# Nous utilisons la variable $@ qui contient tous les noms de fichiers
# et leur attribuons la variable "oldname"
for oldname in $@;
        do

# La commande "wc -w" compte les mots dans le nom du fichier
# pour savoir s'il comporte une espace
if [ "`echo $oldname | wc -w`" -gt 1 ]; then

# Compose le nouveau nom avec _ a la place des espaces
        newname=`echo "$oldname" | tr -s ' ' '_'`

# Si un fichier du même nom existe deja
        if [ -f "$newname" ]; then
                echo "ERREUR: le fichier $newname existe deja"
        else
                echo "$oldname est renomme $newname"
                mv "$oldname" "$newname"
        fi
fi
done
exit