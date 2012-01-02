Compilateur : SWI Prolog

1) Utilisation interactive mode console :

$ swipl

?- assertz(parent(tom, bob)).
true.

% "assertz" remplace "assert"
% voir aussi "asserta"

?- parent(tom, X).
X = bob.

Rem : pour supprimer un fait utiliser retrait
?- retract(parent)

2) utilisation en mode interactif après chargement depuis un fichier (main.pl)
$ swipl

?- consult(main).

ou

?- consult('main.pro').


3) Utilisation en mode non interactif
Edition fichier main.pl
Compilation:
  swipl -s main.pl


Remarques:
% Afficher le contenu de la base de faits de Prolog
?- listing.

% Aide
?- help(Topic).
?- apropos(Word).

% Editeur de texte : Emacs
?- emacs.

% Sauver des faits (rentré en intéractif)
tell('save.pro'), listing, told. 

% Quitter Prolog
?- halt.


Xabc = variable
xabc = atom