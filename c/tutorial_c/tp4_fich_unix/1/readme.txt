Compilation séparée
===================
créer la fonction copie_fichier dans un fichier copier_fichier.c
gcc -c copier_fichier.c
 => copie_fichier.o

créer la fonction main dans copier.c

gcc copier.c copier_fichier.o -o copier

Avantage : pas de recompilation de copie_fichier.o

Arguments sur la ligne de commande
==================================
int main(int argc, char * argv[])
argc : nb d'arguments (nom de l'executable compris)

Fichiers
========
open/creat/read/write/close : Unix
<>
fopen ...

Aleatoire
=========
rand() 0 et RAND_MAX


Makefile
========
voir exemple
compilation avec : "make all"
voir comment ne pas spécifier all
