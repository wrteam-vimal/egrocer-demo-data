-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 16, 2023 at 08:35 PM
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
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '(1: Available, 0: Sold Out)',
  `measurement` double(8,2) NOT NULL,
  `price` double(11,2) NOT NULL,
  `discounted_price` double(11,2) NOT NULL DEFAULT '0.00',
  `stock` double(11,2) NOT NULL DEFAULT '0.00',
  `stock_unit_id` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `type`, `status`, `measurement`, `price`, `discounted_price`, `stock`, `stock_unit_id`, `deleted_at`) VALUES
(1, 1, 'packet', 1, 100.00, 120.00, 100.00, 999669.00, 2, NULL),
(2, 1, 'packet', 1, 200.00, 240.00, 200.00, 999971.00, 2, NULL),
(3, 1, 'packet', 1, 500.00, 600.00, 450.00, 999978.00, 2, NULL),
(4, 1, 'packet', 1, 1.00, 1200.00, 800.00, 999982.00, 2, NULL),
(5, 2, 'packet', 1, 150.00, 150.00, 80.00, 999752.00, 1, NULL),
(6, 2, 'packet', 1, 250.00, 250.00, 200.00, 999996.00, 1, NULL),
(7, 2, 'packet', 1, 350.00, 350.00, 300.00, 999996.00, 1, NULL),
(8, 2, 'packet', 1, 450.00, 450.00, 400.00, 999993.00, 1, NULL),
(9, 2, 'packet', 1, 800.00, 800.00, 600.00, 999992.00, 1, NULL),
(10, 2, 'packet', 1, 1.00, 1000.00, 800.00, 999997.00, 1, NULL),
(11, 3, 'packet', 1, 1.00, 1000.00, 800.00, 0.00, 1, NULL),
(12, 3, 'packet', 0, 2.00, 2000.00, 1800.00, 0.00, 1, NULL),
(13, 3, 'packet', 1, 3.00, 3000.00, 2500.00, 0.00, 1, NULL),
(14, 3, 'packet', 1, 4.00, 4000.00, 3000.00, 0.00, 1, NULL),
(15, 3, 'packet', 1, 8.00, 8000.00, 6000.00, 0.00, 1, NULL),
(16, 3, 'packet', 1, 10.00, 100000.00, 7000.00, 0.00, 1, NULL),
(17, 4, 'packet', 1, 100.00, 100.00, 80.00, 999767.00, 4, NULL),
(18, 4, 'packet', 1, 200.00, 200.00, 180.00, 999981.00, 4, NULL),
(19, 4, 'packet', 1, 300.00, 300.00, 250.00, 999991.00, 4, NULL),
(20, 4, 'packet', 1, 400.00, 400.00, 300.00, 999985.00, 4, NULL),
(21, 4, 'packet', 1, 500.00, 500.00, 350.00, 999974.00, 4, NULL),
(22, 4, 'packet', 1, 600.00, 600.00, 400.00, 999982.00, 4, NULL),
(23, 5, 'packet', 1, 100.00, 20.00, 15.00, 100000.00, 4, NULL),
(24, 5, 'packet', 1, 300.00, 300.00, 250.00, 100000.00, 4, NULL),
(25, 5, 'packet', 1, 600.00, 600.00, 400.00, 100000.00, 4, NULL),
(26, 5, 'packet', 1, 700.00, 700.00, 300.00, 100000.00, 4, NULL),
(27, 5, 'packet', 1, 750.00, 750.00, 350.00, 100000.00, 4, NULL),
(28, 5, 'packet', 1, 900.00, 900.00, 800.00, 100000.00, 4, NULL),
(29, 10, 'packet', 1, 100.00, 10.00, 8.00, 999880.00, 4, NULL),
(30, 10, 'packet', 1, 498.00, 20.00, 15.00, 999991.00, 4, NULL),
(31, 10, 'packet', 1, 1000.00, 25.00, 20.00, 999985.00, 4, NULL),
(32, 11, 'packet', 1, 100.00, 2500.00, 0.00, 99987.00, 2, NULL),
(33, 12, 'loose', 1, 1.00, 1000.00, 0.00, 1.00, 1, NULL),
(34, 12, 'loose', 1, 5.00, 5000.00, 0.00, 5.00, 1, NULL),
(35, 12, 'loose', 1, 10.00, 10000.00, 0.00, 10.00, 1, NULL),
(36, 12, 'loose', 1, 15.00, 15000.00, 0.00, 15.00, 1, NULL),
(37, 13, 'loose', 1, 1.00, 1000.00, 0.00, 1.00, 1, NULL),
(38, 14, 'loose', 1, 1.00, 1000.00, 0.00, 1.00, 1, NULL),
(39, 15, 'loose', 1, 1.00, 1000.00, 0.00, 1.00, 1, NULL),
(40, 15, 'loose', 1, 2.00, 2000.00, 0.00, 10.00, 1, NULL),
(41, 15, 'loose', 1, 5.00, 5000.00, 0.00, 10.00, 1, NULL),
(42, 15, 'loose', 1, 10.00, 10000.00, 0.00, 10.00, 1, NULL),
(43, 16, 'loose', 1, 1.00, 500.00, 0.00, 1.00, 1, NULL),
(44, 17, 'packet', 1, 5.00, 1700.00, 0.00, 99995.00, 3, NULL),
(45, 17, 'packet', 1, 10.00, 3400.00, 3100.00, 999999.00, 3, NULL),
(46, 17, 'packet', 1, 15.00, 5100.00, 5000.00, 99999.00, 3, NULL),
(47, 17, 'packet', 1, 20.00, 6800.00, 5000.00, 99999997.00, 3, NULL),
(48, 18, 'loose', 1, 1.00, 1500.00, 0.00, 1.00, 3, NULL),
(49, 18, 'loose', 1, 2.00, 3000.00, 0.00, 5000.00, 3, NULL),
(50, 18, 'loose', 1, 5.00, 7500.00, 0.00, 5.00, 3, NULL),
(51, 19, 'loose', 1, 1.00, 600.00, 0.00, 1.00, 1, NULL),
(52, 19, 'loose', 1, 5.00, 3000.00, 0.00, 10.00, 1, NULL),
(53, 19, 'loose', 1, 10.00, 6000.00, 0.00, 10.00, 1, NULL),
(54, 20, 'loose', 1, 1.00, 150.00, 0.00, 1.00, 1, NULL),
(55, 20, 'loose', 1, 2.00, 300.00, 0.00, 2.00, 1, NULL),
(56, 20, 'loose', 1, 5.00, 750.00, 0.00, 5.00, 1, NULL),
(57, 21, 'loose', 1, 1.00, 22.00, 0.00, 1.00, 1, NULL),
(58, 21, 'loose', 1, 2.00, 44.00, 0.00, 4.00, 1, NULL),
(59, 21, 'loose', 1, 5.00, 55.00, 0.00, 5.00, 1, NULL),
(60, 22, 'loose', 1, 1.00, 100.00, 0.00, 1.00, 1, NULL),
(61, 22, 'loose', 1, 2.00, 200.00, 0.00, 2.00, 1, NULL),
(62, 22, 'loose', 1, 5.00, 500.00, 0.00, 5.00, 1, NULL),
(63, 23, 'packet', 1, 100.00, 100.00, 99.00, 999926.00, 2, NULL),
(64, 24, 'loose', 1, 1.00, 250.00, 0.00, 1.00, 1, NULL),
(65, 25, 'loose', 1, 1.00, 300.00, 0.00, 1.00, 1, NULL),
(66, 25, 'loose', 1, 2.00, 600.00, 0.00, 2.00, 1, NULL),
(67, 25, 'loose', 1, 5.00, 1500.00, 0.00, 5.00, 1, NULL),
(68, 25, 'loose', 1, 8.00, 2400.00, 0.00, 8.00, 1, NULL),
(69, 26, 'packet', 1, 1.00, 100.00, 99.00, 9963.00, 5, NULL),
(70, 27, 'loose', 1, 100.00, 120.00, 0.00, 400.00, 2, NULL),
(71, 27, 'loose', 1, 200.00, 200.00, 0.00, 500.00, 2, NULL),
(72, 27, 'loose', 1, 300.00, 300.00, 0.00, 300.00, 2, NULL),
(73, 27, 'loose', 1, 400.00, 400.00, 0.00, 500.00, 2, NULL),
(74, 27, 'loose', 1, 500.00, 500.00, 0.00, 500.00, 2, NULL),
(75, 28, 'loose', 1, 1.00, 100.00, 0.00, 1.00, 1, NULL),
(76, 29, 'packet', 1, 1.00, 15.00, 10.00, 999999999.00, 7, NULL),
(77, 30, 'packet', 1, 1.00, 20.00, 15.00, 0.00, 7, NULL),
(78, 31, 'loose', 1, 1.00, 100.00, 0.00, 1.00, 6, NULL),
(79, 32, 'packet', 1, 1.00, 200.00, 0.00, 0.00, 7, NULL),
(80, 32, 'packet', 1, 2.00, 300.00, 0.00, 0.00, 7, NULL),
(81, 32, 'packet', 1, 3.00, 300.00, 0.00, 0.00, 7, NULL),
(82, 32, 'packet', 1, 4.00, 400.00, 300.00, 0.00, 7, NULL),
(83, 33, 'loose', 1, 1.00, 10.00, 0.00, 0.00, 1, NULL),
(84, 34, 'loose', 1, 1.00, 10.00, 0.00, 1.00, 7, NULL),
(85, 34, 'loose', 1, 2.00, 20.00, 0.00, 2.00, 7, NULL),
(86, 34, 'loose', 1, 3.00, 30.00, 0.00, 3.00, 7, NULL),
(87, 34, 'loose', 1, 4.00, 40.00, 0.00, 4.00, 7, NULL),
(88, 35, 'packet', 1, 1.00, 30.00, 25.00, 0.00, 1, NULL),
(89, 35, 'packet', 1, 5.00, 150.00, 100.00, 0.00, 1, NULL),
(90, 35, 'packet', 1, 10.00, 300.00, 200.00, 0.00, 1, NULL),
(91, 36, 'packet', 1, 1.00, 200.00, 0.00, 0.00, 5, NULL),
(92, 39, 'loose', 1, 500.00, 10.00, 0.00, 0.00, 2, NULL),
(93, 40, 'loose', 1, 1.00, 10.00, 0.00, 0.00, 1, NULL),
(98, 40, 'loose', 1, 10.00, 100.00, 0.00, 0.00, 1, NULL),
(99, 40, 'loose', 1, 12.00, 120.00, 0.00, 0.00, 1, NULL),
(100, 40, 'loose', 1, 13.00, 130.00, 0.00, 0.00, 1, NULL),
(101, 40, 'loose', 1, 15.00, 150.00, 0.00, 0.00, 1, NULL),
(102, 41, 'loose', 1, 1.00, 20.00, 0.00, 0.00, 1, NULL),
(104, 43, 'loose', 1, 100.00, 28.00, 0.00, 0.00, 2, NULL),
(105, 43, 'loose', 1, 250.00, 70.00, 0.00, 0.00, 2, NULL),
(106, 43, 'loose', 1, 500.00, 85.00, 0.00, 0.00, 2, NULL),
(107, 43, 'loose', 1, 1000.00, 270.00, 0.00, 0.00, 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
