-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Jan-2020 às 10:27
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
-- Estrutura da tabela `booking_tb`
--

CREATE TABLE `booking_tb` (
  `id_user` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `code_booking` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `city_tb`
--

CREATE TABLE `city_tb` (
  `id_city` int(11) NOT NULL,
  `city_code` int(11) NOT NULL,
  `name_city` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `city_tb`
--

INSERT INTO `city_tb` (`id_city`, `city_code`, `name_city`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3921, 'Maputo', '2020-01-23 14:24:55', '2020-01-23 14:24:55', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comodide_tb`
--

CREATE TABLE `comodide_tb` (
  `id_comodide` int(11) NOT NULL,
  `name_comodide` varchar(50) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `comodide_tb`
--

INSERT INTO `comodide_tb` (`id_comodide`, `name_comodide`, `icon`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'TV', NULL, '2020-01-25 05:45:09', '2020-01-25 05:45:09', '0000-00-00 00:00:00'),
(2, 'Climatização', NULL, '2020-01-25 05:45:09', '2020-01-25 05:45:09', '0000-00-00 00:00:00'),
(3, 'Cama', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', '0000-00-00 00:00:00'),
(4, 'Guarda Roupa', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', '0000-00-00 00:00:00'),
(5, 'Fogão', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', '0000-00-00 00:00:00'),
(6, 'Forno', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', '0000-00-00 00:00:00'),
(7, 'Lareira', NULL, '2020-01-25 05:48:12', '2020-01-25 05:48:12', '0000-00-00 00:00:00'),
(8, 'Sistema de Som', NULL, '2020-01-25 05:49:09', '2020-01-25 05:49:09', '0000-00-00 00:00:00'),
(9, 'Beliche', NULL, '2020-01-25 05:49:09', '2020-01-25 05:49:09', '0000-00-00 00:00:00'),
(10, 'Hidromassagem', NULL, '2020-01-25 05:50:09', '2020-01-25 05:50:09', '0000-00-00 00:00:00'),
(11, 'Chuveiro', NULL, '2020-01-25 05:50:09', '2020-01-25 05:50:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_comodide_tb`
--

CREATE TABLE `imovel_comodide_tb` (
  `id_comodide` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `description_comodide` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imovel_comodide_tb`
--

INSERT INTO `imovel_comodide_tb` (`id_comodide`, `id_imovel`, `description_comodide`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, NULL, '2020-01-25 05:54:21', '2020-01-25 05:54:21', '0000-00-00 00:00:00'),
(2, 1, NULL, '2020-01-25 05:54:21', '2020-01-25 05:54:21', '0000-00-00 00:00:00'),
(4, 3, NULL, '2020-01-25 05:56:15', '2020-01-25 05:56:15', '0000-00-00 00:00:00'),
(6, 3, NULL, '2020-01-25 05:54:21', '2020-01-25 05:54:21', '0000-00-00 00:00:00'),
(7, 4, NULL, '2020-01-25 05:54:21', '2020-01-25 05:54:21', '0000-00-00 00:00:00'),
(8, 1, NULL, '2020-01-25 05:57:18', '2020-01-25 05:57:18', '0000-00-00 00:00:00'),
(9, 1, NULL, '2020-01-25 05:54:21', '2020-01-25 05:54:21', '0000-00-00 00:00:00'),
(10, 4, NULL, '2020-01-25 05:56:56', '2020-01-25 05:56:56', '0000-00-00 00:00:00'),
(11, 1, NULL, '2020-01-25 05:54:21', '2020-01-25 05:54:21', '0000-00-00 00:00:00'),
(11, 2, NULL, '2020-01-25 05:54:21', '2020-01-25 05:54:21', '0000-00-00 00:00:00'),
(11, 3, NULL, '2020-01-25 05:55:46', '2020-01-25 05:55:46', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_tb`
--

CREATE TABLE `imovel_tb` (
  `id_imovel` int(11) NOT NULL,
  `id_city` int(11) NOT NULL,
  `id_imovel_type` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name_imovel` varchar(50) NOT NULL,
  `description_imovel` text DEFAULT NULL,
  `price_day` float DEFAULT NULL,
  `price_week` float DEFAULT NULL,
  `price_mouth` float DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imovel_tb`
--

INSERT INTO `imovel_tb` (`id_imovel`, `id_city`, `id_imovel_type`, `id_user`, `name_imovel`, `description_imovel`, `price_day`, `price_week`, `price_mouth`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'Cosa_hulene', NULL, 500, 3000, 9000, '218290129', '9320102921', '2020-01-23 14:28:44', '2020-01-23 14:28:44', '0000-00-00 00:00:00'),
(2, 1, 1, 4, 'Flet na avenida Julius Nyerere proximo a presidenc', NULL, 13000, 50000, 150000, '82188219291', '932993299329', '2020-01-23 15:55:49', '2020-01-23 15:55:49', '0000-00-00 00:00:00'),
(3, 1, 1, 4, 'imovel com 7 quartos e 3 suites para casais', NULL, 39999, 993929, 939292, '99399230020', '0030209382', '2020-01-23 15:57:57', '2020-01-23 15:57:57', '0000-00-00 00:00:00'),
(4, 1, 1, 1, 'loft em Magoanine para casais', 'Optima para casais de passagem ou que queiram ficar poucos dias na cidade', 700, 6000, 4000, '021920102', '012901-12', '2020-01-24 07:00:01', '2020-01-24 07:00:01', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_type_tb`
--

CREATE TABLE `imovel_type_tb` (
  `id_imovel_type` int(11) NOT NULL,
  `name_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imovel_type_tb`
--

INSERT INTO `imovel_type_tb` (`id_imovel_type`, `name_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Loft', '2020-01-23 14:21:26', '2020-01-23 14:21:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `neighborhood_tb`
--

CREATE TABLE `neighborhood_tb` (
  `id_neighborhood` int(11) NOT NULL,
  `id_city` int(11) NOT NULL,
  `neighbordhood_code` int(11) NOT NULL,
  `name_neighborhood` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `neighborhood_tb`
--

INSERT INTO `neighborhood_tb` (`id_neighborhood`, `id_city`, `neighbordhood_code`, `name_neighborhood`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 32992, 'Hulene', '2020-01-23 14:25:38', '2020-01-23 14:25:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_tb`
--

CREATE TABLE `payment_tb` (
  `id_payment` int(11) NOT NULL,
  `id_payment_type` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `amount` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_type_tb`
--

CREATE TABLE `payment_type_tb` (
  `id_payment_type` int(11) NOT NULL,
  `name_payment_type` varchar(50) DEFAULT NULL,
  `description_payment_type` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `photo_imovel_tb`
--

CREATE TABLE `photo_imovel_tb` (
  `id_photo_imovel` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `featured_photo` enum('0','1') DEFAULT '0',
  `description_photo` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `photo_imovel_tb`
--

INSERT INTO `photo_imovel_tb` (`id_photo_imovel`, `id_imovel`, `url`, `featured_photo`, `description_photo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cosaoa201200012.png', '0', 'cozinha', '2020-01-24 21:59:53', '2020-01-24 21:59:53', NULL),
(2, 1, 'cosaoa201200012.png', '0', 'quarto', '2020-01-24 22:00:37', '2020-01-24 22:00:37', NULL),
(3, 1, 'cosaoa201200012.png', '0', 'sala', '2020-01-24 22:00:54', '2020-01-24 22:00:54', NULL),
(4, 1, 'cosaoa201200012.png', '0', 'varanda', '2020-01-24 22:01:14', '2020-01-24 22:01:14', NULL),
(5, 1, 'cosaoa201200012.png', '1', 'varanda', '2020-01-24 22:01:30', '2020-01-24 22:01:30', NULL),
(6, 2, 'jdsjjdjsjsdj.png', '0', 'varanda', '2020-01-24 22:02:43', '2020-01-24 22:02:43', NULL),
(7, 2, 'jdsjjdjsjsdj.png', '0', 'sala', '2020-01-24 22:03:08', '2020-01-24 22:03:08', NULL),
(8, 2, 'quarto.png', '0', 'quarto', '2020-01-24 22:03:39', '2020-01-24 22:03:39', NULL),
(9, 2, 'psina.png', '1', 'psina', '2020-01-24 22:04:24', '2020-01-24 22:04:24', NULL),
(10, 2, 'casa_de_banho382382.png', '0', 'psina', '2020-01-24 22:05:10', '2020-01-24 22:05:10', NULL),
(11, 3, 'hdfdfs3232.png', '0', 'cosinha americana ', '2020-01-24 22:10:01', '2020-01-24 22:10:01', NULL),
(12, 3, 'sala_cliatizdad34i34i.png', '0', 'sala climatizada ', '2020-01-24 22:11:14', '2020-01-24 22:11:14', NULL),
(13, 3, 'varanda_poltronae9w9wdw8d9q.png', '1', 'Varada  com poltronas', '2020-01-24 22:12:50', '2020-01-24 22:12:50', NULL),
(14, 4, 'varanda_poltronae9w9wdw8d9q.png', '0', 'Varada  com poltronas', '2020-01-24 22:13:20', '2020-01-24 22:13:20', NULL),
(15, 4, 'varanda_poltronae9w9wdw8d9q.png', '0', 'Varada  com poltronas', '2020-01-24 22:13:27', '2020-01-24 22:13:27', NULL),
(16, 4, 'varanda_poltronae9w9wdw8d9q.png', '0', 'Varada  com poltronas', '2020-01-24 22:13:31', '2020-01-24 22:13:31', NULL),
(17, 4, 'varanda_poltronae9w9wdw8d9q.png', '1', 'Varada  com poltronas', '2020-01-24 22:13:43', '2020-01-24 22:13:43', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `photo_tb`
--

CREATE TABLE `photo_tb` (
  `id_photo` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reting_tb`
--

CREATE TABLE `reting_tb` (
  `id_user` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `view_reting` int(11) NOT NULL,
  `desire_reting` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `reting_tb`
--

INSERT INTO `reting_tb` (`id_user`, `id_imovel`, `view_reting`, `desire_reting`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '2020-01-23 16:11:35', '2020-01-23 16:11:35', '0000-00-00 00:00:00'),
(1, 2, 1, 1, '2020-01-23 16:12:15', '2020-01-23 16:12:15', '0000-00-00 00:00:00'),
(1, 3, 1, 1, '2020-01-23 16:12:52', '2020-01-23 16:12:52', '0000-00-00 00:00:00'),
(1, 4, 1, 1, '2020-01-24 07:10:31', '2020-01-24 07:10:31', '0000-00-00 00:00:00'),
(4, 1, 1, 1, '2020-01-23 14:30:30', '2020-01-23 16:10:19', '0000-00-00 00:00:00'),
(4, 2, 1, 1, '2020-01-23 16:00:18', '2020-01-23 16:10:24', '0000-00-00 00:00:00'),
(4, 3, 1, 1, '2020-01-23 16:00:18', '2020-01-23 16:10:28', '0000-00-00 00:00:00'),
(4, 4, 1, 0, '2020-01-24 07:11:35', '2020-01-24 07:11:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_tb`
--

CREATE TABLE `user_tb` (
  `id_user` int(11) NOT NULL,
  `id_user_type` int(11) NOT NULL,
  `facebook_id` varchar(250) DEFAULT NULL,
  `google_id` varchar(250) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mail` varchar(75) DEFAULT NULL,
  `cell` varchar(16) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_tb`
--

INSERT INTO `user_tb` (`id_user`, `id_user_type`, `facebook_id`, `google_id`, `password`, `mail`, `cell`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '', '', '$2a$10$GbUH7LX0MqFBlunaCjO5m.qMIlYmOPWa0McwQQHjTQ1Qbv7Knm2zW', 'lazaro@mail.com', '+23233232', '2020-01-23 13:58:27', '2020-01-23 13:58:27', '0000-00-00 00:00:00'),
(4, 1, '', '', '$2a$10$T4qpAWwDXNJ68P16.io/tO8ywcZ0UPpmqzvtsglptPXaB8aGD1DSe', 'suale@mail.com', '092328932992', '2020-01-23 14:20:07', '2020-01-23 14:20:07', '0000-00-00 00:00:00'),
(5, 1, '', '', '$2a$10$Osp3FbOOQRSU.ywv781qQe6O6TQSwkHPQ6tjNeK5AX68Hc9KQaNDK', 'julio@mail.com', '032828932992', '2020-01-24 12:16:14', '2020-01-24 12:16:14', '0000-00-00 00:00:00'),
(7, 1, '', '', '$2a$10$ziFNIjDW0/0Xsttq/mLsQu3nthtBgayktbhNpzTNS0QijamndtFE6', 'julioo@mail.com', '032832992', '2020-01-24 12:22:57', '2020-01-24 12:22:57', '0000-00-00 00:00:00'),
(8, 1, '', '', '$2a$10$GgPJN9OCKKCiC7gujHNZP.YUVPjHWm4scJ2RnmSH1dRA8XFqzODhW', 'julo@mail.com', '0328332992', '2020-01-24 12:27:08', '2020-01-24 12:27:08', '0000-00-00 00:00:00'),
(9, 1, '', '', '$2a$10$/5r3LTzFBx0e.HjHVLlFg.lOqHCX5ii7GE.DHhwN7FL8TQ/SaKyha', 'alex@mail.com', '03332992', '2020-01-24 12:29:01', '2020-01-24 12:29:01', '0000-00-00 00:00:00'),
(10, 1, '', '', '$2a$10$RxCnsoDxMZruTKdj9WRvo.GQZ37tVLM6Sl4uwxVN8ZndyWms/pyL6', 'jonDoe@mail.com', '033932992', '2020-01-24 12:31:18', '2020-01-24 12:31:18', '0000-00-00 00:00:00'),
(12, 1, '', '', '$2a$10$8IhatMdr8owso5L1rfe2xuAoNve3SGFas0vrJ4.RPS0rz6aG3Nd5m', 'jonDoe1@mail.com', '0339102992', '2020-01-24 12:33:10', '2020-01-24 12:33:10', '0000-00-00 00:00:00'),
(13, 1, '', '', '$2a$10$Ik5Bwt65tq9L7G5oKC9N7.NnL4J1qvr.1EQS6C9PAGw.89MJAjMEG', 'jon1Doe1@mail.com', '031102992', '2020-01-24 12:34:47', '2020-01-24 12:34:47', '0000-00-00 00:00:00'),
(14, 1, '', '', '$2a$10$v2iiosLFPvfyBoxkx09qX.lN.83Rgqmh0dsLXVfMNmsxm18HNEibq', 'jon1D1@mail.com', '0311992', '2020-01-24 12:35:44', '2020-01-24 12:35:44', '0000-00-00 00:00:00'),
(16, 1, '', '', '$2a$10$sM7QCoUyThXvDBSThC7JNOX2.eBqryqpC/Rd1Y6XkDpZG6VHpRe5C', 'jon@mail.com', '031109992', '2020-01-24 12:39:31', '2020-01-24 12:39:31', '0000-00-00 00:00:00'),
(17, 1, '', '', '$2a$10$KDHfI3v/ws2o5d7BqMi4v.J8ZWghwAfgklp8Yc9cwiGNLhkpQDdxe', 'joon@mail.com', '038109992', '2020-01-24 12:41:05', '2020-01-24 12:41:05', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_type`
--

CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL,
  `name_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_type`
--

INSERT INTO `user_type` (`id_user_type`, `name_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Guest', '2020-01-23 13:53:15', '2020-01-23 13:53:15', '0000-00-00 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `booking_tb`
--
ALTER TABLE `booking_tb`
  ADD PRIMARY KEY (`id_user`,`id_imovel`),
  ADD UNIQUE KEY `un_booking` (`code_booking`),
  ADD KEY `fk_booking_imovel` (`id_imovel`);

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
-- Índices para tabela `imovel_comodide_tb`
--
ALTER TABLE `imovel_comodide_tb`
  ADD PRIMARY KEY (`id_comodide`,`id_imovel`),
  ADD KEY `fk_imovel_comodide` (`id_imovel`);

--
-- Índices para tabela `imovel_tb`
--
ALTER TABLE `imovel_tb`
  ADD PRIMARY KEY (`id_imovel`),
  ADD KEY `fk_city_imovel` (`id_city`),
  ADD KEY `fk_imovel_type_imovel` (`id_imovel_type`),
  ADD KEY `fk_user_imovel` (`id_user`);

--
-- Índices para tabela `imovel_type_tb`
--
ALTER TABLE `imovel_type_tb`
  ADD PRIMARY KEY (`id_imovel_type`);

--
-- Índices para tabela `neighborhood_tb`
--
ALTER TABLE `neighborhood_tb`
  ADD PRIMARY KEY (`id_neighborhood`),
  ADD KEY `fk_neighborhood` (`id_city`);

--
-- Índices para tabela `payment_tb`
--
ALTER TABLE `payment_tb`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `fk_payment_type` (`id_payment_type`),
  ADD KEY `fk_payment_booking` (`id_user`,`id_imovel`);

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
-- Índices para tabela `photo_imovel_tb`
--
ALTER TABLE `photo_imovel_tb`
  ADD PRIMARY KEY (`id_photo_imovel`),
  ADD KEY `fk_imovel_photo_imovel` (`id_imovel`);

--
-- Índices para tabela `photo_tb`
--
ALTER TABLE `photo_tb`
  ADD PRIMARY KEY (`id_photo`),
  ADD KEY `fk_user_photo` (`id_user`);

--
-- Índices para tabela `reting_tb`
--
ALTER TABLE `reting_tb`
  ADD PRIMARY KEY (`id_user`,`id_imovel`),
  ADD KEY `fk_reting_imovel` (`id_imovel`);

--
-- Índices para tabela `user_tb`
--
ALTER TABLE `user_tb`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `un_user` (`mail`,`cell`),
  ADD KEY `fk_user_type` (`id_user_type`);

--
-- Índices para tabela `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id_user_type`),
  ADD UNIQUE KEY `name_type` (`name_type`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `city_tb`
--
ALTER TABLE `city_tb`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `comodide_tb`
--
ALTER TABLE `comodide_tb`
  MODIFY `id_comodide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `imovel_tb`
--
ALTER TABLE `imovel_tb`
  MODIFY `id_imovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `imovel_type_tb`
--
ALTER TABLE `imovel_type_tb`
  MODIFY `id_imovel_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `neighborhood_tb`
--
ALTER TABLE `neighborhood_tb`
  MODIFY `id_neighborhood` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `payment_tb`
--
ALTER TABLE `payment_tb`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `payment_type_tb`
--
ALTER TABLE `payment_type_tb`
  MODIFY `id_payment_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personal_tb`
--
ALTER TABLE `personal_tb`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `photo_imovel_tb`
--
ALTER TABLE `photo_imovel_tb`
  MODIFY `id_photo_imovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `photo_tb`
--
ALTER TABLE `photo_tb`
  MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user_tb`
--
ALTER TABLE `user_tb`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id_user_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `booking_tb`
--
ALTER TABLE `booking_tb`
  ADD CONSTRAINT `fk_booking_imovel` FOREIGN KEY (`id_imovel`) REFERENCES `imovel_tb` (`id_imovel`),
  ADD CONSTRAINT `fk_booking_user` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `imovel_comodide_tb`
--
ALTER TABLE `imovel_comodide_tb`
  ADD CONSTRAINT `fk_comodide_imovel` FOREIGN KEY (`id_comodide`) REFERENCES `comodide_tb` (`id_comodide`),
  ADD CONSTRAINT `fk_imovel_comodide` FOREIGN KEY (`id_imovel`) REFERENCES `imovel_tb` (`id_imovel`);

--
-- Limitadores para a tabela `imovel_tb`
--
ALTER TABLE `imovel_tb`
  ADD CONSTRAINT `fk_city_imovel` FOREIGN KEY (`id_city`) REFERENCES `city_tb` (`id_city`),
  ADD CONSTRAINT `fk_imovel_type_imovel` FOREIGN KEY (`id_imovel_type`) REFERENCES `imovel_type_tb` (`id_imovel_type`),
  ADD CONSTRAINT `fk_user_imovel` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `neighborhood_tb`
--
ALTER TABLE `neighborhood_tb`
  ADD CONSTRAINT `fk_neighborhood` FOREIGN KEY (`id_city`) REFERENCES `city_tb` (`id_city`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `payment_tb`
--
ALTER TABLE `payment_tb`
  ADD CONSTRAINT `fk_payment_booking` FOREIGN KEY (`id_user`,`id_imovel`) REFERENCES `booking_tb` (`id_user`, `id_imovel`),
  ADD CONSTRAINT `fk_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type_tb` (`id_payment_type`);

--
-- Limitadores para a tabela `personal_tb`
--
ALTER TABLE `personal_tb`
  ADD CONSTRAINT `fk_user_personal` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `photo_imovel_tb`
--
ALTER TABLE `photo_imovel_tb`
  ADD CONSTRAINT `fk_imovel_photo_imovel` FOREIGN KEY (`id_imovel`) REFERENCES `imovel_tb` (`id_imovel`);

--
-- Limitadores para a tabela `photo_tb`
--
ALTER TABLE `photo_tb`
  ADD CONSTRAINT `fk_user_photo` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`);

--
-- Limitadores para a tabela `reting_tb`
--
ALTER TABLE `reting_tb`
  ADD CONSTRAINT `fk_reting_imovel` FOREIGN KEY (`id_imovel`) REFERENCES `imovel_tb` (`id_imovel`),
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
