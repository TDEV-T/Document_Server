-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2023 at 03:02 AM
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
-- Database: `vote_online`
--

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
(10, 'admin', '1234', 'Admin', 'Vote\r\n', 'Thailand', '06333333', '1351037128.jfif', '1', NULL, 2, '2023-02-26 03:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `vote_header`
--

CREATE TABLE `vote_header` (
  `id_vh` int(11) NOT NULL,
  `text_vh` varchar(150) NOT NULL,
  `status_vh` int(1) NOT NULL DEFAULT 1,
  `timestamp_vh` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vote_option`
--

CREATE TABLE `vote_option` (
  `id_vo` int(11) NOT NULL,
  `text_vo` varchar(150) NOT NULL,
  `file_vo` varchar(100) NOT NULL,
  `vh_vo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vote_status`
--

CREATE TABLE `vote_status` (
  `id_vs` int(11) NOT NULL,
  `vo_vs` int(11) NOT NULL,
  `own_vs` int(11) NOT NULL,
  `timestamp_vs` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `type_user` (`type_user`),
  ADD KEY `table_user` (`table_user`);

--
-- Indexes for table `vote_header`
--
ALTER TABLE `vote_header`
  ADD PRIMARY KEY (`id_vh`);

--
-- Indexes for table `vote_option`
--
ALTER TABLE `vote_option`
  ADD PRIMARY KEY (`id_vo`),
  ADD KEY `vh_vo` (`vh_vo`);

--
-- Indexes for table `vote_status`
--
ALTER TABLE `vote_status`
  ADD PRIMARY KEY (`id_vs`),
  ADD KEY `vo_vs` (`vo_vs`),
  ADD KEY `own_vs` (`own_vs`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `vote_header`
--
ALTER TABLE `vote_header`
  MODIFY `id_vh` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vote_option`
--
ALTER TABLE `vote_option`
  MODIFY `id_vo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vote_status`
--
ALTER TABLE `vote_status`
  MODIFY `id_vs` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_user`) REFERENCES `types` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_option`
--
ALTER TABLE `vote_option`
  ADD CONSTRAINT `vote_option_ibfk_1` FOREIGN KEY (`vh_vo`) REFERENCES `vote_header` (`id_vh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_status`
--
ALTER TABLE `vote_status`
  ADD CONSTRAINT `vote_status_ibfk_1` FOREIGN KEY (`vo_vs`) REFERENCES `vote_option` (`id_vo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vote_status_ibfk_2` FOREIGN KEY (`own_vs`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
