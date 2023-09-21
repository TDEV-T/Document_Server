-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2023 at 09:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `document`
--

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id_pa` int(11) NOT NULL,
  `re_pa` int(11) NOT NULL,
  `name_pa` varchar(150) NOT NULL,
  `value_pa` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id_pa`, `re_pa`, `name_pa`, `value_pa`) VALUES
(4, 2, 'คุณครู', '100'),
(5, 2, 'นักเรียน', '50'),
(6, 2, 'อาจารย์', '50'),
(7, 3, 'คุณครู', '100'),
(8, 3, 'นักเรียน', '75'),
(9, 3, 'ูผู้ปกครอง', '25'),
(10, 4, 'ครู', '100'),
(11, 4, 'นักเรียน', '50');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id_re` int(11) NOT NULL,
  `start_re` date DEFAULT NULL,
  `activity_re` varchar(10) DEFAULT NULL,
  `project_re` varchar(10) DEFAULT NULL,
  `another_re` varchar(10) DEFAULT NULL,
  `dev_re` varchar(10) DEFAULT NULL,
  `manage_re` varchar(10) DEFAULT NULL,
  `plans_re` varchar(10) DEFAULT NULL,
  `technical_re` varchar(10) DEFAULT NULL,
  `college_re` varchar(10) DEFAULT NULL,
  `group_re` varchar(10) DEFAULT NULL,
  `work_re` varchar(10) DEFAULT NULL,
  `dept_re` varchar(10) DEFAULT NULL,
  `location_re` varchar(255) DEFAULT NULL,
  `name_re` varchar(255) DEFAULT NULL,
  `content_re` varchar(1000) DEFAULT NULL,
  `benefit_re` varchar(1000) DEFAULT NULL,
  `comment_re` varchar(1000) DEFAULT NULL,
  `own_re` int(11) DEFAULT NULL,
  `img_re` varchar(255) DEFAULT NULL,
  `result_re` varchar(1000) DEFAULT NULL,
  `statusmade_re` tinyint(1) DEFAULT NULL,
  `namemade_re` varchar(255) DEFAULT NULL,
  `deptmade_re` varchar(255) DEFAULT NULL,
  `date_re` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id_re`, `start_re`, `activity_re`, `project_re`, `another_re`, `dev_re`, `manage_re`, `plans_re`, `technical_re`, `college_re`, `group_re`, `work_re`, `dept_re`, `location_re`, `name_re`, `content_re`, `benefit_re`, `comment_re`, `own_re`, `img_re`, `result_re`, `statusmade_re`, `namemade_re`, `deptmade_re`, `date_re`) VALUES
(2, '2023-09-21', 'true', 'false', 'false', 'false', 'true', 'false', 'true', 'true', 'false', 'false', 'false', 'โรงอาหาร วิทยาลัยเขต 1', 'น้ำอัดลมอร่อยมาก', 'สุดยอดมากน้ำอัดลมดีมาก ควรกินเยอะๆ ', 'น้ำอัดลมอร่อยขึ้น,น้ำอัดลมดีขึ้น', 'ไม่ควรกินน้ำอัดลมเยอะ,ไม่มี', 1, '1695276870980__coke6.png,1695276870981__coke5.png,1695276870982__coke4.png,1695276870983__coke3.jpg,1695276870983__coke2.jpg,1695276870984__coke`1.png', 'สุดยอดมาก สามารถทำให้น้ำอัดลมอร่อยขึ้นมาก ', 2, 'ภัทรพล พิทักษ์', 'วิทยาลัยเทคนิคพังงา', '2023-09-21'),
(3, '2023-09-13', 'true', 'true', 'false', 'true', 'false', 'false', 'true', 'true', 'false', 'true', 'false', 'โรงอาหาร วิทยาลัยเขต 1', 'น้ำอัดลมอร่อยมากมากๆๆๆๆ', 'สุดยอดมากน้ำอัดลม', 'น้ำอัดลมไม่มีประโยชน์,น้ำอัดลมไม่ไหว', 'ไม่กินน้ำอัดลม,เลิกกินของหวาน', 1, '1695282342491__coke.jpg,1695282342491__coke1.jpg,1695282342491__coke6.png,1695282342494__coke4.png,1695282342494__coke3.jpg,1695282342494__coke`1.png', 'น้ำอัดลมอร่อยมาก ไม่ไหว', 2, 'ภัทรพล พิทักษ์', 'ฝ่ายบุคคล', '2023-09-21'),
(4, '2023-09-13', 'true', 'true', 'false', 'false', 'true', 'false', 'true', 'true', 'false', 'true', 'false', 'โรงอาหาร วิทยาลัยเขต 1', 'น้ำอัดลมอร่อยมาก', 'ไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลม', 'น้ำอัดลมอร่อยมาก,น้ำปั่น', 'ไม่กินน้ำอัดลม,น้ำอัดลมอร่อยมาก', 1, '1695282560910__images.jpg,1695282560910__pngtree-coke-glass-transparent-fresh-drink-png-image_3792842.jpg,1695282560910__coke.jpg,1695282560910__coke1.jpg,1695282560911__coke6.png,1695282560913__coke3.jpg', 'ไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลมไม่กินน้ำอัดลม', 1, 'ภัทรพล พิทักษ์', 'วิทยาลัยเทคนิคพังงา', '2023-09-21');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id_tu` int(1) NOT NULL,
  `name_tu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id_tu`, `name_tu`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username_user` varchar(150) NOT NULL,
  `password_user` varchar(150) NOT NULL,
  `fname_user` varchar(150) NOT NULL,
  `lname_user` varchar(150) NOT NULL,
  `address_user` varchar(150) NOT NULL,
  `tel_user` varchar(150) NOT NULL,
  `type_user` int(1) NOT NULL DEFAULT 1,
  `timestamp_user` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username_user`, `password_user`, `fname_user`, `lname_user`, `address_user`, `tel_user`, `type_user`, `timestamp_user`) VALUES
(1, 'user', '$2b$10$OFElc0FyH60NxFgASjThZupWn4fva94kvF2Sx65QiPog37m.OPx5q', 'Pathrapol', 'Pitak', '70 thailand', '1234', 1, '2023-09-21 04:38:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id_pa`),
  ADD KEY `re_pa` (`re_pa`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id_re`),
  ADD KEY `own_re` (`own_re`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_tu`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `type_user` (`type_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id_pa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id_re` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id_tu` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`re_pa`) REFERENCES `reports` (`id_re`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`own_re`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_user`) REFERENCES `types` (`id_tu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
