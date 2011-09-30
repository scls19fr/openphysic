Ce script Bash permet d'automatiser la protection de plusieurs PDF contre l'impression et ajoute (éventuellement) un filigrane (watermark).

Rem : si un fichier PDF gte.pdf (le filigrane) est présent il l'ajoute, sinon il se contente de protéger contre l'impression

Utilisation sous Windows :
placer le script dans un répertoire du PATH (ainsi que pdftk)
Lancer Cygwin (interpréteur Bash pour Windows)
Aller dans le répertoire contenant tous les pdf à protéger
(et comportant éventuellement le fichier pdf du filigrane)
Taper simplement
./pdfetu.sh