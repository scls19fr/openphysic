OpenChrono est un chronomètre embarqué utilisable en karting mais également dans d'autres sports mécaniques.

Compilation
$ qmake openchrono.pro
$ make

Execution
$ bin/openchrono

Installation
$ ...


ToDo
====
icones dans un fichier icons.h

messages communs à plusieurs fenêtres dans un .h
 "Click Ok to enter... or Cancel..."

Log des temps au tour et pour chaque tour des temps par étapes
 Implémentation :
  QVector <Laptime> laptimes;
  Class Laptime :
   instant de passage sur la ligne de départ
   instants de passage sur les lignes intermédiaires (dans QVector ?)
   instant de passage sur la ligne d'arrivée
   (le tout dans un seul QVector ?)
   Méthode calculant (à partir des instants de passage) le temps au tour, les intermédiaires
   Pb : que faire du log de tous les temps si on change le nb d'intermédiaires ? -> Effacer ?

Lien entre le log des temps et une fenêtre de l'application (widget QTableWidget ou QTreeWidget)
Ajouter des icones sur les entêtes de colonnes
 Date / Time = calendrier
 Time = montre (clock.svg)
 Diff = icone +/-clock
Modifier largeur des colonnes
Enlever la marge autour du QTreeWidget (à cause du layout)
verticalLayout->setSpacing(0); // ne marche pas ;-)

Durée d'utilisation du moteur engine.h/.cpp engine_time.h/.cpp 

File de messages
 sortie sur MainWin->lblMessage (ticker) ou sur console
 instant où le message rentre dans la file et "durée de vie" du message
 méthode update qui permet d'enlever les messages
 méthode getMessage qui permet de récupérer le message à afficher

Alarmes pour températures

Dégradé (colormap) pour températures
Voir rapport de bug Trolltech QT à propos de la classe QGradient
Couleur pour froid : bleu
Couleur pour chaud : rouge
voir QTemperature

Log du RPM, des tempé...

Affichage des courbes (Qwt) RPM, tempé, vitesse calculée (via RPM), vitesse mesurée

Lien entre la fenêtre des temps et la fenêtre des courbes RPM, T...

QAccelerometer
 améliorer l'affichage (utilisation de dégradé, voir example OvenTimer dans livre QT4)
 mieux gérer position click -> gx,gy
  inversion de la matrice de transformation (matrix) au lieu des fonctions x_to_gx() et y_to_gy()
  voir aussi painter.setViewport()  painter.setWindow() mais avec des double (pas des int)
  voir file:///usr/share/qt4/doc/html/qmatrix.html
  file:///usr/share/qt4/doc/html/coordsys.html#window-viewport-conversion

Sauvegarde
 automatique toutes les x minutes
 à la fermeture de la session Linux
  QApplication OpenChrono : openchrono.h & .cpp
  void saveState(QSessionManager &sessionManager);
  void commitData(QSessionManager &sessionManager);

Done
====
2008-08-08
Interface utilisateur
 voir problème du redimensionnement
 Il faut associer un layout à la feuille
 On le fait dans le designer en faisant click droit sur la feuille puis Layout > Vertically