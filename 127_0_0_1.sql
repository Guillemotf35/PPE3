-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 08 Décembre 2016 à 08:30
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `aviation`
--

-- --------------------------------------------------------

--
-- Structure de la table `aeroport`
--

CREATE TABLE IF NOT EXISTS `aeroport` (
  `codeAer` varchar(50) NOT NULL,
  `nomAeroport` varchar(50) DEFAULT NULL,
  `villeAeroport` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codeAer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aeroport`
--

INSERT INTO `aeroport` (`codeAer`, `nomAeroport`, `villeAeroport`) VALUES
('BST', 'Poretta', 'Bastia'),
('EFD', 'Ellington Field', 'Houston'),
('LD', 'Heathrow', 'Londres'),
('NY-JFK', 'John-F Kennedy', 'New York'),
('ORLY', 'Orly', 'Paris'),
('RCDG', 'Charles de Gaulle', 'Paris'),
('TLS', 'Blagnac', 'Toulouse');

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

CREATE TABLE IF NOT EXISTS `avion` (
  `num` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `dateMiseService` date DEFAULT NULL,
  `nbPlaces` int(11) DEFAULT NULL,
  `numComp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `numComp` (`numComp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `avion`
--

INSERT INTO `avion` (`num`, `type`, `dateMiseService`, `nbPlaces`, `numComp`) VALUES
('F-G458F', 'B747', '2016-02-08', 350, '205'),
('F-GR456', 'A380', '2016-07-05', 345, '610'),
('F-JJ254', 'FOKKER100', '1984-01-14', 100, '610'),
('F-KI452', 'FOKKER100', '1985-01-25', 100, '150'),
('F-R56T4', 'B747', '2009-06-03', 350, '610'),
('F-X25D8F', 'A380', '2016-01-10', 345, '101'),
('R-OI215', 'A310', '1991-02-05', 120, '610'),
('R-YY45F', 'A320', '2012-10-10', 100, '201'),
('US-KKR2', 'A330', '2013-05-08', 340, '600');

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

CREATE TABLE IF NOT EXISTS `compagnie` (
  `num` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `nationalite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compagnie`
--

INSERT INTO `compagnie` (`num`, `nom`, `nationalite`) VALUES
('101', 'AIRFRANCE', 'française'),
('150', 'CORSAIR', 'française'),
('201', 'AMERICANAIRLINES', 'usa'),
('205', 'CONTINENTAL AIRLINES', 'USA'),
('300', 'LUFTHANSA', 'ALLEMANDE'),
('600', 'AEROFLOT', 'RUSSE'),
('610', 'AERO', 'RUSSE'),
('630', 'BRITISH AIRWAYS', 'Britanique');

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

CREATE TABLE IF NOT EXISTS `pilote` (
  `num` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `adrPil` varchar(50) DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `dateEmb` date DEFAULT NULL,
  `numComp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `numComp` (`numComp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pilote`
--

INSERT INTO `pilote` (`num`, `nom`, `adrPil`, `sal`, `dateEmb`, `numComp`) VALUES
('23541', 'PALAPATTE NATACHA', 'LONDRES', 83317, '2007-08-07', '610'),
('25682', 'LEFRANCOIS JEAN MICHEL', 'EVRY', 93000, '2016-12-05', '101'),
('44510', 'SMITH JOHN', 'NEW YORK', 125000, '2003-10-10', '201'),
('55600', 'COVER HARRY', 'HOUSTON', 101200, '2009-01-15', '201'),
('56441', 'RASPOU TINO', 'Moscou', 14509, '2005-07-07', '610'),
('84830', 'ROGER PATRICK', 'PARIS', 95800, '1992-05-05', '101'),
('84831', 'DUBOIS KARL', 'PARIS', 95800, '2006-05-05', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE IF NOT EXISTS `vol` (
  `num` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `hrDep` time DEFAULT NULL,
  `hrArr` time DEFAULT NULL,
  `codeAerDep` varchar(50) DEFAULT NULL,
  `codeAerArr` varchar(50) DEFAULT NULL,
  `numPilote` varchar(50) DEFAULT NULL,
  `numAvion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `codeAerDep` (`codeAerDep`),
  KEY `numAvion` (`numAvion`),
  KEY `numPilote` (`numPilote`),
  KEY `codeAerArr` (`codeAerArr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vol`
--

INSERT INTO `vol` (`num`, `date`, `hrDep`, `hrArr`, `codeAerDep`, `codeAerArr`, `numPilote`, `numAvion`) VALUES
('1044', '2015-12-10', '13:20:00', '15:10:00', 'ORLY', 'BST', '84830', 'R-YY45F'),
('1233', '2016-01-16', '11:55:00', '16:19:00', 'EFD', 'NY-JFK', '56441', 'F-G458F'),
('1248', '2015-01-25', '13:10:00', '15:55:00', 'RCDG', 'NY-JFK', '44510', 'F-X25D8F'),
('1462', '2016-01-10', '11:00:00', '14:00:00', 'RCDG', 'NY-JFK', '44510', 'R-YY45F'),
('1520', '2016-01-15', '13:30:00', '16:00:00', 'RCDG', 'NY-JFK', '55600', 'R-YY45F'),
('1562', '2016-01-10', '17:00:00', '20:00:00', 'RCDG', 'NY-JFK', '84830', 'F-X25D8F'),
('1589', '2015-12-10', '11:00:00', '17:20:00', 'NY-JFK', 'EFD', '55600', 'US-KKR2'),
('2544', '2016-07-13', '13:20:00', '16:30:00', 'ORLY', 'BST', '44510', 'R-YY45F'),
('3214', '2015-12-10', '17:10:00', '20:28:00', 'LD', 'NY-JFK', '56441', 'F-GR456'),
('3698', '2016-07-13', '15:00:00', '16:10:00', 'LD', 'RCDG', '84830', 'R-OI215'),
('5620', '2016-07-13', '18:00:00', '19:05:00', 'ORLY', 'TLS', '44510', 'F-KI452');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`numComp`) REFERENCES `compagnie` (`num`);

--
-- Contraintes pour la table `pilote`
--
ALTER TABLE `pilote`
  ADD CONSTRAINT `pilote_ibfk_1` FOREIGN KEY (`numComp`) REFERENCES `compagnie` (`num`);

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`codeAerDep`) REFERENCES `aeroport` (`codeAer`),
  ADD CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`numAvion`) REFERENCES `avion` (`num`),
  ADD CONSTRAINT `vol_ibfk_3` FOREIGN KEY (`numPilote`) REFERENCES `pilote` (`num`),
  ADD CONSTRAINT `vol_ibfk_4` FOREIGN KEY (`codeAerArr`) REFERENCES `aeroport` (`codeAer`);
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
--
-- Base de données :  `jardiplanteval`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` char(3) NOT NULL,
  `nom` char(32) NOT NULL,
  `mdp` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `mdp`) VALUES
('1', 'toto', 'toto'),
('2', 'titi', 'titi');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` char(32) NOT NULL,
  `libelle` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
('com', 'Composition'),
('fle', 'Fleurs'),
('pla', 'Plantes');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id` char(32) NOT NULL,
  `dateCommande` date DEFAULT NULL,
  `nomPrenomClient` char(32) DEFAULT NULL,
  `adresseRueClient` char(32) DEFAULT NULL,
  `cpClient` char(5) DEFAULT NULL,
  `villeClient` char(32) DEFAULT NULL,
  `mailClient` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCommande`, `nomPrenomClient`, `adresseRueClient`, `cpClient`, `villeClient`, `mailClient`) VALUES
('1101461660', '2011-07-12', 'Dupont Jacques', '12, rue haute', '75001', 'Paris', 'dupont@wanadoo.fr'),
('1101461665', '2011-07-20', 'Durant Yves', '23, rue des ombres', '75012', 'Paris', 'durant@free.fr');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE IF NOT EXISTS `contenir` (
  `idCommande` char(32) NOT NULL,
  `idProduit` char(32) NOT NULL,
  PRIMARY KEY (`idCommande`,`idProduit`),
  KEY `I_FK_CONTENIR_COMMANDE` (`idCommande`),
  KEY `I_FK_CONTENIR_Produit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contenir`
--

INSERT INTO `contenir` (`idCommande`, `idProduit`) VALUES
('1101461660', 'f03'),
('1101461660', 'p01'),
('1101461665', 'f05'),
('1101461665', 'p06');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` char(32) NOT NULL,
  `description` char(50) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `image` char(32) DEFAULT NULL,
  `idCategorie` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `I_FK_Produit_CATEGORIE` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `description`, `prix`, `image`, `idCategorie`) VALUES
('c01', 'Panier de fleurs variées', '53.00', 'images/compo/aniwa.gif', 'com'),
('c02', 'Coup de charme jaune', '38.00', 'images/compo/kos.gif', 'com'),
('c03', 'Bel arrangement de fleurs de saison', '68.00', 'images/compo/loth.gif', 'com'),
('c04', 'Coup de charme vert', '41.00', 'images/compo/luzon.gif', 'com'),
('c05', 'Très beau panier de fleurs précieuses', '98.00', 'images/compo/makin.gif', 'com'),
('c06', 'Bel assemblage de fleurs précieuses', '68.00', 'images/compo/mosso.gif', 'com'),
('c07', 'Présentation prestigieuse', '128.00', 'images/compo/rawaki.gif', 'com'),
('f01', 'Bouquet de roses multicolores', '58.00', 'images/fleurs/comores.gif', 'fle'),
('f02', 'Bouquet de roses rouges', '50.00', 'images/fleurs/grenadines.gif', 'fle'),
('f03', 'Bouquet de roses jaunes', '78.00', 'images/fleurs/mariejaune.gif', 'fle'),
('f04', 'Bouquet de petites roses jaunes', '48.00', 'images/fleurs/mayotte.gif', 'fle'),
('f05', 'Fuseau de roses multicolores', '63.00', 'images/fleurs/philippines.gif', 'fle'),
('f06', 'Petit bouquet de roses roses', '43.00', 'images/fleurs/pakopoka.gif', 'fle'),
('f07', 'Panier de roses multicolores', '78.00', 'images/fleurs/seychelles.gif', 'fle'),
('p01', 'Plante fleurie', '43.00', 'images/plantes/antharium.gif', 'pla'),
('p02', 'Pot de phalaonopsis', '58.00', 'images/plantes/galante.gif', 'pla'),
('p03', 'Assemblage paysagé', '103.00', 'images/plantes/lifou.gif', 'pla'),
('p04', 'Belle coupe de plantes blanches', '128.00', 'images/plantes/losloque.gif', 'pla'),
('p05', 'Pot de mitonia mauve', '83.00', 'images/plantes/papouasi.gif', 'pla'),
('p06', 'Pot de phalaonopsis blanc', '58.00', 'images/plantes/pionosa.gif', 'pla'),
('p07', 'Pot de phalaonopsis rose mauve', '58.00', 'images/plantes/sabana.gif', 'pla');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`);
--
-- Base de données :  `jardiplants`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` char(3) NOT NULL,
  `nom` char(32) NOT NULL,
  `mdp` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `nom`, `mdp`) VALUES
('1', 'toto', 'toto'),
('2', 'titi', 'titi');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` char(32) NOT NULL,
  `libelle` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
('com', 'Composition'),
('fle', 'Fleurs'),
('pla', 'Plantes');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id` char(32) NOT NULL,
  `dateCommande` date DEFAULT NULL,
  `nomPrenomClient` char(32) DEFAULT NULL,
  `adresseRueClient` char(32) DEFAULT NULL,
  `cpClient` char(5) DEFAULT NULL,
  `villeClient` char(32) DEFAULT NULL,
  `mailClient` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id`, `dateCommande`, `nomPrenomClient`, `adresseRueClient`, `cpClient`, `villeClient`, `mailClient`) VALUES
('1101461660', '2011-07-12', 'Dupont Jacques', '12, rue haute', '75001', 'Paris', 'dupont@wanadoo.fr'),
('1101461665', '2011-07-20', 'Durant Yves', '23, rue des ombres', '75012', 'Paris', 'durant@free.fr'),
('1101461666', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461667', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461668', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461669', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461670', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461671', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461672', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461673', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', '', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461674', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461675', '2016-09-30', 'Michel mafdre', 'sqfdg', 'hh', '4234', 'fghh'),
('1101461676', '2016-09-30', 'Michel mafdre', 'rjkzegfgfiosq', 'filsd', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461677', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461678', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461679', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', '', '125243541', 'rehsqgvbhgsq@gegfvzqugbsd'),
('1101461680', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '12524', 'rehsqgvbhgsq@gegfv.com'),
('1101461681', '2016-09-30', 'Guérin Rémi', 'rjkzegfgfiosq', 'gfbf', '12521', 'rehsqgvbhgsq@gegfvzqu.com');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE IF NOT EXISTS `contenir` (
  `idCommande` char(32) NOT NULL,
  `idProduit` char(32) NOT NULL,
  PRIMARY KEY (`idCommande`,`idProduit`),
  KEY `I_FK_CONTENIR_COMMANDE` (`idCommande`),
  KEY `I_FK_CONTENIR_Produit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `contenir`
--

INSERT INTO `contenir` (`idCommande`, `idProduit`) VALUES
('1101461660', 'f03'),
('1101461660', 'p01'),
('1101461665', 'f05'),
('1101461665', 'p06'),
('1101461671', 'f01'),
('1101461671', 'f02'),
('1101461671', 'f03'),
('1101461672', 'c04'),
('1101461672', 'f01'),
('1101461672', 'f02'),
('1101461672', 'f03'),
('1101461673', 'f01'),
('1101461673', 'f02'),
('1101461673', 'f03'),
('1101461674', 'f01'),
('1101461675', 'f01'),
('1101461675', 'f02'),
('1101461676', 'f01'),
('1101461676', 'f02'),
('1101461676', 'f03'),
('1101461677', 'f01'),
('1101461677', 'f02'),
('1101461677', 'f03'),
('1101461677', 'f04'),
('1101461678', 'p01'),
('1101461678', 'p02'),
('1101461679', 'f01'),
('1101461679', 'f02'),
('1101461680', 'f01'),
('1101461680', 'f02'),
('1101461680', 'p01'),
('1101461680', 'p02'),
('1101461681', 'f01'),
('1101461681', 'f02'),
('1101461681', 'f03'),
('1101461681', 'p01'),
('1101461681', 'p02'),
('1101461681', 'p03');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` char(32) NOT NULL,
  `description` char(50) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `image` char(32) DEFAULT NULL,
  `idCategorie` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `I_FK_Produit_CATEGORIE` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id`, `description`, `prix`, `image`, `idCategorie`) VALUES
('c01', 'Panier de fleurs variées', '53.00', 'images/compo/aniwa.gif', 'com'),
('c02', 'Coup de charme jaune', '38.00', 'images/compo/kos.gif', 'com'),
('c03', 'Bel arrangement de fleurs de saison', '68.00', 'images/compo/loth.gif', 'com'),
('c04', 'Coup de charme vert', '41.00', 'images/compo/luzon.gif', 'com'),
('c05', 'Très beau panier de fleurs précieuses', '98.00', 'images/compo/makin.gif', 'com'),
('c06', 'Bel assemblage de fleurs précieuses', '68.00', 'images/compo/mosso.gif', 'com'),
('c07', 'Présentation prestigieuse', '128.00', 'images/compo/rawaki.gif', 'com'),
('f01', 'Bouquet de roses multicolores', '58.00', 'images/fleurs/comores.gif', 'fle'),
('f02', 'Bouquet de roses rouges', '50.00', 'images/fleurs/grenadines.gif', 'fle'),
('f03', 'Bouquet de roses jaunes', '78.00', 'images/fleurs/mariejaune.gif', 'fle'),
('f04', 'Bouquet de petites roses jaunes', '48.00', 'images/fleurs/mayotte.gif', 'fle'),
('f05', 'Fuseau de roses multicolores', '63.00', 'images/fleurs/philippines.gif', 'fle'),
('f06', 'Petit bouquet de roses roses', '43.00', 'images/fleurs/pakopoka.gif', 'fle'),
('f07', 'Panier de roses multicolores', '78.00', 'images/fleurs/seychelles.gif', 'fle'),
('p01', 'Plante fleurie', '43.00', 'images/plantes/antharium.gif', 'pla'),
('p02', 'Pot de phalaonopsis', '58.00', 'images/plantes/galante.gif', 'pla'),
('p03', 'Assemblage paysagé', '103.00', 'images/plantes/lifou.gif', 'pla'),
('p04', 'Belle coupe de plantes blanches', '128.00', 'images/plantes/losloque.gif', 'pla'),
('p05', 'Pot de mitonia mauve', '83.00', 'images/plantes/papouasi.gif', 'pla'),
('p06', 'Pot de phalaonopsis blanc', '58.00', 'images/plantes/pionosa.gif', 'pla'),
('p07', 'Pot de phalaonopsis rose mauve', '58.00', 'images/plantes/sabana.gif', 'pla');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`);
--
-- Base de données :  `loireauthion`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `codePostal` int(5) NOT NULL,
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idClient`, `nom`, `adresse`, `ville`, `codePostal`, `mail`) VALUES
(1, 'Guerin Remi', '4 impasse des mimosas', 'BOUSSAY', 44190, 'thzgtfuin@gmail.com'),
(2, 'Sinan Thomas', '4 rue jsp', 'Saint Andre', 49111, 'xXlegitan.lebgdu49Xx@gmail.gow');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `idReservation` int(11) NOT NULL AUTO_INCREMENT,
  `idSalle` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `date` date NOT NULL,
  `horaire` time NOT NULL,
  `validation` int(11) NOT NULL,
  `annulation` int(11) NOT NULL,
  PRIMARY KEY (`idReservation`),
  KEY `idSalle` (`idSalle`,`idClient`),
  KEY `idClient` (`idClient`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`idReservation`, `idSalle`, `idClient`, `date`, `horaire`, `validation`, `annulation`) VALUES
(8, 4, 2, '2016-10-12', '15:30:00', 1, 0),
(9, 5, 1, '2016-10-27', '14:00:00', 1, 0),
(10, 6, 1, '2016-10-13', '20:00:00', 1, 0),
(11, 45, 2, '2016-10-12', '20:00:00', 1, 0),
(12, 45, 1, '2016-09-28', '20:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `nomSalle` varchar(255) NOT NULL,
  `nbPlaces` int(11) NOT NULL,
  `superficie` int(11) NOT NULL,
  `tarif` int(11) NOT NULL,
  PRIMARY KEY (`idSalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=46 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`idSalle`, `nomSalle`, `nbPlaces`, `superficie`, `tarif`) VALUES
(1, 'Salle Pierre de Coubertin', 623, 324, 24),
(2, 'Salle Jeanne de Lanoue', 60000000, 2, 12),
(3, 'Salle de Pierre Arditie', 5, 60000, 13),
(4, 'Salle Ade', 635, 600, 35),
(5, 'Salle A Malékoum', 546, 900, 64),
(6, 'Salle Ami', 633, 544, 89),
(45, 'Salle Ade de fruit Jouliiiie jouliie tu plais a mon perrrrrre tu plais a ma merrrrree', 2, 45000, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`idSalle`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);
--
-- Base de données :  `mediatheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherents`
--

CREATE TABLE IF NOT EXISTS `adherents` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `NUM_REFERENT` int(11) DEFAULT NULL,
  `NOM` char(255) NOT NULL,
  `PRENOM` char(255) NOT NULL,
  `DATENAISSANCE` date NOT NULL,
  `ADRESSE` char(255) NOT NULL,
  `VILLE` char(255) NOT NULL,
  `CP` bigint(5) NOT NULL,
  `TELEPHONE` bigint(10) NOT NULL,
  `MONTANT` bigint(4) NOT NULL,
  `DATEEMISSION` date NOT NULL,
  `ETUDIANT` smallint(6) NOT NULL,
  PRIMARY KEY (`NUM`),
  KEY `I_FK_ADHERENTS_ADHERENTS` (`NUM_REFERENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `adherents`
--

INSERT INTO `adherents` (`NUM`, `NUM_REFERENT`, `NOM`, `PRENOM`, `DATENAISSANCE`, `ADRESSE`, `VILLE`, `CP`, `TELEPHONE`, `MONTANT`, `DATEEMISSION`, `ETUDIANT`) VALUES
(1, 1, 'DUPONT', 'MAxime', '2000-02-12', 'rue de londres', 'Cholet', 49300, 606060606, 0, '2016-09-07', 1);

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `CODE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` char(255) DEFAULT NULL,
  `PRENOM` char(255) DEFAULT NULL,
  `PAYS` char(255) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`CODE`, `NOM`, `PRENOM`, `PAYS`) VALUES
(1, 'PROUST', 'Marcel', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `CODEG` int(11) NOT NULL,
  `LIBELLE` char(255) DEFAULT NULL,
  PRIMARY KEY (`CODEG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`CODEG`, `LIBELLE`) VALUES
(101, 'Cinéma documentaire : Art'),
(201, 'BD adaptation littéraire');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE IF NOT EXISTS `livres` (
  `NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CODEG` int(11) NOT NULL,
  `CODE` int(11) NOT NULL,
  `TITRE` char(255) DEFAULT NULL,
  `ISBN` char(255) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `DISPO` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`NUM`),
  KEY `I_FK_LIVRES_GENRE` (`CODEG`),
  KEY `I_FK_LIVRES_AUTEUR` (`CODE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `livres`
--

INSERT INTO `livres` (`NUM`, `CODEG`, `CODE`, `TITRE`, `ISBN`, `DATE`, `DISPO`) VALUES
(1, 101, 1, 'LE RETOUR', '1111', '2016-09-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `pret`
--

CREATE TABLE IF NOT EXISTS `pret` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NUM` int(11) NOT NULL,
  `DATEDEBUT` date DEFAULT NULL,
  `DATEFIN` date DEFAULT NULL,
  `RENOUVELLEMENT` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `I_FK_PRET_ADHERENTS` (`NUM`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `pret`
--

INSERT INTO `pret` (`ID`, `NUM`, `DATEDEBUT`, `DATEFIN`, `RENOUVELLEMENT`) VALUES
(1, 1, '2016-09-22', '2016-10-13', 0);

-- --------------------------------------------------------

--
-- Structure de la table `preter`
--

CREATE TABLE IF NOT EXISTS `preter` (
  `NUM` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`NUM`,`ID`),
  KEY `I_FK_PRETER_LIVRES` (`NUM`),
  KEY `I_FK_PRETER_PRET` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `adherents`
--
ALTER TABLE `adherents`
  ADD CONSTRAINT `referent` FOREIGN KEY (`NUM_REFERENT`) REFERENCES `adherents` (`NUM`);

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`CODEG`) REFERENCES `genre` (`CODEG`),
  ADD CONSTRAINT `livres_ibfk_2` FOREIGN KEY (`CODE`) REFERENCES `auteur` (`CODE`);

--
-- Contraintes pour la table `preter`
--
ALTER TABLE `preter`
  ADD CONSTRAINT `preter_ibfk_1` FOREIGN KEY (`NUM`) REFERENCES `livres` (`NUM`),
  ADD CONSTRAINT `preter_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `pret` (`ID`);
--
-- Base de données :  `rappel`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `numC` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `nomC` varchar(20) NOT NULL,
  `prenomC` varchar(20) NOT NULL,
  `adresseC` varchar(50) NOT NULL,
  `codepostalC` varchar(5) NOT NULL,
  `villeC` varchar(20) NOT NULL,
  `idregion` int(11) NOT NULL,
  PRIMARY KEY (`numC`),
  KEY `idregion` (`idregion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`numC`, `nomC`, `prenomC`, `adresseC`, `codepostalC`, `villeC`, `idregion`) VALUES
(64, 'GUERIN', ' Remi', '43 rue Saint Bonaventure', '49300', 'Cholet', 3),
(65, 'GUILLEMOT', 'Florian', '43 rue Saint Bonaventure', '49300', 'Cholet', 4),
(66, 'HILLERITEAU', 'Remi', '43 rue Saint Bonaventure', '49300', 'Cholet', 5),
(67, 'MABON', 'Marin', '43 rue Saint Bonaventure', '49300', 'Cholet', 5),
(68, 'MACE', 'Christopher', '43 rue Saint Bonaventure', '49300', 'Cholet', 1),
(69, 'MERLET', 'Florentin', '43 rue Saint Bonaventure', '49300', 'Cholet', 2),
(79, 'FONTENEAU', '  Alexis', '43 Rue saint bonaventure', '49300', 'Cholet', 1);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `region`
--

INSERT INTO `region` (`id`, `libelle`) VALUES
(1, 'Nord'),
(2, 'Ouest'),
(3, 'Est'),
(4, 'SudOuest'),
(5, 'SudEst');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idregion`) REFERENCES `region` (`id`);
--
-- Base de données :  `sioblog`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `date`, `titre`, `contenu`, `auteur`) VALUES
(4, '2016-12-05 15:21:43', 'Jean Jacques Goldman', 'Vous allez réussir ces épreuves', 'MDR'),
(5, '2016-12-05 15:34:14', 'Jean Jacques Goldman', 'Vous allez réussir ces épreuves', 'Thierry Henry');
--
-- Base de données :  `symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `categorie_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_23A0E663DA5256D` (`image_id`),
  KEY `IDX_23A0E66BCF5E72D` (`categorie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `image_id`, `categorie_id`, `date`, `titre`, `contenu`) VALUES
(17, 18, 3, '2016-10-26 16:24:00', 'Visites Séjour Angleterre', 'Que choisissez-vous comme visite ? Jaguar Range Rover ou Cadbury World ?\r\nConnaissez-vous le contenu des visites proposées ?'),
(18, 19, 3, '2016-10-26 16:32:00', 'Christ Church College', 'On pourra voir Harry Potter ?'),
(19, 20, 2, '2016-10-26 21:47:00', 'Expert en Symfony', 'Je vous assure que vous maîtriserez les bases de Symfony. Vous serez le maestro de ce framework. Quelle belle harmonie  en perspective !'),
(20, 21, 2, '2016-10-26 21:51:00', 'Les rois du MVC', 'Le patron d''architecture logicielle modèle-vue-contrôleur (en abrégé MVC, en anglais model-view-controller), tout comme les patrons modèle-vue-présentation ou présentation, abstraction, contrôle, est un modèle destiné à répondre aux besoins des applicatio'),
(22, 23, 3, '2016-10-26 22:02:00', 'Humour anglais', 'Il est admis par tous, ou presque, comme une certitude que l’humour anglais est très particulier, voire indéfinissable, au point, prétendent certains, qu’il ne ferait pas rire les Continentaux que nous sommes, incapables de le comprendre ou de l’apprécier');

-- --------------------------------------------------------

--
-- Structure de la table `article_auteur`
--

CREATE TABLE IF NOT EXISTS `article_auteur` (
  `article_id` int(11) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`auteur_id`),
  KEY `IDX_6F9D26C07294869C` (`article_id`),
  KEY `IDX_6F9D26C060BB6FE6` (`auteur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `article_auteur`
--

INSERT INTO `article_auteur` (`article_id`, `auteur_id`) VALUES
(17, 4),
(18, 4),
(18, 5),
(19, 4),
(20, 4),
(22, 4);

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`, `prenom`, `pseudo`) VALUES
(4, 'ProfesseursSIO', 'JMIMG', 'ProfsInfo'),
(5, 'EtudiantsSLAM', 'Tous', 'SLAMSIO2');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`) VALUES
(1, 'Stages'),
(2, 'Technologies'),
(3, 'Voyage en Angleterre');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`id`, `url`, `alt`) VALUES
(18, 'bundles/sioblog/Jaguar.jpg', 'Jaguar Range Rover'),
(19, 'bundles/sioblog/HarryPotter.jpg', 'Harry Potter'),
(20, 'bundles/sioblog/Symfony.png', 'Symfony'),
(21, 'bundles/sioblog/MVC.jpg', 'MVC'),
(22, 'bundles/sioblog/Stage.jpg', 'Stage'),
(23, 'bundles/sioblog/humour.jpg', 'Hurmour'),
(24, 'rzuilgh yubgjktrnmih !uioegt ewe qio et', 'bundles/sioblog/Symfony.png');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E663DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `FK_23A0E66BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `article_auteur`
--
ALTER TABLE `article_auteur`
  ADD CONSTRAINT `FK_6F9D26C060BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6F9D26C07294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE;
--
-- Base de données :  `test`
--
--
-- Base de données :  `transnat`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `numC` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `nomC` varchar(20) NOT NULL,
  `prenomC` varchar(20) NOT NULL,
  `adresseC` varchar(50) NOT NULL,
  `codepostalC` int(5) NOT NULL,
  `villeC` varchar(20) NOT NULL,
  `idregion` int(11) NOT NULL,
  PRIMARY KEY (`numC`),
  KEY `idregion` (`idregion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`numC`, `nomC`, `prenomC`, `adresseC`, `codepostalC`, `villeC`, `idregion`) VALUES
(62, 'ESSEUL', 'Steven', '43 rue Saint Bonaventure', 49300, 'Cholet', 2),
(63, 'FONTENEAU', 'Alexis', '43 rue Saint Bonaventure', 49300, 'Cholet', 3),
(64, 'GUERIN', 'Remi', '43 rue Saint Bonaventure', 49300, 'Cholet', 4),
(65, 'GUILLEMOT', 'Florian', '43 rue Saint Bonaventure', 49300, 'Cholet', 5),
(67, 'MABON', 'Marin', '43 rue Saint Bonaventure', 49300, 'Cholet', 2),
(68, 'MACE', 'Christopher', '43 rue Saint Bonaventure', 49300, 'Cholet', 3),
(69, 'MERLET', 'Florentin', '43 rue Saint Bonaventure', 49300, 'Cholet', 4),
(70, 'SINAN', 'Thomas', '43 rue Saint Bonaventure', 49300, 'Cholet', 5);

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `region`
--

INSERT INTO `region` (`id`, `libelle`) VALUES
(1, 'Nord'),
(2, 'Ouest'),
(3, 'Est'),
(4, 'SudOuest'),
(5, 'SudEst');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idregion`) REFERENCES `region` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
