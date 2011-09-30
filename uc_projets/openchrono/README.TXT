Projet de chrono, mesure de température
Microcontrôleur
Afficheur LCD graphique
Boutons




Inspiré de Alphano dont voici les caractéristiques de certains modèles
http://www.alfano-usa.com
http://www.chrono-sport.fr (importateur pour la France)
http://www.alfano.be (manuel en français)
voir docs dans /media/graver/auto/sports_mecaniques/kart/alfano


"Le chronomètre Alfano PRO fonctionne grâce à un capteur fixé sur le plancher du kart qui détecte la présence du champ magnétique implanté dans la piste. Très utilisé pour les réglages des moteurs, il affiche également les régimes moteur ainsi que la température du moteur. Caractéristiques : - Mémoire de 98 tours. - Compte-tours (différentes lectures) Maximum 26.000 tr/m. - Affichage du meilleur tour, écart avec le meilleur tour, nombre de tours et temps total de roulage. - 5 Compteurs temps moteurs. - Température moteur Dimensions du Boîtier : 115 mm X 90 mm / Dimensions de l' Ecran : 86 mm X 35 mm. Poids : +/- 460 Gr Matériel inclus : 1 capteur magnétique 1 câble pour le capteur magnétique 1 Câble pour le compte-tours 3 Colsons noirs 1 Manuel ""mode d´emploi"" En option : Capteur de t° eau / Capteur de t° à la bougie / Emetteur et récepteur infrarouge"


"Caractéristques : - Temps au tour / meilleur temps - Configurable jusquÇà 6 partiels - Comparateur de temps (sur le meilleur temps, sur le temps précédent, sur le temps cible « configurable ») - RPM en lecture directe, Shift Lights et Bar Graph - 2 entrées de température (De 0°C à 1.500°C: Eau, Culasse, Bougie, Echappements, etcÄ) - Configuration de la température : Maximum, minimum pour chaque tour avec alarmes luminescentes - Vitesse (Configurable avec ou sans le capteur de roue) - Rapport de boîte jusqu'à 9 vitesses - 8 compteurs configurables - Simulation dÇun tour en temps réel, pendant 15 Minutes - Force G Latérale et Longitudinale - Fonctionne en infrarouge pour les pistes non équippées de la bande magnétique - Données de téléchargement à un PC par l'intermédiaire de stylo infrarouge USB - Système up-gradable Dimension du système : 123 x 104 mm Dimension écran : 85 x 49 mm Poids : +/- 425 Gr Batteries : 2 x AA "


Fonction à supporter impérativement
===================================
temps du tour
meilleur temps
dernier temps



Affichage
=========
Possible : LCD (alphanumérique ou graphique ?)
alphanumérique : bien supporté par WinAVR et VMLAB HD44780 http://www.nongnu.org/avr-libc/user-manual/group__stdiodemo.html
mais
graphique car plus joli et plus facile à faire évoluer...

si LCD alpha

20 colonnes ; 2 lignes

12345678901234567890

PAGE TEMPS
12345678901234567890

01:30:123 01:28:540
01:29:123 LST+1:000

ZONE1     ZONE2
ZONE3     ZONE4

ZONE1=temps du tour (current_time)
ZONE2=meileur temps (best_time)
ZONE3=dernier temps (last_time)
ZONE4
 + ou - ou = : comparaison avec dernier temps (LST) ou avec le meilleur (BST)
      00:00:000
 ex : BST= LST+ (sans calcul de la différence de temps)
 ex : BST=

PAGE RESULT SUM
1234567890123456789012345

01 01:30:123 L+ B+
02 01:30:123 L+ B+

PAGE RESULT COMP LAST
01 01:30:123L+1:000
02 01:30:123L+1:000

PAGE RESULT COMP BEST
01 01:30:123B+1:000
02 01:30:123B+1:000



Attention on trouve pas mal de LCD alphanumérique en 16x2 !!! mais aussi des 20x2 ou 20x4 ???


possibilité de tester le LCD avec lcdproc http://lcdproc.omnipotent.net
This is a client/server suite including drivers for all kinds of
nifty LCD displays. The server supports several serial devices: Matrix
Orbital, Crystal Fontz, Bayrad, LB216, LCDM001 (kernelconcepts.de),
Wirz-SLI and PIC-an-LCD; and some devices connected to the LPT port:
HD44780, STV5730, T6963, SED1520 and SED1330. As of 0.4.4 some USB
displays are also supported by the drivers CFonz633, CwLnx, and USBLCD.

Samsung KS0108
Hitachi HD61202

http://www.matrixorbital.com

Taille autour de 85x49mm (un pixel = 0,48x0.48mm)

voir docs dans /media/graver/sciences/programmation/microcontroleurs/display_7seg_lcd_graph/


Envoyer un bitmap à un LCD
http://www.amontec.com/lcd_nokia_3310.shtml
[WISH] Transformer un bitmap en tableau (array) C
GIMP http://bugzilla.gnome.org/show_bug.cgi?id=353521
--> Exporter en tant que fichier .xbm (X11 Bitmap = Image Bitmap X)
ImageMagick convert : à faire http://www.imagemagick.org


Bibliothèque permettant de gérer les menus

Quelques bibliothèques à envisager :
 Liste : http://forums.jelectronique.com/ftopic104.php
 
AVR-libc http://www.nongnu.org/avr-libc/
AVRLib http://hubbard.engr.scu.edu/embedded/avr/avrlib/
AVR Snapshot http://zer0.droids-corp.org/fr/avr.php
VinceVG http://anyedit.free.fr/
Peter Fleury http://homepage.hispeed.ch/peterfleury/
Embedded FileSystem Library http://sourceforge.net/projects/efsl


Attention au domaine de température d'utilisation du LCD !!! (surtout l'été !!!)


Choix final : 


Affichage à compléter avec des LEDs (vert jaune rouge)
- pour compte-tours (total 10)
  lent   2 LED vertes
  moyen  4 LED jaunes
  rapide 4 LED rouges

- autres (à définir)
  passage de 1 LED rouge (clignotante)
  meilleur temps 1 LED verte (clignotante)




Clavier
=======
2 boutons (OK et CANCEL)
et un bouton joystick à 4 positions (gauche, droite, haut, bas)
permettront de se déplacer dans les pages, menus, etc...

Idée d'interface
des pages différentes que l'on peut faire défiler par gauche/droite
on rentre dans une page par OK pour des faire modifications
et on quite les modifs
 
Interruption externe ou pas ?
Astuce : brancher les boutons entre la masse et PBx pour récupérer l'état de chaque touche
mais on utilise une interruption externe pour déclencher lors de l'appui d'une touche
voir : http://forums.jelectronique.com/ftopic3760.php&sid=3735f95c7f0de511b3825bbf68867b53
OU logique entre les 6 entrées dont la sortie va sur une interruption. 
de simple diodes suffisent amplement pour faire un ou
on peut mettre toutes les ( 6) anodes communes et les relier à l'entrée interruption et chaque cathode relier à une touche et la touche relier à la masse.
chaque touche appuyée forcera l'entrée interruption à la masse. 


Microcontrôleur
===============
PIC ou ATMEL AVR ou ARM ou ...
Prévoir de la mémoire pour pouvoir stocker des données

PIC
 + beaucoup de doc en français
 - compilateur C gratuit limité

ATMEL AVR
 + quelques exemples avec ATméga sur GNU/Linux Mag France
 + compilateur C gcc-avr
 + prix
 - limité (?)

ARM
 + cross-compilation facile avec Scratchbox
 + possibilité de mettre un noyau Linux embarqué (voir uclibc ...)
 - prix !!!


Choix final :


Alimentation
============
Choix final :


Timer
=====
On utilisera une interruption générée par un timer
voir : http://forums.jelectronique.com/ftopic3761.php&sid=3735f95c7f0de511b3825bbf68867b53
voir : http://www.jelectronique.com/pwm.php

Capteurs
========
Quelques références sur les capteurs
http://www.u-electronique.com/annuaire/cours_6.php

Sonde à effet Hall
------------------
Capteur LEM ?
Choix final : 

Interruption externe (INT0 sur PD2) via AO comparateur 0 5V


Régime moteur
=============
Capteur inductif => tension induite en forme de pics => mise en forme du signal

Choix final :

Convertisseur analogique-numérique intégré au microcontrôleur



Sonde température
-----------------
Résistance ? Thermocouple ? Composant spécialisé : LM335

Choix final : 

Convertisseur analogique-numérique intégré au microcontrôleur




Accéléromètre
-------------
Mesure de l'accélération latérale (G/D)
Mesure de l'accélération/décélération (AV/AR)
Choix final :


Convertisseur analogique-numérique intégré au microcontrôleur


Fonctionnalités supplémentaires (pas implanté dans un premier temps)
===============================
Temps partiels
data-logger
 temps par tours
 temps intermédiaires
 RPM=f(t)
 T°1=f(t)
 T°2=f(t)
 acc_frontale=f(t)
 acc_laterale=f(t) 
WIFI (pour envoyer les temps) ou Infra-Rouge
clé USB (pour récupérer les données) ou écriture sur carte MMC, SD ou CF
coupure à distance du kart
reflashage facile du microcontroleur voir In Situ Programming ISP... par port série mais l'idéal serait par USB... voir si c'est possible !!!)



Utilisation des ports
=====================
ATMEL AVR ATmega8535 PDIP
voir doc2502.pdf

PB0.............KEYPAD OK
PB1.............KEYPAD CANCEL
PB2.............KEYPAD LEFT
PB3.............KEYPAD RIGHT
PB4.............KEYPAD UP
PB5.............KEYPAD DOWN
PB6.............
PB7.............
~RESET..........
VCC.............+5V
GND............. 0V
XTAL2...........
XTAL1...........
PD0.............RXD
PD1.............TXD
PD2(INT0).......SONDE DE HALL
PD3(INT1).......KEYPAD (OR with DIODES)
PD4.............
PD5.............
PD6.............

PA0.............ADC0 RPM
PA1.............ADC1 TEMP
PA2.............ADC2
PA3.............ADC3
PA4.............ADC4
PA5.............ADC5
PA6.............ADC6
PA7.............ADC7
AREF............+5V
GND............. 0V
AVCC............
PC7.............LED RPM 8/8 (10)
PC6.............LED RPM 7/8 (10)
PC5.............LED RPM 6/8 (10)
PC4.............LED RPM 5/8 (10)
PC3.............LED RPM 4/8 (10)
PC2.............LED RPM 3/8 (10)
PC1.............LED RPM 2/8 (10)
PC0.............LED RPM 1/8 (10)
PD7.............

Abandonné car pas assez de ports pour un LCD parallèle (et le reste)


nouveau choix ATmega128



TO DO
=====
+ timer
- ou sur clavier INT1 (PD3)
- LCD
+ separation du code
- écart temps

projet temporairement cassé (changement de uc ATmega8535 vers ATmega128)
faire modifications pour les pb d'interruptions
modif conv analogique->numérique

traiter les signaux visuels (led_alarm) et auditif (beep) en dehors des interruptions
(afin de ne pas ralentir le chrono)



Hardware
========
uc ATMEL AVR ATmega8535
Diodes 1N4148 (*6)
LCD caractère type HD44780 (2 lignes et 19 colonnes au mini - 17 à la rigueur)
74HC164 (parallèle->serie)


Menus
=====
title 

time
reset_time
engine_menu
 engine_select
 engine_stroke
 engine_reset_time
track_menu
 ...
recall_menu

time
 page principale permettant de visualiser le temps en cours, le meilleur temps, le dernier temps, le régime moteur
 Action :
  Ok : rien
  Cancel :
  Droite : engine_menu
  Gauche : recall_menu

reset_time
 Message : Reset time (y/n ?)
 Action : efface les meilleurs temps et derniers temps

engine_menu
 Message : Engine menu
 Action :
  Ok -> engine_select
  Cancel -> time

engine_select
 Action : choix du moteur n° xx

engine_stroke
 Action : choix du type de moteur (2 temps ou 4 temps) pour le moteur xx

engine_reset_time
 Action : effacer le totaliseur d'heure du moteur xx

track_menu
 Action : nombre de temps intermédiaires sur un tour de circuit

recall_menu
 Action : rappeler les derniers temps



