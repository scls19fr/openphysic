Créer dans le home deux liens symboliques
ln -s profile ~/.profile
ln -s profile ~/.bashrc

Script AppleScript mountsmb.app
Montage de répertoires Samba depuis Mac OS X

try
    mount volume "smb://ccti@192.168.0.2/doc_ccti"
end try

try
    mount volume "smb://192.168.0.2/public"
end try

try
    mount volume "smb://192.168.0.2/photo"
end try

Lancement automatique du script au démarrage
de la session d'un utilisateur
Préférences Système / Comptes / Mon compte / Ouverture
