-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Jan-2020 às 22:30
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `kaiaki_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `address_tb`
--

CREATE TABLE `address_tb` (
  `id_address` int(11) NOT NULL,
  `id_neighborhood` int(11) NOT NULL,
  `id_propertie` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `address_tb`
--

INSERT INTO `address_tb` (`id_address`, `id_neighborhood`, `id_propertie`, `address`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Maputo, Av Julius Nyerere 1231', '2883288', '823821232', '2020-01-28 11:33:13', '2020-01-28 11:38:59', NULL),
(2, 2, 4, 'maputo, t3 av de trabalho', '28129129', '39839922', '2020-01-28 11:34:40', '2020-01-28 11:34:40', NULL),
(3, 2, 6, 'Matola, bla lbala, rua 20', '99993298', '99393992', '2020-01-28 11:35:51', '2020-01-28 11:46:34', NULL),
(4, 3, 7, 'maoltla , rua 9393, av acacias', '9392993', '9939392', '2020-01-28 11:36:32', '2020-01-28 11:36:32', NULL),
(5, 2, 5, 'AV capital, 3923. rua tansania', '28129129', '93932992', '2020-01-28 11:37:24', '2020-01-28 11:45:53', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `booking_tb`
--

CREATE TABLE `booking_tb` (
  `id_user` int(11) NOT NULL,
  `id_propertie` int(11) NOT NULL,
  `code_booking` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `price` float NOT NULL,
  `status` enum('canceled','accept','pending','refused') DEFAULT 'pending',
  `check_in` date NOT NULL,
  `check_out` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `booking_tb`
--

INSERT INTO `booking_tb` (`id_user`, `id_propertie`, `code_booking`, `qty`, `price`, `status`, `check_in`, `check_out`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2124313', 200, 1900.05, 'pending', '2020-01-28', '2020-08-28', '2020-01-30 16:31:57', '2020-01-30 16:31:57', NULL),
(1, 4, '212411', 200, 1900.05, 'pending', '2020-01-28', NULL, '2020-01-30 16:55:14', '2020-01-30 16:55:14', NULL),
(1, 5, '21211', 200, 1900.05, 'pending', '2020-01-28', NULL, '2020-01-30 18:11:41', '2020-01-30 18:11:41', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `city_tb`
--

CREATE TABLE `city_tb` (
  `id_city` int(11) NOT NULL,
  `city_code` int(11) NOT NULL,
  `name_city` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `city_tb`
--

INSERT INTO `city_tb` (`id_city`, `city_code`, `name_city`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3921, 'Maputo', '2020-01-27 17:12:55', '2020-01-27 17:12:55', NULL),
(2, 7231, 'Gaza', '2020-01-27 17:12:55', '2020-01-28 13:14:08', NULL),
(3, 7218, 'Inhambane', '2020-01-27 17:12:55', '2020-01-27 17:12:55', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comodide_tb`
--

CREATE TABLE `comodide_tb` (
  `id_comodide` int(11) NOT NULL,
  `name_comodide` varchar(80) NOT NULL,
  `icon` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `comodide_tb`
--

INSERT INTO `comodide_tb` (`id_comodide`, `name_comodide`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'TV', NULL, '2020-01-25 05:45:09', '2020-01-25 05:45:09', NULL),
(2, 'Climatização', NULL, '2020-01-25 05:45:09', '2020-01-25 05:45:09', NULL),
(3, 'Cama', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', NULL),
(4, 'Guarda Roupa', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', NULL),
(5, 'Fogão', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', NULL),
(6, 'Forno', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', NULL),
(7, 'Lareira', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', NULL),
(8, 'Sistema de Som', NULL, '2020-01-25 05:49:09', '2020-01-25 05:49:09', NULL),
(9, 'Beliche', NULL, '2020-01-25 05:49:09', '2020-01-25 05:49:09', NULL),
(10, 'Hidromassagem', NULL, '2020-01-25 05:50:09', '2020-01-25 05:50:09', NULL),
(11, 'Chuveiro', NULL, '2020-01-25 05:50:09', '2020-01-25 05:50:09', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `neighborhood_tb`
--

CREATE TABLE `neighborhood_tb` (
  `id_neighborhood` int(11) NOT NULL,
  `id_city` int(11) NOT NULL,
  `neighbordhood_code` int(11) NOT NULL,
  `name_neighborhood` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `neighborhood_tb`
--

INSERT INTO `neighborhood_tb` (`id_neighborhood`, `id_city`, `neighbordhood_code`, `name_neighborhood`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 32992, 'Hulene', '2020-01-27 17:15:58', '2020-01-27 17:15:58', NULL),
(2, 1, 8281, 'Maxaquene', '2020-01-28 11:03:30', '2020-01-28 11:03:30', NULL),
(3, 1, 2121, 'Museu', '2020-01-28 11:03:30', '2020-01-28 13:32:37', NULL),
(4, 1, 8218, 'Alto mae', '2020-01-28 13:34:20', '2020-01-28 13:34:20', NULL),
(5, 1, 7328, 'Chamanculo', '2020-01-28 13:34:20', '2020-01-28 13:34:20', NULL),
(6, 1, 2118, 'Magoanine', '2020-01-28 13:35:22', '2020-01-28 13:35:22', NULL),
(7, 1, 2818, 'Laulane', '2020-01-28 13:35:22', '2020-01-28 13:35:22', NULL),
(8, 2, 9012, 'Chokwe', '2020-01-28 13:36:51', '2020-01-28 13:36:51', NULL),
(9, 2, 8211, 'Macia', '2020-01-28 13:36:51', '2020-01-28 13:36:51', NULL),
(10, 2, 8811, 'Massingire', '2020-01-28 13:37:40', '2020-01-28 13:37:40', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_tb`
--

CREATE TABLE `payment_tb` (
  `id_payment` int(11) NOT NULL,
  `id_payment_type` int(11) NOT NULL,
  `id_propertie` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `amount` float NOT NULL,
  `status` enum('canceled','accept','pending','refused') DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_type_tb`
--

CREATE TABLE `payment_type_tb` (
  `id_payment_type` int(11) NOT NULL,
  `name_payment_type` varchar(50) DEFAULT NULL,
  `description_payment_type` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `payment_type_tb`
--

INSERT INTO `payment_type_tb` (`id_payment_type`, `name_payment_type`, `description_payment_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Visa', NULL, '2020-01-30 14:01:16', '2020-01-30 14:01:16', NULL),
(2, 'M-pesa', NULL, '2020-01-30 14:02:01', '2020-01-30 14:02:01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_tb`
--

CREATE TABLE `personal_tb` (
  `id_personal` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_brith` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `personal_tb`
--

INSERT INTO `personal_tb` (`id_personal`, `id_user`, `first_name`, `last_name`, `date_of_brith`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Lazaro', 'Mbaila', '2005-01-12', '2020-01-29 09:33:41', '2020-01-29 09:33:41', NULL),
(2, 25, 'Naty', 'Luisa Lázaro', '2020-01-20', '2020-01-29 09:37:40', '2020-01-29 09:37:40', NULL),
(3, 31, 'Junior', 'Amade', '2019-10-14', '2020-01-29 09:38:53', '2020-01-29 09:38:53', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `photo_propertie_tb`
--

CREATE TABLE `photo_propertie_tb` (
  `id_photo_propertie` int(11) NOT NULL,
  `id_propertie` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `featured_photo` enum('0','1') DEFAULT '0',
  `description_photo` varchar(250) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `photo_propertie_tb`
--

INSERT INTO `photo_propertie_tb` (`id_photo_propertie`, `id_propertie`, `url`, `featured_photo`, `description_photo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cosaoa201200012.png', '0', 'cozinha', '2020-01-24 21:59:53', '2020-01-24 21:59:53', NULL),
(2, 1, 'cosaoa201200012.png', '0', 'quarto', '2020-01-24 22:00:37', '2020-01-24 22:00:37', NULL),
(3, 1, 'cosaoa201200012.png', '1', 'sala', '2020-01-24 22:00:54', '2020-01-24 22:00:54', NULL),
(4, 6, 'cosaoa201200012.png', '0', 'varanda', '2020-01-24 22:01:14', '2020-01-24 22:01:14', NULL),
(5, 6, 'cosaoa201200012.png', '1', 'Entrada Princiapal', '2020-01-24 22:01:30', '2020-01-25 11:02:49', NULL),
(6, 7, 'jdsjjdjsjsdj.png', '0', 'varanda', '2020-01-24 22:02:43', '2020-01-24 22:02:43', NULL),
(7, 7, 'jdsjjdjsjsdj.png', '0', 'sala', '2020-01-24 22:03:08', '2020-01-24 22:03:08', NULL),
(8, 7, 'quarto.png', '0', 'quarto', '2020-01-24 22:03:39', '2020-01-24 22:03:39', NULL),
(9, 7, 'psina.png', '1', 'psina', '2020-01-24 22:04:24', '2020-01-24 22:04:24', NULL),
(10, 4, 'casa_de_banho382382.png', '1', 'psina', '2020-01-24 22:05:10', '2020-01-24 22:05:10', NULL),
(11, 4, 'hdfdfs3232.png', '0', 'cosinha americana ', '2020-01-24 22:10:01', '2020-01-24 22:10:01', NULL),
(12, 4, 'sala_cliatizdad34i34i.png', '0', 'sala climatizada ', '2020-01-24 22:11:14', '2020-01-24 22:11:14', NULL),
(13, 4, 'varanda_poltronae9w9wdw8d9q.png', '0', 'Varada  com poltronas', '2020-01-24 22:12:50', '2020-01-24 22:12:50', NULL),
(14, 4, 'varanda_poltronae9w9wdw8d9q.png', '0', 'Sala de estar', '2020-01-24 22:13:20', '2020-01-24 22:13:20', NULL),
(15, 4, 'varanda_poltronae9w9wdw8d9q.png', '0', 'Quarto com suite', '2020-01-24 22:13:27', '2020-01-24 22:13:27', NULL),
(16, 4, 'varanda_poltronae9w9wdw8d9q.png', '0', 'cosinha americana', '2020-01-24 22:13:31', '2020-01-24 22:13:31', NULL),
(17, 4, 'varanda_poltronae9w9wdw8d9q.png', '1', 'psina', '2020-01-24 22:13:43', '2020-01-24 22:13:43', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `photo_tb`
--

CREATE TABLE `photo_tb` (
  `id_photo` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `propertie_comodide_tb`
--

CREATE TABLE `propertie_comodide_tb` (
  `id_comodide` int(11) NOT NULL,
  `id_propertie` int(11) NOT NULL,
  `description_comodide` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `propertie_tb`
--

CREATE TABLE `propertie_tb` (
  `id_propertie` int(11) NOT NULL,
  `id_propertie_type` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name_propertie` varchar(100) NOT NULL,
  `description_propertie` text DEFAULT NULL,
  `price_day` float DEFAULT NULL,
  `price_week` float DEFAULT NULL,
  `price_mouth` float DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `propertie_tb`
--

INSERT INTO `propertie_tb` (`id_propertie`, `id_propertie_type`, `id_user`, `name_propertie`, `description_propertie`, `price_day`, `price_week`, `price_mouth`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 'CASA DOS COSSAS', 'ESSA EH ASDASDALDS', 50050, 55050, 5050, '2020-01-27 21:03:57', '2020-01-28 12:48:55', '2020-01-28 12:48:49'),
(3, 1, 1, 'FLAT EM MALHANGALENE ', 'BONITA COM VISTA PARA AS ARVORES ', 32932.4, 3923990, 9320300, '2020-01-27 21:06:09', '2020-01-27 21:06:09', NULL),
(4, 3, 24, 'CASA DOS MBAILAS', 'BOA CASA COM 4 QUARTOS E 5 CAMAS, IDEAL PARA CASADOS COM FILHOS', 5000.4, 992392, 349934000, '2020-01-27 21:08:42', '2020-01-27 21:08:42', NULL),
(5, 3, 1, 'NASNNANNAN', 'JAJASJDJASDJ', 39239, 30000, 4399320, '2020-01-27 21:09:23', '2020-01-27 21:09:23', NULL),
(6, 3, 4, 'Cosa_hulene', NULL, 500, 3000, 9000, '2020-01-27 21:20:00', '2020-01-27 21:20:00', NULL),
(7, 2, 5, 'Flet na avenida Julius Nyerere proximo a presidenc', NULL, 13000, 50000, 150000, '2020-01-27 21:20:00', '2020-01-27 21:20:00', NULL),
(8, 1, 7, 'imovel com 7 quartos e 3 suites para casais', NULL, 39999, 993929, 939292, '2020-01-27 21:20:00', '2020-01-27 21:20:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `propertie_type_tb`
--

CREATE TABLE `propertie_type_tb` (
  `id_propertie_type` int(11) NOT NULL,
  `name_type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `propertie_type_tb`
--

INSERT INTO `propertie_type_tb` (`id_propertie_type`, `name_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'FLet', '2020-01-27 17:45:35', '2020-01-27 17:45:35', NULL),
(2, 'Hotel', '2020-01-27 17:45:52', '2020-01-27 17:45:52', NULL),
(3, 'Casa', '2020-01-27 17:46:00', '2020-01-27 17:46:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reting_tb`
--

CREATE TABLE `reting_tb` (
  `id_user` int(11) NOT NULL,
  `id_propertie` int(11) NOT NULL,
  `view_reting` enum('0','1') DEFAULT '0',
  `desire_reting` enum('0','1') DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `reting_tb`
--

INSERT INTO `reting_tb` (`id_user`, `id_propertie`, `view_reting`, `desire_reting`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, '0', '0', '2020-01-28 11:51:31', '2020-01-28 11:51:31', NULL),
(7, 8, '1', '1', '2020-01-28 11:52:05', '2020-01-28 11:52:05', NULL),
(10, 5, '0', '1', '2020-01-28 11:51:42', '2020-01-28 11:51:42', NULL),
(13, 6, '0', '0', '2020-01-28 11:52:35', '2020-01-28 11:52:35', NULL),
(13, 8, '0', '0', '2020-01-28 11:51:51', '2020-01-28 11:51:51', NULL),
(14, 1, '1', '0', '2020-01-28 11:51:05', '2020-01-28 11:51:05', NULL),
(14, 4, '1', '1', '2020-01-28 11:52:50', '2020-01-28 11:52:50', NULL),
(24, 4, '1', '1', '2020-01-28 11:52:17', '2020-01-28 11:52:17', NULL),
(31, 6, '0', '0', '2020-01-28 11:51:17', '2020-01-28 11:51:17', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_tb`
--

CREATE TABLE `user_tb` (
  `id_user` int(11) NOT NULL,
  `id_user_type` int(11) NOT NULL DEFAULT 0,
  `facebook_id` varchar(250) DEFAULT NULL,
  `google_id` varchar(250) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mail` varchar(75) DEFAULT NULL,
  `cell` varchar(16) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `password_reset_token` varchar(126) DEFAULT NULL,
  `password_reset_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_tb`
--

INSERT INTO `user_tb` (`id_user`, `id_user_type`, `facebook_id`, `google_id`, `password`, `mail`, `cell`, `created_at`, `updated_at`, `deleted_at`, `password_reset_token`, `password_reset_expires`) VALUES
(1, 1, NULL, NULL, '$2a$10$GbUH7LX0MqFBlunaCjO5m.qMIlYmOPWa0McwQQHjTQ1Qbv7Knm2zW', 'lazaro@mail.com', '+23233232', '2020-01-27 17:23:32', '2020-01-30 13:52:23', NULL, '5a4be17ca85774730f355cab75727b6e708fc260', '2020-01-30 14:52:23'),
(4, 1, NULL, NULL, '$2a$10$T4qpAWwDXNJ68P16.io/tO8ywcZ0UPpmqzvtsglptPXaB8aGD1DSe', 'suale@mail.com', '092328932', '2020-01-27 17:23:32', '2020-01-29 09:54:05', NULL, '', NULL),
(5, 1, NULL, NULL, '$2a$10$Osp3FbOOQRSU.ywv781qQe6O6TQSwkHPQ6tjNeK5AX68Hc9KQaNDK', 'julio@mail.com', '032828999', '2020-01-27 17:23:32', '2020-01-29 10:15:29', NULL, '', NULL),
(7, 1, NULL, NULL, '$2a$10$ziFNIjDW0/0Xsttq/mLsQu3nthtBgayktbhNpzTNS0QijamndtFE6', 'julioo@mail.com', '099987787', '2020-01-27 17:23:32', '2020-01-29 10:15:41', NULL, '', NULL),
(8, 1, NULL, NULL, '$2a$10$GgPJN9OCKKCiC7gujHNZP.YUVPjHWm4scJ2RnmSH1dRA8XFqzODhW', 'julo@mail.com', '0328332992', '2020-01-27 17:23:32', '2020-01-27 17:23:32', NULL, '', NULL),
(9, 1, NULL, NULL, '$2a$10$/5r3LTzFBx0e.HjHVLlFg.lOqHCX5ii7GE.DHhwN7FL8TQ/SaKyha', 'alex@mail.com', '03332992', '2020-01-27 17:23:32', '2020-01-27 17:23:32', NULL, '', NULL),
(10, 1, NULL, NULL, '$2a$10$RxCnsoDxMZruTKdj9WRvo.GQZ37tVLM6Sl4uwxVN8ZndyWms/pyL6', 'jonDoe@mail.com', '033932992', '2020-01-27 17:23:32', '2020-01-27 17:23:32', NULL, '', NULL),
(12, 1, NULL, NULL, '$2a$10$8IhatMdr8owso5L1rfe2xuAoNve3SGFas0vrJ4.RPS0rz6aG3Nd5m', 'jonDoe1@mail.com', '0339102992', '2020-01-27 17:23:32', '2020-01-27 17:23:32', NULL, '', NULL),
(13, 1, NULL, NULL, '$2a$10$Ik5Bwt65tq9L7G5oKC9N7.NnL4J1qvr.1EQS6C9PAGw.89MJAjMEG', 'jon1Doe1@gmail.com', '031102992', '2020-01-27 17:23:32', '2020-01-29 10:16:27', NULL, '', NULL),
(14, 1, NULL, NULL, '$2a$10$v2iiosLFPvfyBoxkx09qX.lN.83Rgqmh0dsLXVfMNmsxm18HNEibq', 'jon1D1@mail.com', '0311992', '2020-01-27 17:23:32', '2020-01-27 17:23:32', NULL, '', NULL),
(24, 1, NULL, NULL, '$2a$10$/bce9T5BtJfwodAiWSuS6u/UQuLyGYLi87dPadRj7cmPLZ2e3hqQW', 'jddddd@mail.com', '0399099992', '2020-01-27 17:23:32', '2020-01-27 17:23:32', NULL, '', NULL),
(25, 1, NULL, NULL, '$2a$10$0PHxGKRPmalVv/5j7r5.n.2o9YzhnPNA.ue2v9MTqFoOjCPd8hTtW', 'lazarombail9@mail.com', '03291999992', '2020-01-27 17:23:32', '2020-01-29 09:53:48', NULL, '', NULL),
(34, 1, NULL, NULL, '$2a$10$FqHb9KGcP9we/6.93XakyuN48QFY9.8r1PsZh8mKfWCFaliYdMRlK', 'zzz@gmail.com', '999999221', '2020-01-28 16:16:25', '2020-01-29 09:53:38', NULL, '', NULL),
(71, 1, NULL, NULL, '$2a$10$Ar43jwuk.lEFFgdGMN9SDu9TVbwKjBpXkpmU3rfNkjTvsIMp96fVq', 'Subul@suale.com', '22321121', '2020-01-29 10:08:24', '2020-01-29 10:15:59', NULL, '', NULL),
(73, 1, NULL, NULL, '$2a$10$8XVLbOmb/qvD8BvOdjQfdehq7aCssRXvx9Ey57ME1VA1Jc8xjl0u.', 'Subul@0o.com', '824168400', '2020-01-29 10:10:15', '2020-01-29 10:15:08', NULL, '', NULL),
(81, 1, NULL, NULL, '$2a$10$gfYICpHO.C9hr26HtRSnM.MVPbP0USmxFF1IXkN6L4rJ2lo2WRz4K', 'Subul@s99.com', '824168401', '2020-01-29 10:11:59', '2020-01-29 10:16:12', NULL, '', NULL),
(84, 1, NULL, NULL, '$2a$10$D5uq7Hh/JTYvWHdXLAholes7.az1NJ9B08XwWKW1pTFbjUKzppFlm', 'Subul@sss.com', '8241684000', '2020-01-29 10:12:12', '2020-01-29 10:12:12', NULL, '', NULL),
(88, 1, NULL, NULL, '$2a$10$0Oqp9v0cOQ4nmUpBmL1gMuWYhD9IbJuOmmCocSljouq7Y0qPonS2K', 'Subul@ss.com', '824168420', '2020-01-29 10:18:53', '2020-01-29 10:18:53', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_type`
--

CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL,
  `name_type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_type`
--

INSERT INTO `user_type` (`id_user_type`, `name_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'guest', '2020-01-27 17:23:21', '2020-01-27 17:23:21', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `address_tb`
--
ALTER TABLE `address_tb`
  ADD PRIMARY KEY (`id_address`),
  ADD KEY `fk_propertie_address_` (`id_propertie`),
  ADD KEY `fk_neighborhood_address` (`id_neighborhood`);

--
-- Índices para tabela `booking_tb`
--
ALTER TABLE `booking_tb`
  ADD PRIMARY KEY (`id_user`,`id_propertie`),
  ADD UNIQUE KEY `un_booking` (`code_booking`),
  ADD KEY `fk_booking_propertie` (`id_propertie`);

--
-- Índices para tabela `city_tb`
--
ALTER TABLE `city_tb`
  ADD PRIMARY KEY (`id_city`);

--
-- Índices para tabela `comodide_tb`
--
ALTER TABLE `comodide_tb`
  ADD PRIMARY KEY (`id_comodide`);

--
-- Índices para tabela `neighborhood_tb`
--
ALTER TABLE `neighborhood_tb`
  ADD PRIMARY KEY (`id_neighborhood`),
  ADD KEY `fk_neighborhood_city` (`id_city`);

--
-- Índices para tabela `payment_tb`
--
ALTER TABLE `payment_tb`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `fk_payment_type` (`id_payment_type`),
  ADD KEY `fk_payment_booking` (`id_user`,`id_propertie`);

--
-- Índices para tabela `payment_type_tb`
--
ALTER TABLE `payment_type_tb`
  ADD PRIMARY KEY (`id_payment_type`);

--
-- Índices para tabela `personal_tb`
--
ALTER TABLE `personal_tb`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `fk_user_personal` (`id_user`);

--
-- Índices para tabela `photo_propertie_tb`
--
ALTER TABLE `photo_propertie_tb`
  ADD PRIMARY KEY (`id_photo_propertie`),
  ADD KEY `fk_propertie_photo` (`id_propertie`);

--
-- Índices para tabela `photo_tb`
--
ALTER TABLE `photo_tb`
  ADD PRIMARY KEY (`id_photo`),
  ADD KEY `fk_user_photo` (`id_user`);

--
-- Índices para tabela `propertie_comodide_tb`
--
ALTER TABLE `propertie_comodide_tb`
  ADD PRIMARY KEY (`id_comodide`,`id_propertie`),
  ADD KEY `fk_propertie_comodide` (`id_propertie`);

--
-- Índices para tabela `propertie_tb`
--
ALTER TABLE `propertie_tb`
  ADD PRIMARY KEY (`id_propertie`),
  ADD KEY `fk_type_propertie` (`id_propertie_type`),
  ADD KEY `fk_user_propertie` (`id_user`);

--
-- Índices para tabela `propertie_type_tb`
--
ALTER TABLE `propertie_type_tb`
  ADD PRIMARY KEY (`id_propertie_type`);

--
-- Índices para tabela `reting_tb`
--
ALTER TABLE `reting_tb`
  ADD PRIMARY KEY (`id_user`,`id_propertie`),
  ADD KEY `fk_reting_propertie` (`id_propertie`);

--
-- Índices para tabela `user_tb`
--
ALTER TABLE `user_tb`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `un_user` (`mail`) USING BTREE,
  ADD UNIQUE KEY `unique_cell` (`cell`),
  ADD KEY `fk_user_type` (`id_user_type`);

--
-- Índices para tabela `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id_user_type`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `address_tb`
--
ALTER TABLE `address_tb`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `city_tb`
--
ALTER TABLE `city_tb`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `comodide_tb`
--
ALTER TABLE `comodide_tb`
  MODIFY `id_comodide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `neighborhood_tb`
--
ALTER TABLE `neighborhood_tb`
  MODIFY `id_neighborhood` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `payment_tb`
--
ALTER TABLE `payment_tb`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payment_type_tb`
--
ALTER TABLE `payment_type_tb`
  MODIFY `id_payment_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `personal_tb`
--
ALTER TABLE `personal_tb`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `photo_propertie_tb`
--
ALTER TABLE `photo_propertie_tb`
  MODIFY `id_photo_propertie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `photo_tb`
--
ALTER TABLE `photo_tb`
  MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `propertie_tb`
--
ALTER TABLE `propertie_tb`
  MODIFY `id_propertie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `propertie_type_tb`
--
ALTER TABLE `propertie_type_tb`
  MODIFY `id_propertie_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `user_tb`
--
ALTER TABLE `user_tb`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de tabela `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id_user_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `address_tb`
--
ALTER TABLE `address_tb`
  ADD CONSTRAINT `fk_neighborhood_address` FOREIGN KEY (`id_neighborhood`) REFERENCES `neighborhood_tb` (`id_neighborhood`),
  ADD CONSTRAINT `fk_propertie_address_` FOREIGN KEY (`id_propertie`) REFERENCES `propertie_tb` (`id_propertie`);

--
-- Limitadores para a tabela `booking_tb`
--
ALTER TABLE `booking_tb`
  ADD CONSTRAINT `fk_booking_propertie` FOREIGN KEY (`id_propertie`) REFERENCES `propertie_tb` (`id_propertie`),
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `neighborhood_tb`
--
ALTER TABLE `neighborhood_tb`
  ADD CONSTRAINT `fk_neighborhood_city` FOREIGN KEY (`id_city`) REFERENCES `city_tb` (`id_city`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `payment_tb`
--
ALTER TABLE `payment_tb`
  ADD CONSTRAINT `fk_payment_booking` FOREIGN KEY (`id_user`,`id_propertie`) REFERENCES `booking_tb` (`id_user`, `id_propertie`),
  ADD CONSTRAINT `fk_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type_tb` (`id_payment_type`),
  ADD CONSTRAINT `fk_payment_user` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `personal_tb`
--
ALTER TABLE `personal_tb`
  ADD CONSTRAINT `fk_user_personal` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `photo_propertie_tb`
--
ALTER TABLE `photo_propertie_tb`
  ADD CONSTRAINT `fk_propertie_photo` FOREIGN KEY (`id_propertie`) REFERENCES `propertie_tb` (`id_propertie`);

--
-- Limitadores para a tabela `photo_tb`
--
ALTER TABLE `photo_tb`
  ADD CONSTRAINT `fk_user_photo` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `propertie_comodide_tb`
--
ALTER TABLE `propertie_comodide_tb`
  ADD CONSTRAINT `fk_comodide_propertie` FOREIGN KEY (`id_comodide`) REFERENCES `comodide_tb` (`id_comodide`),
  ADD CONSTRAINT `fk_propertie_comodide` FOREIGN KEY (`id_propertie`) REFERENCES `propertie_tb` (`id_propertie`);

--
-- Limitadores para a tabela `propertie_tb`
--
ALTER TABLE `propertie_tb`
  ADD CONSTRAINT `fk_type_propertie` FOREIGN KEY (`id_propertie_type`) REFERENCES `propertie_type_tb` (`id_propertie_type`),
  ADD CONSTRAINT `fk_user_propertie` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `reting_tb`
--
ALTER TABLE `reting_tb`
  ADD CONSTRAINT `fk_reting_propertie` FOREIGN KEY (`id_propertie`) REFERENCES `propertie_tb` (`id_propertie`),
  ADD CONSTRAINT `fk_reting_user` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `user_tb`
--
ALTER TABLE `user_tb`
  ADD CONSTRAINT `fk_user_type` FOREIGN KEY (`id_user_type`) REFERENCES `user_type` (`id_user_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
