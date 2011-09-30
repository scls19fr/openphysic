-- phpMyAdmin SQL Dump
-- version 2.11.7.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 17 Août 2009 à 17:56
-- Version du serveur: 5.0.41
-- Version de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `services`
--

-- --------------------------------------------------------

--
-- Structure de la table `services_filieres`
--

CREATE TABLE `services_filieres` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `nb_gr_td` int(10) unsigned NOT NULL default '0',
  `nb_gr_tp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `services_filieres`
--

INSERT INTO `services_filieres` VALUES(1, 'S1', 4, 8);
INSERT INTO `services_filieres` VALUES(2, 'S2', 4, 8);
INSERT INTO `services_filieres` VALUES(3, 'S3', 4, 8);
INSERT INTO `services_filieres` VALUES(4, 'S4_PE', 4, 8);
INSERT INTO `services_filieres` VALUES(5, 'S4_LP', 1, 1);
INSERT INTO `services_filieres` VALUES(6, 'S4_IPI', 1, 1);
INSERT INTO `services_filieres` VALUES(7, 'S1_APP', 1, 1);
INSERT INTO `services_filieres` VALUES(8, 'S2_APP', 1, 1);
INSERT INTO `services_filieres` VALUES(9, 'S3_APP', 1, 1);
INSERT INTO `services_filieres` VALUES(10, 'S4_APP', 1, 1);
INSERT INTO `services_filieres` VALUES(11, 'LP_VERTE', 1, 1);
INSERT INTO `services_filieres` VALUES(12, 'ADMIN', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `services_groups`
--

CREATE TABLE `services_groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `services_groups`
--

INSERT INTO `services_groups` VALUES(1, 'administrators', '2009-08-07 11:21:27', '2009-08-07 11:21:27');
INSERT INTO `services_groups` VALUES(2, 'users', '2009-08-07 11:42:15', '2009-08-07 11:42:15');

-- --------------------------------------------------------

--
-- Structure de la table `services_matieres`
--

CREATE TABLE `services_matieres` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `h_cours` float NOT NULL default '0',
  `h_td` float NOT NULL default '0',
  `h_tp` float NOT NULL default '0',
  `filiere_id` int(10) unsigned NOT NULL default '0',
  `commentaire` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=118 ;

--
-- Contenu de la table `services_matieres`
--

INSERT INTO `services_matieres` VALUES(101, 'Mesure, mÃ©trologie', 0, 0, 0, 7, '');
INSERT INTO `services_matieres` VALUES(100, 'MÃ©canique - PDM', 0, 38, 0, 7, '');
INSERT INTO `services_matieres` VALUES(99, 'MathÃ©matiques', 0, 60, 0, 7, '');
INSERT INTO `services_matieres` VALUES(98, 'Langue', 0, 26, 0, 7, '');
INSERT INTO `services_matieres` VALUES(97, 'Informatique (VB)', 1.5, 6, 12, 7, '');
INSERT INTO `services_matieres` VALUES(96, 'Informatique (bureautique)', 0, 0, 16, 7, '');
INSERT INTO `services_matieres` VALUES(95, 'ElectricitÃ©', 0, 40, 20, 7, '');
INSERT INTO `services_matieres` VALUES(94, 'Communication, mÃ©thodologie', 0, 26, 0, 7, '');
INSERT INTO `services_matieres` VALUES(93, 'Bureau d''Ã©tudes', 0, 0, 32, 7, '');
INSERT INTO `services_matieres` VALUES(92, 'Thermique des locaux', 0, 18, 0, 2, '');
INSERT INTO `services_matieres` VALUES(91, 'Bureau d''Ã©tudes (Logitrace)', 0, 0, 8, 1, '');
INSERT INTO `services_matieres` VALUES(90, 'Tech Mach Therm (Moteur)', 0, 4, 12, 1, '');
INSERT INTO `services_matieres` VALUES(89, 'Tech Mach Therm (Foyers)', 0, 6, 12, 1, '');
INSERT INTO `services_matieres` VALUES(88, 'Environnement', 4.5, 8, 0, 2, '');
INSERT INTO `services_matieres` VALUES(87, 'Thermique des locaux (RT)', 0, 0, 20, 2, '');
INSERT INTO `services_matieres` VALUES(86, 'Informatique (Excel)', 0, 0, 16, 1, '');
INSERT INTO `services_matieres` VALUES(85, 'Autocad', 0, 0, 24, 1, '');
INSERT INTO `services_matieres` VALUES(84, 'Epr facultative : langue 2', 0, 0, 0, 2, '');
INSERT INTO `services_matieres` VALUES(83, 'Epr facultative : sport', 0, 0, 0, 2, '');
INSERT INTO `services_matieres` VALUES(82, 'Electrothermie', 3, 8, 12, 2, '');
INSERT INTO `services_matieres` VALUES(81, 'Techniques du gÃ©nie thermique (atelier)', 0, 0, 24, 2, '');
INSERT INTO `services_matieres` VALUES(80, 'Thermique des locaux (bat)', 0, 0, 12, 2, '');
INSERT INTO `services_matieres` VALUES(79, 'Automatisme et circuits', 0, 8, 12, 2, '');
INSERT INTO `services_matieres` VALUES(77, 'DÃ©veloppement autonomie', 0, 0, 0, 2, '');
INSERT INTO `services_matieres` VALUES(76, 'PropriÃ©tÃ©s des matÃ©riaux', 16.5, 20, 16, 2, '');
INSERT INTO `services_matieres` VALUES(75, 'Transferts thermiques', 15, 18, 16, 2, '');
INSERT INTO `services_matieres` VALUES(74, 'Anglais', 0, 60, 0, 1, '');
INSERT INTO `services_matieres` VALUES(73, 'Thermodynamique', 13.75, 22, 0, 2, '');
INSERT INTO `services_matieres` VALUES(72, 'MÃ©canique des fluides', 21, 24, 24, 2, '');
INSERT INTO `services_matieres` VALUES(71, 'MathÃ©matiques', 27, 34, 0, 2, '');
INSERT INTO `services_matieres` VALUES(70, 'Machines frigorifiques', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(69, 'Machines thermiques', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(68, 'Thermique des locaux', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(67, 'Traitement de l''air', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(66, 'Informatique', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(65, 'Etudes techniques', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(64, 'RÃ©gulation', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(63, 'Transferts thermiques', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(62, 'Langue', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(61, 'Communication', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(60, 'MÃ©canique des fluides', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(59, 'MathÃ©matiques', 0, 0, 0, 3, '');
INSERT INTO `services_matieres` VALUES(58, 'Bureau d''Ã©tudes (Dessin sur table)', 0, 0, 20, 1, '');
INSERT INTO `services_matieres` VALUES(57, 'Techniques du gÃ©nie thermique (atelier)', 0, 2, 24, 1, '');
INSERT INTO `services_matieres` VALUES(56, 'Mesure, mÃ©trologie', 4.5, 10, 12, 1, '');
INSERT INTO `services_matieres` VALUES(55, 'MÃ©canique', 16.5, 24, 0, 1, '');
INSERT INTO `services_matieres` VALUES(54, 'Informatique (VB)', 0, 6, 16, 2, '');
INSERT INTO `services_matieres` VALUES(53, 'ElectricitÃ©', 18, 24, 20, 1, '');
INSERT INTO `services_matieres` VALUES(52, 'Anglais', 0, 30, 0, 2, '');
INSERT INTO `services_matieres` VALUES(51, 'Communication', 0, 57.5, 2, 1, '');
INSERT INTO `services_matieres` VALUES(50, 'Thermodynamique', 22.5, 32, 12, 1, '');
INSERT INTO `services_matieres` VALUES(49, 'MathÃ©matiques', 22.5, 34, 0, 1, '');
INSERT INTO `services_matieres` VALUES(102, 'Projet Professionnel PersonnalisÃ©', 0, 9.25, 0, 7, '');
INSERT INTO `services_matieres` VALUES(103, 'Techniques du GTE (Atelier)', 0, 0, 24, 7, '');
INSERT INTO `services_matieres` VALUES(104, 'Thermodynamique, Ã©nergie, environnement', 0, 52, 12, 7, '');
INSERT INTO `services_matieres` VALUES(105, 'Automatismes et circuits', 0, 8, 12, 8, '');
INSERT INTO `services_matieres` VALUES(106, 'Communication, mÃ©thodologie', 0, 28, 0, 8, '');
INSERT INTO `services_matieres` VALUES(107, 'Adaptation locale', 0, 7, 12, 8, '');
INSERT INTO `services_matieres` VALUES(108, 'Electrothermie', 0, 12, 12, 8, '');
INSERT INTO `services_matieres` VALUES(109, 'Langue', 0, 26, 0, 8, '');
INSERT INTO `services_matieres` VALUES(110, 'MathÃ©matiques', 0, 60, 0, 8, '');
INSERT INTO `services_matieres` VALUES(111, 'MÃ©canique des fluides - acoustique', 0, 44, 12, 8, '');
INSERT INTO `services_matieres` VALUES(112, 'MÃ©canique - PDM', 0, 38, 12, 8, '');
INSERT INTO `services_matieres` VALUES(113, 'Technique du GTE (Moteurs)', 0, 8, 16, 8, '');
INSERT INTO `services_matieres` VALUES(114, 'Thermique des locaux', 0, 16, 16, 8, '');
INSERT INTO `services_matieres` VALUES(115, 'Transferts thermiques', 0, 30, 16, 8, '');
INSERT INTO `services_matieres` VALUES(116, 'Thermodynamique, Ã©nergie, environnement', 0, 46, 0, 8, '');

-- --------------------------------------------------------

--
-- Structure de la table `services_matieres_persos`
--

CREATE TABLE `services_matieres_persos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `perso_id` int(10) unsigned NOT NULL default '0',
  `matiere_id` int(10) unsigned NOT NULL default '0',
  `h_cours` float NOT NULL default '0',
  `h_td` float NOT NULL default '0',
  `h_tp` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Contenu de la table `services_matieres_persos`
--

INSERT INTO `services_matieres_persos` VALUES(10, 16, 85, 0, 0, 96);
INSERT INTO `services_matieres_persos` VALUES(11, 34, 85, 0, 0, 96);
INSERT INTO `services_matieres_persos` VALUES(12, 29, 53, 18, 0, 0);
INSERT INTO `services_matieres_persos` VALUES(13, 16, 53, 0, 0, 20);
INSERT INTO `services_matieres_persos` VALUES(14, 25, 53, 0, 10, 20);
INSERT INTO `services_matieres_persos` VALUES(15, 18, 75, 15, 36, 0);
INSERT INTO `services_matieres_persos` VALUES(30, 29, 56, 4.5, 0, 0);
INSERT INTO `services_matieres_persos` VALUES(17, 29, 75, 0, 36, 0);
INSERT INTO `services_matieres_persos` VALUES(18, 20, 75, 0, 0, 40);
INSERT INTO `services_matieres_persos` VALUES(19, 16, 75, 0, 0, 40);
INSERT INTO `services_matieres_persos` VALUES(20, 25, 82, 1.5, 32, 0);
INSERT INTO `services_matieres_persos` VALUES(21, 16, 82, 1.5, 16, 0);
INSERT INTO `services_matieres_persos` VALUES(22, 25, 82, 0, 0, 48);
INSERT INTO `services_matieres_persos` VALUES(23, 16, 82, 0, 0, 40);
INSERT INTO `services_matieres_persos` VALUES(32, 34, 81, 0, 0, 96);
INSERT INTO `services_matieres_persos` VALUES(31, 2, 71, 27, 0, 0);
INSERT INTO `services_matieres_persos` VALUES(33, 39, 81, 0, 0, 96);
INSERT INTO `services_matieres_persos` VALUES(34, 34, 57, 0, 0, 96);
INSERT INTO `services_matieres_persos` VALUES(35, 39, 57, 0, 0, 96);
INSERT INTO `services_matieres_persos` VALUES(36, 2, 49, 22.5, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `services_persos`
--

CREATE TABLE `services_persos` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `initiales` varchar(10) NOT NULL default '',
  `nom` varchar(50) NOT NULL default '',
  `prenom` varchar(50) NOT NULL default '',
  `statut_id` int(10) unsigned NOT NULL default '0',
  `permanent` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Contenu de la table `services_persos`
--

INSERT INTO `services_persos` VALUES(39, 'PB', 'B', 'Patrice', 5, 1);
INSERT INTO `services_persos` VALUES(2, 'CB', 'B', 'Christine', 1, 1);
INSERT INTO `services_persos` VALUES(14, 'RC', 'C', 'Romain', 1, 1);
INSERT INTO `services_persos` VALUES(15, 'DC', 'C', 'Damien', 2, 1);
INSERT INTO `services_persos` VALUES(16, 'SC', 'C', 'SÃ©bastien', 1, 1);
INSERT INTO `services_persos` VALUES(17, 'GC', 'C', 'GaÃ«lle', 1, 1);
INSERT INTO `services_persos` VALUES(18, 'JLD', 'D', 'Jean-Luc', 3, 1);
INSERT INTO `services_persos` VALUES(19, 'ED', 'D', 'Eva', 2, 1);
INSERT INTO `services_persos` VALUES(20, 'FEM', 'EM', 'Fatima', 2, 1);
INSERT INTO `services_persos` VALUES(21, 'MG', 'G', 'Marco', 2, 1);
INSERT INTO `services_persos` VALUES(22, 'VG', 'G', 'Vivianne', 1, 1);
INSERT INTO `services_persos` VALUES(23, 'CJ', 'J', 'Claire', 1, 1);
INSERT INTO `services_persos` VALUES(24, 'MCL', 'L', 'Marie-Christine', 3, 1);
INSERT INTO `services_persos` VALUES(25, 'JML', 'L', 'Jean-Marie', 1, 1);
INSERT INTO `services_persos` VALUES(26, 'SL', 'L', 'StÃ©phane', 2, 1);
INSERT INTO `services_persos` VALUES(27, 'PM', 'M', 'Philippe', 2, 1);
INSERT INTO `services_persos` VALUES(28, 'WM', 'M', 'Wolfgang', 2, 1);
INSERT INTO `services_persos` VALUES(29, 'RP', 'P', 'Robert', 2, 1);
INSERT INTO `services_persos` VALUES(30, 'DS', 'S', 'Didier', 2, 1);
INSERT INTO `services_persos` VALUES(31, 'JT', 'T', 'Jacky', 2, 1);
INSERT INTO `services_persos` VALUES(32, 'AT', 'T', 'Alain', 5, 1);
INSERT INTO `services_persos` VALUES(33, 'ATX', 'T', 'Alain', 3, 1);
INSERT INTO `services_persos` VALUES(34, 'JJV', 'V', 'Jean-Jacques', 5, 1);
INSERT INTO `services_persos` VALUES(55, 'XXX', 'x', 'x', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `services_statuts`
--

CREATE TABLE `services_statuts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nom` varchar(50) NOT NULL default '',
  `h_statut` float NOT NULL default '0',
  `h_sup_max` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `services_statuts`
--

INSERT INTO `services_statuts` VALUES(1, 'PRAG', 384, 192);
INSERT INTO `services_statuts` VALUES(2, 'MCF', 192, 192);
INSERT INTO `services_statuts` VALUES(3, 'PR', 192, 192);
INSERT INTO `services_statuts` VALUES(4, 'ATER', 96, 0);
INSERT INTO `services_statuts` VALUES(5, 'PRCE', 384, 192);
INSERT INTO `services_statuts` VALUES(6, 'EXT', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `services_users`
--

CREATE TABLE `services_users` (
  `id` int(10) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `group_id` int(11) NOT NULL default '0',
  `created` datetime default NULL,
  `modified` datetime default NULL,
  `perso_id` int(10) NOT NULL default '0',
  `role` varchar(50) default 'www',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `services_users`
--

INSERT INTO `services_users` VALUES(1, 'admin', '42248b005b7f88bf5e5e11af965f179c4fd4a451', 1, '2009-08-07 11:18:56', '2009-08-09 10:17:40', 16, 'admin');
INSERT INTO `services_users` VALUES(2, 'user', '399e28cb5476e66e2f8713c915b4e39be0c7b844', 2, '2009-08-07 11:43:29', '2009-08-09 10:17:31', 0, 'www');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `services_vue_filieres_combles_besoins`
--
CREATE TABLE `services_vue_filieres_combles_besoins` (
`id` int(10) unsigned
,`filiere_id` int(10) unsigned
,`h_cours` double
,`h_td` double
,`h_tp` double
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `services_vue_filieres_restants_besoins`
--
CREATE TABLE `services_vue_filieres_restants_besoins` (
`id` int(10) unsigned
,`filiere_id` int(10) unsigned
,`h_cours` double
,`h_td` double
,`h_tp` double
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `services_vue_filieres_total_besoins`
--
CREATE TABLE `services_vue_filieres_total_besoins` (
`id` int(10) unsigned
,`filiere_id` int(10) unsigned
,`h_cours` double
,`h_td` double
,`h_tp` double
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `services_vue_matieres_combles_besoins`
--
CREATE TABLE `services_vue_matieres_combles_besoins` (
`id` int(10) unsigned
,`matiere_id` int(10) unsigned
,`h_cours` double
,`h_td` double
,`h_tp` double
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `services_vue_matieres_restants_besoins`
--
CREATE TABLE `services_vue_matieres_restants_besoins` (
`id` int(10) unsigned
,`matiere_id` int(10) unsigned
,`h_cours` double
,`h_td` double
,`h_tp` double
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `services_vue_matieres_total_besoins`
--
CREATE TABLE `services_vue_matieres_total_besoins` (
`id` int(10) unsigned
,`matiere_id` int(10) unsigned
,`h_cours` float
,`h_td` double
,`h_tp` double
);
-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `services_vue_persos_bilan_services`
--
CREATE TABLE `services_vue_persos_bilan_services` (
`id` int(10) unsigned
,`perso_id` int(10) unsigned
,`h_cours` double
,`h_td` double
,`h_tp` double
);
-- --------------------------------------------------------

--
-- Structure de la vue `services_vue_filieres_combles_besoins`
--
DROP TABLE IF EXISTS `services_vue_filieres_combles_besoins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services`.`services_vue_filieres_combles_besoins` AS select `services`.`services_matieres`.`filiere_id` AS `id`,`services`.`services_matieres`.`filiere_id` AS `filiere_id`,sum(`services_vue_matieres_combles_besoins`.`h_cours`) AS `h_cours`,sum(`services_vue_matieres_combles_besoins`.`h_td`) AS `h_td`,sum(`services_vue_matieres_combles_besoins`.`h_tp`) AS `h_tp` from (`services`.`services_vue_matieres_combles_besoins` join `services`.`services_matieres`) where (`services_vue_matieres_combles_besoins`.`matiere_id` = `services`.`services_matieres`.`id`) group by `services`.`services_matieres`.`filiere_id`;

-- --------------------------------------------------------

--
-- Structure de la vue `services_vue_filieres_restants_besoins`
--
DROP TABLE IF EXISTS `services_vue_filieres_restants_besoins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services`.`services_vue_filieres_restants_besoins` AS select `services_vue_filieres_total_besoins`.`filiere_id` AS `id`,`services_vue_filieres_total_besoins`.`filiere_id` AS `filiere_id`,(`services_vue_filieres_total_besoins`.`h_cours` - coalesce(`services_vue_filieres_combles_besoins`.`h_cours`,0)) AS `h_cours`,(`services_vue_filieres_total_besoins`.`h_td` - coalesce(`services_vue_filieres_combles_besoins`.`h_td`,0)) AS `h_td`,(`services_vue_filieres_total_besoins`.`h_tp` - coalesce(`services_vue_filieres_combles_besoins`.`h_tp`,0)) AS `h_tp` from (`services`.`services_vue_filieres_total_besoins` left join `services`.`services_vue_filieres_combles_besoins` on((`services_vue_filieres_total_besoins`.`filiere_id` = `services_vue_filieres_combles_besoins`.`filiere_id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `services_vue_filieres_total_besoins`
--
DROP TABLE IF EXISTS `services_vue_filieres_total_besoins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services`.`services_vue_filieres_total_besoins` AS select `services`.`services_filieres`.`id` AS `id`,`services`.`services_filieres`.`id` AS `filiere_id`,sum(`services_vue_matieres_total_besoins`.`h_cours`) AS `h_cours`,sum(`services_vue_matieres_total_besoins`.`h_td`) AS `h_td`,sum(`services_vue_matieres_total_besoins`.`h_tp`) AS `h_tp` from ((`services`.`services_matieres` join `services`.`services_filieres`) join `services`.`services_vue_matieres_total_besoins`) where ((`services`.`services_matieres`.`filiere_id` = `services`.`services_filieres`.`id`) and (`services`.`services_matieres`.`id` = `services_vue_matieres_total_besoins`.`matiere_id`)) group by `services`.`services_filieres`.`id`;

-- --------------------------------------------------------

--
-- Structure de la vue `services_vue_matieres_combles_besoins`
--
DROP TABLE IF EXISTS `services_vue_matieres_combles_besoins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services`.`services_vue_matieres_combles_besoins` AS select `services`.`services_matieres_persos`.`matiere_id` AS `id`,`services`.`services_matieres_persos`.`matiere_id` AS `matiere_id`,sum(`services`.`services_matieres_persos`.`h_cours`) AS `h_cours`,sum(`services`.`services_matieres_persos`.`h_td`) AS `h_td`,sum(`services`.`services_matieres_persos`.`h_tp`) AS `h_tp` from `services`.`services_matieres_persos` group by `services`.`services_matieres_persos`.`matiere_id`;

-- --------------------------------------------------------

--
-- Structure de la vue `services_vue_matieres_restants_besoins`
--
DROP TABLE IF EXISTS `services_vue_matieres_restants_besoins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services`.`services_vue_matieres_restants_besoins` AS select `services_vue_matieres_total_besoins`.`matiere_id` AS `id`,`services_vue_matieres_total_besoins`.`matiere_id` AS `matiere_id`,(`services_vue_matieres_total_besoins`.`h_cours` - coalesce(`services_vue_matieres_combles_besoins`.`h_cours`,0)) AS `h_cours`,(`services_vue_matieres_total_besoins`.`h_td` - coalesce(`services_vue_matieres_combles_besoins`.`h_td`,0)) AS `h_td`,(`services_vue_matieres_total_besoins`.`h_tp` - coalesce(`services_vue_matieres_combles_besoins`.`h_tp`,0)) AS `h_tp` from (`services`.`services_vue_matieres_total_besoins` left join `services`.`services_vue_matieres_combles_besoins` on((`services_vue_matieres_total_besoins`.`matiere_id` = `services_vue_matieres_combles_besoins`.`matiere_id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `services_vue_matieres_total_besoins`
--
DROP TABLE IF EXISTS `services_vue_matieres_total_besoins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services`.`services_vue_matieres_total_besoins` AS select `services`.`services_matieres`.`id` AS `id`,`services`.`services_matieres`.`id` AS `matiere_id`,`services`.`services_matieres`.`h_cours` AS `h_cours`,(`services`.`services_matieres`.`h_td` * `services`.`services_filieres`.`nb_gr_td`) AS `h_td`,(`services`.`services_matieres`.`h_tp` * `services`.`services_filieres`.`nb_gr_tp`) AS `h_tp` from (`services`.`services_matieres` join `services`.`services_filieres`) where (`services`.`services_matieres`.`filiere_id` = `services`.`services_filieres`.`id`);

-- --------------------------------------------------------

--
-- Structure de la vue `services_vue_persos_bilan_services`
--
DROP TABLE IF EXISTS `services_vue_persos_bilan_services`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services`.`services_vue_persos_bilan_services` AS select `services`.`services_matieres_persos`.`perso_id` AS `id`,`services`.`services_matieres_persos`.`perso_id` AS `perso_id`,sum(`services`.`services_matieres_persos`.`h_cours`) AS `h_cours`,sum(`services`.`services_matieres_persos`.`h_td`) AS `h_td`,sum(`services`.`services_matieres_persos`.`h_tp`) AS `h_tp` from `services`.`services_matieres_persos` group by `services`.`services_matieres_persos`.`perso_id`;
