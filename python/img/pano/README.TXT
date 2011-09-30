Ce script est réalisé en Python avec PIL (Python Imaging Library).
Il transforme une image (logo.gif) en un grand nombre d'images temp_xxxx.gif
qui montrent une vue réduite en largeur de logo.gif qui défile vers la droite.
Ensuite la commande "convert" d'ImageMagick est utilisée pour transformer la
succession d'images en une animation nommée animated.gif.
On peut jouer sur 2 paramètres dans le script Python :
 * Nb : le nombre de "tranches verticales" dans l'image.
 * Nbsize : le nombre de tranches nécessaire pour fabriquer une image.
On peut aussi jouer sur le paramètre -delay de la commande convert pour définir
le temps entre deux images pour fabriquer l'animation.
Comment voir l'animation ?
Ouvrir le fichier index.htm avec un navigateur (il contient une balise img vers l'animation)
Comment recréer l'animation ?
sous Linux/Unix taper
$ make
prérequis :
installer Python + PIL (Python Imaging Library)
installer ImageMagick
pour effacer les images temporaires taper :
$ make clean