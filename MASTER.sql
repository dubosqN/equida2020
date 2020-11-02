-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u9
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 13 Octobre 2020 à 10:04
-- Version du serveur :  5.5.62-0+deb8u1
-- Version de PHP :  5.6.40-0+deb8u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `MASTER`
--

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

CREATE TABLE IF NOT EXISTS `categvente` (
  `code` varchar(5) CHARACTER SET latin1 NOT NULL,
  `libelle` varchar(30) CHARACTER SET latin1 NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `categvente`
--

INSERT INTO `categvente` (`code`, `libelle`, `img_url`) VALUES
('AUT', 'Vente d''automne', 'automne.jpg'),
('ELVG', 'Vente d''élevage', 'test.jpg'),
('ETE', 'Vente d''été', 'ete.jpg'),
('XFEV', 'Vente mixte de février', 'hiver.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

CREATE TABLE IF NOT EXISTS `cheval` (
`id` int(11) NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `sexe` varchar(1) DEFAULT NULL,
  `prixDepart` int(25) DEFAULT NULL,
  `SIRE` varchar(20) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1',
  `id_client` int(11) DEFAULT NULL,
  `id_typeCheval` int(11) DEFAULT NULL,
  `id_mere` int(11) DEFAULT NULL,
  `id_pere` int(11) DEFAULT NULL,
  `idEntraineur` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `prixDepart`, `SIRE`, `img_url`, `isActive`, `id_client`, `id_typeCheval`, `id_mere`, `id_pere`, `idEntraineur`) VALUES
(1, 'Tonnerre', 'M', 100, 'ODL0010', '03.jpg', 1, 23, 2, 5, 5, 1),
(2, 'Fleurette', 'F', 100, 'LOP91093', 'black-head-horse-side-view-with-horsehair.png', 1, 22, 1, 5, 5, 2),
(3, 'Pablo', 'M', 100, 'OLD01LD', '03.jpg', 1, 22, 2, 2, 1, 1),
(4, 'TomChauvin', 'M', 100, 'OLODP9001', 'cheval1.jpg', 1, 22, 2, 2, 1, 2),
(5, 'Parents Inconnus', '/', 0, '/', 'black-head-horse-side-view-with-horsehair.png', 0, 22, 2, NULL, NULL, 1),
(6, 'Hugo', 'F', 100, 'HDF10', 'black-head-horse-side-view-with-horsehair.png', 0, 18, 2, 3, 2, 2),
(7, 'DUBOSQ', 'F', 1, 'DADFL', NULL, 1, 1, 1, 1, 1, NULL),
(8, 'DUBOSQ', 'F', 123, 'dadaa', NULL, 1, 22, 1, 2, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`id` int(11) NOT NULL,
  `nom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `prenom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `rue` varchar(60) CHARACTER SET latin1 NOT NULL,
  `copos` varchar(5) CHARACTER SET latin1 NOT NULL,
  `ville` varchar(40) CHARACTER SET latin1 NOT NULL,
  `mail` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `codePays` varchar(3) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `rue`, `copos`, `ville`, `mail`, `codePays`) VALUES
(1, 'Deltour', 'Charles', '4 rue du Pont', '14680', 'Bretteville Sur Laize', 'cdeltour@hotmail.com', 'FRA'),
(2, 'Fime', 'Nadia', '5 rue du Montparnasse', '14220', 'Boulon', '', 'ENG'),
(3, 'Ertau', 'Frank', '4 Avenue du président Wilson', '14190', 'Urville', 'frank.ertau@laposte.net', 'FRA'),
(4, 'Maneur', 'David', '6 rue Charles Péguy', '14220', 'Mutrécy', '', 'FRA'),
(5, 'Berezovski', 'Sylvie', '18 rue du Château', '14680', 'Barbery', '', 'FRA'),
(6, 'Finley', 'Pascale', '25 rue de Tolbiac', '14680', 'Caillouet', 'pascfinley@yahoo.fr', 'FRA'),
(7, 'Vofur', 'Hector', '18 rue Deparcieux', '14190', 'Cauvicourt', 'hvofur@free.fr', 'ENG'),
(8, 'Derzou', 'Fred', '230 avenue de la libert', '14220', 'Espins', 'ouzala@aol.com', 'FRA'),
(9, 'Serty', 'Julie', '23 rue du Calvaire', '14220', 'Fresney le Vieux', '', 'FRA'),
(10, 'Vofur', 'Victor', '18 rue Deparcieux', '14680', 'Bretteville Sur Laize', 'victor.vofur@laposte.net', 'FRA'),
(11, 'Calende', 'Hugo', '22 rue des jardins', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(12, 'Jemba', 'Hubert', '10 rue du 8 mai 1945', '14680', 'Bretteville Sur Laize', 'jaimeba@yahoo.fr', 'FRA'),
(13, 'Morin', 'S?verine', '4 rue du bac', '93000', 'Paris', 'morinsev@hotmail.com', 'FRA'),
(14, 'Benrech', 'Tarek', '79 rue de Caen', '14320', 'May Sur Orne', '', 'FRA'),
(15, 'Nguyen', 'Marc', '53 impasse Tourneur', '14320', 'Fontenay Le Marmion', 'nguyen774@wanadoo.fr', 'FRA'),
(16, 'Louali', 'Karima', '89 avenue Poincar', '14320', 'Saint Martin de Fontenay', 'kloua@caramail.fr', 'FRA'),
(17, 'Paolo', 'Marco', '14 rue du Caire', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(18, 'Map', 'Joanna', '120 boulevard Voltaire', '75012', 'Paris', '', 'FRA'),
(19, 'Kound', 'Fatoumata', '4 Place Carr', '14190', 'Urville', '', 'FRA'),
(20, 'Derissam', 'Bachir', '1 rue des Indes', '14190', 'Urville', '', 'FRA'),
(21, 'Villechalane', 'Louis', '8 rue des Charmes', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(22, 'Andre', 'David', '1 rue Petit', '14220', 'Boulon', '', 'FRA'),
(23, 'Bedos', 'Christian', '1 rue Peranud', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(24, 'Tusseau', 'Louis', '22 rue des Ternes', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(25, 'Bentot', 'Pascal', '11 allée des Cerises', '14220', 'Boulon', '', 'FRA'),
(26, 'Bioret', 'Luc', '1 Avenue gambetta', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(27, 'Bunisset', 'Francis', '10 rue des Perles', '14220', 'Espins', '', 'FRA'),
(28, 'Bunisset', 'Denise', '23 rue Manin', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(29, 'Cacheux', 'Bernard', '114 rue Blanche', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(30, 'Cadic', 'Eric', '123 avenue de la République', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(31, 'Charoze', 'Catherine', '100 rue Petit', '14220', 'Boulon', '', 'FRA'),
(32, 'Clepkens', 'Christophe', '12 allée des Anges', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(33, 'Cottin', 'Vincenne', '36 rue Des Roches', '14220', 'Boulon', '', 'FRA'),
(34, 'Daburon', 'François', '13 rue de Chanzy', '14220', 'Mutrécy', '', 'FRA'),
(35, 'De', 'Philippe', '13 rue Barthes', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(36, 'Debelle', 'Michel', '181 avenue Barbusse', '14220', 'Espins', '', 'FRA'),
(37, 'Debelle', 'Jeanne', '134 allée des Joncs', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(38, 'Debroise', 'Michel', '2 Bld Jourdain', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(39, 'Desmarquest', 'Nathalie', '14 Place d Arc', '14220', 'Boulon', '', 'FRA'),
(40, 'Desnost', 'Pierre', '16 avenue des Cèdres', '14220', 'Mutrécy', '', 'FRA'),
(41, 'Dudouit', 'Frédéric', '18 rue de l église', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(42, 'Duncombe', 'Claude', '19 rue de la tour', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(43, 'Enault-Pascreau', 'Céline', '25 place de la gare', '14680', 'Bretteville Sur Laize', '', 'FRA'),
(44, 'Eynde', 'Valérie', '3 Grand Place', '14220', 'Mutrécy', '', 'FRA'),
(45, 'Finck', 'Jacques', '10 avenue du Prado', '14320', 'Fontenay Le Marmion', '', 'FRA'),
(46, 'Frémont', 'Fernande', '4 route de la mer', '14220', 'Espins', '', 'FRA'),
(47, 'Gest', 'Alain', '30 avenue des terres', '14320', 'Saint Martin de Fontenay', '', 'FRA'),
(48, 'Testemale', 'tarek', 'du trek', '14000', 'Tarascon', NULL, 'FRA'),
(49, 'Trieste', 'Thierry', 'du tertre', '14000', 'Tologne', NULL, 'FRA'),
(50, 'test04sept', 'luc', 'de ahjk', '121', 'jkjklj', NULL, 'FRA');

-- --------------------------------------------------------

--
-- Structure de la table `clientcategvente`
--

CREATE TABLE IF NOT EXISTS `clientcategvente` (
  `codeClient` int(11) NOT NULL,
  `codeCategVente` varchar(5) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `clientcategvente`
--

INSERT INTO `clientcategvente` (`codeClient`, `codeCategVente`) VALUES
(6, 'AUT'),
(49, 'AUT'),
(1, 'ELVG'),
(1, 'ETE'),
(3, 'ETE'),
(6, 'ETE'),
(7, 'ETE'),
(16, 'ETE'),
(49, 'ETE'),
(50, 'ETE'),
(6, 'XFEV');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE IF NOT EXISTS `contenir` (
  `id_pj` int(11) NOT NULL,
  `id_mail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
`id` int(11) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `dateCourse` varchar(10) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `course`
--

INSERT INTO `course` (`id`, `libelle`, `dateCourse`, `position`, `ville`) VALUES
(1, 'CSO des Yvelines ', '20/08/2000', NULL, 'Yvelines '),
(2, 'CSO de Caen', '20/08/2000', NULL, 'Caen');

-- --------------------------------------------------------

--
-- Structure de la table `entraineur`
--

CREATE TABLE IF NOT EXISTS `entraineur` (
`id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entraineur`
--

INSERT INTO `entraineur` (`id`, `nom`, `prenom`) VALUES
(1, 'Adala', 'Yanis '),
(2, 'Micky', 'Mortbriant');

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE IF NOT EXISTS `lieu` (
`id` int(11) NOT NULL,
  `ville` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `nbBoxes` int(3) DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_bin
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville`, `nbBoxes`, `commentaire`) VALUES
(1, 'Caen', 3, 'TestTest'),
(2, 'Hérouville Saint Clair', 5, 'Test2');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE IF NOT EXISTS `lot` (
`id` int(11) NOT NULL,
  `prixDepart` int(11) DEFAULT NULL,
  `id_cheval` int(11) DEFAULT NULL,
  `id_vente` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `lot`
--

INSERT INTO `lot` (`id`, `prixDepart`, `id_cheval`, `id_vente`) VALUES
(1, 50, 4, 210717),
(2, 20, 1, 210717);

-- --------------------------------------------------------

--
-- Structure de la table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
`id` int(11) NOT NULL,
  `date_mail` date DEFAULT NULL,
  `objet` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `corps` text COLLATE utf8mb4_bin,
  `id_vente` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `mail`
--

INSERT INTO `mail` (`id`, `date_mail`, `objet`, `corps`, `id_vente`) VALUES
(1, '2020-09-09', 'Test', 'TESTTEST', 30917),
(2, '2020-09-24', 'KDKDKD', 'KDKDKDKD', 90217);

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE IF NOT EXISTS `participer` (
`id` int(11) NOT NULL,
  `place` int(11) DEFAULT NULL,
  `id_course` int(11) DEFAULT NULL,
  `id_cheval` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `participer`
--

INSERT INTO `participer` (`id`, `place`, `id_course`, `id_cheval`) VALUES
(1, 10, 2, 2),
(2, 1, 2, 3),
(3, 8, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `code` varchar(3) CHARACTER SET latin1 NOT NULL,
  `nom` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`code`, `nom`) VALUES
('ENG', 'Angleterre'),
('FRA', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `piecesjointes`
--

CREATE TABLE IF NOT EXISTS `piecesjointes` (
`id` int(11) NOT NULL,
  `cheminAcces` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` int(11) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id`, `libelle`) VALUES
(1, 'admin'),
(2, 'employee'),
(3, 'acheteur'),
(4, 'vendeur');

-- --------------------------------------------------------

--
-- Structure de la table `typecheval`
--

CREATE TABLE IF NOT EXISTS `typecheval` (
`id` int(11) NOT NULL,
  `libelle` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typecheval`
--

INSERT INTO `typecheval` (`id`, `libelle`, `description`) VALUES
(1, 'Palomino', 'poils fauve clair plus ou moins dorés'),
(2, 'Isabelle', ' poils de couleur crème, des crins blancs à grisâtres, une peau rose, des yeux clairs souvent bleus mais parfois aussi verts ou noisette');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
`id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `password`, `email`, `id_role`, `id_client`) VALUES
(1, 'Noe', 'mpnoe', 'noe', 1, 1),
(2, 'pablo', 'mppablo', 'pablo@gmail.com', 2, 17),
(3, 'melvyn', 'mpmelvin', 'melvyn@mail.com', 3, 2),
(4, 'marco', 'mpmarco', 'marco214251@gmail.com', 4, 10);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE IF NOT EXISTS `vente` (
`id` int(11) NOT NULL,
  `nom` varchar(40) CHARACTER SET latin1 NOT NULL,
  `dateDebut` date NOT NULL,
  `codeCategVente` varchar(5) CHARACTER SET latin1 NOT NULL,
  `id_lieu` int(11) DEFAULT NULL,
  `isActive` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=250221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `vente`
--

INSERT INTO `vente` (`id`, `nom`, `dateDebut`, `codeCategVente`, `id_lieu`, `isActive`) VALUES
(30917, 'Garibaldi Princess', '2017-03-09', 'ELVG', 1, 1),
(90217, 'Mixing brain', '2017-09-02', 'XFEV', 2, 1),
(210717, 'Rapsberry Sailing', '2017-07-17', 'ETE', 1, 1),
(210817, 'Jelly Bay', '2017-08-17', 'ETE', 1, 1),
(250217, 'Djezair Star', '2017-02-25', 'XFEV', 2, 1),
(250218, 'Vente', '2020-10-15', 'XFEV', 2, 1),
(250219, 'Vente de chiens', '2020-10-28', 'AUT', 1, 1),
(250220, 'Vente de boules de neiges ', '2020-10-14', 'AUT', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `vente_typecheval`
--

CREATE TABLE IF NOT EXISTS `vente_typecheval` (
  `id_vente` int(11) NOT NULL,
  `id_typeCheval` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `vente_typecheval`
--

INSERT INTO `vente_typecheval` (`id_vente`, `id_typeCheval`) VALUES
(210717, 1),
(250217, 2);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categvente`
--
ALTER TABLE `categvente`
 ADD PRIMARY KEY (`code`);

--
-- Index pour la table `cheval`
--
ALTER TABLE `cheval`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_CHETYP` (`id_typeCheval`), ADD KEY `FK_CHECLI` (`id_client`), ADD KEY `FK_CHECHE` (`id_mere`), ADD KEY `FK_CHECHE2` (`id_pere`), ADD KEY `fk_entche` (`idEntraineur`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_cli_pays` (`codePays`);

--
-- Index pour la table `clientcategvente`
--
ALTER TABLE `clientcategvente`
 ADD PRIMARY KEY (`codeClient`,`codeCategVente`), ADD KEY `FK_cliCat_Categ` (`codeCategVente`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
 ADD PRIMARY KEY (`id_pj`,`id_mail`), ADD KEY `id_pj` (`id_pj`), ADD KEY `id_mail` (`id_mail`) USING BTREE;

--
-- Index pour la table `course`
--
ALTER TABLE `course`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `entraineur`
--
ALTER TABLE `entraineur`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_LOTCHE` (`id_cheval`), ADD KEY `FK_LOTVEN` (`id_vente`);

--
-- Index pour la table `mail`
--
ALTER TABLE `mail`
 ADD PRIMARY KEY (`id`), ADD KEY `id_vente` (`id_vente`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_COU_PAR` (`id_course`), ADD KEY `FK_COU_CHE` (`id_cheval`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
 ADD PRIMARY KEY (`code`);

--
-- Index pour la table `piecesjointes`
--
ALTER TABLE `piecesjointes`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `typecheval`
--
ALTER TABLE `typecheval`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_ROLEUSER` (`id_role`), ADD KEY `FK_CLIUSER` (`id_client`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
 ADD PRIMARY KEY (`id`), ADD KEY `codeCategVente` (`codeCategVente`), ADD KEY `index_lieu` (`id_lieu`) USING BTREE;

--
-- Index pour la table `vente_typecheval`
--
ALTER TABLE `vente_typecheval`
 ADD PRIMARY KEY (`id_typeCheval`,`id_vente`), ADD KEY `FK_VENTYPE_vente` (`id_vente`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `cheval`
--
ALTER TABLE `cheval`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT pour la table `course`
--
ALTER TABLE `course`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `entraineur`
--
ALTER TABLE `entraineur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `lot`
--
ALTER TABLE `lot`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `mail`
--
ALTER TABLE `mail`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `participer`
--
ALTER TABLE `participer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `piecesjointes`
--
ALTER TABLE `piecesjointes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `typecheval`
--
ALTER TABLE `typecheval`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=250221;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
ADD CONSTRAINT `fk_entche` FOREIGN KEY (`idEntraineur`) REFERENCES `entraineur` (`id`),
ADD CONSTRAINT `FK_CHECHE` FOREIGN KEY (`id_mere`) REFERENCES `cheval` (`id`),
ADD CONSTRAINT `FK_CHECHE2` FOREIGN KEY (`id_pere`) REFERENCES `cheval` (`id`),
ADD CONSTRAINT `FK_CHECLI` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
ADD CONSTRAINT `FK_CHETYP` FOREIGN KEY (`id_typeCheval`) REFERENCES `typecheval` (`id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
ADD CONSTRAINT `FK_cli_pays` FOREIGN KEY (`codePays`) REFERENCES `pays` (`code`);

--
-- Contraintes pour la table `clientcategvente`
--
ALTER TABLE `clientcategvente`
ADD CONSTRAINT `FK_cliCat_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`),
ADD CONSTRAINT `FK_cliCat_client` FOREIGN KEY (`codeClient`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
ADD CONSTRAINT `contenir_ibfk_1` FOREIGN KEY (`id_mail`) REFERENCES `mail` (`id`),
ADD CONSTRAINT `contenir_ibfk_2` FOREIGN KEY (`id_pj`) REFERENCES `piecesjointes` (`id`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
ADD CONSTRAINT `FK_LOTCHE` FOREIGN KEY (`id_cheval`) REFERENCES `cheval` (`id`),
ADD CONSTRAINT `FK_LOTVEN` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `mail`
--
ALTER TABLE `mail`
ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
ADD CONSTRAINT `FK_COU_CHE` FOREIGN KEY (`id_cheval`) REFERENCES `cheval` (`id`),
ADD CONSTRAINT `FK_COU_PAR` FOREIGN KEY (`id_course`) REFERENCES `course` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
ADD CONSTRAINT `FK_CLIUSER` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
ADD CONSTRAINT `FK_ROLEUSER` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
ADD CONSTRAINT `FK_VENLIE` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`),
ADD CONSTRAINT `FK_Ven_Categ` FOREIGN KEY (`codeCategVente`) REFERENCES `categvente` (`code`);

--
-- Contraintes pour la table `vente_typecheval`
--
ALTER TABLE `vente_typecheval`
ADD CONSTRAINT `FK_VENTYPE_typeCheval` FOREIGN KEY (`id_typeCheval`) REFERENCES `typecheval` (`id`),
ADD CONSTRAINT `FK_VENTYPE_vente` FOREIGN KEY (`id_vente`) REFERENCES `vente` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;