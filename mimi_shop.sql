-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 16. Sep 2021 um 11:10
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mimi_shop`
--
CREATE DATABASE IF NOT EXISTS `mimi_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mimi_shop`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201215122946', '2021-09-13 17:37:31', 42),
('DoctrineMigrations\\Version20201215150141', '2021-09-13 17:37:31', 66);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_ref_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `image`, `size`, `material`, `type`) VALUES
(8, 'Summer Boots', 'Boots for the summer', 200, 'https://www.megainvest.ro/webmanagement/images/uploaded/products/bocanci_vara_02__new_thumb_1200.JPG', '37', 'Leather', 'Boots'),
(9, 'Acvilla Boots', 'good for hard use', 45, 'https://www.megainvest.ro/webmanagement/images/uploaded/products/bocanci_vibram_farafermoar_01__new_thumb_1200.JPG', '39', 'Leather', 'Boots'),
(10, 'Clima Cool Boots', 'good for climate change', 90, 'https://www.sabotini.ro/wp-content/uploads/2020/05/bocanci-de-vara-din-piele-neagra-si-plasa-neagra-1.jpg', '40', 'Leather', 'Boots'),
(11, 'Pride Boots', 'for pride and justice', 60, 'https://passofino.com/wp-content/uploads/2020/07/Bocanci-vara-decupati-Morena-Black-Passofino-3.jpg', '39', 'Natural Leather', 'Boots'),
(12, 'Desert Boots', 'good for the travelers inside', 99, 'https://www.vipershop.ro/large/products/424ed92f7513f1615a7eb471045069f6.jpg', '38', 'Sustainable Leather', 'Boots'),
(13, 'Bride Pumps', 'pumps for the bride', 180, 'https://www.pantofi-de-mireasa.ro/image/cache/catalog/pantofi-modele-2018/pantofi-mireasa-model-luciana-09a-850x600.jpg', '36', 'Leather', 'Pumps'),
(14, 'Pink Pumps', 'pink and stylish', 120, 'http://reduceriofertepromotii.ro/cdn/p/201605/pantofi-bej-cu-toc-inalt-din-piele-naturala-model-pp-2308-20831-1463054101.jpg', '39', 'Leather', 'Pumps'),
(15, 'Bride Pumps Chic', 'for the special ones', 160, 'https://cdn.shopify.com/s/files/1/2453/3559/products/1_7_1024x1024.jpg?v=1510134156', '38', 'Leather', 'Pumps'),
(16, 'Black Pumps', 'for the dark times', 99, 'https://cdn.webshopapp.com/shops/178199/files/206515070/1000x1300x2/giaro-schwarz-matte-giaro-destroyer-pumps.jpg', '37', 'Leather', 'Pumps'),
(17, 'Black Sneakers MoMo', 'for the wild ones', 90, 'https://cdn.luxe.digital/media/2020/02/17134616/oliver-cabell-low-top-jet-black-men-dress-sneakers-luxe-digital.jpg', '39', 'Leather', 'Sneaker'),
(18, 'White Sneakers 1', 'for the first place in life', 44, 'https://cdn.luxe.digital/media/2020/02/17134517/koio-gavia-bianco-white-men-sneakers-luxe-digital.jpg', '40', 'Leather', 'Sneaker'),
(19, 'Sort Sneakers', 'sort of wonderful', 78, 'https://cdn.luxe.digital/media/2020/02/17134751/vans-low-top-men-sneakers-under-50-luxe-digital.jpg', '39', 'Textile', 'Sneaker'),
(20, 'Complet  White Sneakers', 'for the sunny days', 99, 'https://cdn.luxe.digital/media/2020/02/17134517/koio-gavia-bianco-white-men-sneakers-luxe-digital.jpg', '37', 'Leather', 'Sneaker'),
(21, 'Luxury Sneakers', 'feel the luxury', 60, 'https://images.summitmedia-digital.com/esquiremagph/images/2019/07/03/15-Best-Mens-Luxury-Sneakers-10-HERMES.jpg', '38', 'Textile', 'Sneaker'),
(22, 'Black Boots', 'for the dark times', 89, 'https://en.louisvuitton.com/images/is/image/lv/1/PP_VP_L/louis-vuitton-lv-beaubourg-ankle-boots-shoes--AJ5Q4DPC02_PM2_Front%20view.png?wid=1080&hei=1080', '39', 'Leather', 'Ankle Boots'),
(23, 'Rock Boots', 'let the rocker live', 75, 'https://images.asos-media.com/products/public-desire-schwarzeankle-boots-mit-absatzen-und-dicken-profilsohlen/13537117-1-black?$n_640w$&wid=513&fit=constrain', '37', 'Rubber/Leather', 'Ankle Boots'),
(24, 'Brown Boots', 'elegant and modern', 59, 'https://www.target.com.au/medias/static_content/product/images/full/31/96/A1643196.jpg?impolicy=product_portrait_hero', '39', 'Leather', 'Ankle Boots');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(3, 'user@user.at', '[\"ROLE_USER\"]', '$2y$13$46ah0/7NUIS/3PNUNtcPvOnxUkn3vFNmvpABUkBZ60Sf6jhVPzHfa'),
(4, 'admin@admin.at', '[\"ROLE_ADMIN\"]', '$2y$13$8EiEEH1VBRPkANGqYAUx7.BDeEu4M3mQbqtKnZnQtg/bF00Hfduhi'),
(5, 'villain@villain.at', '[]', '$argon2id$v=19$m=65536,t=4,p=1$z7BlA830+mxC9fTPNLYxbw$vqQH9kNbxWA1dP/mVzeF8l8tVu4axOjXSY+F9ZjEyOY');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_52EA1F094584665A` (`product_id`),
  ADD KEY `IDX_52EA1F09E238517C` (`order_ref_id`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT für Tabelle `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_52EA1F094584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_52EA1F09E238517C` FOREIGN KEY (`order_ref_id`) REFERENCES `order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
