-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2018 at 06:51 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `groupa`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorized_officer`
--

CREATE TABLE `authorized_officer` (
  `officer_id` varchar(5) NOT NULL,
  `officer_name` varchar(20) DEFAULT NULL,
  `parcel_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorized_officer`
--

INSERT INTO `authorized_officer` (`officer_id`, `officer_name`, `parcel_code`) VALUES
('U100', 'Kamal Adli', 'MY12345'),
('U101', 'Shafiq Sidek', 'EN5671');

-- --------------------------------------------------------

--
-- Table structure for table `parcel`
--

CREATE TABLE `parcel` (
  `parcel_code` varchar(15) NOT NULL,
  `no_shelf` int(4) DEFAULT NULL,
  `parcel_date` date NOT NULL,
  `parcel_status` varchar(15) NOT NULL,
  `icno` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parcel`
--

INSERT INTO `parcel` (`parcel_code`, `no_shelf`, `parcel_date`, `parcel_status`, `icno`) VALUES
('EN1234', 1, '2018-12-18', 'Pickup', '980720-03-5751'),
('EN5671', 2, '2018-12-13', 'Pickup', '981212-01-5038'),
('MY12345', 12, '2018-12-12', 'Available', '980720-03-5751');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `icno` varchar(14) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_addr` varchar(200) NOT NULL,
  `user_password` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`icno`, `user_name`, `user_phone`, `user_email`, `user_addr`, `user_password`) VALUES
('980720-03-5751', 'Irfan Mahadi', '0189140494', 'irfan@gmail.com', 'kg batu rakit', 'irfan'),
('981018-08-7070', 'nazirah ', '0135062396', 'zyra@gmail.com', 'Kg A', 'zyra'),
('981121-08-6818', 'Nawal Hanis', '0184682515', 'nawal@gmail.com', 'Taman Klebang', 'nawal'),
('981212-01-5038', 'Adila Panut', '0187662453', 'adila@gmail.com', 'kg pok gong jin', 'adila');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorized_officer`
--
ALTER TABLE `authorized_officer`
  ADD PRIMARY KEY (`officer_id`),
  ADD KEY `parcel_code` (`parcel_code`);

--
-- Indexes for table `parcel`
--
ALTER TABLE `parcel`
  ADD PRIMARY KEY (`parcel_code`),
  ADD KEY `icno` (`icno`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`icno`),
  ADD UNIQUE KEY `user_password` (`user_password`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorized_officer`
--
ALTER TABLE `authorized_officer`
  ADD CONSTRAINT `authorized_officer_ibfk_1` FOREIGN KEY (`parcel_code`) REFERENCES `parcel` (`parcel_code`);

--
-- Constraints for table `parcel`
--
ALTER TABLE `parcel`
  ADD CONSTRAINT `parcel_ibfk_1` FOREIGN KEY (`icno`) REFERENCES `user` (`icno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
