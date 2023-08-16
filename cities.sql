-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 16, 2023 at 08:43 PM
-- Server version: 5.7.40-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql_egrocer`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `formatted_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount_for_free_delivery` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` int(11) NOT NULL DEFAULT '0',
  `per_km_charge` int(11) NOT NULL DEFAULT '0',
  `range_wise_charges` text COLLATE utf8mb4_unicode_ci,
  `time_to_travel` int(11) NOT NULL DEFAULT '0',
  `geolocation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `radius` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `boundary_points` text COLLATE utf8mb4_unicode_ci,
  `max_deliverable_distance` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state`, `formatted_address`, `latitude`, `longitude`, `min_amount_for_free_delivery`, `delivery_charge_method`, `fixed_charge`, `per_km_charge`, `range_wise_charges`, `time_to_travel`, `geolocation_type`, `radius`, `boundary_points`, `max_deliverable_distance`) VALUES
(31, 'Bhuj', 'Gujarat', 'Bhuj, Gujarat, India', '23.2419997', '69.6669324', '40', 'fixed_charge', 100, 0, '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 5, NULL, '0', NULL, 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
