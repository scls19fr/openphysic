--
-- Base de données: `Votes`
--

drop database if exists Votes;
CREATE DATABASE `Votes` ;
use Votes;

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `userid` int(2) NOT NULL auto_increment,
  `nom` varchar(30) default NULL,
  `prenom` varchar(30) default NULL,
  `login` varchar(30) default NULL,
  `password` char(32) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_admin` SMALLINT DEFAULT 0,
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `login`
--
INSERT INTO `login` (`userid`, `nom`, `prenom`, `login`, `password`, `email`, `is_admin`) VALUES
(1, 'CELLES', 'Sébastien', 'scelles', '4a7d1ed414474e4033ac29ccb8653d9b', 's.celles@gmail.com', 0),
(2, 'NOM', 'Prénom', 'pnom', '81dc9bdb52d04dc20036dbd8313ed055', 'pnom@undef.com', 0),
(3, 'ADMIN', 'Admin', 'admin', 'd79c8788088c2193f0244d8f1f36d2db', 'admin@undef.com', 1);




--
-- Structure de la table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `voteid` int(2) NOT NULL auto_increment,
  `userid` char(16) NOT NULL,
  `electionid` char(16) DEFAULT 0,
  `vote` char(16) NOT NULL,
  PRIMARY KEY  (`voteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Structure de la table `elections`
--

CREATE TABLE IF NOT EXISTS `elections` (
  `electionid` int(2) NOT NULL auto_increment,
  PRIMARY KEY  (`electionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


