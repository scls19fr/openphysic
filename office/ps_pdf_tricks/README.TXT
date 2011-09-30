Impression en livret
====================

avec les commandes psbook et psnup, du paquet psutils.
$ su
# apt-get install psutils


1) impression du document en format ps (impression dans un
fichier) --> in.ps

2) psbook in.ps | psnup -2 > out.ps
psbook -s$2 $1.ps | psnup -2 -pa4 > $1.book.ps 

ça prépare un fichier out.ps au format livret

3) Imprimer une page sur 2 de out.ps (impression pages impaires)
(voir psselect ?)

4) Retourner les pages imprimées, (ça dépend de l'imprimante, faire des essais avec un document de 5 pages A4)

5) Imprimes les pages paires

6) Plier en deux, agrafer, et voilà un joli livret.
