-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 24, 2023 at 01:28 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u863526903_egrocer`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` text NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `forgot_password_code` varchar(191) DEFAULT NULL,
  `fcm_id` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 => Active, 0 => Inactive',
  `login_at` timestamp NULL DEFAULT NULL,
  `last_active_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `role_id`, `created_by`, `forgot_password_code`, `fcm_id`, `remember_token`, `status`, `login_at`, `last_active_at`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin@gmail.com', '$2y$10$iZAqK4QU63u1U8zK5hNKrOL50FRae7uyCvNlY2cEqrHvr7kVJp8Bm', 1, 1, NULL, NULL, 'dJmAv9QnwDct6vvk0dV0lVBV6t9Ho4TkcSckawwnd5mPKyfdjxJDWxM5SSF2', 1, NULL, NULL, '2023-02-15 13:54:18', '2023-07-12 00:25:03'),
(4, '123213', '123123@gmail.com', '$2y$10$3v26zk6Hcg6V95Nyu8pXbO7vVUteJE45oHRYdEdoB2HZOUU1ESDZa', 4, 1, NULL, NULL, NULL, 1, NULL, NULL, '2023-07-25 06:40:23', '2023-08-24 13:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `admin_tokens`
--

CREATE TABLE `admin_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `fcm_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_tokens`
--

INSERT INTO `admin_tokens` (`id`, `user_id`, `type`, `fcm_token`) VALUES
(1, 1, 'Super Admin', 'eVuxFyWTNwgXgO9N5Wkbad:APA91bGEUjY_s51fhv6BG7bXZtDxQpsFnOJ51Cs7WOtcIqkiSPpBgVLOZ7UdSwM9NJ_5uybr-puA74Tz3_l-mhrmYmCNOw66QFwg8mMVGEe1iVoZYwkfi0B23ztdHPCFms-BPkhMbRMf'),
(2, 1, 'Super Admin', 'dgvYR70ozsg8BEeLrL6laO:APA91bEcmRITe0P8HgZxZyM9kginer97FcW28m4tHavP-37JpP6ucM3Jv3Cv_jjDCEybg11_mRK0GXJCCWwyi5Mr94Y3hUHp8iRb1HE5rwyw6lk1otyy8MOJ47JFtX8hmWhjufPKS6Gz'),
(3, 1, 'Super Admin', 'd2eVfG1jreMQkyxGyA2G97:APA91bErVB6fkv-pcMBYKwLaj-xMooYFvz2TtYFwdwhSD57GDwi9q_BTS4s6hqd1sgRKWyh_09ORHu5XOGr1uhM7EKmzRrTNfkHNEJ5XNbOaogqstnX-gOYXu-PPV704dxffnhuXnwUF');

-- --------------------------------------------------------

--
-- Table structure for table `app_usages`
--

CREATE TABLE `app_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `device_type` varchar(191) NOT NULL,
  `app_version` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `minimum_free_delivery_order_amount` int(11) NOT NULL DEFAULT 0,
  `delivery_charges` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(4, 'WRTeam Brand', 'brand/1690347917_59195.png', '1', '2023-06-14 15:26:35', '2023-07-26 05:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `save_for_later` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `product_variant_id`, `qty`, `save_for_later`, `created_at`, `updated_at`) VALUES
(15, 1, 3, 13, 1, 0, NULL, NULL),
(16, 1, 3, 14, 1, 0, NULL, NULL),
(17, 1, 3, 15, 1, 0, NULL, NULL),
(18, 1, 3, 16, 2, 0, NULL, '2023-08-24 10:19:11'),
(19, 1, 4, 17, 10, 0, NULL, '2023-08-24 12:04:20'),
(21, 1, 10, 29, 1, 0, NULL, NULL),
(24, 1, 28, 75, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL DEFAULT '0',
  `slug` varchar(191) DEFAULT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `product_rating` tinyint(4) NOT NULL DEFAULT 0,
  `web_image` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '0: Main Category, Other Sub category of id',
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

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `formatted_address` varchar(191) NOT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `min_amount_for_free_delivery` varchar(191) DEFAULT NULL,
  `delivery_charge_method` varchar(191) DEFAULT NULL,
  `fixed_charge` int(11) NOT NULL DEFAULT 0,
  `per_km_charge` int(11) NOT NULL DEFAULT 0,
  `range_wise_charges` text DEFAULT NULL,
  `time_to_travel` int(11) NOT NULL DEFAULT 0,
  `geolocation_type` varchar(191) DEFAULT NULL,
  `radius` varchar(191) DEFAULT '0',
  `boundary_points` text DEFAULT NULL,
  `max_deliverable_distance` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state`, `formatted_address`, `latitude`, `longitude`, `min_amount_for_free_delivery`, `delivery_charge_method`, `fixed_charge`, `per_km_charge`, `range_wise_charges`, `time_to_travel`, `geolocation_type`, `radius`, `boundary_points`, `max_deliverable_distance`) VALUES
(31, 'Bhuj', 'Gujarat', 'Bhuj, Gujarat, India', '23.2419997', '69.6669324', '40', 'fixed_charge', 100, 0, '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 5, NULL, '0', NULL, 60);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `dial_code` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `dial_code`, `code`) VALUES
(1, 'Afghanistan', '+93', 'AF'),
(2, 'Aland Islands', '+358', 'AX'),
(3, 'Albania', '+355', 'AL'),
(4, 'Algeria', '+213', 'DZ'),
(5, 'AmericanSamoa', '+1684', 'AS'),
(6, 'Andorra', '+376', 'AD'),
(7, 'Angola', '+244', 'AO'),
(8, 'Anguilla', '+1264', 'AI'),
(9, 'Antarctica', '+672', 'AQ'),
(10, 'Antigua and Barbuda', '+1268', 'AG'),
(11, 'Argentina', '+54', 'AR'),
(12, 'Armenia', '+374', 'AM'),
(13, 'Aruba', '+297', 'AW'),
(14, 'Australia', '+61', 'AU'),
(15, 'Austria', '+43', 'AT'),
(16, 'Azerbaijan', '+994', 'AZ'),
(17, 'Bahamas', '+1242', 'BS'),
(18, 'Bahrain', '+973', 'BH'),
(19, 'Bangladesh', '+880', 'BD'),
(20, 'Barbados', '+1246', 'BB'),
(21, 'Belarus', '+375', 'BY'),
(22, 'Belgium', '+32', 'BE'),
(23, 'Belize', '+501', 'BZ'),
(24, 'Benin', '+229', 'BJ'),
(25, 'Bermuda', '+1441', 'BM'),
(26, 'Bhutan', '+975', 'BT'),
(27, 'Bolivia, Plurinational State of', '+591', 'BO'),
(28, 'Bosnia and Herzegovina', '+387', 'BA'),
(29, 'Botswana', '+267', 'BW'),
(30, 'Brazil', '+55', 'BR'),
(31, 'British Indian Ocean Territory', '+246', 'IO'),
(32, 'Brunei Darussalam', '+673', 'BN'),
(33, 'Bulgaria', '+359', 'BG'),
(34, 'Burkina Faso', '+226', 'BF'),
(35, 'Burundi', '+257', 'BI'),
(36, 'Cambodia', '+855', 'KH'),
(37, 'Cameroon', '+237', 'CM'),
(38, 'Canada', '+1', 'CA'),
(39, 'Cape Verde', '+238', 'CV'),
(40, 'Cayman Islands', '+345', 'KY'),
(41, 'Central African Republic', '+236', 'CF'),
(42, 'Chad', '+235', 'TD'),
(43, 'Chile', '+56', 'CL'),
(44, 'China', '+86', 'CN'),
(45, 'Christmas Island', '+61', 'CX'),
(46, 'Cocos (Keeling) Islands', '+61', 'CC'),
(47, 'Colombia', '+57', 'CO'),
(48, 'Comoros', '+269', 'KM'),
(49, 'Congo', '+242', 'CG'),
(50, 'Congo, The Democratic Republic of the Congo', '+243', 'CD'),
(51, 'Cook Islands', '+682', 'CK'),
(52, 'Costa Rica', '+506', 'CR'),
(53, 'Cote d\'Ivoire', '+225', 'CI'),
(54, 'Croatia', '+385', 'HR'),
(55, 'Cuba', '+53', 'CU'),
(56, 'Cyprus', '+357', 'CY'),
(57, 'Czech Republic', '+420', 'CZ'),
(58, 'Denmark', '+45', 'DK'),
(59, 'Djibouti', '+253', 'DJ'),
(60, 'Dominica', '+1767', 'DM'),
(61, 'Dominican Republic', '+1849', 'DO'),
(62, 'Ecuador', '+593', 'EC'),
(63, 'Egypt', '+20', 'EG'),
(64, 'El Salvador', '+503', 'SV'),
(65, 'Equatorial Guinea', '+240', 'GQ'),
(66, 'Eritrea', '+291', 'ER'),
(67, 'Estonia', '+372', 'EE'),
(68, 'Ethiopia', '+251', 'ET'),
(69, 'Falkland Islands (Malvinas)', '+500', 'FK'),
(70, 'Faroe Islands', '+298', 'FO'),
(71, 'Fiji', '+679', 'FJ'),
(72, 'Finland', '+358', 'FI'),
(73, 'France', '+33', 'FR'),
(74, 'French Guiana', '+594', 'GF'),
(75, 'French Polynesia', '+689', 'PF'),
(76, 'Gabon', '+241', 'GA'),
(77, 'Gambia', '+220', 'GM'),
(78, 'Georgia', '+995', 'GE'),
(79, 'Germany', '+49', 'DE'),
(80, 'Ghana', '+233', 'GH'),
(81, 'Gibraltar', '+350', 'GI'),
(82, 'Greece', '+30', 'GR'),
(83, 'Greenland', '+299', 'GL'),
(84, 'Grenada', '+1473', 'GD'),
(85, 'Guadeloupe', '+590', 'GP'),
(86, 'Guam', '+1671', 'GU'),
(87, 'Guatemala', '+502', 'GT'),
(88, 'Guernsey', '+44', 'GG'),
(89, 'Guinea', '+224', 'GN'),
(90, 'Guinea-Bissau', '+245', 'GW'),
(91, 'Guyana', '+595', 'GY'),
(92, 'Haiti', '+509', 'HT'),
(93, 'Holy See (Vatican City State)', '+379', 'VA'),
(94, 'Honduras', '+504', 'HN'),
(95, 'Hong Kong', '+852', 'HK'),
(96, 'Hungary', '+36', 'HU'),
(97, 'Iceland', '+354', 'IS'),
(98, 'India', '+91', 'IN'),
(99, 'Indonesia', '+62', 'ID'),
(100, 'Iran, Islamic Republic of Persian Gulf', '+98', 'IR'),
(101, 'Iraq', '+964', 'IQ'),
(102, 'Ireland', '+353', 'IE'),
(103, 'Isle of Man', '+44', 'IM'),
(104, 'Israel', '+972', 'IL'),
(105, 'Italy', '+39', 'IT'),
(106, 'Jamaica', '+1876', 'JM'),
(107, 'Japan', '+81', 'JP'),
(108, 'Jersey', '+44', 'JE'),
(109, 'Jordan', '+962', 'JO'),
(110, 'Kazakhstan', '+77', 'KZ'),
(111, 'Kenya', '+254', 'KE'),
(112, 'Kiribati', '+686', 'KI'),
(113, 'Korea, Democratic People\'s Republic of Korea', '+850', 'KP'),
(114, 'Korea, Republic of South Korea', '+82', 'KR'),
(115, 'Kuwait', '+965', 'KW'),
(116, 'Kyrgyzstan', '+996', 'KG'),
(117, 'Laos', '+856', 'LA'),
(118, 'Latvia', '+371', 'LV'),
(119, 'Lebanon', '+961', 'LB'),
(120, 'Lesotho', '+266', 'LS'),
(121, 'Liberia', '+231', 'LR'),
(122, 'Libyan Arab Jamahiriya', '+218', 'LY'),
(123, 'Liechtenstein', '+423', 'LI'),
(124, 'Lithuania', '+370', 'LT'),
(125, 'Luxembourg', '+352', 'LU'),
(126, 'Macao', '+853', 'MO'),
(127, 'Macedonia', '+389', 'MK'),
(128, 'Madagascar', '+261', 'MG'),
(129, 'Malawi', '+265', 'MW'),
(130, 'Malaysia', '+60', 'MY'),
(131, 'Maldives', '+960', 'MV'),
(132, 'Mali', '+223', 'ML'),
(133, 'Malta', '+356', 'MT'),
(134, 'Marshall Islands', '+692', 'MH'),
(135, 'Martinique', '+596', 'MQ'),
(136, 'Mauritania', '+222', 'MR'),
(137, 'Mauritius', '+230', 'MU'),
(138, 'Mayotte', '+262', 'YT'),
(139, 'Mexico', '+52', 'MX'),
(140, 'Micronesia, Federated States of Micronesia', '+691', 'FM'),
(141, 'Moldova', '+373', 'MD'),
(142, 'Monaco', '+377', 'MC'),
(143, 'Mongolia', '+976', 'MN'),
(144, 'Montenegro', '+382', 'ME'),
(145, 'Montserrat', '+1664', 'MS'),
(146, 'Morocco', '+212', 'MA'),
(147, 'Mozambique', '+258', 'MZ'),
(148, 'Myanmar', '+95', 'MM'),
(149, 'Namibia', '+264', 'NA'),
(150, 'Nauru', '+674', 'NR'),
(151, 'Nepal', '+977', 'NP'),
(152, 'Netherlands', '+31', 'NL'),
(153, 'Netherlands Antilles', '+599', 'AN'),
(154, 'New Caledonia', '+687', 'NC'),
(155, 'New Zealand', '+64', 'NZ'),
(156, 'Nicaragua', '+505', 'NI'),
(157, 'Niger', '+227', 'NE'),
(158, 'Nigeria', '+234', 'NG'),
(159, 'Niue', '+683', 'NU'),
(160, 'Norfolk Island', '+672', 'NF'),
(161, 'Northern Mariana Islands', '+1670', 'MP'),
(162, 'Norway', '+47', 'NO'),
(163, 'Oman', '+968', 'OM'),
(164, 'Pakistan', '+92', 'PK'),
(165, 'Palau', '+680', 'PW'),
(166, 'Palestinian Territory, Occupied', '+970', 'PS'),
(167, 'Panama', '+507', 'PA'),
(168, 'Papua New Guinea', '+675', 'PG'),
(169, 'Paraguay', '+595', 'PY'),
(170, 'Peru', '+51', 'PE'),
(171, 'Philippines', '+63', 'PH'),
(172, 'Pitcairn', '+872', 'PN'),
(173, 'Poland', '+48', 'PL'),
(174, 'Portugal', '+351', 'PT'),
(175, 'Puerto Rico', '+1939', 'PR'),
(176, 'Qatar', '+974', 'QA'),
(177, 'Romania', '+40', 'RO'),
(178, 'Russia', '+7', 'RU'),
(179, 'Rwanda', '+250', 'RW'),
(180, 'Reunion', '+262', 'RE'),
(181, 'Saint Barthelemy', '+590', 'BL'),
(182, 'Saint Helena, Ascension and Tristan Da Cunha', '+290', 'SH'),
(183, 'Saint Kitts and Nevis', '+1869', 'KN'),
(184, 'Saint Lucia', '+1758', 'LC'),
(185, 'Saint Martin', '+590', 'MF'),
(186, 'Saint Pierre and Miquelon', '+508', 'PM'),
(187, 'Saint Vincent and the Grenadines', '+1784', 'VC'),
(188, 'Samoa', '+685', 'WS'),
(189, 'San Marino', '+378', 'SM'),
(190, 'Sao Tome and Principe', '+239', 'ST'),
(191, 'Saudi Arabia', '+966', 'SA'),
(192, 'Senegal', '+221', 'SN'),
(193, 'Serbia', '+381', 'RS'),
(194, 'Seychelles', '+248', 'SC'),
(195, 'Sierra Leone', '+232', 'SL'),
(196, 'Singapore', '+65', 'SG'),
(197, 'Slovakia', '+421', 'SK'),
(198, 'Slovenia', '+386', 'SI'),
(199, 'Solomon Islands', '+677', 'SB'),
(200, 'Somalia', '+252', 'SO'),
(201, 'South Africa', '+27', 'ZA'),
(202, 'South Sudan', '+211', 'SS'),
(203, 'South Georgia and the South Sandwich Islands', '+500', 'GS'),
(204, 'Spain', '+34', 'ES'),
(205, 'Sri Lanka', '+94', 'LK'),
(206, 'Sudan', '+249', 'SD'),
(207, 'Suriname', '+597', 'SR'),
(208, 'Svalbard and Jan Mayen', '+47', 'SJ'),
(209, 'Swaziland', '+268', 'SZ'),
(210, 'Sweden', '+46', 'SE'),
(211, 'Switzerland', '+41', 'CH'),
(212, 'Syrian Arab Republic', '+963', 'SY'),
(213, 'Taiwan', '+886', 'TW'),
(214, 'Tajikistan', '+992', 'TJ'),
(215, 'Tanzania, United Republic of Tanzania', '+255', 'TZ'),
(216, 'Thailand', '+66', 'TH'),
(217, 'Timor-Leste', '+670', 'TL'),
(218, 'Togo', '+228', 'TG'),
(219, 'Tokelau', '+690', 'TK'),
(220, 'Tonga', '+676', 'TO'),
(221, 'Trinidad and Tobago', '+1868', 'TT'),
(222, 'Tunisia', '+216', 'TN'),
(223, 'Turkey', '+90', 'TR'),
(224, 'Turkmenistan', '+993', 'TM'),
(225, 'Turks and Caicos Islands', '+1649', 'TC'),
(226, 'Tuvalu', '+688', 'TV'),
(227, 'Uganda', '+256', 'UG'),
(228, 'Ukraine', '+380', 'UA'),
(229, 'United Arab Emirates', '+971', 'AE'),
(230, 'United Kingdom', '+44', 'GB'),
(231, 'United States', '+1', 'US'),
(232, 'Uruguay', '+598', 'UY'),
(233, 'Uzbekistan', '+998', 'UZ'),
(234, 'Vanuatu', '+678', 'VU'),
(235, 'Venezuela, Bolivarian Republic of Venezuela', '+58', 'VE'),
(236, 'Vietnam', '+84', 'VN'),
(237, 'Virgin Islands, British', '+1284', 'VG'),
(238, 'Virgin Islands, U.S.', '+1340', 'VI'),
(239, 'Wallis and Futuna', '+681', 'WF'),
(240, 'Yemen', '+967', 'YE'),
(241, 'Zambia', '+260', 'ZM'),
(242, 'Zimbabwe', '+263', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `order_note` text DEFAULT NULL,
  `address` text NOT NULL,
  `bonus_type` int(11) DEFAULT 0 COMMENT '0 -> fixed/Salaried, 1 -> Commission',
  `bonus_percentage` double DEFAULT 0,
  `bonus_min_amount` double DEFAULT 0,
  `bonus_max_amount` double DEFAULT 0,
  `balance` double DEFAULT 0,
  `driving_license` text DEFAULT NULL,
  `national_identity_card` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bank_account_number` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `ifsc_code` text DEFAULT NULL,
  `other_payment_information` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_available` tinyint(4) NOT NULL DEFAULT 1,
  `fcm_id` varchar(191) DEFAULT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `cash_received` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_boys`
--

INSERT INTO `delivery_boys` (`id`, `admin_id`, `city_id`, `name`, `mobile`, `order_note`, `address`, `bonus_type`, `bonus_percentage`, `bonus_min_amount`, `bonus_max_amount`, `balance`, `driving_license`, `national_identity_card`, `dob`, `bank_account_number`, `bank_name`, `account_name`, `ifsc_code`, `other_payment_information`, `status`, `is_available`, `fcm_id`, `pincode_id`, `cash_received`, `created_at`, `updated_at`, `remark`) VALUES
(1, 4, 31, '123213', '3543546', NULL, '11', 0, 0, 0, 0, 0, 'delivery_boy/driving_license/1690295349_37544.png', 'delivery_boy/national_identity_card/1690295349_99104.png', '2023-07-14', '11', '11', '11', '11', '11', 1, 1, NULL, NULL, 0, '2023-07-25 08:59:09', '2023-08-24 13:21:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_notifications`
--

CREATE TABLE `delivery_boy_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `type` varchar(191) NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_transactions`
--

CREATE TABLE `delivery_boy_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `status` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fcm_id` varchar(191) NOT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` char(191) DEFAULT '1',
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '2023-08-24 05:09:06', '2023-08-24 05:09:06'),
(5, 1, 5, '2023-08-24 05:09:08', '2023-08-24 05:09:08'),
(7, 1, 4, '2023-08-24 09:42:49', '2023-08-24 09:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL COMMENT 'credit | debit',
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `order_date` datetime NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `order_list` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `discount` varchar(191) NOT NULL,
  `total_sale` varchar(191) NOT NULL,
  `shipping_charge` varchar(191) NOT NULL,
  `payment` text NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supported_language_id` int(11) DEFAULT 0,
  `system_type` int(11) NOT NULL COMMENT '1 => Customer App, 2 => Seller and delivery boy App, 3 => Website, 4 => Admin panel',
  `json_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_data`)),
  `is_default` int(11) DEFAULT 0 COMMENT '0 => No, 1 => Yes',
  `status` int(11) DEFAULT 1 COMMENT '0 => Deactive, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `supported_language_id`, `system_type`, `json_data`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 16, 3, '{\"Ok\":\"OK\",\"by\":\"By\",\"id\":\"ID\",\"no\":\"No\",\"or\":\"or\",\"all\":\"All\",\"and\":\"and\",\"faq\":\"FAQs\",\"yes\":\"Yes\",\"Item\":\"Item\",\"Oops\":\"Oops!\",\"area\":\"Area\",\"cart\":\"Cart\",\"city\":\"City\",\"date\":\"Date\",\"home\":\"Home\",\"name\":\"Name\",\"shop\":\"Shop\",\"unit\":\"Unit\",\"Paytm\":\"Paytm\",\"apply\":\"Apply\",\"brand\":\"Brand\",\"email\":\"Email\",\"login\":\"Login\",\"order\":\"Order\",\"price\":\"Price\",\"saved\":\"Saved\",\"share\":\"Share\",\"total\":\"Total\",\"NotNow\":\"Not Now\",\"Paypal\":\"Paypal\",\"action\":\"Action\",\"amount\":\"Amount\",\"cancel\":\"Cancel\",\"coupon\":\"Coupon\",\"delete\":\"Remove\",\"filter\":\"Filter\",\"logout\":\"Logout\",\"mobile\":\"Mobile :\",\"remove\":\"Remove\",\"return\":\"Return\",\"search\":\"Search\",\"sortBy\":\"Sort By\",\"status\":\"Status\",\"stripe\":\"Stripe \",\"update\":\"Update\",\"Invoice\":\"Invoice\",\"address\":\"Address\",\"applied\":\"Applied\",\"company\":\"Company\",\"confirm\":\"Confirm\",\"product\":\"Product\",\"profile\":\"My Profile\",\"see_all\":\"View All\",\"shop_by\":\"Shop by\",\"welcome\":\"Welcome!\",\"Settings\":\"Settings\",\"ShowFile\":\"Show File\",\"about_us\":\"About Us\",\"accepted\":\"Accpeted\",\"by_price\":\"By Price\",\"checkout\":\"Checkout\",\"clearAll\":\"Clear All\",\"discount\":\"Discount\",\"gridView\":\"Grid View\",\"listView\":\"List View\",\"no_order\":\"No Orders Found\",\"paystack\":\"Paystack\",\"products\":\"Products\",\"quantity\":\"Quantity\",\"razorpay\":\"Razorpay\",\"register\":\"Register\",\"userName\":\"User Name\",\"wishList\":\"Wishlist\",\"UpdateApp\":\"Update App\",\"follow_us\":\"Follow Us\",\"save_info\":\"Save Info\",\"sub_total\":\"Subtotal\",\"there_are\":\"There are\",\"viewSaved\":\"View Saved\",\"view_cart\":\"View Cart\",\"your_cart\":\"Your Cart\",\"GetInvoice\":\"Get Invoice\",\"TimeUpdate\":\"Time To Update!\",\"all_orders\":\"All Orders\",\"categories\":\"Categories\",\"contact_us\":\"Contact Us\",\"deliver_to\":\"Deliver to\",\"enter_area\":\"Enter Area\",\"enter_city\":\"Enter City\",\"go_to_home\":\"Go To Home Page\",\"my_account\":\"My Account\",\"popularity\":\"Popularity\",\"store_info\":\"Store Info\",\"add_to_cart\":\"Add to Cart\",\"enter_state\":\"Enter State\",\"get_invoice\":\"Get Invoice\",\"have_coupon\":\"Have a Coupon ?\",\"high_to_low\":\"Price - High to Low\",\"low_to_high\":\"Price - Low to High\",\"new_address\":\"New Address\",\"offer_title\":\"One More Offer For You\",\"place_order\":\"Place Order\",\"promo_codes\":\"Promo Codes\",\"tap_to_copy\":\"Tap To Copy\",\"track_order\":\"Track order\",\"view_coupon\":\"View Coupons\",\"address_type\":\"Address Type\",\"edit_profile\":\"Edit Profile\",\"logout_title\":\"Logout!\",\"newest_first\":\"Newest First\",\"notification\":\"Notification\",\"offer_header\":\"Choose One Offer\",\"oldest_first\":\"Oldest First\",\"out_of_stock\":\"Out of stock\",\"prefered_day\":\"Prefered Delivery Day\",\"product_tags\":\"Product Tags\",\"profile_info\":\"Profile Dashboard\",\"profile_note\":\"Note: You have to Update Your Profile For Login Purposes\",\"transactions\":\"Transactions\",\"PaypalPayment\":\"Paypal Payment\",\"alt_mobile_no\":\"Alternate Mobile No\",\"clear_filters\":\"Clear All\",\"enter_country\":\"Enter Country\",\"enter_pincode\":\"Enter PinCode\",\"mobile_number\":\"Mobile Number\",\"order_summary\":\"Order Summary\",\"prefered_time\":\"Prefered Delivery Time\",\"referral_code\":\"Referral Code (optional)\",\"share_product\":\"Share Product\",\"you_will_save\":\"You Will Save\",\"your_wishlist\":\"Your Wishlist\",\"delete_account\":\"Delete Account\",\"enter_landmark\":\"Enter Landmark\",\"login_continue\":\"Login To Continue\",\"logout_message\":\"Are you sure?\\nYou want to logout?\",\"manage_address\":\"Manage Address\",\"no_transaction\":\"No Transaction Found\",\"not_applicable\":\"This Coupon is Not Applicable\",\"on_this_coupon\":\"On This Coupon\",\"page_not_found\":\"Page Not Found\",\"payment_method\":\"Payment Method\",\"privacy_policy\":\"Privacy & Policy\",\"products_found\":\"Products Found\",\"update_profile\":\"Update Profile\",\"add_new_address\":\"Add New Address\",\"address_details\":\"Address Details\",\"billing_details\":\"Billing details\",\"category_footer\":\"Categories\",\"contact_details\":\"Contact Details\",\"delivery_charge\":\"Delivery Charge\",\"enter_user_name\":\"Enter User Name\",\"related_product\":\"Related Products\",\"select_location\":\"Set Delivery Location\",\"shipping_policy\":\"Shipping Policy\",\"adress_type_home\":\"Home\",\"all_notification\":\"All Notifications\",\"cash_on_delivery\":\"Cash On Delivery\",\"confirm_location\":\"Confirm Location\",\"otp_send_message\":\"We have sent a verification code to\",\"product_category\":\"Product Category\",\"product_variants\":\"Product Variants\",\"terms_of_service\":\"Terms of Service\",\"agreement_message\":\"I Agree to the\",\"enter_valid_email\":\"Enter Valid Email Address\",\"tell_us_about_you\":\"Tell us a little about you\",\"address_type_other\":\"Other\",\"downloadAppsFooter\":\"Download Apps\",\"login_enter_number\":\"Enter phone number to continue and we will send a verification code to this number.\",\"product_desc_title\":\"Product Description\",\"unable_to_checkout\":\"Unable to checkout\",\"verify_and_proceed\":\"Verify and Proceed\",\"AppUnderMaintenance\":\"Under Maintenance\",\"address_type_office\":\"Office\",\"cancellation_policy\":\"Cancellation Policy\",\"delete_user_message\":\"Are you sure?\\nYou want to delete account?\\nYou will not undone once delete account!\",\"proceed_to_checkout\":\"Proceed to Checkout\",\"transaction_history\":\"Transaction History\",\"AppUpdateDescription\":\"We added lots of new feature and fix some bugs to make your experience as smooth as possible.\",\"VoiceToSearchProduct\":\"Search by voice\",\"discount_high_to_low\":\"Discount - High to Low\",\"out_of_stock_message\":\"Oops, limited stock available!\",\"product_in_your_cart\":\"product in your cart\",\"terms_and_conditions\":\"Terms & Conditions\",\"FileSavedSuccessfully\":\"File saved successfully!\",\"product_in_your_saved\":\"product in your Wishlist\",\"PaymentCancelledByUser\":\"Payment cancelled by user.\",\"enter_wishlist_message\":\"Your wishlist is Empty\",\"set_as_default_address\":\"Set as a default address\",\"FilterTypesListPackSize\":\"Pack Size\",\"empty_cart_list_message\":\"Your Cart Is Empty\",\"enter_verification_code\":\"Enter Verification Code\",\"preferred_delivery_time\":\"Preferred Delivery Time\",\"use_my_current_location\":\"Use my current location\",\"order_placed_description\":\"Your Order has been successfully placed.\",\"profile_info_description\":\"This is an initial information of you, don\'t worry you can change it anytime.\",\"select_delivery_location\":\"Select Your Delivery Location\",\"enter_wishlist_description\":\"Explore more and shortlist some items.\",\"OopsOrderItemUnableToCancel\":\"Oops!Order item unable to cancel!\",\"empty_cart_list_button_name\":\"Shop Now\",\"empty_cart_list_description\":\"Looking like you haven\'t added anything to your cart yet!\",\"recharge_and_exchange_policy\":\"Returns & Exchanges Policy\",\"enter_text_to_search_products\":\"Enter text to search the products!\",\"OrderItemCancelledSuccessfully\":\"Order item cancelled successfully!\",\"empty_notification_list_message\":\"No Notification\",\"required_login_message_for_cart\":\"Oops! You need to login first to add items into cart!\",\"order_status_display_name_shipped\":\"Shipped\",\"order_status_display_name_recieved\":\"Received\",\"empty_notification_list_description\":\"You have no notification right now come back later.\",\"order_status_display_name_delivered\":\"Delivered\",\"required_login_message_for_wishlist\":\"Oops! You need to login first to add items into wishlist!\",\"required_login_message_for_cartRedirect\":\"Oops! You need to login first to access the cart!\",\"required_login_message_for_notification\":\"Oops! You need to login first to access the Notification!\",\"order_status_display_name_out_for_delivery\":\"Out for Delivery\",\"active_orders\":\"Active Orders\",\"previous_orders\":\"Previous Orders\",\"license_no\":\"License No\",\"items\":\"Items\",\"your_order_has_been\":\"Your order has been\",\"successfully\":\"Successfully\",\"delivery_information\":\"Delivery Information\",\"delivery_to\":\"Delivery To\",\"transaction_id\":\"Transaction Id\",\"order_details\":\"Order Details\"}', 1, 1, '2023-07-21 00:20:36', '2023-08-24 05:30:20'),
(2, 16, 1, '{\"app_name\":\"eGrocer\",\"intro_title_1\":\"Set Your Location\",\"intro_title_2\":\"Make Your Order\",\"intro_title_3\":\"Receive Your Order\",\"intro_description_1\":\"Allow the app to access your current location and choose anything you want from the store\",\"intro_description_2\":\"Put anything you want in the cart and confirm your order successfully\",\"intro_description_3\":\"Congratulations! your order will be at your door as fast as we could\",\"get_started\":\"Get Started\",\"skip_login\":\"Skip Login\",\"login\":\"Login\",\"welcome\":\"Welcome!\",\"login_enter_number_message\":\"Enter phone number to continue and we will send a verification code to this number.\",\"agreement_message_1\":\"I Agree to the\",\"terms_of_service\":\"Terms of Service\",\"privacy_policy\":\"Privacy Policy\",\"policies\":\"Policies\",\"and\":\"and\",\"enter_valid_mobile\":\"Enter Valid Mobile Number\",\"check_internet\":\"Check Internet Connection\",\"something_went_wrong\":\"Something Went Wrong\",\"enter_verification_code\":\"Enter Verification Code\",\"otp_send_message\":\"We have sent a verification code to\",\"verify_and_proceed\":\"Verify and Proceed\",\"did_not_get_code\":\"Didn\'t get the code?\",\"resend_otp\":\"Resend OTP\",\"enter_otp\":\"Enter OTP\",\"enter_valid_otp\":\"Please enter valid OTP\",\"profile_updated_successfully\":\"Profile updated successfully!\",\"profile\":\"Profile\",\"all_orders\":\"All Orders\",\"address\":\"Address\",\"change_theme\":\"Change Theme\",\"change_language\":\"Change Language\",\"select_location\":\"Select Location\",\"product_detail\":\"Product Detail\",\"how_it_works\":\"How it works\",\"notification\":\"Notification\",\"empty_notification_list_message\":\"No Notification\",\"empty_notification_list_description\":\"You have no notification right now come back later.\",\"empty_wish_list_message\":\"Wishlist is Empty\",\"empty_wish_list_description\":\"Create your personalized collection of must-haves !!\",\"empty_product_list_message\":\"Oops!\",\"empty_product_list_description\":\"Products not found\",\"enter_text_to_search_the_products\":\"Enter text to search the products!\",\"does_not_delivery_long_message\":\"We doesn\'t delivery at selected city!\",\"sorry\":\"Sorry!\",\"change_location\":\"Change Location\",\"transaction_history\":\"Transaction History\",\"refer_and_earn\":\"Refer & Earn\",\"contact_us\":\"Contact Us\",\"about_us\":\"About Us\",\"rate_us\":\"Rate Us\",\"share_app\":\"Share App\",\"faq\":\"FAQ\",\"transactions\":\"Transactions\",\"terms_and_conditions\":\"Terms & Conditions\",\"logout\":\"Logout\",\"register\":\"Register\",\"edit_profile\":\"Edit Profile\",\"enter_valid_email\":\"Enter Valid Email Address\",\"user_name\":\"User Name\",\"enter_user_name\":\"Enter User Name\",\"email\":\"Email\",\"mobile_number\":\"Mobile Number\",\"invite_friends_to_signup\":\"Invite to your friend to signup\",\"friends_download_app\":\"Your friend download app\",\"friends_place_first_order\":\"Your friend place first order\",\"you_will_get_reward_after_delivered\":\"After first order delivered, you will get reward\",\"your_referral_code\":\"Your referral code\",\"refer_now\":\"Refer Now\",\"tap_to_copy\":\"Tap To Copy\",\"refer_code_copied\":\"Refer Code Copied to clipboard\",\"profile_info\":\"Profile Info\",\"tell_us_about_you\":\"Tell us a little about you\",\"profile_info_description\":\"This is an initial information of you, don\'t worry you can change it anytime.\",\"referral_code\":\"Referral Code (optional)\",\"save_info\":\"Save Info\",\"unable_to_place_order\":\"Unable to Place Order\",\"place_order\":\"Place Order\",\"addresses\":\"Addresses\",\"add_new_address\":\"Add New Address\",\"select_delivery_location\":\"Select Your Delivery Location\",\"use_my_current_location\":\"Use my current location\",\"or\":\"or\",\"type_location_manually\":\"Type Location Manually\",\"confirm_location\":\"Confirm Location\",\"select_your_location\":\"Select Your Location\",\"change\":\"Change\",\"recent_searches\":\"Recent Searches\",\"recent_searches_clear\":\"Clear\",\"accept_terms_and_condition\":\"Accept Terms & Conditions\",\"address_detail\":\"Address Detail\",\"contact_details\":\"Contact Details\",\"name\":\"Name\",\"enter_name\":\"Enter Name\",\"alternate_mobile_number\":\"Alternate Mobile No\",\"address_details\":\"Address Details\",\"enter_address\":\"Enter Address\",\"landmark\":\"Landmark\",\"enter_landmark\":\"Enter Landmark\",\"city\":\"City\",\"enter_city\":\"Enter City\",\"area\":\"Area\",\"enter_area\":\"Enter Area\",\"pin_code\":\"PinCode\",\"enter_pin_code\":\"Enter PinCode\",\"state\":\"State\",\"enter_state\":\"Enter State\",\"country\":\"Country\",\"enter_country\":\"Enter Country\",\"address_type\":\"Address Type\",\"address_type_home\":\"Home\",\"address_type_office\":\"Office\",\"address_type_other\":\"Other\",\"set_as_default_address\":\"Set as a default address\",\"delivery_to\":\"Deliver to\",\"home_search_hint\":\"What would you buy today?\",\"product_search_hint\":\"Search Products\",\"see_all\":\"View All\",\"shop_by\":\"Shop by\",\"categories\":\"Categories\",\"products\":\"Products\",\"all\":\"All\",\"filter\":\"Filter\",\"sort_by\":\"Sort By\",\"share\":\"Share\",\"wish_list\":\"Wishlist\",\"list_view\":\"List View\",\"grid_view\":\"Grid View\",\"search\":\"Search\",\"search_result_for\":\"Search result for\",\"search_empty_message_title\":\"No result to show\",\"search_empty_message_description\":\"Please check spelling or try different keywords.\",\"return_and_exchanges_policy\":\"Returns & Exchanges Policy\",\"shopping_policy\":\"Shipping Policy\",\"cancellation_policy\":\"Cancellation Policy\",\"go_to_product\":\"Go to product\",\"go_to_category\":\"Go to category\",\"share_app_message\":\"Take a Look at \\n\\neGrocer\\n\\n -\",\"refer_and_earn_share_prefix_message\":\"I have earned money using eGrocer app.\\\\You can also earn money by downloading app from given link\\\\Don\'t forgot to enter referral code while registration -\",\"refer_and_earn_share_display_message_1_prefix\":\"Refer a friend and earn up to\",\"refer_and_earn_share_display_message_1_postfix\":\"when your friend\'s first order is successfully delivered.\",\"refer_and_earn_share_display_message_2\":\"Minimum order amount should be\",\"refer_and_earn_share_display_message_3\":\"Which allows you to earn up to\",\"out_of_stock\":\"Out of stock\",\"go_to_cart\":\"Go to cart\",\"cart\":\"Cart\",\"empty_cart_list_message\":\"Cart is Empty\",\"empty_cart_list_description\":\"It seems like you haven\'t added anything to your cart yet!\",\"empty_cart_list_button_name\":\"Shop Now\",\"cancel\":\"Cancel\",\"orders_history\":\"Orders history\",\"active_orders\":\"Active orders\",\"previous_orders\":\"Previous orders\",\"order\":\"Order\",\"placed_order_on\":\"Placed order on\",\"view_details\":\"View details\",\"total\":\"Total\",\"track_my_order\":\"Track order\",\"order_tracking\":\"Order tracking\",\"order_confirmed\":\"Order confirmed\",\"order_shipped\":\"Order shipped\",\"order_out_for_delivery\":\"Order out for delivery\",\"order_delivered\":\"Order delivered\",\"order_summary\":\"Order summary\",\"items\":\"Items\",\"delivery_information\":\"Delivery information\",\"billing_details\":\"Billing details\",\"payment_method\":\"Payment Method\",\"transaction_id\":\"Transaction id\",\"id\":\"ID\",\"date_and_time\":\"Date & Time\",\"amount\":\"Amount\",\"voice_search_product_message\":\"Hold mic and speak to search\",\"sure_to_cancel_product\":\"Are you sure, you want to cancel this product?\",\"sure_to_return_product\":\"Are you sure, you want to return this product?\",\"sure_to_return_order\":\"Are you sure, you want to return this order?\",\"sure_to_cancel_order\":\"Are you sure, you want to cancel this order?\",\"no\":\"No\",\"yes\":\"Yes\",\"unable_to_return_product\":\"Unable to return product\",\"unable_to_cancel_product\":\"Unable to cancel product\",\"unable_to_return_order\":\"Unable to return order\",\"unable_to_cancel_order\":\"Unable to cancel order\",\"change_coupon\":\"Change Coupon\",\"coupon\":\"Coupon\",\"discount\":\"Discount\",\"coupon_applied\":\"Coupon Applied\",\"you_saved\":\"You Saved\",\"with_this_promo_code\":\"with this promo code\",\"clean_all\":\"Clear All\",\"apply\":\"Apply\",\"subtotal\":\"Subtotal\",\"item\":\"Item\",\"proceed_to_checkout\":\"Proceed to Checkout\",\"apply_discount_code\":\"Apply Discount Code\",\"promo_codes\":\"Promo Codes\",\"applied\":\"Applied\",\"no_address_found_title\":\"No Address Found\",\"no_faq_found_title\":\"No FAQ Found!\",\"no_faq_found_message\":\"Not added any frequently asked questions!\",\"return1\":\"Return\",\"no_address_found_description\":\"You have no any delivery location add delivery address first.\",\"delete_address\":\"Delete Address\",\"please_select_address_from_map\":\"Please select address from map!\",\"checkout\":\"Checkout\",\"delivery_charge\":\"Delivery Charge\",\"seller_wise_delivery_charges_details\":\"Seller wise delivery charges detail\",\"preferred_delivery_time\":\"Preferred Delivery Time\",\"required_login_message_for_cart\":\"Oops! You need to login first to add items into cart!\",\"required_login_message_for_wish_list\":\"Oops! You need to login first to add items into wishlist!\",\"required_login_message_for_cart_redirect\":\"Oops! You need to login first to access the cart!\",\"hide_details\":\"Hide\",\"show_details\":\"Show\",\"maximum_products_quantity_limit_reached_message\":\"Apologies, maximum product quantity limit reached!\",\"out_of_stock_message\":\"Oops, limited stock available!\",\"order_place_message\":\"Order Placed!\",\"order_place_description\":\"Your Order has been successfully placed.\",\"cash_on_delivery\":\"Cash On Delivery\",\"razorpay\":\"Razorpay\",\"paystack\":\"Paystack\",\"stripe\":\"Stripe \",\"by\":\"By\",\"continue_shopping\":\"Continue Shopping\",\"view_all_orders\":\"View All Orders\",\"logout_title\":\"Logout!\",\"logout_message\":\"Are you sure?\\nYou want to logout?\",\"delete_user_account\":\"Delete Account\",\"delete_user_title\":\"Delete account!\",\"delete_user_message\":\"Are you sure?\\nYou want to delete account?\\nYou will not undone once delete account!\",\"ok\":\"OK\",\"voice_to_search_product\":\"Search by voice\",\"home_bottom_menu_home\":\"Home\",\"home_bottom_menu_category\":\"Category\",\"home_bottom_menu_wishlist\":\"Wishlist\",\"home_bottom_menu_profile\":\"Profile\",\"theme_display_names_system_default\":\"System Default\",\"theme_display_names_light\":\"Light\",\"theme_display_names_dark\":\"Dark\",\"week_days_names_sunday\":\"Sun\",\"week_days_names_monday\":\"Mon\",\"week_days_names_tuesday\":\"Tues\",\"week_days_names_wednesday\":\"Wed\",\"week_days_names_thursday\":\"Thu\",\"week_days_names_friday\":\"Fri\",\"week_days_names_saturday\":\"Sat\",\"months_names_january\":\"January\",\"months_names_february\":\"February\",\"months_names_march\":\"March\",\"months_names_april\":\"April\",\"months_names_may\":\"May\",\"months_names_june\":\"June\",\"months_names_july\":\"July\",\"months_names_august\":\"August\",\"months_names_september\":\"September\",\"months_names_october\":\"October\",\"months_names_november\":\"November\",\"months_names_december\":\"December\",\"order_status_display_names_awaiting_payment\":\"Awaiting Payment\",\"order_status_display_names_received\":\"Received\",\"order_status_display_names_processed\":\"Processed\",\"order_status_display_names_shipped\":\"Shipped\",\"order_status_display_names_out_for_delivery\":\"Out for Delivery\",\"order_status_display_names_delivered\":\"Delivered\",\"order_status_display_names_cancelled\":\"Cancelled\",\"order_status_display_names_returned\":\"Returned\",\"sorting_display_list_default\":\"Default\",\"sorting_display_list_newest_first\":\"Newest First\",\"sorting_display_list_oldest_first\":\"Oldest First\",\"sorting_display_list_price_high_to_low\":\"Price - High to Low\",\"sorting_display_list_price_low_to_high\":\"Price - Low to High\",\"sorting_display_list_discount_high_to_low\":\"Discount - High to Low\",\"sorting_display_list_popularity\":\"Popularity\",\"filter_types_list_brand\":\"Brand\",\"filter_types_list_pack_size\":\"Pack Size\",\"filter_types_list_price\":\"Price\",\"settings\":\"Settings\",\"mail\":\"Mail\",\"mobile\":\"Mobile\",\"notifications_settings\":\"Notifications Settings\",\"update\":\"Update\",\"get_Invoice\":\"Get Invoice\",\"oops\":\"Oops!\",\"show_file\":\"Show File\",\"file_saved_successfully\":\"File saved successfully!\",\"invoice\":\"Invoice\",\"paytm\":\"Paytm\",\"app_under_maintenance\":\"Under Maintenance\",\"time_to_update\":\"Time To Update!\",\"app_update_description\":\"We added lots of new feature and fix some bugs to make your experience as smooth as possible.\",\"update_app\":\"Update App\",\"not_now\":\"Not Now\",\"add_to_cart\":\"Add to Cart\",\"paypal_payment\":\"Paypal Payment\",\"paypal\":\"Paypal\",\"payment_cancelled_by_user\":\"Payment cancelled by user.\",\"oops_order_item_cancelled_successfully\":\"Order item cancelled successfully!\",\"oops_order_item_unable_to_cancel\":\"Oops!Order item unable to cancel!\",\"minimum_selected_range\":\"Minimum Selected Range\",\"you_can_not_go_back_until_payment_cancel_or_success\":\"You can not go back until payment cancel or success.\",\"do_not_press_back_while_payment_and_double_tap_back_button_to_exit\":\"Do not press back while payment,Press double tap back button to exit.\",\"fssai_lic_no\":\"Fssai Lic. No:\"}', 1, 1, '2023-07-21 00:22:11', '2023-08-24 05:10:07'),
(3, 3, 1, '{\"app_name\":\"eGrocer \",\"intro_title_1\":\"تحديد المكان الخاص بك \",\"intro_title_2\":\"جعل الطلب الخاص بك \",\"intro_title_3\":\"استلام الطلب الخاص بك \",\"intro_description_1\":\"السماح للتطبيق بالتوصل للمكان الحالي الخاص بك واختيار أي شيء ترغب فيه من المتجر \",\"intro_description_2\":\"قم بوضع أي شيء تريده في عربة التسوق وقم بتأكيد الطلب الخاص بك بنجاح \",\"intro_description_3\":\"تهانينا ، سيكون أمرك عند بابك بأسرع ما يمكن \",\"get_started\":\"الاعداد للبدء \",\"skip_login\":\"تخطي بدء الاتصال \",\"login\":\"بدء الاتصال \",\"welcome\":\"أهلا وسهلا \",\"login_enter_number_message\":\"قم بادخال رقم التليفون للاستمرار وسنقوم بارسال كود تحقق لهذا الرقم. \",\"agreement_message_1\":\"اوافق على \",\"terms_of_service\":\"شروط الخدمة \",\"privacy_policy\":\"سياسة الخصوصية \",\"policies\":\"السياسات \",\"and\":\"و /- \",\"enter_valid_mobile\":\"قم بادخال رقم التليفون المحمول الصحيح \",\"check_internet\":\"التحقق من وصلة الانترنت \",\"something_went_wrong\":\"شيء ما سار خطأ \",\"enter_verification_code\":\"ادخال كود التحقق \",\"otp_send_message\":\"لقد أرسلنا رمز للتحقق إلى \",\"verify_and_proceed\":\"التحقق من والاستمرار \",\"did_not_get_code\":\"ألم تحصل على الرمز ؟ \",\"resend_otp\":\"اعادة تحديد OTP \",\"enter_otp\":\"أدخل OTP \",\"enter_valid_otp\":\"برجاء ادخال OTP صحيح \",\"profile_updated_successfully\":\"تم تعديل ملف المواصفات بنجاح ! \",\"profile\":\"ملف مواصفات \",\"all_orders\":\"كل الطلبات \",\"address\":\"العنوان \",\"change_theme\":\"تغيير النسق الرئيسي \",\"change_language\":\"تغيير اللغة \",\"select_location\":\"اختيار مكان \",\"product_detail\":\"تفاصيل المنتج \",\"how_it_works\":\"كيف يعمل \",\"notification\":\"الاشعار \",\"empty_notification_list_message\":\"لا يوجد اعلام \",\"empty_notification_list_description\":\"لا يوجد لديك اشعار الآن بالعودة في وقت لاحق. \",\"empty_wish_list_message\":\"كشف Whislist خالي \",\"empty_wish_list_description\":\"قم بتكوين المجموعة الشخصية الخاصة بك من hmt-haves ! ! \",\"empty_product_list_message\":\"اوبس ! \",\"empty_product_list_description\":\"المنتجات غير موجودة \",\"enter_text_to_search_the_products\":\"أدخل نص للبحث في المنتجات ! \",\"does_not_delivery_long_message\":\"نحن لا تسليم في مدينة مختارة ! \",\"sorry\":\"! آسف ! \",\"change_location\":\"تغيير المكان \",\"transaction_history\":\"السجل التاريخي للعمليات \",\"refer_and_earn\":\"ارجع & الى Earn \",\"contact_us\":\"اتصل بنا \",\"about_us\":\"نبذة عنا \",\"rate_us\":\"تقييم Us \",\"share_app\":\"مشاركة التطبيق \",\"faq\":\"FAQ \",\"transactions\":\"المعاملات \",\"terms_and_conditions\":\"الشروط والأحكام \",\"logout\":\"انهاء الاتصال \",\"register\":\"تسجيل \",\"edit_profile\":\"تحرير ملف المواصفات \",\"enter_valid_email\":\"أدخل عنوان البريد الالكتروني الصحيح \",\"user_name\":\"اسم المستخدم \",\"enter_user_name\":\"أدخل اسم المستخدم \",\"email\":\"البريد الالكتروني \",\"mobile_number\":\"رقم التليفون المحمول \",\"invite_friends_to_signup\":\"دعوة لصديقك ليتم الاتصال به \",\"friends_download_app\":\"صديقك تحميل التطبيق \",\"friends_place_first_order\":\"صديقك مكان الترتيب الأول \",\"you_will_get_reward_after_delivered\":\"بعد أول طلب تم تسليمه ، سوف تحصل على مكافأة \",\"your_referral_code\":\"كود الإحالة الخاص بك \",\"refer_now\":\"ارجع الآن \",\"tap_to_copy\":\"التصفيق للنسخ \",\"refer_code_copied\":\"ارجع الى الكود الذي تم نسخه في المسودة \",\"profile_info\":\"معلومات ملف المواصفات \",\"tell_us_about_you\":\"أخبرنا قليلا عنك \",\"profile_info_description\":\"هذه معلومات أولية عنك لا تقلق يمكنك تغييرها في أي وقت \",\"referral_code\":\"كود الاحالة (اختياري) \",\"save_info\":\"حفظ معلومات \",\"unable_to_place_order\":\"لا يمكن وضع الطلب \",\"place_order\":\"ترتيب المكان \",\"addresses\":\"العناوين \",\"add_new_address\":\"اضافة عنوان جديد \",\"select_delivery_location\":\"تحديد مكان التسليم الخاص بك \",\"use_my_current_location\":\"استخدام المكان الحالي الخاص بي \",\"or\":\"أو \",\"type_location_manually\":\"نوع المكان يدويا \",\"confirm_location\":\"تأكيد مكان \",\"select_your_location\":\"تحديد المكان الخاص بك \",\"change\":\"التغيير \",\"recent_searches\":\"عمليات البحث الحديثة \",\"recent_searches_clear\":\"محو \",\"accept_terms_and_condition\":\"قبول الشروط & الشروط \",\"address_detail\":\"تفاصيل العنوان \",\"contact_details\":\"تفاصيل جهة الاتصال \",\"name\":\"الاسم \",\"enter_name\":\"أدخل الاسم \",\"alternate_mobile_number\":\"رقم التليفون المحمول البديل \",\"address_details\":\"تفاصيل العنوان \",\"enter_address\":\"أدخل عنوان \",\"landmark\":\"الحدث الرئيسي \",\"enter_landmark\":\"ادخال حدث رئيسي \",\"city\":\"المدينة \",\"enter_city\":\"أدخل المدينة \",\"area\":\"المنطقة \",\"enter_area\":\"ادخال مساحة \",\"pin_code\":\"الكود الخنصر \",\"enter_pin_code\":\"ادخال PinCode \",\"state\":\"الحالة \",\"enter_state\":\"ادخال الحالة \",\"country\":\"البلد \",\"enter_country\":\"قم بادخال البلد \",\"address_type\":\"نوع العنوان \",\"address_type_home\":\"الصفحة الرئيسية \",\"address_type_office\":\"المكتب \",\"address_type_other\":\"مسائل أخرى \",\"set_as_default_address\":\"تحديد كعنوان مفترض \",\"delivery_to\":\"تسليم الى \",\"home_search_hint\":\"ماذا ستشتري اليوم ؟ \",\"product_search_hint\":\"منتجات البحث \",\"see_all\":\"مشاهدة الكل \",\"shop_by\":\"يتم التسوق بواسطة \",\"categories\":\"الفئات \",\"products\":\"المنتجات \",\"all\":\"كل \",\"filter\":\"مرشح البيانات \",\"sort_by\":\"فرز بواسطة \",\"share\":\"مشاركة \",\"wish_list\":\"كشف Wislist \",\"list_view\":\"مشاهدة كشف \",\"grid_view\":\"مشاهدة الشبكة \",\"search\":\"بحث \",\"search_result_for\":\"نتائج البحث الى \",\"search_empty_message_title\":\"لا توجد نتيجة ليتم عرضها \",\"search_empty_message_description\":\"برجاء التحقق من الهجاء أو حاول استخدام كلمات مرشدة مختلفة. \",\"return_and_exchanges_policy\":\"سياسة عمليات الارجاع والارجاع \",\"shopping_policy\":\"سياسة الشحن \",\"cancellation_policy\":\"سياسة الالغاء \",\"go_to_product\":\"اذهب الى المنتج \",\"go_to_category\":\"اذهب الى التصنيف \",\"share_app_message\":\"خذ نظرة على  \\n\\neGrocer- \",\"refer_and_earn_share_prefix_message\":\"حصلت على المال باستخدام تطبيق eGrouser. \\\\ يمكنك أيضا كسب المال من خلال تحميل التطبيق من وصلة محددة \\\\ لا تنسى أن تقوم بادخال كود احالة أثناء التسجيل- \",\"refer_and_earn_share_display_message_1_prefix\":\"يمكنك الرجوع الى صديق والحصول على ما يصل اليه \",\"refer_and_earn_share_display_message_1_postfix\":\"عندما يتم تسليم طلب صديقك الأول بنجاح \",\"refer_and_earn_share_display_message_2\":\"الحد الأدنى لمقدار الطلب يجب أن يكون \",\"refer_and_earn_share_display_message_3\":\"الذي يسمح لك لكسب حتى \",\"out_of_stock\":\"خارج المخزون \",\"go_to_cart\":\"اذهب الى عربة التسوق \",\"cart\":\"عربة \",\"empty_cart_list_message\":\"عربة فارغة \",\"empty_cart_list_description\":\"يبدو أنك لم تضيف أي شيء إلى عربتك بعد \",\"empty_cart_list_button_name\":\"التسوق الآن \",\"cancel\":\"الغاء \",\"orders_history\":\"تاريخ الأوامر \",\"active_orders\":\"الأوامر الفعالة \",\"previous_orders\":\"الأوامر السابقة \",\"order\":\"الترتيب \",\"placed_order_on\":\"الترتيب الذي تم وضعه به \",\"view_details\":\"مشاهدة التفاصيل \",\"total\":\"المجموع \",\"track_my_order\":\"تتبع الترتيب \",\"order_tracking\":\"تتبع الترتيب \",\"order_confirmed\":\"تأكيد الطلب \",\"order_shipped\":\"طلب تم ارساله \",\"order_out_for_delivery\":\"ترتيب للتسليم \",\"order_delivered\":\"تم تسليم الأمر \",\"order_summary\":\"ملخص الطلب \",\"items\":\"البنود \",\"delivery_information\":\"معلومات التسليم \",\"billing_details\":\"تفاصيل الفواتير \",\"payment_method\":\"طريقة السداد \",\"transaction_id\":\"كود المعاملة \",\"id\":\"الكود \",\"date_and_time\":\"تاريخ & وقت \",\"amount\":\"المبلغ \",\"voice_search_product_message\":\"عقد ميكروفون والتحدث للبحث \",\"sure_to_cancel_product\":\"هل أنت متأكد من أنك تريد الغاء هذا المنتج ؟ \",\"sure_to_return_product\":\"هل أنت متأكد من أنك تريد ارجاع هذا المنتج ؟ \",\"sure_to_return_order\":\"هل أنت متأكد من أنك تريد اعادة هذا الطلب ؟ \",\"sure_to_cancel_order\":\"هل أنت متأكد من أنك تريد الغاء هذا الطلب ؟ \",\"no\":\"لا \",\"yes\":\"نعم. \",\"unable_to_return_product\":\"لا يمكن ارجاع المنتج \",\"unable_to_cancel_product\":\"لا يمكن الغاء المنتج \",\"unable_to_return_order\":\"لا يمكن ارجاع الطلب \",\"unable_to_cancel_order\":\"غير قادر على الغاء الطلب \",\"change_coupon\":\"تغيير Coupon \",\"coupon\":\"كوبون \",\"discount\":\"الخصم \",\"coupon_applied\":\"تم تطبيق Coupon \",\"you_saved\":\"لقد أنقذت \",\"with_this_promo_code\":\"بكود البرومو هذا \",\"clean_all\":\"محو كل \",\"apply\":\"تطبيق \",\"subtotal\":\"المجموع الفرعي \",\"item\":\"البند \",\"proceed_to_checkout\":\"الاستمرار الى الدفع \",\"apply_discount_code\":\"تطبيق كود الخصم \",\"promo_codes\":\"أكواد الوعد \",\"applied\":\"تم التطبيق \",\"no_address_found_title\":\"لم يتم ايجاد أي عنوان \",\"no_faq_found_title\":\"لم يتم ايجاد FAQ ! \",\"no_faq_found_message\":\"لم تتم اضافة أي أسئلة يكثر طرحها ! \",\"return1\":\"ارجاع \",\"no_address_found_description\":\"لا يوجد لديك أي مكان تسليم قم باضافة عنوان التسليم أولا. \",\"delete_address\":\"حذف عنوان \",\"please_select_address_from_map\":\"برجاء تحديد عنوان من Map ! \",\"checkout\":\"تسجيل خروج \",\"delivery_charge\":\"تكلفة التسليم \",\"seller_wise_delivery_charges_details\":\"تفاصيل رسوم التسليم الحكيم للراوي \",\"preferred_delivery_time\":\"وقت التسليم المفضل \",\"required_login_message_for_cart\":\"اوبس !  يجب أن تقوم ببدء الاتصال أولا لاضافة بنود الى عربة التسوق ! \",\"required_login_message_for_wish_list\":\"اوبس !  يجب أن تقوم ببدء الاتصال أولا لاضافة بنود الى كشف wislist ! \",\"required_login_message_for_cart_redirect\":\"اوبس !  يجب أن تقوم ببدء الاتصال أولا للتوصل الى عربة التسوق ! \",\"hide_details\":\"اخفاء \",\"show_details\":\"عرض \",\"maximum_products_quantity_limit_reached_message\":\"أعتذر ، تم الوصول الى حد أقصى لكمية المنتج ! \",\"out_of_stock_message\":\"Oops ، عدد محدود المتاح ! \",\"order_place_message\":\"طلب ببلاد ! \",\"order_place_description\":\"تم وضع الطلب الخاص بك بنجاح. \",\"cash_on_delivery\":\"الدفع نقدا عند التسليم \",\"razorpay\":\"Razorالأجر \",\"paystack\":\"كشف الرواتب \",\"stripe\":\"شريط   \",\"by\":\"بواسطة \",\"continue_shopping\":\"الاستمرار بالتسوق \",\"view_all_orders\":\"مشاهدة كل الطلبات \",\"logout_title\":\"انهاء الاتصال ! \",\"logout_message\":\"هل أنت متأكد ؟ \\nهل تريد انهاء الاتصال ؟ \",\"delete_user_account\":\"حذف حساب \",\"delete_user_title\":\"حذف حساب ! \",\"delete_user_message\":\"هل أنت متأكد ؟ \\nهل ترغب في حذف الحساب ؟ \\nلن تقوم بالتراجع مرة واحدة لحذف حساب ! \",\"ok\":\"طيب \",\"voice_to_search_product\":\"بحث بواسطة الصوت \",\"home_bottom_menu_home\":\"الصفحة الرئيسية \",\"home_bottom_menu_category\":\"الفئة \",\"home_bottom_menu_wishlist\":\"كشف Wislist \",\"home_bottom_menu_profile\":\"ملف مواصفات \",\"theme_display_names_system_default\":\"النظام المفترض \",\"theme_display_names_light\":\"خفيف \",\"theme_display_names_dark\":\"ظلام \",\"week_days_names_sunday\":\"شمس \",\"week_days_names_monday\":\"Mon \",\"week_days_names_tuesday\":\"Tues \",\"week_days_names_wednesday\":\"مللت \",\"week_days_names_thursday\":\"الرو \",\"week_days_names_friday\":\"جمعة \",\"week_days_names_saturday\":\"Sat \",\"months_names_january\":\"كانون الثاني / \",\"months_names_february\":\"شباط / فبراير \",\"months_names_march\":\"آذار / مارس \",\"months_names_april\":\"نيسان / أبريل \",\"months_names_may\":\"أيار / مايو \",\"months_names_june\":\"حزيران / يونيه \",\"months_names_july\":\"يوليو \",\"months_names_august\":\"آب / أغسطس \",\"months_names_september\":\"أيلول / سبتمبر \",\"months_names_october\":\"أكتوبر \",\"months_names_november\":\"نوفمبر \",\"months_names_december\":\"ديسمبر \",\"order_status_display_names_awaiting_payment\":\"فى انتظار الدفعات \",\"order_status_display_names_received\":\"استقبل \",\"order_status_display_names_processed\":\"تم تشغيل \",\"order_status_display_names_shipped\":\"تم الشحن \",\"order_status_display_names_out_for_delivery\":\"خارج لتسليم \",\"order_status_display_names_delivered\":\"تم التسليم \",\"order_status_display_names_cancelled\":\"تم الالغاء \",\"order_status_display_names_returned\":\"تم الارجاع \",\"sorting_display_list_default\":\"المفترض \",\"sorting_display_list_newest_first\":\"نغرب أولا \",\"sorting_display_list_oldest_first\":\"أقدم أول \",\"sorting_display_list_price_high_to_low\":\"السعر-عالي الى منخفض \",\"sorting_display_list_price_low_to_high\":\"Price-Low to High \",\"sorting_display_list_discount_high_to_low\":\"الخصم-عالي الى منخفض \",\"sorting_display_list_popularity\":\"شعبية \",\"filter_types_list_brand\":\"العلامة التجارية \",\"filter_types_list_pack_size\":\"حجم الحزمة \",\"filter_types_list_price\":\"السعر \",\"settings\":\"المحددات \",\"mail\":\"البريد \",\"mobile\":\"موبايل \",\"notifications_settings\":\"محددات الاعلامات \",\"update\":\"تعديل \",\"get_Invoice\":\"الحصول على الفاتورة \",\"oops\":\"اوبس ! \",\"show_file\":\"عرض الملف \",\"file_saved_successfully\":\"تم حفظ الملف بنجاح ! \",\"invoice\":\"الفاتورة \",\"paytm\":\"Paytm \",\"app_under_maintenance\":\"تحت الصيانة \",\"time_to_update\":\"الوقت للتعديل ! \",\"app_update_description\":\"أضفنا الكثير من الخصائص الجديدة وقمنا بإصلاح بعض البق لجعل تجربتك سلسة قدر الإمكان. \",\"update_app\":\"تطبيق التعديل \",\"not_now\":\"ليس الآن \",\"add_to_cart\":\"اضافة الى عربة \",\"paypal_payment\":\"دفع PayPAL \",\"paypal\":\"Payal \",\"payment_cancelled_by_user\":\"تم الغاء السداد بواسطة المستخدم. \",\"oops_order_item_cancelled_successfully\":\"تم الغاء طلب بند بنجاح ! \",\"oops_order_item_unable_to_cancel\":\"اوبس ! بند الطلب غير قادر على الالغاء ! \",\"minimum_selected_range\":\"الحد الأدنى لمدى المحدد \",\"you_can_not_go_back_until_payment_cancel_or_success\":\"لا يمكنك العودة حتى يتم إلغاء الدفع أو تحقيق النجاح. \",\"do_not_press_back_while_payment_and_double_tap_back_button_to_exit\":\"لا تقم بالضغط مرة أخرى أثناء عملية الدفع ، اضغط على مفتاح الضغط مرتين للخروج. \",\"fssai_lic_no\":\"Fsai Lic.  لا :\"}', 0, 1, '2023-08-24 05:24:39', '2023-08-24 05:24:39'),
(5, 3, 3, '{\"Ok\":\"طيب \",\"by\":\"بواسطة \",\"id\":\"الكود \",\"no\":\"لا \",\"or\":\"أو \",\"all\":\"كل \",\"and\":\"و /- \",\"faq\":\"الأسئلة التي يكثر طرحها \",\"yes\":\"نعم. \",\"Item\":\"البند \",\"Oops\":\"اوبس ! \",\"area\":\"المنطقة \",\"cart\":\"عربة \",\"city\":\"المدينة \",\"date\":\"التاريخ \",\"home\":\"الصفحة الرئيسية \",\"name\":\"الاسم \",\"shop\":\"متجر \",\"unit\":\"وحدة \",\"Paytm\":\"Paytm \",\"apply\":\"تطبيق \",\"brand\":\"العلامة التجارية \",\"email\":\"البريد الالكتروني \",\"login\":\"بدء الاتصال \",\"order\":\"الترتيب \",\"price\":\"السعر \",\"saved\":\"تم الحفظ \",\"share\":\"مشاركة \",\"total\":\"المجموع \",\"NotNow\":\"ليس الآن \",\"Paypal\":\"Payal \",\"action\":\"الإجراء \",\"amount\":\"المبلغ \",\"cancel\":\"الغاء \",\"coupon\":\"كوبون \",\"delete\":\"ازالة \",\"filter\":\"مرشح البيانات \",\"logout\":\"انهاء الاتصال \",\"mobile\":\"الموبايل : \",\"remove\":\"ازالة \",\"return\":\"ارجاع \",\"search\":\"بحث \",\"sortBy\":\"فرز بواسطة \",\"status\":\"الحالة \",\"stripe\":\"شريط   \",\"update\":\"تعديل \",\"Invoice\":\"الفاتورة \",\"address\":\"العنوان \",\"applied\":\"تم التطبيق \",\"company\":\"الشركة \",\"confirm\":\"تأكيد \",\"product\":\"المنتج \",\"profile\":\"ملف المواصفات الخاص بي \",\"see_all\":\"مشاهدة الكل \",\"shop_by\":\"يتم التسوق بواسطة \",\"welcome\":\"أهلا وسهلا \",\"Settings\":\"المحددات \",\"ShowFile\":\"عرض الملف \",\"about_us\":\"نبذة عنا \",\"accepted\":\"المتهم \",\"by_price\":\"بواسطة السعر \",\"checkout\":\"تسجيل خروج \",\"clearAll\":\"محو كل \",\"discount\":\"الخصم \",\"gridView\":\"مشاهدة الشبكة \",\"listView\":\"مشاهدة كشف \",\"no_order\":\"لم يتم ايجاد أوامر \",\"paystack\":\"كشف الرواتب \",\"products\":\"المنتجات \",\"quantity\":\"الكمية \",\"razorpay\":\"Razorالأجر \",\"register\":\"تسجيل \",\"userName\":\"اسم المستخدم \",\"wishList\":\"كشف Wislist \",\"UpdateApp\":\"تطبيق التعديل \",\"follow_us\":\"اتبعنا \",\"save_info\":\"حفظ معلومات \",\"sub_total\":\"المجموع الفرعي \",\"there_are\":\"هناك \",\"viewSaved\":\"تم حفظ المشاهدة \",\"view_cart\":\"مشاهدة عربة \",\"your_cart\":\"عربة الخاص بك \",\"GetInvoice\":\"الحصول على الفاتورة \",\"TimeUpdate\":\"الوقت للتعديل ! \",\"all_orders\":\"كل الطلبات \",\"categories\":\"الفئات \",\"contact_us\":\"اتصل بنا \",\"deliver_to\":\"تسليم الى \",\"enter_area\":\"ادخال مساحة \",\"enter_city\":\"أدخل المدينة \",\"go_to_home\":\"اذهب الى الصفحة الرئيسية \",\"my_account\":\"الحساب الخاص بى \",\"popularity\":\"شعبية \",\"store_info\":\"معلومات الحفظ \",\"add_to_cart\":\"اضافة الى عربة \",\"enter_state\":\"ادخال الحالة \",\"get_invoice\":\"الحصول على الفاتورة \",\"have_coupon\":\"هل لديك كوبون ؟ \",\"high_to_low\":\"السعر-عالي الى منخفض \",\"low_to_high\":\"Price-Low to High \",\"new_address\":\"عنوان جديد \",\"offer_title\":\"عرض أكثر واحد لك \",\"place_order\":\"ترتيب المكان \",\"promo_codes\":\"أكواد الوعد \",\"tap_to_copy\":\"التصفيق للنسخ \",\"track_order\":\"تتبع الترتيب \",\"view_coupon\":\"مشاهدة Coupons \",\"address_type\":\"نوع العنوان \",\"edit_profile\":\"تحرير ملف المواصفات \",\"logout_title\":\"انهاء الاتصال ! \",\"newest_first\":\"نغرب أولا \",\"notification\":\"الاشعار \",\"offer_header\":\"اختيار عرض واحد \",\"oldest_first\":\"أقدم أول \",\"out_of_stock\":\"خارج المخزون \",\"prefered_day\":\"يوم التسليم المفضل \",\"product_tags\":\"شارات التعليم للمنتج \",\"profile_info\":\"استعراض بياني لملف المواصفات \",\"profile_note\":\"ملحوظة : يجب أن تقوم بتعديل ملف المواصفات الخاص بك لأغراض بدء الاتصال \",\"transactions\":\"المعاملات \",\"PaypalPayment\":\"دفع PayPAL \",\"alt_mobile_no\":\"رقم التليفون المحمول البديل \",\"clear_filters\":\"محو كل \",\"enter_country\":\"قم بادخال البلد \",\"enter_pincode\":\"ادخال PinCode \",\"mobile_number\":\"رقم التليفون المحمول \",\"order_summary\":\"ملخص الطلب \",\"prefered_time\":\"وقت التسليم المسبق \",\"referral_code\":\"كود الاحالة (اختياري) \",\"share_product\":\"مشاركة المنتج \",\"you_will_save\":\"ستقوم بالحفظ \",\"your_wishlist\":\"tsil WhishW \",\"delete_account\":\"حذف حساب \",\"enter_landmark\":\"ادخال حدث رئيسي \",\"login_continue\":\"بدء الاتصال للاستمرار \",\"logout_message\":\"هل أنت متأكد ؟ \\nهل تريد انهاء الاتصال ؟ \",\"manage_address\":\"ادارة عنوان \",\"no_transaction\":\"لم يتم ايجاد معاملة \",\"not_applicable\":\"لا يمكن تطبيق هذه Coupon \",\"on_this_coupon\":\"على هذه الكوبون \",\"page_not_found\":\"لم يتم ايجاد الصفحة \",\"payment_method\":\"طريقة السداد \",\"privacy_policy\":\"الخصوصية والسياسة \",\"products_found\":\"المنتجات الموجودة \",\"update_profile\":\"تحديث ملف المواصفات \",\"add_new_address\":\"اضافة عنوان جديد \",\"address_details\":\"تفاصيل العنوان \",\"billing_details\":\"تفاصيل الفواتير \",\"category_footer\":\"الفئات \",\"contact_details\":\"تفاصيل جهة الاتصال \",\"delivery_charge\":\"تكلفة التسليم \",\"enter_user_name\":\"أدخل اسم المستخدم \",\"related_product\":\"المنتجات المتعلقة \",\"select_location\":\"تحديد مكان التسليم \",\"shipping_policy\":\"سياسة الشحن \",\"adress_type_home\":\"الصفحة الرئيسية \",\"all_notification\":\"كل الاخطارات \",\"cash_on_delivery\":\"الدفع نقدا عند التسليم \",\"confirm_location\":\"تأكيد مكان \",\"otp_send_message\":\"لقد أرسلنا رمز للتحقق إلى \",\"product_category\":\"فئة المنتج \",\"product_variants\":\"اختلافات المنتج \",\"terms_of_service\":\"شروط الخدمة \",\"agreement_message\":\"اوافق على \",\"enter_valid_email\":\"أدخل عنوان البريد الالكتروني الصحيح \",\"tell_us_about_you\":\"أخبرنا قليلا عنك \",\"address_type_other\":\"مسائل أخرى \",\"downloadAppsFooter\":\"تحميل التطبيقات \",\"login_enter_number\":\"قم بادخال رقم التليفون للاستمرار وسنقوم بارسال كود تحقق لهذا الرقم. \",\"product_desc_title\":\"وصف المنتج \",\"unable_to_checkout\":\"لا يمكن الغاء التخصيص \",\"verify_and_proceed\":\"التحقق من والاستمرار \",\"AppUnderMaintenance\":\"تحت الصيانة \",\"address_type_office\":\"المكتب \",\"cancellation_policy\":\"سياسة الالغاء \",\"delete_user_message\":\"هل أنت متأكد ؟ \\nهل ترغب في حذف الحساب ؟ \\nلن تقوم بالتراجع مرة واحدة لحذف حساب ! \",\"proceed_to_checkout\":\"الاستمرار الى الدفع \",\"transaction_history\":\"السجل التاريخي للعمليات \",\"AppUpdateDescription\":\"أضفنا الكثير من الخصائص الجديدة وقمنا بإصلاح بعض البق لجعل تجربتك سلسة قدر الإمكان. \",\"VoiceToSearchProduct\":\"بحث بواسطة الصوت \",\"discount_high_to_low\":\"الخصم-عالي الى منخفض \",\"out_of_stock_message\":\"Oops ، عدد محدود المتاح ! \",\"product_in_your_cart\":\"منتج في عربة التسوق الخاصة بك \",\"terms_and_conditions\":\"الشروط والأحكام \",\"FileSavedSuccessfully\":\"تم حفظ الملف بنجاح ! \",\"product_in_your_saved\":\"المنتج في كشف Wislist الخاص بك \",\"PaymentCancelledByUser\":\"تم الغاء السداد بواسطة المستخدم. \",\"enter_wishlist_message\":\"كشف wislist الخاص بك خالي \",\"set_as_default_address\":\"تحديد كعنوان مفترض \",\"FilterTypesListPackSize\":\"حجم الحزمة \",\"empty_cart_list_message\":\"عربة الخاص بك خالية \",\"enter_verification_code\":\"ادخال كود التحقق \",\"preferred_delivery_time\":\"وقت التسليم المفضل \",\"use_my_current_location\":\"استخدام المكان الحالي الخاص بي \",\"order_placed_description\":\"تم وضع الطلب الخاص بك بنجاح. \",\"profile_info_description\":\"هذه معلومات أولية عنك لا تقلق يمكنك تغييرها في أي وقت \",\"select_delivery_location\":\"تحديد مكان التسليم الخاص بك \",\"enter_wishlist_description\":\"استكشف المزيد وقم بوضع قائمة مختصرة ببعض البنود. \",\"OopsOrderItemUnableToCancel\":\"اوبس ! بند الطلب غير قادر على الالغاء ! \",\"empty_cart_list_button_name\":\"التسوق الآن \",\"empty_cart_list_description\":\"تبدو وكأنك لم تضيف أي شيء إلى عربتك بعد \",\"recharge_and_exchange_policy\":\"سياسة عمليات الارجاع والارجاع \",\"enter_text_to_search_products\":\"أدخل نص للبحث في المنتجات ! \",\"OrderItemCancelledSuccessfully\":\"تم الغاء طلب بند بنجاح ! \",\"empty_notification_list_message\":\"لا يوجد اعلام \",\"required_login_message_for_cart\":\"اوبس !  يجب أن تقوم ببدء الاتصال أولا لاضافة بنود الى عربة التسوق ! \",\"order_status_display_name_shipped\":\"تم الشحن \",\"order_status_display_name_recieved\":\"استقبل \",\"empty_notification_list_description\":\"لا يوجد لديك اشعار الآن بالعودة في وقت لاحق. \",\"order_status_display_name_delivered\":\"تم التسليم \",\"required_login_message_for_wishlist\":\"اوبس !  يجب أن تقوم ببدء الاتصال أولا لاضافة بنود الى كشف wislist ! \",\"required_login_message_for_cartRedirect\":\"اوبس !  يجب أن تقوم ببدء الاتصال أولا للتوصل الى عربة التسوق ! \",\"required_login_message_for_notification\":\"اوبس !  يجب أن تقوم ببدء الاتصال أولا للتوصل الى الاعلام ! \",\"order_status_display_name_out_for_delivery\":\"خارج لتسليم \",\"active_orders\":\"الأوامر الفعالة \",\"previous_orders\":\"الطلبات السابقة \",\"license_no\":\"ترخيص لا \",\"items\":\"البنود \",\"your_order_has_been\":\"طلبك كان \",\"successfully\":\"نجاح \",\"delivery_information\":\"معلومات التسليم \",\"delivery_to\":\"تسليم الى \",\"transaction_id\":\"كود المعاملة \",\"order_details\":\"تفاصيل الطلب\"}', 0, 1, '2023-08-24 05:31:20', '2023-08-24 05:31:20');
INSERT INTO `languages` (`id`, `supported_language_id`, `system_type`, `json_data`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(6, 16, 2, '{\"app_name\":\"eGrocer Seller\",\"email\":\"Email\",\"date_of_birth\":\"Date of Birth\",\"password\":\"Password\",\"login\":\"Login\",\"login_type_page_title\":\"eGrocer\",\"login_type_page_description\":\"We\'re your one-stop shop for all your grocery needs.\",\"login_as\":\"Login As\",\"seller\":\"Seller\",\"delivery_boy\":\"Delivery Boy\",\"agreement_message_1\":\"I Agree to the\",\"and\":\"and\",\"terms_of_service\":\"Terms of Service\",\"privacy_policy\":\"Privacy Policy\",\"accept_terms_condition_message\":\"Please accept Privacy Policy and Terms of Service\",\"change_theme\":\"Change Theme\",\"change_language\":\"Change Language\",\"out_of_stock\":\"Out of stock\",\"logout_title\":\"Logout!\",\"logout_message\":\"Are you sure?\\n\\nYou want to logout?\",\"delete_user_account\":\"Delete Account\",\"delete_user_title\":\"Delete account!\",\"delete_user_message\":\"Are you sure?\\nYou want to delete account?\\nYou will not undone once delete account!\",\"ok\":\"OK\",\"done\":\"Done\",\"cancel\":\"Cancel\",\"something_went_wrong\":\"Something Went Wrong\",\"check_internet\":\"Please check internet connection!\",\"orders\":\"Orders\",\"products\":\"Products\",\"balance\":\"Balance\",\"sold_out_products\":\"Sold Out Products\",\"low_stock_products\":\"Low Stock Products\",\"title_dashboard\":\"Dashboard\",\"title_orders\":\"Orders\",\"title_order\":\"Order\",\"title_categories\":\"Categories\",\"title_profile\":\"Profile\",\"daily_sales\":\"Daily Sales\",\"title_product_wise_category_count\":\"Product Category Count\",\"description_weekly_sales\":\"Total Sale In Last Week\",\"logout\":\"Logout\",\"rate_us\":\"Rate Us\",\"user_name\":\"User Name\",\"user_email\":\"User Email\",\"user_mobile\":\"User Mobile\",\"order_note\":\"Order Note\",\"enter_user_name\":\"Enter User Name\",\"mobile_number\":\"Mobile Number\",\"enter_valid_mobile\":\"Enter Valid Mobile Number\",\"id\":\"ID\",\"delivery_time\":\"Delivery Time\",\"order_date\":\"Order Date\",\"address\":\"Address\",\"delivery_charge\":\"Delivery Charge\",\"payable_amount\":\"Payable Amount\",\"total_items_amount\":\"Total Items Amount\",\"not_assign\":\"Not assign\",\"amount\":\"Amount\",\"payment_method\":\"Payment Method\",\"status\":\"Status\",\"all\":\"All\",\"update_order_status\":\"Update Order Status\",\"update_delivery_boy\":\"Update Delivery Boy\",\"pending_orders\":\"Pending Orders\",\"name\":\"Name\",\"variant\":\"Variant\",\"quantity\":\"Quantity\",\"price\":\"Price\",\"tax\":\"Tax\",\"subtotal\":\"Subtotal\",\"list_of_order_items\":\"List of Order Items\",\"order_details\":\"Order Details\",\"billing_details\":\"Billing Details\",\"settings\":\"Settings\",\"notifications_settings\":\"Notifications Settings\",\"mail\":\"Mail\",\"mobile\":\"Mobile\",\"update_settings\":\"Update Settings\",\"password_and_confirm_password_does_not_match\":\"Password and confirm password does not match!\",\"register\":\"Register\",\"confirm_password\":\"Confirm Password\",\"personal_information\":\"Personal Information\",\"store_information\":\"Store Information\",\"bank_information\":\"Bank Information\",\"store_location_information\":\"Store Location Information\",\"other_settings\":\"Other Settings\",\"bank_name\":\"Bank Name\",\"account_number\":\"Account Number\",\"ifsc_code\":\"IFSC Code\",\"account_name\":\"Account Name\",\"tax_name\":\"Tax Name\",\"tax_number\":\"Tax Number\",\"personal_identity_number\":\"Personal Identity Number\",\"commission\":\"Commission(%)\",\"national_identification_card\":\"National Identification Card\",\"address_proof\":\"Address Proof\",\"enter_valid\":\"Enter Valid\",\"next\":\"Next\",\"previous\":\"Previous\",\"select_file\":\"Select File\",\"category_ids\":\"Categories\",\"store_name\":\"Name\",\"store_url\":\"Url\",\"select_city\":\"Select City\",\"state\":\"State\",\"street\":\"Street\",\"store_location\":\"Location\",\"store_latitude\":\"Latitude\",\"store_longitude\":\"Longitude\",\"store_logo\":\"Logo\",\"store_description\":\"Description\",\"save\":\"Save\",\"select_categories\":\"Select Categories\",\"home_bottom_menu_home\":\"Home\",\"home_bottom_menu_orders\":\"Orders\",\"home_bottom_menu_category\":\"Category\",\"home_bottom_menu_profile\":\"Profile\",\"type_location_manually\":\"Type Location Manually\",\"confirm_location\":\"Confirm Location\",\"select_your_location\":\"Select Your Location\",\"change\":\"Change\",\"recent_searches\":\"Recent Searches\",\"recent_searches_clear\":\"Clear\",\"use_my_current_location\":\"Use my current location\",\"or\":\"or\",\"does_not_delivery_long_message\":\"Selected area is not serviceable!\",\"sorry\":\"Sorry!\",\"select_location\":\"Select Location\",\"select_delivery_location\":\"Select Your Delivery Location\",\"request_padding_message\":\"Your registration request send to admin and will be approved soon\",\"request_rejected_message\":\"Your request has been rejected due to\",\"account_deactivated_message\":\"Your account has been deactivated due to\",\"thank_you\":\"Thank you!\",\"order_status_display_names_awaiting\":\"Awaiting Payment\",\"order_status_display_names_all\":\"All Orders\",\"order_status_display_names_received\":\"Received\",\"order_status_display_names_processed\":\"Processed\",\"order_status_display_names_shipped\":\"Shipped\",\"order_status_display_names_out_for_delivery\":\"Out for Delivery\",\"order_status_display_names_delivered\":\"Delivered\",\"order_status_display_names_cancelled\":\"Cancelled\",\"order_status_display_names_returned\":\"Returned\",\"theme_display_names_system_default\":\"System Default\",\"theme_display_names_light\":\"Light\",\"theme_display_names_dark\":\"Dark\",\"approved_message\":\"Your request under review, you will get notification after get approval!\",\"get_seller_direction\":\"Get Seller Direction\",\"get_customer_direction\":\"Get Customer Direction\",\"call_to_seller\":\"Call to Seller\",\"call_to_customer\":\"Call to Customer\",\"could_not_launch\":\"Could not launch \"}', 1, 1, '2023-08-24 07:39:44', '2023-08-24 11:03:33'),
(7, 3, 2, '{\"app_name\":\"eGrouer Seller \",\"email\":\"البريد الالكتروني \",\"date_of_birth\":\"تاريخ الميلاد \",\"password\":\"كلمة السرية \",\"login\":\"بدء الاتصال \",\"login_type_page_title\":\"eGrocer \",\"login_type_page_description\":\"نحن محطتك للتوقف الواحد لكل احتياجات البقالة الخاصة بك. \",\"login_as\":\"بدء الاتصال باسم \",\"seller\":\"البائع \",\"delivery_boy\":\"فتى التوصيل \",\"agreement_message_1\":\"اوافق على \",\"and\":\"و /- \",\"terms_of_service\":\"شروط الخدمة \",\"privacy_policy\":\"سياسة الخصوصية \",\"accept_terms_condition_message\":\"يرجى قبول السياسة الخاصة بالخصوصية وشروط الخدمة \",\"change_theme\":\"تغيير النسق الرئيسي \",\"change_language\":\"تغيير اللغة \",\"out_of_stock\":\"خارج المخزون \",\"logout_title\":\"انهاء الاتصال ! \",\"logout_message\":\"هل أنت متأكد ؟ \\n\\nهل تريد انهاء الاتصال ؟ \",\"delete_user_account\":\"حذف حساب \",\"delete_user_title\":\"حذف حساب ! \",\"delete_user_message\":\"هل أنت متأكد ؟ \\nهل ترغب في حذف الحساب ؟ \\nلن تقوم بالتراجع مرة واحدة لحذف حساب ! \",\"ok\":\"طيب \",\"done\":\"اتمام \",\"cancel\":\"الغاء \",\"something_went_wrong\":\"شيء ما سار خطأ \",\"check_internet\":\"برجاء التحقق من وصلة الانترنت ! \",\"orders\":\"الطلبات \",\"products\":\"المنتجات \",\"balance\":\"الرصيد \",\"sold_out_products\":\"منتجات Out Sut \",\"low_stock_products\":\"منتجات الأسهم المنخفضة \",\"title_dashboard\":\"استعراض بياني \",\"title_orders\":\"الطلبات \",\"title_order\":\"الترتيب \",\"title_categories\":\"الفئات \",\"title_profile\":\"ملف مواصفات \",\"daily_sales\":\"المبيعات اليومية \",\"title_product_wise_category_count\":\"عدد فئات المنتج \",\"description_weekly_sales\":\"اجمالي البيع في الأسبوع الماضي \",\"logout\":\"انهاء الاتصال \",\"rate_us\":\"تقييم Us \",\"user_name\":\"اسم المستخدم \",\"user_email\":\"البريد الالكتروني للمستخدم \",\"user_mobile\":\"موبايل المستخدم \",\"order_note\":\"مذكرة الترتيب \",\"enter_user_name\":\"أدخل اسم المستخدم \",\"mobile_number\":\"رقم التليفون المحمول \",\"enter_valid_mobile\":\"قم بادخال رقم التليفون المحمول الصحيح \",\"id\":\"الكود \",\"delivery_time\":\"وقت التسليم \",\"order_date\":\"تاريخ الطلب \",\"address\":\"العنوان \",\"delivery_charge\":\"تكلفة التسليم \",\"payable_amount\":\"المبلغ المستحق \",\"total_items_amount\":\"اجمالي عدد البنود \",\"not_assign\":\"غير تخصيص \",\"amount\":\"المبلغ \",\"payment_method\":\"طريقة السداد \",\"status\":\"الحالة \",\"all\":\"كل \",\"update_order_status\":\"تعديل حالة الطلب \",\"update_delivery_boy\":\"تعديل وحدة التسليم \",\"pending_orders\":\"الطلبات المعلقة \",\"name\":\"الاسم \",\"variant\":\"اختلاف \",\"quantity\":\"الكمية \",\"price\":\"السعر \",\"tax\":\"الضريبة \",\"subtotal\":\"المجموع الفرعي \",\"list_of_order_items\":\"كشف بنود الترتيب \",\"order_details\":\"تفاصيل الطلب \",\"billing_details\":\"تفاصيل الفواتير \",\"settings\":\"المحددات \",\"notifications_settings\":\"محددات الاعلامات \",\"mail\":\"البريد \",\"mobile\":\"موبايل \",\"update_settings\":\"تعديل المحددات \",\"password_and_confirm_password_does_not_match\":\"كلمة السرية وتأكيد كلمة السرية غير متطابقين ! \",\"register\":\"تسجيل \",\"confirm_password\":\"تأكيد كلمة السرية \",\"personal_information\":\"المعلومات الشخصية \",\"store_information\":\"معلومات المتجر \",\"bank_information\":\"معلومات مصرفية \",\"store_location_information\":\"معلومات مكان المتجر \",\"other_settings\":\"المحددات الأخرى \",\"bank_name\":\"اسم البنك \",\"account_number\":\"رقم الحساب \",\"ifsc_code\":\"كود IFSC \",\"account_name\":\"اسم الحساب \",\"tax_name\":\"اسم الضريبة \",\"tax_number\":\"رقم الضريبة \",\"personal_identity_number\":\"رقم الهوية الشخصية \",\"commission\":\"اللجنة (في المائة) \",\"national_identification_card\":\"بطاقة الهوية الوطنية \",\"address_proof\":\"دليل العناوين \",\"enter_valid\":\"ادخال صحيح \",\"next\":\"تالي \",\"previous\":\"سابق \",\"select_file\":\"اختيار ملف \",\"category_ids\":\"الفئات \",\"store_name\":\"الاسم \",\"store_url\":\"عنوان Url \",\"select_city\":\"تحديد مدينة \",\"state\":\"الحالة \",\"street\":\"الشارع \",\"store_location\":\"الموقع \",\"store_latitude\":\"خط العرض \",\"store_longitude\":\"خط الطول \",\"store_logo\":\"الشعار \",\"store_description\":\"الوصف \",\"save\":\"حفظ \",\"select_categories\":\"تحديد الفئات \",\"home_bottom_menu_home\":\"الصفحة الرئيسية \",\"home_bottom_menu_orders\":\"الطلبات \",\"home_bottom_menu_category\":\"الفئة \",\"home_bottom_menu_profile\":\"ملف مواصفات \",\"type_location_manually\":\"نوع المكان يدويا \",\"confirm_location\":\"تأكيد مكان \",\"select_your_location\":\"تحديد المكان الخاص بك \",\"change\":\"التغيير \",\"recent_searches\":\"عمليات البحث الحديثة \",\"recent_searches_clear\":\"محو \",\"use_my_current_location\":\"استخدام المكان الحالي الخاص بي \",\"or\":\"أو \",\"does_not_delivery_long_message\":\"المساحة المحددة غير قابلة للاستخدام ! \",\"sorry\":\"! آسف ! \",\"select_location\":\"اختيار مكان \",\"select_delivery_location\":\"تحديد مكان التسليم الخاص بك \",\"request_padding_message\":\"سيتم ارسال طلب التسجيل الخاص بك الى موجه النظام وسيتم اعتماده قريبا \",\"request_rejected_message\":\"تم رفض الطلب الخاص بك بسبب \",\"account_deactivated_message\":\"تم الغاء تشغيل الحساب الخاص بك بسبب \",\"thank_you\":\"! شكرا لك ! \",\"order_status_display_names_awaiting\":\"فى انتظار الدفعات \",\"order_status_display_names_all\":\"كل الطلبات \",\"order_status_display_names_received\":\"استقبل \",\"order_status_display_names_processed\":\"تم تشغيل \",\"order_status_display_names_shipped\":\"تم الشحن \",\"order_status_display_names_out_for_delivery\":\"خارج لتسليم \",\"order_status_display_names_delivered\":\"تم التسليم \",\"order_status_display_names_cancelled\":\"تم الالغاء \",\"order_status_display_names_returned\":\"تم الارجاع \",\"theme_display_names_system_default\":\"النظام المفترض \",\"theme_display_names_light\":\"خفيف \",\"theme_display_names_dark\":\"ظلام \",\"approved_message\":\"الطلب الخاص بك تحت المراجعة ، ستحصل على اعلام بعد الحصول على الموافقة ! \",\"get_seller_direction\":\"عرض اتجاه البائع \",\"get_customer_direction\":\"احضار اتجاه العميل \",\"call_to_seller\":\"دعوة للهيلر \",\"call_to_customer\":\"الاتصال بالعميل \",\"could_not_launch\":\"لا يمكن بدء التشغيل\"}', 0, 1, '2023-08-24 11:56:39', '2023-08-24 11:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `mail_settings`
--

CREATE TABLE `mail_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '0:user, 1:Admin',
  `user_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `mail_status` int(11) NOT NULL COMMENT '0:false, 1:true',
  `mobile_status` int(11) NOT NULL COMMENT '0:false, 1:true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_settings`
--

INSERT INTO `mail_settings` (`id`, `user_type`, `user_id`, `order_status_id`, `mail_status`, `mobile_status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(2, 0, 1, 2, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(3, 0, 1, 3, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(4, 0, 1, 4, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(5, 0, 1, 5, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(6, 0, 1, 6, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(7, 0, 1, 7, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(8, 0, 1, 8, 1, 1, '2023-08-23 12:11:54', '2023-08-23 12:11:54'),
(9, 0, 2, 1, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45'),
(10, 0, 2, 2, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45'),
(11, 0, 2, 3, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45'),
(12, 0, 2, 4, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45'),
(13, 0, 2, 5, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45'),
(14, 0, 2, 6, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45'),
(15, 0, 2, 7, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45'),
(16, 0, 2, 8, 1, 1, '2023-08-24 12:39:45', '2023-08-24 12:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `extension` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `sub_directory` text NOT NULL,
  `size` text NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_05_03_000001_create_customer_columns', 1),
(9, '2019_05_03_000002_create_subscriptions_table', 1),
(10, '2019_05_03_000003_create_subscription_items_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(13, '2022_04_19_162005_create_admins_table', 1),
(14, '2022_04_19_162451_create_areas_table', 1),
(15, '2022_04_19_162712_create_carts_table', 1),
(16, '2022_04_19_162902_create_categories_table', 1),
(17, '2022_04_19_163557_create_cities_table', 1),
(18, '2022_04_19_163656_create_delivery_boys_table', 1),
(19, '2022_04_19_164613_create_delivery_boy_notifications_table', 1),
(20, '2022_04_19_164915_create_devices_table', 1),
(21, '2022_04_19_165016_create_faqs_table', 1),
(22, '2022_04_19_165227_create_favorites_table', 1),
(23, '2022_04_19_165315_create_fund_transfers_table', 1),
(24, '2022_04_19_165516_create_invoices_table', 1),
(25, '2022_04_19_165749_create_media_table', 1),
(26, '2022_04_19_165926_create_newsletters_table', 1),
(27, '2022_04_19_170143_create_notifications_table', 1),
(28, '2022_04_19_170450_create_offers_table', 1),
(29, '2022_04_19_170910_create_orders_table', 1),
(30, '2022_04_19_172151_create_order_bank_transfers_table', 1),
(31, '2022_04_19_172308_create_order_items_table', 1),
(32, '2022_04_19_172843_create_order_trackings_table', 1),
(33, '2022_04_20_151502_create_payments_table', 1),
(34, '2022_04_20_151611_create_payment_requests_table', 1),
(35, '2022_04_20_151716_create_pickup_locations_table', 1),
(36, '2022_04_20_151845_create_pincodes_table', 1),
(37, '2022_04_20_151954_create_products_table', 1),
(38, '2022_04_20_152511_create_product_variants_table', 1),
(39, '2022_04_20_152844_create_promo_codes_table', 1),
(40, '2022_04_20_153012_create_return_requests_table', 1),
(41, '2022_04_20_153129_create_sections_table', 1),
(42, '2022_04_20_153246_create_sellers_table', 1),
(43, '2022_04_20_154006_create_seller_commissions_table', 1),
(44, '2022_04_20_154147_create_seller_transactions_table', 1),
(45, '2022_04_20_154343_create_seller_wallet_transactions_table', 1),
(46, '2022_04_20_154514_create_settings_table', 1),
(47, '2022_04_20_154550_create_sliders_table', 1),
(48, '2022_04_20_154642_create_social_media_table', 1),
(49, '2022_04_20_154726_create_sub_categories_table', 1),
(50, '2022_04_20_154923_create_taxes_table', 1),
(51, '2022_04_20_155025_create_time_slots_table', 1),
(52, '2022_04_20_155123_create_transactions_table', 1),
(53, '2022_04_20_155303_create_units_table', 1),
(54, '2022_04_20_155359_create_updates_table', 1),
(55, '2022_04_20_155800_create_user_addresses_table', 1),
(56, '2022_04_20_160100_create_wallet_transactions_table', 1),
(57, '2022_04_20_160235_create_withdrawal_requests_table', 1),
(58, '2022_05_23_061317_create_permission_categories_table', 1),
(59, '2022_05_23_165755_create_permission_tables', 1),
(60, '2022_06_04_070341_create_product_images_table', 1),
(61, '2022_06_04_103202_create_user_tokens_table', 1),
(62, '2022_07_05_174502_create_order_status_lists_table', 1),
(63, '2022_07_09_074747_create_panel_notifications_table', 1),
(64, '2022_08_16_180725_create_brands_table', 1),
(65, '2022_08_24_160823_create_countries_table', 1),
(66, '2022_10_01_055428_create_app_usages_table', 1),
(67, '2022_11_15_062504_create_sessions_table', 1),
(68, '2022_12_03_071819_add_remark_to_sellers_table', 1),
(69, '2022_12_03_094442_add_remark_to_delivery_boys_table', 1),
(70, '2022_12_03_104000_create_mail_settings_table', 1),
(71, '2022_12_17_095005_create_admin_tokens_table', 1),
(72, '2022_12_27_113410_create_jobs_table', 1),
(73, '2022_19_01_060237_create_order_statuses_table', 1),
(74, '2023_01_23_122915_add_row_order_to_sections_table', 1),
(75, '2023_02_03_062618_add_type_link_to_notifications_table', 1),
(76, '2023_04_04_101932_add_bonus_fields_delivery_boys_table', 1),
(77, '2023_04_10_095427_add_delivery_boy_bonus_details_to_orders_table', 1),
(78, '2023_04_17_114556_add_remark_to_withdrawal_requests_table', 1),
(79, '2023_06_05_103829_create_supported_languages_table', 1),
(80, '2023_06_05_110120_create_languages_table', 1),
(81, '2022_04_20_154148_create_delivery_boy_transactions_table', 2),
(82, '2023_07_12_091437_add_login_info_to_admins_table', 2),
(83, '2023_08_21_091438_add_fssai_lic_no_to_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(4, 'App\\Models\\Admin', 4);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type_link` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `type`, `type_id`, `type_link`, `image`, `date_sent`) VALUES
(1, 'fgsfdg', 'dsfsdf', 'default', 0, '', '', '2023-08-24 09:56:42');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0033f8424afc7f088c40803f661b6922f1ce14c2fa342f54e7d78f9a14e4edda17e8a945b491e305', 4, 1, 'authToken', '[]', 0, '2023-07-25 08:57:26', '2023-07-25 08:57:26', '2024-07-25 14:27:26'),
('059694548a3435bbcb7171eb7ca7cf754219e53c02ed128902e2146c54695fed2c98e8673d9d529c', 3, 1, 'authToken', '[]', 0, '2023-07-25 07:32:48', '2023-07-25 07:32:48', '2024-07-25 13:02:48'),
('0623e2bf210650099d722465e59b1d4d97ecc36574c336956393ee4955369ce93100a696daa6418c', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:42:26', '2023-08-24 09:42:26', '2024-08-24 09:42:26'),
('0916c6b302fd2deb68d73a3d46f1fa321001ea4614ec77fa26b4cf73a87f2eb5d26e03798196d686', 3, 1, 'authToken', '[]', 0, '2023-07-25 06:20:49', '2023-07-25 06:20:49', '2024-07-25 11:50:49'),
('0fdaa6383baf696adec01160bd430971269d859f26332c7e9799925de647feb4138bd8acf1127c7e', 4, 1, 'authToken', '[]', 0, '2023-07-25 07:50:02', '2023-07-25 07:50:02', '2024-07-25 13:20:02'),
('11ac5af85ac0d67fb88baf3f20fd77019b94a537a0595850a31fa09d3aef2811f482075592dc5265', 1, 1, 'authToken', '[]', 0, '2023-08-23 06:28:35', '2023-08-23 06:28:35', '2024-08-23 06:28:35'),
('11b868c3612582ae10a9819238e398fb6dcd59b382280beaa880d327b31e5c1df1ece4a27aaaa1e6', 1, 1, 'authToken', '[]', 0, '2023-07-25 06:03:55', '2023-07-25 06:03:55', '2024-07-25 11:33:55'),
('1332f142cbf945046154814506666d0eb3fae1acf0aff3fe8ec4780234f860974e19b3665e856f5a', 1, 1, 'authToken', '[]', 0, '2023-08-24 05:11:11', '2023-08-24 05:11:11', '2024-08-24 05:11:11'),
('1493ac81e10296b15ee267671d7d739819e286e12c4fe6a1483f8487864f4756e376029c5ba42226', 4, 1, 'authToken', '[]', 0, '2023-07-25 08:38:25', '2023-07-25 08:38:25', '2024-07-25 14:08:25'),
('178134b780a1f55066b98ac095fab8669e3a0757ccc7cc877f4cbf2ededa9eac8e1a5f8487862b52', 3, 1, 'authToken', '[]', 0, '2023-07-25 06:46:44', '2023-07-25 06:46:44', '2024-07-25 12:16:44'),
('17fd76125cbc1496a0d6eede696b57d230c91468631512eebde4febc8f3a5fc6076421933d55392d', 4, 1, 'authToken', '[]', 0, '2023-08-24 08:58:47', '2023-08-24 08:58:47', '2024-08-24 08:58:47'),
('1ccbb352ab4ff129ce7b24f6dc7810884b28547a8eedbeac8d7a975e1c828eba71de461238aeb31d', 1, 1, 'authToken', '[]', 0, '2023-08-23 06:58:22', '2023-08-23 06:58:22', '2024-08-23 06:58:22'),
('1dde34859268c9c01218a4008288981ede794ce63a06f9d443415a0f709e38815a6277fd444f2829', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:18:07', '2023-08-24 09:18:07', '2024-08-24 09:18:07'),
('1e2dae53c68fe7436594e9a12bba7e45d26133f4b07cae9c9d4dafaa216207eb44ddbe05bbde763e', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:13:50', '2023-08-24 09:13:50', '2024-08-24 09:13:50'),
('21003715e6a2790a047d39935a58ad3ef1475d5d1d5da7de9e9d6e7b6eb718cba149abb9f823de0f', 3, 1, 'authToken', '[]', 0, '2023-08-23 11:08:56', '2023-08-23 11:08:56', '2024-08-23 11:08:56'),
('22a46dcd2cc5ed736e23d2a78c1dd08e9b043980283e1dcf70d810ee0a283010544987007d93c881', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:14:31', '2023-08-24 09:14:31', '2024-08-24 09:14:31'),
('258495fd62c569ab4e1950544ac5ee101a27b1b362ff02e007ad249645cd83be30ac43a0d9d4e4b0', 1, 1, 'authToken', '[]', 0, '2023-08-23 11:06:06', '2023-08-23 11:06:06', '2024-08-23 11:06:06'),
('26ea17ffa58af825a21f2ed6c3f2ffaa8cd9106e0c93d90da523e4883b421c8e06d12a410dc3e1d2', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:34:17', '2023-08-24 09:34:17', '2024-08-24 09:34:17'),
('272180039ccf3c65602edf809100194fcccd8fed377ae8186740105859440f3115be21b3b5c25c09', 4, 1, 'authToken', '[]', 0, '2023-08-24 08:01:22', '2023-08-24 08:01:22', '2024-08-24 08:01:22'),
('27e0a48f27330f12db45e309e3337ff1ef867a496e6e0196ad92c81d96f601aad3a98cecb3513d7d', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:00:13', '2023-08-24 09:00:13', '2024-08-24 09:00:13'),
('2ad34956696d600db032bdd848b77efb99cab3d565bb2554e6337bd0f787b49e10715ee13848d771', 3, 1, 'authToken', '[]', 0, '2023-07-25 06:55:35', '2023-07-25 06:55:35', '2024-07-25 12:25:35'),
('2df78c0881ef197c19dd2605bc00a090e7e09c112fa9989c008c20b9e15dedfa99052668167a8a6b', 1, 1, 'authToken', '[]', 0, '2023-08-24 04:36:49', '2023-08-24 04:36:49', '2024-08-24 04:36:49'),
('300f4f2c96a9047d883f771f2029352d1fda253a7bb7ce0a11929ffec0c46710dec3786c0691e91b', 1, 1, 'authToken', '[]', 0, '2023-08-23 05:25:47', '2023-08-23 05:25:47', '2024-08-23 05:25:47'),
('3fe769234f7a1e4d8e72f8da6d5419f11ded8a73190dc222056570d7042ad9ecbe9eda9d79f93fb6', 1, 1, 'authToken', '[]', 0, '2023-08-23 10:43:44', '2023-08-23 10:43:44', '2024-08-23 10:43:44'),
('40c9767b8b5d862ab36c141667fe79c2e992137c7ef86c3e0ca57dce303ffdf4548e54b99807b8a5', 1, 1, 'authToken', '[]', 0, '2023-08-24 06:45:26', '2023-08-24 06:45:26', '2024-08-24 06:45:26'),
('45c390fab5189d4b92c19d4ed3d57176daec588a83ff277b0e44309a32c886ca1d77c48947635d05', 1, 1, 'authToken', '[]', 0, '2023-08-24 06:04:10', '2023-08-24 06:04:10', '2024-08-24 06:04:10'),
('462d3bb1dffcce1fd45c4caba8784d3754cbdb1311da78968983dfa30c0f030312e49db010588055', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:19:47', '2023-08-24 09:19:47', '2024-08-24 09:19:47'),
('4671b4138004951c6d0196490dbdb60bea3ea2b30ad13ddbbef550e24438da8a9a2f25f4f63f7d33', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:09:35', '2023-08-24 09:09:35', '2024-08-24 09:09:35'),
('487d5553b93c5e6a5758898c86f4800a83155d98845f87abbc7105abe09a3933047cbd147df7e84a', 4, 1, 'authToken', '[]', 0, '2023-07-25 08:37:19', '2023-07-25 08:37:19', '2024-07-25 14:07:19'),
('4a05d339a27729668566fa3fa6822360342eaf98f9afde3ac54e7f2bdd0c98275f26fe3a5fa127dd', 1, 1, 'authToken', '[]', 0, '2023-08-23 11:06:19', '2023-08-23 11:06:19', '2024-08-23 11:06:19'),
('4a86dee6350dc63ca291a9652ffe5624d0aa9f4d78454731ed44d42f591a92c9b66f09ce5d5c0b9d', 4, 1, 'authToken', '[]', 0, '2023-08-24 08:01:33', '2023-08-24 08:01:33', '2024-08-24 08:01:33'),
('4b0455a9fb9065d3d774d425eaef7e106ffec9fca132dc0f85e7aadb65880dd032e8b3921591a424', 4, 1, 'authToken', '[]', 0, '2023-08-24 07:48:10', '2023-08-24 07:48:10', '2024-08-24 07:48:10'),
('4caf614db6a7acc2618ae5feb73545a655fc5aa22c2b000e06dc58d8fee30d181c78c8b508b58aeb', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:13:17', '2023-08-24 09:13:17', '2024-08-24 09:13:17'),
('4f8863dfde2838e23ad2e2e6de6b4d383350f553afc621a19a55153c897a81a9cc1fa2ef84ca9b92', 3, 1, 'authToken', '[]', 0, '2023-08-23 11:06:10', '2023-08-23 11:06:10', '2024-08-23 11:06:10'),
('527d2c11e00ae7a679ab46057a103f4d9cf8e1ced9a2f6f967293db37b2102e56849fd47ff49303a', 1, 1, 'authToken', '[]', 0, '2023-07-25 08:14:23', '2023-07-25 08:14:23', '2024-07-25 13:44:23'),
('5677c72f244c0fac191b8ea5f4418d007698f7b15c99e2e38d4291f68d0d0fad2e72f59e5356918e', 4, 1, 'authToken', '[]', 0, '2023-08-24 11:26:23', '2023-08-24 11:26:23', '2024-08-24 11:26:23'),
('57f7b95cf666ad055c57f5edc9b6c3cc04566c111d345b78d81edaf69b1aca649a21fd363f56de7d', 4, 1, 'authToken', '[]', 0, '2023-08-24 07:17:00', '2023-08-24 07:17:00', '2024-08-24 07:17:00'),
('5a99e6b79ff4dd05b9cdf4f61cd4ac11d2d61d72ad3c0858b607192b498913fc724c69e5564dfffe', 1, 1, 'authToken', '[]', 0, '2023-08-23 12:11:39', '2023-08-23 12:11:39', '2024-08-23 12:11:39'),
('5c95cf88c4f0247574f24226ea638debc4e56850f6a530a9e5a8569eefc6c9eca33d77922dc1a0d2', 1, 1, 'authToken', '[]', 0, '2023-08-24 05:06:30', '2023-08-24 05:06:30', '2024-08-24 05:06:30'),
('5d2545e4d824e38c92fd17fbe809808c84b6dfae148451c9a04baf4e7301b9e09fc521c128e3e24f', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:16:31', '2023-08-24 09:16:31', '2024-08-24 09:16:31'),
('5d390d53963f39ae2febebc31a5cb7fef130da822e84150ce31dc54df8a34837b7c59b6bd125a301', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:11:06', '2023-08-24 09:11:06', '2024-08-24 09:11:06'),
('619ef7c86a606fc999497cba4ce8ac644e1cde90a93b7c8d2de689bb0d5e08284932cc00267059f3', 4, 1, 'authToken', '[]', 0, '2023-08-24 08:03:51', '2023-08-24 08:03:51', '2024-08-24 08:03:51'),
('6317f22ff7892feded6199ed98b2031e13aa4d75bdbfa26f191c426a523b5d41b565312e576d9ab0', 3, 1, 'authToken', '[]', 0, '2023-07-25 06:14:59', '2023-07-25 06:14:59', '2024-07-25 11:44:59'),
('63e9d4e92d91f9278bbada1241a8710d4b42d0143226a1d389b6f60c0543757a6421ffe3b219bb65', 4, 1, 'authToken', '[]', 0, '2023-08-23 11:09:10', '2023-08-23 11:09:10', '2024-08-23 11:09:10'),
('662a58f7fd2bb0f93294fa7ab22a7a83bb08a5894e33a4678df3f3f94beab0afc20eda1c38539562', 1, 1, 'authToken', '[]', 0, '2023-08-24 06:12:25', '2023-08-24 06:12:25', '2024-08-24 06:12:25'),
('6633733f7afbe4378e965732b8656b179adb57844ac3ba1a08c81e17dad58e6e632ef966a862f995', 1, 1, 'authToken', '[]', 0, '2023-08-24 05:32:05', '2023-08-24 05:32:05', '2024-08-24 05:32:05'),
('674329f88cf586e033876890d617e507d0cec67d92cf4f94d78aaf76245118c1eda32dfb14785da2', 1, 1, 'authToken', '[]', 0, '2023-07-25 07:03:16', '2023-07-25 07:03:16', '2024-07-25 12:33:16'),
('6ab0f8090079eeda8b09d0626d68478e62d129f49fe08fcc753301ffd981fff657a70d43e0871e0f', 2, 1, 'authToken', '[]', 0, '2023-08-24 12:39:32', '2023-08-24 12:39:32', '2024-08-24 12:39:32'),
('72beacc312265e041e448fef8dfabd41aca615658a00a9a6d1d9a7936466fe3746e17409aed41ad3', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:00:04', '2023-08-24 09:00:04', '2024-08-24 09:00:04'),
('783ed9acc90c8410c5f11448648570d961c3aff551694c439fa48a285d136c363bca2e5a30e0ee17', 1, 1, 'authToken', '[]', 0, '2023-08-24 05:07:11', '2023-08-24 05:07:11', '2024-08-24 05:07:11'),
('7cffb09dabcbb318025063c8dff59b538584c13a44545b671d8a7ce8d84f1e420ef6ff9cf24cb8bb', 3, 1, 'authToken', '[]', 0, '2023-07-25 07:13:26', '2023-07-25 07:13:26', '2024-07-25 12:43:26'),
('822e85af4189de64fc33042b1413164fdd72eaffe19c01973111ca34377589509d6fa1683251149f', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:27:44', '2023-08-24 09:27:44', '2024-08-24 09:27:44'),
('8455d9797f5eec64e4ec239b65a82f6e38c1538b18a8695e3d6354768045a0a8bc3f6cd5b99662da', 4, 1, 'authToken', '[]', 0, '2023-07-25 08:26:59', '2023-07-25 08:26:59', '2024-07-25 13:56:59'),
('8b6a5f5448f4ff74a819e578fe933943533e3d4b8e9d1c8cbb5a0b6532ec4f45817a73d525cf8f6f', 4, 1, 'authToken', '[]', 0, '2023-07-25 08:49:21', '2023-07-25 08:49:21', '2024-07-25 14:19:21'),
('8ccf49d979186abd4f77a20089bb4505481b754045d20618edcaca43ead531d47decab64d575621e', 1, 1, 'authToken', '[]', 0, '2023-08-23 11:10:18', '2023-08-23 11:10:18', '2024-08-23 11:10:18'),
('8d48c508c00cdf4021b3760a8c902934de9a7e1e9239a6676aa2cc83097584162304b983d93ca64a', 3, 1, 'authToken', '[]', 0, '2023-08-23 11:07:24', '2023-08-23 11:07:24', '2024-08-23 11:07:24'),
('8e70c8d5acdf73823d6c1ac297005342cfca28af54b4b0c7fd12d2f31dd653e401403f76e19d3d62', 1, 1, 'authToken', '[]', 0, '2023-08-24 06:28:10', '2023-08-24 06:28:10', '2024-08-24 06:28:10'),
('8fb0d373477c04bb198ad4f7e60de59b4d552b8f8426cc4312efa89684b09f258c1d2dec685a5eec', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:15:10', '2023-08-24 09:15:10', '2024-08-24 09:15:10'),
('920927d5a3c185419980525539bc327f85a64dc696a46ba44309a2182462b9ddc59297ea2320c544', 4, 1, 'authToken', '[]', 0, '2023-08-24 08:02:16', '2023-08-24 08:02:16', '2024-08-24 08:02:16'),
('9210ffd4627e945d6acec2e6e3440057a2773115a5159800d829d6a09c7b8c22dbf65333b515c4cd', 4, 1, 'authToken', '[]', 0, '2023-07-25 08:33:20', '2023-07-25 08:33:20', '2024-07-25 14:03:20'),
('92cdf33388c4acd5ec95e4e04207cd5e5fb4f1c4b08dfefdc11140d2f8407d4e3ce7cc4880913b80', 1, 1, 'authToken', '[]', 0, '2023-08-23 11:10:27', '2023-08-23 11:10:27', '2024-08-23 11:10:27'),
('97926e9328d327cdac3321fcb68bdd8350d3d7cf0776bd17754bae5b75034b71f6cba550718b57e7', 3, 1, 'authToken', '[]', 0, '2023-07-25 07:04:08', '2023-07-25 07:04:08', '2024-07-25 12:34:08'),
('98c481ded2709ad0828ba0051c8edf385f582db59b8166625d2f2ba203f152e4f11f378d9d05ff53', 1, 1, 'authToken', '[]', 0, '2023-08-23 12:12:04', '2023-08-23 12:12:04', '2024-08-23 12:12:04'),
('98cfacc608d4bf0937d663b3df14c2a8fa8976f06706395be356a26739b37f977856c76b42842e28', 1, 1, 'authToken', '[]', 0, '2023-08-24 09:29:13', '2023-08-24 09:29:13', '2024-08-24 09:29:13'),
('9ccd72f580fbc7f2e63c4ccd7834638ab27ed118b1ba8f613c8a42726a5cba2cd935413fa057da17', 1, 1, 'authToken', '[]', 0, '2023-08-23 08:53:08', '2023-08-23 08:53:08', '2024-08-23 08:53:08'),
('9f9ded5c8084ae0d5b535010f15f72e7d9d68b3a029b648180162db28cb0be41ac585a67f2d68dac', 4, 1, 'authToken', '[]', 0, '2023-07-25 06:42:20', '2023-07-25 06:42:20', '2024-07-25 12:12:20'),
('a45341161a0af994607724a7aa3b6d7390cce77b280216484071c2aaeb45aed09afba0b9f60644a1', 1, 1, 'authToken', '[]', 0, '2023-07-13 13:16:07', '2023-07-13 13:16:07', '2024-07-13 18:46:07'),
('a4f046ebcf885d930915fe494b749b22da2dcfe6553baa937d3699f0a010b59c338ff7de1691ff89', 1, 1, 'authToken', '[]', 0, '2023-07-20 23:23:03', '2023-07-20 23:23:03', '2024-07-21 04:53:03'),
('a622dbfd8954018160be0d21581e42e76c70836ff1fd658e644aef2a1964adbb7fba554c5c09c4ad', 4, 1, 'authToken', '[]', 0, '2023-07-25 09:00:38', '2023-07-25 09:00:38', '2024-07-25 14:30:38'),
('a7ed4cae213ada58bd42c0f4f9101c2dcd5ce7ca6950f8e302e1f3aebe2d47573d3b4035eb916155', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:13:15', '2023-08-24 09:13:15', '2024-08-24 09:13:15'),
('ac1f11167cdebdfece58deeb95dccda02ac41d08f2752cc5c82e08ed47d3b8a87bba0db9227a5b59', 4, 1, 'authToken', '[]', 0, '2023-08-24 11:15:20', '2023-08-24 11:15:20', '2024-08-24 11:15:20'),
('aff193ab0133e61807660d3203057c22f14bb14a5e91e1e500ba21c20fa57c42135fb35b4a549b37', 1, 1, 'authToken', '[]', 0, '2023-08-24 04:25:36', '2023-08-24 04:25:36', '2024-08-24 04:25:36'),
('b0f9c5ff5b5857e289c6258c1ac101ceaae19385ceaacd7a2ff41f661503c133d8f6934ca08042be', 1, 1, 'authToken', '[]', 0, '2023-07-25 07:47:34', '2023-07-25 07:47:34', '2024-07-25 13:17:34'),
('b19e76f0ab45debf7c941227e8a0462eb636befc3a1bf35cce545883e69e54acae483fa9f7c2a0fb', 4, 1, 'authToken', '[]', 0, '2023-08-24 08:58:43', '2023-08-24 08:58:43', '2024-08-24 08:58:43'),
('b2e0839ce26eed8cdf761f19306b935a23ba63b6c2bd182e044f918322ee738e746aa81eea4c77a5', 4, 1, 'authToken', '[]', 0, '2023-08-24 11:05:32', '2023-08-24 11:05:32', '2024-08-24 11:05:32'),
('b3348b4829ad3b264a5a405b43c1b49e16fece20f44b2d9ebc7f6aa3072e2eba1c446ce99e46be80', 3, 1, 'authToken', '[]', 0, '2023-08-23 06:58:27', '2023-08-23 06:58:27', '2024-08-23 06:58:27'),
('b76005297d3ee3d66823c9c930eb91e25daaee497ed3bdcb282f29ae335a48942a6c4e70674229d3', 2, 1, 'authToken', '[]', 0, '2023-07-25 06:45:14', '2023-07-25 06:45:14', '2024-07-25 12:15:14'),
('ba492e1e2c6ae6f82ae0b7063a50485b7e7df85a73e4c27545ed2121cacbd3d380aac4b9c6e1dd38', 1, 1, 'authToken', '[]', 0, '2023-08-23 06:59:04', '2023-08-23 06:59:04', '2024-08-23 06:59:04'),
('be550ec3896f13917be66256aaf1638b0e94460629eb07215f685c46d75be5743908667cb89880b3', 1, 1, 'authToken', '[]', 0, '2023-08-24 06:33:12', '2023-08-24 06:33:12', '2024-08-24 06:33:12'),
('be7192fa0817b897048b1bae3c642689cd11722190ab07e4e99344cffc8ac74db38a4da42c4c805f', 3, 1, 'authToken', '[]', 0, '2023-07-25 06:29:49', '2023-07-25 06:29:49', '2024-07-25 11:59:49'),
('bea08f5a5c2d9a16f9703bcc3b7e6cf03c4097a64d6846838467837dfa040bccfc4e5d715a090496', 1, 1, 'authToken', '[]', 0, '2023-08-24 05:21:12', '2023-08-24 05:21:12', '2024-08-24 05:21:12'),
('c15a0e5da3d9c10de8645fbe9c32c964487af9558e56429e63aea90fb4ed16b9a638e1cd424781b0', 2, 1, 'authToken', '[]', 0, '2023-07-25 07:03:46', '2023-07-25 07:03:46', '2024-07-25 12:33:46'),
('c718846a3716c8de3f9ea5c5e1493941f85010339d92cdde537b6926127966b3ea5f791bd67ccc4b', 3, 1, 'authToken', '[]', 0, '2023-08-24 07:46:19', '2023-08-24 07:46:19', '2024-08-24 07:46:19'),
('c9a9f3a98c96ff2db16f4b506ffde376e9d31c5c546bdc9b62998fb9c4c11bc366c089913514dbcf', 1, 1, 'authToken', '[]', 0, '2023-08-24 05:56:13', '2023-08-24 05:56:13', '2024-08-24 05:56:13'),
('cf100fbd640635e773bb81bdbddb1131a58c2acbcbaed8cb65977022cf53e6bd325005c12e18dc76', 4, 1, 'authToken', '[]', 0, '2023-08-24 08:01:06', '2023-08-24 08:01:06', '2024-08-24 08:01:06'),
('d29388a3722436a832ebdb6834636a4387b0792439f718868c306f35d0f27fb0143af0d3f1c525dc', 4, 1, 'authToken', '[]', 0, '2023-07-25 08:02:30', '2023-07-25 08:02:30', '2024-07-25 13:32:30'),
('e03fffd534d54f1afedea82413dcfede6ea5de0c805ef2846343d22f7126c81af13e93505f99fe57', 1, 1, 'authToken', '[]', 0, '2023-08-24 11:24:55', '2023-08-24 11:24:55', '2024-08-24 11:24:55'),
('e9f288a38256110a7d15d7a1c1ba6326d80623421f6f6351ef8a28f969a265cfe84d97fbb8ac5720', 4, 1, 'authToken', '[]', 0, '2023-08-24 09:13:29', '2023-08-24 09:13:29', '2024-08-24 09:13:29'),
('f072d289d76f22c83ed4175e9603b6c4f347d44cd362419aa670231bdc9f1fc2cdd9c8f87bb1a611', 3, 1, 'authToken', '[]', 0, '2023-08-24 09:02:38', '2023-08-24 09:02:38', '2024-08-24 09:02:38'),
('f111f1965bbe6ffe9112f41319f29f4895435dd0d02f60a281ae5ab29bdf5c142e320db5de1d6ada', 1, 1, 'authToken', '[]', 0, '2023-08-24 06:19:37', '2023-08-24 06:19:37', '2024-08-24 06:19:37'),
('f50d0ab10b8146690fad1a10152ab715aba82ec72ec5371122ff359cb3bd7170dd5ede1ea061280c', 1, 1, 'authToken', '[]', 0, '2023-08-24 06:45:26', '2023-08-24 06:45:26', '2024-08-24 06:45:26'),
('f8bf480efbf4937376831a69cf0eb12acac81ea67ca3b6014e8b19c7e0d99514c70cfd8e5aae6281', 1, 1, 'authToken', '[]', 0, '2023-08-23 12:11:56', '2023-08-23 12:11:56', '2024-08-23 12:11:56'),
('fd53243f2a1c5daab14c7fbdada057e8fcee13429ec5d12c068bc73d23615186df342ff1bc728224', 1, 1, 'authToken', '[]', 0, '2023-08-23 12:12:00', '2023-08-23 12:12:00', '2024-08-23 12:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'eGrocer Personal Access Client', 'x6g7GZyTfiUxLzkBaiTQ4rHgeMAcS2Qq8d3cuJwE', NULL, 'http://localhost', 1, 0, 0, '2023-07-13 13:14:17', '2023-07-13 13:14:17'),
(2, NULL, 'eGrocer Password Grant Client', 'jjhIsPxQgVYhULZuKko3kSLDMNiNQFzPEaioPmEy', 'users', 'http://localhost', 0, 1, 0, '2023-07-13 13:14:17', '2023-07-13 13:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-07-13 13:14:17', '2023-07-13 13:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) NOT NULL,
  `position` varchar(191) NOT NULL,
  `section_position` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_boy_bonus_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT ' Delivery boy bonus Details for bonus commission amount' CHECK (json_valid(`delivery_boy_bonus_details`)),
  `delivery_boy_bonus_amount` double DEFAULT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `orders_id` varchar(191) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `order_note` text DEFAULT NULL,
  `total` double(8,2) NOT NULL,
  `delivery_charge` double(8,2) NOT NULL,
  `tax_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `tax_percentage` double(8,2) NOT NULL DEFAULT 0.00,
  `wallet_balance` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `promo_code` varchar(191) DEFAULT NULL,
  `promo_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `final_total` double(8,2) DEFAULT NULL,
  `payment_method` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `delivery_time` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `active_status` varchar(191) NOT NULL,
  `order_from` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `area_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `delivery_boy_id`, `delivery_boy_bonus_details`, `delivery_boy_bonus_amount`, `transaction_id`, `orders_id`, `otp`, `mobile`, `order_note`, `total`, `delivery_charge`, `tax_amount`, `tax_percentage`, `wallet_balance`, `discount`, `promo_code`, `promo_discount`, `final_total`, `payment_method`, `address`, `latitude`, `longitude`, `delivery_time`, `status`, `active_status`, `order_from`, `pincode_id`, `address_id`, `area_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '{\"final_total\":280,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7663551389356', 0, '98765463210', '', 180.00, 100.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 280.00, 'COD', 'Bhuj ITI Road', '23.2419997', '69.6669324', '24-8-2023 Whole Day', '[[2,\"24-08-2023 05:18:14am\"]]', '6', 0, NULL, 1, 0, '2023-08-24 05:18:14', '2023-08-24 07:09:11', NULL),
(2, 1, 1, '{\"final_total\":460,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '16789733948759', 0, '98765463210', '', 720.00, 100.00, 0.00, 0.00, 0.00, 0.00, 'Upto 50% Sale(360)', 360.00, 460.00, 'COD', 'Bhuj ITI Road', '23.2419997', '69.6669324', '24-8-2023 Whole Day', '[[2,\"24-08-2023 05:26:44am\"]]', '5', 0, NULL, 1, 0, '2023-08-24 05:26:44', '2023-08-24 09:50:27', NULL),
(3, 1, 1, '{\"final_total\":130,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '9552796451033', 0, '98765463210', '', 30.00, 100.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 130.00, 'COD', 'Bhuj ITI Road', '23.2419997', '69.6669324', '25-8-2023 Whole Day', '[[2,\"24-08-2023 06:16:19am\"]]', '5', 0, NULL, 1, 0, '2023-08-24 06:16:19', '2023-08-24 09:50:23', NULL),
(4, 1, 1, '{\"final_total\":280,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7179417345490', 0, '98765463210', '', 180.00, 100.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 280.00, 'COD', 'Bhuj ITI Road', '23.2419997', '69.6669324', '24-8-2023 Whole Day', '[[2,\"24-08-2023 06:45:48am\"]]', '3', 0, NULL, 1, 0, '2023-08-24 06:45:48', '2023-08-24 09:51:13', NULL),
(5, 1, 0, NULL, NULL, 0, '13593758065053', 0, '34535345354', '', 918.00, 100.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, 1018.00, 'COD', 'Dhaneti-Ratnal Road', '23.2419997', '69.6669324', '24-8-2023 Whole Day', '[[2,\"24-08-2023 10:04:50am\"]]', '2', 0, NULL, 2, 0, '2023-08-24 10:04:50', '2023-08-24 10:04:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_bank_transfers`
--

CREATE TABLE `order_bank_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `attachment` longtext NOT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `orders_id` varchar(191) NOT NULL,
  `product_name` text DEFAULT NULL,
  `variant_name` text DEFAULT NULL,
  `product_variant_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discounted_price` double NOT NULL,
  `tax_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `tax_percentage` double(8,2) NOT NULL DEFAULT 0.00,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `sub_total` double(8,2) NOT NULL,
  `status` varchar(191) NOT NULL,
  `active_status` varchar(191) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `is_credited` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `order_id`, `orders_id`, `product_name`, `variant_name`, `product_variant_id`, `delivery_boy_id`, `quantity`, `price`, `discounted_price`, `tax_amount`, `tax_percentage`, `discount`, `sub_total`, `status`, `active_status`, `seller_id`, `is_credited`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '7663551389356', 'Delicious Butter', '100', 1, 0, 1, 120.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"24-08-2023 05:18:14am\"]]', '2', 1, 0, '2023-08-24 05:18:14', '2023-08-24 05:18:14', NULL),
(2, 1, 1, '7663551389356', 'Chese', '150', 5, 0, 1, 150.00, 80, 0.00, 0.00, 0.00, 80.00, '[[2,\"24-08-2023 05:18:14am\"]]', '2', 1, 0, '2023-08-24 05:18:14', '2023-08-24 05:18:14', NULL),
(3, 1, 2, '16789733948759', 'Delicious Butter', '100', 1, 0, 4, 120.00, 100, 0.00, 0.00, 0.00, 400.00, '[[2,\"24-08-2023 05:26:44am\"]]', '2', 1, 0, '2023-08-24 05:26:44', '2023-08-24 05:26:44', NULL),
(4, 1, 2, '16789733948759', 'Chese', '150', 5, 0, 4, 150.00, 80, 0.00, 0.00, 0.00, 320.00, '[[2,\"24-08-2023 05:26:44am\"]]', '2', 1, 0, '2023-08-24 05:26:44', '2023-08-24 05:26:44', NULL),
(5, 1, 3, '9552796451033', 'Orange Juice', '100ML', 23, 0, 2, 20.00, 15, 0.00, 0.00, 0.00, 30.00, '[[2,\"24-08-2023 06:16:19am\"]]', '2', 1, 0, '2023-08-24 06:16:19', '2023-08-24 06:16:19', NULL),
(6, 1, 4, '7179417345490', 'Delicious Butter', '100GM', 1, 0, 1, 120.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"24-08-2023 06:45:48am\"]]', '2', 1, 0, '2023-08-24 06:45:48', '2023-08-24 06:45:48', NULL),
(7, 1, 4, '7179417345490', 'Chese', '150KG', 5, 0, 1, 150.00, 80, 0.00, 0.00, 0.00, 80.00, '[[2,\"24-08-2023 06:45:48am\"]]', '2', 1, 0, '2023-08-24 06:45:48', '2023-08-24 06:45:48', NULL),
(8, 1, 5, '13593758065053', 'Delicious Butter', '100GM', 1, 0, 1, 120.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"24-08-2023 10:04:50am\"]]', '2', 1, 0, '2023-08-24 10:04:50', '2023-08-24 10:04:50', NULL),
(9, 1, 5, '13593758065053', 'Chese', '150KG', 5, 0, 1, 150.00, 80, 0.00, 0.00, 0.00, 80.00, '[[2,\"24-08-2023 10:04:50am\"]]', '2', 1, 0, '2023-08-24 10:04:50', '2023-08-24 10:04:50', NULL),
(10, 1, 5, '13593758065053', 'Kiwi Juice', '100ML', 17, 0, 1, 100.00, 80, 0.00, 0.00, 0.00, 80.00, '[[2,\"24-08-2023 10:04:50am\"]]', '2', 1, 0, '2023-08-24 10:04:50', '2023-08-24 10:04:50', NULL),
(11, 1, 5, '13593758065053', 'Orange Juice', '300ML', 24, 0, 1, 300.00, 250, 0.00, 0.00, 0.00, 250.00, '[[2,\"24-08-2023 10:04:50am\"]]', '2', 1, 0, '2023-08-24 10:04:50', '2023-08-24 10:04:50', NULL),
(12, 1, 5, '13593758065053', 'Orange Juice', '600ML', 25, 0, 1, 600.00, 400, 0.00, 0.00, 0.00, 400.00, '[[2,\"24-08-2023 10:04:50am\"]]', '2', 1, 0, '2023-08-24 10:04:50', '2023-08-24 10:04:50', NULL),
(13, 1, 5, '13593758065053', 'Water Bottle', '100ML', 29, 0, 1, 10.00, 8, 0.00, 0.00, 0.00, 8.00, '[[2,\"24-08-2023 10:04:50am\"]]', '2', 1, 0, '2023-08-24 10:04:50', '2023-08-24 10:04:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL COMMENT '0 - Script, if not 0 id of related table',
  `user_type` int(11) NOT NULL COMMENT '0 - Script, 1 - Admin, 2 - User',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `order_id`, `order_item_id`, `status`, `created_by`, `user_type`, `created_at`) VALUES
(1, '1', 0, '2', 1, 2, '2023-08-24 05:18:14'),
(2, '2', 0, '2', 1, 2, '2023-08-24 05:26:44'),
(3, '3', 0, '2', 1, 2, '2023-08-24 06:16:20'),
(4, '3', 0, '3', 1, 1, '2023-08-24 06:34:24'),
(5, '3', 0, '5', 1, 1, '2023-08-24 06:36:42'),
(6, '2', 0, '3', 1, 1, '2023-08-24 06:42:53'),
(7, '2', 0, '5', 1, 1, '2023-08-24 06:43:32'),
(8, '1', 0, '3', 1, 1, '2023-08-24 06:45:48'),
(9, '4', 0, '2', 1, 2, '2023-08-24 06:45:49'),
(10, '1', 0, '6', 1, 1, '2023-08-24 06:47:29'),
(11, '4', 0, '3', 4, 4, '2023-08-24 09:51:13'),
(12, '5', 0, '2', 1, 2, '2023-08-24 10:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_status_lists`
--

CREATE TABLE `order_status_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_lists`
--

INSERT INTO `order_status_lists` (`id`, `status`) VALUES
(1, 'Payment Pending'),
(2, 'Received'),
(3, 'Processed'),
(4, 'Shipped'),
(5, 'Out For Delivery'),
(6, 'Delivered'),
(7, 'Cancelled'),
(8, 'Returned');

-- --------------------------------------------------------

--
-- Table structure for table `order_trackings`
--

CREATE TABLE `order_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `shiprocket_order_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `courier_company_id` int(11) DEFAULT NULL,
  `awb_code` varchar(191) DEFAULT NULL,
  `tracking_url` varchar(191) DEFAULT NULL,
  `pickup_status` int(11) NOT NULL,
  `pickup_scheduled_date` varchar(191) NOT NULL,
  `pickup_token_number` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `others` varchar(191) NOT NULL,
  `pickup_generated_date` varchar(191) NOT NULL,
  `data` varchar(191) NOT NULL,
  `date` varchar(191) NOT NULL,
  `is_canceled` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_notifications`
--

CREATE TABLE `panel_notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `panel_notifications`
--

INSERT INTO `panel_notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('09cde7b1-4fbc-407d-8747-addb777a8bfe', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":5,\"order_id\":3,\"text\":\"Order  #3 has been Out For Delivery\"}', NULL, '2023-08-24 06:36:52', '2023-08-24 06:36:52'),
('0cc333e5-9f48-4d7a-9e36-9ca4edc193a0', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":\"new\",\"order_id\":4,\"text\":\"You have Received new order  #4\"}', NULL, '2023-08-24 06:45:49', '2023-08-24 06:45:49'),
('0da323c4-d042-4a06-94f8-42184c99bf51', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":\"3\",\"order_id\":4,\"text\":\"Order  #4 has been Processed\"}', NULL, '2023-08-24 09:51:24', '2023-08-24 09:51:24'),
('10ac5cd6-dede-4fa5-a48c-802568628de7', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":\"new\",\"order_id\":4,\"text\":\"You have Received new order  #4\"}', NULL, '2023-08-24 06:45:49', '2023-08-24 06:45:49'),
('10fef83b-88a6-4d64-bdaf-de727f8c5386', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":5,\"order_id\":3,\"text\":\"Order  #3 has been Out For Delivery\"}', NULL, '2023-08-24 06:36:52', '2023-08-24 06:36:52'),
('1c1fea99-cc40-4e1d-bb47-93261f869fbc', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":\"new\",\"order_id\":1,\"text\":\"You have Received new order  #1\"}', NULL, '2023-08-24 05:18:14', '2023-08-24 05:18:14'),
('20c730b7-d2b2-40e5-aca8-841e1076094b', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":\"new\",\"order_id\":5,\"text\":\"You have Received new order  #5\"}', NULL, '2023-08-24 10:04:51', '2023-08-24 10:04:51'),
('251f294b-6ac1-4b1b-b0a3-e3cff7bce9dc', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":3,\"order_id\":1,\"text\":\"Order  #1 has been Processed\"}', NULL, '2023-08-24 06:45:58', '2023-08-24 06:45:58'),
('2f60a319-61d1-4fca-b5c2-3cbdc546e3de', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":5,\"order_id\":2,\"text\":\"Order  #2 has been Out For Delivery\"}', NULL, '2023-08-24 06:43:42', '2023-08-24 06:43:42'),
('310e9514-1379-423d-8b03-df25da6e05ca', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":3,\"order_id\":1,\"text\":\"Order  #1 has been Processed\"}', NULL, '2023-08-24 06:45:58', '2023-08-24 06:45:58'),
('3223fd13-d417-4928-b386-b4e4e43c630e', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":5,\"order_id\":2,\"text\":\"Order  #2 has been Out For Delivery\"}', NULL, '2023-08-24 06:43:42', '2023-08-24 06:43:42'),
('3229c72c-f8fc-49bc-9e13-ee0f16cdc10c', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":\"new\",\"order_id\":4,\"text\":\"You have Received new order  #4\"}', NULL, '2023-08-24 06:45:49', '2023-08-24 06:45:49'),
('3518bf66-23e0-4f5e-9d68-15683e13c997', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":3,\"order_id\":2,\"text\":\"Order  #2 has been Processed\"}', NULL, '2023-08-24 06:43:03', '2023-08-24 06:43:03'),
('3df34dd1-cdad-4fc6-9978-a5eef95130cd', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":3,\"order_id\":3,\"text\":\"Order  #3 has been Processed\"}', NULL, '2023-08-24 06:34:35', '2023-08-24 06:34:35'),
('4526552d-7799-4065-adec-6c007a348b4c', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":\"new\",\"order_id\":1,\"text\":\"You have Received new order  #1\"}', NULL, '2023-08-24 05:18:14', '2023-08-24 05:18:14'),
('4cdcdfaf-7f76-4e8c-9393-af8aa48a81f4', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":6,\"order_id\":1,\"text\":\"Order  #1 has been Delivered\"}', NULL, '2023-08-24 06:47:40', '2023-08-24 06:47:40'),
('55200712-043c-436b-a10d-f3a72d50bafe', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":\"new\",\"order_id\":2,\"text\":\"You have Received new order  #2\"}', NULL, '2023-08-24 05:26:44', '2023-08-24 05:26:44'),
('563f759d-0cfd-4371-9f54-dedb1307b0ce', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":\"new\",\"order_id\":3,\"text\":\"You have Received new order  #3\"}', NULL, '2023-08-24 06:16:20', '2023-08-24 06:16:20'),
('5972fb3d-9295-4ea0-9b83-86b3995067ca', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":3,\"order_id\":2,\"text\":\"Order  #2 has been Processed\"}', NULL, '2023-08-24 06:43:03', '2023-08-24 06:43:03'),
('59da493a-7691-42a7-a002-b9107f843f68', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":\"new\",\"order_id\":2,\"text\":\"You have Received new order  #2\"}', NULL, '2023-08-24 05:26:44', '2023-08-24 05:26:44'),
('5d2da084-a1f0-419d-bcd2-c4c7c0d9b243', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":5,\"order_id\":2,\"text\":\"Order  #2 has been Out For Delivery\"}', NULL, '2023-08-24 06:43:42', '2023-08-24 06:43:42'),
('5fd0bd0f-547f-43b2-ba15-7de19ebacf31', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":5,\"order_id\":3,\"text\":\"Order  #3 has been Out For Delivery\"}', NULL, '2023-08-24 06:36:52', '2023-08-24 06:36:52'),
('6c0d511e-cd07-4265-89d1-d17a9c3e5d73', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":\"new\",\"order_id\":2,\"text\":\"You have Received new order  #2\"}', NULL, '2023-08-24 05:26:44', '2023-08-24 05:26:44'),
('6e64174c-795f-42d4-9335-271c117fbe11', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":3,\"order_id\":1,\"text\":\"Order  #1 has been Processed\"}', NULL, '2023-08-24 06:45:58', '2023-08-24 06:45:58'),
('6f063afa-b850-4803-8dc5-3b362a9a8f7c', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":5,\"order_id\":3,\"text\":\"Order  #3 has been Out For Delivery\"}', NULL, '2023-08-24 06:36:52', '2023-08-24 06:36:52'),
('703e967b-a7ed-44ef-bdd0-d179dc02b1ad', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":6,\"order_id\":1,\"text\":\"Order  #1 has been Delivered\"}', NULL, '2023-08-24 06:47:40', '2023-08-24 06:47:40'),
('719760cd-330d-4f53-8d35-89df7b43a364', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":3,\"order_id\":3,\"text\":\"Order  #3 has been Processed\"}', NULL, '2023-08-24 06:34:35', '2023-08-24 06:34:35'),
('7ac5dd75-4f1d-4f41-9661-da01a5e91a56', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":\"new\",\"order_id\":1,\"text\":\"You have Received new order  #1\"}', NULL, '2023-08-24 05:18:14', '2023-08-24 05:18:14'),
('81f5115c-bc4a-4977-98d4-6200ca721506', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":\"new\",\"order_id\":3,\"text\":\"You have Received new order  #3\"}', NULL, '2023-08-24 06:16:20', '2023-08-24 06:16:20'),
('83d12fe7-38f6-4243-91b0-c699bfe3ec90', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":\"3\",\"order_id\":4,\"text\":\"Order  #4 has been Processed\"}', NULL, '2023-08-24 09:51:24', '2023-08-24 09:51:24'),
('89eaae63-b999-4601-9130-3442954cd7bb', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":5,\"order_id\":3,\"text\":\"Order  #3 has been Out For Delivery\"}', NULL, '2023-08-24 06:36:52', '2023-08-24 06:36:52'),
('8ce6ef1e-69eb-40d6-ab9a-64b4ccf3a1fc', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":3,\"order_id\":1,\"text\":\"Order  #1 has been Processed\"}', NULL, '2023-08-24 06:45:58', '2023-08-24 06:45:58'),
('8e3f73cf-50e2-40d0-8e46-8f1264e0d54b', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":\"new\",\"order_id\":4,\"text\":\"You have Received new order  #4\"}', NULL, '2023-08-24 06:45:49', '2023-08-24 06:45:49'),
('948813ca-32ae-4a68-965a-f0810fa98d20', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":\"new\",\"order_id\":3,\"text\":\"You have Received new order  #3\"}', NULL, '2023-08-24 06:16:20', '2023-08-24 06:16:20'),
('9a36ea0c-109a-4c20-9057-df68d721b8c9', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":6,\"order_id\":1,\"text\":\"Order  #1 has been Delivered\"}', NULL, '2023-08-24 06:47:40', '2023-08-24 06:47:40'),
('a2632f18-b389-4a12-b964-9859b3f1d22a', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":6,\"order_id\":1,\"text\":\"Order  #1 has been Delivered\"}', NULL, '2023-08-24 06:47:40', '2023-08-24 06:47:40'),
('a3d23a44-3cff-4645-97c9-10b2b0aa0855', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":3,\"order_id\":3,\"text\":\"Order  #3 has been Processed\"}', NULL, '2023-08-24 06:34:35', '2023-08-24 06:34:35'),
('a839bf3c-398d-4fc4-bec5-e55a47605df9', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":5,\"order_id\":2,\"text\":\"Order  #2 has been Out For Delivery\"}', NULL, '2023-08-24 06:43:42', '2023-08-24 06:43:42'),
('a909aaaf-3ad5-43e9-9592-196f5a8f8f0d', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":3,\"order_id\":2,\"text\":\"Order  #2 has been Processed\"}', NULL, '2023-08-24 06:43:03', '2023-08-24 06:43:03'),
('ac0b299b-db6d-4458-9147-ff54169606e9', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":\"new\",\"order_id\":4,\"text\":\"You have Received new order  #4\"}', NULL, '2023-08-24 06:45:49', '2023-08-24 06:45:49'),
('b18c27d9-81e0-4166-bdca-28f5575a7f85', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":5,\"order_id\":2,\"text\":\"Order  #2 has been Out For Delivery\"}', NULL, '2023-08-24 06:43:42', '2023-08-24 06:43:42'),
('b5b07d16-9e65-40de-a2a6-5396b2feb80d', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":3,\"order_id\":3,\"text\":\"Order  #3 has been Processed\"}', NULL, '2023-08-24 06:34:35', '2023-08-24 06:34:35'),
('d01205ad-c7f0-4c89-8246-ad704a27f8c8', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":\"new\",\"order_id\":2,\"text\":\"You have Received new order  #2\"}', NULL, '2023-08-24 05:26:44', '2023-08-24 05:26:44'),
('d0955d91-2d59-4431-b157-58dcdd3fba9c', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":\"new\",\"order_id\":5,\"text\":\"You have Received new order  #5\"}', NULL, '2023-08-24 10:04:51', '2023-08-24 10:04:51'),
('d16f6fa0-34dd-4e06-a672-f186c3ff6ec9', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 2, '{\"type\":\"new\",\"order_id\":1,\"text\":\"You have Received new order  #1\"}', NULL, '2023-08-24 05:18:14', '2023-08-24 05:18:14'),
('d2751692-1543-40c6-bb79-330cd6640bdf', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":6,\"order_id\":1,\"text\":\"Order  #1 has been Delivered\"}', NULL, '2023-08-24 06:47:40', '2023-08-24 06:47:40'),
('dab2598d-ce6d-4ab3-8b95-255b89652b02', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":3,\"order_id\":2,\"text\":\"Order  #2 has been Processed\"}', NULL, '2023-08-24 06:43:03', '2023-08-24 06:43:03'),
('e370451e-85e8-4080-a25a-2f526221eae2', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 4, '{\"type\":\"new\",\"order_id\":3,\"text\":\"You have Received new order  #3\"}', NULL, '2023-08-24 06:16:20', '2023-08-24 06:16:20'),
('e9d6f821-7a6e-40e2-ade5-190ec33a1256', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":3,\"order_id\":1,\"text\":\"Order  #1 has been Processed\"}', NULL, '2023-08-24 06:45:58', '2023-08-24 06:45:58'),
('ec23b787-9e48-49c8-985a-60af40140d24', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":\"new\",\"order_id\":3,\"text\":\"You have Received new order  #3\"}', NULL, '2023-08-24 06:16:20', '2023-08-24 06:16:20'),
('ecbd56d5-e6ec-46c0-ae6a-ee3636241f29', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 1, '{\"type\":\"new\",\"order_id\":1,\"text\":\"You have Received new order  #1\"}', NULL, '2023-08-24 05:18:14', '2023-08-24 05:18:14'),
('f4f5ef08-3a76-4b66-b1c6-5c9d7db4a4fd', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 5, '{\"type\":\"new\",\"order_id\":2,\"text\":\"You have Received new order  #2\"}', NULL, '2023-08-24 05:26:44', '2023-08-24 05:26:44'),
('f9fec209-d227-4917-a464-193f424e05a7', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":3,\"order_id\":3,\"text\":\"Order  #3 has been Processed\"}', NULL, '2023-08-24 06:34:35', '2023-08-24 06:34:35'),
('ff0e48f6-5c4c-4d22-a089-6b0429aba464', 'App\\Notifications\\OrderNotification', 'App\\Models\\Admin', 3, '{\"type\":3,\"order_id\":2,\"text\":\"Order  #2 has been Processed\"}', NULL, '2023-08-24 06:43:03', '2023-08-24 06:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `txnid` varchar(191) NOT NULL,
  `payment_amount` decimal(8,2) NOT NULL,
  `payment_status` varchar(191) NOT NULL,
  `itemid` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(191) NOT NULL,
  `payment_address` varchar(191) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'manage_dashboard', 'web', 1, '2023-07-13 13:13:08', '2023-07-13 13:13:08'),
(2, 'order_list', 'web', 2, '2023-07-13 13:13:08', '2023-07-13 13:13:08'),
(3, 'order_update', 'web', 2, '2023-07-13 13:13:08', '2023-07-13 13:13:08'),
(4, 'order_delete', 'web', 2, '2023-07-13 13:13:08', '2023-07-13 13:13:08'),
(5, 'category_list', 'web', 3, '2023-07-13 13:13:09', '2023-07-13 13:13:09'),
(6, 'category_create', 'web', 3, '2023-07-13 13:13:09', '2023-07-13 13:13:09'),
(7, 'category_update', 'web', 3, '2023-07-13 13:13:09', '2023-07-13 13:13:09'),
(8, 'category_delete', 'web', 3, '2023-07-13 13:13:09', '2023-07-13 13:13:09'),
(9, 'manage_categories_order', 'web', 3, '2023-07-13 13:13:09', '2023-07-13 13:13:09'),
(10, 'product_list', 'web', 4, '2023-07-13 13:13:10', '2023-07-13 13:13:10'),
(11, 'product_create', 'web', 4, '2023-07-13 13:13:10', '2023-07-13 13:13:10'),
(12, 'product_update', 'web', 4, '2023-07-13 13:13:10', '2023-07-13 13:13:10'),
(13, 'product_delete', 'web', 4, '2023-07-13 13:13:10', '2023-07-13 13:13:10'),
(14, 'manage_media', 'web', 4, '2023-07-13 13:13:10', '2023-07-13 13:13:10'),
(15, 'manage_product_bulk_upload', 'web', 4, '2023-07-13 13:13:10', '2023-07-13 13:13:10'),
(16, 'manage_product_order', 'web', 4, '2023-07-13 13:13:10', '2023-07-13 13:13:10'),
(17, 'seller_list', 'web', 5, '2023-07-13 13:13:11', '2023-07-13 13:13:11'),
(18, 'seller_create', 'web', 5, '2023-07-13 13:13:11', '2023-07-13 13:13:11'),
(19, 'seller_update', 'web', 5, '2023-07-13 13:13:11', '2023-07-13 13:13:11'),
(20, 'seller_delete', 'web', 5, '2023-07-13 13:13:12', '2023-07-13 13:13:12'),
(21, 'home_slider_image_list', 'web', 6, '2023-07-13 13:13:12', '2023-07-13 13:13:12'),
(22, 'home_slider_image_create', 'web', 6, '2023-07-13 13:13:12', '2023-07-13 13:13:12'),
(23, 'home_slider_image_update', 'web', 6, '2023-07-13 13:13:12', '2023-07-13 13:13:12'),
(24, 'home_slider_image_delete', 'web', 6, '2023-07-13 13:13:12', '2023-07-13 13:13:12'),
(25, 'new_offer_image_list', 'web', 7, '2023-07-13 13:13:13', '2023-07-13 13:13:13'),
(26, 'new_offer_image_create', 'web', 7, '2023-07-13 13:13:13', '2023-07-13 13:13:13'),
(27, 'new_offer_image_update', 'web', 7, '2023-07-13 13:13:13', '2023-07-13 13:13:13'),
(28, 'new_offer_image_delete', 'web', 7, '2023-07-13 13:13:13', '2023-07-13 13:13:13'),
(29, 'promo_code_list', 'web', 8, '2023-07-13 13:13:14', '2023-07-13 13:13:14'),
(30, 'promo_code_create', 'web', 8, '2023-07-13 13:13:14', '2023-07-13 13:13:14'),
(31, 'promo_code_update', 'web', 8, '2023-07-13 13:13:14', '2023-07-13 13:13:14'),
(32, 'promo_code_delete', 'web', 8, '2023-07-13 13:13:14', '2023-07-13 13:13:14'),
(33, 'return_request_list', 'web', 9, '2023-07-13 13:13:15', '2023-07-13 13:13:15'),
(34, 'return_request_update', 'web', 9, '2023-07-13 13:13:15', '2023-07-13 13:13:15'),
(35, 'return_request_delete', 'web', 9, '2023-07-13 13:13:15', '2023-07-13 13:13:15'),
(36, 'withdrawal_request_list', 'web', 10, '2023-07-13 13:13:16', '2023-07-13 13:13:16'),
(37, 'withdrawal_request_update', 'web', 10, '2023-07-13 13:13:16', '2023-07-13 13:13:16'),
(38, 'withdrawal_request_delete', 'web', 10, '2023-07-13 13:13:16', '2023-07-13 13:13:16'),
(39, 'delivery_boy_list', 'web', 11, '2023-07-13 13:13:16', '2023-07-13 13:13:16'),
(40, 'delivery_boy_create', 'web', 11, '2023-07-13 13:13:17', '2023-07-13 13:13:17'),
(41, 'delivery_boy_update', 'web', 11, '2023-07-13 13:13:17', '2023-07-13 13:13:17'),
(42, 'delivery_boy_delete', 'web', 11, '2023-07-13 13:13:17', '2023-07-13 13:13:17'),
(43, 'fund_transfers_list', 'web', 11, '2023-07-13 13:13:17', '2023-07-13 13:13:17'),
(44, 'fund_transfers_create', 'web', 11, '2023-07-13 13:13:17', '2023-07-13 13:13:17'),
(45, 'cash_collection_list', 'web', 11, '2023-07-13 13:13:17', '2023-07-13 13:13:17'),
(46, 'cash_collection_create', 'web', 11, '2023-07-13 13:13:17', '2023-07-13 13:13:17'),
(47, 'notification_list', 'web', 12, '2023-07-13 13:13:19', '2023-07-13 13:13:19'),
(48, 'notification_create', 'web', 12, '2023-07-13 13:13:19', '2023-07-13 13:13:19'),
(49, 'notification_delete', 'web', 12, '2023-07-13 13:13:19', '2023-07-13 13:13:19'),
(50, 'manage_time_slots', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(51, 'time_slot_create', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(52, 'time_slot_update', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(53, 'time_slot_delete', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(54, 'manage_store_settings', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(55, 'manage_units', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(56, 'unit_create', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(57, 'unit_update', 'web', 13, '2023-07-13 13:13:20', '2023-07-13 13:13:20'),
(58, 'manage_payment_methods', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(59, 'manage_Notification_settings', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(60, 'manage_contact_us', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(61, 'manage_about_us', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(62, 'manage_privacy_policy', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(63, 'manage_privacy_policy_delivery_boy', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(64, 'manage_privacy_policy_manager_app', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(65, 'manage_privacy_policy_seller_app', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(66, 'manage_secret_key', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(67, 'manage_shipping_methods', 'web', 13, '2023-07-13 13:13:21', '2023-07-13 13:13:21'),
(68, 'manage_system_registration', 'web', 13, '2023-07-13 13:13:22', '2023-07-13 13:13:22'),
(69, 'general_settings', 'web', 14, '2023-07-13 13:13:25', '2023-07-13 13:13:25'),
(70, 'manage_social_media_list', 'web', 14, '2023-07-13 13:13:25', '2023-07-13 13:13:25'),
(71, 'manage_social_media_create', 'web', 14, '2023-07-13 13:13:25', '2023-07-13 13:13:25'),
(72, 'manage_social_media_delete', 'web', 14, '2023-07-13 13:13:25', '2023-07-13 13:13:25'),
(73, 'manage_social_media_update', 'web', 14, '2023-07-13 13:13:25', '2023-07-13 13:13:25'),
(74, 'manage_about', 'web', 14, '2023-07-13 13:13:25', '2023-07-13 13:13:25'),
(75, 'manage_policies', 'web', 14, '2023-07-13 13:13:26', '2023-07-13 13:13:26'),
(76, 'city_list', 'web', 15, '2023-07-13 13:13:27', '2023-07-13 13:13:27'),
(77, 'city_create', 'web', 15, '2023-07-13 13:13:27', '2023-07-13 13:13:27'),
(78, 'city_update', 'web', 15, '2023-07-13 13:13:27', '2023-07-13 13:13:27'),
(79, 'city_delete', 'web', 15, '2023-07-13 13:13:27', '2023-07-13 13:13:27'),
(80, 'manage_deliverable_area', 'web', 15, '2023-07-13 13:13:27', '2023-07-13 13:13:27'),
(81, 'featured_section_list', 'web', 16, '2023-07-13 13:13:28', '2023-07-13 13:13:28'),
(82, 'featured_section_create', 'web', 16, '2023-07-13 13:13:28', '2023-07-13 13:13:28'),
(83, 'featured_section_update', 'web', 16, '2023-07-13 13:13:28', '2023-07-13 13:13:28'),
(84, 'featured_section_delete', 'web', 16, '2023-07-13 13:13:28', '2023-07-13 13:13:28'),
(85, 'customer_list', 'web', 17, '2023-07-13 13:13:29', '2023-07-13 13:13:29'),
(86, 'customer_update', 'web', 17, '2023-07-13 13:13:29', '2023-07-13 13:13:29'),
(87, 'customer_delete', 'web', 17, '2023-07-13 13:13:29', '2023-07-13 13:13:29'),
(88, 'manage_wishlists', 'web', 17, '2023-07-13 13:13:29', '2023-07-13 13:13:29'),
(89, 'transaction_list', 'web', 17, '2023-07-13 13:13:29', '2023-07-13 13:13:29'),
(90, 'manage_customer_wallet', 'web', 17, '2023-07-13 13:13:29', '2023-07-13 13:13:29'),
(91, 'product_sales_reports', 'web', 18, '2023-07-13 13:13:31', '2023-07-13 13:13:31'),
(92, 'sales_reports', 'web', 18, '2023-07-13 13:13:31', '2023-07-13 13:13:31'),
(93, 'faq_list', 'web', 19, '2023-07-13 13:13:32', '2023-07-13 13:13:32'),
(94, 'faq_create', 'web', 19, '2023-07-13 13:13:32', '2023-07-13 13:13:32'),
(95, 'faq_update', 'web', 19, '2023-07-13 13:13:32', '2023-07-13 13:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `permission_categories`
--

CREATE TABLE `permission_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_categories`
--

INSERT INTO `permission_categories` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', NULL, NULL),
(2, 'order', 'web', NULL, NULL),
(3, 'category', 'web', NULL, NULL),
(4, 'product', 'web', NULL, NULL),
(5, 'seller', 'web', NULL, NULL),
(6, 'home_slider_image', 'web', NULL, NULL),
(7, 'new_offer_image', 'web', NULL, NULL),
(8, 'promo_code', 'web', NULL, NULL),
(9, 'return_request', 'web', NULL, NULL),
(10, 'withdrawal_request', 'web', NULL, NULL),
(11, 'delivery_boy', 'web', NULL, NULL),
(12, 'send_notification', 'web', NULL, NULL),
(13, 'system', 'web', NULL, NULL),
(14, 'web_settings', 'web', NULL, NULL),
(15, 'location', 'web', NULL, NULL),
(16, 'featured_section', 'web', NULL, NULL),
(17, 'customer', 'web', NULL, NULL),
(18, 'report', 'web', NULL, NULL),
(19, 'faq', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_locations`
--

CREATE TABLE `pickup_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) NOT NULL,
  `pickup_location` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `pin_code` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `verified` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pincode` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `row_order` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `tax_id` tinyint(4) DEFAULT 0,
  `brand_id` int(11) DEFAULT 0,
  `slug` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `indicator` tinyint(4) DEFAULT NULL COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `manufacturer` varchar(191) DEFAULT NULL,
  `made_in` varchar(191) DEFAULT NULL,
  `return_status` tinyint(4) DEFAULT NULL,
  `cancelable_status` tinyint(4) DEFAULT NULL,
  `till_status` varchar(191) DEFAULT NULL,
  `image` text NOT NULL,
  `other_images` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_approved` int(11) DEFAULT NULL,
  `return_days` int(11) NOT NULL DEFAULT 0,
  `type` text DEFAULT NULL,
  `is_unlimited_stock` int(11) NOT NULL DEFAULT 0 COMMENT '0 = Limited & 1 = Unlimited',
  `cod_allowed` tinyint(4) NOT NULL,
  `total_allowed_quantity` int(11) NOT NULL,
  `tax_included_in_price` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fssai_lic_no` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(1, 1, 167, 'Delicious Butter', 'Delicious Butter,Delicious,Butter', 7, 0, 'delicious-butter', 3, 1, 'Delicious Butter', '0', 0, 0, 'null', 'products/1672224461_56341.jpg', NULL, '<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Nutrition</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">Typical composition:<sup style=\"box-sizing: border-box;\">2</sup></span></p>\r\n<div class=\"fusion-table table-1\" style=\"box-sizing: border-box; overflow-x: auto; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\">\r\n<table style=\"border-collapse: collapse; width: 100%; border-color: #dcdcdc; border-style: solid; margin-left: auto; margin-right: auto;\" border=\"1px\" width=\"100%\" cellspacing=\"0px\" cellpadding=\"10px 20px\">\r\n<thead style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">Component</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">Amount</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Energy</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">74 KCalg</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Total lipid/fat</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">78.57 g</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Carbohydrate</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">0 g</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Protein</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">0 g</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Sodium (Na)</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">643 mg</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Vitamin A</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">2857 IU</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Fatty acids (saturated)</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">50 g</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Cholesterol</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">214 mg</span></td>\r\n</tr>\r\n</thead>\r\n</table>\r\n</div>\r\n<div class=\"fusion-sep-clear\" style=\"box-sizing: border-box; clear: both; height: 1px; font-size: 0px; line-height: 0; width: 921px; overflow: hidden; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; background-color: #ffffff;\">&nbsp;</div>\r\n<div class=\"fusion-separator fusion-full-width-sep\" style=\"box-sizing: border-box; clear: both; position: relative; z-index: 11; display: flex; align-items: center; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff; margin: 5px auto 10px; width: 921px;\">\r\n<div class=\"fusion-separator-border sep-double\" style=\"box-sizing: content-box; flex-grow: 2; border-width: 1px 0px; border-style: solid; border-color: #ffffff; border-image: initial; height: 6px;\">&nbsp;</div>\r\n</div>\r\n<div class=\"fusion-sep-clear\" style=\"box-sizing: border-box; clear: both; height: 1px; font-size: 0px; line-height: 0; width: 921px; overflow: hidden; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; background-color: #ffffff;\">&nbsp;</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">Despite its high caloric value, butter contains beneficial fatty acids, butyrates. These may help in reducing intestinal inflammation.</span></p>\r\n<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Application</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">In baked products, butter imparts flakiness. Mainly, it&rsquo;s used in laminated doughs including&nbsp;<a style=\"box-sizing: border-box; transition-property: color, background-color, border-color; transition-duration: 0.2s; transition-timing-function: linear; color: #000000; font-weight: bold;\" href=\"https://bakerpedia.com/processes/croissant/\" rel=\"noopener noreferrer\">croissants</a>, danish and puff pastries. Flakiness is caused by butter melting and release of trapped leavening CO<sub style=\"box-sizing: border-box;\">2</sub>&nbsp;bubbles. The higher the butter solid content, the higher the baked product volume. The mixing process is beneficial to enhancing the flaky texture of baked goods.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">In cookies, cakes, breads and&nbsp;<a style=\"box-sizing: border-box; transition-property: color, background-color, border-color; transition-duration: 0.2s; transition-timing-function: linear; color: #000000; font-weight: bold;\" href=\"https://bakerpedia.com/ingredients/frosting/\" rel=\"noopener noreferrer\">icings</a>, solid butter is typically added at room temperature. Then, it&rsquo;s mixed with sugar until creamed and/or a uniform batter is formed.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">Due to its potential allergenicity, it can be replaced with vegetable oils and shortenings in some applications.</span></p>', 1, 1, 0, 'packet', 0, 0, 10, 0, '2022-11-14 06:55:25', '2023-08-24 05:27:19', NULL, 'FSSAILICDELBUTTER123'),
(2, 1, 139, 'Chese', 'Chese,chedder', 8, 1, 'chese', 3, 1, 'null', '0', 0, 0, 'null', 'products/1672213307_26559.jpg', NULL, '<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Filling</span></h3>\r\n<div class=\"fusion-table table-1\" style=\"box-sizing: border-box; overflow-x: auto; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\">\r\n<table style=\"max-width: 100%; border-spacing: 0px; border: 1px solid #dcdcdc; box-shadow: rgba(0, 0, 0, 0.08) 0px 1px 3px, rgba(255, 255, 255, 0.5) 0px 0px 0px 1px inset;\" width=\"100%\">\r\n<thead style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">Ingredient</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">True % (based on formula weight)</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\"><a style=\"box-sizing: border-box; transition-property: color, background-color, border-color; transition-duration: 0.2s; transition-timing-function: linear; color: #000000; font-weight: bold;\" href=\"https://bakerpedia.com/ingredients/cream-cheese/\" rel=\"noopener noreferrer\">Cream cheese</a>&nbsp;(room temperature)*</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">65.0&ndash;70.0</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Granulated sugar</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">15.0&ndash;20.0</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Whole eggs (liquid)</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">12.0&ndash;15.0</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\"><a style=\"box-sizing: border-box; transition-property: color, background-color, border-color; transition-duration: 0.2s; transition-timing-function: linear; color: #000000; font-weight: bold;\" href=\"https://bakerpedia.com/ingredients/cake-flour/\" rel=\"noopener noreferrer\">Cake flour</a>&nbsp;or cornstarch**</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">1.0&ndash;5.0</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Vanilla extract (liquid)</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">0.5&ndash;0.8</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Lemon zest (grated finely)</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">0.2&ndash;0.5</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Lemon juice</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">0.1&ndash;0.2</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Heavy or sour cream</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">1.0&ndash;3.0</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Sodium propionate / potassium sorbate</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">0.1&ndash;0.15</span></td>\r\n</tr>\r\n</thead>\r\n</table>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\"><em style=\"box-sizing: border-box;\">*Alternative options: soft/fresh cheese, ricotta, cottage or farmer&rsquo;s cheese</em></span><br style=\"box-sizing: border-box;\" /><span style=\"color: #000000;\"><em style=\"box-sizing: border-box;\">**Can also be all-purpose flour</em></span></p>\r\n<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Base or crust</span></h3>\r\n<div class=\"fusion-table table-1\" style=\"box-sizing: border-box; overflow-x: auto; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\">\r\n<table style=\"max-width: 100%; border-spacing: 0px; border: 1px solid #dcdcdc; box-shadow: rgba(0, 0, 0, 0.08) 0px 1px 3px, rgba(255, 255, 255, 0.5) 0px 0px 0px 1px inset;\" width=\"100%\">\r\n<thead style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">Options</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">Amount</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Graham crackers (crushed)*</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\" rowspan=\"2\"><span style=\"color: #000000;\">Enough to cover pan base and/or pan sides</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Unsalted butter (melted)</span></td>\r\n</tr>\r\n</thead>\r\n</table>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\"><em style=\"box-sizing: border-box;\">* Alternatives: short dough, ground nuts, cookie crumbs</em></span></p>\r\n<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Topping</span></h3>\r\n<div class=\"fusion-table table-1\" style=\"box-sizing: border-box; overflow-x: auto; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\">\r\n<table style=\"max-width: 100%; border-spacing: 0px; border: 1px solid #dcdcdc; box-shadow: rgba(0, 0, 0, 0.08) 0px 1px 3px, rgba(255, 255, 255, 0.5) 0px 0px 0px 1px inset;\" width=\"100%\">\r\n<thead style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">Ingredient</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"box-sizing: border-box; font-weight: bolder; color: #000000;\">Amount</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Fruits</span></td>\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\" rowspan=\"4\"><span style=\"color: #000000;\">Enough to cover filling top</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Sour cream glaze</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; background: #f6f6f6;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Raspberries</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<td style=\"box-sizing: border-box; border: 1px solid #dcdcdc; padding: 10px 20px;\"><span style=\"color: #000000;\">Raspberry sauce and chocolate</span></td>\r\n</tr>\r\n</thead>\r\n</table>\r\n</div>\r\n<div class=\"fusion-sep-clear\" style=\"box-sizing: border-box; clear: both; height: 1px; font-size: 0px; line-height: 0; width: 921px; overflow: hidden; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; background-color: #ffffff;\">&nbsp;</div>\r\n<div class=\"fusion-separator fusion-full-width-sep\" style=\"box-sizing: border-box; clear: both; position: relative; z-index: 11; display: flex; align-items: center; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff; margin: 5px auto 10px; width: 921px;\">\r\n<div class=\"fusion-separator-border sep-double\" style=\"box-sizing: content-box; flex-grow: 2; border-width: 1px 0px; border-style: solid; border-color: #ffffff; border-image: initial; height: 6px;\">&nbsp;</div>\r\n</div>\r\n<div class=\"fusion-sep-clear\" style=\"box-sizing: border-box; clear: both; height: 1px; font-size: 0px; line-height: 0; width: 921px; overflow: hidden; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; background-color: #ffffff;\">&nbsp;</div>\r\n<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Base / crust preparation1</span></h3>\r\n<ol style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Ingredients scaling: amount of short dough or cookie crumbs depends on the size of the pan and desired crust thickness. Melted butter can be added to the base at 60% (based on cookie crumbs or graham crackers weight).</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Short dough can be prepared by blending pastry flour and butter (60% based on flour weight) to short flakes. Mix to pea size lumps.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Combine the graham cracker (cookie) crumbs with the melted butter. Press the mixture into the bottom of the springform pan. Bake for 10 minutes at 392&deg;F (200&deg;C) until the crust is dry to the touch.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Set aside.</span></li>\r\n</ol>\r\n<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Filling processing</span></h3>\r\n<ul style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Ingredients scaling.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Crust / base preparation. Line the bottom and sides of the pans with a crumb or short dough crust.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Mixing.</span>\r\n<ul style=\"box-sizing: border-box;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Blend cream cheese and sugar on low speed with a paddle attachment until no lumps remain. Scrape down the bowl often.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Add whole eggs slowly for optimum incorporation. Scrape down the bowl and paddle after addition.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Add the flour and mix until combined. Add the remaining ingredients and mix until a smooth, creamy texture is achieved.</span></li>\r\n</ul>\r\n</li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Depositing. Deposit filling into a pan with base / crust.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Baking. Bake filling at 300&deg;F (150&deg;C) until the batter is set and no longer jiggles, approximately 75&ndash;90 minutes.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Cooling. Cool overnight, or for about 6 hours at refrigeration temperature.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Depanning. Unmold cheesecake from the springform pan.</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Serving.</span></li>\r\n</ul>\r\n<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Application</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">Cheesecake pans are somewhat special and differ from those used in regular&nbsp;<a style=\"box-sizing: border-box; transition-property: color, background-color, border-color; transition-duration: 0.2s; transition-timing-function: linear; color: #000000; font-weight: bold;\" href=\"https://bakerpedia.com/processes/cakes/\" rel=\"noopener noreferrer\">batter cakes</a>. Two types of pans are used in the production of cheesecakes. They are:</span></p>\r\n<ol style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">False bottom pan</span></li>\r\n<li style=\"box-sizing: border-box;\"><span style=\"color: #000000;\">Springform pan</span></li>\r\n</ol>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">False bottom pans are constructed of two pieces, so that the sides may be removed, leaving the cheesecake on the pan bottom. This differs from a springform pan in that the sidewall is a solid ring.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">Springform pans have sidewalls that expand through a clasp mechanism to free the pan sidewall from its baked product. The pan&rsquo;s bottom is fully separate from the sidewall and is maintained in place by the tension of the closed sidewall clasps.</span></p>\r\n<h3 class=\"fusion-responsive-typography-calculated\" style=\"box-sizing: border-box; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-weight: var(--h3_typography-font-weight); line-height: 1.5; font-size: var(--h3_typography-font-size); margin-top: var(--h3_typography-margin-top); margin-bottom: var(--h3_typography-margin-bottom); background-color: #ffffff; --fontsize: 16; --minfontsize: 16;\" data-fontsize=\"16\" data-lineheight=\"24px\"><span style=\"color: #000000;\">Specifications for cheese</span></h3>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">The&nbsp;<a style=\"box-sizing: border-box; transition-property: color, background-color, border-color; transition-duration: 0.2s; transition-timing-function: linear; color: #000000; font-weight: bold;\" href=\"https://bakerpedia.com/ingredients/cream-cheese/\" rel=\"noopener noreferrer\">cream cheese</a>&nbsp;must be soft, fresh curd cheese with about 33% fat. It can be blended with Baker&rsquo;s Cheese to reduce cost and/or fat content.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; font-family: \'PT Sans\', Arial, Helvetica, sans-serif; font-size: 13px; background-color: #ffffff;\"><span style=\"color: #000000;\">The structure of the filling depends on the denaturation of egg, flour and milk proteins (coagulation by heat). Cheesecakes should be depanned and cut when cold and firm. Use a knife dipped in clean hot water, wiped after each cut to prevent buildup on the knife and the surface of the cake.</span></p>', 1, 1, 0, 'packet', 0, 0, 10, 0, '2022-11-14 07:02:09', '2023-04-27 09:25:01', NULL, ''),
(3, 1, 138, 'Coconut Mulk', 'Coconut Mulk,Milk,Coconut', 8, 0, 'coconut-mulk', 2, NULL, 'null', '0', 0, 0, 'null', 'products/1672213316_9445.jpg', NULL, '<div style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit;\"><span style=\"color: #000000; font-size: 12pt;\"><a class=\"chartbeat-section\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; color: #000000; background-color: #ffffff;\" name=\"nutrition\"></a>Nutrition Content</span></div>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\">Coconut milk is a high-calorie food.</span></p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\">About 93% of its calories come from fat, including saturated fats known as&nbsp;<a class=\"content-link css-5r4717\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer; border-color: currentcolor; color: #000000; background-color: #ffffff;\" href=\"https://www.healthline.com/nutrition/mct-oil-101\">medium-chain triglycerides</a>&nbsp;(MCTs).</span></p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\">Milk is also a good source of several vitamins and minerals. One cup (240 grams) contains (<a class=\"content-link css-5r4717\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer; border-color: currentcolor; color: #000000; background-color: #ffffff;\" href=\"http://nutritiondata.self.com/facts/nut-and-seed-products/3113/2\" target=\"_blank\" rel=\"noopener noreferrer\">1</a>):</span></p>\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif; font-size: 18px;\">\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Calories:</span>&nbsp;552</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Fat:</span>&nbsp;57 grams</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Protein:</span>&nbsp;5 grams</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Carbs:</span>&nbsp;13 grams</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Fiber:</span>&nbsp;5 grams</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Vitamin C:</span>&nbsp;11% of the RDI</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Folate:</span>&nbsp;10% of the RDI</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Iron:</span>&nbsp;22% of the RDI</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Magnesium:</span>&nbsp;22% of the RDI</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Potassium:</span>&nbsp;18% of the RDI</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Copper:</span>&nbsp;32% of the RDI</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Manganese:</span>&nbsp;110% of the RDI</span></li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Selenium:</span>&nbsp;21% of the RDI</span></li>\r\n</ul>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\"><span style=\"color: #000000; font-size: 12pt; background-color: #ffffff;\">In addition, some experts believe coconut milk contains unique proteins that may provide health benefits. However, more research is needed</span></p>', 1, 1, 0, 'packet', 1, 0, 10, 0, '2022-11-14 07:07:02', '2023-04-26 13:03:51', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(4, 1, 58, 'Kiwi Juice', 'kiwi juice,kiwi ,juice', 5, 1, 'kiwi-juice', 2, NULL, 'null', '0', 0, 0, 'null', 'products/1672213325_83972.jpg', NULL, '<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Introduction:</strong>&nbsp;</span></h2>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Ever thought the tangy-sweet juice of kiwi fruit can be beneficial for diseases? You heard it right; the refreshing kiwi fruit juice is rich in nutrients. It is scientifically known as&nbsp;<em style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Actinidia deliciosa</em>&nbsp;and belongs to the family&nbsp;<em style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Actinidia</em>. Kiwi is an exotic seasonal fruit. Kiwi fruit is dull brown with hairy skin on the outside with a beautiful bright translucent green colour on the inside. The inside also has several tiny black seeds and a creamy white core. The taste of kiwi is a unique combination of sweet, sour and tangy. Kiwi fruit is native to southwest China. Though New Zealand is the major producer of Kiwi, it is grown in some regions of India as well. They are usually found in temperate forests. Kiwi fruit is of green and gold varieties. The gold one has a sweet tropical taste.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">1</span>&nbsp;</span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"Nutritional_Value_of_Kiwi_Juice\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Nutritional Value of Kiwi Juice:</strong>&nbsp;</span></h2>\r\n<figure class=\"wp-block-table\" style=\"box-sizing: border-box; display: block; margin: 0px 0px 1em; overflow-x: auto; color: #444444; font-family: Lato; font-size: 16px; background-color: #ffffff;\">\r\n<table style=\"border-width: 1px 0px 0px 1px; border-image: initial; margin: 0px 0px 1.5em; outline: 0px; padding: 0px; vertical-align: baseline; border-spacing: 0px; width: 600px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-color: #e6e6e6 initial initial rgba(0, 0, 0, 0.07); border-style: solid initial initial solid;\">\r\n<tbody style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Nutritional Component</strong>&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Amount</strong>&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Water&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">83.1 g&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Energy&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">61 kcal&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Protein&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">1.14 g&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Total lipid&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">0.52 g&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Carbohydrate&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">14.7 g&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Fibre&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">3 g&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Sugars&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">8.99 g&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Calcium&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">34 mg&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Iron&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">0.31 mg&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Magnesium&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">17 mg&nbsp;</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">Potassium&nbsp;</span></td>\r\n<td style=\"box-sizing: border-box; border-width: 0px 1px 1px 0px; border-image: initial; margin: 0px; outline: 0px; padding: 10px 15px; vertical-align: baseline; border-color: initial rgba(0, 0, 0, 0.07) rgba(0, 0, 0, 0.07) initial; border-style: initial solid solid initial;\"><span style=\"color: #000000; background-color: #ffffff;\">312 mg&nbsp;</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</figure>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Table: Nutritional Value of Kiwi Fruit<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">2</span>&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Also Read:&nbsp;<strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><a style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: #000000; background-color: #ffffff;\" href=\"https://pharmeasy.in/blog/ayurveda-uses-benefits-side-effects-of-grape-juice/\" target=\"_blank\" rel=\"noreferrer noopener\">Grape Juice: Uses, Benefits, Side Effects and More!</a></strong></span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"Properties_of_Kiwi_Juice\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Properties of Kiwi Juice:</strong>&nbsp;</span></h2>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">The properties of the kiwi fruit are as follows. Kiwi juice may also show similar properties.&nbsp;</span></p>\r\n<ul style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px 30px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; color: #444444; font-family: Lato; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may protect against cancer&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may prevent diabetes&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may be a possible antioxidant&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may act against microbes&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may help reduce inflammation and swelling&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may be used in case of constipation&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may be used to treat asthma&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may act against blood clot formation&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may prevent the growth of fungi&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">It may protect the liver<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">3</span>&nbsp;</span></li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Also Read:&nbsp;<strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><a style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: #000000; background-color: #ffffff;\" href=\"https://pharmeasy.in/blog/ayurveda-uses-benefits-side-effects-of-neem-juice/\" target=\"_blank\" rel=\"noreferrer noopener\">Neem Juice: Uses, Benefits, Side effects and More!</a></strong></span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"Potential_Uses_of_Kiwi_Juice_for_Overall_Health\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Potential Uses of Kiwi Juice for Overall Health:</strong>&nbsp;</span></h2>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">The uses of kiwi fruit are given below. Kiwi fruit juice may also show similar effects.&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">1. Potential Use of Kiwi Juice for Digestive Health:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Kiwi juice has a unique combination of phytochemicals that may have gastrointestinal benefits. Kiwi fruit juice may aid in digestion. It may help reduce irritability, reduce the problem of indigestion and may be beneficial in vomiting. In addition, kiwi fruit juice may help relieve constipation. Studies show the enzyme actinidin in kiwi fruit may help digest proteins in the small intestine and stomach. However, you must seek medical advice if you are experiencing abdominal discomfort.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">1</span>&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">2. Potential Use of Kiwi Juice for Diabetes:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Glycemic index refers to how fast food affects the blood sugar level on food intake. Kiwi juice has a low glycaemic index which may be beneficial for diabetic patients. This means it has minimal effect on an increase in blood sugar level.&nbsp; In addition, the fibres present in kiwi juice may help to keep diabetes under control.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;Kiwi juice contains natural sugar alcohol and inositol, which may help regulate diabetes. However, it is essential to check your blood sugar levels and consult your doctor rather than self-medication.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">3</span>&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">3. Potential Use of Kiwi Juice for Cancer:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Phytoconstituents of kiwi juice like antioxidants, carotenoids, vitamins and fibres may be beneficial for cancer. Kiwi juice may act against the cancer cells without affecting the normal cells. Kiwi fruit juice may act against the initiation of cancer. The dietary fibre present in kiwi juice may help in colon cancer.&nbsp; A phytochemical catechin present in kiwi juice may help reduce the toxicity caused by anti-cancer agents. Another phytochemical, lutein, may be used for lung or prostate cancer. Cancer is a dangerous disease; therefore, it is important to have a professional opinion instead of self-medication.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">4. Potential Use of Kiwi Juice for Skin Health:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">There may be potential kiwi juice benefits for the skin. Kiwi juice is rich in vitamin C and vitamin E, which improve overall skin health. Vitamin C acts as an antioxidant, and may reduce wrinkles,&nbsp; damage caused by sun, pollution and smoke and keep the skin vibrant and young. Vitamin C may be responsible for the formation of collagen, which is a protein that helps to keep the skin firm. The vitamin E present in kiwi juice may keep the skin supple.&nbsp; You must consult your doctor if you have any skin-related disorders.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">5. Potential Use of Kiwi Juice for Heart Health:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Fibres and potassium present in kiwi juice may help to support heart health. Fibres in kiwi juice may lower cholesterol and improve heart health. In addition, an increase in potassium intake and decreasing sodium intake may help to regulate the heart rate. Kiwi juice is also rich in omega-3 fatty acids, which may reduce the risk of coronary heart disease and stroke. You must get medical advice immediately if you have any heart disease symptoms or have a history of any heart diseases.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">6. Potential Use of Kiwi Juice for Hair Health:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">There may be a potential use of kiwi juice for hair growth. Kiwi juice is a good source of minerals like zinc, magnesium and phosphorus. Vitamin C and E in kiwi juice may help reduce hair fall. The copper in kiwi juice may help retain the hair&rsquo;s natural colour. Kiwi juice has iron which may help strengthen the hair.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">7. Potential Use of Kiwi Juice for Eye Health:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Kiwi juice may be beneficial for macular degeneration, which affects the retina. Kiwi juice is rich in phytochemical lutein, a carotenoid that may protect the eye. Therefore, lutein is beneficial in age-related blindness. Our body cannot produce lutein; therefore, kiwi juice may benefit retinal degeneration. You must seek medical help immediately if you have a loss of vision.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">8. Potential Use of Kiwi Juice for High Blood Pressure:</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Potassium present in kiwi juice may help to regulate blood pressure. It may oppose the effect of sodium in the body since high levels of sodium may cause high blood pressure. More studies are required on the potential use of kiwi juice to maintain blood pressure. However, if you have high blood pressure, it is important to seek medical help rather than self-medicating.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Though studies show the benefits of kiwi juice in various conditions, these are insufficient, and there is a need for further studies to establish the true extent of the benefits of kiwi juice on human health.&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Also Read:&nbsp;<strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><a style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: #000000; background-color: #ffffff;\" href=\"https://pharmeasy.in/blog/ayurveda-uses-benefits-side-effects-of-papaya-juice/\" target=\"_blank\" rel=\"noreferrer noopener\">Papaya Juice: Uses, Benefits, Side Effects and More!</a></strong></span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"How_to_Use_Kiwi_Juice\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">How to Use Kiwi Juice?</strong>&nbsp;</span></h2>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Kiwi juice can be prepared in the following way:&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">First, the kiwi fruit is thoroughly cleaned with water, and then abrasive side of a cleaning sponge is used to remove the hair on the kiwi fruit. The hard top part is then removed. Kiwi fruit is diced into small pieces and blended until smooth. Finally, kiwi juice is ready to be consumed.&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">You must consult a qualified doctor before taking any herbal supplements. Likewise, do not discontinue or replace an ongoing modern medical treatment with an ayurvedic/herbal preparation without consulting a qualified doctor.&nbsp;</span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"Side_Effects_of_Kiwi_Juice\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Side Effects of Kiwi Juice:</strong>&nbsp;</span></h2>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Some of the side effects associated with kiwi juice are as follows:&nbsp;</span></p>\r\n<ul style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px 30px; outline: 0px; padding: 0px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; color: #444444; font-family: Lato; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">Allergy: Allergy to kiwi juice may range from localized irritation in the mouth to life-threatening allergic reactions like anaphylaxis.&nbsp;</span></li>\r\n<li style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><span style=\"color: #000000; background-color: #ffffff;\">Acute Pancreatitis: Inflammation of the pancreas may be a side effect of kiwi juice<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">3</span>&nbsp;</span></li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">If you experience any side effects or discomfort after consuming kiwi juice, you must seek medical help immediately.&nbsp;</span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"Precautions_to_take_with_Kiwi_Juice\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Precautions to take with Kiwi Juice:</strong>&nbsp;</span></h2>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">General precautions shall be taken before consuming kiwi juice. You should consult your doctor before consuming kiwi juice during pregnancy and lactation. Special care should be taken while giving kiwi juice to newborns and the elderly. You must be cautious if you are taking any medication, and you should consult your doctor before consumption of kiwi juice.&nbsp;</span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"Interaction_with_other_Drugs\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Interaction with other Drugs:</strong>&nbsp;</span></h2>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">There is no evidence of the interaction of kiwi juice with other drugs; therefore, further studies must be conducted. However, you should take medical advice before consuming kiwi juice, especially if you have any pre-existing health conditions or are taking any medications.&nbsp;</span></p>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Also Read:&nbsp;<strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"><a style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; color: #000000; background-color: #ffffff;\" href=\"https://pharmeasy.in/blog/ayurveda-uses-benefits-side-effects-of-avocado-juice/\" target=\"_blank\" rel=\"noreferrer noopener\">Avocado Juice: Uses, Benefits, Side Effects and More!</a></strong></span></p>\r\n<h2 style=\"box-sizing: border-box; border: 0px; font-size: 20px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 50px; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><span id=\"Frequently_Asked_Questions\" class=\"ez-toc-section\" style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\"></span><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">Frequently Asked Questions:</strong>&nbsp;</span></h2>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">1) What are kiwi juice benefits for overall health?</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Kiwi juice may be used to improve digestive health, skin health, hair health, eye health and heart health. It may also benefit diabetes and cancer and lower high blood pressure.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">1</span>&nbsp;However, it is advised to get diagnosed and seek medical help instead of opting for self-medication.&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">2) What are kiwi juice benefits for hair?</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Kiwi juice is rich in vitamin C and E, which may improve hair health. The copper present in kiwi juice may help to retain the hair colour.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">4</span>&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">3) What are the advantages of kiwi juice?</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Kiwi Juice has several nutrients like vitamin C and E, potassium, natural sugars and many more that may be beneficial for several diseases. Kiwi juice may be used for diseases like cancer, diabetes or high blood pressure.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">2</span><span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">,4</span>&nbsp;However, it is advised to seek professional help instead of self-medication.&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">4) What are the side effects of kiwi juice?</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">Side effects due to kiwi juice may be allergies that may range from localized irritation in the mouth to life-threatening allergic reactions like anaphylaxis and inflammation of the pancreas.<span style=\"box-sizing: border-box; border: 0px; font-size: 12px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline; height: 0px; line-height: 0; position: relative; bottom: 1ex; background-color: #ffffff;\">3</span>&nbsp;If you experience any side effects or discomfort after consuming kiwi juice, you must seek medical help immediately.&nbsp;</span></p>\r\n<h3 style=\"box-sizing: border-box; border: 0px; font-size: 18px; margin: 0px 0px 10px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; line-height: 45px; -webkit-font-smoothing: antialiased; font-family: Montserrat; font-weight: 400; color: #232323; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\"><strong style=\"box-sizing: border-box; border: 0px; margin: 0px; outline: 0px; padding: 0px; vertical-align: baseline;\">5) Can kiwi juice be consumed by pregnant women?</strong>&nbsp;</span></h3>\r\n<p style=\"box-sizing: border-box; border: 0px; font-size: 16px; margin: 0px 0px 30px; outline: 0px; padding: 0px; vertical-align: baseline; overflow-wrap: break-word; color: #444444; font-family: Lato; background-color: #ffffff;\"><span style=\"color: #000000; background-color: #ffffff;\">There is not enough data on whether pregnant women can safely consume kiwi juice. However, it is advised to consult your doctor before consuming kiwi juice during pregnancy.&nbsp;</span></p>', 1, 1, 0, 'packet', 0, 0, 10, 0, '2022-11-14 07:17:09', '2022-12-28 07:42:05', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(5, 1, 153, 'Orange Juice', 'orange juice,juice,orange', 0, 0, 'orange-juice', 2, NULL, 'null', '0', 1, 1, '5', 'products/1672213335_47196.jpg', NULL, '<div id=\"wrapper\" class=\"site wp-site-blocks\"><header id=\"masthead\" class=\"site-header\" role=\"banner\">\r\n<div id=\"main-header\" class=\"site-header-wrap\">\r\n<div class=\"site-header-inner-wrap\">\r\n<div class=\"site-header-upper-wrap\">\r\n<div class=\"site-header-upper-inner-wrap\">\r\n<div class=\"site-top-header-wrap site-header-row-container site-header-focus-item site-header-row-layout-standard\" data-section=\"kadence_customizer_header_top\">\r\n<div class=\"site-header-row-container-inner\">\r\n<div class=\"site-container\">\r\n<div class=\"site-top-header-inner-wrap site-header-row site-header-row-has-sides site-header-row-no-center\">\r\n<div class=\"site-header-top-section-left site-header-section site-header-section-left\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"site-main-header-wrap site-header-row-container site-header-focus-item site-header-row-layout-standard\" data-section=\"kadence_customizer_header_main\">\r\n<div class=\"site-header-row-container-inner\">\r\n<div class=\"site-container\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"mobile-header\" class=\"site-mobile-header-wrap\">\r\n<div class=\"site-header-inner-wrap\">\r\n<div class=\"site-header-upper-wrap\">\r\n<div class=\"site-header-upper-inner-wrap\">\r\n<div class=\"site-top-header-wrap site-header-focus-item site-header-row-layout-standard site-header-row-tablet-layout-default site-header-row-mobile-layout-default \">\r\n<div class=\"site-header-row-container-inner\">\r\n<div class=\"site-container\">\r\n<div class=\"site-top-header-inner-wrap site-header-row site-header-row-has-sides site-header-row-no-center\">\r\n<div class=\"site-header-top-section-left site-header-section site-header-section-left\">&nbsp;</div>\r\n<div class=\"site-header-top-section-right site-header-section site-header-section-right\">\r\n<div class=\"site-header-item site-header-focus-item\" data-section=\"kadence_customizer_mobile_social\">\r\n<div class=\"header-mobile-social-wrap\">&nbsp;</div>\r\n</div>\r\n<!-- data-section=\"mobile_social\" --></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"site-main-header-wrap site-header-focus-item site-header-row-layout-standard site-header-row-tablet-layout-default site-header-row-mobile-layout-default \">\r\n<div class=\"site-header-row-container-inner\">\r\n<div class=\"site-container\">\r\n<div class=\"site-main-header-inner-wrap site-header-row site-header-row-has-sides site-header-row-center-column\">\r\n<div class=\"site-header-main-section-left site-header-section site-header-section-left\">\r\n<div class=\"site-header-item site-header-focus-item site-header-item-navgation-popup-toggle\" data-section=\"kadence_customizer_mobile_trigger\">&nbsp;</div>\r\n<!-- data-section=\"mobile_trigger\" --></div>\r\n<div class=\"site-header-main-section-center site-header-section site-header-section-center\">\r\n<div class=\"site-header-item site-header-focus-item\" data-section=\"title_tagline\">\r\n<div class=\"site-branding mobile-site-branding branding-layout-standard branding-tablet-layout-inherit site-brand-logo-only branding-mobile-layout-inherit\">&nbsp;</div>\r\n</div>\r\n<!-- data-section=\"title_tagline\" --></div>\r\n<div class=\"site-header-main-section-right site-header-section site-header-section-right\">\r\n<div class=\"site-header-item site-header-focus-item\" data-section=\"kadence_customizer_header_search\">\r\n<div class=\"search-toggle-open-container\">&nbsp;</div>\r\n</div>\r\n<!-- data-section=\"header_search\" --></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</header><!-- #masthead -->\r\n<div id=\"inner-wrap\" class=\"wrap hfeed kt-clear\">\r\n<div id=\"primary\" class=\"content-area\">\r\n<div class=\"content-container site-container\"><main id=\"main\" class=\"site-main\" role=\"main\">\r\n<div class=\"content-wrap\">\r\n<div class=\"code-block code-block-8\" style=\"position: fixed; z-index: 9995; bottom: 0px; text-align: center; left: 50%; transform: translate(-50%);\">\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" style=\"display: none;\" data-code=\"CjxkaXYgY2xhc3MgPSAic292cm4taG9yaXpvbnRhbC1zdGlja3ktMzIweDUwLTcyOHg5MC05NzB4OTAiPjwvZGl2Pgo=\">&nbsp;</div>\r\n</div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" data-code=\"\"><!-- horizontal sticky Ad -->\r\n<div id=\"div-gpt-ad-1428203927205-11\" style=\"display: none;\" data-google-query-id=\"CP6ngfeQrfsCFe1GDwIdJEgLIA\">\r\n<div id=\"google_ads_iframe_/111851082/11_0__container__\" style=\"border: 0pt none; width: 320px; height: 0px;\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!-- WP Content Copy Protection script by Rynaldo Stoltz Starts --><!-- WP Content Copy Protection script by Rynaldo Stoltz Ends  --> <!-- .post-thumbnail -->\r\n<article id=\"post-30956\" class=\"entry content-bg single-entry post-30956 post type-post status-publish format-standard has-post-thumbnail hentry category-diy category-drinks category-latest-updates\">\r\n<div class=\"entry-content-wrap\"><header class=\"entry-header post-title title-align-inherit title-tablet-align-inherit title-mobile-align-inherit\"><!-- [element-129757] -->\r\n<div class=\"wp-block-kadence-rowlayout alignnone\">\r\n<div id=\"kt-layout-id_2b57f3-5d\" class=\"kt-row-layout-inner kt-layout-id_2b57f3-5d\"></div>\r\n</div>\r\n<!-- [/element-129757] --></header><!-- .entry-header -->\r\n<div class=\"entry-content single-content\">\r\n<p>Orange Juice Recipe with 4 easy juicing methods. There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Bright and sweet with just the perfect amount of acidity; a glass of orange juice delivers amazing flavor and so much more. Loaded with vitamins and minerals, it helps to improve immunity naturally. Homemade fruit juices if consumed in moderation are healthy as they are undiluted, fresh and made without any additives.</p>\r\n<p>Enjoy after breakfast or at any time of the day, this is a delicious beverage that does more than quench your thirst.</p>\r\n<h2 id=\"h-orange-juice\" class=\"has-text-align-center\">Orange Juice</h2>\r\n<p>Regular consumption of oranges builds immunity and improves the overall health. High vitamin C in orange juice has proved to be an immunity booster in kids and grownups alike.</p>\r\n<p>Oranges also help in balancing the hormones, stimulates the production of collagen to improve the health of skin. Pure orange juice may also help in balancing the HDL and LDL by increasing HDL and reducing the LDL.</p>\r\n<p>Similar to the other citrus fruits, oranges are acidic but creates an alkaline effect after the juice has been metabolized. However too much of it is not good for people suffering from ulcers, digestive problems &amp; diabetes.</p>\r\n<p>Homemade pure juice is delicious, fresh and cannot be compared with any bottled juice. Though eating the fruit on its own has a lot of health benefits, it is hard to get my kids to eat them regularly, so we prefer juicing them 3 times a week.</p>\r\n<p>On the other days we add them to smoothies along with banana or apples. Oranges can also be used to make mix fruit juice.</p>\r\n<h3 id=\"h-best-oranges-for-juicing\">Best Oranges for Juicing</h3>\r\n<p>When deciding what type of oranges to use for making orange juice, you should select the fruit that will yield the most juice. I recommend Valencia oranges for the very best juice, followed closely behind by navel oranges.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-full\"><img class=\"wp-image-87893\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-001.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-001.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-001-300x225.jpg.webp 300w\" alt=\"oranges for juicing\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>Blood oranges are a nice option that will yield a lovely pinkish juice while clementines and tangerines will give you a sweeter beverage.</p>\r\n<p>In the end, you can certainly use whatever oranges that you happen to have on hand, but keep in mind that a fresh orange will be the juiciest.</p>\r\n<div class=\"code-block code-block-2\" style=\"margin: 8px auto; text-align: center; display: block; clear: both;\">\r\n<div class=\"code-block\"><!-- Post Ad2 --></div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" style=\"display: none;\" data-code=\"CjxkaXYgY2xhc3MgPSAic292cm4taW5zdHJ1Y3Rpb25zLTMwMHgyNTAtNzI4eDkwIj48L2Rpdj4K\">&nbsp;</div>\r\n</div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" data-code=\"\"><!-- 2nd Ad -->\r\n<div id=\"div-gpt-ad-1428203927205-2\" style=\"display: none;\" data-google-query-id=\"CIOogfeQrfsCFe1GDwIdJEgLIA\">\r\n<div id=\"google_ads_iframe_/111851082/2_0__container__\" style=\"border: 0pt none; width: 320px; height: 0px;\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<h2 id=\"h-how-to-make-orange-juice-stepwise-photos\">How To Make Orange Juice (stepwise photos)</h2>\r\n<p>There are a number of ways to juice oranges at home. Depending on your kitchen equipment, you can use a citrus juicer, blender, or a slow juicer. Each will work fine, but keep in mind that the end product will vary slightly.</p>\r\n<h3 id=\"h-method-1-manual-juicing\">Method 1 &ndash; Manual Juicing</h3>\r\n<p>This is by far the best in my opinion, juicing without any equipment or tool. But all kinds of oranges cannot be juiced this way. Oranges with thinner skin can be easily squeezed and juiced the way I have shown below. Note that it is hard to juice a lot of oranges this way and some amount of pulp remains in the fruit.</p>\r\n<p>Rinse the fruit well under running water and pat dry with kitchen tissues. Cut the fruit to 2 parts.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87895\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-002.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-002.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-002-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>Remove the seeds as much as possible with the help of a knife.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87896\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-003.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-003.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-003-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n<div class=\"code-block code-block-3\" style=\"margin: 8px auto; text-align: center; display: block; clear: both;\">\r\n<div class=\"code-block\"><!-- Post Ad3 --></div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" style=\"display: none;\" data-code=\"CjxkaXYgY2xhc3MgPSAic292cm4tbWlkLTMtMzAweDI1MC03Mjh4OTAiPjwvZGl2Pgo=\">&nbsp;</div>\r\n</div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" data-code=\"\"><!-- Ad 3 -->\r\n<div id=\"div-gpt-ad-1428203927205-3\" style=\"display: none;\" data-google-query-id=\"CISogfeQrfsCFe1GDwIdJEgLIA\">\r\n<div id=\"google_ads_iframe_/111851082/3_0__container__\" style=\"border: 0pt none; width: 320px; height: 0px;\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<p>Squeeze the halved oranges over a glass, to extract the juice. Simply remove any seeds left in the juice. Please note this method works only with the freshest, thin skinned juicy oranges.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87897\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-004.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-004.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-004-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<h3 id=\"h-method-2-orange-juice-with-a-citrus-juicer\">Method 2 &ndash; Orange Juice With a Citrus Juicer</h3>\r\n<p>This is probably the most obvious way to juice oranges. With either a handheld juicer or an electric model, this method is quite effective. Start by washing the fruit and cutting it in half, exposing the fruit.</p>\r\n<p>Simple wooden citrus reamers work just fine, though probably aren&rsquo;t the best for larger quantities.</p>\r\n<p>There are countertop citrus squeezers that operate with a handle that presses the citrus with gravity and your own force to extract juice. This is a nice option for those who can dedicated counter space to a large kitchen tool.</p>\r\n<p>Finally, you can use an electric citrus juicer that does a great deal of the work for you. By just pressing the cut oranges onto a circulating reamer, this juicer yields a good amount of juice with a bit less effort.</p>\r\n<p>Whichever of these juicers it is best to strain your juice to eliminate the stray seed that may have made its way into your glass.</p>\r\n<h3 id=\"h-method-3-orange-juice-in-a-blender\">Method 3 &ndash; Orange Juice In a Blender</h3>\r\n<p>1. Another way to make this juice at home is with an electric blender. This is a great option because it utilizes the whole orange, minus the peel, providing more fiber that other methods that yield just the juice.</p>\r\n<p>2. For this method, start by washing your oranges and removing the peel.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87899\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-005.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-005.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-005-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>3. Remove the white pith or white membrane, as well. Orange pith is nutritious and is a rich source of fiber however it imparts a bitter taste so I try to remove as much as possible.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87901\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-006.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-006.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-006-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>4. You will have to halve the oranges and then make a deep cut in the center as seen in the picture below.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87903\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2017/04/orange-juice-recipe-008.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2017/04/orange-juice-recipe-008.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2017/04/orange-juice-recipe-008-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n<div class=\"code-block code-block-4\" style=\"margin: 8px auto; text-align: center; display: block; clear: both;\">\r\n<div class=\"code-block\"><!-- Post Ad4 --></div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" style=\"display: none;\" data-code=\"CjxkaXYgY2xhc3MgPSAic292cm4tbWlkLTQtMzAweDI1MC03Mjh4OTAiPjwvZGl2Pgo=\">&nbsp;</div>\r\n</div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" data-code=\"\"><!-- Ad 4 -->\r\n<div id=\"div-gpt-ad-1428203927205-4\" style=\"display: none;\" data-google-query-id=\"CIWogfeQrfsCFe1GDwIdJEgLIA\">\r\n<div id=\"google_ads_iframe_/111851082/4_0__container__\" style=\"border: 0pt none; width: 320px; height: 0px;\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<p>5. You will see the seeds there.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87904\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-009.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-009.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-009-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>6. Remove them gently with the knife. If you prefer cold juice, freeze your oranges for about an hour before juicing them.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87905\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-010.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-010.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-010-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>7. Once your oranges are prepared simply add them to the jar of your electric blender. Pour water or any other juice just to cover them partially and blend until smooth and liquefied. Do not add a lot as it dilutes the taste.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87907\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-011.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-011.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-011-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n<div class=\"code-block code-block-5\" style=\"margin: 8px auto; text-align: center; display: block; clear: both;\">\r\n<div class=\"code-block\"><!-- Post Ad5 --></div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" style=\"display: none;\" data-code=\"CjxkaXYgY2xhc3MgPSAic292cm4tbWlkLTUtMzAweDI1MC03Mjh4OTAiPjwvZGl2Pgo=\">&nbsp;</div>\r\n</div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" data-code=\"\"><!-- Ad 5 -->\r\n<div id=\"div-gpt-ad-1428203927205-5\" style=\"display: none;\" data-google-query-id=\"CIaogfeQrfsCFe1GDwIdJEgLIA\">\r\n<div id=\"google_ads_iframe_/111851082/5_0__container__\" style=\"border: 0pt none; width: 320px; height: 0px;\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<p>8. When properly blended, optionally strain the juice through a fine mesh strainer to remove any pith and enjoy!</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87908\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-012.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-012.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-012-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>Juice made in blender has slight bitter taste from the pith. Also note that pith is healthy and has many nutritional benefits. To cut down the bitter taste, you may add a pinch of salt and 1 tablespoon of honey or maple syrup.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-full\"><img class=\"wp-image-87910\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-in-blender.jpg.webp\" sizes=\"(max-width: 1200px) 100vw, 1200px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-in-blender.jpg.webp 1200w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-in-blender-300x225.jpg.webp 300w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-in-blender-680x510.jpg.webp 680w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-in-blender-768x576.jpg.webp 768w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-in-blender-500x375.jpg.webp 500w\" alt=\"orange juice in a blender\" width=\"1200\" height=\"900\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<h3 id=\"h-method-4-orange-juice-in-a-slow-juicer\">Method 4 &ndash; Orange Juice in a Slow Juicer</h3>\r\n<p>If you happen to have a slow juicer in your arsenal of kitchen tools, making juice is quite simple. Start by washing the fruit and peeling. Remove any white pith.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87911\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-013.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-013.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-013-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n<div class=\"code-block code-block-6\" style=\"margin: 8px auto; text-align: center; display: block; clear: both;\">\r\n<div class=\"code-block\"><!-- Post Ad6 --></div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" style=\"display: none;\" data-code=\"CjxkaXYgY2xhc3MgPSAic292cm4tbWlkLTctMzAweDI1MC03Mjh4OTAiPjwvZGl2Pgo=\">&nbsp;</div>\r\n</div>\r\n<div class=\"code-block\">\r\n<div class=\"ai-dynamic\" data-code=\"\"><!-- Ad 7 -->\r\n<div id=\"div-gpt-ad-1428203927205-7\" style=\"display: none;\" data-google-query-id=\"CIeogfeQrfsCFe1GDwIdJEgLIA\">\r\n<div id=\"google_ads_iframe_/111851082/7_0__container__\" style=\"border: 0pt none; width: 320px; height: 0px;\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<p>Turn on the slow juicer and add the whole peeled fruit to the chute/feeding tube. Collect the juice and the pulp in the respective containers. You can also add a small piece of ginger if you live in a cold place. We always add little mineral salt and a small piece of ginger to the juice since the cold pressed juice is very cooling to the body.</p>\r\n<p>Other ingredients you can try with are tulsi/ holy basil leaves or mint leaves which helps to improve the immunity. If you are into alkaline diet, you may also squeeze in a lemon.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-large\"><img class=\"wp-image-87913\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-014.jpg.webp\" sizes=\"(max-width: 500px) 100vw, 500px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-014.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/06/orange-juice-recipe-014-300x225.jpg.webp 300w\" alt=\"\" width=\"500\" height=\"375\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<p>Serve orange juice immediately before if begins to oxidize. If you have any excess you can also freeze it to popsicles. Pour it the moulds and freeze.</p>\r\n<div class=\"wp-block-image\">\r\n<figure class=\"aligncenter size-full\"><img class=\"wp-image-104281\" src=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe.jpg.webp\" sizes=\"(max-width: 1200px) 100vw, 1200px\" srcset=\"https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe.jpg.webp 1200w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe-300x300.jpg.webp 300w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe-680x680.jpg.webp 680w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe-225x225.jpg.webp 225w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe-768x768.jpg.webp 768w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe-500x500.jpg.webp 500w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe-96x96.jpg.webp 96w,https://www.indianhealthyrecipes.com/wp-content/uploads/2021/12/orange-juice-recipe-150x150.jpg.webp 150w\" alt=\"Orange juice\" width=\"1200\" height=\"1200\" loading=\"lazy\" data-pin-description=\"Orange juice - There is nothing quite refreshing like a glass of freshly squeezed homemade orange juice. Loaded with vitamins and minerals, it helps to improve immunity naturally.\" /></figure>\r\n</div>\r\n<div class=\"pt-cv-wrapper\">\r\n<div id=\"pt-cv-view-9688224as9\" class=\"pt-cv-view pt-cv-grid pt-cv-colsys pt-cv-center pt-cv-reused\">\r\n<div class=\"pt-cv-page\" data-id=\"pt-cv-page-1\" data-cvc=\"3\">&nbsp;</div>\r\n</div>\r\n</div>\r\n<div id=\"recipe\"></div>\r\n<div class=\"swp-content-locator\">&nbsp;</div>\r\n</div>\r\n<!-- [/element-129106] --></div>\r\n</article>\r\n<!-- #post-30956 --><nav class=\"navigation post-navigation\" aria-label=\"Posts\"></nav>\r\n<div class=\"wpdiscuz_top_clearing\">&nbsp;</div>\r\n<div id=\"wpdiscuz-loading-bar\" class=\"wpdiscuz-loading-bar-unauth\"></div>\r\n<div id=\"wpdiscuz-comment-message\" class=\"wpdiscuz-comment-message-unauth\"></div>\r\n</div>\r\n</main><!-- #main --> <!-- #secondary --></div>\r\n</div>\r\n<!-- #primary --></div>\r\n<!-- #inner-wrap --><footer id=\"colophon\" class=\"site-footer\" role=\"contentinfo\">\r\n<div class=\"site-footer-wrap\">\r\n<div class=\"site-bottom-footer-wrap site-footer-row-container site-footer-focus-item site-footer-row-layout-standard site-footer-row-tablet-layout-default site-footer-row-mobile-layout-default\" data-section=\"kadence_customizer_footer_bottom\">\r\n<div class=\"site-footer-row-container-inner\">\r\n<div class=\"site-container\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</footer></div>', 1, 1, 5, 'packet', 0, 0, 10, 0, '2022-11-14 07:30:24', '2023-08-15 06:13:41', NULL, ''),
(10, 1, 79, 'Water Bottle', 'Water Bottle,Water ,Bottle', 7, 1, 'water-bottle', 2, NULL, 'India', '1', 1, 1, '3', 'products/1672213628_30095.jpg', NULL, '<div id=\"detailBullets_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"detailBulletsMain\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"detailBulletsMain\" data-csa-c-slot-id=\"detailBullets_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"xmphi0-o2ivz8-ffjw0g-ynuw92\" data-cel-widget=\"detailBullets_feature_div\">\r\n<div id=\"detailBulletsWrapper_feature_div\" class=\"a-section feature detail-bullets-wrapper bucket\" style=\"box-sizing: border-box; margin-bottom: 4.5px;\" data-feature-name=\"detailBullets\" data-template-name=\"detailBullets\" data-cel-widget=\"detailBulletsWrapper_feature_div\">\r\n<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 24px; line-height: 32px;\">Product details</h2>\r\n<div id=\"detailBullets_feature_div\" style=\"box-sizing: border-box;\">\r\n<ul class=\"a-unordered-list a-nostyle a-vertical a-spacing-none detail-bullet-list\" style=\"box-sizing: border-box; margin: 0px 0px 1px 18px; padding: 0px;\">\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Item Weight &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">1 Kilograms</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Date First Available &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">14 December 2015</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Manufacturer &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">Aquafina</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">ASIN &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">B019CKAG9I</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Item part number &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">Invictus_EAN_IJACAIAFAEAGA</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Country of Origin &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">India</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Manufacturer &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">Aquafina</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Item Weight &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">1 kg</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Net Quantity &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">33.81 Fl Oz</span></span><span class=\"a-declarative\" style=\"box-sizing: border-box;\" data-action=\"acrLink-click-metrics\" data-csa-c-type=\"widget\" data-csa-c-func-deps=\"aui-da-acrLink-click-metrics\" data-acrlink-click-metrics=\"{}\" data-csa-c-id=\"slipct-nsj6py-bzpv03-hqrb7j\"><a id=\"acrCustomerReviewLink\" class=\"a-link-normal\" style=\"box-sizing: border-box; text-decoration-line: none; color: #007185;\" href=\"https://www.amazon.in/Aquafina-Drinking-Water-1L-Bottle/dp/B019CKAG9I/ref=sr_1_7?crid=3GVP4K8A8ERC7&amp;keywords=water&amp;qid=1668411200&amp;qu=eyJxc2MiOiI2Ljg0IiwicXNhIjoiNS4xMiIsInFzcCI6IjQuNzgifQ%3D%3D&amp;sprefix=water+bottle%2Caps%2C228&amp;sr=8-7#customerReviews\"><span id=\"acrCustomerReviewText\" class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\"></span></a></span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"importantInformation_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"importantInformation\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"importantInformation\" data-csa-c-slot-id=\"importantInformation_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"rn1fo6-u2m1sw-9ho5st-q03wo7\" data-cel-widget=\"importantInformation_feature_div\">\r\n<div id=\"important-information\" class=\"a-section a-spacing-extra-large bucket\" style=\"box-sizing: border-box; margin-bottom: 0px;\">\r\n<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 24px; line-height: 32px;\">Important information</h2>\r\n<div class=\"a-section content\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-top: 6.5px; margin-left: 25px;\">\r\n<h4 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 18px; line-height: 24px;\">Legal Disclaimer:</h4>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 14px;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: -4px 0px 14px;\">Terms &amp; Conditions apply. The product images are only for representation purpose. While every reasonable effort has been made to maintain accurate and up to date product related content, the product packaging, product size, weight, MRP and such other product details may differ from the actual product as may be delivered to you. Actual product packaging and materials may contain more and different information than what is shown on the website.</p>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 10, 'packet', 0, 1, 10, 1, '2022-11-14 07:36:25', '2022-12-28 07:47:08', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(11, 1, 96, 'Cloves', 'masalas,cloves,spices,indian spices', 0, 1, 'cloves', 16, NULL, 'null', '0', 0, 0, 'null', 'products/1672213623_84178.jpg', NULL, '<div class=\"article-page active-page\" style=\"box-sizing: inherit; color: #4d4d4d; font-family: Roboto, Verdana, sans-serif; font-size: 21.008px; letter-spacing: -0.273104px;\" data-page=\"1\">\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Spices used to be worth their weight in gold, and cloves were no exception. Cloves are the dried flowers of the clove tree. Native to the Spice Islands near China, cloves spread throughout Europe and Asia during the late Middle Ages as an important part of local cuisine. Today, cloves remain an important spice that gives many dishes that special kick.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves can be used whole or ground. People often include ground cloves in spice mixes and whole cloves in recipes to add depth and flavor to a wide variety of foods. These small dark brown pods are used to spice up curries, season meats, enrich sauces like Worcestershire sauce, and even flavor spiced baked goods. They also provide some impressive health benefits.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<h2 id=\"091e9c5e81fc2c75-1-2\" style=\"box-sizing: inherit; font-size: 1.25rem; line-height: 1.75rem; margin: 1.125em 0px 0.75em; font-family: var(--sf-font-family,\'Source Sans Pro\',Verdana);\">Health Benefits</h2>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves are a great source of&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/vitamins/ai/ingredientmono-999/beta-carotene\" data-metrics-link=\"\">beta-carotene</a>, which helps give them their rich brown color. The carotene family of pigments are important antioxidants and&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/food-recipes/ss/slideshow-sources-vitamin-a\" data-metrics-link=\"\">provitamins</a>. Carotene pigments can convert&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/vitamins/ai/ingredientmono-964/vitamin-a\" data-metrics-link=\"\">into vitamin A</a>, an important nutrient for keeping your eyes healthy.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Some notable health benefits of cloves include:</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/arthritis/about-inflammation\" data-metrics-link=\"\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Reduced Inflammation</span></a></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves include multiple compounds that are linked to anti-inflammatory properties.&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/vitamins/ai/ingredientmono-251/clove\" data-metrics-link=\"\">Eugenol</a>&nbsp;is the most important of these compounds. Eugenol has been shown to reduce&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/arthritis/about-inflammation\" data-metrics-link=\"\">the inflammatory response</a>&nbsp;in the body, reducing the risk of diseases such as&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/rheumatoid-arthritis/guide/most-common-arthritis-types\" data-metrics-link=\"\">arthritis</a>&nbsp;and helping to manage symptoms.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/colorectal-cancer/qa/what-are-free-radicals-that-cause-cancer\" data-metrics-link=\"\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Fewer Free Radicals</span></a></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Eugenol is also a potent&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/cold-and-flu/qa/how-do-antioxidants-work-to-keep-you-healthy\" data-metrics-link=\"\">antioxidant</a>. Cloves are full of&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/diet/features/antioxidants-in-fruits#1\" data-metrics-link=\"\">antioxidants</a>. These compounds help your body to fight free radicals, which damage your cells and can lead to disease. By removing free radicals from your system, the antioxidants found in cloves can help reduce your risk of developing&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/heart-disease/default.htm\" data-metrics-link=\"\">heart disease</a>,&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/diabetes/default.htm\" data-metrics-link=\"\">diabetes</a>, and certain&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/cancer/default.htm\" data-metrics-link=\"\">cancers</a>.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/digestive-disorders/peptic-ulcer-overview#1\" data-metrics-link=\"\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Reduced Ulcers</span></a></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">There is some evidence that cloves can help protect your stomach from ulcers. Most ulcers are caused by thinning in the layers of mucus that&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/digestive-disorders/ss/slideshow-visual-guide-to-stomach-ulcers\" data-metrics-link=\"\">protect your stomach lining</a>. Preliminary studies show that eaten in large quanities,&nbsp;cloves can thicken this mucus, lowering your risk of developing ulcers and helping existing ulcers heal.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/digestive-disorders/picture-of-the-liver#1\" data-metrics-link=\"\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Improved Liver Function</span></a></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves may also promote better liver function. Some trials have shown that the eugenol found in cloves can help reduce signs of&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/digestive-disorders/understanding-cirrhosis-basic-information#1\" data-metrics-link=\"\">liver cirrhosis</a>&nbsp;and fatty liver disease. It may also improve general liver function.</p>\r\n</section>\r\n</div>\r\n<div class=\"article-page active-page\" style=\"box-sizing: inherit; color: #4d4d4d; font-family: Roboto, Verdana, sans-serif; font-size: 21.008px; letter-spacing: -0.273104px;\" data-page=\"2\">\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<h2 id=\"091e9c5e81fc2c75-2-4\" style=\"box-sizing: inherit; font-size: 1.25rem; line-height: 1.75rem; margin: 1.125em 0px 0.75em; font-family: var(--sf-font-family,\'Source Sans Pro\',Verdana);\">Nutrition</h2>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves provide a significant amount of the mineral&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/vitamins/ai/ingredientmono-182/manganese\" data-metrics-link=\"\">manganese</a>. Manganese helps your body manage the enzymes that help repair your bones and produce hormones. Manganese can also act as an antioxidant that protects your body from free radicals.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves are also an excellent source of:</p>\r\n<ul style=\"box-sizing: inherit; line-height: 1.43;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/vitamins-and-supplements/supplement-guide-vitamin-k\" data-metrics-link=\"\">Vitamin K</a></li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/heart-disease/potassium-and-your-heart#:~:text=Potassium%20plays%20a%20role%20in,your%20kidneys%20to%20filter%20blood.\" data-metrics-link=\"\">Potassium</a></li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Beta-carotene</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Eugenol</li>\r\n</ul>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Nutrients per Serving&nbsp;</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">A one teaspoon serving of cloves contains:</p>\r\n<ul style=\"box-sizing: inherit; line-height: 1.43;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Calories: 6</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/fitness-exercise/guide/good-protein-sources\" data-metrics-link=\"\">Protein</a>: Less than 1 gram</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/diet/features/good-fat-bad-fat\" data-metrics-link=\"\">Fat</a>: Less than 1 gram</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/diet/ss/slideshow-carbohydrates-overview\" data-metrics-link=\"\">Carbohydrates</a>: 1 gram</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\"><a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/diet/guide/fiber-how-much-do-you-need\" data-metrics-link=\"\">Fiber</a>: 1 gram</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Sugar: Less than 1 gram</li>\r\n</ul>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Things to Watch Out For</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves are potent in both their flavor and their effects. In general, cloves as spices are not worrisome nor are they potent health protectors, but there are a few things to keep in mind when adding cloves to your recipes.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Drug interactions.&nbsp;</span>Eugenol can sometimes interact with medication, such as Warfarin. If you&rsquo;re on blood-thinning medication, avoid consuming clove oil or clove tea. It&rsquo;s relatively safe to consume smaller amounts of cloves as spice, though.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Hypoglycemia.&nbsp;</span>Cloves may also affect blood sugar levels. In people with diabetes, eugenol can lower blood glucose counts to safe levels. However, in excessive amounts, cloves can cause&nbsp;<a style=\"box-sizing: inherit; text-decoration-line: none; transition: color 0.15s ease 0s; line-height: 1.875rem; font-weight: bold;\" href=\"https://www.webmd.com/diabetes/guide/diabetes-hypoglycemia\" data-metrics-link=\"\">hypoglycemia</a>, where your blood sugar levels are too low.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Essential Oil Toxicity.&nbsp;</span>Clove essential oil contains a much higher dose of eugenol than whole or ground cloves do. Consuming pure clove oil can be toxic and lead to symptoms such as dizziness or even coma.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<h2 id=\"091e9c5e81fc2c75-2-6\" style=\"box-sizing: inherit; font-size: 1.25rem; line-height: 1.75rem; margin: 1.125em 0px 0.75em; font-family: var(--sf-font-family,\'Source Sans Pro\',Verdana);\">How to Use Cloves</h2>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves are dried flowers, so they can be found all year long in spice shops, grocery stores, and health food stores nationwide.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves come in both whole and ground form. However, their potency quickly fades once they&rsquo;ve been ground. In order to keep their flavor strong, buy whole cloves and keep them in airtight containers until you want to use them. If you need ground cloves, you can grind them with a pepper mill so they remain as fresh as possible.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">You can also make clove tea if you&rsquo;re interested in getting a stronger dose of cloves:</p>\r\n<ol style=\"box-sizing: inherit;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Grind a tablespoon of whole cloves.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Steep the powder in boiling water for three or four minutes.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Strain the spice out and you&rsquo;ll be left with a rich spicy tea that&rsquo;s perfect for winter months.</li>\r\n</ol>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cloves are a soothing, healthy addition to your diet. Here are some other ways to use this flavorful spice:</p>\r\n<ul style=\"box-sizing: inherit; line-height: 1.43;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Add ground cloves to pumpkin pie</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Add cloves to chai lattes</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Use whole cloves in a pickling mix for spicy pickles</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Include cloves as an essential spice in curry</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Make mulled wine with a heavy sprinkle of cloves</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Use cloves in rubs to season meats</li>\r\n</ul>\r\n</section>\r\n</div>', 1, 1, 0, 'packet', 0, 0, 10, 0, '2022-11-14 07:55:03', '2023-02-10 10:00:28', NULL, ''),
(12, 1, 97, 'Corn', 'corn', 8, 0, 'corn', 23, NULL, 'null', '0', 0, 0, 'null', 'products/1672213618_46294.jpg', NULL, '<div style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit;\"><a class=\"chartbeat-section\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit;\" name=\"nutrition\"></a>Highly Nutritious</div>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Corn is high in carbs and packed with fiber, vitamins and minerals. It&rsquo;s also relatively low in protein and fat.</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">One cup (164 grams) of sweet yellow corn contains (5):</p>\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif; font-size: 18px;\">\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Calories:</span>&nbsp;177 calories</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Carbs:</span>&nbsp;41 grams</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Protein:</span>&nbsp;5.4 grams</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Fat:</span>&nbsp;2.1 grams</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Fiber:</span>&nbsp;4.6 grams</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Vitamin C:</span>&nbsp;17% of the daily value (DV)</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Thiamine (vitamin B1):</span>&nbsp;24% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Folate (vitamin B9):</span>&nbsp;19% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Magnesium:</span>&nbsp;11% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Potassium:</span>&nbsp;10% of the DV</li>\r\n</ul>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Most of the carbs in corn come from&nbsp;starch&nbsp;&mdash; which can quickly raise your blood sugar, depending on how much you eat. However, it&rsquo;s also high in fiber that can help balance your blood sugar levels (3<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span>,&nbsp;6).</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Due to its impressive nutrient profile, most people can benefit from eating whole corn and popcorn as part of a balanced diet. It&rsquo;s also a naturally&nbsp;gluten-free&nbsp;food and can be eaten by those who avoid gluten.</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">On the other hand, processed corn products may not be very nutritious, as refined oil, syrup and chips lose beneficial fiber and other nutrients during production. Also, many processed products are high in added salt, sugar or fat (7,&nbsp;8).</p>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 07:57:54', '2023-02-10 10:02:00', NULL, ''),
(13, 1, 94, 'Cumin', 'Cumin,masalas,indian masalas', 8, 1, 'cumin', 16, NULL, 'null', '0', 0, 0, 'null', 'products/1672213613_6686.jpg', NULL, '<div class=\"article-page active-page\" style=\"box-sizing: inherit; color: #4d4d4d; font-family: Roboto, Verdana, sans-serif; font-size: 21.008px; letter-spacing: -0.273104px;\" data-page=\"1\">\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cumin has been a part of the human diet for thousands of years. It&rsquo;s grown in the Middle East, Mediterranean, India, and China. Today, most cumin sold in the United States originally comes from India.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">People across the world use cumin as a seasoning in food and extract its oil for perfumes. It&rsquo;s also a popular remedy in traditional medicine&mdash;and for good reason. Cumin packs a lot of health benefits into a few tiny seeds.&nbsp;</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<h2 id=\"091e9c5e81fd5b11-1-2\" style=\"box-sizing: inherit; font-size: 1.25rem; line-height: 1.75rem; margin: 1.125em 0px 0.75em; font-family: var(--sf-font-family,\'Source Sans Pro\',Verdana);\">Health Benefits</h2>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">For generations, people have used cumin to treat conditions ranging from indigestion and diarrhea to headaches. People in India have used it to treat kidney and bladder stones, eye disease, and even leprosy.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Now, scientific research is finding evidence that backs up many of these traditional uses.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Antibacterial Effects</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Research has shown that cumin may help kill some bacteria that can get into your body and make you sick. In the lab, cumin has been shown to limit the growth of microorganisms, including&nbsp;<em style=\"box-sizing: inherit;\">E. coli&mdash;</em>a bacteria that can cause food poisoning. Its antibacterial properties might explain why people have traditionally used cumin as a preservative.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Cancer Prevention</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cancer develops when cells in the body start to multiply out of control. Tumors are collections of these abnormal cells. In several animal studies, scientists have found that cumin seeds may prevent the growth of different kinds of tumors, including those caused by liver, stomach, and colon cancers. More studies are needed to determine if cumin can help prevent cancer in humans.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Cholesterol Control</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Several studies have shown that cumin may help people control their cholesterol levels. In one study, cumin powder dissolved in yogurt helped reduce &ldquo;bad&rdquo; (LDL) cholesterol and triglycerides while increasing &ldquo;good&rdquo; (HDL) cholesterol.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Diabetes Management</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cumin may help people living with diabetes manage its symptoms and effects. Traditionally used as an antidiabetic drug, one study found that eating cumin can help lower urea in the blood&mdash;an organic compound that may interfere with how your body responds to insulin. Animal studies have also shown that cumin may help keep blood sugar at healthy levels, but more research is necessary.</p>\r\n</section>\r\n</div>\r\n<div class=\"article-page active-page\" style=\"box-sizing: inherit; color: #4d4d4d; font-family: Roboto, Verdana, sans-serif; font-size: 21.008px; letter-spacing: -0.273104px;\" data-page=\"2\">\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Improve Digestion</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Research has shown that cumin can help with several types of digestive issues. In one study, cumin extract significantly relieved&nbsp;irritable bowel syndrome&nbsp;(IBS) symptoms like belly pain, bloating, and the urgent need to go to the bathroom.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cumin has long been a popular folk remedy for diarrhea, and some initial studies have shown strong evidence to support this use.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Weight Control</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Several early studies have revealed that cumin may help people lose weight as part of a healthy diet. In one study, people who took cumin powder reduced their weight, waist circumference, fat mass, and&nbsp;body mass index&nbsp;(BMI). Another study found that cumin supplements may be as effective at reducing weight and BMI as a commonly used weight loss drug.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<h2 id=\"091e9c5e81fd5b11-2-5\" style=\"box-sizing: inherit; font-size: 1.25rem; line-height: 1.75rem; margin: 1.125em 0px 0.75em; font-family: var(--sf-font-family,\'Source Sans Pro\',Verdana);\">Nutrition</h2>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cumin contains compounds called flavonoids that work as antioxidants in the body. Antioxidants can help neutralize unstable particles called free radicals that cause cell damage. By neutralizing these particles, antioxidants can help prevent diseases like cancer, heart disease, and high blood pressure.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cumin is also a good source of:</p>\r\n<ul style=\"box-sizing: inherit; line-height: 1.43;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Vitamin A</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Calcium</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Iron</li>\r\n</ul>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Nutrients per Serving</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">1 teaspoon of cumin contains:</p>\r\n<ul style=\"box-sizing: inherit; line-height: 1.43;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Calories: 8</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Protein: 0 grams</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Fat: 0 grams</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Carbohydrates: 1 gram</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Fiber: 0 grams</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Sugar: 0 grams</li>\r\n</ul>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Things to Watch Out For</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Dried cumin seeds may be processed into ground cumin powder on machinery that has also processed common allergens, such as peanuts or tree nuts. If you have a peanut or tree nut allergy, be sure to check the label of any cumin you use to make sure it is free from allergens. If you are particularly sensitive to tree nuts or peanuts, you may consider purchasing whole cumin from a health food store then toasting and grinding the spice yourself.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem;\">\r\n<h2 id=\"091e9c5e81fd5b11-2-7\" style=\"box-sizing: inherit; font-size: 1.25rem; line-height: 1.75rem; margin: 1.125em 0px 0.75em; font-family: var(--sf-font-family,\'Source Sans Pro\',Verdana);\">How to Prepare Cumin</h2>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Cumin is a popular seasoning in many Indian and Latin American dishes. Some recipes call for use of the whole cumin seed while others use the powdered form.&nbsp;</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Both cumin seed and powder have a rich, earthy, nutty flavor. If you&rsquo;re using whole cumin seeds, try toasting them in a nonstick pan to bring out more of their unique flavor.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Here are just a few ways you can experiment with using cumin as a seasoning in your food:</p>\r\n<ul style=\"box-sizing: inherit; line-height: 1.43;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Add cumin to a spice rub for grilled chicken or fish.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Mix cumin with yogurt, veggies, and other spices to make a traditional Indian raita.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Toss cumin seeds with rice or couscous.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Stir cumin into your favorite chili recipe.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 1.125rem;\">Sprinkle a little cumin onto a salad for an extra kick.</li>\r\n</ul>\r\n</section>\r\n</div>', 1, 1, 0, 'loose', 0, 1, 10, 1, '2022-11-14 08:00:24', '2023-02-10 10:00:13', NULL, ''),
(14, 1, 95, 'Red Chilli', 'Red chilli,Chilli,spices', 8, 1, 'red-chilli', 16, NULL, 'null', '0', 0, 0, 'null', 'products/1672213608_6499.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\"><span style=\"color: #000000;\">Product information</span></h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\"><span style=\"color: #000000;\">Technical Details</span></h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Weight</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;200 Grams</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Ingredient Type</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;Vegetarian</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Brand</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;Generic</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Region Produced In</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;INDIA</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Item Package Quantity</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;1</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Form</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;CHILLI</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Package Information</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;Bag</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Package Information</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;Pouch</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Manufacturer</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;Amiras Agro and Foods, Nani Agro Foods Pvt. Ltd., STERLING GROCERIES PVT LTD</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Item part number</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;Red Chilli (Lal Mirch) 1</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Net Quantity</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;200.0 gram</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Product Dimensions</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;30.4 x 20.3 x 4.3 cm; 200 Grams</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Ingredients</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;CHILLI</span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\"><span style=\"color: #000000;\">Country of Origin</span></th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\"><span style=\"color: #000000;\">&lrm;India</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 08:03:42', '2023-02-10 10:00:20', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(15, 1, 93, 'Rice', 'rice', 0, 1, 'rice', 23, NULL, 'null', '0', 0, 0, 'null', 'products/1672213588_14750.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;No artificial colors</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Generic</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Package Information</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Box</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Generic</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Allergen Information</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Allergen-Free</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item part number</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;8539</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1000.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredients</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Thooyamalli Rice</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 08:05:39', '2023-02-10 10:00:02', NULL, ''),
(16, 1, 92, 'Saffron', 'Saffron,Kashmiri Kesar,Kesar,spices,Indian spices', 8, 1, 'saffron', 16, NULL, 'null', '0', 0, 0, 'null', 'products/1672213555_2333.jpg', NULL, '<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Kashmiri Kesar</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Generic</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 0, 0, 10, 1, '2022-11-14 08:12:00', '2023-02-10 09:59:54', NULL, ''),
(17, 1, 90, 'Soybean Oil', 'Soybean Oil,oil,Soybean', 0, 1, 'soybean-oil', 61, NULL, 'null', '0', 0, 0, 'null', 'products/1672213546_26106.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Natural</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;4.51 Kilograms</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Volume</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;5 Litres</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;PUVI</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Form</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Liquid</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Package Information</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Bottle</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;The Universal Seeds Corporation</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Allergen Information</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Peanuts</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;5000 milliliter</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Package Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;32.5 x 15.7 x 15.6 cm; 4.51 Kilograms</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'packet', 0, 0, 10, 0, '2022-11-14 08:15:03', '2023-02-10 09:59:21', NULL, ''),
(18, 1, 89, 'Sunflowers Oil', 'Sunflowers Oil,oil,Sunflowers', 0, 1, 'sunflowers-oil', 61, NULL, 'India', '0', 0, 0, 'null', 'products/1672213539_41079.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;5 Kilograms</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Conscious Food</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Conscious Food</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;5000.0 milliliter</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;27 x 15 x 23 cm; 5 Kilograms</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredients</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Organic Sunflower Oil</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 0, 0, 10, 1, '2022-11-14 08:16:47', '2023-02-10 09:59:06', NULL, ''),
(19, 1, 109, 'Wheat', 'Wheat,grain', 7, 1, 'wheat', 23, NULL, 'null', '0', 0, 0, 'null', 'products/1672213730_36541.jpg', NULL, '<hr class=\"a-divider-normal bucketDivider\" style=\"box-sizing: border-box; background-color: #ffffff; border-bottom-style: initial; border-bottom-color: initial; border-left-style: initial; border-left-color: initial; border-right-style: initial; border-right-color: initial; line-height: 19px; margin-top: 0px; border-image: initial; filter: none; z-index: 0; zoom: 1; clear: left; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; height: 44px !important; margin-bottom: -36px !important; background-image: initial !important; background-position: 0px 0px !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important;\" aria-hidden=\"true\" />\r\n<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 24px; line-height: 32px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff;\">Product details</h2>\r\n<div id=\"detailBullets_feature_div\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<ul class=\"a-unordered-list a-nostyle a-vertical a-spacing-none detail-bullet-list\" style=\"box-sizing: border-box; margin: 0px 0px 1px 18px; padding: 0px;\">\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Country of Origin &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">India</span></span></li>\r\n<li style=\"box-sizing: border-box; list-style: none; overflow-wrap: break-word; margin: 0px 0px 5.5px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\"><span class=\"a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important;\">Net Quantity &rlm; : &lrm;&nbsp;</span><span style=\"box-sizing: border-box;\">1.00 count</span></span></li>\r\n</ul>\r\n</div>', 0, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 08:18:42', '2023-07-10 08:29:30', NULL, ''),
(20, 1, 125, 'Apple', 'apple,kashmiri apple,fruits', 0, 1, 'apple', 4, 1, 'null', '0', 1, 1, '4', 'products/1672213561_50498.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1 Kilograms</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Generic</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Generic</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1.00 count</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1 Kilogram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 20, 'loose', 0, 1, 10, 1, '2022-11-14 08:21:26', '2023-04-19 06:25:34', NULL, ''),
(21, 1, 69, 'Banana', 'banana,fruit', 0, 1, 'banana', 4, NULL, 'null', '0', 1, 0, 'null', 'products/1672213499_61860.jpg', NULL, '<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px; height: 238px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box; height: 34px;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important; height: 34px;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important; height: 34px;\">&lrm;Rich_in_vitamins</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; height: 34px;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important; height: 34px;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important; height: 34px;\">&lrm;0.5 Kilograms</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; height: 34px;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important; height: 34px;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important; height: 34px;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; height: 34px;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important; height: 34px;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important; height: 34px;\">&lrm;Fresh</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; height: 34px;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important; height: 34px;\">Item Package Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important; height: 34px;\">&lrm;1</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; height: 34px;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important; height: 34px;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important; height: 34px;\">&lrm;22.86 x 11.43 x 6.35 cm; 500 Grams</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 1, 'loose', 0, 1, 10, 1, '2022-11-14 08:25:02', '2022-12-28 07:44:59', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(22, 1, 68, 'Graps', 'Graps', 0, 1, 'graps', 4, NULL, 'null', '0', 0, 0, 'null', 'products/1672213492_37422.jpg', NULL, '<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Natural</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;500 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Region Produced In</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Form</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Whole</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;500.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;19.05 x 11.43 x 8.89 cm; 500 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 08:26:48', '2022-12-28 07:44:52', NULL, ''),
(23, 1, 81, 'Kiwi', 'Kiwi,Kiwi Fruit,Fruit', 0, 1, 'kiwi', 4, NULL, 'null', '0', 0, 0, 'null', 'products/1672213726_83919.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;400 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;500 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'packet', 0, 0, 10, 0, '2022-11-14 08:49:39', '2022-12-28 07:48:46', NULL, ''),
(24, 1, 67, 'Mango', 'Mango,Mango fruit,fruit', 0, 1, 'mango', 4, NULL, 'null', '0', 0, 0, 'null', 'products/1672213487_37834.jpg', NULL, '<table class=\"a-normal a-spacing-micro\" style=\"width: 440.047px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-bottom: 4px !important;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small po-plant_or_animal_product_type\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; float: none !important; margin-right: 0px; width: 115.203px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Plant or Animal Product Type</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; float: none !important; margin-right: 0px; width: 324.844px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Fruit</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-indoor_outdoor_usage\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 115.203px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Indoor/Outdoor Usage</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 324.844px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Outdoor</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-brand\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 115.203px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 324.844px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Generic</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-material_feature\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 115.203px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Material Feature</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 324.844px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Organic</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-color\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 115.203px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Colour</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 324.844px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Green</span></td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, 1, 0, 'loose', 0, 1, 10, 1, '2022-11-14 08:54:30', '2022-12-28 07:44:47', NULL, ''),
(25, 1, 66, 'Orange', 'orange,fruit,Orange Fruit', 0, 1, 'orange', 4, NULL, 'null', '0', 0, 0, 'null', 'products/1672213479_95893.jpg', NULL, '<table class=\"a-normal a-spacing-micro\" style=\"width: 637.688px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-bottom: 4px !important; height: 150.563px;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small po-brand\" style=\"box-sizing: border-box; margin-bottom: 8px !important; height: 23.5938px;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 152.719px; float: none !important; height: 23.5938px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 484.969px; float: none !important; height: 23.5938px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Generic</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-plant_or_animal_product_type\" style=\"box-sizing: border-box; margin-bottom: 8px !important; height: 47.1875px;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 152.719px; float: none !important; height: 47.1875px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Plant or Animal Product Type</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 484.969px; float: none !important; height: 47.1875px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Orange</span></td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 08:58:47', '2022-12-28 07:44:39', NULL, ''),
(26, 1, 83, 'Pinapple', 'pinapple,pineapple fruit,fruit', 0, 1, 'pinapple', 4, 1, 'null', '0', 0, 0, 'null', 'products/1672213756_46828.jpg', NULL, '<div style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit;\"><a class=\"chartbeat-section\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit;\" name=\"TOC_TITLE_HDR_2\"></a>Loaded with nutrients</div>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Pineapples are low in calories but boast an impressive nutrient profile. Just 1 cup (165 grams) of pineapple chunks contains the following nutrients (<a class=\"content-link css-5r4717\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer; text-decoration-line: none; border-color: currentcolor; color: #02838d;\" href=\"https://fdc.nal.usda.gov/fdc-app.html#/food-details/169124/nutrients\" target=\"_blank\" rel=\"noopener noreferrer\">2<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span></a>):</p>\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif; font-size: 18px;\">\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Calories:</span>&nbsp;83</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Fat:</span>&nbsp;1.7 grams</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Protein:</span>&nbsp;1 gram</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Carbs:</span>&nbsp;21.6 grams</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Fiber:</span>&nbsp;2.3 grams</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Vitamin C:</span>&nbsp;88% of the Daily Value (DV)</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Manganese:</span>&nbsp;109% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Vitamin B6:</span>&nbsp;11% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Copper:</span>&nbsp;20% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Thiamine:</span>&nbsp;11% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Folate:</span>&nbsp;7% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Potassium:</span>&nbsp;4% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Magnesium:</span>&nbsp;5% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Niacin:</span>&nbsp;5% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Pantothenic acid:</span>&nbsp;7% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Riboflavin:</span>&nbsp;4% of the DV</li>\r\n<li style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; line-height: 26px; margin-bottom: 8px;\"><span style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; font-weight: bolder;\">Iron:</span>&nbsp;3% of the DV</li>\r\n</ul>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Pineapples also contain trace amounts of phosphorus, zinc, calcium, and vitamins A and K.</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">As you can see, this fruit is particularly rich in&nbsp;vitamin C&nbsp;and manganese. Vitamin C is essential for immune health, iron absorption, and growth and development, while manganese offers antioxidant properties and aids in growth and metabolism (3<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span>,&nbsp;4<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span>).</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Antioxidants help prevent oxidation in your body, which may help ward off the inflammation that can lead to cancer and other chronic diseases (5<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span>).</p>\r\n<p style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; margin-bottom: 25px; margin-top: 25px; font-size: 18px; line-height: 26px; color: #231f20; font-family: \'Proxima Nova\', \'Proxima Nova Fallback\', sans-serif;\">Pineapples also contain other micronutrients, such as copper, thiamine, and vitamin B6, which are&nbsp;essential for healthy metabolism&nbsp;(6<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span>,&nbsp;7<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span>,&nbsp;8<span class=\"css-1mdvjzu icon-hl-trusted-source-after\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; cursor: pointer;\"><span class=\"sro\" style=\"-webkit-font-smoothing: antialiased; box-sizing: inherit; position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;\">Trusted Source</span></span>).</p>', 1, 1, 0, 'packet', 0, 0, 10, 0, '2022-11-14 09:05:27', '2022-12-28 07:49:16', NULL, ''),
(27, 1, 80, 'Strawberry', 'Strawberry,Strawberry fruit,fruit', 0, 1, 'strawberry', 4, NULL, 'null', '0', 0, 0, 'null', 'products/1672213721_18145.jpg', NULL, '<section style=\"box-sizing: inherit; font-size: 1.1875rem; color: #4d4d4d; font-family: Roboto, Verdana, sans-serif; letter-spacing: -0.273104px;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">The&nbsp;heart-shaped silhouette of the strawberry is the first clue that this fruit is good for you. These potent little packages protect your heart, increase HDL (good) cholesterol, lower your&nbsp;blood pressure, and guard against&nbsp;cancer.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Packed with vitamins, fiber, and exceptionally high levels of&nbsp;antioxidants&nbsp;known as polyphenols, strawberries are a sodium-free, fat-free, cholesterol-free, low-calorie food. They are among the top 20 fruits in antioxidant capacity and are a good source of manganese and&nbsp;potassium. Just one serving -- about eight strawberries -- provides more&nbsp;vitamin C&nbsp;than an orange.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">This member of the rose family isn&rsquo;t really a fruit or a berry but an enlarged receptacle of the flower. Choose medium-sized berries that are firm, plump, and deep red; once picked, they don&rsquo;t ripen further. First cultivated in ancient Rome, strawberries are now the most popular berry fruit in the world. In provincial France, they were regarded as an aphrodisiac. These red gems may be good for your heart in more ways than one.</p>\r\n</section>\r\n<section style=\"box-sizing: inherit; font-size: 1.1875rem; color: #4d4d4d; font-family: Roboto, Verdana, sans-serif; letter-spacing: -0.273104px;\">\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Want other ways to get your vitamin C? Try brussels sprouts, cabbage, cauliflower, mango, papaya, red peppers, watermelon, and winter squash.</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\"><span style=\"box-sizing: inherit; font-weight: bolder;\">Strawberry Salad With Grilled Shrimp</span></p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Makes 4 servings</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Salad:</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">2 cups baby spinach, rinsed and dried</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">2 cups arugula, rinsed and dried</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">2 cups strawberries (about 1 pt), hulled and sliced</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">2 oz crumbled goat cheese</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">3 tbsp pecans, toasted and chopped</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">2 small green onions, sliced</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">1 lb shrimp, cleaned and deveined</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Dressing:</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">2 tbsp balsamic vinegar</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">1 tbsp honey mustard</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">1 tbsp olive oil</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">1 tbsp fresh chopped basil</p>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Pinch of salt and freshly ground pepper</p>\r\n<ol style=\"box-sizing: inherit;\">\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Combine all salad ingredients (except shrimp) in a large bowl. Toss gently.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Make the dressing: Whisk the vinegar and mustard together in a small bowl; slowly whisk in olive oil. Add basil and season with salt and pepper.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Grill the shrimp: Heat and oil an outdoor or stove-top grill. When hot, add shrimp and grill 3 to 4 minutes on each side until slightly charred and cooked through. Remove from heat.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Divide salad among four plates. Arrange grilled shrimp on top.</li>\r\n<li style=\"box-sizing: inherit; margin-bottom: 0.75rem;\">Drizzle dressing over each and serve.</li>\r\n</ol>\r\n<p style=\"box-sizing: inherit; line-height: 1.875rem; margin: 0px 0px 1.125rem;\">Per serving: 251 calories, 23 g protein, 12.5 g carbohydrate, 12.8 g fat (4 g&nbsp;saturated fat), 177 mg&nbsp;cholesterol, 2.5 g fiber, 306 mg sodium. Calories from fat: 45%.</p>\r\n</section>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 09:09:25', '2022-12-28 07:48:41', NULL, ''),
(28, 1, 64, 'Delicious Cookies', 'Delicious cookies,cookies', 0, 1, 'delicious-cookies', 5, NULL, 'null', '0', 0, 0, 'null', 'products/1672213405_9087.jpg', NULL, '<p id=\"mntl-sc-block_1-0\" class=\"comp mntl-sc-block mntl-sc-block-html\" style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; font-family: SourceSansPro, Helvetica, sans-serif; font-size: 18px; line-height: 1.75rem; text-underline-offset: 0.25rem; counter-reset: section 0; color: rgba(0, 0, 0, 0.95); background-color: #ffffff;\">Cookies come in all shapes, sizes, and flavors &mdash; but one thing they have in common is they depend on the right ingredients, techniques, and tools to make them the best they can be. Because there are so many different kinds of cookies, we can offer general guidelines on how to make cookies &mdash; but you should always follow the instructions for the particular recipe you\'re making.</p>\r\n<div id=\"mntl-sc-block_1-0-1\" class=\"comp mntl-sc-block mntl-sc-block-adslot mntl-block\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; color: rgba(0, 0, 0, 0.95); font-family: SourceSansPro, Helvetica, sans-serif; font-size: 18px; background-color: #ffffff;\"></div>\r\n<p id=\"mntl-sc-block_1-0-2\" class=\"comp mntl-sc-block mntl-sc-block-html\" style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; font-family: SourceSansPro, Helvetica, sans-serif; font-size: 18px; line-height: 1.75rem; text-underline-offset: 0.25rem; counter-reset: section 0; color: rgba(0, 0, 0, 0.95); background-color: #ffffff;\">Let\'s get straight to our top 10 tips for making better cookies, then we\'ll look at how to make cookie dough and troubleshoot common cookie-making problems. Finally, we\'ll dive deeper into choosing the right cookie ingredients and highlight some essential cooking-making tools you\'ll need.</p>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 09:15:38', '2022-12-28 07:43:25', NULL, ''),
(29, 1, 150, 'Lay\'s Wafers', 'Lay\'s Wafers,Wafers,Lay\'s', 0, 0, 'lays-wafers', 5, NULL, 'null', '0', 0, 0, 'null', 'products/1672213391_15509.jpg', NULL, '<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Lay\'s</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Pepsico India Holdings Pvt Ltd-Fritolay Division</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item part number</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;102072679</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;52.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;5 x 17 x 27 cm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'packet', 0, 1, 10, 0, '2022-11-14 09:50:57', '2023-08-15 06:13:02', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(30, 1, 62, 'Nachos', 'Nachos,namkeens', 0, 1, 'nachos', 5, NULL, 'null', '0', 1, 1, '3', 'products/1672213384_88197.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Cuisine</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Indian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Green Sun</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item Package Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Form</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Dried</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Package Information</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Pouch</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Avo Wellness Private Limited</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;200 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Package Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;24.1 x 16.1 x 7.9 cm; 240 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 10, 'packet', 1, 1, 1000, 0, '2022-11-14 09:53:56', '2022-12-28 07:43:04', NULL, ''),
(31, 1, 61, 'Peanut Brittle', 'Peanut Brittle,Peanut ,Brittle', 0, 1, 'peanut-brittle', 5, NULL, 'null', '0', 1, 1, '6', 'products/1672213378_92188.jpg', NULL, '<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; color: #cc6600 !important;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2656px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;LIVING FOOD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;LIVING FOOD</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item part number</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;SNASHKCHKI1</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;200.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;5.5 x 6 x 20 cm</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredients</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Peanuts, Jaggery, Cardamom, Dry Ginger</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">&nbsp;</div>\r\n</div>\r\n<div class=\"a-column a-span6 a-span-last\" style=\"box-sizing: border-box; margin-right: 0px; float: right; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div id=\"productDetails_db_sections\" class=\"a-section\" style=\"box-sizing: border-box; margin-bottom: 0px;\">\r\n<h1 class=\"a-size-medium a-spacing-small secHeader\" style=\"box-sizing: border-box; padding: 0px 0px 7px 10px; text-rendering: optimizelegibility; font-weight: 400; font-size: 16px; line-height: 24px !important; border-bottom: 1px solid #cccccc; margin: 0px 0px 8px !important 0px;\">Additional Information</h1>\r\n<div class=\"a-section table-padding\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 12px;\">\r\n<table id=\"productDetails_detailBullets_sections1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 704.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Item Dimensions LxWxH</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">5.5 x 6 x 20 Centimeters</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 10, 'loose', 0, 1, 25, 1, '2022-11-14 09:55:58', '2022-12-28 07:42:58', NULL, ''),
(32, 1, 8, 'Beetroot', 'Beetroot,vagetable', 0, 1, 'beetroot', 6, NULL, 'null', '0', 0, 0, 'null', 'products/1672213372_46578.jpg', NULL, '<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Natural</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;0.5 Kilograms</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Fresh</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Form</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Peeled</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Fresh</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item model number</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Fresh_33</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;500.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;13.97 x 13.97 x 7.62 cm; 500 Grams</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'packet', 1, 1, 10, 0, '2022-11-14 10:03:22', '2023-05-24 09:31:39', NULL, ''),
(33, 1, 5, 'Cabbage', 'Cabbage,vagetable,Cabbage vagetable', 0, 1, 'cabbage', 6, NULL, 'null', '0', 0, 0, 'null', 'products/1672213293_11988.jpg', NULL, '<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Natural</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;500 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Fresh</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item Package Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Form</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Whole</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Fresh</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item model number</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Fresh_307</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;500.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;10.16 x 7.62 x 10.16 cm; 500 Grams</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 1, 0, 10, 1, '2022-11-14 10:04:56', '2023-05-24 09:31:39', NULL, ''),
(34, 1, 4, 'Carrot', 'Carrot,Carrot Vagetable,Vagetable', 0, 1, 'carrot', 6, NULL, 'null', '0', 0, 0, 'null', 'products/1672213251_75283.jpg', NULL, '<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.688px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Natural</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1000 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Item Package Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Form</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Peeled</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1000.0 gram</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Package Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;15.01 x 15.01 x 5 cm; 1 Kilograms</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 0, 0, 10, 0, '2022-11-14 10:06:48', '2023-05-24 09:31:39', NULL, ''),
(35, 1, 3, 'Eggplant', 'Eggplant,Eggplant Vagetable,Vagetable', 0, 1, 'eggplant', 6, NULL, 'null', '0', 0, 0, 'null', 'products/1672213080_91896.jpg', NULL, '<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important;\">About this item</h1>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: #0f1111; padding: 0px; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Package contains approximate 100 seeds</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Sow them in soil in your own kitchen garden and enjoy fresh veggies</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Germination results on testing are excellent however, germination depends on suitable climate, suitable temperature and preparation of soil at the location so please take proper care of the same for best results</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">The plant picture displayed is an indication of type only</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">A Quality Product from Nature Valley Gardens</span></li>\r\n</ul>', 1, 1, 0, 'packet', 1, 0, 10, 0, '2022-11-14 10:08:53', '2023-05-24 09:31:39', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(36, 1, 157, 'Onion', 'Onion,Onion Vagetable,Vagetable', 0, 0, 'onion', 6, 1, 'null', '0', 0, 0, 'null', 'products/1672213039_90856.jpg', NULL, '<div id=\"productOverview_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"productOverview\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productOverview\" data-csa-c-slot-id=\"productOverview_feature_div\" data-csa-c-asin=\"B07BG62MBV\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"syawe7-n9j4em-yx1nke-mlzv2a\" data-cel-widget=\"productOverview_feature_div\">\r\n<div class=\"a-section a-spacing-small a-spacing-top-small\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-top: 8px !important;\">\r\n<table class=\"a-normal a-spacing-micro\" style=\"width: 513.25px; margin-bottom: 4px !important;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small po-diet_type\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Diet Type</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Vegetarian</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_form\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Form</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Whole</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-brand\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Fresh</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_weight\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Weight</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1 Kilograms</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-number_of_items\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 0px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Number of Items</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 0px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<div id=\"featurebullets_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"featurebullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"featurebullets\" data-csa-c-slot-id=\"featurebullets_feature_div\" data-csa-c-asin=\"B07BG62MBV\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"nxjpx1-ze6wpa-pwyvah-h4xjr2\" data-cel-widget=\"featurebullets_feature_div\">\r\n<div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\" style=\"box-sizing: border-box; margin-top: 8px !important; margin-bottom: 0px;\">\r\n<div id=\"vnv-container\" class=\"a-section a-spacing-none vnv-container\" style=\"box-sizing: border-box; margin-bottom: 22px; padding-top: 5px; position: relative;\">\r\n<div id=\"inner-container-veg\" class=\"a-section a-spacing-none vnv-inner-container vnv-inner-container-veg\" style=\"box-sizing: border-box; margin-bottom: 22px; display: inline-block; height: 26px; border: 2px solid green;\">\r\n<div id=\"outer-veg\" class=\"a-section vnv-outer\" style=\"box-sizing: border-box; margin-bottom: 0px; width: 22px; height: 22px; float: left; position: relative;\">\r\n<div id=\"circle-veg\" class=\"a-section vnv-circle vnv-circle-veg\" style=\"box-sizing: border-box; margin: 3px 0px 0px 3px; border-radius: 100%; width: 16px; background-color: green;\"></div>\r\n</div>\r\n</div>\r\n<div id=\"text-veg\" class=\"a-section vnv-text\" style=\"box-sizing: border-box; margin-bottom: 0px; display: inline-block; padding-left: 10px; height: 22.68px; padding-top: 2px; position: absolute; margin-top: 2px;\">This is a&nbsp;<span style=\"box-sizing: border-box; font-weight: bold;\">Vegetarian</span>&nbsp;product.</div>\r\n</div>\r\n<hr style=\"box-sizing: border-box; background-color: transparent; border-top-color: #e7e7e7; height: 1px; line-height: 19px; margin-bottom: 14px; margin-top: 0px;\" />\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 16px !important; line-height: 24px !important;\">About this item</h1>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; padding: 0px;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Rich in antioxidants</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Good source of manganese, copper, Vitamin B6, Vitamin C and Dietary Fibers</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Can be used in curries, snacks and salads</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Store at room temperature, away from direct sunlight</span></li>\r\n</ul>\r\n</div>\r\n</div>', 1, 1, 0, 'packet', 1, 0, 10, 1, '2022-11-14 10:10:17', '2023-08-23 08:37:21', NULL, ''),
(39, 1, 2, 'Bell Pepper', 'Bell Pepper,Bell Pepper Vagetable,Vagetable', 0, 1, 'bell-pepper', 6, NULL, 'null', '98', 0, 0, 'null', 'products/1672213036_76761.jpg', NULL, '<div id=\"productOverview_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"productOverview\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productOverview\" data-csa-c-slot-id=\"productOverview_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"7zzzy2-urcnmc-xoflrc-x0p9z5\" data-cel-widget=\"productOverview_feature_div\">\r\n<div class=\"a-section a-spacing-small a-spacing-top-small\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-top: 8px !important;\">\r\n<table class=\"a-normal a-spacing-micro\" style=\"width: 513.25px; margin-bottom: 4px !important;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small po-diet_type\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Diet Type</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Vegetarian</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_form\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Form</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Whole</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-brand\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">OnlyHydroponics</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_weight\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Weight</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">250 Grams</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-unit_count\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 0px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Units</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 0px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1 count</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<div id=\"featurebullets_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"featurebullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"featurebullets\" data-csa-c-slot-id=\"featurebullets_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"jjsrdb-rg8peu-djxfl6-bxvi8f\" data-cel-widget=\"featurebullets_feature_div\">\r\n<div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\" style=\"box-sizing: border-box; margin-top: 8px !important; margin-bottom: 0px;\">\r\n<div id=\"vnv-container\" class=\"a-section a-spacing-none vnv-container\" style=\"box-sizing: border-box; margin-bottom: 22px; padding-top: 5px; position: relative;\">\r\n<div id=\"inner-container-veg\" class=\"a-section a-spacing-none vnv-inner-container vnv-inner-container-veg\" style=\"box-sizing: border-box; margin-bottom: 22px; display: inline-block; height: 26px; border: 2px solid green;\">\r\n<div id=\"outer-veg\" class=\"a-section vnv-outer\" style=\"box-sizing: border-box; margin-bottom: 0px; width: 22px; height: 22px; float: left; position: relative;\">\r\n<div id=\"circle-veg\" class=\"a-section vnv-circle vnv-circle-veg\" style=\"box-sizing: border-box; margin: 3px 0px 0px 3px; border-radius: 100%; width: 16px; background-color: green;\"></div>\r\n</div>\r\n</div>\r\n<div id=\"text-veg\" class=\"a-section vnv-text\" style=\"box-sizing: border-box; margin-bottom: 0px; display: inline-block; padding-left: 10px; height: 22.68px; padding-top: 2px; position: absolute; margin-top: 2px;\">This is a&nbsp;<span style=\"box-sizing: border-box; font-weight: bold;\">Vegetarian</span>&nbsp;product.</div>\r\n</div>\r\n<hr style=\"box-sizing: border-box; background-color: transparent; border-top-color: #e7e7e7; height: 1px; line-height: 19px; margin-bottom: 14px; margin-top: 0px;\" />\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 16px !important; line-height: 24px !important;\">About this item</h1>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; padding: 0px;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Pesticides free Sweet Bell Peppers</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Packed in a hygienic hydroponics facility with no touch of bare hands</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Grown using purified RO water without any chemical or heavy metal residue</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Comes in refrigerable, reusable packaging and should last 5 days at &lt; 5 &deg;C</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div id=\"edpIngress_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"edpIngress\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"edpIngress\" data-csa-c-slot-id=\"edpIngress_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"hwghf6-5tgb0l-i7csh7-5j8ln3\" data-cel-widget=\"edpIngress_feature_div\"><span id=\"edpIngressContainer\" style=\"box-sizing: border-box;\"></span></div>\r\n<div id=\"vendorPoweredCoupon_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-feature-name=\"vendorPoweredCoupon\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"vendorPoweredCoupon\" data-csa-c-slot-id=\"vendorPoweredCoupon_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"oy3a1c-uf3krt-uoqmo9-fe09yg\" data-cel-widget=\"vendorPoweredCoupon_feature_div\"></div>\r\n<div id=\"productAlert_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; display: table; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-feature-name=\"productAlert\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productAlert\" data-csa-c-slot-id=\"productAlert_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"6w97fh-pllkna-8wd54m-i4zjaz\" data-cel-widget=\"productAlert_feature_div\"></div>\r\n<div id=\"newerVersion_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-feature-name=\"newerVersion\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"newerVersion\" data-csa-c-slot-id=\"newerVersion_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"wudy60-7k4vag-czltaf-b2ygv1\" data-cel-widget=\"newerVersion_feature_div\"></div>\r\n<div id=\"andonCord_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-feature-name=\"andonCord\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"andonCord\" data-csa-c-slot-id=\"andonCord_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"p5vnp7-2dy5qo-lcn77h-9eefck\" data-cel-widget=\"andonCord_feature_div\"></div>\r\n<div id=\"globalStoreInfoBullets_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-feature-name=\"globalStoreInfoBullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"globalStoreInfoBullets\" data-csa-c-slot-id=\"globalStoreInfoBullets_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"puyqa4-ucxcya-5cq4zf-5w5zjf\" data-cel-widget=\"globalStoreInfoBullets_feature_div\"></div>\r\n<div id=\"provenanceCertifications_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" data-feature-name=\"provenanceCertifications\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"provenanceCertifications\" data-csa-c-slot-id=\"provenanceCertifications_feature_div\" data-csa-c-asin=\"B09JPFWP2P\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"q1ub2k-ap6d7l-iasia4-aju3ya\" data-cel-widget=\"provenanceCertifications_feature_div\"></div>', 1, 1, 0, 'loose', 1, 0, 10, 0, '2022-11-14 10:12:19', '2023-05-24 09:31:39', NULL, ''),
(40, 1, 7, 'Potato', 'Potato,vagetable,potato vagetable', 0, 1, 'potato', 6, NULL, 'null', '0', 1, 1, '5', 'products/1672212958_89198.jpg', NULL, '<div id=\"productOverview_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"productOverview\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productOverview\" data-csa-c-slot-id=\"productOverview_feature_div\" data-csa-c-asin=\"B07BG5GZP2\" data-csa-c-is-in-initial-active-row=\"false\" data-cel-widget=\"productOverview_feature_div\" data-csa-c-id=\"m8q27l-ao4kyl-em3891-pssb4z\">\r\n<div class=\"a-section a-spacing-small a-spacing-top-small\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-top: 8px !important;\">\r\n<table class=\"a-normal a-spacing-micro\" style=\"width: 513.25px; margin-bottom: 4px !important;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small po-diet_type\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Diet Type</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Vegetarian</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_form\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Form</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Peeled</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-brand\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Fresh</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_weight\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Weight</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1 Kilograms</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-number_of_items\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 0px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Number of Items</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 0px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<div id=\"featurebullets_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"featurebullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"featurebullets\" data-csa-c-slot-id=\"featurebullets_feature_div\" data-csa-c-asin=\"B07BG5GZP2\" data-csa-c-is-in-initial-active-row=\"false\" data-cel-widget=\"featurebullets_feature_div\" data-csa-c-id=\"w9x4xl-hix2oi-i5pdlh-oait79\">\r\n<div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\" style=\"box-sizing: border-box; margin-top: 8px !important; margin-bottom: 0px;\">\r\n<div id=\"vnv-container\" class=\"a-section a-spacing-none vnv-container\" style=\"box-sizing: border-box; margin-bottom: 22px; padding-top: 5px; position: relative;\">\r\n<div id=\"inner-container-veg\" class=\"a-section a-spacing-none vnv-inner-container vnv-inner-container-veg\" style=\"box-sizing: border-box; margin-bottom: 22px; display: inline-block; height: 26px; border: 2px solid green;\">\r\n<div id=\"outer-veg\" class=\"a-section vnv-outer\" style=\"box-sizing: border-box; margin-bottom: 0px; width: 22px; height: 22px; float: left; position: relative;\">\r\n<div id=\"circle-veg\" class=\"a-section vnv-circle vnv-circle-veg\" style=\"box-sizing: border-box; margin: 3px 0px 0px 3px; border-radius: 100%; width: 16px; background-color: green;\"></div>\r\n</div>\r\n</div>\r\n<div id=\"text-veg\" class=\"a-section vnv-text\" style=\"box-sizing: border-box; margin-bottom: 0px; display: inline-block; padding-left: 10px; height: 22.68px; padding-top: 2px; position: absolute; margin-top: 2px;\">This is a&nbsp;<span style=\"box-sizing: border-box; font-weight: bold;\">Vegetarian</span>&nbsp;product.</div>\r\n</div>\r\n<hr style=\"box-sizing: border-box; background-color: transparent; border-top-color: #e7e7e7; height: 1px; line-height: 19px; margin-bottom: 14px; margin-top: 0px;\" />\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 16px !important; line-height: 24px !important;\">About this item</h1>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; padding: 0px;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">High source of fibre</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Good source of Vitamin B6, C, Potassium, and Magnesium</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Can be used in multiple dishes and snacks</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Store at room temperature, away from direct sunlight</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">ingredients:Fresh potatoes</span></li>\r\n</ul>\r\n</div>\r\n</div>', 1, 1, 0, 'loose', 1, 0, 10, 0, '2022-11-14 10:16:29', '2023-05-24 09:31:39', NULL, ''),
(41, 1, 147, 'Tomato', 'Tomato,Vagetable,Tomato Vagetable', 0, 0, 'tomato1', 6, NULL, NULL, '0', 1, 1, '5', 'products/1668421529_58473.jpg', NULL, '<div id=\"productOverview_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"productOverview\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productOverview\" data-csa-c-slot-id=\"productOverview_feature_div\" data-csa-c-asin=\"B07BG7LB3Q\" data-csa-c-is-in-initial-active-row=\"false\" data-cel-widget=\"productOverview_feature_div\" data-csa-c-id=\"3pcf5r-1ttihs-11xte8-6zuuo7\">\r\n<div class=\"a-section a-spacing-small a-spacing-top-small\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-top: 8px !important;\">\r\n<table class=\"a-normal a-spacing-micro\" style=\"width: 513.25px; margin-bottom: 4px !important;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small po-diet_type\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Diet Type</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Vegetarian</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_form\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Form</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Whole</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-brand\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">Fresh</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_weight\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Weight</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1 Kilograms</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-number_of_items\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 0px 0px; float: none !important; margin-right: 0px; width: 134.359px;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Number of Items</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 0px 3px; float: none !important; margin-right: 0px; width: 378.891px;\"><span class=\"a-size-base\" style=\"box-sizing: border-box; line-height: 20px !important;\">1</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n<div id=\"featurebullets_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\" data-feature-name=\"featurebullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"featurebullets\" data-csa-c-slot-id=\"featurebullets_feature_div\" data-csa-c-asin=\"B07BG7LB3Q\" data-csa-c-is-in-initial-active-row=\"false\" data-cel-widget=\"featurebullets_feature_div\" data-csa-c-id=\"cood4g-pouv5b-8al7vs-jmt78y\">\r\n<div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\" style=\"box-sizing: border-box; margin-top: 8px !important; margin-bottom: 0px;\">\r\n<div id=\"vnv-container\" class=\"a-section a-spacing-none vnv-container\" style=\"box-sizing: border-box; margin-bottom: 22px; padding-top: 5px; position: relative;\">\r\n<div id=\"inner-container-veg\" class=\"a-section a-spacing-none vnv-inner-container vnv-inner-container-veg\" style=\"box-sizing: border-box; margin-bottom: 22px; display: inline-block; height: 26px; border: 2px solid green;\">\r\n<div id=\"outer-veg\" class=\"a-section vnv-outer\" style=\"box-sizing: border-box; margin-bottom: 0px; width: 22px; height: 22px; float: left; position: relative;\">\r\n<div id=\"circle-veg\" class=\"a-section vnv-circle vnv-circle-veg\" style=\"box-sizing: border-box; margin: 3px 0px 0px 3px; border-radius: 100%; width: 16px; background-color: green;\"></div>\r\n</div>\r\n</div>\r\n<div id=\"text-veg\" class=\"a-section vnv-text\" style=\"box-sizing: border-box; margin-bottom: 0px; display: inline-block; padding-left: 10px; height: 22.68px; padding-top: 2px; position: absolute; margin-top: 2px;\">This is a&nbsp;<span style=\"box-sizing: border-box; font-weight: bold;\">Vegetarian</span>&nbsp;product.</div>\r\n</div>\r\n<hr style=\"box-sizing: border-box; background-color: transparent; border-top-color: #e7e7e7; height: 1px; line-height: 19px; margin-bottom: 14px; margin-top: 0px;\" />\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 16px !important; line-height: 24px !important;\">About this item</h1>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; padding: 0px;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Good source of Vitamin A, C, K, Iron, Folate and Potassium</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Help to reduce Cholesterol</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Can be used salads, soups and curries</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">Store in a cool, dry place away from sunlight</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">ingredients:fresh hybrid tomatoes</span></li>\r\n</ul>\r\n</div>\r\n</div>', 1, 1, 10, 'loose', 1, 0, 10, 0, '2022-11-14 10:25:29', '2023-07-28 06:22:46', NULL, '');
INSERT INTO `products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `created_at`, `updated_at`, `deleted_at`, `fssai_lic_no`) VALUES
(43, 1, 166, 'Tata Tea Agni | Special Leaf Tea Blend with Strong Taste | Black Tea', 'Tata,Tea,Agni,|,Special,Leaf,Blend,with,Strong,Taste,Black,500g', 10, 4, 'tata-tea-agni-special-leaf-tea-blend-with-strong-taste-black-tea-', 2, NULL, 'Agni', '98', 1, 1, '2', 'products/1692779817_14484.jpg', NULL, '<div class=\"a-section a-spacing-medium brand-snapshot-flex-row\" style=\"box-sizing: border-box; margin-bottom: 22px; position: relative; display: flex; flex-flow: row nowrap; align-items: center; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: left;\"><img class=\"brand-snapshot-badge-space\" style=\"box-sizing: border-box; max-width: 100%; border: 0px; vertical-align: top; margin-right: 4px;\" src=\"https://m.media-amazon.com/images/I/11sUgaVRsYL.png\" alt=\"\" width=\"81\" height=\"24\" />\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px;\"><span class=\"a-size-medium a-text-bold\" style=\"box-sizing: border-box; text-rendering: optimizelegibility; font-weight: 700 !important; font-size: 18px !important; line-height: 24px !important;\">Tata Tea Agni</span></p>\r\n</div>\r\n<div class=\"a-section a-spacing-base brand-snapshot-flex-row\" style=\"box-sizing: border-box; margin-bottom: 22px; position: relative; display: flex; flex-flow: row nowrap; align-items: center; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: left;\"><img class=\"brand-snapshot-item-image\" style=\"box-sizing: border-box; max-width: 100%; border: 0px; vertical-align: top; margin-right: 8px;\" src=\"https://m.media-amazon.com/images/I/01S5bawZYgL.png\" alt=\"\" width=\"18\" height=\"18\" />\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">89% positive ratings from 10K+ customers</p>\r\n</div>\r\n<div class=\"a-section a-spacing-base brand-snapshot-flex-row\" style=\"box-sizing: border-box; margin-bottom: 22px; position: relative; display: flex; flex-flow: row nowrap; align-items: center; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: left;\"><img class=\"brand-snapshot-item-image\" style=\"box-sizing: border-box; max-width: 100%; border: 0px; vertical-align: top; margin-right: 8px;\" src=\"https://m.media-amazon.com/images/I/01S5bawZYgL.png\" alt=\"\" width=\"18\" height=\"18\" />\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px;\">10K+ recent orders from this brand</p>\r\n</div>\r\n<div class=\"a-section a-spacing-base brand-snapshot-flex-row\" style=\"box-sizing: border-box; margin-bottom: 0px; position: relative; display: flex; flex-flow: row nowrap; align-items: center; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\"><img class=\"brand-snapshot-item-image\" style=\"box-sizing: border-box; max-width: 100%; border: 0px; vertical-align: top; margin-right: 8px; float: left;\" src=\"https://m.media-amazon.com/images/I/01S5bawZYgL.png\" alt=\"\" width=\"18\" height=\"18\" />\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; text-align: left;\">7+ years on eGrocer</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; text-align: left;\">&nbsp;</p>\r\n</div>\r\n<p>&nbsp;</p>\r\n<table class=\"a-normal a-spacing-micro\" style=\"width: 463px; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; float: left; margin-bottom: 4px !important;\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr class=\"a-spacing-small po-brand\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Brand</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 0px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Tata Tea Agni</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_form\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Form</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Granule</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-flavor\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Flavour</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Unflavoured</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-tea_variety\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Tea Variety</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Assam</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-unit_count\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Units</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">1 count</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-diet_type\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Diet Type</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Vegetarian</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-container.type\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Package Information</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Box</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-caffeine_content\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Caffeine Content</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Medium Caffeine</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-item_weight\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 3px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Weight</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 3px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">500 Grams</span></td>\r\n</tr>\r\n<tr class=\"a-spacing-small po-specialty\" style=\"box-sizing: border-box; margin-bottom: 8px !important;\">\r\n<td class=\"a-span3\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 3px 0px 0px; margin-right: 0px; width: 110.859px; float: none !important;\"><span class=\"a-size-base a-text-bold\" style=\"box-sizing: border-box; font-weight: 700 !important; line-height: 20px !important;\">Specialty</span></td>\r\n<td class=\"a-span9\" style=\"box-sizing: border-box; vertical-align: top; padding: 3px 0px 0px 3px; margin-right: 0px; width: 351.375px; float: none !important;\"><span class=\"a-size-base po-break-word\" style=\"box-sizing: border-box; word-break: break-word; line-height: 20px !important;\">Vegetarian</span></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">&nbsp;</h1>\r\n<h1 class=\"a-size-base-plus a-text-bold\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; background-color: #ffffff; font-size: 16px !important; line-height: 24px !important; text-align: left;\">About this item</h1>\r\n<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: #0f1111; padding: 0px; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: left;\">\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">SPECIAL BLEND:&nbsp;Tata Agni leaf tea&nbsp;has a special blend of tea leaves</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">SIP IT ANYTIME: Make anytime tea time with a refreshing sip of your favorite tea</span></li>\r\n<li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box;\">COMMONLY SEARCHED TOPICS: tata agni leaf tea, tata tea agni strong leaf, tata tea agni leaf, tata tea powder, tata tea, tata tea agni 1 kg pack, tata tea agni 1 kg pack offer, tata tea leaf 1 kg pack, tata tea 1 kg</span></li>\r\n</ul>\r\n<div id=\"productDetailsWithModules_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: left;\" data-feature-name=\"productDetailsWithModules\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDetailsWithModules\" data-csa-c-slot-id=\"productDetailsWithModules_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"va4pnl-xn1xjw-a46dgj-d6fspp\" data-cel-widget=\"productDetailsWithModules_feature_div\">\r\n<div style=\"box-sizing: border-box; overflow: hidden;\">\r\n<div id=\"prodDetails\" class=\"a-section\" style=\"box-sizing: border-box; margin-bottom: 0px; width: 1464px;\">\r\n<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-size: 16px !important; color: #cc6600 !important;\">&nbsp;</h2>\r\n<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 3px 0px 7px; text-rendering: optimizelegibility; line-height: 32px; font-size: 16px !important; color: #cc6600 !important; text-align: left;\">Product information</h2>\r\n<div class=\"a-row a-spacing-top-base\" style=\"box-sizing: border-box; width: 1464px; margin-top: 12px !important;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 29.2734px; float: left; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div class=\"a-row a-expander-container a-expander-extend-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px; text-align: left;\">\r\n<div class=\"a-column a-span6\" style=\"box-sizing: border-box; margin-right: 28.6562px; float: left; min-height: 1px; overflow: visible; width: 343.695px;\">\r\n<h1 class=\"a-size-medium a-spacing-small\" style=\"box-sizing: border-box; padding: 0px; text-rendering: optimizelegibility; font-weight: 400; font-size: 18px !important; line-height: 24px !important; margin: 0px 0px 8px !important 0px;\">Technical Details</h1>\r\n</div>\r\n</div>\r\n<div class=\"a-expander-content a-expander-extend-content\" style=\"box-sizing: border-box;\" aria-expanded=\"true\">\r\n<div class=\"a-row a-expander-container a-expander-inline-container\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-expander-content a-expander-section-content a-section-expander-inner\" style=\"box-sizing: border-box; border-top: 1px solid #dddddd; padding: 12px 18px;\" aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 680.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Specialty</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;500 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredient Type</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Vegetarian</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Brand</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Tata Tea Agni</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Form</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Granule</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Caffeine Content</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Medium Caffeine</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Package Information</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Box</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Tewari Warehousing Co. Pvt. Ltd.</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Allergen Information</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Dairy Free</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Net Quantity</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;1 count</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Product Dimensions</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;53.5 x 41.5 x 36.5 cm; 500 Grams</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box; text-align: left;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important;\">Ingredients</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;Tea</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 340.297px; line-height: 20px !important; text-align: left;\">Country of Origin</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">&lrm;India</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">&nbsp;</div>\r\n</div>\r\n<div class=\"a-column a-span6 a-span-last\" style=\"box-sizing: border-box; margin-right: 0px; float: right; min-height: 1px; overflow: visible; width: 716.594px;\">\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">\r\n<div id=\"productDetails_db_sections\" class=\"a-section\" style=\"box-sizing: border-box; margin-bottom: 0px;\">\r\n<h1 class=\"a-size-medium a-spacing-small secHeader\" style=\"box-sizing: border-box; padding: 0px 0px 7px 10px; text-rendering: optimizelegibility; font-weight: 400; font-size: 16px; line-height: 24px !important; border-bottom: 1px solid #cccccc; margin: 0px 0px 8px !important 0px;\">Additional Information</h1>\r\n<div class=\"a-section table-padding\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 12px;\">\r\n<table id=\"productDetails_detailBullets_sections1\" class=\"a-keyvalue prodDetTable\" style=\"margin-bottom: 22px; width: 704.594px; border-bottom: 1px solid #e7e7e7; table-layout: fixed; border-spacing: 0px; padding: 0px;\" role=\"presentation\">\r\n<tbody style=\"box-sizing: border-box;\">\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">ASIN</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">B09TFNKNXL</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Best Sellers Rank</th>\r\n<td style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333;\"><span style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box;\">#2,740 in Grocery &amp; Gourmet Foods (<a style=\"box-sizing: border-box; text-decoration-line: none; color: #007185;\" href=\"https://www.amazon.in/gp/bestsellers/grocery/ref=pd_zg_ts_grocery\">See Top 100 in Grocery &amp; Gourmet Foods</a>)</span><br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box;\">#70 in&nbsp;<a style=\"box-sizing: border-box; text-decoration-line: none; color: #007185;\" href=\"https://www.amazon.in/gp/bestsellers/grocery/4861889031/ref=pd_zg_hrsr_grocery\">Black Tea</a></span><br style=\"box-sizing: border-box;\" /></span></td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Date First Available</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">25 February 2022</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Manufacturer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">Tewari Warehousing Co. Pvt. Ltd., Tewari Warehousing Co. Pvt. Ltd., 20 Coal Berth Road, Kolkata-700080</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Packer</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">Tewari Warehousing Co. Pvt. Ltd., 20 Coal Berth Road, Kolkata-700088</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Item Weight</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">500 g</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Item Dimensions LxWxH</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">53.5 x 41.5 x 36.5 Centimeters</td>\r\n</tr>\r\n<tr style=\"box-sizing: border-box;\">\r\n<th class=\"a-color-secondary a-size-base prodDetSectionEntry\" style=\"box-sizing: border-box; vertical-align: top; text-align: left; padding: 7px 14px 6px; background-color: #f3f3f3; font-weight: 400; border-top: 1px solid #e7e7e7; overflow-wrap: break-word; width: 352.297px; line-height: 20px !important;\">Generic Name</th>\r\n<td class=\"a-size-base prodDetAttrValue\" style=\"box-sizing: border-box; vertical-align: top; padding: 7px 14px 6px; border-top: 1px solid #e7e7e7; color: #333333; word-break: break-word; line-height: 20px !important;\">Tea</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"a-row a-spacing-base\" style=\"box-sizing: border-box; width: 716.594px; margin-bottom: 12px !important;\">&nbsp;</div>\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 716.594px;\">\r\n<div class=\"a-section\" style=\"box-sizing: border-box; margin-bottom: 0px;\">\r\n<div class=\"a-section table-padding\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-left: 12px;\">\r\n<div class=\"a-row\" style=\"box-sizing: border-box; width: 704.594px;\">\r\n<div style=\"box-sizing: border-box;\">\r\n<div id=\"pricingFeedbackDiv\" class=\"detailPageWidgetBlock\" style=\"box-sizing: border-box;\"></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div id=\"importantInformation_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: left;\" data-feature-name=\"importantInformation\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"importantInformation\" data-csa-c-slot-id=\"importantInformation_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"9gjeqi-etmb5c-sqhpn-akdios\" data-cel-widget=\"importantInformation_feature_div\">\r\n<div id=\"important-information\" class=\"a-section a-spacing-extra-large bucket\" style=\"box-sizing: border-box; margin-bottom: 0px;\">\r\n<h2 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 24px; line-height: 32px;\">Important information</h2>\r\n<div class=\"a-section content\" style=\"box-sizing: border-box; margin-bottom: 22px; margin-top: 6.5px; margin-left: 25px;\">\r\n<h4 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 18px; line-height: 24px;\">Ingredients:</h4>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 14px;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: -4px 0px 14px;\">Tea</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: -4px 0px 0px;\">&nbsp;</p>\r\n</div>\r\n<div class=\"a-section content\" style=\"box-sizing: border-box; margin-bottom: 0px; margin-top: 6.5px; margin-left: 25px;\">\r\n<h4 style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-size: 18px; line-height: 24px;\">Legal Disclaimer:</h4>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 14px;\">&nbsp;</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: -4px 0px 14px;\">Actual product packaging and materials may contain more and different information than what is shown on our app or website. We recommend that you do not rely solely on the information presented here and that you always read labels, warnings, and directions before using or consuming a product.</p>\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: -4px 0px 0px;\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n<div id=\"productDescription_feature_div\" class=\"celwidget\" style=\"box-sizing: border-box; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff; text-align: left;\" data-feature-name=\"productDescription\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"productDescription\" data-csa-c-slot-id=\"productDescription_feature_div\" data-csa-c-asin=\"\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"ij9yoe-hshtiw-p1wmgg-ja437n\" data-cel-widget=\"productDescription_feature_div\">\r\n<div style=\"box-sizing: border-box;\">\r\n<div id=\"productDescription_feature_div\" class=\"a-row feature\" style=\"box-sizing: border-box; width: 1464px;\" data-feature-name=\"productDescription\" data-template-name=\"productDescription\" data-cel-widget=\"productDescription_feature_div\">\r\n<div class=\"a-divider a-divider-section\" style=\"box-sizing: border-box;\">\r\n<div class=\"a-divider-inner\" style=\"box-sizing: border-box; background: linear-gradient(rgba(0, 0, 0, 0.14), rgba(0, 0, 0, 0.03) 3px, transparent); height: 44px; margin-bottom: -18px; z-index: 0; zoom: 1;\">&nbsp;</div>\r\n</div>\r\n<h2 class=\"default\" style=\"box-sizing: border-box; padding: 0px 0px 4px; margin: 0px 0px 0.25em; text-rendering: optimizelegibility; font-size: medium; line-height: 32px; color: #cc6600;\">Product description</h2>\r\n<div id=\"productDescription\" class=\"a-section a-spacing-small\" style=\"box-sizing: border-box; margin: 0.5em 0px 0em 25px; color: #333333; overflow-wrap: break-word; font-size: small; line-height: initial;\">\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0em 0px 1em 1em;\"><span style=\"box-sizing: border-box;\">Why Tata Tea Agni? The second-largest brand in the Tata Tea portfolio with a presence across 22 states, Tata Tea Agni offers a strong cup of tea at an affordable price, energizing them to overcome any challenges along the way. What makes it unique? Make your mornings more energetic with Tata Tea Agni&rsquo;s special leaf blend that give a strong taste in every cup. With a special blend of tea leaves, Tata Tea Agni strong leaf offers just the perfect freshness &amp; rich fullness that will leave you longing for more with every sip. When to enjoy a fresh cup of tea? Enjoy it whenever you long for a strong cup of tea to awaken your mind and get rejuvenated.</span></p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"a-section a-spacing-base brand-snapshot-flex-row\" style=\"box-sizing: border-box; margin-bottom: 0px; position: relative; display: flex; flex-flow: row nowrap; align-items: center; color: #0f1111; font-family: \'Amazon Ember\', Arial, sans-serif; font-size: 14px; background-color: #ffffff;\">\r\n<p style=\"box-sizing: border-box; padding: 0px; margin: 0px; text-align: left;\">&nbsp;</p>\r\n</div>', 1, 1, 15, 'loose', 1, 1, 10, 1, '2022-11-24 19:58:15', '2023-08-23 11:34:26', NULL, 'FSSAILIC123123');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '(1: Available, 0: Sold Out)',
  `measurement` double(8,2) NOT NULL,
  `price` double(11,2) NOT NULL,
  `discounted_price` double(11,2) NOT NULL DEFAULT 0.00,
  `stock` double(11,2) NOT NULL DEFAULT 0.00,
  `stock_unit_id` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `type`, `status`, `measurement`, `price`, `discounted_price`, `stock`, `stock_unit_id`, `deleted_at`) VALUES
(1, 1, 'packet', 1, 100.00, 120.00, 100.00, 999662.00, 2, NULL),
(2, 1, 'packet', 1, 200.00, 240.00, 200.00, 999971.00, 2, NULL),
(3, 1, 'packet', 1, 500.00, 600.00, 450.00, 999978.00, 2, NULL),
(4, 1, 'packet', 1, 1.00, 1200.00, 800.00, 999982.00, 2, NULL),
(5, 2, 'packet', 1, 150.00, 150.00, 80.00, 999745.00, 1, NULL),
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
(17, 4, 'packet', 1, 100.00, 100.00, 80.00, 999766.00, 4, NULL),
(18, 4, 'packet', 1, 200.00, 200.00, 180.00, 999981.00, 4, NULL),
(19, 4, 'packet', 1, 300.00, 300.00, 250.00, 999991.00, 4, NULL),
(20, 4, 'packet', 1, 400.00, 400.00, 300.00, 999985.00, 4, NULL),
(21, 4, 'packet', 1, 500.00, 500.00, 350.00, 999974.00, 4, NULL),
(22, 4, 'packet', 1, 600.00, 600.00, 400.00, 999982.00, 4, NULL),
(23, 5, 'packet', 1, 100.00, 20.00, 15.00, 99998.00, 4, NULL),
(24, 5, 'packet', 1, 300.00, 300.00, 250.00, 99999.00, 4, NULL),
(25, 5, 'packet', 1, 600.00, 600.00, 400.00, 99999.00, 4, NULL),
(26, 5, 'packet', 1, 700.00, 700.00, 300.00, 100000.00, 4, NULL),
(27, 5, 'packet', 1, 750.00, 750.00, 350.00, 100000.00, 4, NULL),
(28, 5, 'packet', 1, 900.00, 900.00, 800.00, 100000.00, 4, NULL),
(29, 10, 'packet', 1, 100.00, 10.00, 8.00, 999879.00, 4, NULL),
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

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_code` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `no_of_users` int(11) NOT NULL,
  `minimum_order_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `discount_type` varchar(191) NOT NULL,
  `max_discount_amount` int(11) NOT NULL,
  `repeat_usage` tinyint(4) NOT NULL COMMENT '1-allowed, 0-Not Allowed',
  `no_of_repeat_usage` int(11) NOT NULL DEFAULT 0 COMMENT 'if repeat_usage = allowed(1) else NULL',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-active, 0-deactive',
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `promo_code`, `message`, `start_date`, `end_date`, `no_of_users`, `minimum_order_amount`, `discount`, `discount_type`, `max_discount_amount`, `repeat_usage`, `no_of_repeat_usage`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Upto 50% Sale', 'Save Upto 50% on more than 389$', '2023-08-23', '2023-08-31', 100, 389, 50, 'percentage', 500, 0, 0, 1, 'promocode/1692854719_21819.jpg', '2023-08-24 05:25:19', '2023-08-24 05:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `return_requests`
--

CREATE TABLE `return_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, NULL),
(2, 'Admin', 'web', NULL, NULL),
(3, 'Seller', 'web', NULL, NULL),
(4, 'Delivery Boy', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(33, 3),
(34, 1),
(34, 2),
(34, 3),
(35, 1),
(35, 2),
(35, 3),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(91, 3),
(91, 4),
(92, 1),
(92, 2),
(92, 3),
(92, 4),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(191) NOT NULL,
  `short_description` varchar(191) NOT NULL,
  `product_type` varchar(191) NOT NULL,
  `product_ids` text DEFAULT NULL,
  `category_ids` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `row_order`, `title`, `short_description`, `product_type`, `product_ids`, `category_ids`, `created_at`, `updated_at`) VALUES
(1, 0, 'All Products', 'All Products', 'all_products', NULL, '', '2023-08-23 10:43:13', '2023-08-23 10:43:13');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` text DEFAULT NULL,
  `store_name` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `store_url` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `store_description` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `state` text DEFAULT NULL,
  `categories` text DEFAULT NULL,
  `account_number` text DEFAULT NULL,
  `bank_ifsc_code` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `commission` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL,
  `require_products_approval` tinyint(4) NOT NULL DEFAULT 0,
  `fcm_id` text DEFAULT NULL,
  `national_identity_card` text DEFAULT NULL,
  `address_proof` text DEFAULT NULL,
  `pan_number` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `tax_number` text DEFAULT NULL,
  `customer_privacy` tinyint(4) DEFAULT 0,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `place_name` varchar(191) DEFAULT NULL,
  `formatted_address` varchar(191) DEFAULT NULL,
  `forgot_password_code` varchar(191) DEFAULT NULL,
  `view_order_otp` tinyint(4) NOT NULL DEFAULT 0,
  `assign_delivery_boy` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `change_order_status_delivered` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `admin_id`, `name`, `store_name`, `slug`, `email`, `mobile`, `balance`, `store_url`, `logo`, `store_description`, `street`, `pincode_id`, `city_id`, `state`, `categories`, `account_number`, `bank_ifsc_code`, `account_name`, `bank_name`, `commission`, `status`, `require_products_approval`, `fcm_id`, `national_identity_card`, `address_proof`, `pan_number`, `tax_name`, `tax_number`, `customer_privacy`, `latitude`, `longitude`, `place_name`, `formatted_address`, `forgot_password_code`, `view_order_otp`, `assign_delivery_boy`, `created_at`, `updated_at`, `deleted_at`, `remark`, `change_order_status_delivered`) VALUES
(1, 4, 'eGrocer Seller', 'WRTeam', '', 'seller@gmail.com', '9876543210', 990, 'https://jdhdhdhdj.com', 'sellers/1690508371_43315.jpg', 'Irhrhrrjrirjrj', 'Bhuj  Gujarat', 0, 31, 'Gujarat', '22,21,16,7,6,5,4,3,2', '464545646464545', '837373737', 'Hsgsushdhdjdueh', 'hshdjdjdjdhdhdj', 10, 1, 0, NULL, 'sellers/1690508371_32409.jpg', 'sellers/1690508371_43813.jpg', 'PAN123', 'TAX', 'TAX', 0, '23.2419997', '69.6669324', 'Bhuj', 'Bhuj, Gujarat, India', NULL, 0, 0, '2023-02-15 19:24:18', '2023-08-24 09:30:37', NULL, 'null', '0');

-- --------------------------------------------------------

--
-- Table structure for table `seller_commissions`
--

CREATE TABLE `seller_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_transactions`
--

CREATE TABLE `seller_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `txn_id` text DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `status` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_transactions`
--

CREATE TABLE `seller_wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variable` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(1, 'app_name', 'eGrocer'),
(2, 'support_number', '9876543210'),
(3, 'support_email', 'support@gmail.com'),
(4, 'logo', 'logo/1692780118_96269.png'),
(5, 'purchase_code', 'b69e5021-bdcf-46eb-bc2b-01c8f6385f0f'),
(6, 'stripe_secret_key', 'sk_test_51MKxDESEKxefYE6MpiYMvsrqu6QmFok5V3AFaYcGzv8ti5knjt0CaGAZa4CBFZe5kRowikzily3InXOqyrjrLeNh00XQbBhiNA'),
(7, 'stripe_publishable_key', 'pk_test_51MKxDESEKxefYE6MZCHxEw4cFKiiLn2mV3Ek4Nx1UfcuNfE1Z6jgQrZrKpqTLju3n5SBjYJcwt1Jkw1bEoPXWRHB00XZ7D2f2F'),
(8, 'stripe_webhook_secret_key', 'we_1ML4uASEKxefYE6MtSqH4GuH'),
(9, 'system_configurations', '1'),
(10, 'system_timezone_gmt', '+05:30'),
(11, 'system_configurations_id', '13'),
(12, 'is_version_system_on', '1'),
(13, 'required_force_update', '1'),
(14, 'current_version', '1.0.0'),
(15, 'ios_is_version_system_on', '1'),
(16, 'ios_required_force_update', '1'),
(17, 'ios_current_version', '1.0.0'),
(18, 'copyright_details', 'Copyright © 2023 WRTeam | Powered by WRTeam'),
(19, 'store_address', '#262-263, Time Square Empire SH 42, highway, Mirjapar, Bhuj, Gujarat 370001'),
(20, 'map_latitude', '23.2420'),
(21, 'map_longitude', '69.6669'),
(22, 'currency', '$'),
(23, 'currency_code', 'USD'),
(24, 'decimal_point', '2'),
(25, 'system_timezone', 'Asia/Kolkata'),
(26, 'default_city_id', '31'),
(27, 'max_cart_items_count', '10'),
(28, 'min_order_amount', '1'),
(29, 'low_stock_limit', '20'),
(30, 'delivery_boy_bonus_settings', '1'),
(31, 'delivery_boy_bonus_type', '0'),
(32, 'delivery_boy_bonus_percentage', '0'),
(33, 'delivery_boy_bonus_min_amount', '0'),
(34, 'delivery_boy_bonus_max_amount', '0'),
(35, 'area_wise_delivery_charge', '0'),
(36, 'min_amount', ' '),
(37, 'delivery_charge', ' '),
(38, 'is_refer_earn_on', '0'),
(39, 'min_refer_earn_order_amount', ' '),
(40, 'refer_earn_bonus', ' '),
(41, 'refer_earn_method', ' '),
(42, 'max_refer_earn_amount', ' '),
(43, 'minimum_withdrawal_amount', ' '),
(44, 'max_product_return_days', ' '),
(45, 'user_wallet_refill_limit', ' '),
(46, 'tax_name', ' '),
(47, 'tax_number', ' '),
(48, 'from_mail', ' '),
(49, 'reply_to', ' '),
(50, 'generate_otp', '0'),
(51, 'app_mode_customer', '0'),
(52, 'app_mode_customer_remark', ' '),
(53, 'app_mode_seller', '0'),
(54, 'app_mode_seller_remark', ' '),
(55, 'app_mode_delivery_boy', '0'),
(56, 'app_mode_delivery_boy_remark', ' '),
(57, 'smtp_from_mail', 'admin@gmail.com'),
(58, 'smtp_reply_to', 'test.wrteam@gmail.com'),
(59, 'smtp_email_password', 'test.wrteam@gmail.com'),
(60, 'smtp_host', 'smtp.googlemail.com'),
(61, 'smtp_port', '465'),
(62, 'smtp_content_type', 'html'),
(63, 'smtp_encryption_type', 'tls'),
(64, 'google_place_api_key', 'YOUR_MAP_API_KEY_HERE'),
(65, 'fssai_lic_img', 'fssai_lic_img/1692852054_14635.png'),
(66, 'apiKey', 'YOUR_DATA_HERE'),
(67, 'authDomain', 'YOUR_DATA_HERE'),
(68, 'databaseURL', ' '),
(69, 'projectId', 'YOUR_DATA_HERE'),
(70, 'storageBucket', 'YOUR_DATA_HERE'),
(71, 'messagingSenderId', 'YOUR_DATA_HERE'),
(72, 'appId', 'YOUR_DATA_HERE'),
(73, 'measurementId', 'YOUR_DATA_HERE'),
(74, 'jsonFile', '{\"your_json_file\":\"Your json file\"}'),
(75, 'site_title', 'eGrocer'),
(76, 'website_url', 'https://devegrocer.thewrteam.in/'),
(77, 'color', '#33A36B'),
(78, 'light_color', '#C8E5D5'),
(79, 'dark_color', '#55AE7B'),
(80, 'app_title', 'eGrocer Mobile App'),
(81, 'app_tagline', ''),
(82, 'app_short_description', 'Shop with us at affordable prices and get exciting cashback & offers'),
(83, 'is_android_app', '1'),
(84, 'android_app_url', 'https://play.google.com/store/apps/details?id=com.wrteam.egrocer'),
(85, 'play_store_logo', 'front_end/play_store_logo/1692854093_65761.png'),
(86, 'is_ios_app', '1'),
(87, 'ios_app_url', 'https://testflight.apple.com/join/fcRe3J9F'),
(88, 'ios_store_logo', 'front_end/ios_store_logo/1692854093_69227.png'),
(89, 'common_meta_keywords', ''),
(90, 'common_meta_description', ''),
(91, 'show_color_picker_in_website', 'false'),
(92, 'loading', ''),
(93, 'favicon', 'front_end/favicon/1692854109_74097.png'),
(94, 'web_logo', 'front_end/web_logo/1692854109_66562.png'),
(95, 'time_slots_is_enabled', 'true'),
(96, 'time_slots_delivery_starts_from', '1'),
(97, 'time_slots_allowed_days', '30'),
(98, 'payment_method_settings', '0'),
(99, 'cod_payment_method', '1'),
(100, 'cod_mode', 'global'),
(101, 'paypal_payment_method', '1'),
(102, 'paypal_mode', 'sandbox'),
(103, 'paypal_currency_code', 'USD'),
(104, 'paypal_business_email', 'rxt3450-buyer@gmail.com'),
(105, 'paypal_notification_url', 'https://egrocer.thewrteam.in/customer/ipn'),
(106, 'payumoney_payment_method', 'undefined'),
(107, 'payumoney_mode', '0'),
(108, 'payumoney_merchant_key', 'undefined'),
(109, 'payumoney_merchant_id', 'undefined'),
(110, 'payumoney_salt', 'undefined'),
(111, 'razorpay_payment_method', '1'),
(112, 'razorpay_key', 'rzp_test_nrzk0huxwp56ro'),
(113, 'razorpay_secret_key', 'oJmFOxp50HCt9VA1CphC4bJ6'),
(114, 'paystack_payment_method', '1'),
(115, 'paystack_public_key', 'pk_test_05ee04d1597f21a3b1a2f8fe3b59ec657454c1c0'),
(116, 'paystack_secret_key', 'sk_test_e21b0acd7b7e24a9025fc2d69a013a0f5b726028'),
(117, 'paystack_currency_code', 'ZAR'),
(118, 'flutterwave_payment_method', 'undefined'),
(119, 'flutterwave_public_key', 'undefined'),
(120, 'flutterwave_secret_key', 'undefined'),
(121, 'flutterwave_encryption_key', 'undefined'),
(122, 'flutterwave_currency_code', '0'),
(123, 'midtrans_payment_method', 'undefined'),
(124, 'is_production', '0'),
(125, 'midtrans_merchant_id', 'undefined'),
(126, 'midtrans_client_key', 'undefined'),
(127, 'midtrans_server_key', 'undefined'),
(128, 'stripe_payment_method', '1'),
(129, 'stripe_webhook_url', 'https://egrocer.thewrteam.in/webhook/stripe'),
(130, 'stripe_currency_code', 'INR'),
(131, 'stripe_mode', 'sandbox'),
(132, 'paytm_payment_method', '1'),
(133, 'paytm_mode', 'sandbox'),
(134, 'paytm_merchant_key', 'eIcrB!DTHJlQ5DN8'),
(135, 'paytm_merchant_id', 'PpGeMd34849525540215'),
(136, 'ssl_commerce_payment_method', 'undefined'),
(137, 'ssl_commerece_mode', '0'),
(138, 'ssl_commerece_store_id', 'undefined'),
(139, 'ssl_commerece_secret_key', 'undefined'),
(140, 'direct_bank_transfer', 'undefined'),
(141, 'account_name', 'undefined'),
(142, 'account_number', 'undefined'),
(143, 'bank_name', 'undefined'),
(144, 'bank_code', 'undefined'),
(145, 'notes', 'undefined'),
(146, 'contact_us', '<h1 style=\"text-align: center;\">Contact Us !</h1>\n<h2 style=\"text-align: center;\">Welcome to&nbsp;<span id=\"W_Name\">eGrocer</span>!</h2>\n<p style=\"font-size: 17px; text-align: center;\">Please email us if you have any queries about the site, advertising, or anything else.</p>\n<div style=\"text-align: center;\"><br />\n<p style=\"margin-left: 25%; text-align: center;\">&nbsp;</p>\n<h3 style=\"color: #3e005d;\">We will revert you as soon as possible...!</h3>\n<p style=\"color: #3e005d; text-align: center;\">Thank you for contacting us!<br /><strong>Have a great day</strong></p>\n<span style=\"font-size: 1px; opacity: 0;\">This page is generated with the help of&nbsp;<a href=\"https://www.blogearns.com/2021/06/free-contact-us-page-generator.html\">Contact Us Page Generator</a></span></div>'),
(147, 'about_us', '<h2>About Us!</h2>\n<h3 style=\"text-align: center;\">Welcome To&nbsp;<span id=\"W_Name1\">eGrocer</span></h3>\n<p><span id=\"W_Name2\">eGrocer</span>&nbsp;is a Professional&nbsp;<span id=\"W_Type1\">eCommerce</span>&nbsp;Platform. Here we will provide you with only interesting content, which you will like very much. We\'re dedicated to providing you with the best of&nbsp;<span id=\"W_Type2\">eCommerce</span>, with a focus on dependability and&nbsp;<span id=\"W_Spec\">Online Shopping</span>. We\'re working to turn our passion for&nbsp;<span id=\"W_Type3\">eCommerce</span>&nbsp;into a booming&nbsp;<a style=\"color: inherit; text-decoration: none;\" href=\"https://www.blogearns.com/2021/05/free-about-us-page-generator.html\" rel=\"do-follow\">online website</a>. We hope you enjoy our&nbsp;<span id=\"W_Type4\">eCommerce</span>&nbsp;as much as we enjoy offering them to you.</p>\n<p>I will keep posting more important posts on my Website for all of you. Please give your support and love.</p>\n<p style=\"font-weight: bold; text-align: center;\">Thanks For Visiting Our Site<br /><br /><span style=\"color: blue; font-size: 16px; font-weight: bold; text-align: center;\">Have a nice day!</span></p>'),
(148, 'privacy_policy', '<h1>Privacy Policy for eGrocer</h1>\n<p>At eGrocer, accessible from https://egrocer.wrteam.in, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eGrocer and how we use it.</p>\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p>\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in eGrocer. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the&nbsp;<a href=\"https://www.privacypolicygenerator.info/\">Free Privacy Policy Generator</a>.</p>\n<h2>Consent</h2>\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p>\n<h2>Information we collect</h2>\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p>\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p>\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p>\n<h2>How we use your information</h2>\n<p>We use the information we collect in various ways, including to:</p>\n<ul>\n<li>Provide, operate, and maintain our website</li>\n<li>Improve, personalize, and expand our website</li>\n<li>Understand and analyze how you use our website</li>\n<li>Develop new products, services, features, and functionality</li>\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes</li>\n<li>Send you emails</li>\n<li>Find and prevent fraud</li>\n</ul>\n<h2>Log Files</h2>\n<p>eGrocer follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.</p>\n<h2>Advertising Partners Privacy Policies</h2>\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eGrocer.</p>\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eGrocer, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p>\n<p>Note that eGrocer has no access to or control over these cookies that are used by third-party advertisers.</p>\n<h2>Third Party Privacy Policies</h2>\n<p>eGrocer\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p>\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.</p>\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)</h2>\n<p>Under the CCPA, among other rights, California consumers have the right to:</p>\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</p>\n<p>Request that a business delete any personal data about the consumer that a business has collected.</p>\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.</p>\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>\n<h2>GDPR Data Protection Rights</h2>\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p>\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.</p>\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p>\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.</p>\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.</p>\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.</p>\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p>\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>\n<h2>Children\'s Information</h2>\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p>\n<p>eGrocer does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>'),
(149, 'returns_and_exchanges_policy', '<h1>Return and Exchange Policy</h1>\n<p>Last updated: November 17, 2022</p>\n<p>Thank you for shopping at eGrocer.</p>\n<p>If, for any reason, You are not completely satisfied with a purchase We invite You to review our policy on refunds and returns. This Return and Refund Policy has been created with the help of the&nbsp;<a href=\"https://www.termsfeed.com/return-refund-policy-generator/\" target=\"_blank\" rel=\"noopener\">TermsFeed Return and Refund Policy Generator</a>.</p>\n<p>The following terms are applicable for any products that You purchased with Us.</p>\n<h1>Interpretation and Definitions</h1>\n<h2>Interpretation</h2>\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\n<h2>Definitions</h2>\n<p>For the purposes of this Return and Refund Policy:</p>\n<ul>\n<li>\n<p><strong>Application</strong>&nbsp;means the software program provided by the Company downloaded by You on any electronic device, named eGrocer</p>\n</li>\n<li>\n<p><strong>Company</strong>&nbsp;(referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to eGrocer.</p>\n</li>\n<li>\n<p><strong>Goods</strong>&nbsp;refer to the items offered for sale on the Service.</p>\n</li>\n<li>\n<p><strong>Orders</strong>&nbsp;mean a request by You to purchase Goods from Us.</p>\n</li>\n<li>\n<p><strong>Service</strong>&nbsp;refers to the Application.</p>\n</li>\n<li>\n<p><strong>You</strong>&nbsp;means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\n</li>\n</ul>\n<h1>Your Order Cancellation Rights</h1>\n<p>You are entitled to cancel Your Order within 45 days without giving any reason for doing so.</p>\n<p>The deadline for cancelling an Order is 45 days from the date on which You received the Goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered.</p>\n<p>In order to exercise Your right of cancellation, You must inform Us of your decision by means of a clear statement. You can inform us of your decision by:</p>\n<ul>\n<li>\n<p>By email: info@egrocer.com</p>\n</li>\n<li>\n<p>By visiting this page on our website:&nbsp;<a href=\"https://egrocer.wrteam.in/\" target=\"_blank\" rel=\"external nofollow noopener\">https://egrocer.wrteam.in/</a></p>\n</li>\n<li>\n<p>By phone number: +919876543210</p>\n</li>\n<li>\n<p>By mail: 1 Infinite Loop Cupertino, CA 95014 USA</p>\n</li>\n</ul>\n<p>We will reimburse You no later than 14 days from the day on which We receive the returned Goods. We will use the same means of payment as You used for the Order, and You will not incur any fees for such reimbursement.</p>\n<h1>Conditions for Returns</h1>\n<p>In order for the Goods to be eligible for a return, please make sure that:</p>\n<ul>\n<li>The Goods were purchased in the last 45 days</li>\n<li>The Goods are in the original packaging</li>\n</ul>\n<p>The following Goods cannot be returned:</p>\n<ul>\n<li>The supply of Goods made to Your specifications or clearly personalized.</li>\n<li>The supply of Goods which according to their nature are not suitable to be returned, deteriorate rapidly or where the date of expiry is over.</li>\n<li>The supply of Goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery.</li>\n<li>The supply of Goods which are, after delivery, according to their nature, inseparably mixed with other items.</li>\n</ul>\n<p>We reserve the right to refuse returns of any merchandise that does not meet the above return conditions in our sole discretion.</p>\n<p>Only regular priced Goods may be refunded. Unfortunately, Goods on sale cannot be refunded. This exclusion may not apply to You if it is not permitted by applicable law.</p>\n<h1>Returning Goods</h1>\n<p>You are responsible for the cost and risk of returning the Goods to Us. You should send the Goods at the following address:</p>\n<p>1 Infinite Loop<br />Cupertino, CA 95014<br />USA</p>\n<p>We cannot be held responsible for Goods damaged or lost in return shipment. Therefore, We recommend an insured and trackable mail service. We are unable to issue a refund without actual receipt of the Goods or proof of received return delivery.</p>\n<h1>Gifts</h1>\n<p>If the Goods were marked as a gift when purchased and then shipped directly to you, You\'ll receive a gift credit for the value of your return. Once the returned product is received, a gift certificate will be mailed to You.</p>\n<p>If the Goods weren\'t marked as a gift when purchased, or the gift giver had the Order shipped to themselves to give it to You later, We will send the refund to the gift giver.</p>\n<h2>Contact Us</h2>\n<p>If you have any questions about our Returns and Refunds Policy, please contact us:</p>\n<ul>\n<li>\n<p>By email: info@egrocer.com</p>\n</li>\n<li>\n<p>By visiting this page on our website:&nbsp;<a href=\"https://egrocer.wrteam.in/\" target=\"_blank\" rel=\"external nofollow noopener\">https://egrocer.wrteam.in/</a></p>\n</li>\n<li>\n<p>By phone number: +919876543210</p>\n</li>\n<li>\n<p>By mail: 1 Infinite Loop Cupertino, CA 95014 USA</p>\n</li>\n</ul>'),
(150, 'shipping_policy', '<div style=\"line-height: 1.5;\"><span style=\"color: #7f7f7f;\"><span style=\"color: #595959; font-size: 15px;\"><span data-custom-class=\"heading_1\"><strong>DO YOU DELIVER INTERNATIONALLY?</strong></span></span></span></div>\n<div style=\"line-height: 1.5;\">&nbsp;</div>\n<div style=\"line-height: 1.5;\"><span style=\"color: #7f7f7f;\"><span style=\"color: #595959; font-size: 15px;\"><span data-custom-class=\"body_text\">We offer worldwide shipping.<span style=\"color: #7f7f7f;\"><span style=\"color: #595959; font-size: 15px;\"><span data-custom-class=\"body_text\"><span style=\"color: #7f7f7f;\"><span style=\"color: #595959; font-size: 15px;\"><span data-custom-class=\"body_text\">&nbsp;Free __________ shipping is not valid on international orders.</span></span></span></span></span></span></span></span></span></div>\n<div style=\"line-height: 1.5;\">&nbsp;</div>\n<div style=\"line-height: 1.5;\">&nbsp;</div>\n<div style=\"line-height: 1.5;\"><span style=\"color: #7f7f7f;\"><span style=\"color: #595959; font-size: 15px;\">For information about customs process:</span></span></div>\n<ul>\n<li style=\"line-height: 1.5;\"><span style=\"font-size: 15px; color: #595959;\">Visit __________</span></li>\n</ul>\n<div>&nbsp;</div>\n<ul>\n<li><span style=\"font-size: 15px; color: #595959;\">Email __________</span></li>\n</ul>\n<div>&nbsp;</div>\n<ul>\n<li><span style=\"font-size: 15px; color: #595959;\">Call toll free at __________</span></li>\n</ul>\n<div>&nbsp;</div>\n<ul>\n<li><span style=\"font-size: 15px; color: #595959;\">__________</span></li>\n</ul>\n<div>&nbsp;</div>\n<div style=\"line-height: 1.4;\"><span style=\"color: #7f7f7f;\"><span style=\"color: #595959; font-size: 15px;\">Please note, we may be subject to various rules and restrictions in relation to some international deliveries and you may be subject to additional taxes and duties over which we have no control. If such cases apply, you are responsible for complying with the laws applicable to the country where you live and will be responsible for any such additional costs or taxes.</span></span></div>\n<div style=\"line-height: 1.5;\">&nbsp;</div>'),
(151, 'cancellation_policy', '<h1>Return and Exchange Policy</h1>\n<p>Last updated: November 17, 2022</p>\n<p>Thank you for shopping at eGrocer.</p>\n<p>If, for any reason, You are not completely satisfied with a purchase We invite You to review our policy on refunds and returns. This Return and Refund Policy has been created with the help of the&nbsp;<a href=\"https://www.termsfeed.com/return-refund-policy-generator/\" target=\"_blank\" rel=\"noopener\">TermsFeed Return and Refund Policy Generator</a>.</p>\n<p>The following terms are applicable for any products that You purchased with Us.</p>\n<h1>Interpretation and Definitions</h1>\n<h2>Interpretation</h2>\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\n<h2>Definitions</h2>\n<p>For the purposes of this Return and Refund Policy:</p>\n<ul>\n<li>\n<p><strong>Application</strong>&nbsp;means the software program provided by the Company downloaded by You on any electronic device, named eGrocer</p>\n</li>\n<li>\n<p><strong>Company</strong>&nbsp;(referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to eGrocer.</p>\n</li>\n<li>\n<p><strong>Goods</strong>&nbsp;refer to the items offered for sale on the Service.</p>\n</li>\n<li>\n<p><strong>Orders</strong>&nbsp;mean a request by You to purchase Goods from Us.</p>\n</li>\n<li>\n<p><strong>Service</strong>&nbsp;refers to the Application.</p>\n</li>\n<li>\n<p><strong>You</strong>&nbsp;means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\n</li>\n</ul>\n<h1>Your Order Cancellation Rights</h1>\n<p>You are entitled to cancel Your Order within 45 days without giving any reason for doing so.</p>\n<p>The deadline for cancelling an Order is 45 days from the date on which You received the Goods or on which a third party you have appointed, who is not the carrier, takes possession of the product delivered.</p>\n<p>In order to exercise Your right of cancellation, You must inform Us of your decision by means of a clear statement. You can inform us of your decision by:</p>\n<ul>\n<li>\n<p>By email: info@egrocer.com</p>\n</li>\n<li>\n<p>By visiting this page on our website:&nbsp;<a href=\"https://egrocer.wrteam.in/\" target=\"_blank\" rel=\"external nofollow noopener\">https://egrocer.wrteam.in/</a></p>\n</li>\n<li>\n<p>By phone number: +919876543210</p>\n</li>\n<li>\n<p>By mail: 1 Infinite Loop Cupertino, CA 95014 USA</p>\n</li>\n</ul>\n<p>We will reimburse You no later than 14 days from the day on which We receive the returned Goods. We will use the same means of payment as You used for the Order, and You will not incur any fees for such reimbursement.</p>\n<h1>Conditions for Returns</h1>\n<p>In order for the Goods to be eligible for a return, please make sure that:</p>\n<ul>\n<li>The Goods were purchased in the last 45 days</li>\n<li>The Goods are in the original packaging</li>\n</ul>\n<p>The following Goods cannot be returned:</p>\n<ul>\n<li>The supply of Goods made to Your specifications or clearly personalized.</li>\n<li>The supply of Goods which according to their nature are not suitable to be returned, deteriorate rapidly or where the date of expiry is over.</li>\n<li>The supply of Goods which are not suitable for return due to health protection or hygiene reasons and were unsealed after delivery.</li>\n<li>The supply of Goods which are, after delivery, according to their nature, inseparably mixed with other items.</li>\n</ul>\n<p>We reserve the right to refuse returns of any merchandise that does not meet the above return conditions in our sole discretion.</p>\n<p>Only regular priced Goods may be refunded. Unfortunately, Goods on sale cannot be refunded. This exclusion may not apply to You if it is not permitted by applicable law.</p>\n<h1>Returning Goods</h1>\n<p>You are responsible for the cost and risk of returning the Goods to Us. You should send the Goods at the following address:</p>\n<p>1 Infinite Loop<br />Cupertino, CA 95014<br />USA</p>\n<p>We cannot be held responsible for Goods damaged or lost in return shipment. Therefore, We recommend an insured and trackable mail service. We are unable to issue a refund without actual receipt of the Goods or proof of received return delivery.</p>\n<h1>Gifts</h1>\n<p>If the Goods were marked as a gift when purchased and then shipped directly to you, You\'ll receive a gift credit for the value of your return. Once the returned product is received, a gift certificate will be mailed to You.</p>\n<p>If the Goods weren\'t marked as a gift when purchased, or the gift giver had the Order shipped to themselves to give it to You later, We will send the refund to the gift giver.</p>\n<h2>Contact Us</h2>\n<p>If you have any questions about our Returns and Refunds Policy, please contact us:</p>\n<ul>\n<li>\n<p>By email: info@egrocer.com</p>\n</li>\n<li>\n<p>By visiting this page on our website:&nbsp;<a href=\"https://egrocer.wrteam.in/\" target=\"_blank\" rel=\"external nofollow noopener\">https://egrocer.wrteam.in/</a></p>\n</li>\n<li>\n<p>By phone number: +919876543210</p>\n</li>\n<li>\n<p>By mail: 1 Infinite Loop Cupertino, CA 95014 USA</p>\n</li>\n</ul>'),
(152, 'terms_conditions', '<h2><strong>Terms and Conditions</strong></h2>\n<p>Welcome to eGrocer!</p>\n<p>These terms and conditions outline the rules and regulations for the use of eGrocer\'s Website, located at info@egrocer.com.</p>\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use eGrocer if you do not agree to take all of the terms and conditions stated on this page.</p>\n<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company&rsquo;s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client&rsquo;s needs in respect of provision of the Company&rsquo;s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>\n<h3><strong>Cookies</strong></h3>\n<p>We employ the use of cookies. By accessing eGrocer, you agreed to use cookies in agreement with the eGrocer\'s Privacy Policy.</p>\n<p>Most interactive websites use cookies to let us retrieve the user&rsquo;s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>\n<h3><strong>License</strong></h3>\n<p>Unless otherwise stated, eGrocer and/or its licensors own the intellectual property rights for all material on eGrocer. All intellectual property rights are reserved. You may access this from eGrocer for your own personal use subjected to restrictions set in these terms and conditions.</p>\n<p>You must not:</p>\n<ul>\n<li>Republish material from eGrocer</li>\n<li>Sell, rent or sub-license material from eGrocer</li>\n<li>Reproduce, duplicate or copy material from eGrocer</li>\n<li>Redistribute content from eGrocer</li>\n</ul>\n<p>This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the&nbsp;<a href=\"https://www.termsandconditionsgenerator.com/\">Free Terms and Conditions Generator</a>.</p>\n<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. eGrocer does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of eGrocer,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, eGrocer shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>\n<p>eGrocer reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>\n<p>You warrant and represent that:</p>\n<ul>\n<li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>\n<li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>\n<li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>\n<li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>\n</ul>\n<p>You hereby grant eGrocer a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>\n<h3><strong>Hyperlinking to our Content</strong></h3>\n<p>The following organizations may link to our Website without prior written approval:</p>\n<ul>\n<li>Government agencies;</li>\n<li>Search engines;</li>\n<li>News organizations;</li>\n<li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>\n<li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>\n</ul>\n<p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\n<p>We may consider and approve other link requests from the following types of organizations:</p>\n<ul>\n<li>commonly-known consumer and/or business information sources;</li>\n<li>dot.com community sites;</li>\n<li>associations or other groups representing charities;</li>\n<li>online directory distributors;</li>\n<li>internet portals;</li>\n<li>accounting, law and consulting firms; and</li>\n<li>educational institutions and trade associations.</li>\n</ul>\n<p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of eGrocer; and (d) the link is in the context of general resource information.</p>\n<p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\n<p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to eGrocer. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>\n<p>Approved organizations may hyperlink to our Website as follows:</p>\n<ul>\n<li>By use of our corporate name; or</li>\n<li>By use of the uniform resource locator being linked to; or</li>\n<li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party&rsquo;s site.</li>\n</ul>\n<p>No use of eGrocer\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>\n<h3><strong>iFrames</strong></h3>\n<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>\n<h3><strong>Content Liability</strong></h3>\n<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>\n<h3><strong>Your Privacy</strong></h3>\n<p>Please read Privacy Policy</p>\n<h3><strong>Reservation of Rights</strong></h3>\n<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it&rsquo;s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>\n<h3><strong>Removal of links from our website</strong></h3>\n<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>\n<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>\n<h3><strong>Disclaimer</strong></h3>\n<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>\n<ul>\n<li>limit or exclude our or your liability for death or personal injury;</li>\n<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\n<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\n<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\n</ul>\n<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>'),
(153, 'privacy_policy_seller', '<h1>Privacy Policy for eGrocer</h1>\n<p>At eGrocer, accessible from https://egrocer.wrteam.in, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eGrocer and how we use it.</p>\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p>\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in eGrocer. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the&nbsp;<a href=\"https://www.privacypolicygenerator.info/\">Free Privacy Policy Generator</a>.</p>\n<h2>Consent</h2>\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p>\n<h2>Information we collect</h2>\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p>\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p>\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p>\n<h2>How we use your information</h2>\n<p>We use the information we collect in various ways, including to:</p>\n<ul>\n<li>Provide, operate, and maintain our website</li>\n<li>Improve, personalize, and expand our website</li>\n<li>Understand and analyze how you use our website</li>\n<li>Develop new products, services, features, and functionality</li>\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes</li>\n<li>Send you emails</li>\n<li>Find and prevent fraud</li>\n</ul>\n<h2>Log Files</h2>\n<p>eGrocer follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.</p>\n<h2>Advertising Partners Privacy Policies</h2>\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eGrocer.</p>\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eGrocer, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p>\n<p>Note that eGrocer has no access to or control over these cookies that are used by third-party advertisers.</p>\n<h2>Third Party Privacy Policies</h2>\n<p>eGrocer\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p>\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.</p>\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)</h2>\n<p>Under the CCPA, among other rights, California consumers have the right to:</p>\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</p>\n<p>Request that a business delete any personal data about the consumer that a business has collected.</p>\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.</p>\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>\n<h2>GDPR Data Protection Rights</h2>\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p>\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.</p>\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p>\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.</p>\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.</p>\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.</p>\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p>\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>\n<h2>Children\'s Information</h2>\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p>\n<p>eGrocer does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>');
INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(154, 'terms_conditions_seller', '<h2>Terms&nbsp;<strong>and Conditions</strong></h2>\n<p>Welcome to eGrocer!</p>\n<p>These terms and conditions outline the rules and regulations for the use of eGrocer\'s Website, located at info@egrocer.com.</p>\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use eGrocer if you do not agree to take all of the terms and conditions stated on this page.</p>\n<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company&rsquo;s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client&rsquo;s needs in respect of provision of the Company&rsquo;s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>\n<h3><strong>Cookies</strong></h3>\n<p>We employ the use of cookies. By accessing eGrocer, you agreed to use cookies in agreement with the eGrocer\'s Privacy Policy.</p>\n<p>Most interactive websites use cookies to let us retrieve the user&rsquo;s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>\n<h3><strong>License</strong></h3>\n<p>Unless otherwise stated, eGrocer and/or its licensors own the intellectual property rights for all material on eGrocer. All intellectual property rights are reserved. You may access this from eGrocer for your own personal use subjected to restrictions set in these terms and conditions.</p>\n<p>You must not:</p>\n<ul>\n<li>Republish material from eGrocer</li>\n<li>Sell, rent or sub-license material from eGrocer</li>\n<li>Reproduce, duplicate or copy material from eGrocer</li>\n<li>Redistribute content from eGrocer</li>\n</ul>\n<p>This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the&nbsp;<a href=\"https://www.termsandconditionsgenerator.com/\">Free Terms and Conditions Generator</a>.</p>\n<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. eGrocer does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of eGrocer,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, eGrocer shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>\n<p>eGrocer reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>\n<p>You warrant and represent that:</p>\n<ul>\n<li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>\n<li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>\n<li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>\n<li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>\n</ul>\n<p>You hereby grant eGrocer a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>\n<h3><strong>Hyperlinking to our Content</strong></h3>\n<p>The following organizations may link to our Website without prior written approval:</p>\n<ul>\n<li>Government agencies;</li>\n<li>Search engines;</li>\n<li>News organizations;</li>\n<li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>\n<li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>\n</ul>\n<p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\n<p>We may consider and approve other link requests from the following types of organizations:</p>\n<ul>\n<li>commonly-known consumer and/or business information sources;</li>\n<li>dot.com community sites;</li>\n<li>associations or other groups representing charities;</li>\n<li>online directory distributors;</li>\n<li>internet portals;</li>\n<li>accounting, law and consulting firms; and</li>\n<li>educational institutions and trade associations.</li>\n</ul>\n<p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of eGrocer; and (d) the link is in the context of general resource information.</p>\n<p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\n<p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to eGrocer. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>\n<p>Approved organizations may hyperlink to our Website as follows:</p>\n<ul>\n<li>By use of our corporate name; or</li>\n<li>By use of the uniform resource locator being linked to; or</li>\n<li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party&rsquo;s site.</li>\n</ul>\n<p>No use of eGrocer\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>\n<h3><strong>iFrames</strong></h3>\n<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>\n<h3><strong>Content Liability</strong></h3>\n<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>\n<h3><strong>Your Privacy</strong></h3>\n<p>Please read Privacy Policy</p>\n<h3><strong>Reservation of Rights</strong></h3>\n<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it&rsquo;s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>\n<h3><strong>Removal of links from our website</strong></h3>\n<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>\n<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>\n<h3><strong>Disclaimer</strong></h3>\n<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>\n<ul>\n<li>limit or exclude our or your liability for death or personal injury;</li>\n<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\n<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\n<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\n</ul>\n<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>'),
(155, 'privacy_policy_delivery_boy', '<h1>Privacy Policy for eGrocer</h1>\n<p>At eGrocer, accessible from https://egrocer.wrteam.in, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by eGrocer and how we use it.</p>\n<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p>\n<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in eGrocer. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the&nbsp;<a href=\"https://www.privacypolicygenerator.info/\">Free Privacy Policy Generator</a>.</p>\n<h2>Consent</h2>\n<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p>\n<h2>Information we collect</h2>\n<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p>\n<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p>\n<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p>\n<h2>How we use your information</h2>\n<p>We use the information we collect in various ways, including to:</p>\n<ul>\n<li>Provide, operate, and maintain our website</li>\n<li>Improve, personalize, and expand our website</li>\n<li>Understand and analyze how you use our website</li>\n<li>Develop new products, services, features, and functionality</li>\n<li>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes</li>\n<li>Send you emails</li>\n<li>Find and prevent fraud</li>\n</ul>\n<h2>Log Files</h2>\n<p>eGrocer follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services\' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users\' movement on the website, and gathering demographic information.</p>\n<h2>Advertising Partners Privacy Policies</h2>\n<p>You may consult this list to find the Privacy Policy for each of the advertising partners of eGrocer.</p>\n<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on eGrocer, which are sent directly to users\' browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p>\n<p>Note that eGrocer has no access to or control over these cookies that are used by third-party advertisers.</p>\n<h2>Third Party Privacy Policies</h2>\n<p>eGrocer\'s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p>\n<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers\' respective websites.</p>\n<h2>CCPA Privacy Rights (Do Not Sell My Personal Information)</h2>\n<p>Under the CCPA, among other rights, California consumers have the right to:</p>\n<p>Request that a business that collects a consumer\'s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</p>\n<p>Request that a business delete any personal data about the consumer that a business has collected.</p>\n<p>Request that a business that sells a consumer\'s personal data, not sell the consumer\'s personal data.</p>\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>\n<h2>GDPR Data Protection Rights</h2>\n<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p>\n<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.</p>\n<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p>\n<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.</p>\n<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.</p>\n<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.</p>\n<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p>\n<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>\n<h2>Children\'s Information</h2>\n<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p>\n<p>eGrocer does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>'),
(156, 'terms_conditions_delivery_boy', '<h2><strong>Terms and Conditions</strong></h2>\n<p>Welcome to eGrocer!</p>\n<p>These terms and conditions outline the rules and regulations for the use of eGrocer\'s Website, located at info@egrocer.com.</p>\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use eGrocer if you do not agree to take all of the terms and conditions stated on this page.</p>\n<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company&rsquo;s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client&rsquo;s needs in respect of provision of the Company&rsquo;s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>\n<h3><strong>Cookies</strong></h3>\n<p>We employ the use of cookies. By accessing eGrocer, you agreed to use cookies in agreement with the eGrocer\'s Privacy Policy.</p>\n<p>Most interactive websites use cookies to let us retrieve the user&rsquo;s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>\n<h3><strong>License</strong></h3>\n<p>Unless otherwise stated, eGrocer and/or its licensors own the intellectual property rights for all material on eGrocer. All intellectual property rights are reserved. You may access this from eGrocer for your own personal use subjected to restrictions set in these terms and conditions.</p>\n<p>You must not:</p>\n<ul>\n<li>Republish material from eGrocer</li>\n<li>Sell, rent or sub-license material from eGrocer</li>\n<li>Reproduce, duplicate or copy material from eGrocer</li>\n<li>Redistribute content from eGrocer</li>\n</ul>\n<p>This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the&nbsp;<a href=\"https://www.termsandconditionsgenerator.com/\">Free Terms and Conditions Generator</a>.</p>\n<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. eGrocer does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of eGrocer,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, eGrocer shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>\n<p>eGrocer reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>\n<p>You warrant and represent that:</p>\n<ul>\n<li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>\n<li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>\n<li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>\n<li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>\n</ul>\n<p>You hereby grant eGrocer a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>\n<h3><strong>Hyperlinking to our Content</strong></h3>\n<p>The following organizations may link to our Website without prior written approval:</p>\n<ul>\n<li>Government agencies;</li>\n<li>Search engines;</li>\n<li>News organizations;</li>\n<li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>\n<li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>\n</ul>\n<p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\n<p>We may consider and approve other link requests from the following types of organizations:</p>\n<ul>\n<li>commonly-known consumer and/or business information sources;</li>\n<li>dot.com community sites;</li>\n<li>associations or other groups representing charities;</li>\n<li>online directory distributors;</li>\n<li>internet portals;</li>\n<li>accounting, law and consulting firms; and</li>\n<li>educational institutions and trade associations.</li>\n</ul>\n<p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of eGrocer; and (d) the link is in the context of general resource information.</p>\n<p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party&rsquo;s site.</p>\n<p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to eGrocer. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>\n<p>Approved organizations may hyperlink to our Website as follows:</p>\n<ul>\n<li>By use of our corporate name; or</li>\n<li>By use of the uniform resource locator being linked to; or</li>\n<li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party&rsquo;s site.</li>\n</ul>\n<p>No use of eGrocer\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>\n<h3><strong>iFrames</strong></h3>\n<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>\n<h3><strong>Content Liability</strong></h3>\n<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>\n<h3><strong>Your Privacy</strong></h3>\n<p>Please read Privacy Policy</p>\n<h3><strong>Reservation of Rights</strong></h3>\n<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it&rsquo;s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>\n<h3><strong>Removal of links from our website</strong></h3>\n<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>\n<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>\n<h3><strong>Disclaimer</strong></h3>\n<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>\n<ul>\n<li>limit or exclude our or your liability for death or personal injury;</li>\n<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\n<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\n<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\n</ul>\n<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>'),
(157, 'fcm_server_key', 'AAAAr_eXl_M:APA91bH3V1f4dAUCBR3FEjzWy2YYY9MoTJXSNGx5oI2e5jrDbxozyyeNUhx6hEqTYSyOOAiQkO1ZcxuTmfzNa_D_mwz7G7OqaNP04zigbdHgPv4v_IMI_B26sCSk3MxsUg6U27hZ7ddd');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `slider_url` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-active, 0-deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `type`, `type_id`, `image`, `slider_url`, `status`, `created_at`, `updated_at`) VALUES
(15, 'default', '5', 'sliders/1688815755_36395.jpg', 'null', 1, '2023-06-02 08:30:54', '2023-07-26 05:30:35'),
(16, 'product', '4', 'sliders/1688815742_28468.jpg', 'null', 1, '2023-06-02 08:31:51', '2023-07-08 11:29:02'),
(17, 'category', '4', 'sliders/1688815723_53081.jpg', 'null', 1, '2023-06-02 08:32:14', '2023-07-08 11:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` text NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `icon`, `link`) VALUES
(1, 'fa fa-instagram', 'https://www.instagram.com/wrteam.in/'),
(2, 'fa fa-youtube', 'https://www.youtube.com/channel/UCLt9XRUuiWsqKng4681_6cQ');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_status` varchar(191) NOT NULL,
  `stripe_price` varchar(191) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_product` varchar(191) NOT NULL,
  `stripe_price` varchar(191) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supported_languages`
--

CREATE TABLE `supported_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supported_languages`
--

INSERT INTO `supported_languages` (`id`, `name`, `code`, `type`) VALUES
(1, 'Afrikaans', 'af', 'ltr'),
(2, 'Amharic', 'am', 'ltr'),
(3, 'Arabic', 'ar', 'rtl'),
(4, 'Assamese', 'as', 'ltr'),
(5, 'Azerbaijani', 'az', 'ltr'),
(6, 'Belarusian', 'be', 'ltr'),
(7, 'Bulgarian', 'bg', 'ltr'),
(8, 'Bengali (Bangla)', 'bn', 'ltr'),
(9, 'Bosnian', 'bs', 'ltr'),
(10, 'Catalan (Valencian)', 'ca', 'ltr'),
(11, 'Czech', 'cs', 'ltr'),
(12, 'Welsh', 'cy', 'ltr'),
(13, 'Danish', 'da', 'ltr'),
(14, 'German', 'de', 'ltr'),
(15, 'Modern Greek', 'el', 'ltr'),
(16, 'English', 'en', 'ltr'),
(17, 'Spanish (Castilian)', 'es', 'ltr'),
(18, 'Estonian', 'et', 'ltr'),
(19, 'Basque', 'eu', 'ltr'),
(20, 'Persian', 'fa', 'rtl'),
(21, 'Finnish', 'fi', 'ltr'),
(22, 'Filipino (Pilipino)', 'fil', 'ltr'),
(23, 'French', 'fr', 'ltr'),
(24, 'Galician', 'gl', 'ltr'),
(25, 'Swiss German (Alemannic, Alsatian)', 'gsw', 'ltr'),
(26, 'Gujarati', 'gu', 'ltr'),
(27, 'Hebrew', 'he', 'rtl'),
(28, 'Hindi', 'hi', 'ltr'),
(29, 'Croatian', 'hr', 'ltr'),
(30, 'Hungarian', 'hu', 'ltr'),
(31, 'Armenian', 'hy', 'ltr'),
(32, 'Indonesian', 'id', 'ltr'),
(33, 'Icelandic', 'is', 'ltr'),
(34, 'Italian', 'it', 'ltr'),
(35, 'Japanese', 'ja', 'ltr'),
(36, 'Georgian', 'ka', 'ltr'),
(37, 'Kazakh', 'kk', 'ltr'),
(38, 'Khmer (Central Khmer)', 'km', 'ltr'),
(39, 'Kannada', 'kn', 'ltr'),
(40, 'Korean', 'ko', 'ltr'),
(41, 'Kirghiz (Kyrgyz)', 'ky', 'ltr'),
(42, 'Lao', 'lo', 'ltr'),
(43, 'Lithuanian', 'lt', 'ltr'),
(44, 'Latvian', 'lv', 'ltr'),
(45, 'Macedonian', 'mk', 'ltr'),
(46, 'Malayalam', 'ml', 'ltr'),
(47, 'Mongolian', 'mn', 'ltr'),
(48, 'Marathi', 'mr', 'ltr'),
(49, 'Malay', 'ms', 'ltr'),
(50, 'Burmese', 'my', 'ltr'),
(51, 'Norwegian Bokmål', 'nb', 'ltr'),
(52, 'Nepali', 'ne', 'ltr'),
(53, 'Dutch (Flemish)', 'nl', 'ltr'),
(54, 'Norwegian', 'no', 'ltr'),
(55, 'Oriya', 'or', 'ltr'),
(56, 'Panjabi (Punjabi)', 'pa', 'ltr'),
(57, 'Polish', 'pl', 'ltr'),
(58, 'Pushto (Pashto)', 'ps', 'rtl'),
(59, 'Portuguese', 'pt', 'ltr'),
(60, 'Romanian (Moldavian, Moldovan)', 'ro', 'ltr'),
(61, 'Russian', 'ru', 'ltr'),
(62, 'Sinhala (Sinhalese)', 'si', 'ltr'),
(63, 'Slovak', 'sk', 'ltr'),
(64, 'Slovenian', 'sl', 'ltr'),
(65, 'Albanian', 'sq', 'ltr'),
(66, 'Serbian', 'sr', 'ltr'),
(67, 'Swedish', 'sv', 'ltr'),
(68, 'Swahili', 'sw', 'ltr'),
(69, 'Tamil', 'ta', 'ltr'),
(70, 'Telugu', 'te', 'ltr'),
(71, 'Thai', 'th', 'ltr'),
(72, 'Tagalog', 'tl', 'ltr'),
(73, 'Turkish', 'tr', 'ltr'),
(74, 'Ukrainian', 'uk', 'ltr'),
(75, 'Urdu', 'ur', 'rtl'),
(76, 'Uzbek', 'uz', 'ltr'),
(77, 'Vietnamese', 'vi', 'ltr'),
(78, 'Chinese', 'zh', 'ltr'),
(79, 'Zulu', 'zu', 'ltr');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `status`) VALUES
(10, 'GST', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-active, 0-deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `title`, `from_time`, `to_time`, `last_order_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Full Day', '00:00:00', '12:00:00', '12:00:00', 1, '2023-08-24 05:11:17', '2023-08-24 11:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `txn_id` varchar(191) NOT NULL,
  `payu_txn_id` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_code` varchar(191) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `short_code`, `parent_id`, `conversion`) VALUES
(1, 'Kilo Gram', 'KG', 0, 1),
(2, 'Grams', 'GM', 0, 1),
(3, 'Litter', 'LTR', 0, 1),
(4, 'Milli Litter', 'ML', 0, 1),
(5, 'Dozen', 'Dozen', 0, 1),
(6, 'Pack', 'Pack', 0, 1),
(7, 'Pices', 'PC', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `profile` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) NOT NULL DEFAULT '91',
  `mobile` varchar(191) NOT NULL,
  `auth_uid` varchar(191) NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `referral_code` varchar(191) DEFAULT NULL,
  `friends_code` varchar(191) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile`, `country_code`, `mobile`, `auth_uid`, `balance`, `referral_code`, `friends_code`, `status`, `created_at`, `updated_at`, `deleted_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 'eGrocer WRTeam', 'info.egrocer@gmail.com', '$2y$10$j6mAjJYm.rKq8JEP/Goo/OrX8JvZyIX84v4dgN7XK8Jih.PQThLR2', 'customers/1692871620_1.png', '91', '9876543210', 'n6oAezN1kDU9nAxzrHN3Yfyi89u1', 0, '66C18E', NULL, 1, '2023-08-23 12:11:39', '2023-08-24 12:39:09', '2023-08-24 12:39:09', 'cus_OVbGcqXdK5OHTd', NULL, NULL, NULL),
(2, 'yo', 'yo@gmail.com', '$2y$10$vkeWBI9xNxaoSdxzplHNU.c0yi1BgXEDi9B3k.9wofGH/b16LqIG2', '', '91', '9876543210', 'n6oAezN1kDU9nAxzrHN3Yfyi89u1', 0, 'ED80E8', NULL, 1, '2023-08-24 12:39:31', '2023-08-24 12:39:45', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `alternate_mobile` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `landmark` text NOT NULL,
  `area` varchar(191) NOT NULL,
  `pincode` varchar(191) NOT NULL,
  `city_id` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `type`, `name`, `mobile`, `alternate_mobile`, `address`, `landmark`, `area`, `pincode`, `city_id`, `city`, `state`, `country`, `is_default`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'Home', 'Moaez Demo', '98765463210', '9876543210', 'Bhuj ITI Road', 'India', 'Kachchh', '370040', '31', 'Bhuj', 'Gujarat', 'India', 1, '23.2419997', '69.6669324', '2023-08-24 05:10:01', '2023-08-24 05:10:01'),
(2, 1, 'Home', 'fgsf', '34535345354', '453453453453', 'Dhaneti-Ratnal Road', 'India', 'Kachchh', '370020', '31', 'Bhuj', 'Gujarat', 'India', 0, '23.2419997', '69.6669324', '2023-08-24 10:04:40', '2023-08-24 10:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `fcm_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `type`, `fcm_token`) VALUES
(1, 1, 'customer', 'cmAtmsgsT9ycQxPy0q6gPa:APA91bE4_iyLoz8EbnsgrC67YhW1ZiPmCguelUYtjPS64Ix4YYDJolSv0ejcnp8WzMXArcuVE2jHyA2dhTgjbxswEQWssXPnhBIMGtGPknWqySIkOld2H4pjRsUBxYi-jdxhJWRMsLQB'),
(2, 1, 'customer', 'cdfNC3cP-sZxDS5zuzKDc6:APA91bFOrCntfWRSAVuCMsSwOPVeEH-BHmiCcvMcft71tFs1C9x0Y4FbN2cS7GJsoKsZnMDhoxU3HEq1sc7MSWftbr5Qm68V1ZX-0_3_wkzw42VQW5x35B7i5wr_XKqV5ZCGVAkxyEwh'),
(3, 1, 'customer', 'fIRlccWCTpURoSx0wPehO6:APA91bE9jypHAJ9sTOSHcimoQcV9yBgkZXFh2MKH5m8QXj1EXtapOLP_x0ZK7_jT9eRQhZWOV_Yb3HLLhqRoOmyzqM0W23Z8rXz6vJVuffl6c9--mXkk0qyXW6_YbKC_jgwVkxfsW1Po'),
(4, 1, 'customer', 'eYQlhvxXUSQb-wgZ-OSGYx:APA91bHrbbJRmYxh-ET6aOo68BrXce1fXVkm9t5nzL9CQfW3yM0EW36tzsXMLKqaOGTpFB_PfR9-m5jtqaSwlI033o7gRtR7Ue3XQLfjX8FILG3U9jJDtbs7C2szSKfF8TxF__Fy3oKw'),
(5, 1, 'customer', 'eljjWSlrTvKsWZiXw4sB7o:APA91bFlkRrM2vitrtX85eoDvIUIouqj5zfnP7oLge33m_Utg9Jx87flBqi1IfVENwLK59ZbbcwY92q3wCetkw-Z_mr9wHlaO4xqWzvFT3MiLinWeAu-srcRme9pgHYbGCNlKvQVP0kA'),
(6, 1, 'customer', 'dRhRGKYYTCKbZOL3HsxahI:APA91bFtwBbbyFKdoMEkh19bE2KWIwYx7k-Nh3abZQNC5XhFJhiPuR0YVU3n6H-QAPpXO03dAEskA1RXN5tJWiVy74uQSaYUVW6PEDLPVgOrQ-3MQTpFFqxX-ZV2m0jCsa2E5rn-nQ8k'),
(7, 0, '', 'fdRPK2Y2TXCh9Pc4441wGu:APA91bEVDhrok_vwTv4afs8rMK96atJW-xBc8Eqpm9D-asb2r-kKwk8XRAPtP8LwGi62wNR3GegHk'),
(8, 0, '', 'enelJf3LT0ep54pUXWT2Nl:APA91bGCjqlZ2kAM-i6esfNihyTXc8poQjoK6ot025LVnc82HqK8AuCJch2sKucX29XIF_m7uV41NmUCbBAPfs6w2QGTgByrQKrcGk1HeYNfpLn6ljfbFfct2yrz-1cwcYBkG21Y2dvU');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `message` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_requests`
--

CREATE TABLE `withdrawal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL COMMENT 'user, seller, delivery_boy',
  `type_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `message` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL COMMENT 'This is store reject request',
  `device_type` varchar(191) DEFAULT NULL COMMENT '0 => Web, 1 => Android, 2 => IOS',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_tokens`
--
ALTER TABLE `admin_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_usages`
--
ALTER TABLE `app_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_transactions`
--
ALTER TABLE `delivery_boy_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_settings`
--
ALTER TABLE `mail_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_bank_transfers`
--
ALTER TABLE `order_bank_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_user_id_index` (`user_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_lists`
--
ALTER TABLE `order_status_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_trackings`
--
ALTER TABLE `order_trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_notifications`
--
ALTER TABLE `panel_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panel_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_categories`
--
ALTER TABLE `permission_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_requests`
--
ALTER TABLE `return_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_commissions`
--
ALTER TABLE `seller_commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_transactions`
--
ALTER TABLE `seller_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_transactions`
--
ALTER TABLE `seller_wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supported_languages`
--
ALTER TABLE `supported_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_index` (`user_id`),
  ADD KEY `transactions_order_id_index` (`order_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_tokens`
--
ALTER TABLE `admin_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_usages`
--
ALTER TABLE `app_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_transactions`
--
ALTER TABLE `delivery_boy_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mail_settings`
--
ALTER TABLE `mail_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_bank_transfers`
--
ALTER TABLE `order_bank_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `order_status_lists`
--
ALTER TABLE `order_status_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_trackings`
--
ALTER TABLE `order_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `permission_categories`
--
ALTER TABLE `permission_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `return_requests`
--
ALTER TABLE `return_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `seller_commissions`
--
ALTER TABLE `seller_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_transactions`
--
ALTER TABLE `seller_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallet_transactions`
--
ALTER TABLE `seller_wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supported_languages`
--
ALTER TABLE `supported_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_requests`
--
ALTER TABLE `withdrawal_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
