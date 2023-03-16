-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 09:19 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `res_order`
--

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id_f` int(11) NOT NULL,
  `name_f` varchar(150) NOT NULL,
  `file_f` varchar(100) NOT NULL,
  `price_f` int(11) NOT NULL,
  `type_f` int(11) NOT NULL,
  `status_f` int(1) NOT NULL DEFAULT 1,
  `timestamp_f` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id_f`, `name_f`, `file_f`, `price_f`, `type_f`, `status_f`, `timestamp_f`) VALUES
(1, 'Fish Fried', '2046267447.jpg', 250, 3, 1, '2023-02-26 04:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_ord` int(11) NOT NULL,
  `f_ord` int(11) NOT NULL,
  `own_ord` int(11) NOT NULL,
  `quantity_ord` int(11) NOT NULL,
  `status_ord` int(1) NOT NULL DEFAULT 1,
  `timestamp_ord` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id_ord`, `f_ord`, `own_ord`, `quantity_ord`, `status_ord`, `timestamp_ord`) VALUES
(1, 1, 11, 10, 1, '2023-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id_type` int(11) NOT NULL,
  `name_type` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id_type`, `name_type`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `type_foods`
--

CREATE TABLE `type_foods` (
  `id_ftype` int(11) NOT NULL,
  `name_ftype` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type_foods`
--

INSERT INTO `type_foods` (`id_ftype`, `name_ftype`) VALUES
(2, 'Desert'),
(3, 'Main');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username_user` varchar(100) NOT NULL,
  `password_user` varchar(20) NOT NULL,
  `fname_user` varchar(100) NOT NULL,
  `lname_user` varchar(100) NOT NULL,
  `address_user` varchar(100) NOT NULL,
  `tel_user` varchar(10) NOT NULL,
  `file_user` varchar(100) NOT NULL,
  `status_user` varchar(1) NOT NULL DEFAULT '0',
  `table_user` int(11) DEFAULT NULL,
  `type_user` int(11) NOT NULL DEFAULT 1,
  `timestamp_user` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username_user`, `password_user`, `fname_user`, `lname_user`, `address_user`, `tel_user`, `file_user`, `status_user`, `table_user`, `type_user`, `timestamp_user`) VALUES
(10, 'usre1', '1234', 'Pathrapol', 'Pitak', 'Thailand', '06333333', '1351037128.jfif', '1', NULL, 2, '2023-02-26 03:09:26'),
(11, 'person1', '1234', 'person', 'lastname1', 'Thailand', '0633333322', '1141523915.jfif', '1', NULL, 1, '2023-02-26 06:58:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id_f`),
  ADD KEY `type_f` (`type_f`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_ord`,`f_ord`),
  ADD KEY `f_ord` (`f_ord`),
  ADD KEY `own_ord` (`own_ord`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `type_foods`
--
ALTER TABLE `type_foods`
  ADD PRIMARY KEY (`id_ftype`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `type_user` (`type_user`),
  ADD KEY `table_user` (`table_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id_f` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id_ord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_foods`
--
ALTER TABLE `type_foods`
  MODIFY `id_ftype` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`type_f`) REFERENCES `type_foods` (`id_ftype`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`f_ord`) REFERENCES `foods` (`id_f`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`own_ord`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
