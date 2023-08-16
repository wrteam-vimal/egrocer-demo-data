-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 16, 2023 at 08:40 PM
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `product_rating` tinyint(4) NOT NULL DEFAULT '0',
  `web_image` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '0: Main Category, Other Sub category of id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `row_order`, `name`, `slug`, `subtitle`, `image`, `status`, `product_rating`, `web_image`, `parent_id`, `created_at`, `updated_at`) VALUES
(2, 5, 'Beverages Corner', NULL, 'All Beverages Related Products', 'categories/1668402423_16172.png', 1, 0, '', 0, '2022-11-14 05:07:03', '2023-07-10 08:34:42'),
(3, 1, 'Dairy & Bakery', NULL, 'All Dairy & Bakery Related Products', 'categories/1689570040_58940.png', 1, 0, '', 0, '2022-11-14 05:07:23', '2023-07-17 05:00:40'),
(4, 2, 'Fruits', NULL, 'All Fruits Products', 'categories/1668402472_59116.png', 1, 0, '', 0, '2022-11-14 05:07:52', '2023-07-10 10:13:34'),
(5, 6, 'Snacks Corner', NULL, 'All Snacks Related Products', 'categories/1668402497_28184.png', 1, 0, '', 0, '2022-11-14 05:08:17', '2023-07-10 08:34:42'),
(6, 3, 'Vegetable', NULL, 'All Vegetable Related Products', 'categories/1668402531_15863.png', 1, 0, '', 0, '2022-11-14 05:08:51', '2023-07-10 10:13:34'),
(7, 9, 'Food Grains, Oil, Masalas', NULL, 'All Food Grains, Oil, Masalas Related Products', 'categories/1668411619_41546.png', 1, 0, '', 0, '2022-11-14 05:10:11', '2023-07-10 08:34:42'),
(16, 8, 'Masalas', NULL, 'All Spices', 'categories/1688791077_58255.png', 1, 0, '', 7, '2023-01-02 04:58:06', '2023-07-10 08:34:42'),
(23, 7, 'Grains', NULL, 'All Food Grains', 'categories/1688791321_56969.png', 1, 0, '', 7, '2023-02-10 09:56:16', '2023-07-10 08:34:42'),
(61, 4, 'Oil', NULL, 'All Oil Related Products', 'categories/1688794158_31818.png', 1, 0, '', 7, '2023-07-08 05:29:18', '2023-07-10 08:34:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
