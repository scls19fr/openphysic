:: Un script pour enregistrer/restaurer les permissions sur les fichiers et repertoires
:: redigé par fab
:: distribuable selon les termes de la FDL


Dans un souci de sécurisation, j'ai voulu faire différents essais sur les permissions de mon systeme. Il me fallait un moyen simple pour pouvoir revenir en arrière et je n'ai pas assez de Go libres pour pouvoir tout sauver... J'ai donc eu l'idée de ce script, il necessite uniquement une version convenable de perl.

Son utilisation :

./getrights > perms
(tapez ENTER une fois le programme executé)
Cela enregistre les droits et les utilisateurs pour le répertoire '/' récursivement dans "perms", regardez le début du script pour changer qques variables (pour ne pas TOUT sauvegarder par exemple). Sur mon systeme, 600ko son suffisant pour tout enregistrer.

./getrights < perms
Restaure les droits/utilisateurs/groupes pour tous les fichiers ki ont été placés dans "perms"