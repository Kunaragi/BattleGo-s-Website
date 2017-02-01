-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 29 Janvier 2017 à 20:51
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `battlego`
--

-- --------------------------------------------------------

--
-- Structure de la table `attacks`
--

CREATE TABLE `attacks` (
  `id` int(11) NOT NULL,
  `src_pokemon_id` int(11) NOT NULL,
  `dst_pokemon_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pokedex`
--

CREATE TABLE `pokedex` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `hp` tinyint(255) UNSIGNED NOT NULL,
  `attaque_physique` tinyint(255) UNSIGNED NOT NULL,
  `attaque_speciale` tinyint(255) UNSIGNED NOT NULL,
  `defense` tinyint(255) UNSIGNED NOT NULL,
  `defense_speciale` tinyint(255) UNSIGNED NOT NULL,
  `speed` tinyint(255) UNSIGNED NOT NULL,
  `picture_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pokedex`
--

INSERT INTO `pokedex` (`id`, `name`, `description`, `hp`, `attaque_physique`, `attaque_speciale`, `defense`, `defense_speciale`, `speed`, `picture_url`) VALUES
(6, 'Bulbizarre', 'La graine sur le dos de Bulbizarre est une réserve de nutriments. Il la fait doucement pousser en absorbant les rayons du soleil, et emmagasine de l\'énergie dedans en vue de son évolution. S\'il dépense trop souvent son énergie, il n\'évoluera pas car l\'ouverture de son bulbe dépend de ses réserves de nutriments.\r\n', 45, 49, 49, 65, 65, 45, 'https://www.pokebip.com/pokedex/images/sugimori/1.png');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `pseudonyme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `token`, `pseudonyme`) VALUES
(1, 'bob@gmail.com', 'secret', 'secret1', 'Bob'),
(2, 'alice@gmail.com', 'secret', 'secret2', 'Alice'),
(3, 'oscar@gmail.com', 'secret', 'secret3', 'Oscar');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Index pour la table `attacks`
--
ALTER TABLE `attacks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `src_pokemon_id_2` (`src_pokemon_id`,`created_at`),
  ADD KEY `src_pokemon_id` (`src_pokemon_id`),
  ADD KEY `dst_pokemon_id` (`dst_pokemon_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Index pour la table `pokedex`
--
ALTER TABLE `pokedex`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `speed` (`speed`),
  ADD KEY `hp` (`hp`),
  ADD KEY `power` (`attaque_physique`),
  ADD KEY `attaque_speciale` (`attaque_speciale`,`defense`,`defense_speciale`);

--
-- Index pour la table `box`
--

ALTER TABLE `box`
  ADD PRIMARY KEY (`id`)
  ADD KEY `name` (`name`)
 

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `attacks`
--
ALTER TABLE `attacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pokedex`
--
ALTER TABLE `pokedex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attacks`
--
ALTER TABLE `attacks`
  ADD CONSTRAINT `attacks_ibfk_1` FOREIGN KEY (`src_pokemon_id`) REFERENCES `pokedex` (`id`),
  ADD CONSTRAINT `attacks_ibfk_2` FOREIGN KEY (`dst_pokemon_id`) REFERENCES `pokedex` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
