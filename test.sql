-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 04:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--
-- --------------------------------------------------------
--
-- Table structure for table `kendaraan`
--
CREATE TABLE
  `kendaraan` (
    `NomerRegistrasi` int (55) NOT NULL,
    `NomerPolisi` varchar(55) NOT NULL,
    `NamaSuratJalan` varchar(255) NOT NULL,
    `NamaSupir` varchar(255) NOT NULL,
    `photo_path` varchar(255) DEFAULT NULL,
    `body_temperature` decimal(5, 2) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

--
-- Dumping data for table `kendaraan`
--
INSERT INTO
  `kendaraan` (
    `NomerRegistrasi`,
    `NomerPolisi`,
    `NamaSuratJalan`,
    `NamaSupir`,
    `photo_path`,
    `body_temperature`
  )
VALUES
  (
    1,
    'B 3456 UBL',
    'TRISNO',
    'AGUS',
    'http://192.168.3.105/kendaraan/img/1.png',
    NULL
  ),
  (
    2,
    'B 1234 ABC',
    'Surat Jalan 001',
    'Andi Setiawan',
    NULL,
    NULL
  ),
  (
    3,
    'D 5678 DEF',
    'Surat Jalan 002',
    'Budi Santoso',
    NULL,
    NULL
  );

-- --------------------------------------------------------
--
-- Table structure for table `user`
--
CREATE TABLE
  `user` (
    `id` int (55) NOT NULL,
    `nama` varchar(255) NOT NULL,
    `username` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COLLATE = latin1_swedish_ci;

--
-- Dumping data for table `user`
--
INSERT INTO
  `user` (`id`, `nama`, `username`, `password`)
VALUES
  (1, 'testet', 'test', '123'),
  (4, 'andri', 'guest', '123'),
  (5, 'andri', 'guest1', '1234'),
  (10, 'lol', 'tffggg', 'ggy'),
  (11, 'ada', 'testing', '123'),
  (12, '', 'ada', '123'),
  (13, 'testing', 'welcome', 'welcome'),
  (14, 'testingh', '1', '2'),
  (15, 'tets', '12', '3'),
  (16, 'brif', 'brif', '123'),
  (17, 'test', '123', '123');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan` ADD PRIMARY KEY (`NomerRegistrasi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user` ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan` MODIFY `NomerRegistrasi` int (55) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user` MODIFY `id` int (55) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 18;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;