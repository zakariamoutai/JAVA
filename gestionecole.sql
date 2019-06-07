-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 07 juin 2019 à 13:51
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestionecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `anneescolaire`
--

DROP TABLE IF EXISTS `anneescolaire`;
CREATE TABLE IF NOT EXISTS `anneescolaire` (
  `id_annee-scolaire` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_annee-scolaire`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
CREATE TABLE IF NOT EXISTS `bulletin` (
  `id_bulletin` int(11) NOT NULL AUTO_INCREMENT,
  `Trimestre.id` int(11) NOT NULL,
  `Eleve.id` varchar(255) NOT NULL,
  `appreciation` text NOT NULL,
  PRIMARY KEY (`id_bulletin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `Niveau.id` varchar(255) NOT NULL,
  `AnneeScolaireClasse.id` int(11) NOT NULL,
  PRIMARY KEY (`id_classe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `detailbulletin`
--

DROP TABLE IF EXISTS `detailbulletin`;
CREATE TABLE IF NOT EXISTS `detailbulletin` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `appreciation` text NOT NULL,
  `Bulletin.id` int(11) NOT NULL,
  `EleveDbull.id` varchar(255) NOT NULL,
  PRIMARY KEY (`id_detail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `id_discipline` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_discipline`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id_eleve` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_eleve`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `enseignement`
--

DROP TABLE IF EXISTS `enseignement`;
CREATE TABLE IF NOT EXISTS `enseignement` (
  `id_ens` int(11) NOT NULL AUTO_INCREMENT,
  `ClasseEns.id` int(11) NOT NULL,
  `DisciplineEns.id` varchar(255) NOT NULL,
  `Prof.id` varchar(255) NOT NULL,
  PRIMARY KEY (`id_ens`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `id_eval` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  `appreciation` text NOT NULL,
  `DetailBulletinEval.id` int(11) NOT NULL,
  PRIMARY KEY (`id_eval`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `id_niveau` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_niveau`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `id_prof` int(11) NOT NULL AUTO_INCREMENT,
  `nomp` varchar(255) NOT NULL,
  `prenomp` varchar(255) NOT NULL,
  PRIMARY KEY (`id_prof`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
CREATE TABLE IF NOT EXISTS `trimestre` (
  `id_trimestre` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  `AnneeScolaireTrimestre.id` int(11) NOT NULL,
  PRIMARY KEY (`id_trimestre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
