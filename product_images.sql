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
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `product_variant_id`, `image`) VALUES
(1, 1, 0, 'products/1668408925_32446.jpg'),
(2, 1, 0, 'products/1668408925_26726.jpg'),
(3, 2, 0, 'products/1668409329_39343.jpg'),
(4, 3, 0, 'products/1668409622_24663.jpg'),
(5, 3, 0, 'products/1668409622_58393.jpg'),
(6, 3, 0, 'products/1668409622_56385.jpg'),
(7, 4, 0, 'products/1668410229_82996.jpg'),
(8, 4, 0, 'products/1668410229_61559.jpg'),
(9, 4, 0, 'products/1668410229_37728.jpg'),
(10, 5, 0, 'products/1668411024_73455.jpg'),
(11, 5, 0, 'products/1668411024_82246.jpg'),
(12, 5, 0, 'products/1668411024_90967.jpg'),
(21, 10, 0, 'products/1668411385_51040.jpg'),
(22, 10, 0, 'products/1668411385_5088.jpg'),
(23, 11, 0, 'products/1668412503_84089.jpg'),
(24, 11, 0, 'products/1668412503_86648.jpg'),
(25, 12, 0, 'products/1668412674_39912.jpg'),
(26, 12, 0, 'products/1668412674_33052.jpg'),
(27, 13, 0, 'products/1668412824_99719.jpg'),
(28, 13, 0, 'products/1668412824_10455.jpg'),
(29, 14, 0, 'products/1668413022_14251.jpg'),
(30, 14, 0, 'products/1668413022_8249.jpg'),
(31, 15, 0, 'products/1668413139_22399.jpg'),
(32, 15, 0, 'products/1668413139_79390.jpg'),
(33, 15, 0, 'products/1668413139_32969.jpg'),
(34, 16, 0, 'products/1668413520_70862.jpg'),
(35, 16, 0, 'products/1668413520_54704.jpg'),
(36, 17, 0, 'products/1668413703_85629.jpg'),
(37, 18, 0, 'products/1668413807_7580.jpg'),
(38, 19, 0, 'products/1668413922_98630.jpg'),
(39, 19, 0, 'products/1668413922_8625.jpg'),
(40, 19, 0, 'products/1668413922_76198.jpg'),
(41, 20, 0, 'products/1668414086_6150.jpg'),
(42, 20, 0, 'products/1668414086_70555.jpg'),
(43, 20, 0, 'products/1668414086_23465.jpg'),
(44, 21, 0, 'products/1668414302_35039.jpg'),
(45, 21, 0, 'products/1668414302_51269.jpg'),
(46, 21, 0, 'products/1668414302_83115.jpg'),
(47, 22, 0, 'products/1668414408_69060.jpg'),
(48, 22, 0, 'products/1668414408_29161.jpg'),
(49, 22, 0, 'products/1668414408_52959.jpg'),
(50, 23, 0, 'products/1668415779_59560.jpg'),
(51, 23, 0, 'products/1668415779_56633.jpg'),
(52, 24, 0, 'products/1668416070_41226.jpg'),
(53, 24, 0, 'products/1668416070_21279.jpg'),
(54, 24, 0, 'products/1668416070_36587.jpg'),
(55, 25, 0, 'products/1668416327_43906.jpg'),
(56, 25, 0, 'products/1668416327_94996.jpg'),
(57, 25, 0, 'products/1668416327_46378.jpg'),
(58, 26, 0, 'products/1668416727_23996.jpg'),
(59, 27, 0, 'products/1668416965_28688.jpg'),
(60, 27, 0, 'products/1668416965_33500.jpg'),
(61, 27, 0, 'products/1668416965_71542.jpg'),
(62, 28, 0, 'products/1668417338_51901.jpg'),
(63, 28, 0, 'products/1668417338_6360.jpg'),
(64, 29, 0, 'products/1668419457_77739.jpg'),
(65, 29, 0, 'products/1668419457_86840.jpg'),
(66, 29, 0, 'products/1668419457_83040.jpg'),
(67, 30, 0, 'products/1668419636_68200.jpg'),
(68, 30, 0, 'products/1668419636_42262.jpg'),
(69, 30, 0, 'products/1668419636_91257.jpg'),
(70, 31, 0, 'products/1668419758_33589.jpg'),
(71, 31, 0, 'products/1668419758_21662.jpg'),
(72, 31, 0, 'products/1668419758_51679.jpg'),
(73, 32, 0, 'products/1668420202_44889.jpg'),
(74, 32, 0, 'products/1668420202_63109.jpg'),
(75, 32, 0, 'products/1668420202_47677.jpg'),
(76, 33, 0, 'products/1668420296_4639.jpg'),
(77, 33, 0, 'products/1668420296_88344.jpg'),
(78, 33, 0, 'products/1668420296_3893.jpg'),
(79, 34, 0, 'products/1668420408_44350.jpg'),
(80, 34, 0, 'products/1668420408_87136.jpg'),
(81, 34, 0, 'products/1668420408_98187.jpg'),
(82, 35, 0, 'products/1668420533_70307.jpg'),
(83, 35, 0, 'products/1668420533_3119.jpg'),
(84, 35, 0, 'products/1668420533_25578.jpg'),
(85, 36, 0, 'products/1668420617_31330.jpg'),
(86, 36, 0, 'products/1668420617_24806.jpg'),
(87, 36, 0, 'products/1668420617_7587.jpg'),
(92, 39, 0, 'products/1668420739_11097.jpg'),
(93, 39, 0, 'products/1668420739_93030.jpg'),
(94, 40, 0, 'products/1668420989_22692.jpg'),
(95, 40, 0, 'products/1668420989_75396.jpg'),
(96, 40, 0, 'products/1668420989_57653.jpg'),
(97, 41, 0, 'products/1668421529_58473.jpg'),
(98, 41, 0, 'products/1668421529_19312.jpg'),
(99, 44, 0, 'products/1669908285_2582.png'),
(106, 51, 0, 'products/1670155382_37137.jpg'),
(108, 53, 111, 'products/1676177524_42144.png'),
(109, 53, 112, 'products/1676177524_42586.png'),
(110, 54, 113, 'products/1676180641_39863.jpg'),
(111, 56, 115, 'products/1677056697_75338.webp'),
(112, 57, 0, 'products/1678031671_11052.jpeg'),
(113, 57, 0, 'products/1678031671_22232.jpg'),
(114, 57, 0, 'products/1678031671_67487.jpg'),
(115, 57, 0, 'products/1678031671_4976.jpg'),
(116, 59, 0, 'products/1682412582_37658.jpeg'),
(117, 61, 0, 'products/1688028713_82109.png'),
(118, 61, 0, 'products/1688028713_66566.jpg'),
(119, 61, 0, 'products/1688028713_29083.png'),
(120, 61, 0, 'products/1688028713_20736.jpg'),
(121, 61, 0, 'products/1688028713_40170.jpg'),
(124, 62, 0, 'products/1688029156_12542.png'),
(125, 62, 0, 'products/1688029156_89068.png'),
(126, 62, 0, 'products/1688029156_21674.png'),
(130, 63, 0, 'products/1688473176_56511.png'),
(131, 63, 127, 'products/1688473176_22409.png'),
(132, 64, 0, 'products/1688541880_74766.jpg'),
(133, 64, 128, 'products/1688541880_99096.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
