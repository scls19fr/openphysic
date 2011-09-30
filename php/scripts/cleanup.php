<?php

/*
Ce script permet de faire le ménage dans le wiki...
attention penser à faire un dump de la base avant....

Usage:
http://www.celles.net/php/cleanup.php

*/

$active = true; // true=actif false=inactif


$dbhost = 'XXXXX';
$dbuser = 'XXXXX';
$dbpass = 'XXXXX'; 
$dbname = 'XXXXX';


print "<h1>Script de nettoyage du wiki Wikkawiki</h1>"."\n";

if (!$active) {
	print '<div style="color: #FF0000;">Script inactif</div>';
	exit;
}

$db = mysql_connect($dbhost, $dbuser, $dbpass);
if (!$db) {
    print 'Could not connect to mysql';
    exit;
}
mysql_select_db($dbname, $db);

// Dump de la base avant nettoyage

// La requete $query est réalisée si $do=true
// Un message est affiché afin d'indiquer le rôle de cette requête
function action($msg, $query, $do) {
	print "<h2 style=\"color: #000090;\">$msg</h2>"."\n";
	print "<h3 style=\"color: #909090;\">$query</h3>"."\n";
	if ($do) {
		$status = mysql_query("$query");
		if ($status) {
			print '<div style="color: #00FF00;">Fait</div>'."\n";
		} else {
			print '<div style="color: #FF0000;">Echec : '.mysql_error().'</div>'."\n";
			//die();
		}
	} else {
			print '<div style="color: #EB7F10;">Non demand&eacute;</div>'."\n";		
	}
}

/*
$msg = "";
$query = '';
action($msg, $query);
*/

$msg = "Suppression des utilisateurs autres que s.celles@gmail.com";
$query = 'DELETE FROM `wikka_users` WHERE `email` LIKE "%@gmail.com" AND `email` <> "s.celles@gmail.com"';
action($msg, $query, true);

$msg = "Supprimer les anciennes versions des pages";
$query = 'DELETE FROM `wikka_pages` WHERE `latest` = "N"';
action($msg, $query, false);

$msg = "Vider la table des referrers";
$query = 'DELETE FROM `wikka_referrers`';
action($msg, $query, true);

$msg = "Vider la table des sessions";
$query = 'DELETE FROM `wikka_sessions`';
action($msg, $query, true);

$msg = "Optimisation de toutes les tables";
$query = 'OPTIMIZE TABLE `wikka_acls`, `wikka_comments`, `wikka_links`, `wikka_pages`, `wikka_referrers`, `wikka_referrer_blacklist`, `wikka_sessions`, `wikka_users`';
action($msg, $query, true);

/*

====== [[Administration]] de Wiki (Wikini ou Wikka) ======
Voici quelques opérations [[SQL]] à réaliser pour le bon fonctionnement de WikiNi ou Wikka

===== Supprimer le spam de referrers =====
Dans phpMyAdmin cliquer sur vider la table wikini_referrers
##TRUNCATE TABLE `wikka_referrers`##
voir http://www.wikini.net/wakka.php?wiki=FiltrerLeSpamDesReferrers

Le spam des referrers utilise souvent la page RechercheTexte on peut enlever tous les referrers utilsant cette page

##DELETE FROM `wikka_referrers` WHERE `page_tag` LIKE 'RechercheTexte';##
##OPTIMIZE TABLE `wikka_referrers`;##

au pire

##DELETE FROM `wikka_referrers`##

===== Supprimer les anciennes versions des pages =====
Les différentes éditions d'une page sont stockées dans la table wikka_pages
On peut supprimer toutes les versions intermédiaires.
Il est souvent nécessaire d'optimiser la table pour récupérer l'espace perdu.

##DELETE FROM `wikka_pages` WHERE `latest` = "N";##
##OPTIMIZE TABLE `wikka_pages`;##

===== Autres commandes MySQL =====
==== Voir toutes les autorisations des commentaires ====
##SELECT * FROM `wikka_acls` WHERE `privilege` LIKE "comment"##
==== Voir tous les utilisateurs dont le mail fini par gmail.com ====
##SELECT * FROM `wikka_users` WHERE `email` LIKE "%@gmail.com"##
##SELECT * FROM `wikka_users` WHERE `email` LIKE "%@gmail.com" AND `email` <> "s.celles@gmail.com"##
==== Empécher les commentaires ====
##UPDATE `wikka_acls` SET `list`="" WHERE `privilege`="comment" ##

===== Anti spam =====
Suppression des comptes dont
 - le login est toujours composé de 6 caractères
 - email = login@gmail.com
Exemple : Kc5Dzg  	d7b25e956c363ce79bfd1c11db9f262a  	Kc5Dzg@gmail.com  	   	20  	50  	Y  	2007-07-10 19:20:43  	N
%%SELECT * FROM `wikka_users`where name like '______' and email = concat(name, '@gmail.com') and show_comments = 'N'  and revisioncount = 20 and changescount = 50 and doubleclickedit = 'Y' LIMIT 0, 200%%

%%SELECT * FROM `wikka_users`where email LIKE "%@list.ru"%%

%%SELECT * FROM `wikka_users`where email LIKE "%@gmail.com" AND email<>"s.celles@gmail.com"%%

===== Vider la table des sessions =====
##DELETE FROM `wikka_sessions`##

===== Optimiser toutes les tables =====
##OPTIMIZE TABLE `wikka_acls`, `wikka_comments`, `wikka_links`, `wikka_pages`, `wikka_referrers`, `wikka_referrer_blacklist`, `wikka_sessions`, `wikka_users`##

voir aussi : WikiNiDevel

----
CategoryAdmin

*/
          
?>