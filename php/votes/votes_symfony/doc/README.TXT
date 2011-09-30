Votes
=====
Réalisé d'après http://www.symfony-project.org/askeet/1_0/fr/1


Installation
============
Installer Apache2 / PHP
Copier la configuration du VirtualHost
 cp votes /etc/apache2/sites-available
Desactiver les autres Vhost
 a2dissite default
Activer le VHost pour cette application
 a2ensite votes
...
