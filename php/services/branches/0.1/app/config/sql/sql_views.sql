-- phpMyAdmin SQL Dump
-- version 2.11.7.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Dim 23 Août 2009 à 08:24
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
