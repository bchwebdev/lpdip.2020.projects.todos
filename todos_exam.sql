-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : Dim 17 mai 2020 à 15:57
-- Version du serveur :  8.0.20
-- Version de PHP : 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `todos_exam`
--

-- --------------------------------------------------------

--
-- Structure de la table `list`
--

CREATE TABLE `list` (
  `id` int NOT NULL,
  `label` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `list`
--

INSERT INTO `list` (`id`, `label`, `description`) VALUES
(1, 'repeindre les volets', 'en rouge'),
(2, 'laver la voiture', 'à la javel'),
(3, 'faire à manger 2*', 'et que ce soit bon'),
(4, 'Film', '');

-- --------------------------------------------------------

--
-- Structure de la table `todo`
--

CREATE TABLE `todo` (
  `id` int NOT NULL,
  `label` varchar(250) NOT NULL,
  `idList` int NOT NULL,
  `isDone` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `todo`
--

INSERT INTO `todo` (`id`, `label`, `idList`, `isDone`) VALUES
(5, 'Le seigneur des anneaux', 4, 0),
(6, 'Matrix', 4, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlist` (`idList`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `list`
--
ALTER TABLE `list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `FKlist` FOREIGN KEY (`idList`) REFERENCES `list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
