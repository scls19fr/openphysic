-- phpMyAdmin SQL Dump
-- version 2.11.3deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Lun 26 Mai 2008 à 17:15
-- Version du serveur: 5.0.51
-- Version de PHP: 5.2.4-2ubuntu5.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `Votes`
--

-- --------------------------------------------------------

--
-- Structure de la table `elections`
--

CREATE TABLE IF NOT EXISTS `elections` (
  `id` int(2) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `elections`
--


-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(2) NOT NULL auto_increment,
  `nom` varchar(30) default NULL,
  `prenom` varchar(30) default NULL,
  `login` varchar(30) default NULL,
  `password` char(32) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_admin` smallint(6) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`id`, `nom`, `prenom`, `login`, `password`, `email`, `is_admin`) VALUES
(1, 'CELLES', 'Sébastien', 'scelles', '4a7d1ed414474e4033ac29ccb8653d9b', 's.celles@gmail.com', 0),
(2, 'NOM', 'Prénom', 'pnom', '81dc9bdb52d04dc20036dbd8313ed055', 'pnom@undef.com', 0),
(3, 'ADMIN', 'Admin', 'admin', 'd79c8788088c2193f0244d8f1f36d2db', 'admin@undef.com', 1);

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(2) NOT NULL auto_increment,
  `user_id` char(16) NOT NULL,
  `election_id` char(16) default '0',
  `vote` char(16) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `votes_user_id` (`user_id`),
  KEY `votes_election_id` (`election_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `votes`
--

