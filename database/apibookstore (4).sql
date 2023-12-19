-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 19, 2023 lúc 03:11 PM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `apibookstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tony', '2023-10-15 23:46:14', '2023-10-15 23:46:14'),
(2, 'Nguyễn Nhật Ánh', '2023-10-15 23:46:45', '2023-10-15 23:46:45'),
(4, 'Jordan Belfort', '2023-10-18 23:54:14', '2023-10-18 23:54:14'),
(5, 'David Grann', '2023-10-19 03:39:39', '2023-11-14 06:22:59'),
(7, 'a', '2023-12-06 07:16:12', '2023-12-06 07:16:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author_book`
--

DROP TABLE IF EXISTS `author_book`;
CREATE TABLE IF NOT EXISTS `author_book` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_book_author_id_foreign` (`author_id`),
  KEY `author_book_book_id_foreign` (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `author_book`
--

INSERT INTO `author_book` (`id`, `author_id`, `book_id`, `created_at`, `updated_at`) VALUES
(26, 5, 17, NULL, NULL),
(25, 2, 11, NULL, NULL),
(24, 2, 12, NULL, NULL),
(23, 2, 13, NULL, NULL),
(22, 4, 14, NULL, NULL),
(18, 2, 47, NULL, NULL),
(17, 1, 47, NULL, NULL),
(21, 4, 15, NULL, NULL),
(19, 1, 46, NULL, NULL),
(27, 4, 16, NULL, NULL),
(28, 5, 18, NULL, NULL),
(29, 1, 48, NULL, NULL),
(30, 2, 48, NULL, NULL),
(31, 1, 49, NULL, NULL),
(32, 2, 49, NULL, NULL),
(33, 1, 50, NULL, NULL),
(34, 2, 50, NULL, NULL),
(40, 2, 51, NULL, NULL),
(36, 7, 51, NULL, NULL),
(38, 2, 52, NULL, NULL),
(39, 4, 52, NULL, NULL),
(41, 5, 49, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `booklayouts`
--

DROP TABLE IF EXISTS `booklayouts`;
CREATE TABLE IF NOT EXISTS `booklayouts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `booklayouts`
--

INSERT INTO `booklayouts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Bìa Cứng', '2023-11-02 02:52:50', '2023-11-02 02:52:50'),
(3, 'Bìa Mềm', '2023-11-02 02:53:11', '2023-11-02 02:53:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `categories_id` bigint UNSIGNED NOT NULL,
  `publisher_id` bigint UNSIGNED NOT NULL,
  `language_id` bigint UNSIGNED NOT NULL,
  `booklayout_id` bigint UNSIGNED NOT NULL,
  `promotion_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `publication_day` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_category_id_foreign` (`categories_id`),
  KEY `books_publishers_id_foreign` (`publisher_id`),
  KEY `books_languages_id_foreign` (`language_id`),
  KEY `books_promotions_id_foreign` (`promotion_id`),
  KEY `books_booklayouts_id_foreign` (`booklayout_id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`id`, `name`, `description`, `quantity`, `price`, `categories_id`, `publisher_id`, `language_id`, `booklayout_id`, `promotion_id`, `created_at`, `updated_at`, `publication_day`) VALUES
(15, 'Sói già phố Wall - Phần 2', NULL, 12, 150000, 1, 2, 1, 2, 2, '2023-10-18 23:57:21', '2023-12-13 20:01:11', NULL),
(14, 'Sói già phố Wall - Phần 1', NULL, 10, 150000, 1, 3, 1, 2, 2, '2023-10-18 23:57:10', '2023-12-19 01:45:30', '1970-01-01'),
(13, 'Làm bạn với bầu trời', NULL, 10, 100000, 2, 2, 1, 2, 2, '2023-10-18 23:52:59', '2023-10-18 23:52:59', NULL),
(12, 'Tôi là BêTô', NULL, 10, 100000, 2, 2, 1, 2, 2, '2023-10-18 23:52:28', '2023-10-18 23:52:28', NULL),
(11, 'Cảm ơn người lớn', NULL, 10, 100000, 2, 3, 1, 2, 2, '2023-10-18 23:51:49', '2023-12-19 01:37:10', '1970-01-01'),
(17, 'Fear', NULL, 10, 150000, 6, 2, 1, 2, 2, '2023-10-19 03:40:28', '2023-10-19 03:40:28', NULL),
(16, 'Sói già phố Wall - Phần 3', NULL, 11, 150000, 1, 3, 1, 2, 2, '2023-10-18 23:57:31', '2023-12-19 01:38:25', '1970-01-01'),
(18, 'Giận', NULL, 10, 150000, 6, 2, 1, 2, 2, '2023-10-19 03:40:46', '2023-10-19 03:40:46', NULL),
(48, 'AI34', 'A', 10, 100000, 2, 2, 1, 2, 2, '2023-11-03 01:55:43', '2023-11-03 01:55:43', NULL),
(49, 'AI35', 'A', 12, 100000, 2, 2, 1, 2, 2, '2023-11-03 01:56:35', '2023-12-13 20:05:40', '1970-01-01'),
(46, 'A2', 'A', 10, 100000, 2, 2, 1, 2, 2, '2023-11-03 01:22:52', '2023-11-03 01:41:17', NULL),
(47, 'AI33', 'A', 10, 100000, 2, 2, 1, 2, 2, '2023-11-03 01:38:42', '2023-11-03 01:38:42', NULL),
(51, 'AN999', NULL, 100, 100000, 1, 2, 3, 3, 2, '2023-12-06 07:20:43', '2023-12-10 03:09:47', '2022-02-02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Kinh tế', '2023-10-16 00:28:18', '2023-11-14 06:29:09'),
(2, 'Tiểu thuyết', '2023-10-16 00:38:01', '2023-10-16 00:38:01'),
(6, 'Tâm lý - kỹ năng sống', '2023-10-19 03:39:11', '2023-10-19 03:39:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `image_book_id_foreign` (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `image_path`, `book_id`, `created_at`, `updated_at`) VALUES
(1, '1697698641.jpg', 15, NULL, NULL),
(2, '1697698630.jpg', 14, NULL, NULL),
(3, '1697698379.jpg', 13, NULL, NULL),
(4, '1697698348.jpg', 12, NULL, NULL),
(5, '1697698309.jpg', 11, NULL, NULL),
(6, '1697712028.jpg', 17, NULL, NULL),
(7, '1697698651.jpg', 16, NULL, NULL),
(8, '1697712046.jpg', 18, NULL, NULL),
(16, '660167884.jpg', 47, '2023-11-03 01:38:42', '2023-11-03 01:38:42'),
(15, '2022348401.jpg', 47, '2023-11-03 01:38:42', '2023-11-03 01:38:42'),
(14, '1527213730.jpg', 46, '2023-11-03 01:22:52', '2023-11-03 01:22:52'),
(13, '1323748939.jpg', 46, '2023-11-03 01:22:52', '2023-11-03 01:22:52'),
(17, '1641840571.jpg', 48, '2023-11-03 01:55:43', '2023-11-03 01:55:43'),
(18, '812645234.jpg', 48, '2023-11-03 01:55:43', '2023-11-03 01:55:43'),
(19, '1281290906.jpg', 49, '2023-11-03 01:56:35', '2023-11-03 01:56:35'),
(20, '3966845.jpg', 49, '2023-11-03 01:56:35', '2023-11-03 01:56:35'),
(21, '1765522190.jpg', 50, '2023-12-06 07:15:13', '2023-12-06 07:15:13'),
(22, '21896108.jpg', 50, '2023-12-06 07:15:13', '2023-12-06 07:15:13'),
(36, '1559415942.jpg', 53, '2023-12-19 02:42:32', '2023-12-19 02:42:32'),
(33, '117726086.jpg', 51, '2023-12-13 20:03:33', '2023-12-13 20:03:33'),
(25, '1816307738.jpg', 52, '2023-12-06 21:07:38', '2023-12-06 21:07:38'),
(26, '817278606.jpg', 52, '2023-12-06 21:07:38', '2023-12-06 21:07:38'),
(35, '1798052566.jpg', 53, '2023-12-19 02:42:32', '2023-12-19 02:42:32'),
(31, '2133949344.jpg', 51, '2023-12-10 03:02:40', '2023-12-10 03:02:40'),
(37, '1754701761.jpg', 53, '2023-12-19 02:42:32', '2023-12-19 02:42:32'),
(38, '1480153659.jpg', 54, '2023-12-19 02:46:27', '2023-12-19 02:46:27'),
(39, '1733168070.jpg', 55, '2023-12-19 02:53:53', '2023-12-19 02:53:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `languages`
--

INSERT INTO `languages` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Nhật', '2023-11-02 01:17:17', '2023-11-02 01:21:12'),
(3, 'English', '2023-11-02 01:18:04', '2023-11-02 01:18:04'),
(4, 'Việt', '2023-11-02 01:18:20', '2023-11-02 01:18:20'),
(5, 'Anh', '2023-11-02 01:18:27', '2023-11-02 01:18:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_16_062034_create_authors_table', 1),
(6, '2023_10_16_070434_create_categories_table', 2),
(7, '2023_10_16_131217_create_book_table', 3),
(9, '2023_10_16_133221_add_image_path_column_to_table', 4),
(10, '2023_10_16_141004_add_author_id_column_to_book_table', 5),
(14, '2023_10_31_075313_create_image_table', 6),
(15, '2023_11_02_070831_create_publishers_table', 6),
(16, '2023_11_02_071437_create_languages_table', 6),
(17, '2023_11_02_071521_create_booklayouts_table', 6),
(18, '2023_11_02_071647_create_promotions_table', 6),
(19, '2023_11_02_072910_create_book_author_table', 7),
(20, '2023_11_02_073958_add_foreign_key_to_books_table', 8),
(21, '2023_11_02_083827_add_type_to_book_author_table', 9),
(22, '2023_11_02_105343_author_book', 10),
(24, '2023_11_03_085040_add_foregin_key_to_author_book_table', 11),
(25, '2023_11_08_134836_create_permission_tables', 12),
(26, '2023_11_21_123212_create_order_table', 13),
(27, '2023_11_21_124527_create_order_details_table', 13),
(28, '2023_11_22_053758_add_address_to_users', 14),
(29, '2023_11_22_101202_add_google_id_table', 15),
(31, '2023_11_28_065448_add_order_code_to_order_table', 16),
(32, '2023_11_29_070952_add_foreign_key_to_order_details_table', 17),
(33, '2023_11_29_072010_create_wishlist_table', 18),
(34, '2023_12_01_083352_add_payment_column_to_orders_table', 19),
(35, '2023_12_06_072114_add_date_column_to_books_table', 20),
(36, '2023_12_11_132911_add_status_column_to_orders_table', 21),
(37, '2023_12_11_141652_add_has_receive_column_to_orders_table', 22),
(38, '2023_12_18_141743_add_is_locked_to_users_table', 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 12),
(5, 'App\\Models\\User', 12),
(1, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 15),
(5, 'App\\Models\\User', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 11),
(4, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `total` double(8,2) NOT NULL,
  `order_code` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'chưa xác nhận',
  `has_received` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `date`, `total`, `order_code`, `payment`, `user_id`, `created_at`, `updated_at`, `status`, `has_received`) VALUES
(10, '2023-12-01', 585000.00, 'e5mYkw98FK', 'VN PAY', 3, '2023-12-01 01:55:31', '2023-12-12 01:34:34', 'chưa xác nhận', 1),
(11, '2023-12-01', 585000.00, 'oL8r5BNpLU', 'VN PAY', 3, '2023-12-01 02:08:11', '2023-12-12 00:37:24', 'đã nhận', 1),
(12, '2023-12-01', 585000.00, 'Zhu0ZHBe8y', 'VN PAY', 3, '2023-12-01 02:12:28', '2023-12-12 00:37:54', 'hủy', 0),
(13, '2023-12-01', 585000.00, 'aXp2FdYlW3', 'VN PAY', 3, '2023-12-01 02:32:03', '2023-12-12 02:53:07', 'đã nhận', 1),
(14, '2023-12-07', 135000.00, 'DHMeo2m0aX', 'VN PAY', 3, '2023-12-06 20:21:56', '2023-12-12 02:54:35', 'hủy', 0),
(15, '2023-12-07', 225000.00, 'r4ioUjXb5A', 'VN PAY', 3, '2023-12-06 21:04:39', '2023-12-06 21:04:39', 'chưa xác nhận', 0),
(16, '2023-12-12', 90000.00, 'jzbVOfcshn', 'Thanh toán khi nhận hàng', 3, '2023-12-12 02:58:55', '2023-12-12 02:58:55', 'chưa xác nhận', 0),
(25, '2023-12-12', 135000.00, 'hgvmneKkel', 'VN PAY', 3, '2023-12-12 04:14:12', '2023-12-12 04:14:12', 'chưa xác nhận', 0),
(26, '2023-12-12', 810000.00, 'HPmFr3qIKS', 'Thanh toán khi nhận hàng', 3, '2023-12-12 07:13:28', '2023-12-12 07:24:00', 'chưa xác nhận', 0),
(27, '2023-12-12', 810000.00, 'yxwiUWSniq', 'Thanh toán khi nhận hàng', 3, '2023-12-12 07:16:14', '2023-12-12 07:16:14', 'chưa xác nhận', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `book_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(9, 10, 15, 2, 135000.00, '2023-12-01 01:55:31', '2023-12-01 01:55:31'),
(10, 10, 49, 2, 90000.00, '2023-12-01 01:55:31', '2023-12-01 01:55:31'),
(11, 10, 16, 1, 135000.00, '2023-12-01 01:55:31', '2023-12-01 01:55:31'),
(12, 11, 15, 2, 135000.00, '2023-12-01 02:08:11', '2023-12-01 02:08:11'),
(13, 11, 49, 2, 90000.00, '2023-12-01 02:08:11', '2023-12-01 02:08:11'),
(14, 11, 16, 1, 135000.00, '2023-12-01 02:08:11', '2023-12-01 02:08:11'),
(15, 12, 15, 2, 135000.00, '2023-12-01 02:12:28', '2023-12-01 02:12:28'),
(16, 12, 49, 2, 90000.00, '2023-12-01 02:12:28', '2023-12-01 02:12:28'),
(17, 12, 16, 1, 135000.00, '2023-12-01 02:12:28', '2023-12-01 02:12:28'),
(18, 13, 15, 2, 135000.00, '2023-12-01 02:32:03', '2023-12-01 02:32:03'),
(19, 13, 49, 2, 90000.00, '2023-12-01 02:32:03', '2023-12-01 02:32:03'),
(20, 13, 16, 1, 135000.00, '2023-12-01 02:32:03', '2023-12-01 02:32:03'),
(21, 14, 17, 1, 135000.00, '2023-12-06 20:21:56', '2023-12-06 20:21:56'),
(22, 15, 14, 1, 135000.00, '2023-12-06 21:04:39', '2023-12-06 21:04:39'),
(23, 15, 11, 1, 90000.00, '2023-12-06 21:04:39', '2023-12-06 21:04:39'),
(24, 16, 13, 1, 90000.00, '2023-12-12 02:58:55', '2023-12-12 02:58:55'),
(34, 25, 16, 1, 135000.00, '2023-12-12 04:14:12', '2023-12-12 04:14:12'),
(35, 26, 14, 6, 135000.00, '2023-12-12 07:13:28', '2023-12-12 07:13:28'),
(36, 27, 14, 6, 135000.00, '2023-12-12 07:16:14', '2023-12-12 07:16:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'category.delete', 'web', '2023-11-09 06:58:31', '2023-11-09 06:58:31'),
(2, 'category.index', 'web', '2023-11-09 06:58:37', '2023-11-09 06:58:37'),
(3, 'category.show', 'web', '2023-11-09 06:58:42', '2023-11-09 06:58:42'),
(4, 'category.update', 'web', '2023-11-09 06:58:47', '2023-11-09 06:58:47'),
(5, 'category.store', 'web', '2023-11-09 07:01:48', '2023-11-09 07:01:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(60, 'App\\Models\\User', 7, 'AppName', '46227ddf6fe1068076831b36676fe8c2fbe25d3eb7d9384d250a37c7a4a7f4fc', '[\"*\"]', NULL, '2023-11-24 06:30:09', '2023-11-24 06:30:09'),
(59, 'App\\Models\\User', 7, 'AppName', '546b1ae81c2b878571dcefaecf39d046fcb6d2d70fadfeb423f29e5b2dbf12d7', '[\"*\"]', NULL, '2023-11-24 06:29:34', '2023-11-24 06:29:34'),
(58, 'App\\Models\\User', 7, 'AppName', 'a3b5382d2d687b6211d760c1b03026e52f066c59b9c2c7ab0ee61dd0487bf400', '[\"*\"]', NULL, '2023-11-24 06:26:19', '2023-11-24 06:26:19'),
(57, 'App\\Models\\User', 7, 'AppName', '9a1deabe2739433d93ac0da2f2af5e4a000d2e267c2cb559579aeed268ad27ca', '[\"*\"]', NULL, '2023-11-24 06:09:26', '2023-11-24 06:09:26'),
(56, 'App\\Models\\User', 7, 'AppName', 'c42e86bbb1494b7af369845160f02b33d9cedb69dc7909e3dfe952ab219b79d9', '[\"*\"]', NULL, '2023-11-24 06:05:48', '2023-11-24 06:05:48'),
(55, 'App\\Models\\User', 9, 'AppName', 'fd1be7ed73d0d606033aaa3df0b2823e72673a25e8bbdf38a46d55faa643c0bb', '[\"*\"]', NULL, '2023-11-23 06:20:08', '2023-11-23 06:20:08'),
(54, 'App\\Models\\User', 8, 'AppName', 'd9747427aa412ad3dfd2931fc606bdb64396eb8e6b752c7872a28ba7e2ad3125', '[\"*\"]', NULL, '2023-11-23 06:15:18', '2023-11-23 06:15:18'),
(53, 'App\\Models\\User', 7, 'AppName', '402ac8955742506ee3a72f3faca5f7bf90c38235671a5f4974d2f7103ff3aebb', '[\"*\"]', NULL, '2023-11-23 06:14:25', '2023-11-23 06:14:25'),
(52, 'App\\Models\\User', 7, 'AppName', 'df50d9b1e5fea8234fa2f56e111670df9ddac4ea262ad194ab0ca306edc2fc9c', '[\"*\"]', NULL, '2023-11-22 07:45:10', '2023-11-22 07:45:10'),
(47, 'App\\Models\\User', 2, 'Api token ofuser', 'dd64987b28e3a4dc59f28f1b96aa75a74c4e337b1299e08bf603a08334253ffb', '[\"*\"]', NULL, '2023-11-22 06:28:38', '2023-11-22 06:28:38'),
(48, 'App\\Models\\User', 2, 'Api token ofuser', '1f8c18b57fff7341ac01a581a03ac1ad5cd47161ca72895bca343ce930cdb867', '[\"*\"]', NULL, '2023-11-22 06:46:23', '2023-11-22 06:46:23'),
(44, 'App\\Models\\User', 5, 'Api token ofuser4', '2b146a7332c3a7576cbb785bd7268a1c04d23d60b8f1b168e4a23062d1808800', '[\"*\"]', NULL, '2023-11-12 07:38:46', '2023-11-12 07:38:46'),
(45, 'App\\Models\\User', 6, 'Api token ofuser6', '5d4eeb3ff201f94a67e6da9f08b95889b578cf21419afdcc5582ec262d2d261d', '[\"*\"]', NULL, '2023-11-12 07:50:40', '2023-11-12 07:50:40'),
(42, 'App\\Models\\User', 2, 'Api token ofuser', '0185491da7c788d01727cfeb74028ab26dd8d30bd26ffe110ce903f8cd3e7269', '[\"*\"]', NULL, '2023-11-12 07:24:30', '2023-11-12 07:24:30'),
(41, 'App\\Models\\User', 2, 'Api token ofuser', '97cca5f9b1bfddf82437d884fc25e89a106e8864e8fbb3ad2d0f01f4f1d40d41', '[\"*\"]', NULL, '2023-11-12 07:22:49', '2023-11-12 07:22:49'),
(40, 'App\\Models\\User', 2, 'Api token ofuser', 'e09af2a6cb8f9cd0757712ad376f946cb48083e0bf46158aec662f23445f9c67', '[\"*\"]', NULL, '2023-11-12 07:21:16', '2023-11-12 07:21:16'),
(39, 'App\\Models\\User', 2, 'Api token ofuser', '6326954fadc174f0ec94bfc4d0e78838fecbe15a152ec624d85956198cce2428', '[\"*\"]', NULL, '2023-11-12 07:18:27', '2023-11-12 07:18:27'),
(38, 'App\\Models\\User', 2, 'Api token ofuser', '9ee9a95af93c8ebac3d358f12ead571b09fb20b76f561cae2d74981e9d206694', '[\"*\"]', NULL, '2023-11-12 07:02:54', '2023-11-12 07:02:54'),
(37, 'App\\Models\\User', 2, 'Api token ofuser', '0ea411709b286181eacadb8836e19a063a8049136f1506500fff5444854bd82e', '[\"*\"]', NULL, '2023-11-12 07:01:46', '2023-11-12 07:01:46'),
(36, 'App\\Models\\User', 2, 'Api token ofuser', '35a84244ec016ee0dffa3b0710fad68fda5897d2c9b753bb25f52ea99e5e96ef', '[\"*\"]', NULL, '2023-11-12 07:00:13', '2023-11-12 07:00:13'),
(35, 'App\\Models\\User', 2, 'Api token ofuser', '5ba1ba9220488ad827c84e0f54ae9d503edcbc17f9a7dd1561d3fd23a7261ec3', '[\"*\"]', NULL, '2023-11-12 06:59:01', '2023-11-12 06:59:01'),
(34, 'App\\Models\\User', 2, 'Api token ofuser', '87e21700854e8786a16784126eb9cffbc3987c90e5d3b882db597936bb5ea0b5', '[\"*\"]', NULL, '2023-11-12 06:58:15', '2023-11-12 06:58:15'),
(32, 'App\\Models\\User', 2, 'Api token ofuser', '4e35aa40970ed4d47602d606cefdb38fbdd781f4001507224f57ef306be00357', '[\"*\"]', NULL, '2023-11-12 06:54:50', '2023-11-12 06:54:50'),
(33, 'App\\Models\\User', 2, 'Api token ofuser', 'd7e2d0c69ca2b0e7ca11da8fa280a7286b5669f1dae2c7485756ecd21645e2dc', '[\"*\"]', NULL, '2023-11-12 06:56:14', '2023-11-12 06:56:14'),
(61, 'App\\Models\\User', 7, 'AppName', '72e73b90f0edf89de250c0730fa0bfbb7090dcb3da7b36072c9f1f994378d8d5', '[\"*\"]', NULL, '2023-11-24 06:30:43', '2023-11-24 06:30:43'),
(62, 'App\\Models\\User', 7, 'AppName', '419ed9ca874b05b9b5a64f3b6362caa97e6ea1d2e8936ee8545efebe38fe06eb', '[\"*\"]', NULL, '2023-11-24 06:31:58', '2023-11-24 06:31:58'),
(63, 'App\\Models\\User', 7, 'AppName', '641ef04f5c7c1c144966f83d6e92bdbe612adda26091a634ddb8c4dda40dc82a', '[\"*\"]', NULL, '2023-11-24 06:32:23', '2023-11-24 06:32:23'),
(64, 'App\\Models\\User', 2, 'Api token ofuser', 'a28eb6add31ab0dbec179d075e9d34f7f4f66e6f37eb5208f41acdb0b170acee', '[\"*\"]', NULL, '2023-11-24 06:33:13', '2023-11-24 06:33:13'),
(74, 'App\\Models\\User', 2, 'Api token ofuser', 'e1170531b5a45591ca9b228c0d94de7bf3b0f6da84681ffaf51ad558ae7d936e', '[\"*\"]', NULL, '2023-11-24 06:58:15', '2023-11-24 06:58:15'),
(68, 'App\\Models\\User', 7, 'AppName', '77ec9bbb0b4a05da3aeb39a169622fff6d1cec906d2d7ffa5c5a0f8b5b03922b', '[\"*\"]', NULL, '2023-11-24 06:52:45', '2023-11-24 06:52:45'),
(75, 'App\\Models\\User', 2, 'Api token ofuser', '2d259f660149e9e73a0a31c6186032013925618610ed86185f7c280149f56ad0', '[\"*\"]', NULL, '2023-11-24 06:58:16', '2023-11-24 06:58:16'),
(76, 'App\\Models\\User', 2, 'Api token ofuser', '2b88c8c9a23a6d8498cb836032c290673c5112706aee50e9dfee8bf82a1c5495', '[\"*\"]', NULL, '2023-11-24 06:58:16', '2023-11-24 06:58:16'),
(77, 'App\\Models\\User', 2, 'Api token ofuser', '538096535e92610aab8f3b38b25293cf416c1bb1084661fff43c076167c9ef3d', '[\"*\"]', NULL, '2023-11-24 06:58:17', '2023-11-24 06:58:17'),
(78, 'App\\Models\\User', 2, 'Api token ofuser', 'bde6d8bebc9ac1b6d0348c132d62641ac91b10ea11f50d7666f55df821cdcf55', '[\"*\"]', NULL, '2023-11-24 06:58:17', '2023-11-24 06:58:17'),
(80, 'App\\Models\\User', 2, 'Api token ofuser', '7a49ddd0eb4737ecaf9928071701cdcc0098d1176e5680efebbcfc7c6e50a7ef', '[\"*\"]', NULL, '2023-11-25 02:15:42', '2023-11-25 02:15:42'),
(81, 'App\\Models\\User', 2, 'Api token ofuser', 'a3ee817b0b77944f686ddb25c37300f0fddc40f574375d381138059045d9b043', '[\"*\"]', NULL, '2023-11-25 02:33:08', '2023-11-25 02:33:08'),
(87, 'App\\Models\\User', 7, 'AppName', '0c1fbf37bf32796a24013e0ff8ab88e668e332f0e020b9981ba918c13301aecd', '[\"*\"]', NULL, '2023-11-27 07:22:48', '2023-11-27 07:22:48'),
(83, 'App\\Models\\User', 7, 'AppName', 'ee46b4b9eaa6d04b9fef03ad4487229ccdbbac480cd59effb5a5656c922169da', '[\"*\"]', NULL, '2023-11-26 11:38:32', '2023-11-26 11:38:32'),
(84, 'App\\Models\\User', 7, 'AppName', '2d5336e6059b1a50812bf8c6648159938c450fae2dc6678b2e99cac46aab8194', '[\"*\"]', NULL, '2023-11-26 19:11:58', '2023-11-26 19:11:58'),
(85, 'App\\Models\\User', 7, 'AppName', '7b123e5feee23c92f443480e9162531e1e2805a01aad78bd916f00b75b708e19', '[\"*\"]', NULL, '2023-11-27 07:21:10', '2023-11-27 07:21:10'),
(86, 'App\\Models\\User', 7, 'Token', '203778d2db085c6997c218c7c9a4a4e5ff72055b91831e5266b66b5dff87ebb7', '[\"*\"]', NULL, '2023-11-27 07:21:10', '2023-11-27 07:21:10'),
(88, 'App\\Models\\User', 7, 'Token', '4209ee1a06947a36c6d8c50e88276ff673fb013932355b04eec05ebd9710f373', '[\"*\"]', NULL, '2023-11-27 07:22:48', '2023-11-27 07:22:48'),
(89, 'App\\Models\\User', 7, 'AppName', '94c8ae09ba36babc960e4164da4b8ba989c1a27d2648aa45dd6b86b6f20d2df4', '[\"*\"]', NULL, '2023-11-27 07:24:12', '2023-11-27 07:24:12'),
(90, 'App\\Models\\User', 7, 'Token', 'bbf4badf6aae60e5116be6dd1d705e4f5afa38fa04a6733752aa38e45e88f3e7', '[\"*\"]', NULL, '2023-11-27 07:24:12', '2023-11-27 07:24:12'),
(91, 'App\\Models\\User', 7, 'AppName', 'd1dddf143a23ad988c0f75f37c3f40490eca80489334369733262cf61c7ebc7b', '[\"*\"]', NULL, '2023-11-27 07:25:58', '2023-11-27 07:25:58'),
(92, 'App\\Models\\User', 7, 'Token', '0c84b3b7ece1596897e2de1b92f642c0813729b853db47001afbc5a0f348dfb2', '[\"*\"]', NULL, '2023-11-27 07:25:59', '2023-11-27 07:25:59'),
(93, 'App\\Models\\User', 7, 'AppName', '619f58fb790f9bd0924ee275a8d9f91d242f5d271f3d26b25539937413f82297', '[\"*\"]', NULL, '2023-11-27 07:26:35', '2023-11-27 07:26:35'),
(94, 'App\\Models\\User', 7, 'Token', '5f5f6238958afd75cda74cca4fc63fcc7b1c2de75b753731b2f380db23612c6a', '[\"*\"]', NULL, '2023-11-27 07:26:35', '2023-11-27 07:26:35'),
(95, 'App\\Models\\User', 7, 'AppName', '3f6c79e688063eaafe1a1fb6452b50b859a34eea99fbc248599f7dc0226b6b3a', '[\"*\"]', NULL, '2023-11-27 07:31:45', '2023-11-27 07:31:45'),
(97, 'App\\Models\\User', 7, 'AppName', '4b8d2c5a3afe7f928c7f35075941969567c448e029d5b15ea5aeff16bd914516', '[\"*\"]', NULL, '2023-11-27 07:33:17', '2023-11-27 07:33:17'),
(98, 'App\\Models\\User', 7, 'Token', '13549b1bc7a112095e1bbc37dabdb1e9e0caae1b158b8923a75d0471dc779999', '[\"*\"]', NULL, '2023-11-27 07:33:17', '2023-11-27 07:33:17'),
(99, 'App\\Models\\User', 7, 'AppName', '1015e6f6e83b27986080b95a8f52cb3ebe00c7c7aa9c9950b6abac19c37cc7ff', '[\"*\"]', NULL, '2023-11-27 07:59:39', '2023-11-27 07:59:39'),
(100, 'App\\Models\\User', 7, 'Token', 'e4b216570d0186242c528c232797c548cd31f7782dd20c1c2047b0dd6be8f6bf', '[\"*\"]', NULL, '2023-11-27 07:59:39', '2023-11-27 07:59:39'),
(101, 'App\\Models\\User', 7, 'AppName', 'cbbb0f3bfa6a9e48999211b02e341f9a21d62ae43c7de51899ae204ea7ba7c17', '[\"*\"]', NULL, '2023-11-27 08:06:44', '2023-11-27 08:06:44'),
(103, 'App\\Models\\User', 7, 'AppName', '2087824d450ffbdcc3d2d99a86379242aee9209e99f2caf295185b856f1a2bfd', '[\"*\"]', NULL, '2023-11-27 08:14:47', '2023-11-27 08:14:47'),
(105, 'App\\Models\\User', 7, 'AppName', '8805271675cd0f720a0bec57c0d79652d513d505c0ea329d709e4e2c59d15c8d', '[\"*\"]', NULL, '2023-11-27 08:16:02', '2023-11-27 08:16:02'),
(106, 'App\\Models\\User', 7, 'Token', '60174faee1de6cd33008333f0a4e2d106779f6d6c9fe7088214b6e074bfa9cb4', '[\"*\"]', NULL, '2023-11-27 08:16:02', '2023-11-27 08:16:02'),
(107, 'App\\Models\\User', 7, 'AppName', '19e2d54e6cb545a35c784e644f7c69e28bc88e838bf4f07b89ef61c59d3f4109', '[\"*\"]', NULL, '2023-11-27 08:22:48', '2023-11-27 08:22:48'),
(108, 'App\\Models\\User', 7, 'Token', '0dc67d14697718c7d68652919352eb53bf75051bcaf225a745eb4f33b304f8f8', '[\"*\"]', NULL, '2023-11-27 08:22:48', '2023-11-27 08:22:48'),
(109, 'App\\Models\\User', 7, 'AppName', '6657759bb07e91ebb88f9a3f41570dc131300bfa161aa70a6cc0695dc82df8e2', '[\"*\"]', NULL, '2023-11-27 08:28:07', '2023-11-27 08:28:07'),
(110, 'App\\Models\\User', 7, 'Token', '42bba9c5bd3fdf1beb502a6402ea5f67f73103fe8735fe4109e6613afb1acba8', '[\"*\"]', NULL, '2023-11-27 08:28:07', '2023-11-27 08:28:07'),
(112, 'App\\Models\\User', 2, 'Api token ofuser', '0eb9f224b4c3fa49e8bbb0cb1f98376a433d9e745f168e66bb68eb997d5230fa', '[\"*\"]', NULL, '2023-11-27 08:42:25', '2023-11-27 08:42:25'),
(113, 'App\\Models\\User', 3, 'Api token ofuser2', '0840032f2628f7231e5df274536ac229b24dac0b97ed9a324f58bf102cfe6607', '[\"*\"]', NULL, '2023-11-28 00:19:19', '2023-11-28 00:19:19'),
(114, 'App\\Models\\User', 3, 'Api token ofuser2', '12a0bb81918a3050ef7267e05758bde1f4f7f522715660638ab4d2556fe79bfe', '[\"*\"]', NULL, '2023-11-28 01:43:42', '2023-11-28 01:43:42'),
(115, 'App\\Models\\User', 3, 'Api token ofuser2', 'c87f34100737e5b4b6d6ffa7f65ded11d194ae941265fc0b2755416166e993bc', '[\"*\"]', NULL, '2023-11-28 01:44:39', '2023-11-28 01:44:39'),
(116, 'App\\Models\\User', 3, 'Api token ofuser2', 'da4cfb06b8c8b2979108b0cc38d28b8f1606cb3d4eea5ed0e571b400f9aa7971', '[\"*\"]', NULL, '2023-11-28 01:53:32', '2023-11-28 01:53:32'),
(117, 'App\\Models\\User', 3, 'Api token ofuser2', 'b4cbb875408e169a73b6c65a32e47c709830666e7a82fba0bd8242367a963022', '[\"*\"]', NULL, '2023-11-28 01:55:17', '2023-11-28 01:55:17'),
(119, 'App\\Models\\User', 3, 'Api token ofuser2', '661848b3f8b7c36bf21af2a61b453199e0300cee74a2d728cb7f9e40188aba15', '[\"*\"]', NULL, '2023-11-28 02:11:44', '2023-11-28 02:11:44'),
(120, 'App\\Models\\User', 3, 'Api token ofuser2', '4bc0a090f07795e36d2363708ece35df23a1503a0baee71ec307b3bf9c351af7', '[\"*\"]', NULL, '2023-11-28 06:39:21', '2023-11-28 06:39:21'),
(121, 'App\\Models\\User', 3, 'Api token ofuser2', 'bf3500637df7f66803b9f61e2c8631abc54c664df994a6d684358640312e99c8', '[\"*\"]', NULL, '2023-11-28 07:23:17', '2023-11-28 07:23:17'),
(122, 'App\\Models\\User', 3, 'Api token ofuser2', '418e892a1a1cddd6a87685ac31359cfecd7969d9d41f6b45ba22d95e67436720', '[\"*\"]', NULL, '2023-11-28 07:25:06', '2023-11-28 07:25:06'),
(123, 'App\\Models\\User', 3, 'Api token ofuser2', 'ffe06fe843beb883c5dddaaee35d50dd26057fab4a9ceed40428b44290247a2e', '[\"*\"]', NULL, '2023-11-28 07:27:18', '2023-11-28 07:27:18'),
(124, 'App\\Models\\User', 3, 'Api token ofuser2', '054cebe96d5e8b5565b54dba5aea8f83b505032cb8d6826486f112c92adcc476', '[\"*\"]', NULL, '2023-11-28 07:29:54', '2023-11-28 07:29:54'),
(126, 'App\\Models\\User', 3, 'Api token ofuser2', 'aa48759e467031332531cc70c703b9c8744be4565319ae151dd7b6e06f74a824', '[\"*\"]', NULL, '2023-11-28 07:32:58', '2023-11-28 07:32:58'),
(127, 'App\\Models\\User', 3, 'Api token ofuser2', '4ab3b3ae33dce226ea8f5e38e8470b9ccd716c4eab43793a3c47576f377f7c9d', '[\"*\"]', NULL, '2023-11-28 08:07:47', '2023-11-28 08:07:47'),
(128, 'App\\Models\\User', 3, 'Api token ofuser2', '26d366e83356f9d0e44673b01c0c6457fca73d89cb51f3a1e9f938f4f17428e2', '[\"*\"]', NULL, '2023-11-29 00:17:33', '2023-11-29 00:17:33'),
(129, 'App\\Models\\User', 3, 'Api token ofuser2', '4564ac655bfbe4ba7fc5974f1fd649bce7c413b3cc69b66dae9bfa5a141f475a', '[\"*\"]', NULL, '2023-11-29 01:33:20', '2023-11-29 01:33:20'),
(130, 'App\\Models\\User', 3, 'Api token ofuser2', '0cc59359b8240fe33c288acaf0d4fac6270b28151c039b4049e2849de8b10623', '[\"*\"]', NULL, '2023-11-29 01:37:57', '2023-11-29 01:37:57'),
(131, 'App\\Models\\User', 3, 'Api token ofuser2', '40cc110826f47f0b749aa6d5d67b4f8a538240f8917f92d10c4a81d64ddfe8de', '[\"*\"]', NULL, '2023-11-29 01:39:22', '2023-11-29 01:39:22'),
(132, 'App\\Models\\User', 3, 'Api token ofuser2', '2b8222bab7acf689a5af37fe6a9a82c5dd0faff8421b5a053e4d17cecbf72311', '[\"*\"]', NULL, '2023-11-29 01:40:33', '2023-11-29 01:40:33'),
(133, 'App\\Models\\User', 3, 'Api token ofuser2', 'ceb6a7d6d3e76ef93f42f4abaf37ed640751fbf47d31a7a707cdde2e18cd08ce', '[\"*\"]', NULL, '2023-11-29 01:42:26', '2023-11-29 01:42:26'),
(134, 'App\\Models\\User', 3, 'Api token ofuser2', 'cf1bff2de2f4c9e03feee1dbb5c82ff0473af2398318eddd56375e933893db50', '[\"*\"]', NULL, '2023-11-29 01:43:29', '2023-11-29 01:43:29'),
(135, 'App\\Models\\User', 3, 'Api token ofuser2', '3d3e4004fccefe9d9cdd6443f09eea34fd4853bf807e0c703211b0db95499524', '[\"*\"]', NULL, '2023-11-29 01:45:54', '2023-11-29 01:45:54'),
(136, 'App\\Models\\User', 3, 'Api token ofuser2', 'af3135c04687741d7937c47628c295a649edf5a776435c324d059d3f3d4aa169', '[\"*\"]', NULL, '2023-11-29 01:46:41', '2023-11-29 01:46:41'),
(138, 'App\\Models\\User', 3, 'Api token ofuser2', '3c311ea8da327032ff829bd0c189932a0e8dc3e89244f07109574a308f2c32fd', '[\"*\"]', NULL, '2023-11-29 01:48:27', '2023-11-29 01:48:27'),
(139, 'App\\Models\\User', 3, 'Api token ofuser2', 'dbd5b0f625f1121915ff531fd0ae7bbb0abfa4ed92b2f0db92cb603344fbbac2', '[\"*\"]', NULL, '2023-11-29 01:49:15', '2023-11-29 01:49:15'),
(140, 'App\\Models\\User', 3, 'Api token ofuser2', 'd6f3eed622914808d6e300aa1dfb614ff6b95f2a78c53070ea11d611d9c5ae99', '[\"*\"]', NULL, '2023-11-29 01:51:37', '2023-11-29 01:51:37'),
(141, 'App\\Models\\User', 3, 'Api token ofuser2', '6c5f4f06ad4637a8a60175b2aa74360266712c2b6acc87b601386633910a0174', '[\"*\"]', NULL, '2023-11-29 01:53:52', '2023-11-29 01:53:52'),
(142, 'App\\Models\\User', 3, 'Api token ofuser2', '72dfdbb742d95d654f4a826a0762acbe0a1c0a941e7b1473f38ec3c45eb7c00f', '[\"*\"]', NULL, '2023-11-29 01:55:48', '2023-11-29 01:55:48'),
(143, 'App\\Models\\User', 3, 'Api token ofuser2', '33cc9c0a3fbffda9f01153cf460dadd58ddc76b16963e7a275b176f5042aaf9c', '[\"*\"]', NULL, '2023-11-29 01:57:21', '2023-11-29 01:57:21'),
(144, 'App\\Models\\User', 3, 'Api token ofuser2', '7d7e08a8761fe339e4c24fa119e05f56fa684e7695f837052d430bfc71c9efa6', '[\"*\"]', NULL, '2023-11-29 01:59:03', '2023-11-29 01:59:03'),
(145, 'App\\Models\\User', 3, 'Api token ofuser2', '3f3a4b2f648503393f5ce9318e4cc007ebd72137ece00e07d6254c81578f7dba', '[\"*\"]', NULL, '2023-11-29 02:09:03', '2023-11-29 02:09:03'),
(146, 'App\\Models\\User', 3, 'Api token ofuser2', 'b3cde5fc1550867fcfcab3d0825adfadbd9863f290893e6b60f6471f0ad87c16', '[\"*\"]', NULL, '2023-11-29 02:10:01', '2023-11-29 02:10:01'),
(148, 'App\\Models\\User', 3, 'Api token ofuser2', 'f56b7bf8d58b2aa9b22d11804d1661d67900a8daa37ae35d74bf9c5955d2ca2f', '[\"*\"]', NULL, '2023-11-29 02:13:07', '2023-11-29 02:13:07'),
(149, 'App\\Models\\User', 3, 'Api token ofuser2', '79caca4cd45f830d1e2eae0df816bc333a2becee93a19a43fb16653d791149ff', '[\"*\"]', NULL, '2023-11-29 02:18:52', '2023-11-29 02:18:52'),
(150, 'App\\Models\\User', 3, 'Api token ofuser2', '46c9f073c7834af1d28fcfc6eef6d10be75da13fa82f4e056e4980cb69a9e703', '[\"*\"]', NULL, '2023-11-29 02:50:36', '2023-11-29 02:50:36'),
(153, 'App\\Models\\User', 7, 'AppName', 'aa56b5ddf4a315e95b51f19a898c051a27126ff847489a3175aa75c3e93415ae', '[\"*\"]', NULL, '2023-11-29 03:07:52', '2023-11-29 03:07:52'),
(155, 'App\\Models\\User', 7, 'AppName', 'e731353b004f03f52b753fdfa13e1d8bebb57eeadaa6741fdc0ef344c89a7bbe', '[\"*\"]', NULL, '2023-11-29 03:10:18', '2023-11-29 03:10:18'),
(156, 'App\\Models\\User', 7, 'AppName', '3e5a74a2910dc0a017ce2a2d7c4a2f65c0bbeec65f1cab55e08d68e71021a1c9', '[\"*\"]', NULL, '2023-11-29 03:11:51', '2023-11-29 03:11:51'),
(157, 'App\\Models\\User', 7, 'AppName', '884e5bab5703df12ea46f1b52e6ca61f4e23117afe3facf1063395331e424c72', '[\"*\"]', NULL, '2023-11-29 03:14:10', '2023-11-29 03:14:10'),
(158, 'App\\Models\\User', 7, 'Api token ofChí Tôn Đoàn', 'a54f16ef5febe3c19714c96421d487a57c9bf30a503d6a1fb8a51b92d235a74b', '[\"*\"]', NULL, '2023-11-29 03:14:10', '2023-11-29 03:14:10'),
(159, 'App\\Models\\User', 7, 'AppName', 'd7904fc5b8295bab0f125511fc70de60d4ac8ab631807f5819e46a3d53305ddf', '[\"*\"]', NULL, '2023-11-29 03:14:52', '2023-11-29 03:14:52'),
(160, 'App\\Models\\User', 7, 'Api token ofChí Tôn Đoàn', 'bcffc78e6670874fe5b138681aa2c69e2fdcf70f3b2481382738445805d949a9', '[\"*\"]', NULL, '2023-11-29 03:14:52', '2023-11-29 03:14:52'),
(161, 'App\\Models\\User', 7, 'AppName', '9c0121ec5d7b70d376ed41acd785e7bf79d954392dabaeeccec916b789e3a999', '[\"*\"]', NULL, '2023-11-29 03:15:52', '2023-11-29 03:15:52'),
(162, 'App\\Models\\User', 7, 'Api token ofChí Tôn Đoàn', 'b4116ea85ced10d60e77627dea502ccb79eb1485c536bd795282759b19241047', '[\"*\"]', NULL, '2023-11-29 03:15:52', '2023-11-29 03:15:52'),
(163, 'App\\Models\\User', 7, 'AppName', '726e7e33dd36b319ffe4b94bbfa5253b628e1f50ecd7de909b65968c83a8956a', '[\"*\"]', NULL, '2023-11-29 03:17:24', '2023-11-29 03:17:24'),
(166, 'App\\Models\\User', 3, 'Api token ofuser2', '7ca6176ce387604cbc0552b4caeec5124a3968cc7e7bc2c9d4e07f86a9170e85', '[\"*\"]', '2023-11-30 07:17:08', '2023-11-29 06:25:38', '2023-11-30 07:17:08'),
(184, 'App\\Models\\User', 1, 'Api token ofadmin', '8113363c8058cd5fbe39b54215ac202471f0d0b9140cc70fe8873efbb6d2596c', '[\"*\"]', NULL, '2023-12-12 07:44:45', '2023-12-12 07:44:45'),
(175, 'App\\Models\\User', 1, 'Token', '443e91ffdd18a8dde84eaf3d51046da6a9e7895e5a6b13b784bc2f382f7c0510', '[\"*\"]', NULL, '2023-12-12 07:43:31', '2023-12-12 07:43:31'),
(176, 'App\\Models\\User', 2, 'Token', 'f6df5d03e92b6e88d45ba4cdeb34267098449fc92bdcbb8c51d9f266bb655893', '[\"*\"]', NULL, '2023-12-12 07:43:31', '2023-12-12 07:43:31'),
(177, 'App\\Models\\User', 3, 'Token', '6bd698357d30f143ae3a8e3e592dc917014294e2c60ffb1d83f40417b5c5064c', '[\"*\"]', NULL, '2023-12-12 07:43:31', '2023-12-12 07:43:31'),
(178, 'App\\Models\\User', 4, 'Token', '4ad8ca64bc936b4c33aa7f652f6485bf9faddda62eabfedb483f351d6e7fc075', '[\"*\"]', NULL, '2023-12-12 07:43:31', '2023-12-12 07:43:31'),
(179, 'App\\Models\\User', 5, 'Token', '0e0739e3aff76683525b368c5a28b147c946a6fb34f87678e853ca3885a8e71c', '[\"*\"]', NULL, '2023-12-12 07:43:32', '2023-12-12 07:43:32'),
(180, 'App\\Models\\User', 6, 'Token', '5bb4bfd25654bfaf7ee491b8f1d7fdd80efeec9ee0196160817ce8ebf849bcb4', '[\"*\"]', NULL, '2023-12-12 07:43:32', '2023-12-12 07:43:32'),
(181, 'App\\Models\\User', 7, 'Token', 'e304756a3255270bd16993dda48abb272a896f42700eae5b7a07e7953fb828d4', '[\"*\"]', NULL, '2023-12-12 07:43:32', '2023-12-12 07:43:32'),
(182, 'App\\Models\\User', 8, 'Token', 'b4503bc674974a5c10e35e62dd07e3217b8a5c06948d8138921481e23e0f39bb', '[\"*\"]', NULL, '2023-12-12 07:43:32', '2023-12-12 07:43:32'),
(183, 'App\\Models\\User', 9, 'Token', '896aee88db92a3005b4c7d0757cade74164edae5e21b9942361e157191bcad79', '[\"*\"]', NULL, '2023-12-12 07:43:32', '2023-12-12 07:43:32'),
(186, 'App\\Models\\User', 10, 'AppName', '0f1cee23425a0e87b7c1a4abc196eb3eeb9a27f3f87049d1f0d512ce042e4e93', '[\"*\"]', NULL, '2023-12-12 08:28:59', '2023-12-12 08:28:59'),
(188, 'App\\Models\\User', 11, 'AppName', '9861ddaa039e6fcea96cd029c60e450ceb948c6b3d77059b700822d664fd5707', '[\"*\"]', NULL, '2023-12-12 08:31:38', '2023-12-12 08:31:38'),
(191, 'App\\Models\\User', 12, 'Token', 'ead1c048852b19f3a50d3a745691faf7b8aa19be10148c3e6cc0b76f4af30749', '[\"*\"]', NULL, '2023-12-13 01:24:33', '2023-12-13 01:24:33'),
(192, 'App\\Models\\User', 12, 'Token', '496d4fe14601e5d683852ecb234243882dc80a036cea321770dfbe3279501c19', '[\"*\"]', NULL, '2023-12-13 01:24:41', '2023-12-13 01:24:41'),
(193, 'App\\Models\\User', 12, 'Token', 'ca1b5196b0056bd4516ce70416a819a699e1770713da78e65faca04d187c87d5', '[\"*\"]', NULL, '2023-12-13 01:24:42', '2023-12-13 01:24:42'),
(194, 'App\\Models\\User', 12, 'Token', 'c73923364db418f306d1d03ad5504f060111b3587a9490e74961b1464a87aa3e', '[\"*\"]', NULL, '2023-12-13 01:25:08', '2023-12-13 01:25:08'),
(195, 'App\\Models\\User', 12, 'Token', '160faa9517bca245fabe922ab3a9ac01bee3306887af8f52b7e7bd505cbea7c2', '[\"*\"]', NULL, '2023-12-13 01:26:18', '2023-12-13 01:26:18'),
(196, 'App\\Models\\User', 12, 'Token', 'f92f320bdab842199cb87f52cfd7ad4d68dd2048fcf8fe6f3a2d24283e8a10d0', '[\"*\"]', NULL, '2023-12-13 01:28:31', '2023-12-13 01:28:31'),
(197, 'App\\Models\\User', 12, 'Token', '7652e973a93f9145fb3a0fec266feac13c56002fc802fc900f87de52edadaaf9', '[\"*\"]', NULL, '2023-12-13 01:28:36', '2023-12-13 01:28:36'),
(198, 'App\\Models\\User', 12, 'Token', '1ebbdc509e0c7d833aa1e3d42beaeff3045e12fc34d4573296325cbdc3b78e19', '[\"*\"]', NULL, '2023-12-13 01:28:42', '2023-12-13 01:28:42'),
(199, 'App\\Models\\User', 12, 'Token', 'b5d5ba9c2f907a869f4e1a71bac292e07489f8fd4349815543ace968013f1667', '[\"*\"]', NULL, '2023-12-13 01:28:42', '2023-12-13 01:28:42'),
(200, 'App\\Models\\User', 12, 'Token', '275210007796fc175ed21363a4a3564445818ac58174d901b7e87eb5953e4017', '[\"*\"]', NULL, '2023-12-13 01:29:28', '2023-12-13 01:29:28'),
(201, 'App\\Models\\User', 12, 'Token', 'af015f331c20c0ca5fb40845cf8c5d78f688e5e242361f8faece7569e2eebcd0', '[\"*\"]', NULL, '2023-12-13 01:29:34', '2023-12-13 01:29:34'),
(202, 'App\\Models\\User', 12, 'Token', '54460e96cc69bf309937423ba4f7d7ffe1f5a05df23b2cbf715b50f3fbbe22c1', '[\"*\"]', NULL, '2023-12-13 01:30:44', '2023-12-13 01:30:44'),
(203, 'App\\Models\\User', 12, 'Token', '1b96ad912f550cfb85bb18430fe86d2f15197babf3d3b6b2005d7e3cfa99abcf', '[\"*\"]', NULL, '2023-12-13 01:30:45', '2023-12-13 01:30:45'),
(204, 'App\\Models\\User', 12, 'Token', '3d0c0d184c7b142dc3861e7b519205dd81ba6c3d4c0e60faf53922adc65c48c8', '[\"*\"]', NULL, '2023-12-13 01:31:39', '2023-12-13 01:31:39'),
(205, 'App\\Models\\User', 12, 'Token', 'fb262b391291b34fc9552c102e73e8e2178c002b6f300fc4f4aad64764abedc5', '[\"*\"]', NULL, '2023-12-13 01:32:31', '2023-12-13 01:32:31'),
(206, 'App\\Models\\User', 12, 'Token', '14f2f572957925e49b22382686fb3df67312b1c12b2435321538dfc0521c9aa8', '[\"*\"]', NULL, '2023-12-13 01:32:31', '2023-12-13 01:32:31'),
(207, 'App\\Models\\User', 12, 'Token', '23ee01e3425f16199c940ecd06e68ec2e11b72c1e7d233d4e974721c9d68ea9f', '[\"*\"]', NULL, '2023-12-13 01:32:50', '2023-12-13 01:32:50'),
(208, 'App\\Models\\User', 12, 'Token', '455724077c330b419a83ec118ef1ce4745d784c01cce93c64987d57cb3810aba', '[\"*\"]', NULL, '2023-12-13 01:32:50', '2023-12-13 01:32:50'),
(209, 'App\\Models\\User', 12, 'Token', 'e81a73c4438fdf33fb8130ffd04c9172d2eb8a0340fbbb2b1adbb1afb707bcdd', '[\"*\"]', NULL, '2023-12-13 01:33:35', '2023-12-13 01:33:35'),
(210, 'App\\Models\\User', 12, 'Token', '064ea6e2d722a35525b52d8ffdc7a5772ce69c2999a89be1053bd3d0b428edf9', '[\"*\"]', NULL, '2023-12-13 01:33:41', '2023-12-13 01:33:41'),
(211, 'App\\Models\\User', 12, 'Token', 'b92a5187b16ff8f20f17725edd658670622a5f5e6ce5095a9a4ac2b62d807d03', '[\"*\"]', NULL, '2023-12-13 03:07:41', '2023-12-13 03:07:41'),
(212, 'App\\Models\\User', 12, 'Token', '39fdac281286f7b94b6e2122dee417cd424b118b53c2e47fcdbfdcc9c1fc21d8', '[\"*\"]', NULL, '2023-12-13 03:07:42', '2023-12-13 03:07:42'),
(213, 'App\\Models\\User', 12, 'Token', '278d625b32ce00d514486e0793b817be2a20911df4311d71be4774b65ede417d', '[\"*\"]', NULL, '2023-12-13 03:09:39', '2023-12-13 03:09:39'),
(214, 'App\\Models\\User', 12, 'Token', '917c79b49054460e517e58bcee80e90623a1daf5840e7d8652b2f7384368a563', '[\"*\"]', NULL, '2023-12-13 03:09:39', '2023-12-13 03:09:39'),
(215, 'App\\Models\\User', 12, 'Token', '7fc3aaa0908a6a3aa7e4bf909a36d27003690ff8a495e773f4107a6983a1da16', '[\"*\"]', NULL, '2023-12-13 03:10:10', '2023-12-13 03:10:10'),
(216, 'App\\Models\\User', 12, 'Token', '8fbca78d44b35dded3af2d9d3273231d3371700eec69991f33a09472a37f9e87', '[\"*\"]', NULL, '2023-12-13 03:10:14', '2023-12-13 03:10:14'),
(217, 'App\\Models\\User', 12, 'Token', '5d310f761c1e1290830156d2fc090524b0d319b0b5692d013b951a042fb14568', '[\"*\"]', NULL, '2023-12-13 03:10:14', '2023-12-13 03:10:14'),
(218, 'App\\Models\\User', 12, 'Token', '9865fb35bd7b1eb9586f3662c21eeae641f988c61ce5672fd75395696ecff773', '[\"*\"]', NULL, '2023-12-13 03:10:22', '2023-12-13 03:10:22'),
(219, 'App\\Models\\User', 12, 'Token', 'ad7bc52defea737ac5aeef74d562324e185720b461c0201048525ddcc6baae43', '[\"*\"]', NULL, '2023-12-13 03:10:27', '2023-12-13 03:10:27'),
(220, 'App\\Models\\User', 12, 'Token', 'e768686cb44185e5040ffba94316a123c35e3c496ba4dc40df832ef3901a1c0d', '[\"*\"]', NULL, '2023-12-13 03:11:15', '2023-12-13 03:11:15'),
(221, 'App\\Models\\User', 12, 'Token', '82645f694cadc1dc1f6ba1bb90b3b2beb58d104ca77ac0a7231b7095fc3b7f35', '[\"*\"]', NULL, '2023-12-13 03:11:15', '2023-12-13 03:11:15'),
(222, 'App\\Models\\User', 12, 'Token', '27425f5563c2e1d00c3cde4cc4976613d5f04ad39081c4ffdaa3af8df4bc0a20', '[\"*\"]', NULL, '2023-12-13 03:12:37', '2023-12-13 03:12:37'),
(223, 'App\\Models\\User', 12, 'Token', 'a9f422bf3b5740f72c65447f4821a9713dacda890147d1df6251832939ab9809', '[\"*\"]', NULL, '2023-12-13 03:12:41', '2023-12-13 03:12:41'),
(224, 'App\\Models\\User', 12, 'Token', '9ea03c41f2c4c51f34e03362ccec837bf3482704762c0b15b45f973766b570ba', '[\"*\"]', NULL, '2023-12-13 03:12:42', '2023-12-13 03:12:42'),
(225, 'App\\Models\\User', 12, 'Token', '9a280ecc9198265ac362e2504bb8c46b4c0f6daf774dad221d049723618d850c', '[\"*\"]', NULL, '2023-12-13 03:14:34', '2023-12-13 03:14:34'),
(226, 'App\\Models\\User', 12, 'Token', 'a04348175a5e5ebc32f53779727535d8610cf5ed66f68e26d3c29d9fe1c0728a', '[\"*\"]', NULL, '2023-12-13 03:14:39', '2023-12-13 03:14:39'),
(227, 'App\\Models\\User', 12, 'Token', 'b00e2c1995759ce3f3dc375e732eda0fbb077d8100efc61fd382b9d17d1661fa', '[\"*\"]', NULL, '2023-12-13 03:14:39', '2023-12-13 03:14:39'),
(228, 'App\\Models\\User', 12, 'Token', '031f75fc6a841037ff1447bf1cf6af2c68ea55e8d158ac078bf22d200047d0f4', '[\"*\"]', NULL, '2023-12-13 03:16:16', '2023-12-13 03:16:16'),
(229, 'App\\Models\\User', 12, 'Token', '54147b7046c907c616968d822f5d9fe9f8d183ed9738d03d7606e0c922a1422d', '[\"*\"]', NULL, '2023-12-13 03:16:16', '2023-12-13 03:16:16'),
(230, 'App\\Models\\User', 12, 'Token', 'de359e774b059508795be2f622459e3868ad4febd2325c02e9862fbf26874bda', '[\"*\"]', NULL, '2023-12-13 03:17:44', '2023-12-13 03:17:44'),
(231, 'App\\Models\\User', 12, 'Token', 'b491ee1ca35b893aa0982970311a781832ee5f40f69a9c34892689ae04096e98', '[\"*\"]', NULL, '2023-12-13 03:17:44', '2023-12-13 03:17:44'),
(232, 'App\\Models\\User', 12, 'Token', '39b34e0be253cca3cb73b223763ef644d00192bd621aaadcb7d6392a6c19691e', '[\"*\"]', NULL, '2023-12-13 03:35:40', '2023-12-13 03:35:40'),
(233, 'App\\Models\\User', 12, 'Token', '13ee2418bd2c4941338ee9d141c3ae15a780ccd862fc7b7121290d06d7aeb83e', '[\"*\"]', NULL, '2023-12-13 03:35:48', '2023-12-13 03:35:48'),
(234, 'App\\Models\\User', 12, 'Token', 'f6ffc956ef5216ad461c74645cf975e8bd1b08381dda08f2007a9f7600143e14', '[\"*\"]', NULL, '2023-12-13 03:35:49', '2023-12-13 03:35:49'),
(235, 'App\\Models\\User', 12, 'Token', '92cf842b333da583935adb130e7a2c0f385e1360cf3de8aa4ddf07585b895227', '[\"*\"]', NULL, '2023-12-13 06:41:22', '2023-12-13 06:41:22'),
(236, 'App\\Models\\User', 12, 'Token', 'dd43d5308ea4dd7e113d02e876faf676110863c31ed6dadfc1d389604b7b5398', '[\"*\"]', NULL, '2023-12-13 06:41:22', '2023-12-13 06:41:22'),
(237, 'App\\Models\\User', 12, 'Token', '8945e4ae9dbc44dfc1d0a883aa163c996ab27e6a4c047695af026e3ca814acde', '[\"*\"]', NULL, '2023-12-13 06:41:35', '2023-12-13 06:41:35'),
(238, 'App\\Models\\User', 12, 'Token', '94ee213def8561c0ec0b8d4b9aeafc791742c7d70a6e08a2bba31ac11aa486dc', '[\"*\"]', NULL, '2023-12-13 06:41:36', '2023-12-13 06:41:36'),
(239, 'App\\Models\\User', 12, 'Token', 'a37f6a426012cb0ad5f9f3088944214aef7063e38937a696bd68fee0f143a637', '[\"*\"]', NULL, '2023-12-13 06:44:35', '2023-12-13 06:44:35'),
(240, 'App\\Models\\User', 12, 'Token', '4cd14a85f0e4e4482a828d38b23dfaaf86c1c9600ac22cd59f523bbf252debd0', '[\"*\"]', NULL, '2023-12-13 06:44:43', '2023-12-13 06:44:43'),
(241, 'App\\Models\\User', 12, 'Token', 'cc6725ea39cb3b1750b268e85cbd8a3bfa9ce94eb7bfc29f0b5ead737ef55832', '[\"*\"]', NULL, '2023-12-13 06:44:51', '2023-12-13 06:44:51'),
(242, 'App\\Models\\User', 1, 'Token', '408001f5e8bdabcf902cf36efb2815579ea5da1a9469b46137d622f00aabc333', '[\"*\"]', NULL, '2023-12-13 06:47:31', '2023-12-13 06:47:31'),
(243, 'App\\Models\\User', 12, 'Token', '6277c45b5f83a62a0ce6f8e8ee9fbd1dd8a9a85d8ebf71d20e55153dc70ab6a7', '[\"*\"]', NULL, '2023-12-13 06:47:42', '2023-12-13 06:47:42'),
(244, 'App\\Models\\User', 12, 'Token', '371eb0cfaf9aedd5a070722f81e6054e9d32412fd0c2e853727a8b3677595fb2', '[\"*\"]', NULL, '2023-12-13 06:48:13', '2023-12-13 06:48:13'),
(245, 'App\\Models\\User', 12, 'Token', 'abe85eb4bca29bab2e1c9c05b87a5cf75845b1be9ae8f2b9a97abf340ee06a23', '[\"*\"]', NULL, '2023-12-13 06:48:20', '2023-12-13 06:48:20'),
(246, 'App\\Models\\User', 12, 'Token', '3093e87d2e42213e918fcb2d900498ddfcd5af4738f70bc97318a3ab2bd20367', '[\"*\"]', NULL, '2023-12-13 06:48:20', '2023-12-13 06:48:20'),
(247, 'App\\Models\\User', 12, 'Token', 'e9dd6662313c6419eb9d1a6c46deef0f4ae3a56dd8a8f0338096566f0d051571', '[\"*\"]', NULL, '2023-12-13 06:48:24', '2023-12-13 06:48:24'),
(248, 'App\\Models\\User', 12, 'Token', '10c5424571573d5b1c2bc519adbd0e6d3dafaa27277cc01c3b8589ce2971f99e', '[\"*\"]', NULL, '2023-12-13 06:48:25', '2023-12-13 06:48:25'),
(249, 'App\\Models\\User', 12, 'Token', '3b240bdc6d3582a81676b6038746e81b3acb4378ea99f8b565236c9181672542', '[\"*\"]', NULL, '2023-12-13 20:06:39', '2023-12-13 20:06:39'),
(250, 'App\\Models\\User', 12, 'Token', '2bbe51b10fd7e93a402c094fe774398f5c809262576e8268211c718197fa4a11', '[\"*\"]', NULL, '2023-12-13 20:06:39', '2023-12-13 20:06:39'),
(251, 'App\\Models\\User', 12, 'Token', 'c32f995d4c77665ce31121a512ee90a15590cc8d1ef7324eeb843d0d12baf01f', '[\"*\"]', NULL, '2023-12-13 20:07:13', '2023-12-13 20:07:13'),
(252, 'App\\Models\\User', 12, 'Token', 'c921de8d208c3fe2d977f31a908c31da2eb553d5c3efcf96b1d32f089235d27b', '[\"*\"]', NULL, '2023-12-13 20:07:14', '2023-12-13 20:07:14'),
(253, 'App\\Models\\User', 12, 'Token', '22093bf2d3f678e026ad8f85ccdd2a5a01bc44171880fef621086a69c3b17185', '[\"*\"]', NULL, '2023-12-13 20:18:43', '2023-12-13 20:18:43'),
(254, 'App\\Models\\User', 12, 'Token', '1d45df491bf43ac49dd4f5d33dbbfd2ab41f20927cb279c010a4a767c81fd0d0', '[\"*\"]', NULL, '2023-12-13 20:18:43', '2023-12-13 20:18:43'),
(255, 'App\\Models\\User', 1, 'Token', 'dadd0e415eb5398fb32e89887e1a3fad71824780893cbe6ff4f550837952f5af', '[\"*\"]', NULL, '2023-12-13 20:19:00', '2023-12-13 20:19:00'),
(256, 'App\\Models\\User', 1, 'Token', '33b8f5bf75283b828cebb5cd9e5f798484b833b131461973d68aa88bf8cd60b0', '[\"*\"]', NULL, '2023-12-13 20:19:00', '2023-12-13 20:19:00'),
(257, 'App\\Models\\User', 1, 'Token', '60e62ab9339cfa1471dbd3c044203f97f7a90f46ff79f720d9f1a66497bd9d6c', '[\"*\"]', NULL, '2023-12-13 20:19:05', '2023-12-13 20:19:05'),
(258, 'App\\Models\\User', 1, 'Token', '61262e121ac861761b24f9d7223b6530a3403dd6b7755ece44600bcc96b4468d', '[\"*\"]', NULL, '2023-12-13 20:19:05', '2023-12-13 20:19:05'),
(259, 'App\\Models\\User', 12, 'Token', '60dcafb5e574d720c2fe1c60de89f6868ebf4e5ad6d11efff2024e2c63531494', '[\"*\"]', NULL, '2023-12-19 07:52:49', '2023-12-19 07:52:49'),
(260, 'App\\Models\\User', 12, 'Token', 'e7e2f59ed321612f6b65642fb215789557ff825ac6c014e208bfcb980755c69c', '[\"*\"]', NULL, '2023-12-19 07:52:50', '2023-12-19 07:52:50'),
(261, 'App\\Models\\User', 15, 'Token', '5df4919ebc39a70f09ec002106e041ba9e39c1fcf449de084493311db8be9888', '[\"*\"]', NULL, '2023-12-19 07:53:29', '2023-12-19 07:53:29'),
(262, 'App\\Models\\User', 15, 'Token', 'b1af45f4b15da5b90462fdea1e0eccac55513e9b10b866393993237dc3280a4c', '[\"*\"]', NULL, '2023-12-19 07:53:29', '2023-12-19 07:53:29'),
(263, 'App\\Models\\User', 15, 'Token', 'b69463789f97571f66d6cccbf33c454674cab3fd4b44857098dc4342d7018c0e', '[\"*\"]', NULL, '2023-12-19 07:53:33', '2023-12-19 07:53:33'),
(264, 'App\\Models\\User', 15, 'Token', '97baf1ec4aea55245920b825b868ec3beddb5e35a0ea1b99b8a6e236c9a71b16', '[\"*\"]', NULL, '2023-12-19 07:53:33', '2023-12-19 07:53:33'),
(272, 'App\\Models\\User', 4, 'Api token ofuser3', 'fa8207cbe892758a9b982951ae44e36d9b78244ccafd0a7520ca19f656fd2cf9', '[\"*\"]', NULL, '2023-12-19 08:00:46', '2023-12-19 08:00:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE IF NOT EXISTS `promotions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `discount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `promotions`
--

INSERT INTO `promotions` (`id`, `name`, `description`, `start_date`, `end_date`, `discount`, `created_at`, `updated_at`) VALUES
(2, 'a', NULL, '2023-11-02', '2024-01-20', 0.10, '2023-11-02 03:24:26', '2023-11-02 03:24:26'),
(4, 'a23', 'a', '2023-02-02', '2024-06-20', 0.20, '2023-12-18 02:03:04', '2023-12-18 02:04:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `publishers`
--

DROP TABLE IF EXISTS `publishers`;
CREATE TABLE IF NOT EXISTS `publishers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'NXB Thế Giới', '2023-11-02 02:49:01', '2023-11-02 02:49:01'),
(3, 'Hồng Đức', '2023-11-02 02:49:37', '2023-11-02 02:49:37'),
(4, 'NXB Thông Tin Và Truyền Thông', '2023-11-02 02:50:02', '2023-11-02 02:50:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'categories', 'web', '2023-11-09 06:59:06', '2023-11-09 06:59:06'),
(2, 'admin', 'web', '2023-11-09 06:59:11', '2023-11-09 06:59:11'),
(3, 'user', 'web', '2023-11-09 06:59:16', '2023-11-09 06:59:16'),
(4, 'employee', 'web', '2023-12-19 07:27:31', '2023-12-19 07:27:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genre` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `address`, `phone`, `genre`, `google_id`, `is_locked`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$3GkD3hJARKd99GIXQHLV9Od7/Oup2JxnMcxh3.a86CE8BLv/xY5Wu', NULL, '2023-11-09 07:00:23', '2023-11-09 07:00:23', NULL, NULL, NULL, NULL, 0),
(2, 'userUp', 'user@gmail.com', NULL, '$2y$10$brqg1KKTUm2Jj.wz72IgeeDu5X3QA60vYhkO7ipR.VJePAzDbA8/S', NULL, '2023-11-09 07:00:37', '2023-11-27 08:44:52', 'a', '0979689327', 'Nam', NULL, 0),
(3, 'user2', 'user2@gmail.com', NULL, '$2y$10$9x36ssS.qi1xvd3bTvJk.O.ZD.fACdrAi8hT4yR2zYyYhyzoz8DRK', NULL, '2023-11-12 01:22:14', '2023-11-28 00:21:12', 'a', '0979689327', NULL, NULL, 0),
(4, 'user3', 'user3@gmail.com', NULL, '$2y$10$uA7b3SfY./VExpEy8R.NHuBojcKCH07hpzVy0KKfT5csZlIG//l1a', NULL, '2023-11-12 01:28:23', '2023-12-18 07:55:53', NULL, NULL, NULL, NULL, 1),
(5, 'user4', 'user4@gmail.com', NULL, '$2y$10$nMGM14rjoLgPz9X.5.B7jO6/OIAeD1.4TGvhseTxu/cgLUtpo4olG', NULL, '2023-11-12 07:38:45', '2023-12-19 07:55:49', NULL, NULL, NULL, NULL, 1),
(6, 'user6', 'user6@gmail.com', NULL, '$2y$10$5xMQ2KmAX3.5UOQyi5V02OHvSbsiwDHGEQ/k20XD9PRwBObDniOt2', NULL, '2023-11-12 07:50:40', '2023-11-12 07:50:40', NULL, NULL, NULL, NULL, 0),
(12, 'admin2', 'admin2@gmail.com', NULL, '$2y$10$7QznDfxrdS7qgF1Pxfm7Oe4ljyxryGTYkeXLqR6scZqQhiZHlI9/q', NULL, '2023-12-13 01:03:35', '2023-12-13 01:32:42', 'a', '0979689327', 'Nam', NULL, 0),
(11, 'ChiTon Doan', 'tonvalorant@gmail.com', NULL, '$2y$10$NuwEvuLF9TC.pBTw04Won.e54EDLwPTArbdsE/e6b8kNtew/9YYf2', NULL, '2023-12-12 08:31:37', '2023-12-12 08:31:37', NULL, NULL, NULL, '104076886466269806454', 0),
(15, 'employee', 'employee@gmail.com', NULL, '$2y$10$/5KU8gvRwfIkYb/KzsJru.QOeEXi6.6r2xfCiLgnFzij65fVxjP7W', NULL, '2023-12-19 07:53:25', '2023-12-19 07:53:25', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `book_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `book_id`, `created_at`, `updated_at`) VALUES
(13, 3, 14, '2023-11-29 02:53:09', '2023-11-29 02:53:09'),
(15, 3, 17, '2023-11-29 06:20:29', '2023-11-29 06:20:29');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
