-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : db5001719474.hosting-data.io
-- Généré le : Dim 28 fév. 2021 à 17:43
-- Version du serveur :  5.7.32-log
-- Version de PHP : 7.0.33-0+deb9u10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbs1420852`
--
DROP DATABASE IF EXISTS `dbs1420852`;
CREATE DATABASE IF NOT EXISTS `dbs1420852` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbs1420852`;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `dateadd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `dateadd`) VALUES
(78, 'FREDO', 'FRANCOIS', '2021-02-19 18:40:46'),
(79, 'FRANCIS', 'CABRELLE', '2021-02-19 18:44:07'),
(81, 'ZOTTA', 'LAZZOTA', '2021-02-19 18:47:36'),
(82, 'MATTEO', 'MATTA', '2021-02-19 18:49:18'),
(84, 'POISSON', 'DAVRIL', '2021-02-19 19:56:50'),
(95, 'Gaelle', 'LAGAMELLE', '2021-02-23 20:04:54'),
(101, 'Nathalie', 'NATHALIE', '2021-02-25 10:36:05'),
(112, 'Purple', 'GIRAFFE', '2021-02-27 16:33:27'),
(117, 'LABBE', 'QUILLE', '2021-02-27 16:50:38'),
(137, 'Maxime', 'BRITTO', '2021-02-28 09:29:14');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
