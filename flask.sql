-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 23, 2017 at 10:34 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `docs` text NOT NULL,
  `doc_type` varchar(200) NOT NULL,
  `level` varchar(20) NOT NULL,
  `matric` varchar(50) NOT NULL,
  `topic` varchar(200) NOT NULL,
  `supervisor` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `docs`, `doc_type`, `level`, `matric`, `topic`, `supervisor`, `date`) VALUES
(1, 'SHORTLY ABOUT US\n\nNACOSS an acronym for Nigeria Association of Computer Science Students. This association brings together students of Computer Science and Engineering students'' in LAUTECH who works together using their Information communication technology knowledge to liberate the world from apparent skill deficiencies. The association is the most organized and influential student associations in West Africa sub-region and even Africa at large. .\n\nNACOSS is the student body for all students of Computer Science in higher institutions of learning across Nigeria. The association is an affiliate of the NIGERIA COMPUTER SOCIETY(NCS). Units of the association in higher institutions are referred to as CHAPTERS. The motto of the association is "TOWARDS ADVANCED TECHNOLOGY".\nSlogan', 'introduction', 'NDII', '12/69/0191', '', '', '2017-01-12 00:54:03'),
(4, 'SHORTLY ABOUT US\n\nNACOSS an acronym for Nigeria Association of Computer Science Students. This association brings together students of Computer Science and Engineering students'' in LAUTECH who works together using their Information communication technology knowledge to liberate the world from apparent skill deficiencies. The association is the most organized and influential student associations in West Africa sub-region and even Africa at large. .\n\nNACOSS is the student body for all students of Computer Science in higher institutions of learning across Nigeria. The association is an affiliate of the NIGERIA COMPUTER SOCIETY(NCS). Units of the association in higher institutions are referred to as CHAPTERS. The motto of the association is "TOWARDS ADVANCED TECHNOLOGY".\nSlogan', 'introduction', 'HNDII', '12/69/0002', '', '', '2017-01-12 02:14:57'),
(5, 'i love programming. i love to code PHP.\n', 'introduction', 'HNDII', '12/69/0124', '', '', '2017-01-12 13:07:01'),
(6, 'i love programming. i love to code PHP.\r\n', 'introduction', 'NDII', '12/69/0008', '', '', '2017-01-12 13:50:46'),
(7, 'programming is fun to me and i love to code. i code JS, PHP, Angular JS, python, flask', 'introduction', '', '', '', '', '2017-01-13 16:32:49'),
(8, ' NACOSS is the student body for all students of Computer Science in higher institutions of learning across Nigeria. The association is an affiliate of the NIGERIA COMPUTER SOCIETY(NCS). Units of the association in higher institutions are referred to as CHAPTERS. The motto of the association is "TOWARDS ADVANCED TECHNOLOGY". Slogan', 'methodology', '', '', '', '', '2017-01-14 21:34:49'),
(9, 'computer is an electronic machine that process data and gives out information', 'methodology', '', '', '', '', '2017-01-16 11:57:56'),
(10, 'sdflksjdf', 'methodology', 'NDII', '12/69/0191', 'web based chatting', 'Mr. Bamgboye', '2017-01-23 17:16:37'),
(11, ' NACOSS is the student body for all students of Computer Science in higher institutions of learning across Nigeria. The association is an affiliate of the NIGERIA COMPUTER SOCIETY(NCS). Units of the association in higher institutions are referred to as CHAPTERS. The motto of the association is "TOWARDS ADVANCED TECHNOLOGY". Slogan', 'introduction', 'NDII', '12/69/0191, 12/69/0192, 12/69/0193', 'web based chatting system', 'Mr. Bamgboye', '2017-01-23 17:18:37');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `username` varchar(80) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `email`) VALUES
(1, 'Abiodun', 'info@mail.com'),
(2, 'Solomon', 'solomon@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin@mail.com', '123123'),
(3, 'megafuse@mail.com', 'asd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
