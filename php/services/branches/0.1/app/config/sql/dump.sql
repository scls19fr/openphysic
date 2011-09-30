#App sql generated on: 2009-08-16 19:10:04 : 1250442604

DROP TABLE IF EXISTS `services_filieres`;
DROP TABLE IF EXISTS `services_groups`;
DROP TABLE IF EXISTS `services_matieres`;
DROP TABLE IF EXISTS `services_matieres_persos`;
DROP TABLE IF EXISTS `services_persos`;
DROP TABLE IF EXISTS `services_statuts`;
DROP TABLE IF EXISTS `services_users`;
DROP TABLE IF EXISTS `services_vue_filieres_combles_besoins`;
DROP TABLE IF EXISTS `services_vue_filieres_restants_besoins`;
DROP TABLE IF EXISTS `services_vue_filieres_total_besoins`;
DROP TABLE IF EXISTS `services_vue_matieres_combles_besoins`;
DROP TABLE IF EXISTS `services_vue_matieres_restants_besoins`;
DROP TABLE IF EXISTS `services_vue_matieres_total_besoins`;
DROP TABLE IF EXISTS `services_vue_persos_bilan_services`;


CREATE TABLE `services_filieres` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`nb_gr_td` int(10) DEFAULT 0 NOT NULL,
	`nb_gr_tp` int(10) DEFAULT 0 NOT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_groups` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`created` datetime DEFAULT NULL,
	`modified` datetime DEFAULT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_matieres` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`h_cours` float DEFAULT 0 NOT NULL,
	`h_td` float DEFAULT 0 NOT NULL,
	`h_tp` float DEFAULT 0 NOT NULL,
	`filiere_id` int(10) DEFAULT 0 NOT NULL,
	`commentaire` varchar(50) NOT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_matieres_persos` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`perso_id` int(10) DEFAULT 0 NOT NULL,
	`matiere_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT 0 NOT NULL,
	`h_td` float DEFAULT 0 NOT NULL,
	`h_tp` float DEFAULT 0 NOT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_persos` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`initiales` varchar(10) NOT NULL,
	`nom` varchar(50) NOT NULL,
	`prenom` varchar(50) NOT NULL,
	`statut_id` int(10) DEFAULT 0 NOT NULL,
	`permanent` tinyint(1) DEFAULT 0 NOT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_statuts` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`nom` varchar(50) NOT NULL,
	`h_statut` float DEFAULT 0 NOT NULL,
	`h_sup_max` float DEFAULT 0 NOT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_users` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`password` varchar(40) NOT NULL,
	`group_id` int(11) DEFAULT 0 NOT NULL,
	`created` datetime DEFAULT NULL,
	`modified` datetime DEFAULT NULL,
	`perso_id` int(10) DEFAULT 0 NOT NULL,
	`role` varchar(50) DEFAULT 'www',	PRIMARY KEY  (`id`),
	UNIQUE KEY `username` (`username`));

CREATE TABLE `services_vue_filieres_combles_besoins` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`filiere_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT NULL,
	`h_td` float DEFAULT NULL,
	`h_tp` float DEFAULT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_vue_filieres_restants_besoins` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`filiere_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT NULL,
	`h_td` float DEFAULT NULL,
	`h_tp` float DEFAULT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_vue_filieres_total_besoins` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`filiere_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT NULL,
	`h_td` float DEFAULT NULL,
	`h_tp` float DEFAULT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_vue_matieres_combles_besoins` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`matiere_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT NULL,
	`h_td` float DEFAULT NULL,
	`h_tp` float DEFAULT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_vue_matieres_restants_besoins` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`matiere_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT NULL,
	`h_td` float DEFAULT NULL,
	`h_tp` float DEFAULT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_vue_matieres_total_besoins` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`matiere_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT 0 NOT NULL,
	`h_td` float DEFAULT 0 NOT NULL,
	`h_tp` float DEFAULT 0 NOT NULL,	PRIMARY KEY  (`id`));

CREATE TABLE `services_vue_persos_bilan_services` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`perso_id` int(10) DEFAULT 0 NOT NULL,
	`h_cours` float DEFAULT NULL,
	`h_td` float DEFAULT NULL,
	`h_tp` float DEFAULT NULL,	PRIMARY KEY  (`id`));

