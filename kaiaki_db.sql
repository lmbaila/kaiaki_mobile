-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Jan-2020 às 17:25
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
  `code_booking` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `city_tb`
--

CREATE TABLE `city_tb` (
  `id_city` int(11) NOT NULL,
  `name_city` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `city_tb`
--

INSERT INTO `city_tb` (`id_city`, `name_city`) VALUES
(1, 'Maputo'),
(2, 'Gaza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comodide_tb`
--

CREATE TABLE `comodide_tb` (
  `id_comodide` int(11) NOT NULL,
  `name_comodide` varchar(50) DEFAULT NULL,
  `icon` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_imovel_tb`
--

CREATE TABLE `foto_imovel_tb` (
  `id_foto_imovel` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `foto_imovel_tb`
--

INSERT INTO `foto_imovel_tb` (`id_foto_imovel`, `id_imovel`, `url`) VALUES
(3, 1, 'www.cdn.kaiaki.com/sak9sa9dd9a2h9de29d2.png'),
(4, 1, 'www.cdn.kaiaki.com/sak9sa9dd9a2h9de29d2.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto_tb`
--

CREATE TABLE `foto_tb` (
  `id_foto` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `url` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_comodide_tb`
--

CREATE TABLE `imovel_comodide_tb` (
  `id_comodide` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `description_comodide` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imovel_tb`
--

INSERT INTO `imovel_tb` (`id_imovel`, `id_city`, `id_imovel_type`, `id_user`, `name_imovel`, `description_imovel`, `price_day`, `price_week`, `price_mouth`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6, 'Casa de Praia', 'kkskdkaskd', 1501.2, 2010, 4050, '82189219912', '-93928129192', '2020-01-19 15:13:43', '2020-01-19 15:15:48'),
(2, 1, 1, 6, 'Casa de Praia', 'kkskdkaskd', 2020.1, 20000, 4050, '82189219912', '-93928129192', '2020-01-19 15:17:57', '2020-01-19 15:17:57'),
(3, 1, 1, 6, 'Casa de Praia', 'kkskdkaskd', 2020.1, 20000, 4050, '82189219912', '-93928129192', '2020-01-19 15:46:13', '2020-01-19 15:46:13'),
(4, 1, 1, 6, 'Casa de Praia', 'kkskdkaskd', 2020.1, 20000, 4050, '82189219912', '-93928129192', '2020-01-19 15:46:14', '2020-01-19 15:46:14'),
(5, 1, 1, 6, 'Casa de Praia', 'kkskdkaskd', 2020.1, 20000, 4050, '82189219912', '-93928129192', '2020-01-19 15:46:14', '2020-01-19 15:46:14'),
(6, 1, 1, 6, 'Casa de Praia', 'kkskdkaskd', 2020.1, 20000, 4050, '82189219912', '-93928129192', '2020-01-19 15:46:15', '2020-01-19 15:46:15'),
(7, 1, 1, 6, 'Casa de Praia', 'kkskdkaskd', 2020.1, 20000, 4050, '82189219912', '-93928129192', '2020-01-19 15:46:17', '2020-01-19 15:46:17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel_type_tb`
--

CREATE TABLE `imovel_type_tb` (
  `id_imovel_type` int(11) NOT NULL,
  `name_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imovel_type_tb`
--

INSERT INTO `imovel_type_tb` (`id_imovel_type`, `name_type`) VALUES
(1, 'Flat'),
(2, 'Tipo 3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `neighborhood_tb`
--

CREATE TABLE `neighborhood_tb` (
  `id_neighborhood` int(11) NOT NULL,
  `id_city` int(11) NOT NULL,
  `name_neighborhood` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `neighborhood_tb`
--

INSERT INTO `neighborhood_tb` (`id_neighborhood`, `id_city`, `name_neighborhood`) VALUES
(1, 1, 'Hulene A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_tb`
--

CREATE TABLE `payment_tb` (
  `id_payment` int(11) NOT NULL,
  `id_payment_type` int(11) NOT NULL,
  `id_booking` varchar(50) NOT NULL,
  `amount` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_type_tb`
--

CREATE TABLE `payment_type_tb` (
  `id_payment_type` int(11) NOT NULL,
  `name_payment_type` varchar(50) DEFAULT NULL,
  `description_payment_type` text DEFAULT NULL
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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reting_tb`
--

CREATE TABLE `reting_tb` (
  `id_user` int(11) NOT NULL,
  `id_imovel` int(11) NOT NULL,
  `view_reting` int(11) NOT NULL,
  `desire_reting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_tb`
--

CREATE TABLE `user_tb` (
  `id_user` int(11) NOT NULL,
  `id_user_type` int(11) NOT NULL,
  `facebook_id` varchar(250) DEFAULT NULL,
  `google_id` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mail` varchar(75) DEFAULT NULL,
  `cell` varchar(16) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_tb`
--

INSERT INTO `user_tb` (`id_user`, `id_user_type`, `facebook_id`, `google_id`, `created_at`, `updated_at`, `mail`, `cell`, `password`) VALUES
(1, 1, '', '', '2020-01-15 20:38:48', '2020-01-16 19:24:31', 'tazcxcxczxczxc@mail.com', '+23233232', '21zaro23210'),
(2, 1, '', '', '2020-01-15 20:39:57', '2020-01-16 19:27:46', 'tazcxcxczxczxc@mail.com', '+23233232', '21zaro23210'),
(3, 1, '', '', '2020-01-15 20:41:05', '2020-01-16 19:27:50', 'tazcxcxczxczxc@mail.com', '+23233232', '$2a$10$OCWAzLZFOjqeZlMjg6pkNOiAX4mztYWRoV2ZYHcPzgjahtv8/a/pu'),
(4, 1, '', '', '2020-01-16 11:45:08', '2020-01-16 11:45:08', 'azcxcxczxczxc@mail.com', '+23233232', '$2a$10$ZC1Qhjcc5409kGRhostBpeH01wk5x5qWGGYJ2jWSnltA5gnUbVH.6'),
(5, 1, '', '', '2020-01-16 20:00:56', '2020-01-16 20:00:56', 'lz@mail.com', '+23233232', '$2a$10$guZcrVnsQWM1GqSVNoQH3OBLESkytJz07p2WSDLcK0YggiF8f6Ds2'),
(6, 1, '', '', '2020-01-18 06:22:11', '2020-01-18 06:22:11', 'suale@mail.com', '+23233232', '$2a$10$NqffDRDn37gzB4ZGICMZ8Os0BeTfPUgT.LLPBNyxzI2K5SP/ohv5K');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_type`
--

CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL,
  `name_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_type`
--

INSERT INTO `user_type` (`id_user_type`, `name_type`, `created_at`, `updated_at`) VALUES
(1, 'guest', '2020-01-15 16:54:41', '2020-01-15 16:54:41');

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
-- Índices para tabela `foto_imovel_tb`
--
ALTER TABLE `foto_imovel_tb`
  ADD PRIMARY KEY (`id_foto_imovel`),
  ADD KEY `fk_imovel_foto_imovel` (`id_imovel`);

--
-- Índices para tabela `foto_tb`
--
ALTER TABLE `foto_tb`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `fk_user_foto` (`id_personal`);

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
  ADD KEY `fk_payment_booking` (`id_booking`);

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
-- AUTO_INCREMENT de tabela `city_tb`
--
ALTER TABLE `city_tb`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `comodide_tb`
--
ALTER TABLE `comodide_tb`
  MODIFY `id_comodide` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `foto_imovel_tb`
--
ALTER TABLE `foto_imovel_tb`
  MODIFY `id_foto_imovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `foto_tb`
--
ALTER TABLE `foto_tb`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `imovel_tb`
--
ALTER TABLE `imovel_tb`
  MODIFY `id_imovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `imovel_type_tb`
--
ALTER TABLE `imovel_type_tb`
  MODIFY `id_imovel_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT de tabela `user_tb`
--
ALTER TABLE `user_tb`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Limitadores para a tabela `foto_imovel_tb`
--
ALTER TABLE `foto_imovel_tb`
  ADD CONSTRAINT `fk_imovel_foto_imovel` FOREIGN KEY (`id_imovel`) REFERENCES `imovel_tb` (`id_imovel`);

--
-- Limitadores para a tabela `foto_tb`
--
ALTER TABLE `foto_tb`
  ADD CONSTRAINT `fk_user_foto` FOREIGN KEY (`id_personal`) REFERENCES `personal_tb` (`id_personal`);

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
  ADD CONSTRAINT `fk_payment_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking_tb` (`code_booking`),
  ADD CONSTRAINT `fk_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type_tb` (`id_payment_type`);

--
-- Limitadores para a tabela `personal_tb`
--
ALTER TABLE `personal_tb`
  ADD CONSTRAINT `fk_user_personal` FOREIGN KEY (`id_user`) REFERENCES `user_tb` (`id_user`) ON DELETE CASCADE;

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
