-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  lun. 08 juil. 2019 à 18:38
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `numero_voie` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_voie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_voie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_postal` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `numero_voie`, `type_voie`, `nom_voie`, `complement`, `code_postal`, `ville`, `client_id`) VALUES
(2, '32 bis', 'Boulevard', 'Jean Médecin', NULL, '06000', 'Nice', 1),
(3, '13', 'Rue', 'Charles De Gaulle', 'Bâtiment D', '13100', 'Marseille', 2),
(4, '1', 'Rue', 'Stanislas', NULL, '06400', 'Cannes', 4),
(5, '21 - 24', 'Place', 'Bellecour', NULL, '69000', 'Lyon', 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `email`, `telephone`, `password`) VALUES
(1, 'Dupont', 'Jean', 'dupont.jean@gmail.com', '0684526952', 'klmsgdfgjlmsjg4dsfg65s4dFFGrg785dg7sg7sdf968g7sd8g74sg4s96gdd'),
(2, 'Raye', 'Félix', 'f.raye@gmail.com', '0648548965', 'jkljflqqfdqFQSDFqsjlfqsfjqlsjfqfsf7e74rgfd6g4srgDRSG'),
(3, 'Lalanne', 'Jacques', 'j.lalanne@gmail.com', '0625458963', 'jhkkqsjdfhlkKYHdfkqhfkqsdf4d5f54h54jghf6j46fdrggdFG45rdtrt756fgdgs'),
(4, 'Jacquet', 'Raymond', 'j.raymond@gmail.com', '0625145632', 'SSS34RTTYytfyifdgsjiodghffgHTty676khjfgklgjdhfkjlhkdflyh66UHJFYUedtyuufguuFFrtrr775');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `reference` int(11) NOT NULL,
  `date_commande` datetime NOT NULL,
  `prix_total_ht` decimal(10,2) NOT NULL,
  `prix_total_ttc` decimal(10,2) NOT NULL,
  `client_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`reference`, `date_commande`, `prix_total_ht`, `prix_total_ttc`, `client_id`, `adresse_id`) VALUES
(1001, '2019-06-11 12:00:00', '13.00', '15.60', 1, 2),
(1002, '2019-06-11 11:20:00', '9.20', '11.04', 4, 4),
(1003, '2019-06-12 00:00:00', '11.50', '13.80', 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `produit_id` int(11) NOT NULL,
  `commande_reference` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`produit_id`, `commande_reference`, `quantite`) VALUES
(1, 1001, 1),
(1, 1002, 1),
(3, 1001, 1),
(3, 1002, 1),
(5, 1003, 2);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id` int(11) NOT NULL,
  `statut` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_livraison` datetime NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `commande_reference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`id`, `statut`, `date_livraison`, `livreur_id`, `commande_reference`) VALUES
(1, 'Livré', '2019-06-11 12:23:00', 1, 1001),
(2, 'Livré', '2019-06-11 12:02:00', 2, 1002),
(3, 'Livré', '2019-06-12 12:30:00', 3, 1003);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `nom`, `prenom`, `password`, `statut`, `longitude`, `latitude`) VALUES
(1, 'Dubois', 'Rémy', 'lksfdjqmf34fdskDSQF466FSgsdgksdljgmlsSF45sfjdDSGsdlkgjdsg45fjgsklg78kgflsjgslmdjgFGSD', 'Disponible', '2.3587388837891012', '48.847240788170275'),
(2, 'Alonso', 'Michael', 'hjdsqkhfq34TRFGksdlgjslmfjfqsDFSFQSf343fksdqljfqjfkjqsljfe3fjhguhu43dfSSfQTG34gdrt34', 'Disponible', '2.3587388837891045', '48.847240788170223'),
(3, 'Dufour', 'Olivia', 'SQDFQSD34Fsdfqfege45fdqsg567fsggsdfgDFGQErfergfD45677gdfsggsdFGgTSGr45ftgSDGGSDFGSD', 'Disponible', '2.3587388837891052', '48.847240788170285'),
(4, 'Marchand', 'Géraldine', 'SDFQ34TdrrdTRERgFDSFGSD45445rrgGDSGSDGSD45gdfsgsdgdfs45RtgrTRgssdGSHTHRT45fgSDGSDFGSDG', 'En livraison', '2.3587388837891066', '48.8472407881702231'),
(5, 'Joli', 'Romain', 'DFGSV45ghfghdhgH5654h87678hghfdhfFGHfdhFGHDRE455fdsgsdfFGGG54FDGSgsdgsjsgdh2hnjq', 'En congé', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix_unitaire_ht` decimal(10,2) NOT NULL,
  `date_fabrication` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `description`, `type`, `prix_unitaire_ht`, `date_fabrication`) VALUES
(1, 'Tagliatelles Carbonara', 'De très bonne pâtes!!!', 'Plat', '11.00', '2019-06-11'),
(2, 'Pizza au Pistou', 'Une succulente pizza !', 'Plat', '10.00', '2019-06-11'),
(3, 'Glace au caramel', 'Une délicieuse glace!', 'Dessert', '5.00', '2019-06-11'),
(4, 'Tarte aux Pommes', 'Une délicieuse part de tarte aux pommes!', 'Dessert', '5.00', '2019-06-11'),
(5, 'Quiche Lorraine', 'Une part quiche Lorraine fabriquée de manière traditionnelle: lardon fumés, crème fraîche, oeufs.', 'Plat', '5.60', '2019-06-12'),
(6, 'Soupe de Poissons', 'Véritable soupe de poissons avec des poissons frais!', 'Plat', '6.90', '2019-06-12'),
(7, 'Fondant au chocolat', 'Délicieuse part de fondant au chocolat noir.', 'Dessert', '3.50', '2019-06-12'),
(8, 'Île flottante', 'Succulente île flottante avec de la crème anglaise faite maison!', 'Dessert', '3.60', '2019-06-12');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_client_id` (`client_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`reference`),
  ADD KEY `fk_commande_client_id` (`client_id`),
  ADD KEY `fk_commande_adresse_id` (`adresse_id`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`produit_id`,`commande_reference`) USING BTREE,
  ADD KEY `fk_ligne_commande_commande_reference` (`commande_reference`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_livraison_livreur_id` (`livreur_id`),
  ADD KEY `fk_livraison_commande_reference` (`commande_reference`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_adresse_id` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`),
  ADD CONSTRAINT `fk_commande_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_commande_reference` FOREIGN KEY (`commande_reference`) REFERENCES `commande` (`reference`),
  ADD CONSTRAINT `fk_ligne_commande_produit_id` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_livraison_commande_reference` FOREIGN KEY (`commande_reference`) REFERENCES `commande` (`reference`),
  ADD CONSTRAINT `fk_livraison_livreur_id` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
