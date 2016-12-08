-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 08 Décembre 2016 à 08:57
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gestionentraineur`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`idAdmin`, `login`, `mdp`) VALUES
(1, 'toto', 'toto'),
(2, 'titi', 'titi');

-- --------------------------------------------------------

--
-- Structure de la table `connexion`
--

CREATE TABLE IF NOT EXISTS `connexion` (
  `idConnexion` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `idEntraineur` int(11) NOT NULL,
  PRIMARY KEY (`idConnexion`),
  KEY `idEntraineur` (`idEntraineur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `connexion`
--

INSERT INTO `connexion` (`idConnexion`, `login`, `mdp`, `idEntraineur`) VALUES
(1, 'mdr', 'mdr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `entraineur`
--

CREATE TABLE IF NOT EXISTS `entraineur` (
  `idEntr` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `codepostal` int(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `telFixe` int(10) NOT NULL,
  `telPort` int(10) NOT NULL,
  `club` varchar(255) DEFAULT NULL,
  `numLicence` text,
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`idEntr`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `entraineur`
--

INSERT INTO `entraineur` (`idEntr`, `nom`, `prenom`, `adresse`, `codepostal`, `ville`, `telFixe`, `telPort`, `club`, `numLicence`, `mail`) VALUES
(1, 'Guérin', 'Rémi', '4 impasse des mimosas', 44190, 'Boussay', 0, 0, '', NULL, '0'),
(3, '$nom', '$prenom', '$adresse', 0, '$ville', 0, 0, '$club', '$licence', '0'),
(4, '$nom', '$prenom', '$adresse', 0, '$ville', 0, 0, '$club', '$licence', '$mail');

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

CREATE TABLE IF NOT EXISTS `formateur` (
  `idFormateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `codepostal` int(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  PRIMARY KEY (`idFormateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `formateur`
--

INSERT INTO `formateur` (`idFormateur`, `nom`, `prenom`, `adresse`, `codepostal`, `ville`) VALUES
(1, 'Guillemot', 'Florian', '4 Rue de la butte', 35000, 'Rennes');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `idFormation` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idFormation`),
  KEY `idCategorie` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE IF NOT EXISTS `inscription` (
  `idInsc` int(11) NOT NULL AUTO_INCREMENT,
  `paiement` tinyint(1) NOT NULL,
  `dateLimiteInsc` int(11) NOT NULL,
  `idEntraineur` int(11) NOT NULL,
  `idStage` int(11) NOT NULL,
  `attestation` tinyint(1) NOT NULL,
  PRIMARY KEY (`idInsc`),
  KEY `idEntraineur` (`idEntraineur`,`idStage`),
  KEY `idStage` (`idStage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE IF NOT EXISTS `niveau` (
  `idNiveau` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`idNiveau`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `niveau`
--

INSERT INTO `niveau` (`idNiveau`, `libelle`) VALUES
(1, 'Région'),
(2, 'Département');

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
  `idStage` int(11) NOT NULL AUTO_INCREMENT,
  `dateDeb` date NOT NULL,
  `dateFin` date NOT NULL,
  `nbPlace` int(4) NOT NULL,
  `tarifLigue` int(4) NOT NULL,
  `tarifHorsLigue` int(5) NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `idNiveau` int(11) NOT NULL,
  `idFormateur` int(11) NOT NULL,
  PRIMARY KEY (`idStage`),
  KEY `idNiveau` (`idNiveau`,`idFormateur`),
  KEY `idFormateur` (`idFormateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `stage`
--

INSERT INTO `stage` (`idStage`, `dateDeb`, `dateFin`, `nbPlace`, `tarifLigue`, `tarifHorsLigue`, `lieu`, `idNiveau`, `idFormateur`) VALUES
(2, '2016-11-14', '2016-11-15', 100, 50, 0, 'Nantes', 1, 1),
(3, '2016-11-09', '2016-11-18', 50, 200, 0, 'Paris', 1, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `connexion`
--
ALTER TABLE `connexion`
  ADD CONSTRAINT `connexion_ibfk_1` FOREIGN KEY (`idEntraineur`) REFERENCES `connexion` (`idConnexion`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`idEntraineur`) REFERENCES `entraineur` (`idEntr`),
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`idStage`) REFERENCES `stage` (`idStage`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `stage_ibfk_1` FOREIGN KEY (`idNiveau`) REFERENCES `niveau` (`idNiveau`),
  ADD CONSTRAINT `stage_ibfk_2` FOREIGN KEY (`idFormateur`) REFERENCES `formateur` (`idFormateur`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
