# phpMyAdmin MySQL-Dump
# version 2.2.6
# http://phpwizard.net/phpMyAdmin/
# http://www.phpmyadmin.net/ (download page)
#
# Serveur: localhost
# Généré le : Mardi 25 Mars 2003 à 22:35
# Version du serveur: 3.23.49
# Version de PHP: 4.2.0
# Base de données: `julliot_db`
# --------------------------------------------------------

#
# Structure de la table `maint_admin`
#

CREATE TABLE maint_admin (
  nom varchar(15) NOT NULL default '',
  email varchar(40) NOT NULL default '',
  ID int(2) NOT NULL auto_increment,
  PRIMARY KEY  (ID)
) TYPE=MyISAM COMMENT='admin de maintenance';


#
# Structure de la table `maint_divers`
#

CREATE TABLE maint_divers (
  ID int(11) NOT NULL auto_increment,
  nom varchar(10) NOT NULL default '',
  valeur int(5) NOT NULL default '0',
  KEY ID (ID)
) TYPE=MyISAM;

#
# Contenu de la table `maint_divers`
#

INSERT INTO maint_divers VALUES (1, 'jours', 30);
# --------------------------------------------------------

#
# Structure de la table `maint_password`
#

CREATE TABLE maint_password (
  nom char(15) NOT NULL default '',
  code char(10) NOT NULL default '',
  PRIMARY KEY  (nom),
  UNIQUE KEY nom_2 (nom),
  KEY nom (nom)
) TYPE=MyISAM;

#
# Contenu de la table `maint_password`
#

INSERT INTO maint_password VALUES ('admin', 'sambaedu');
# --------------------------------------------------------

#
# Structure de la table `maint_travaux`
#

CREATE TABLE maint_travaux (
  id int(10) NOT NULL auto_increment,
  nom varchar(30) NOT NULL default '',
  salle varchar(10) NOT NULL default '',
  poste varchar(10) NOT NULL default '0',
  probleme text NOT NULL,
  intervention text NOT NULL,
  intervenant varchar(15) NOT NULL default '',
  duree int(4) NOT NULL default '0',
  email varchar(30) NOT NULL default '',
  datedebut2 int(11) NOT NULL default '0',
  datefin2 int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

