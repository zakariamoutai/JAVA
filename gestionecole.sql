-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 08 juin 2019 à 16:38
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `bulletin`
--

INSERT INTO `bulletin` (`id_bulletin`, `Trimestre.id`, `Eleve.id`, `appreciation`) VALUES
(1, 1, 'Rahli', 'Ensemble convenable.'),
(2, 2, 'Rahli', 'De nets progrés'),
(3, 3, 'Rahli', 'Excellent trimestre'),
(4, 1, 'Moutai', 'Ensemble moyen'),
(5, 2, 'Moutai', 'De nets progrès en informatique'),
(6, 3, 'Moutai', 'Excellente fin d\'année');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `nom`, `Niveau.id`, `AnneeScolaireClasse.id`) VALUES
(1, 'toto', 'CP', 2018),
(2, 'tata', 'CE1', 2018),
(3, 'titi', 'CE2', 2018),
(4, 'tete', 'CM1', 2018),
(5, 'tyty', 'CM2', 2018),
(6, 'pepe', 'CP', 2019);

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `discipline`
--

INSERT INTO `discipline` (`id_discipline`, `nom`) VALUES
(1, 'Mathématiques'),
(2, 'Langage C'),
(3, 'Anglais'),
(4, 'Java'),
(5, 'Traitement du signal'),
(6, 'Web dynamique'),
(7, 'Thermodynamique'),
(8, 'Electronique'),
(9, 'Robotique');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id_eleve` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `ClasseElev` varchar(255) NOT NULL,
  PRIMARY KEY (`id_eleve`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `Nom`, `Prenom`, `ClasseElev`) VALUES
(1, 'Rahli', 'Sofiane', 'CP'),
(2, 'Moutai', 'Zakaria', 'CP'),
(6, 'Bout', 'Marc', 'CP'),
(5, 'Bill', 'Pierre', 'CE1'),
(7, 'Part', 'Melanie', 'CE1'),
(8, 'Zadu', 'Jeanne', 'CE1'),
(9, 'Soure', 'Magalie', 'CE2'),
(10, 'Soulax', 'Abdel', 'CE2'),
(11, 'Maitre', 'Gims', 'CE2'),
(12, 'Ronaldo', 'Cristiano', 'CM1'),
(13, 'Shakira', 'Waka', 'CM1'),
(14, 'Eponge ', 'Bob', 'CM1'),
(15, 'Bou', 'Adibou', 'CM2'),
(16, 'Spyro', 'Dragon', 'CM2'),
(17, 'Potter', 'Harry', 'CM2');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `enseignement`
--

INSERT INTO `enseignement` (`id_ens`, `ClasseEns.id`, `DisciplineEns.id`, `Prof.id`) VALUES
(1, 1, 'Java ', 'Palasi'),
(2, 1, 'Langage C', 'Segado'),
(3, 1, 'Mathematiques', 'Le Cor'),
(4, 2, 'Electronique', 'Nacer'),
(5, 2, 'Traitement du signal', 'Mokhber'),
(6, 2, 'Robotique', 'Minot'),
(7, 3, 'Anglais', 'Leonard'),
(8, 3, 'Geopolitique', 'Mouhali'),
(9, 3, 'Analyse de Fourier', 'Coudray');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `nom`) VALUES
(1, 'CP'),
(2, 'CE1'),
(3, 'CE2'),
(4, 'CM1'),
(5, 'CM2');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`id_prof`, `nomp`, `prenomp`) VALUES
(1, 'Palasi', 'Pa'),
(2, 'Segado', 'Se'),
(3, 'Mouhali', 'Mo'),
(4, 'Minot', 'Mi'),
(5, 'Nacer', 'Na'),
(6, 'Leonard', 'Le'),
(7, 'Coudray', 'Co'),
(8, 'Mokhber', 'Moo'),
(9, 'Le Cor', 'Lee');

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
