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
-- Base de données: `wikicaca`
--

-- --------------------------------------------------------

--
-- Structure de la table `wikicaca_comments`
--

CREATE TABLE `wikicaca_comments` (
  `id` int(10) unsigned NOT NULL,
  `wikipage_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comment` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `wikicaca_comments`
--


-- --------------------------------------------------------

--
-- Structure de la table `wikicaca_owners`
--

CREATE TABLE `wikicaca_owners` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `wikipage_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `wikicaca_owners`
--


-- --------------------------------------------------------

--
-- Structure de la table `wikicaca_users`
--

CREATE TABLE `wikicaca_users` (
  `id` int(10) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `password` varchar(40) NOT NULL default '',
  `created` datetime default NULL,
  `modified` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `wikicaca_users`
--

INSERT INTO `wikicaca_users` VALUES(1, 'admin', '42248b005b7f88bf5e5e11af965f179c4fd4a451', '2009-08-07 11:18:56', '2009-08-09 10:17:40');

-- --------------------------------------------------------

--
-- Structure de la table `wikicaca_wikipages`
--

CREATE TABLE `wikicaca_wikipages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(75) NOT NULL,
  `body` mediumtext NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `wikicaca_wikipages`
--

INSERT INTO `wikicaca_wikipages` VALUES(1, 'HomePage', '===== Welcome to WikiCaca =====\r\n\r\n', '2009-08-13 17:05:38', '2009-08-13 18:44:05');
INSERT INTO `wikicaca_wikipages` VALUES(2, 'AdminPage', 'This is the AdminPage', '2009-08-13 17:11:46', '2009-08-13 17:11:46');
INSERT INTO `wikicaca_wikipages` VALUES(3, 'HomePage', '===== Welcome to WikiCaca =====\r\n\r\n==== HowTo ====\r\n\r\n==== SandBox ====\r\n\r\nxsxdb\r\n====== T6 ======\r\n=====T5=====\r\n===== T5=====\r\n=====T5 =====\r\n===== T5 =====\r\n=====  T5  =====\r\n==== T4 ====\r\n=== T3 ===\r\n== T2 ==\r\n{{redirect page="Toto"}}\r\n**bold**\r\n//italic//\r\n__underline__\r\n@@barr&eacute;@@\r\n##texte &agrave; espacement fixe##\r\n%%code%%\r\n%%(php) PHP code%%\r\n%%(delphi) code delphi ou pascal%%\r\n[[LienInterne]]\r\n[[www.snakpak.info/unit/wiki.jpg logo de wikipedia]]\r\n[[LienInterne Lien interne]]\r\n[[http://www.site.fr Lien externe]]\r\nhttp://www.site.fr/test\r\n[[http://www.site.fr/test]]\r\n$\\frac{1}{1+x}$\r\n$$\\frac{1}{1+x}$$\r\n indent1\r\n  indent2\r\n\r\n - item1\r\n - item2\r\n----\r\n\r\nnoone@undef.fr\r\n\r\nhttp://www.site.net\r\nhttp://www.site.net/\r\nhttp://www.site.net/wiki\r\nhttp://www.site.net/wiki/\r\nhttp://www.site.net/wiki/PageWiki\r\nhttp://www.site.net/wiki/PageWiki/edit\r\n\r\nTGhgg\r\n', '2009-08-13 18:44:19', '2009-08-13 18:44:19');
INSERT INTO `wikicaca_wikipages` VALUES(4, 'BacASable', 'C''est le bac Ã  sable.', '2009-08-13 21:57:45', '2009-08-13 21:57:45');
