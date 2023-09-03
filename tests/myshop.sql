-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 03 sep. 2023 à 16:49
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `myshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `etat` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230829143427', '2023-08-29 16:35:12', 533),
('DoctrineMigrations\\Version20230830075416', '2023-08-30 09:54:39', 156);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `taille` varchar(50) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `titre`, `description`, `couleur`, `taille`, `collection`, `photo`, `prix`, `stock`, `date_enregistrement`) VALUES
(19, 'T-shirt col V', 'T-shirt col V de qualité supérieure avec…', 'bleu', 'S', 'Eté', 'https://image.uniqlo.com/UQ/ST3/WesternCommon/imagesgoods/447012/item/goods_66_447012.jpg?width=722&impolicy=quality_70&imformat=chrome', 90, 4, '2023-09-01 15:50:17'),
(20, 't-shirt', 'T-shirt normal', 'jaune', 'XS', 'Automne', 'https://wordans-a1a5.kxcdn.com/files/model_specifications/2016/4/11/224260/224260_big.jpg?1673695237', 55, 235, '2023-09-01 15:53:03'),
(21, 'T-shirt', 'T-shirt Femme', 'vert', 'XL', 'printent 2022', 'https://img01.ztat.net/article/spp-media-p1/7c28c19b1592433a801a0857b49dedfa/111020c2c1564cffa5c9bfa36312216b.jpg?imwidth=762&filter=packshot', 123, 3454, '2023-09-01 15:54:45'),
(22, 'jacket', 'jacket en cuir', 'rouge', 'M', 'Hiver', 'https://img01.ztat.net/article/spp-media-p1/f494c2be0b6749229ac708f61f642f3f/91703bdebabc4b1e9954fd204ae5152a.jpg?imwidth=762', 300, 355, '2023-09-03 14:46:08');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `civilite` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `roles`, `password`, `nom`, `prenom`, `email`, `civilite`, `date_enregistrement`) VALUES
(1, 'jose', '[\"ROLE_ADMIN\"]', '$2y$13$ahCSZNDpqdK0pSCMmAOLkuhq7pWmfB3UtKD2Uao7ovcj5AneD.7G.', 'jose', 'jose', 'ayelesso6@gmail.com', 'jose', '2023-08-30 10:34:07'),
(2, 'pol', '[]', '$2y$13$mL4orBsrbq7vPANu0K3nEeg9PWZ4tNo2jNFBBUKiBYGl2JZhTmZfm', 'tot', 'lo', 'djd@gmail.com', 'der', '2023-08-30 14:18:15'),
(3, 'dodo', '[]', '$2y$13$2Dip6QfBuNAPH225FZCFSun.rjRh74OC2EQyVGtnJaMGuRXqqdstG', 'ddd', 'dddd', 'nxn@gmail.com', 'fff', '2023-08-31 23:43:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67DF347EFB` (`produit_id`),
  ADD KEY `IDX_6EEAA67DA76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64986CC499D` (`pseudo`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `FK_6EEAA67DF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
