#!/usr/bin/perl
#
# Fichier de test de CGI Perl
# ===========================
#
#  Installer le serveur Web (Apache)
#
#  Vérifier que le module Perl d'Apache est installé
#
#  Copier le fichier de test
#   cp test.cgi /usr/lib/cgi-bin (Debian)
#    ou
#   cp test.cgi /var/www/perl (Debian)
#    ou
#   cp test.cgi /var/www/cgi-bin (Redhat)
#
#  Vérifier les droits sur le fichier (chmod)
#
#  Vérifier l'interpréteur perl (pas de pb de répertoire)
#
#  Vérifier le script en lançant /usr/bin/perl test.cgi
#
#
#  Ouvrir la page http://127.0.0.1/perl/test.cgi
#
print <<EOF;
Content-type: text/html

<html>
    <head>
    <title>Test GUI</title>
    </head>
    <body>
    <h1>Test CGI</h1>
    </body>
</html>
EOF
