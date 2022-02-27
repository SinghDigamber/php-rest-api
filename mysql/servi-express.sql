-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 27, 2022 at 05:32 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `servi-express`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id_dirvers` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `censo` int(10) NOT NULL,
  `imagen` varchar(1000) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id_dirvers`, `nombre`, `placa`, `censo`, `imagen`, `password`) VALUES
(1124066926, 'juan david montoya', 'afc22a', 102, '', 'jlospino'),
(1124066936, 'jorge luis ospino', 'afc21b', 101, '', 'jlospino');

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `id_drivers` int(10) NOT NULL,
  `estrellas` int(1) NOT NULL,
  `opinion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`id_drivers`, `estrellas`, `opinion`) VALUES
(1124066936, 4443, 'nn');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id_reservations` int(10) NOT NULL,
  `id_users` int(10) NOT NULL,
  `lugar_inicio` varchar(100) NOT NULL,
  `lugar_destino` varchar(100) NOT NULL,
  `cupos` int(2) NOT NULL,
  `id_drivers` int(10) DEFAULT NULL,
  `censo_drivers` int(10) DEFAULT NULL,
  `placa_drivers` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id_reservations`, `id_users`, `lugar_inicio`, `lugar_destino`, `cupos`, `id_drivers`, `censo_drivers`, `placa_drivers`, `fecha`) VALUES
(2, 112545555, 'calle 2', 'san martin', 3, 1124066926, 102, 'afc22a', '2022-02-20 21:11:51'),
(8, 12332233, 'sdffd', 'sdfsdf', 3, 1124066936, 101, 'afc21b', '2022-02-20 23:24:00'),
(9, 12332233, 'fh', 'dfhf', 3, 1124066936, 101, 'afc21b', '2022-02-20 23:24:31'),
(32, 112545555, 'santo domingo', 'santo domingo', 2, 1124066926, 102, 'afc22a', '2022-02-21 06:07:11'),
(98, 112545555, '', '', 2, 1124066926, 101, 'afc22a', '2022-02-20 23:29:45'),
(3254, 112545555, 'santo domingo', 'santo domingo', 2, NULL, NULL, NULL, '2022-02-22 02:49:57'),
(3454, 112545555, 'santo domingo', 'santo domingo', 2, 1124066926, 102, 'afc22a', '2022-02-22 02:36:25'),
(3455, 112545555, 'hkj', 'hbvi', 5, NULL, NULL, NULL, '2022-02-21 20:44:34'),
(3456, 12332233, 'jklj', 'guyyk', 1, NULL, NULL, NULL, '2022-02-21 20:45:22'),
(33332, 112545555, 'santo domingo', 'santo domingo', 2, NULL, NULL, NULL, '2022-02-22 02:50:14'),
(33333, 112545555, 'santo domingo', 'santo domingo', 2, NULL, NULL, NULL, '2022-02-22 02:52:33'),
(33335, 112545555, 'santo domingo', 'santo domingo', 2, NULL, NULL, NULL, '2022-02-22 02:52:47'),
(33336, 112545555, 'santo domingorr', 'santo domingorr', 2, NULL, NULL, NULL, '2022-02-22 02:52:50'),
(33337, 112545555, 'santo domingorr', 'santo domingorr', 2, NULL, NULL, NULL, '2022-02-22 02:52:54'),
(33338, 112545555, 'santo domingorr', 'santo domingorr', 4, NULL, NULL, NULL, '2022-02-22 02:52:59'),
(33339, 112545555, 'santo domingorr', 'santo domingorr', 4, NULL, NULL, NULL, '2022-02-22 03:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `nombre`, `correo`, `password`) VALUES
(12332233, 'sebastian moreno', 'sebas@gmail.com', 'sebas123'),
(112545555, 'laura madrid orrego', 'laumadrid@gmail.com', 'laumadrid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id_dirvers`) USING BTREE,
  ADD UNIQUE KEY `censo` (`censo`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD KEY `id_drivers` (`id_drivers`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id_reservations`),
  ADD KEY `id_drivers` (`id_drivers`),
  ADD KEY `nombre` (`id_users`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `censo_drivers` (`censo_drivers`),
  ADD KEY `placa_dirvers` (`placa_drivers`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id_reservations` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33341;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `evaluations_ibfk_1` FOREIGN KEY (`id_drivers`) REFERENCES `drivers` (`id_dirvers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`id_drivers`) REFERENCES `drivers` (`id_dirvers`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`placa_drivers`) REFERENCES `drivers` (`placa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_4` FOREIGN KEY (`censo_drivers`) REFERENCES `drivers` (`censo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
