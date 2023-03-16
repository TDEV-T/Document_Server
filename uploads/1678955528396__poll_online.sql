-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 09:20 AM
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
-- Database: `poll_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `poll_header`
--

CREATE TABLE `poll_header` (
  `id_ph` int(11) NOT NULL,
  `text_ph` varchar(250) NOT NULL,
  `status_ph` int(1) NOT NULL DEFAULT 1,
  `timestamp_ph` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poll_header`
--

INSERT INTO `poll_header` (`id_ph`, `text_ph`, `status_ph`, `timestamp_ph`) VALUES
(2, 'ภาษาไหนน่าสนใจที่สุดในปี 2022', 1, '2023-03-01 02:50:32'),
(3, 'Database ที่น่าสนใจ 2023', 1, '2023-03-01 02:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `poll_option`
--

CREATE TABLE `poll_option` (
  `id_po` int(11) NOT NULL,
  `text_po` varchar(150) NOT NULL,
  `ph_po` int(11) NOT NULL,
  `timestamp_po` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poll_option`
--

INSERT INTO `poll_option` (`id_po`, `text_po`, `ph_po`, `timestamp_po`) VALUES
(6, 'Python', 2, '2023-03-01 04:22:04'),
(8, 'javascript', 2, '2023-03-01 04:22:45'),
(9, 'Java', 2, '2023-03-01 04:22:56'),
(10, 'MongoDB', 3, '2023-03-01 04:23:25'),
(11, 'MariaDB', 3, '2023-03-01 04:23:33'),
(12, 'PostgreSQL', 3, '2023-03-01 04:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `poll_status`
--

CREATE TABLE `poll_status` (
  `id_ps` int(11) NOT NULL,
  `own_ps` int(11) NOT NULL,
  `po_ps` int(11) NOT NULL,
  `timestamp_ps` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poll_status`
--

INSERT INTO `poll_status` (`id_ps`, `own_ps`, `po_ps`, `timestamp_ps`) VALUES
(3, 11, 9, '2023-03-01 05:56:28'),
(4, 12, 6, '2023-03-01 08:17:54');

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
(10, 'admin', '1234', 'Admin', 'Poll', 'Thailand', '06333333', '2107528912.jpg', '1', NULL, 2, '2023-02-26 03:09:26'),
(11, 'person1', '1234', 'person', 'lastname1', 'Thailand', '0633333322', '1141523915.jfif', '1', NULL, 1, '2023-02-26 06:58:25'),
(12, 'person2', '1234', 'person2', 'lastname2', 'Thailand', '0633333322', '1141523915.jfif', '1', NULL, 1, '2023-02-26 06:58:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `poll_header`
--
ALTER TABLE `poll_header`
  ADD PRIMARY KEY (`id_ph`);

--
-- Indexes for table `poll_option`
--
ALTER TABLE `poll_option`
  ADD PRIMARY KEY (`id_po`),
  ADD KEY `ph_po` (`ph_po`);

--
-- Indexes for table `poll_status`
--
ALTER TABLE `poll_status`
  ADD PRIMARY KEY (`id_ps`),
  ADD KEY `own_ps` (`own_ps`),
  ADD KEY `po_ps` (`po_ps`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `poll_header`
--
ALTER TABLE `poll_header`
  MODIFY `id_ph` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `poll_option`
--
ALTER TABLE `poll_option`
  MODIFY `id_po` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `poll_status`
--
ALTER TABLE `poll_status`
  MODIFY `id_ps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `poll_option`
--
ALTER TABLE `poll_option`
  ADD CONSTRAINT `poll_option_ibfk_1` FOREIGN KEY (`ph_po`) REFERENCES `poll_header` (`id_ph`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poll_status`
--
ALTER TABLE `poll_status`
  ADD CONSTRAINT `poll_status_ibfk_1` FOREIGN KEY (`own_ps`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `poll_status_ibfk_2` FOREIGN KEY (`po_ps`) REFERENCES `poll_option` (`id_po`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_user`) REFERENCES `types` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
