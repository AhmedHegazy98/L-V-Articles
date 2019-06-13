-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 17, 2019 at 11:25 AM
-- Server version: 5.7.23
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rooya`
--

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
CREATE TABLE IF NOT EXISTS `careers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `information` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `career_categories`
--

DROP TABLE IF EXISTS `career_categories`;
CREATE TABLE IF NOT EXISTS `career_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Post_Category 1', 'post_category-1', '2019-02-10 13:49:00', '2019-02-10 14:00:31'),
(2, NULL, 1, 'Post_Category 2', 'Post_category-2', '2019-02-10 13:49:00', '2019-02-10 14:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `ceo_keys`
--

DROP TABLE IF EXISTS `ceo_keys`;
CREATE TABLE IF NOT EXISTS `ceo_keys` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(12, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(13, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(14, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(15, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(16, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(17, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(18, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(19, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(20, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(21, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(22, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(23, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(25, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(26, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(27, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(28, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(29, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(30, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(31, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(32, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(34, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(35, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(36, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(37, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(38, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(39, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(40, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(41, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(42, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(43, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(44, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(45, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(46, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(47, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(48, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(49, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(50, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(51, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(52, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(53, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(54, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(55, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(56, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(57, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(58, 1, 'full_name', 'text', 'Full Name', 0, 1, 1, 1, 1, 1, '{}', 12),
(59, 1, 'user_name', 'text', 'User Name', 0, 1, 1, 1, 1, 1, '{}', 13),
(60, 1, 'adress', 'text', 'Adress', 0, 1, 1, 1, 1, 1, '{}', 14),
(61, 1, 'birth_date', 'date', 'Birth Date', 0, 1, 1, 1, 1, 1, '{}', 15),
(62, 1, 'bio', 'text_area', 'Bio', 0, 1, 1, 1, 1, 1, '{}', 16),
(63, 1, 'country', 'text', 'Country', 0, 1, 1, 1, 1, 1, '{}', 17),
(64, 1, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 18),
(65, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(66, 10, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 2),
(67, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(68, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(69, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(70, 11, 'first_name', 'text', 'First Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(71, 11, 'last_name', 'text', 'Last Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(72, 11, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 4),
(73, 11, 'phone', 'text', 'Phone', 1, 1, 1, 1, 1, 1, '{}', 5),
(74, 11, 'message', 'text_area', 'Message', 1, 1, 1, 1, 1, 1, '{}', 6),
(75, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(76, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(77, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 12, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 2),
(79, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(80, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(81, 13, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 13, 'keyword', 'text', 'Keyword', 1, 1, 1, 1, 1, 1, '{}', 2),
(83, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(84, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(85, 16, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(86, 16, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(87, 16, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(88, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(89, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(90, 16, 'user_gellary_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 6),
(91, 17, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(92, 17, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 2),
(93, 17, 'user_id', 'number', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(94, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(95, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(96, 17, 'user_work_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 6),
(97, 5, 'post_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 16),
(98, 5, 'post_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 17),
(99, 18, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(100, 18, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(101, 18, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3),
(102, 18, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(103, 18, 'information', 'text_area', 'Information', 0, 1, 1, 1, 1, 1, '{}', 5),
(104, 18, 'website_link', 'text', 'Website Link', 0, 1, 1, 1, 1, 1, '{}', 6),
(105, 18, 'salary', 'text', 'Salary', 0, 1, 1, 1, 1, 1, '{}', 7),
(106, 18, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 8),
(107, 18, 'adress', 'text', 'Adress', 0, 1, 1, 1, 1, 1, '{}', 9),
(108, 18, 'category_id', 'number', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 10),
(109, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 11),
(110, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(111, 19, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(112, 19, 'category', 'text', 'Category', 0, 1, 1, 1, 1, 1, '{}', 2),
(113, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(114, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(115, 18, 'career_belongsto_career_category_relationship', 'relationship', 'career_categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\CareerCategory\",\"table\":\"career_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"category\",\"pivot_table\":\"career_categories\",\"pivot\":\"0\",\"taggable\":null}', 13),
(122, 21, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(123, 21, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(124, 21, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 3),
(125, 21, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(126, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(127, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(128, 22, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(129, 22, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 2),
(130, 22, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(131, 22, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 4),
(132, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(133, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null}', '2019-02-10 13:48:55', '2019-02-11 08:11:13'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-02-10 13:48:55', '2019-02-10 13:48:55'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-02-10 13:48:55', '2019-02-10 13:48:55'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2019-02-10 13:48:59', '2019-02-10 13:48:59'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(10, 'our_partners', 'our-partners', 'Our Partner', 'Our Partners', 'voyager-group', 'App\\OurPartner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 08:32:44', '2019-02-11 08:32:44'),
(11, 'visitors', 'visitors', 'Visitor', 'Visitors', 'voyager-mail', 'App\\Visitor', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 08:41:58', '2019-02-11 08:41:58'),
(12, 'subscribers', 'subscribers', 'Subscriber', 'Subscribers', 'voyager-mail', 'App\\Subscriber', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 08:44:29', '2019-02-11 08:44:29'),
(13, 'ceo_keys', 'ceo-keys', 'Ceo Key', 'Ceo Keys', 'voyager-tag', 'App\\CeoKey', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 08:45:58', '2019-02-11 08:45:58'),
(16, 'user_gellaries', 'user-gellaries', 'User Gellary', 'User Gellaries', 'voyager-photos', 'App\\UserGellary', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 08:55:49', '2019-02-11 08:55:49'),
(17, 'user_works', 'user-works', 'User Work', 'User Works', 'voyager-receipt', 'App\\UserWork', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 08:58:42', '2019-02-11 08:58:42'),
(18, 'careers', 'careers', 'Career', 'Careers', 'voyager-laptop', 'App\\Career', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 09:14:13', '2019-02-11 09:14:13'),
(19, 'career_categories', 'career-categories', 'Career Category', 'Career Categories', 'voyager-tag', 'App\\CareerCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 09:15:43', '2019-02-11 09:15:43'),
(21, 'our_teams', 'our-teams', 'Our Team', 'Our Teams', 'voyager-bug', 'App\\OurTeam', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 09:37:46', '2019-02-11 09:37:46'),
(22, 'our_works', 'our-works', 'Our Work', 'Our Works', 'voyager-trophy', 'App\\OurWork', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-02-11 09:43:37', '2019-02-11 09:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-02-10 13:48:56', '2019-02-10 13:48:56');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2019-02-10 13:48:56', '2019-02-10 13:48:56', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2019-02-10 13:48:56', '2019-02-10 13:48:56', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2019-02-10 13:49:00', '2019-02-10 13:49:00', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2019-02-10 13:49:00', '2019-02-10 13:49:00', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2019-02-10 13:49:01', '2019-02-10 13:49:01', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2019-02-10 13:49:02', '2019-02-10 13:49:02', 'voyager.hooks', NULL),
(18, 1, 'Our Partners', '', '_self', 'voyager-group', NULL, NULL, 17, '2019-02-11 08:32:44', '2019-02-11 08:32:44', 'voyager.our-partners.index', NULL),
(19, 1, 'Visitors', '', '_self', 'voyager-mail', NULL, NULL, 18, '2019-02-11 08:41:58', '2019-02-11 08:41:58', 'voyager.visitors.index', NULL),
(20, 1, 'Subscribers', '', '_self', 'voyager-mail', NULL, NULL, 19, '2019-02-11 08:44:29', '2019-02-11 08:44:29', 'voyager.subscribers.index', NULL),
(21, 1, 'Ceo Keys', '', '_self', 'voyager-tag', NULL, NULL, 20, '2019-02-11 08:45:58', '2019-02-11 08:45:58', 'voyager.ceo-keys.index', NULL),
(24, 1, 'User Gellaries', '', '_self', 'voyager-photos', NULL, NULL, 21, '2019-02-11 08:55:49', '2019-02-11 08:55:49', 'voyager.user-gellaries.index', NULL),
(25, 1, 'User Works', '', '_self', 'voyager-receipt', NULL, NULL, 22, '2019-02-11 08:58:43', '2019-02-11 08:58:43', 'voyager.user-works.index', NULL),
(26, 1, 'Careers', '', '_self', 'voyager-laptop', NULL, NULL, 23, '2019-02-11 09:14:13', '2019-02-11 09:14:13', 'voyager.careers.index', NULL),
(27, 1, 'Career Categories', '', '_self', 'voyager-tag', NULL, NULL, 24, '2019-02-11 09:15:44', '2019-02-11 09:15:44', 'voyager.career-categories.index', NULL),
(29, 1, 'Our Teams', '', '_self', 'voyager-bug', NULL, NULL, 25, '2019-02-11 09:37:46', '2019-02-11 09:37:46', 'voyager.our-teams.index', NULL),
(30, 1, 'Our Works', '', '_self', 'voyager-trophy', NULL, NULL, 26, '2019-02-11 09:43:37', '2019-02-11 09:43:37', 'voyager.our-works.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `our_partners`
--

DROP TABLE IF EXISTS `our_partners`;
CREATE TABLE IF NOT EXISTS `our_partners` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `our_teams`
--

DROP TABLE IF EXISTS `our_teams`;
CREATE TABLE IF NOT EXISTS `our_teams` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `our_works`
--

DROP TABLE IF EXISTS `our_works`;
CREATE TABLE IF NOT EXISTS `our_works` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2019-02-10 13:49:01', '2019-02-10 13:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(2, 'browse_bread', NULL, '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(3, 'browse_database', NULL, '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(4, 'browse_media', NULL, '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(5, 'browse_compass', NULL, '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(6, 'browse_menus', 'menus', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(7, 'read_menus', 'menus', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(8, 'edit_menus', 'menus', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(9, 'add_menus', 'menus', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(10, 'delete_menus', 'menus', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(11, 'browse_roles', 'roles', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(12, 'read_roles', 'roles', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(13, 'edit_roles', 'roles', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(14, 'add_roles', 'roles', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(15, 'delete_roles', 'roles', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(16, 'browse_users', 'users', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(17, 'read_users', 'users', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(18, 'edit_users', 'users', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(19, 'add_users', 'users', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(20, 'delete_users', 'users', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(21, 'browse_settings', 'settings', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(22, 'read_settings', 'settings', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(23, 'edit_settings', 'settings', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(24, 'add_settings', 'settings', '2019-02-10 13:48:57', '2019-02-10 13:48:57'),
(25, 'delete_settings', 'settings', '2019-02-10 13:48:57', '2019-02-10 13:48:57'),
(26, 'browse_categories', 'categories', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(27, 'read_categories', 'categories', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(28, 'edit_categories', 'categories', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(29, 'add_categories', 'categories', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(30, 'delete_categories', 'categories', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(31, 'browse_posts', 'posts', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(32, 'read_posts', 'posts', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(33, 'edit_posts', 'posts', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(34, 'add_posts', 'posts', '2019-02-10 13:49:00', '2019-02-10 13:49:00'),
(35, 'delete_posts', 'posts', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(36, 'browse_pages', 'pages', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(37, 'read_pages', 'pages', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(38, 'edit_pages', 'pages', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(39, 'add_pages', 'pages', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(40, 'delete_pages', 'pages', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(41, 'browse_hooks', NULL, '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(57, 'browse_our_partners', 'our_partners', '2019-02-11 08:32:44', '2019-02-11 08:32:44'),
(58, 'read_our_partners', 'our_partners', '2019-02-11 08:32:44', '2019-02-11 08:32:44'),
(59, 'edit_our_partners', 'our_partners', '2019-02-11 08:32:44', '2019-02-11 08:32:44'),
(60, 'add_our_partners', 'our_partners', '2019-02-11 08:32:44', '2019-02-11 08:32:44'),
(61, 'delete_our_partners', 'our_partners', '2019-02-11 08:32:44', '2019-02-11 08:32:44'),
(62, 'browse_visitors', 'visitors', '2019-02-11 08:41:58', '2019-02-11 08:41:58'),
(63, 'read_visitors', 'visitors', '2019-02-11 08:41:58', '2019-02-11 08:41:58'),
(64, 'edit_visitors', 'visitors', '2019-02-11 08:41:58', '2019-02-11 08:41:58'),
(65, 'add_visitors', 'visitors', '2019-02-11 08:41:58', '2019-02-11 08:41:58'),
(66, 'delete_visitors', 'visitors', '2019-02-11 08:41:58', '2019-02-11 08:41:58'),
(67, 'browse_subscribers', 'subscribers', '2019-02-11 08:44:29', '2019-02-11 08:44:29'),
(68, 'read_subscribers', 'subscribers', '2019-02-11 08:44:29', '2019-02-11 08:44:29'),
(69, 'edit_subscribers', 'subscribers', '2019-02-11 08:44:29', '2019-02-11 08:44:29'),
(70, 'add_subscribers', 'subscribers', '2019-02-11 08:44:29', '2019-02-11 08:44:29'),
(71, 'delete_subscribers', 'subscribers', '2019-02-11 08:44:29', '2019-02-11 08:44:29'),
(72, 'browse_ceo_keys', 'ceo_keys', '2019-02-11 08:45:58', '2019-02-11 08:45:58'),
(73, 'read_ceo_keys', 'ceo_keys', '2019-02-11 08:45:58', '2019-02-11 08:45:58'),
(74, 'edit_ceo_keys', 'ceo_keys', '2019-02-11 08:45:58', '2019-02-11 08:45:58'),
(75, 'add_ceo_keys', 'ceo_keys', '2019-02-11 08:45:58', '2019-02-11 08:45:58'),
(76, 'delete_ceo_keys', 'ceo_keys', '2019-02-11 08:45:58', '2019-02-11 08:45:58'),
(87, 'browse_user_gellaries', 'user_gellaries', '2019-02-11 08:55:49', '2019-02-11 08:55:49'),
(88, 'read_user_gellaries', 'user_gellaries', '2019-02-11 08:55:49', '2019-02-11 08:55:49'),
(89, 'edit_user_gellaries', 'user_gellaries', '2019-02-11 08:55:49', '2019-02-11 08:55:49'),
(90, 'add_user_gellaries', 'user_gellaries', '2019-02-11 08:55:49', '2019-02-11 08:55:49'),
(91, 'delete_user_gellaries', 'user_gellaries', '2019-02-11 08:55:49', '2019-02-11 08:55:49'),
(92, 'browse_user_works', 'user_works', '2019-02-11 08:58:43', '2019-02-11 08:58:43'),
(93, 'read_user_works', 'user_works', '2019-02-11 08:58:43', '2019-02-11 08:58:43'),
(94, 'edit_user_works', 'user_works', '2019-02-11 08:58:43', '2019-02-11 08:58:43'),
(95, 'add_user_works', 'user_works', '2019-02-11 08:58:43', '2019-02-11 08:58:43'),
(96, 'delete_user_works', 'user_works', '2019-02-11 08:58:43', '2019-02-11 08:58:43'),
(97, 'browse_careers', 'careers', '2019-02-11 09:14:13', '2019-02-11 09:14:13'),
(98, 'read_careers', 'careers', '2019-02-11 09:14:13', '2019-02-11 09:14:13'),
(99, 'edit_careers', 'careers', '2019-02-11 09:14:13', '2019-02-11 09:14:13'),
(100, 'add_careers', 'careers', '2019-02-11 09:14:13', '2019-02-11 09:14:13'),
(101, 'delete_careers', 'careers', '2019-02-11 09:14:13', '2019-02-11 09:14:13'),
(102, 'browse_career_categories', 'career_categories', '2019-02-11 09:15:43', '2019-02-11 09:15:43'),
(103, 'read_career_categories', 'career_categories', '2019-02-11 09:15:43', '2019-02-11 09:15:43'),
(104, 'edit_career_categories', 'career_categories', '2019-02-11 09:15:43', '2019-02-11 09:15:43'),
(105, 'add_career_categories', 'career_categories', '2019-02-11 09:15:43', '2019-02-11 09:15:43'),
(106, 'delete_career_categories', 'career_categories', '2019-02-11 09:15:43', '2019-02-11 09:15:43'),
(112, 'browse_our_teams', 'our_teams', '2019-02-11 09:37:46', '2019-02-11 09:37:46'),
(113, 'read_our_teams', 'our_teams', '2019-02-11 09:37:46', '2019-02-11 09:37:46'),
(114, 'edit_our_teams', 'our_teams', '2019-02-11 09:37:46', '2019-02-11 09:37:46'),
(115, 'add_our_teams', 'our_teams', '2019-02-11 09:37:46', '2019-02-11 09:37:46'),
(116, 'delete_our_teams', 'our_teams', '2019-02-11 09:37:46', '2019-02-11 09:37:46'),
(117, 'browse_our_works', 'our_works', '2019-02-11 09:43:37', '2019-02-11 09:43:37'),
(118, 'read_our_works', 'our_works', '2019-02-11 09:43:37', '2019-02-11 09:43:37'),
(119, 'edit_our_works', 'our_works', '2019-02-11 09:43:37', '2019-02-11 09:43:37'),
(120, 'add_our_works', 'our_works', '2019-02-11 09:43:37', '2019-02-11 09:43:37'),
(121, 'delete_our_works', 'our_works', '2019-02-11 09:43:37', '2019-02-11 09:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 3),
(3, 3),
(4, 1),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(18, 3),
(19, 1),
(19, 3),
(20, 1),
(20, 3),
(21, 1),
(21, 3),
(22, 1),
(22, 3),
(23, 1),
(23, 3),
(24, 1),
(24, 3),
(25, 1),
(25, 3),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(66, 3),
(67, 1),
(67, 3),
(68, 1),
(68, 3),
(69, 1),
(69, 3),
(70, 1),
(70, 3),
(71, 1),
(71, 3),
(72, 1),
(72, 3),
(73, 1),
(73, 3),
(74, 1),
(74, 3),
(75, 1),
(75, 3),
(76, 1),
(76, 3),
(87, 1),
(87, 3),
(88, 1),
(88, 3),
(89, 1),
(89, 3),
(90, 1),
(90, 3),
(91, 1),
(91, 3),
(92, 1),
(92, 3),
(93, 1),
(93, 3),
(94, 1),
(94, 3),
(95, 1),
(95, 3),
(96, 1),
(96, 3),
(97, 1),
(97, 3),
(98, 1),
(98, 3),
(99, 1),
(99, 3),
(100, 1),
(100, 3),
(101, 1),
(101, 3),
(102, 1),
(102, 3),
(103, 1),
(103, 3),
(104, 1),
(104, 3),
(105, 1),
(105, 3),
(106, 1),
(106, 3),
(112, 1),
(112, 3),
(113, 1),
(113, 3),
(114, 1),
(114, 3),
(115, 1),
(115, 3),
(116, 1),
(116, 3),
(117, 1),
(117, 3),
(118, 1),
(118, 3),
(119, 1),
(119, 3),
(120, 1),
(120, 3),
(121, 1),
(121, 3);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2019-02-10 13:49:01', '2019-02-10 13:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(2, 'user', 'Normal User', '2019-02-10 13:48:56', '2019-02-10 13:48:56'),
(3, 'programmer', 'programmer', '2019-02-11 09:16:55', '2019-02-11 09:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Rooya', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Rooya Development', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '893498435511-ntv7ivnu1tdvmhqjc4t5ngn83dp77fgp.apps.googleusercontent.com', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-02-10 13:49:01', '2019-02-10 13:49:01'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-02-10 13:49:02', '2019-02-10 13:49:02'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-02-10 13:49:02', '2019-02-10 13:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `full_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `full_name`, `user_name`, `adress`, `birth_date`, `bio`, `country`, `phone`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$cxC/SwLhTNSzePhnCRGY4OM7qwW1h4w/9LVzLQDfXtXyyeEeVumWq', 'P8q8Nq3XHfxosa8iFx4in9cbykaObhYxWDzhGurFbfsZeiO3l7qWVL9EyJN2', NULL, '2019-02-10 13:49:00', '2019-02-10 13:49:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 'programmer', 'programmer@programmer.com', 'users/default.png', NULL, '$2y$10$Qbf8ZGUIif5ozizhCYFuBuByHMBcWZ/Mw4Ws6n4.BEnyHMy6g8IRa', 'cq6tYtiQhrjPZoG0PVCo5f2LmkntW3D5yL5ydReTd2C8M6pHy0Plq5B1OtOP', NULL, '2019-02-11 09:17:54', '2019-02-11 09:17:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_gellaries`
--

DROP TABLE IF EXISTS `user_gellaries`;
CREATE TABLE IF NOT EXISTS `user_gellaries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_works`
--

DROP TABLE IF EXISTS `user_works`;
CREATE TABLE IF NOT EXISTS `user_works` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE IF NOT EXISTS `visitors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
