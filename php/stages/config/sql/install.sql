-- phpMyAdmin SQL Dump
-- version 2.11.7.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 17 Août 2009 à 17:55
-- Version du serveur: 5.0.41
-- Version de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `stages`
--

-- --------------------------------------------------------

--
-- Structure de la table `stages_enseignants`
--

CREATE TABLE `stages_enseignants` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `commentaire` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `stages_enseignants`
--

INSERT INTO `stages_enseignants` VALUES(1, 'scelles', 'CELLES', 'SÃ©bastien', '', '2009-08-09 17:56:21', '2009-08-09 17:56:21');
INSERT INTO `stages_enseignants` VALUES(2, 'ens2', 'ens2', '', '', '2009-08-10 10:57:22', '2009-08-10 10:57:22');

-- --------------------------------------------------------

--
-- Structure de la table `stages_enseignants_stages`
--

CREATE TABLE `stages_enseignants_stages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `stage_id` int(10) unsigned NOT NULL,
  `enseignant_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `stages_enseignants_stages`
--

INSERT INTO `stages_enseignants_stages` VALUES(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `stages_entreprises`
--

CREATE TABLE `stages_entreprises` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `adresse` text NOT NULL,
  `tel` text NOT NULL,
  `commentaire` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `stages_entreprises`
--

INSERT INTO `stages_entreprises` VALUES(1, 'Entreprise 1', '', '', '', '2009-08-09 18:04:26', '2009-08-09 18:04:26');

-- --------------------------------------------------------

--
-- Structure de la table `stages_filieres`
--

CREATE TABLE `stages_filieres` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `commentaire` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `stages_filieres`
--

INSERT INTO `stages_filieres` VALUES(1, 'GTE2', '', '2009-08-09 16:37:12', '2009-08-09 16:37:12');
INSERT INTO `stages_filieres` VALUES(2, 'LP_VERTE', '', '2009-08-09 16:37:25', '2009-08-09 16:37:25');

-- --------------------------------------------------------

--
-- Structure de la table `stages_stages`
--

CREATE TABLE `stages_stages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `entreprise_id` int(10) unsigned NOT NULL,
  `commentaire` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `stages_stages`
--

INSERT INTO `stages_stages` VALUES(1, 1, 'Stage dans l''entreprise 1', '2009-08-09 18:05:52', '2009-08-09 18:47:15');

-- --------------------------------------------------------

--
-- Structure de la table `stages_stages_stagiaires`
--

CREATE TABLE `stages_stages_stagiaires` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `stage_id` int(10) unsigned NOT NULL,
  `stagiaire_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `stages_stages_stagiaires`
--

INSERT INTO `stages_stages_stagiaires` VALUES(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `stages_stages_tuteurs`
--

CREATE TABLE `stages_stages_tuteurs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `stage_id` int(10) unsigned NOT NULL,
  `tuteur_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `stages_stages_tuteurs`
--

INSERT INTO `stages_stages_tuteurs` VALUES(2, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `stages_stagiaires`
--

CREATE TABLE `stages_stagiaires` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `login` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `adresse` text NOT NULL,
  `email` text NOT NULL,
  `filiere_id` int(10) unsigned NOT NULL,
  `commentaire` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `stages_stagiaires`
--

INSERT INTO `stages_stagiaires` VALUES(1, 'stagiaire1', 'Stagiaire 1', '', '', '', 1, '', '2009-08-09 18:08:00', '2009-08-09 18:08:00');

-- --------------------------------------------------------

--
-- Structure de la table `stages_tuteurs`
--

CREATE TABLE `stages_tuteurs` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `commentaire` text NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `stages_tuteurs`
--

INSERT INTO `stages_tuteurs` VALUES(1, 'Tuteur 1', '', '', '2009-08-09', '2009-08-09');

-- --------------------------------------------------------

--
-- Structure de la table `stages_users`
--

CREATE TABLE `stages_users` (
  `id` int(10) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `stages_users`
--

INSERT INTO `stages_users` VALUES(1, 'admin', '42248b005b7f88bf5e5e11af965f179c4fd4a451', '2009-08-07 11:18:56', '2009-08-09 10:17:40');
INSERT INTO `stages_users` VALUES(2, 'user', '399e28cb5476e66e2f8713c915b4e39be0c7b844', '2009-08-07 11:43:29', '2009-08-09 10:17:31');
