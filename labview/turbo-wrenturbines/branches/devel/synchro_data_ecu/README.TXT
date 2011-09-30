http://www.celles.net/wiki/ProjetInstrumentationTurboreacteur

========

Synchronisation liaison série (cable Xicoy USB)
Permet de récupérer RPM, EGT, ...

http://www.espiell.com/fadprot.pdf


Actuellement la synchro fonctionne ainsi :
- lecture de 50 octets
- observation des 2 premiers octets, si ça n'est pas 252 - 253 en tête
on demande une lecture de 1 octet (afin de faire un décalage) puis
on recommence en lisant 50 octets.
- si on a bien 252-253 en tête on découpe la chaine et on fabrique le
cluster contenant les données

Je pense qu'il faudrait essayer detecter le début de la trame et
déduire l'offset (décalage) c'est à dire
la position du début de la trame entière dans l'ensemble de ces 100 octets.
et ensuite récupérer les données à partir de ce décalage.

J'ai fait un exemple minimaliste qui décrit cette idée
J'ai considéré dans mon exemple que le début d'une trame est marqué
par les caractères "üý" (FC -FD en hexa ou 252 - 253 en décimal)
N'ayant pas le turbo chez moi j'ai généré un exemple de trame avec
turbo-wrenturbines\tags\2008-04-02\test_sim_turbo.vi
J'ai collé deux trames et je les ai décalé vers la droite. Le début
d'une trame commence dans mon exemple au 4ième octet (en comptant à
partir de 0).

Le programme synchro.vi détecte bien le début
de la trame en 4ième position.

========

Autre idée... ne lire que 50 octets (longueur d'une trame)
mais utiliser la fonction modulo
on aura ainsi l'impression d'avoir une seule trame mais en fait
ça sera la fin d'une trame et le début de la suivante


========
Autre idée... 
considérer que le FC FD de "début" de trame est en fait 2 caractères
de "fin" de trame
Utiliser une fonction Labview de lecture jusqu'à un caractère de fin de trame