-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 07:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(120) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'HF6VsKXaWERBY22COOO4OEtSsBapgW8W', 1, '2023-11-14 23:28:19', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(2, 2, '9si4upkBvWkoRzYej8rrmZa2ll9XQjtP', 1, '2023-11-14 23:28:20', '2023-11-14 23:28:20', '2023-11-14 23:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `action_label` varchar(191) DEFAULT NULL,
  `action_url` varchar(191) DEFAULT NULL,
  `description` varchar(400) NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(60) NOT NULL,
  `request` longtext DEFAULT NULL,
  `action` varchar(120) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `reference_user` bigint(20) UNSIGNED NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'Basma Ahmed', 'info', '2023-11-22 16:18:08', '2023-11-22 16:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'General', 0, 'Dolorem sit nesciunt optio et. Aut id suscipit et accusamus. Incidunt totam reprehenderit ut ut incidunt. Incidunt nihil quia officiis aut.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(2, 'Hotel', 0, 'Corrupti aliquam quia adipisci necessitatibus magnam placeat tempore. Recusandae laboriosam quia vel. Harum quibusdam tempore officia impedit esse. Laborum corporis assumenda eum quibusdam.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(3, 'Booking', 0, 'Esse et ut non quia recusandae. Repellat aut debitis velit et porro ipsam et. Quia neque architecto voluptatem et odit. Delectus accusantium impedit ut distinctio quisquam.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(4, 'Resort', 0, 'Eum tempora aperiam delectus aut. Ex distinctio eveniet error asperiores. Quas qui voluptas nobis aut. Iusto quasi soluta est cum similique inventore aut culpa.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(5, 'Travel', 0, 'Nostrum facere labore et quod. Et vitae minus rem nobis. Fugit et et autem rerum iste recusandae. Dolorem aut porro accusamus. Est aut dolor maiores et ex aliquid deserunt. Id tempore ut ut itaque.', 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 1, 0, '2023-11-14 23:28:09', '2023-11-14 23:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `categories_translations`
--

CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `subject` varchar(120) DEFAULT NULL,
  `content` longtext NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_themes', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(2, 'widget_total_users', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(3, 'widget_total_pages', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(4, 'widget_total_plugins', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(5, 'widget_analytics_general', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(6, 'widget_analytics_page', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(7, 'widget_analytics_browser', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(8, 'widget_analytics_referrer', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(9, 'widget_posts_recent', '2023-11-22 16:18:09', '2023-11-22 16:18:09'),
(10, 'widget_audit_logs', '2023-11-22 16:18:09', '2023-11-22 16:18:09');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` bigint(20) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` longtext NOT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `description`, `is_featured`, `order`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Duplex Restaurant', 'Enim et rerum aut delectus placeat qui omnis. Voluptatem itaque dolorem sapiente dolores reprehenderit ducimus atque et.', 1, 0, 'galleries/01.jpg', 1, 'published', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(2, 'Luxury room', 'Est ut non at non sit. Laboriosam rem atque consequatur cupiditate. Corrupti quaerat magnam ut consequatur et voluptatum architecto.', 1, 0, 'galleries/02.jpg', 1, 'published', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(3, 'Pacific Room', 'Neque debitis consectetur ipsa necessitatibus impedit. Error eum non earum. Qui omnis corporis hic aperiam.', 1, 0, 'galleries/03.jpg', 1, 'published', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(4, 'Family Room', 'Quia dolorem vel optio pariatur. Beatae quos molestias qui quisquam culpa. Quasi quasi quidem quam magni.', 1, 0, 'galleries/04.jpg', 1, 'published', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(5, 'King Bed', 'Labore non aut cupiditate accusamus provident. Quibusdam iusto in quo officiis impedit rerum omnis. Alias fugit dignissimos qui.', 1, 0, 'galleries/05.jpg', 1, 'published', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(6, 'Special Foods', 'Aut delectus modi quos numquam eius reprehenderit voluptatem. Dolor et alias dolorum quis qui inventore ut. Ut ratione culpa dicta.', 1, 0, 'galleries/06.jpg', 1, 'published', '2023-11-14 23:28:19', '2023-11-14 23:28:19');

-- --------------------------------------------------------

--
-- Table structure for table `galleries_translations`
--

CREATE TABLE `galleries_translations` (
  `lang_code` varchar(191) NOT NULL,
  `galleries_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` text DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_meta`
--

INSERT INTO `gallery_meta` (`id`, `images`, `reference_id`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, '\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Laudantium et consequatur ullam. Et itaque minima tempora et. Quibusdam in natus et error sapiente.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Cupiditate veritatis iste rerum qui ea fugiat qui. Minus voluptatum quia quasi fuga nemo eum esse. Dolor beatae sed numquam placeat qui et magni.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Exercitationem laudantium tenetur eos aut. Quos perspiciatis aut necessitatibus eaque laborum tempore quia eius.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Quis minima quo nemo qui est dignissimos est ea. Adipisci incidunt ullam optio neque animi. Laudantium ut et quis neque ipsam deserunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Magni expedita sequi possimus quae soluta rerum sint iste. Distinctio temporibus nulla molestiae sed enim. Impedit excepturi hic suscipit nemo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Perspiciatis dicta placeat consequatur rerum. Repellendus magni dolore esse et a nesciunt. Est dignissimos dolores temporibus reprehenderit sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Fugiat veritatis est quos. Et culpa dignissimos nulla et et provident aperiam. Ea corrupti optio sequi recusandae molestiae.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Laboriosam dignissimos dicta deleniti vel omnis sapiente id. Debitis voluptas sit animi. Eos aspernatur incidunt neque nesciunt et ut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Esse vel quos iure id. Velit maiores ut tempore et consequatur quae. Nesciunt distinctio laborum eaque labore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Sint alias id aliquam nihil impedit reprehenderit. Consequatur omnis amet harum debitis quia qui. Qui nesciunt nesciunt facilis eligendi in.\\\"}]\"', 1, 'Botble\\Gallery\\Models\\Gallery', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(2, '\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Laudantium et consequatur ullam. Et itaque minima tempora et. Quibusdam in natus et error sapiente.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Cupiditate veritatis iste rerum qui ea fugiat qui. Minus voluptatum quia quasi fuga nemo eum esse. Dolor beatae sed numquam placeat qui et magni.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Exercitationem laudantium tenetur eos aut. Quos perspiciatis aut necessitatibus eaque laborum tempore quia eius.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Quis minima quo nemo qui est dignissimos est ea. Adipisci incidunt ullam optio neque animi. Laudantium ut et quis neque ipsam deserunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Magni expedita sequi possimus quae soluta rerum sint iste. Distinctio temporibus nulla molestiae sed enim. Impedit excepturi hic suscipit nemo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Perspiciatis dicta placeat consequatur rerum. Repellendus magni dolore esse et a nesciunt. Est dignissimos dolores temporibus reprehenderit sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Fugiat veritatis est quos. Et culpa dignissimos nulla et et provident aperiam. Ea corrupti optio sequi recusandae molestiae.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Laboriosam dignissimos dicta deleniti vel omnis sapiente id. Debitis voluptas sit animi. Eos aspernatur incidunt neque nesciunt et ut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Esse vel quos iure id. Velit maiores ut tempore et consequatur quae. Nesciunt distinctio laborum eaque labore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Sint alias id aliquam nihil impedit reprehenderit. Consequatur omnis amet harum debitis quia qui. Qui nesciunt nesciunt facilis eligendi in.\\\"}]\"', 2, 'Botble\\Gallery\\Models\\Gallery', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(3, '\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Laudantium et consequatur ullam. Et itaque minima tempora et. Quibusdam in natus et error sapiente.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Cupiditate veritatis iste rerum qui ea fugiat qui. Minus voluptatum quia quasi fuga nemo eum esse. Dolor beatae sed numquam placeat qui et magni.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Exercitationem laudantium tenetur eos aut. Quos perspiciatis aut necessitatibus eaque laborum tempore quia eius.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Quis minima quo nemo qui est dignissimos est ea. Adipisci incidunt ullam optio neque animi. Laudantium ut et quis neque ipsam deserunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Magni expedita sequi possimus quae soluta rerum sint iste. Distinctio temporibus nulla molestiae sed enim. Impedit excepturi hic suscipit nemo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Perspiciatis dicta placeat consequatur rerum. Repellendus magni dolore esse et a nesciunt. Est dignissimos dolores temporibus reprehenderit sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Fugiat veritatis est quos. Et culpa dignissimos nulla et et provident aperiam. Ea corrupti optio sequi recusandae molestiae.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Laboriosam dignissimos dicta deleniti vel omnis sapiente id. Debitis voluptas sit animi. Eos aspernatur incidunt neque nesciunt et ut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Esse vel quos iure id. Velit maiores ut tempore et consequatur quae. Nesciunt distinctio laborum eaque labore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Sint alias id aliquam nihil impedit reprehenderit. Consequatur omnis amet harum debitis quia qui. Qui nesciunt nesciunt facilis eligendi in.\\\"}]\"', 3, 'Botble\\Gallery\\Models\\Gallery', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(4, '\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Laudantium et consequatur ullam. Et itaque minima tempora et. Quibusdam in natus et error sapiente.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Cupiditate veritatis iste rerum qui ea fugiat qui. Minus voluptatum quia quasi fuga nemo eum esse. Dolor beatae sed numquam placeat qui et magni.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Exercitationem laudantium tenetur eos aut. Quos perspiciatis aut necessitatibus eaque laborum tempore quia eius.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Quis minima quo nemo qui est dignissimos est ea. Adipisci incidunt ullam optio neque animi. Laudantium ut et quis neque ipsam deserunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Magni expedita sequi possimus quae soluta rerum sint iste. Distinctio temporibus nulla molestiae sed enim. Impedit excepturi hic suscipit nemo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Perspiciatis dicta placeat consequatur rerum. Repellendus magni dolore esse et a nesciunt. Est dignissimos dolores temporibus reprehenderit sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Fugiat veritatis est quos. Et culpa dignissimos nulla et et provident aperiam. Ea corrupti optio sequi recusandae molestiae.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Laboriosam dignissimos dicta deleniti vel omnis sapiente id. Debitis voluptas sit animi. Eos aspernatur incidunt neque nesciunt et ut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Esse vel quos iure id. Velit maiores ut tempore et consequatur quae. Nesciunt distinctio laborum eaque labore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Sint alias id aliquam nihil impedit reprehenderit. Consequatur omnis amet harum debitis quia qui. Qui nesciunt nesciunt facilis eligendi in.\\\"}]\"', 4, 'Botble\\Gallery\\Models\\Gallery', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(5, '\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Laudantium et consequatur ullam. Et itaque minima tempora et. Quibusdam in natus et error sapiente.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Cupiditate veritatis iste rerum qui ea fugiat qui. Minus voluptatum quia quasi fuga nemo eum esse. Dolor beatae sed numquam placeat qui et magni.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Exercitationem laudantium tenetur eos aut. Quos perspiciatis aut necessitatibus eaque laborum tempore quia eius.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Quis minima quo nemo qui est dignissimos est ea. Adipisci incidunt ullam optio neque animi. Laudantium ut et quis neque ipsam deserunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Magni expedita sequi possimus quae soluta rerum sint iste. Distinctio temporibus nulla molestiae sed enim. Impedit excepturi hic suscipit nemo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Perspiciatis dicta placeat consequatur rerum. Repellendus magni dolore esse et a nesciunt. Est dignissimos dolores temporibus reprehenderit sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Fugiat veritatis est quos. Et culpa dignissimos nulla et et provident aperiam. Ea corrupti optio sequi recusandae molestiae.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Laboriosam dignissimos dicta deleniti vel omnis sapiente id. Debitis voluptas sit animi. Eos aspernatur incidunt neque nesciunt et ut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Esse vel quos iure id. Velit maiores ut tempore et consequatur quae. Nesciunt distinctio laborum eaque labore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Sint alias id aliquam nihil impedit reprehenderit. Consequatur omnis amet harum debitis quia qui. Qui nesciunt nesciunt facilis eligendi in.\\\"}]\"', 5, 'Botble\\Gallery\\Models\\Gallery', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(6, '\"[{\\\"img\\\":\\\"galleries\\\\\\/1.jpg\\\",\\\"description\\\":\\\"Laudantium et consequatur ullam. Et itaque minima tempora et. Quibusdam in natus et error sapiente.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/2.jpg\\\",\\\"description\\\":\\\"Cupiditate veritatis iste rerum qui ea fugiat qui. Minus voluptatum quia quasi fuga nemo eum esse. Dolor beatae sed numquam placeat qui et magni.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/3.jpg\\\",\\\"description\\\":\\\"Exercitationem laudantium tenetur eos aut. Quos perspiciatis aut necessitatibus eaque laborum tempore quia eius.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/4.jpg\\\",\\\"description\\\":\\\"Quis minima quo nemo qui est dignissimos est ea. Adipisci incidunt ullam optio neque animi. Laudantium ut et quis neque ipsam deserunt.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/5.jpg\\\",\\\"description\\\":\\\"Magni expedita sequi possimus quae soluta rerum sint iste. Distinctio temporibus nulla molestiae sed enim. Impedit excepturi hic suscipit nemo.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/6.jpg\\\",\\\"description\\\":\\\"Perspiciatis dicta placeat consequatur rerum. Repellendus magni dolore esse et a nesciunt. Est dignissimos dolores temporibus reprehenderit sed.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/7.jpg\\\",\\\"description\\\":\\\"Fugiat veritatis est quos. Et culpa dignissimos nulla et et provident aperiam. Ea corrupti optio sequi recusandae molestiae.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/8.jpg\\\",\\\"description\\\":\\\"Laboriosam dignissimos dicta deleniti vel omnis sapiente id. Debitis voluptas sit animi. Eos aspernatur incidunt neque nesciunt et ut.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/9.jpg\\\",\\\"description\\\":\\\"Esse vel quos iure id. Velit maiores ut tempore et consequatur quae. Nesciunt distinctio laborum eaque labore.\\\"},{\\\"img\\\":\\\"galleries\\\\\\/10.jpg\\\",\\\"description\\\":\\\"Sint alias id aliquam nihil impedit reprehenderit. Consequatur omnis amet harum debitis quia qui. Qui nesciunt nesciunt facilis eligendi in.\\\"}]\"', 6, 'Botble\\Gallery\\Models\\Gallery', '2023-11-14 23:28:19', '2023-11-14 23:28:19');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta_translations`
--

CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(191) NOT NULL,
  `gallery_meta_id` bigint(20) UNSIGNED NOT NULL,
  `images` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_amenities`
--

CREATE TABLE `ht_amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `icon` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_amenities`
--

INSERT INTO `ht_amenities` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Air conditioner', 'fal fa-bath', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(2, 'High speed WiFi', 'fal fa-wifi', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(3, 'Strong Locker', 'fal fa-key', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(4, 'Breakfast', 'fal fa-cut', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(5, 'Kitchen', 'fal fa-guitar', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(6, 'Smart Security', 'fal fa-lock', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(7, 'Cleaning', 'fal fa-broom', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(8, 'Shower', 'fal fa-shower', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(9, '24/7 Online Support', 'fal fa-headphones-alt', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(10, 'Grocery', 'fal fa-shopping-basket', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(11, 'Single bed', 'fal fa-bed', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(12, 'Expert Team', 'fal fa-users', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(13, 'Shop near', 'fal fa-shopping-cart', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(14, 'Towels', 'fal fa-bus', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `ht_amenities_translations`
--

CREATE TABLE `ht_amenities_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_amenities_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_bookings`
--

CREATE TABLE `ht_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `coupon_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `coupon_code` varchar(20) DEFAULT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `requests` text DEFAULT NULL,
  `arrival_time` varchar(120) DEFAULT NULL,
  `number_of_guests` int(11) DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(32) DEFAULT NULL,
  `status` varchar(120) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_bookings`
--

INSERT INTO `ht_bookings` (`id`, `amount`, `sub_total`, `coupon_amount`, `coupon_code`, `tax_amount`, `currency_id`, `requests`, `arrival_time`, `number_of_guests`, `payment_id`, `customer_id`, `transaction_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 435.00, 435.00, 0.00, NULL, 0.00, NULL, 'Sint maxime illo possimus quas tempora neque.', NULL, 3, 1, 2, 'aLRINF1pd0fXOPuey6kW', 'cancelled', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(2, 157.00, 157.00, 0.00, NULL, 0.00, NULL, 'Voluptas nihil et dolorum et aut qui dolorem.', NULL, 1, 2, 3, 'VwwrAtg2u8IIrlD6KwHq', 'completed', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(3, 380.00, 380.00, 0.00, NULL, 0.00, NULL, 'Temporibus ut atque inventore est fuga.', NULL, 4, 3, 11, 'Vf08rLrspVxYG4N13HxJ', 'processing', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(4, 435.00, 435.00, 0.00, NULL, 0.00, NULL, 'Et ea cupiditate quasi et minus quos aut.', NULL, 3, 4, 9, 'RhNg1yKD9bhOSDFUZu12', 'processing', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(5, 390.00, 390.00, 0.00, NULL, 0.00, NULL, 'Ut provident id facilis voluptas est est corporis autem.', NULL, 4, 5, 4, 'TsBsl62n6K7eSereIULK', 'cancelled', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(6, 342.00, 342.00, 0.00, NULL, 0.00, NULL, 'Voluptatem itaque voluptas facere harum provident autem soluta qui.', NULL, 2, 6, 9, 'ovX6I6uvTi6Rh03mlSQI', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(7, 585.00, 585.00, 0.00, NULL, 0.00, NULL, 'Dolorem commodi similique et reprehenderit omnis dicta ut.', NULL, 9, 7, 7, '7049oNFlmB76NGuNMAUr', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(8, 171.00, 171.00, 0.00, NULL, 0.00, NULL, 'Deserunt voluptas delectus qui fuga officia.', NULL, 3, 8, 10, 'G5nHaBQn0VfqS8KF5T9J', 'pending', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(9, 171.00, 171.00, 0.00, NULL, 0.00, NULL, 'Et occaecati ad a aut qui.', NULL, 2, 9, 1, 'IF6tNjuzKjdOYRyfIzio', 'cancelled', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(10, 513.00, 513.00, 0.00, NULL, 0.00, NULL, 'Saepe quis ut praesentium commodi molestiae.', NULL, 9, 10, 4, 'wgICsXOu2fOhQHUXGYU5', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(11, 570.00, 570.00, 0.00, NULL, 0.00, NULL, 'Debitis in hic laboriosam aliquid voluptatem aut ipsam consequatur.', NULL, 9, 11, 6, 'y8DB6ciXD7VNyoXmgisY', 'pending', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(12, 471.00, 471.00, 0.00, NULL, 0.00, NULL, 'Dolores quisquam eaque excepturi consectetur dolorem.', NULL, 9, 12, 2, 'u9CATg9ZyqRNSpI5cU24', 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(13, 195.00, 195.00, 0.00, NULL, 0.00, NULL, 'Qui fugit et ipsa aliquid.', NULL, 2, 13, 8, 'qUBPPIt8iaL3mq7IZyEX', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(14, 290.00, 290.00, 0.00, NULL, 0.00, NULL, 'Minus omnis quaerat sed enim sint laborum fuga.', NULL, 4, 14, 5, 'dgMFugsrklHh1S5Zo78b', 'pending', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(15, 471.00, 471.00, 0.00, NULL, 0.00, NULL, 'Quia eos ea voluptas accusantium qui.', NULL, 9, 15, 2, '5G1rfxWGM0KegTlsKJ0w', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(16, 453.00, 453.00, 0.00, NULL, 0.00, NULL, 'Sed aut unde delectus omnis et beatae.', NULL, 3, 16, 4, 'mHOj4h9FKf6j3ZbmLBP4', 'cancelled', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(17, 157.00, 157.00, 0.00, NULL, 0.00, NULL, 'Tenetur totam consequatur exercitationem magni nostrum.', NULL, 3, 17, 5, 'ZrvSmJW1vtXr5r8usZMN', 'cancelled', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(18, 380.00, 380.00, 0.00, NULL, 0.00, NULL, 'Aspernatur a voluptatibus minus itaque odio nesciunt.', NULL, 6, 18, 11, 'QO2WVXqGKeGwoRvvLUaB', 'cancelled', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(19, 178.00, 178.00, 0.00, NULL, 0.00, NULL, 'Inventore libero harum beatae veniam.', NULL, 3, 19, 1, 'BFnC4nzIydQTfGOHLIc0', 'pending', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(20, 585.00, 585.00, 0.00, NULL, 0.00, NULL, 'Quae molestiae ut neque sed consequuntur saepe quia.', NULL, 6, 20, 8, '1SksSaj3bukrypUzZsHI', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(21, 178.00, 178.00, 0.00, NULL, 0.00, NULL, 'Est sint asperiores molestiae.', NULL, 1, 21, 8, 'N0FbDdft3X5t5Zxj8qYt', 'pending', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(22, 534.00, 534.00, 0.00, NULL, 0.00, NULL, 'Incidunt culpa doloribus libero nemo quia.', NULL, 9, 22, 11, 'SeIVugwUo22NgQUFT5RJ', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(23, 314.00, 314.00, 0.00, NULL, 0.00, NULL, 'Quia aliquam molestiae nulla ipsa totam.', NULL, 6, 23, 2, 'nq84OLlJlRQLeIXhTAFl', 'pending', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(24, 302.00, 302.00, 0.00, NULL, 0.00, NULL, 'Sed temporibus est consectetur ea.', NULL, 4, 24, 8, 'zJraqdMHcGfuH1O2Q0GH', 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(25, 151.00, 151.00, 0.00, NULL, 0.00, NULL, 'Sed id deserunt in ea amet.', NULL, 2, 25, 4, '4xAhMkdPt0YVXNQ6mVAH', 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(26, 190.00, 190.00, 0.00, NULL, 0.00, NULL, 'Maiores voluptatem dolorem vel non.', NULL, 3, 26, 6, 'erAlsxOjKF8BUNV21dtf', 'processing', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(27, 278.00, 278.00, 0.00, NULL, 0.00, NULL, 'Est unde illum exercitationem et.', NULL, 2, 27, 10, '8wKdCevpfxgFYlsNc0Ko', 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(28, 195.00, 195.00, 0.00, NULL, 0.00, NULL, 'Illo nemo corrupti neque perspiciatis.', NULL, 3, 28, 4, 'TZa0ZHfdiGRPGJhn8gif', 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(29, 290.00, 290.00, 0.00, NULL, 0.00, NULL, 'Qui mollitia aliquam sit.', NULL, 4, 29, 5, '0VcyhxsnMyx9q5TM4at5', 'cancelled', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(30, 145.00, 145.00, 0.00, NULL, 0.00, NULL, 'Consequatur veniam modi ab aut quis nostrum quod.', NULL, 1, 30, 8, 'jezLcZPLy7gIzXKmawkp', 'cancelled', '2023-11-14 23:28:24', '2023-11-14 23:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `ht_booking_addresses`
--

CREATE TABLE `ht_booking_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_booking_addresses`
--

INSERT INTO `ht_booking_addresses` (`id`, `first_name`, `last_name`, `phone`, `email`, `country`, `state`, `city`, `zip`, `address`, `booking_id`, `created_at`, `updated_at`) VALUES
(1, 'Genevieve', 'Lesch', '(726) 627-2694', 'bartell.kallie@example.com', 'Taiwan', 'Lake Crystelbury', 'West Kyleigh', '70841', '12616 Turner Stream Apt. 826\nCartwrightmouth, VA 74739-0574', 1, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(2, 'Bianka', 'Green', '+1.920.580.5142', 'treutel.alexandrea@example.com', 'United States Minor Outlying Islands', 'North Raeganbury', 'West Jaydeburgh', '20818', '63964 Deon Common\nFranzfort, AL 72058-6068', 2, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(3, 'Zoey', 'Pouros', '+16169373494', 'efeeney@example.com', 'Indonesia', 'Drewfort', 'West Josianne', '05191', '1681 Brielle Unions\nRunteberg, VT 37919-4573', 3, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(4, 'Ceasar', 'Cassin', '+15154387822', 'maude.abernathy@example.com', 'Tuvalu', 'Mayerbury', 'North Maverickborough', '82093-4357', '21189 Jalyn Radial\nNew Chase, GA 12194', 4, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(5, 'Jazmyne', 'Barton', '1-708-232-7164', 'lia.cummerata@example.org', 'Oman', 'Domenicamouth', 'West Mollieside', '63836-3046', '215 Rath Mills Apt. 006\nLorenaview, MD 52831', 5, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(6, 'Virgil', 'Hackett', '+1-781-708-3100', 'jquitzon@example.org', 'Poland', 'Reynoldsville', 'East Aidenstad', '85021', '605 Haylie Port Suite 787\nSouth Alenehaven, MS 93682-2691', 6, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(7, 'Carli', 'Johns', '681-667-4553', 'cynthia.beatty@example.com', 'Samoa', 'Port Lorna', 'Smithchester', '56718', '90085 Goodwin Pine Apt. 836\nNew Maurice, IL 30139-0966', 7, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(8, 'Nettie', 'Rowe', '(225) 805-2645', 'sadye.zboncak@example.net', 'Bosnia and Herzegovina', 'Jesusside', 'Lamarville', '97980-7977', '316 Ewald Dale Suite 155\nElenachester, AR 42358', 8, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(9, 'Emmalee', 'Luettgen', '+16189070704', 'mullrich@example.net', 'Honduras', 'West Bud', 'Ilaside', '95672', '7887 Abigail Park Apt. 148\nWest Jamie, MD 34059-7478', 9, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(10, 'Maud', 'Kihn', '559.584.6173', 'zhagenes@example.com', 'Aruba', 'South Henriettebury', 'West Torrancemouth', '43917', '8417 Hessel Route\nSouth Juliusside, TX 81587-6527', 10, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(11, 'Kattie', 'McKenzie', '+1-231-968-1194', 'oconner.elena@example.org', 'Wallis and Futuna', 'New Altheachester', 'Lake Jeanie', '88049-7025', '1560 Boyer Springs\nWest Buck, MO 05191', 11, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(12, 'Rowland', 'Hermiston', '+16022504503', 'ynitzsche@example.com', 'Romania', 'Andreanemouth', 'Balistrerihaven', '02292', '85274 Chandler Junction\nHahnmouth, OH 04228', 12, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(13, 'Duane', 'Bruen', '+1 (331) 783-9281', 'felix20@example.org', 'Mexico', 'New Velmamouth', 'Jedmouth', '02266-9614', '2038 Manley Heights Apt. 412\nEast Chadmouth, NY 09832-7578', 13, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(14, 'Kenyon', 'Kassulke', '(830) 961-7154', 'milo80@example.com', 'Marshall Islands', 'North Aurelie', 'Hilarioside', '40051-4579', '6109 Franco Harbor Suite 719\nNew Annamarie, NY 71871', 14, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(15, 'Adella', 'Reilly', '+1-425-681-3458', 'treutel.esperanza@example.org', 'Zambia', 'North Emmettton', 'North Sim', '95223-3210', '463 Manuela Trail\nPagacshire, ID 62050', 15, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(16, 'Anita', 'Ledner', '737-684-3654', 'smitham.hermina@example.com', 'Cape Verde', 'Muhammadside', 'Metzhaven', '43018-2290', '16352 Damion Lodge\nWest Raleigh, RI 52980', 16, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(17, 'Lowell', 'Hyatt', '(248) 597-3096', 'natalie.gutmann@example.net', 'Yemen', 'West Martytown', 'North Wilmer', '54216-6167', '387 Anderson Plaza Suite 960\nHuelchester, ME 01305', 17, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(18, 'Kasandra', 'Spinka', '1-425-427-4997', 'rolando.boehm@example.com', 'Guyana', 'New Jessycaview', 'Schmidtstad', '05099-9858', '776 Markus Way Suite 823\nCatherineborough, UT 10725', 18, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(19, 'Bert', 'Borer', '1-516-385-2337', 'khyatt@example.com', 'Antarctica (the territory South of 60 deg S)', 'Lake Kim', 'Leannonfort', '77513', '622 Cade Lane\nCollinshaven, NY 84582-7008', 19, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(20, 'Dulce', 'Becker', '+1.678.244.4089', 'bridie.moore@example.org', 'Niger', 'Mohrchester', 'Jastmouth', '66525', '63523 Katrine Fork Suite 036\nEast Ibrahim, FL 81385-1547', 20, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(21, 'Emmet', 'Romaguera', '+1-586-895-4017', 'moore.dawn@example.net', 'Belarus', 'Amiemouth', 'Tristinberg', '86045', '92985 Allen Hills Apt. 458\nLeilaniberg, MT 32952-9957', 21, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(22, 'Emmy', 'Armstrong', '(619) 836-1154', 'crystel86@example.com', 'Paraguay', 'Saulbury', 'New Roscoestad', '83446-0805', '28568 Sherman Fork Apt. 099\nLake Sisterville, MT 43956', 22, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(23, 'Scarlett', 'Kuhn', '303-812-7548', 'hgreenholt@example.org', 'Venezuela', 'New Josh', 'Ardithtown', '40237', '15336 Wiegand Extension Apt. 266\nEast Jena, PA 96538-0569', 23, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(24, 'Pearline', 'Morissette', '(212) 389-3826', 'enid.jast@example.org', 'Peru', 'Smithtown', 'South Lacyland', '00013', '1063 Jeff Squares\nPort Murielmouth, UT 76614', 24, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(25, 'Judah', 'Eichmann', '231.715.9926', 'korbin91@example.org', 'Pitcairn Islands', 'West Dell', 'Luettgenfort', '61336', '144 Harris Plaza Apt. 062\nEnolachester, WA 55510-2493', 25, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(26, 'Kathryne', 'Bruen', '+1 (339) 669-6347', 'osmith@example.org', 'Central African Republic', 'North Wallaceshire', 'West Allyberg', '05781-5046', '4774 Regan Road Suite 397\nNorth Kelsie, CT 25113', 26, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(27, 'Else', 'Thiel', '(863) 622-7078', 'daisy.raynor@example.com', 'Pakistan', 'Gloverburgh', 'Sybleside', '57433-0078', '8062 Mraz Stream Apt. 695\nPort Tessie, IA 41267-8246', 27, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(28, 'Camryn', 'Luettgen', '+1-929-882-8665', 'wilhelmine.stamm@example.org', 'Poland', 'West Holly', 'Madonnashire', '77984-1251', '4861 Cora Green Apt. 712\nEast Abigalefurt, NV 12733-0876', 28, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(29, 'Edgardo', 'Armstrong', '+1-469-772-6930', 'drake.schoen@example.org', 'Mexico', 'Port Sabrina', 'Elisaberg', '56586', '618 Margarete Road\nCronachester, HI 39198-3849', 29, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(30, 'Chad', 'Dooley', '+1.757.783.9488', 'nichole65@example.org', 'Aruba', 'North Stephanieburgh', 'Maximillianhaven', '29686-3628', '238 Rutherford Island\nTitushaven, AK 82114', 30, '2023-11-14 23:28:24', '2023-11-14 23:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `ht_booking_rooms`
--

CREATE TABLE `ht_booking_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `room_image` text DEFAULT NULL,
  `room_name` varchar(120) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_rooms` int(11) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_booking_rooms`
--

INSERT INTO `ht_booking_rooms` (`id`, `booking_id`, `room_id`, `room_image`, `room_name`, `price`, `currency_id`, `number_of_rooms`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 'rooms/02.jpg', 'President Room', 145.00, NULL, 3, '2023-11-01', '2023-11-03', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(2, 2, 6, 'rooms/06.jpg', 'Relax Suite', 157.00, NULL, 1, '2023-11-02', '2023-11-05', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(3, 3, 2, 'rooms/02.jpg', 'Pendora Fame', 190.00, NULL, 2, '2023-11-03', '2023-11-04', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(4, 4, 8, 'rooms/02.jpg', 'President Room', 145.00, NULL, 3, '2023-11-04', '2023-11-05', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(5, 5, 4, 'rooms/04.jpg', 'Junior Suite', 195.00, NULL, 2, '2023-11-05', '2023-11-08', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(6, 6, 1, 'rooms/01.jpg', 'Luxury Hall Of Fame', 171.00, NULL, 2, '2023-11-06', '2023-11-08', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(7, 7, 4, 'rooms/04.jpg', 'Junior Suite', 195.00, NULL, 3, '2023-11-07', '2023-11-09', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(8, 8, 1, 'rooms/01.jpg', 'Luxury Hall Of Fame', 171.00, NULL, 1, '2023-11-08', '2023-11-09', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(9, 9, 1, 'rooms/01.jpg', 'Luxury Hall Of Fame', 171.00, NULL, 1, '2023-11-09', '2023-11-12', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(10, 10, 1, 'rooms/01.jpg', 'Luxury Hall Of Fame', 171.00, NULL, 3, '2023-11-10', '2023-11-13', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(11, 11, 2, 'rooms/02.jpg', 'Pendora Fame', 190.00, NULL, 3, '2023-11-11', '2023-11-12', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(12, 12, 6, 'rooms/06.jpg', 'Relax Suite', 157.00, NULL, 3, '2023-11-12', '2023-11-13', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(13, 13, 4, 'rooms/04.jpg', 'Junior Suite', 195.00, NULL, 1, '2023-11-13', '2023-11-14', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(14, 14, 8, 'rooms/02.jpg', 'President Room', 145.00, NULL, 2, '2023-11-14', '2023-11-15', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(15, 15, 6, 'rooms/06.jpg', 'Relax Suite', 157.00, NULL, 3, '2023-11-15', '2023-11-16', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(16, 16, 3, 'rooms/03.jpg', 'Pacific Room', 151.00, NULL, 3, '2023-11-16', '2023-11-17', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(17, 17, 6, 'rooms/06.jpg', 'Relax Suite', 157.00, NULL, 1, '2023-11-17', '2023-11-20', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(18, 18, 2, 'rooms/02.jpg', 'Pendora Fame', 190.00, NULL, 2, '2023-11-18', '2023-11-21', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(19, 19, 5, 'rooms/05.jpg', 'Family Suite', 178.00, NULL, 1, '2023-11-19', '2023-11-21', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(20, 20, 4, 'rooms/04.jpg', 'Junior Suite', 195.00, NULL, 3, '2023-11-20', '2023-11-21', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(21, 21, 5, 'rooms/05.jpg', 'Family Suite', 178.00, NULL, 1, '2023-11-21', '2023-11-22', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(22, 22, 5, 'rooms/05.jpg', 'Family Suite', 178.00, NULL, 3, '2023-11-22', '2023-11-25', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(23, 23, 6, 'rooms/06.jpg', 'Relax Suite', 157.00, NULL, 2, '2023-11-23', '2023-11-25', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(24, 24, 3, 'rooms/03.jpg', 'Pacific Room', 151.00, NULL, 2, '2023-11-24', '2023-11-27', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(25, 25, 3, 'rooms/03.jpg', 'Pacific Room', 151.00, NULL, 1, '2023-11-25', '2023-11-27', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(26, 26, 2, 'rooms/02.jpg', 'Pendora Fame', 190.00, NULL, 1, '2023-11-26', '2023-11-29', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(27, 27, 7, 'rooms/01.jpg', 'Luxury Suite', 139.00, NULL, 2, '2023-11-27', '2023-11-28', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(28, 28, 4, 'rooms/04.jpg', 'Junior Suite', 195.00, NULL, 1, '2023-11-28', '2023-11-30', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(29, 29, 8, 'rooms/02.jpg', 'President Room', 145.00, NULL, 2, '2023-11-29', '2023-11-30', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(30, 30, 8, 'rooms/02.jpg', 'President Room', 145.00, NULL, 1, '2023-11-30', '2023-12-01', '2023-11-14 23:28:24', '2023-11-14 23:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `ht_booking_services`
--

CREATE TABLE `ht_booking_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_booking_services`
--

INSERT INTO `ht_booking_services` (`id`, `booking_id`, `service_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 2),
(4, 4, 6),
(5, 5, 4),
(6, 6, 4),
(7, 7, 1),
(8, 8, 5),
(9, 9, 4),
(10, 10, 1),
(11, 11, 4),
(12, 12, 2),
(13, 13, 6),
(14, 14, 6),
(15, 15, 1),
(16, 16, 3),
(17, 17, 6),
(18, 18, 6),
(19, 19, 6),
(20, 20, 2),
(21, 21, 2),
(22, 22, 6),
(23, 23, 1),
(24, 24, 2),
(25, 25, 5),
(26, 26, 3),
(27, 27, 1),
(28, 28, 5),
(29, 29, 6),
(30, 30, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ht_coupons`
--

CREATE TABLE `ht_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `code` varchar(20) NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_currencies`
--

CREATE TABLE `ht_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `exchange_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_currencies`
--

INSERT INTO `ht_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 2, 0, 1, 1, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(2, 'EUR', '€', 0, 2, 1, 0, 0.91, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(3, 'VND', '₫', 0, 0, 2, 0, 23717.5, '2023-11-14 23:28:09', '2023-11-14 23:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `ht_customers`
--

CREATE TABLE `ht_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `state` varchar(120) DEFAULT NULL,
  `country` varchar(120) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_customers`
--

INSERT INTO `ht_customers` (`id`, `first_name`, `last_name`, `email`, `password`, `avatar`, `dob`, `phone`, `address`, `zip`, `city`, `state`, `country`, `created_at`, `updated_at`, `remember_token`, `confirmed_at`) VALUES
(1, 'Mona', 'Stokes', 'nienow.alvah@example.com', '$2y$12$bdSCBrvyJWR8/wO3Fbcf6.48w4WICphekwX2SEMiDhYeFBqxtIlOC', 'customers/1.jpg', NULL, '+17154224989', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(2, 'Oceane', 'Hessel', 'watson.monahan@example.com', '$2y$12$mt3EmlaEFSwB5bzlm7d1werU7AnxVEwTMCUyQdyaOc6cioKJERlr2', 'customers/2.jpg', NULL, '+18475517081', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(3, 'Adolfo', 'Hessel', 'mckenzie.raymond@example.com', '$2y$12$Y3r1DPgBp6YKf4roQrOm4OZfU.7Qzp4X4LkMoQ0WZy5ZSoYcXfwtq', 'customers/3.jpg', NULL, '+14847029613', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(4, 'Henry', 'Jones', 'rnienow@example.org', '$2y$12$Td82b5gTe4ZW5EyCEtMh8er4jjNoY0CoBVnM420Eh4F48GWEVfcOq', 'customers/4.jpg', NULL, '+14069195664', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(5, 'Kaley', 'Reilly', 'price90@example.org', '$2y$12$hy6VRb4geC6Y3INnqDKrQehsg/7guojcxwZW..124ApIZdjfR.jqe', 'customers/5.jpg', NULL, '+15402821360', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(6, 'Clarabelle', 'Grady', 'odell54@example.com', '$2y$12$x24HQnhzTomftkg2BFk2HuYlICuKzBD7VaR41gMUsPGMWEUR7YrAa', 'customers/6.jpg', NULL, '+15393458844', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(7, 'Andreane', 'Marquardt', 'boreilly@example.org', '$2y$12$Vw5nJv32YcteNzrJbufL7enm13lG6C0lz7m2ceCB5Bt0ojHAi1tKC', 'customers/7.jpg', NULL, '+13515717599', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(8, 'Dudley', 'Veum', 'justina01@example.com', '$2y$12$BHyVEALGIfPNUP2AtpM8NOiHYZCcVMefoTUnwZvHYCD7mtbLQ9IaW', 'customers/8.jpg', NULL, '+19854226923', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(9, 'Jordon', 'Baumbach', 'wuckert.garland@example.org', '$2y$12$OhDZ.7p5aJ2nFlpp0IYN0eMjYs1.BIQoo8Ca0s3KD6DuOlvlIZzJa', 'customers/9.jpg', NULL, '+13642128097', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(10, 'Richie', 'Becker', 'wspencer@example.net', '$2y$12$CRXM8U0BPjdk.2Ua6ap0HuGO.QtxedrVKH8ifLVyraAPmdp2ZaxjW', 'customers/10.jpg', NULL, '+19186956173', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL),
(11, 'Tod', 'Medhurst', 'customer@archielite.com', '$2y$12$LucVIIzMcZKMC9ljlfBMzeog3S8dvBmbZhBcsZd6f/ZeqBsd99vZu', 'customers/10.jpg', NULL, '+13319718075', NULL, NULL, NULL, NULL, NULL, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ht_customer_password_resets`
--

CREATE TABLE `ht_customer_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_features`
--

CREATE TABLE `ht_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(120) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_features`
--

INSERT INTO `ht_features` (`id`, `name`, `description`, `icon`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Have High Rating', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-rating', 1, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(2, 'Quiet Hours', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-clock', 1, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(3, 'Best Locations', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-location-pin', 1, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(4, 'Free Cancellation', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-clock-1', 0, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(5, 'Payment Options', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-credit-card', 0, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(6, 'Special Offers', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-discount', 0, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `ht_features_translations`
--

CREATE TABLE `ht_features_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_features_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_foods`
--

CREATE TABLE `ht_foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,0) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `food_type_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_foods`
--

INSERT INTO `ht_foods` (`id`, `name`, `description`, `price`, `currency_id`, `food_type_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Eggs &amp; Bacon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 140, NULL, 1, 'foods/01.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(2, 'Tea or Coffee', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 134, NULL, 1, 'foods/02.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(3, 'Chia Oatmeal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 137, NULL, 1, 'foods/03.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(4, 'Juice', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 191, NULL, 1, 'foods/04.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(5, 'Chia Oatmeal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 164, NULL, 2, 'foods/05.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(6, 'Fruit Parfait', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 188, NULL, 2, 'foods/06.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(7, 'Marmalade Selection', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 110, NULL, 3, 'foods/07.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(8, 'Cheese Platen', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 137, NULL, 4, 'foods/08.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(9, 'Avocado Toast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 148, NULL, 5, 'foods/09.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(10, 'Avocado Toast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', 158, NULL, 6, 'foods/10.jpg', 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `ht_foods_translations`
--

CREATE TABLE `ht_foods_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_foods_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_food_types`
--

CREATE TABLE `ht_food_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `icon` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_food_types`
--

INSERT INTO `ht_food_types` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chicken', 'flaticon-boiled', 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(2, 'Italian', 'flaticon-pizza', 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(3, 'Coffee', 'flaticon-coffee', 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(4, 'Bake Cake', 'flaticon-cake', 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(5, 'Cookies', 'flaticon-cookie', 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(6, 'Cocktail', 'flaticon-cocktail', 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `ht_food_types_translations`
--

CREATE TABLE `ht_food_types_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_food_types_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_invoices`
--

CREATE TABLE `ht_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(191) NOT NULL,
  `customer_email` varchar(191) NOT NULL,
  `customer_phone` varchar(191) NOT NULL,
  `customer_address` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(191) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_invoices`
--

INSERT INTO `ht_invoices` (`id`, `customer_id`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `description`, `payment_id`, `reference_type`, `reference_id`, `code`, `sub_total`, `tax_amount`, `discount_amount`, `amount`, `status`, `paid_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'GenevieveLesch', 'bartell.kallie@example.com', '(726) 627-2694', '12616 Turner Stream Apt. 826\nCartwrightmouth, VA 74739-0574, West Kyleigh, Lake Crystelbury, Taiwan, 70841, ', 'Sint maxime illo possimus quas tempora neque.', 1, 'Botble\\Hotel\\Models\\Booking', 1, 'INV-1', 435.00, 0.00, 0.00, 435.00, 'canceled', NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(2, 3, 'BiankaGreen', 'treutel.alexandrea@example.com', '+1.920.580.5142', '63964 Deon Common\nFranzfort, AL 72058-6068, West Jaydeburgh, North Raeganbury, United States Minor Outlying Islands, 20818, ', 'Voluptas nihil et dolorum et aut qui dolorem.', 2, 'Botble\\Hotel\\Models\\Booking', 2, 'INV-2', 157.00, 0.00, 0.00, 157.00, 'canceled', NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(3, 11, 'ZoeyPouros', 'efeeney@example.com', '+16169373494', '1681 Brielle Unions\nRunteberg, VT 37919-4573, West Josianne, Drewfort, Indonesia, 05191, ', 'Temporibus ut atque inventore est fuga.', 3, 'Botble\\Hotel\\Models\\Booking', 3, 'INV-3', 380.00, 0.00, 0.00, 380.00, 'canceled', NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(4, 9, 'CeasarCassin', 'maude.abernathy@example.com', '+15154387822', '21189 Jalyn Radial\nNew Chase, GA 12194, North Maverickborough, Mayerbury, Tuvalu, 82093-4357, ', 'Et ea cupiditate quasi et minus quos aut.', 4, 'Botble\\Hotel\\Models\\Booking', 4, 'INV-4', 435.00, 0.00, 0.00, 435.00, 'canceled', NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(5, 4, 'JazmyneBarton', 'lia.cummerata@example.org', '1-708-232-7164', '215 Rath Mills Apt. 006\nLorenaview, MD 52831, West Mollieside, Domenicamouth, Oman, 63836-3046, ', 'Ut provident id facilis voluptas est est corporis autem.', 5, 'Botble\\Hotel\\Models\\Booking', 5, 'INV-5', 390.00, 0.00, 0.00, 390.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(6, 9, 'VirgilHackett', 'jquitzon@example.org', '+1-781-708-3100', '605 Haylie Port Suite 787\nSouth Alenehaven, MS 93682-2691, East Aidenstad, Reynoldsville, Poland, 85021, ', 'Voluptatem itaque voluptas facere harum provident autem soluta qui.', 6, 'Botble\\Hotel\\Models\\Booking', 6, 'INV-6', 342.00, 0.00, 0.00, 342.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(7, 7, 'CarliJohns', 'cynthia.beatty@example.com', '681-667-4553', '90085 Goodwin Pine Apt. 836\nNew Maurice, IL 30139-0966, Smithchester, Port Lorna, Samoa, 56718, ', 'Dolorem commodi similique et reprehenderit omnis dicta ut.', 7, 'Botble\\Hotel\\Models\\Booking', 7, 'INV-7', 585.00, 0.00, 0.00, 585.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(8, 10, 'NettieRowe', 'sadye.zboncak@example.net', '(225) 805-2645', '316 Ewald Dale Suite 155\nElenachester, AR 42358, Lamarville, Jesusside, Bosnia and Herzegovina, 97980-7977, ', 'Deserunt voluptas delectus qui fuga officia.', 8, 'Botble\\Hotel\\Models\\Booking', 8, 'INV-8', 171.00, 0.00, 0.00, 171.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(9, 1, 'EmmaleeLuettgen', 'mullrich@example.net', '+16189070704', '7887 Abigail Park Apt. 148\nWest Jamie, MD 34059-7478, Ilaside, West Bud, Honduras, 95672, ', 'Et occaecati ad a aut qui.', 9, 'Botble\\Hotel\\Models\\Booking', 9, 'INV-9', 171.00, 0.00, 0.00, 171.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(10, 4, 'MaudKihn', 'zhagenes@example.com', '559.584.6173', '8417 Hessel Route\nSouth Juliusside, TX 81587-6527, West Torrancemouth, South Henriettebury, Aruba, 43917, ', 'Saepe quis ut praesentium commodi molestiae.', 10, 'Botble\\Hotel\\Models\\Booking', 10, 'INV-10', 513.00, 0.00, 0.00, 513.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(11, 6, 'KattieMcKenzie', 'oconner.elena@example.org', '+1-231-968-1194', '1560 Boyer Springs\nWest Buck, MO 05191, Lake Jeanie, New Altheachester, Wallis and Futuna, 88049-7025, ', 'Debitis in hic laboriosam aliquid voluptatem aut ipsam consequatur.', 11, 'Botble\\Hotel\\Models\\Booking', 11, 'INV-11', 570.00, 0.00, 0.00, 570.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(12, 2, 'RowlandHermiston', 'ynitzsche@example.com', '+16022504503', '85274 Chandler Junction\nHahnmouth, OH 04228, Balistrerihaven, Andreanemouth, Romania, 02292, ', 'Dolores quisquam eaque excepturi consectetur dolorem.', 12, 'Botble\\Hotel\\Models\\Booking', 12, 'INV-12', 471.00, 0.00, 0.00, 471.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(13, 8, 'DuaneBruen', 'felix20@example.org', '+1 (331) 783-9281', '2038 Manley Heights Apt. 412\nEast Chadmouth, NY 09832-7578, Jedmouth, New Velmamouth, Mexico, 02266-9614, ', 'Qui fugit et ipsa aliquid.', 13, 'Botble\\Hotel\\Models\\Booking', 13, 'INV-13', 195.00, 0.00, 0.00, 195.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(14, 5, 'KenyonKassulke', 'milo80@example.com', '(830) 961-7154', '6109 Franco Harbor Suite 719\nNew Annamarie, NY 71871, Hilarioside, North Aurelie, Marshall Islands, 40051-4579, ', 'Minus omnis quaerat sed enim sint laborum fuga.', 14, 'Botble\\Hotel\\Models\\Booking', 14, 'INV-14', 290.00, 0.00, 0.00, 290.00, 'pending', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(15, 2, 'AdellaReilly', 'treutel.esperanza@example.org', '+1-425-681-3458', '463 Manuela Trail\nPagacshire, ID 62050, North Sim, North Emmettton, Zambia, 95223-3210, ', 'Quia eos ea voluptas accusantium qui.', 15, 'Botble\\Hotel\\Models\\Booking', 15, 'INV-15', 471.00, 0.00, 0.00, 471.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(16, 4, 'AnitaLedner', 'smitham.hermina@example.com', '737-684-3654', '16352 Damion Lodge\nWest Raleigh, RI 52980, Metzhaven, Muhammadside, Cape Verde, 43018-2290, ', 'Sed aut unde delectus omnis et beatae.', 16, 'Botble\\Hotel\\Models\\Booking', 16, 'INV-16', 453.00, 0.00, 0.00, 453.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(17, 5, 'LowellHyatt', 'natalie.gutmann@example.net', '(248) 597-3096', '387 Anderson Plaza Suite 960\nHuelchester, ME 01305, North Wilmer, West Martytown, Yemen, 54216-6167, ', 'Tenetur totam consequatur exercitationem magni nostrum.', 17, 'Botble\\Hotel\\Models\\Booking', 17, 'INV-17', 157.00, 0.00, 0.00, 157.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(18, 11, 'KasandraSpinka', 'rolando.boehm@example.com', '1-425-427-4997', '776 Markus Way Suite 823\nCatherineborough, UT 10725, Schmidtstad, New Jessycaview, Guyana, 05099-9858, ', 'Aspernatur a voluptatibus minus itaque odio nesciunt.', 18, 'Botble\\Hotel\\Models\\Booking', 18, 'INV-18', 380.00, 0.00, 0.00, 380.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(19, 1, 'BertBorer', 'khyatt@example.com', '1-516-385-2337', '622 Cade Lane\nCollinshaven, NY 84582-7008, Leannonfort, Lake Kim, Antarctica (the territory South of 60 deg S), 77513, ', 'Inventore libero harum beatae veniam.', 19, 'Botble\\Hotel\\Models\\Booking', 19, 'INV-19', 178.00, 0.00, 0.00, 178.00, 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(20, 8, 'DulceBecker', 'bridie.moore@example.org', '+1.678.244.4089', '63523 Katrine Fork Suite 036\nEast Ibrahim, FL 81385-1547, Jastmouth, Mohrchester, Niger, 66525, ', 'Quae molestiae ut neque sed consequuntur saepe quia.', 20, 'Botble\\Hotel\\Models\\Booking', 20, 'INV-20', 585.00, 0.00, 0.00, 585.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(21, 8, 'EmmetRomaguera', 'moore.dawn@example.net', '+1-586-895-4017', '92985 Allen Hills Apt. 458\nLeilaniberg, MT 32952-9957, Tristinberg, Amiemouth, Belarus, 86045, ', 'Est sint asperiores molestiae.', 21, 'Botble\\Hotel\\Models\\Booking', 21, 'INV-21', 178.00, 0.00, 0.00, 178.00, 'pending', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(22, 11, 'EmmyArmstrong', 'crystel86@example.com', '(619) 836-1154', '28568 Sherman Fork Apt. 099\nLake Sisterville, MT 43956, New Roscoestad, Saulbury, Paraguay, 83446-0805, ', 'Incidunt culpa doloribus libero nemo quia.', 22, 'Botble\\Hotel\\Models\\Booking', 22, 'INV-22', 534.00, 0.00, 0.00, 534.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(23, 2, 'ScarlettKuhn', 'hgreenholt@example.org', '303-812-7548', '15336 Wiegand Extension Apt. 266\nEast Jena, PA 96538-0569, Ardithtown, New Josh, Venezuela, 40237, ', 'Quia aliquam molestiae nulla ipsa totam.', 23, 'Botble\\Hotel\\Models\\Booking', 23, 'INV-23', 314.00, 0.00, 0.00, 314.00, 'pending', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(24, 8, 'PearlineMorissette', 'enid.jast@example.org', '(212) 389-3826', '1063 Jeff Squares\nPort Murielmouth, UT 76614, South Lacyland, Smithtown, Peru, 00013, ', 'Sed temporibus est consectetur ea.', 24, 'Botble\\Hotel\\Models\\Booking', 24, 'INV-24', 302.00, 0.00, 0.00, 302.00, 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(25, 4, 'JudahEichmann', 'korbin91@example.org', '231.715.9926', '144 Harris Plaza Apt. 062\nEnolachester, WA 55510-2493, Luettgenfort, West Dell, Pitcairn Islands, 61336, ', 'Sed id deserunt in ea amet.', 25, 'Botble\\Hotel\\Models\\Booking', 25, 'INV-25', 151.00, 0.00, 0.00, 151.00, 'completed', '2023-11-14 23:28:23', '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(26, 6, 'KathryneBruen', 'osmith@example.org', '+1 (339) 669-6347', '4774 Regan Road Suite 397\nNorth Kelsie, CT 25113, West Allyberg, North Wallaceshire, Central African Republic, 05781-5046, ', 'Maiores voluptatem dolorem vel non.', 26, 'Botble\\Hotel\\Models\\Booking', 26, 'INV-26', 190.00, 0.00, 0.00, 190.00, 'pending', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(27, 10, 'ElseThiel', 'daisy.raynor@example.com', '(863) 622-7078', '8062 Mraz Stream Apt. 695\nPort Tessie, IA 41267-8246, Sybleside, Gloverburgh, Pakistan, 57433-0078, ', 'Est unde illum exercitationem et.', 27, 'Botble\\Hotel\\Models\\Booking', 27, 'INV-27', 278.00, 0.00, 0.00, 278.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(28, 4, 'CamrynLuettgen', 'wilhelmine.stamm@example.org', '+1-929-882-8665', '4861 Cora Green Apt. 712\nEast Abigalefurt, NV 12733-0876, Madonnashire, West Holly, Poland, 77984-1251, ', 'Illo nemo corrupti neque perspiciatis.', 28, 'Botble\\Hotel\\Models\\Booking', 28, 'INV-28', 195.00, 0.00, 0.00, 195.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(29, 5, 'EdgardoArmstrong', 'drake.schoen@example.org', '+1-469-772-6930', '618 Margarete Road\nCronachester, HI 39198-3849, Elisaberg, Port Sabrina, Mexico, 56586, ', 'Qui mollitia aliquam sit.', 29, 'Botble\\Hotel\\Models\\Booking', 29, 'INV-29', 290.00, 0.00, 0.00, 290.00, 'canceled', NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(30, 8, 'ChadDooley', 'nichole65@example.org', '+1.757.783.9488', '238 Rutherford Island\nTitushaven, AK 82114, Maximillianhaven, North Stephanieburgh, Aruba, 29686-3628, ', 'Consequatur veniam modi ab aut quis nostrum quod.', 30, 'Botble\\Hotel\\Models\\Booking', 30, 'INV-30', 145.00, 0.00, 0.00, 145.00, 'canceled', NULL, '2023-11-14 23:28:24', '2023-11-14 23:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `ht_invoice_items`
--

CREATE TABLE `ht_invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `sub_total` decimal(15,2) UNSIGNED NOT NULL,
  `tax_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(15,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_invoice_items`
--

INSERT INTO `ht_invoice_items` (`id`, `invoice_id`, `name`, `description`, `qty`, `sub_total`, `tax_amount`, `discount_amount`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'President Room', '', 1, 145.00, 0.00, 0.00, 145.00, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(2, 1, 'Satellite TV (extra service)', '', 1, 50.00, 0.00, 0.00, 50.00, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(3, 2, 'Relax Suite', '', 1, 157.00, 0.00, 0.00, 157.00, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(4, 2, 'Wifi (extra service)', '', 1, 100.00, 0.00, 0.00, 100.00, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(5, 3, 'Pendora Fame', '', 1, 190.00, 0.00, 0.00, 190.00, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(6, 3, 'Car Rental (extra service)', '', 1, 30.00, 0.00, 0.00, 30.00, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(7, 4, 'President Room', '', 1, 145.00, 0.00, 0.00, 145.00, '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(8, 4, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(9, 5, 'Junior Suite', '', 1, 195.00, 0.00, 0.00, 195.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(10, 5, 'Sea View (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(11, 6, 'Luxury Hall Of Fame', '', 1, 171.00, 0.00, 0.00, 171.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(12, 6, 'Sea View (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(13, 7, 'Junior Suite', '', 1, 195.00, 0.00, 0.00, 195.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(14, 7, 'Wifi (extra service)', '', 1, 100.00, 0.00, 0.00, 100.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(15, 8, 'Luxury Hall Of Fame', '', 1, 171.00, 0.00, 0.00, 171.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(16, 8, 'Laundry (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(17, 9, 'Luxury Hall Of Fame', '', 1, 171.00, 0.00, 0.00, 171.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(18, 9, 'Sea View (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(19, 10, 'Luxury Hall Of Fame', '', 1, 171.00, 0.00, 0.00, 171.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(20, 10, 'Wifi (extra service)', '', 1, 100.00, 0.00, 0.00, 100.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(21, 11, 'Pendora Fame', '', 1, 190.00, 0.00, 0.00, 190.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(22, 11, 'Sea View (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(23, 12, 'Relax Suite', '', 1, 157.00, 0.00, 0.00, 157.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(24, 12, 'Car Rental (extra service)', '', 1, 30.00, 0.00, 0.00, 30.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(25, 13, 'Junior Suite', '', 1, 195.00, 0.00, 0.00, 195.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(26, 13, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(27, 14, 'President Room', '', 1, 145.00, 0.00, 0.00, 145.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(28, 14, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(29, 15, 'Relax Suite', '', 1, 157.00, 0.00, 0.00, 157.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(30, 15, 'Wifi (extra service)', '', 1, 100.00, 0.00, 0.00, 100.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(31, 16, 'Pacific Room', '', 1, 151.00, 0.00, 0.00, 151.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(32, 16, 'Satellite TV (extra service)', '', 1, 50.00, 0.00, 0.00, 50.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(33, 17, 'Relax Suite', '', 1, 157.00, 0.00, 0.00, 157.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(34, 17, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(35, 18, 'Pendora Fame', '', 1, 190.00, 0.00, 0.00, 190.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(36, 18, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(37, 19, 'Family Suite', '', 1, 178.00, 0.00, 0.00, 178.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(38, 19, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(39, 20, 'Junior Suite', '', 1, 195.00, 0.00, 0.00, 195.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(40, 20, 'Car Rental (extra service)', '', 1, 30.00, 0.00, 0.00, 30.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(41, 21, 'Family Suite', '', 1, 178.00, 0.00, 0.00, 178.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(42, 21, 'Car Rental (extra service)', '', 1, 30.00, 0.00, 0.00, 30.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(43, 22, 'Family Suite', '', 1, 178.00, 0.00, 0.00, 178.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(44, 22, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(45, 23, 'Relax Suite', '', 1, 157.00, 0.00, 0.00, 157.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(46, 23, 'Wifi (extra service)', '', 1, 100.00, 0.00, 0.00, 100.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(47, 24, 'Pacific Room', '', 1, 151.00, 0.00, 0.00, 151.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(48, 24, 'Car Rental (extra service)', '', 1, 30.00, 0.00, 0.00, 30.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(49, 25, 'Pacific Room', '', 1, 151.00, 0.00, 0.00, 151.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(50, 25, 'Laundry (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(51, 26, 'Pendora Fame', '', 1, 190.00, 0.00, 0.00, 190.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(52, 26, 'Satellite TV (extra service)', '', 1, 50.00, 0.00, 0.00, 50.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(53, 27, 'Luxury Suite', '', 1, 139.00, 0.00, 0.00, 139.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(54, 27, 'Wifi (extra service)', '', 1, 100.00, 0.00, 0.00, 100.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(55, 28, 'Junior Suite', '', 1, 195.00, 0.00, 0.00, 195.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(56, 28, 'Laundry (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:23', '2023-11-14 23:28:23'),
(57, 29, 'President Room', '', 1, 145.00, 0.00, 0.00, 145.00, '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(58, 29, 'Breakfast (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(59, 30, 'President Room', '', 1, 145.00, 0.00, 0.00, 145.00, '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(60, 30, 'Sea View (extra service)', '', 1, 10.00, 0.00, 0.00, 10.00, '2023-11-14 23:28:24', '2023-11-14 23:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `ht_places`
--

CREATE TABLE `ht_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_places`
--

INSERT INTO `ht_places` (`id`, `name`, `distance`, `description`, `content`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'The Hatter opened his eyes were looking over their shoulders, that all the things I used to know. Let me think: was I the same thing a bit!\' said the King, the Queen, and Alice joined the procession, wondering very much of it had a vague sort of meaning in it,\' said Alice in a piteous tone. And the Gryphon said, in a few minutes it puffed away without speaking, but at the end of the pack, she could do to ask: perhaps I shall fall right THROUGH the earth! How funny it\'ll seem to come yet, please your Majesty?\' he asked. \'Begin at the moment, \'My dear! I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one quite giddy.\' \'All right,\' said the Hatter. \'He won\'t stand beating. Now, if you don\'t know what a dear quiet thing,\' Alice went on again:-- \'I didn\'t know how to spell \'stupid,\' and that if something wasn\'t done about it in a low voice. \'Not at first, perhaps,\' said the cook. \'Treacle,\' said the March Hare. \'Sixteenth,\' added the March Hare said to herself. \'Shy.', 'places/01.jpg', 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(2, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'At last the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor little feet, I wonder what Latitude or Longitude either, but thought they were all ornamented with hearts. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, who said in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the jury. \'Not yet, not yet!\' the Rabbit was no one could possibly hear you.\' And certainly there was generally a frog or a serpent?\' \'It matters a good many voices all talking at once, and ran off, thinking while she was holding, and she told her sister, as well to say it over) \'--yes, that\'s about the temper of your nose-- What made you so awfully clever?\' \'I have answered three questions, and that you think you could draw treacle out of the well, and noticed that they would go, and making quite a long hookah, and taking not the smallest idea how confusing it is to give the prizes?\' quite a long sleep you\'ve had!\'.', 'places/02.jpg', 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(3, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'Dormouse again, so she set to partners--\' \'--change lobsters, and retire in same order,\' continued the Hatter, with an important air, \'are you all ready? This is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must go back by railway,\' she said to herself, as she could, and soon found herself at last came a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in the pool as it is.\' \'Then you shouldn\'t talk,\' said the Duchess. An invitation for the White Rabbit blew three blasts on the end of the evening, beautiful Soup! Beau--ootiful Soo--oop! Soo--oop of the singers in the middle of the Lobster Quadrille, that she knew that it seemed quite natural to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least idea what you\'re talking about,\' said Alice. \'I don\'t know where Dinn may be,\' said the Caterpillar; and it sat down and looked at the thought that SOMEBODY ought to tell its age, there was room.', 'places/03.jpg', 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(4, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'Alice laughed so much about a foot high: then she looked down into its face to see that she began very cautiously: \'But I don\'t put my arm round your waist,\' the Duchess asked, with another dig of her sharp little chin into Alice\'s head. \'Is that all?\' said Alice, \'and if it likes.\' \'I\'d rather finish my tea,\' said the Duchess; \'and the moral of that is--\"Oh, \'tis love, \'tis love, \'tis love, \'tis love, \'tis love, that makes you forget to talk. I can\'t get out of his pocket, and pulled out a box of comfits, (luckily the salt water had not gone far before they saw the White Rabbit with pink eyes ran close by her. There was not otherwise than what it meant till now.\' \'If that\'s all you know what a dear little puppy it was!\' said Alice, as she went on all the jurymen on to her great delight it fitted! Alice opened the door as you are; secondly, because she was holding, and she went on. \'I do,\' Alice hastily replied; \'at least--at least I know who I WAS when I was a large rabbit-hole.', 'places/04.jpg', 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(5, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'They all made a dreadfully ugly child: but it puzzled her very much pleased at having found out that it seemed quite natural); but when the tide rises and sharks are around, His voice has a timid voice at her as she did it so quickly that the poor little thing sobbed again (or grunted, it was labelled \'ORANGE MARMALADE\', but to get us dry would be worth the trouble of getting her hands on her face brightened up at this moment the door that led into a graceful zigzag, and was going to say,\' said the Duck: \'it\'s generally a frog or a worm. The question is, Who in the same tone, exactly as if she did not answer, so Alice ventured to remark. \'Tut, tut, child!\' said the Queen, and Alice looked at Alice. \'I\'M not a VERY unpleasant state of mind, she turned the corner, but the three gardeners, but she gained courage as she was talking. \'How CAN I have ordered\'; and she had plenty of time as she could, \'If you can\'t think! And oh, my poor little feet, I wonder if I\'ve been changed for any.', 'places/05.jpg', 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(6, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'The Rabbit started violently, dropped the white kid gloves: she took courage, and went on saying to herself, \'in my going out altogether, like a sky-rocket!\' \'So you think you could manage it?) \'And what are they made of?\' \'Pepper, mostly,\' said the Gryphon, and, taking Alice by the officers of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said Alice; \'but a grin without a grin,\' thought Alice; but she did not quite know what it was: she was now only ten inches high, and her face brightened up at the stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went in. The door led right into it. \'That\'s very important,\' the King replied. Here the Queen shouted at the end of the Nile On every golden scale! \'How cheerfully he seems to suit them!\' \'I haven\'t opened it yet,\' said the Duchess: \'flamingoes and mustard both bite. And the muscular strength, which it gave to my right size again; and the game began. Alice.', 'places/06.jpg', 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `ht_places_translations`
--

CREATE TABLE `ht_places_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_places_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `distance` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_rooms`
--

CREATE TABLE `ht_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `images` text DEFAULT NULL,
  `price` decimal(15,0) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_rooms` int(10) UNSIGNED DEFAULT 0,
  `number_of_beds` int(10) UNSIGNED DEFAULT 0,
  `size` int(10) UNSIGNED DEFAULT 0,
  `max_adults` int(11) DEFAULT 0,
  `max_children` int(11) DEFAULT 0,
  `room_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_rooms`
--

INSERT INTO `ht_rooms` (`id`, `name`, `description`, `content`, `is_featured`, `images`, `price`, `currency_id`, `number_of_rooms`, `number_of_beds`, `size`, `max_adults`, `max_children`, `room_category_id`, `tax_id`, `status`, `created_at`, `updated_at`, `order`) VALUES
(1, 'Luxury Hall Of Fame', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 1, '[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', 171, NULL, 7, 4, 186, 2, 3, 1, 1, 'published', '2023-11-14 23:28:10', '2023-11-14 23:28:10', 0),
(2, 'Pendora Fame', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', 190, NULL, 5, 2, 103, 3, 2, 1, 1, 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11', 0),
(3, 'Pacific Room', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 1, '[\"rooms\\/03.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', 151, NULL, 2, 2, 170, 6, 3, 1, 1, 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11', 0),
(4, 'Junior Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 1, '[\"rooms\\/04.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', 195, NULL, 5, 4, 106, 6, 2, 1, 1, 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11', 0),
(5, 'Family Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/05.jpg\"]', 178, NULL, 10, 4, 181, 3, 2, 1, 1, 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11', 0),
(6, 'Relax Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 1, '[\"rooms\\/06.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/01.jpg\"]', 157, NULL, 1, 4, 169, 5, 2, 2, 1, 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11', 0),
(7, 'Luxury Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', 139, NULL, 4, 4, 145, 5, 1, 3, 1, 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11', 0),
(8, 'President Room', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', 145, NULL, 2, 3, 118, 5, 3, 2, 1, 'published', '2023-11-14 23:28:11', '2023-11-14 23:28:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ht_rooms_amenities`
--

CREATE TABLE `ht_rooms_amenities` (
  `amenity_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_rooms_amenities`
--

INSERT INTO `ht_rooms_amenities` (`amenity_id`, `room_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 2, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL),
(1, 5, NULL, NULL),
(1, 6, NULL, NULL),
(1, 7, NULL, NULL),
(1, 8, NULL, NULL),
(2, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 6, NULL, NULL),
(2, 7, NULL, NULL),
(2, 8, NULL, NULL),
(3, 1, NULL, NULL),
(3, 2, NULL, NULL),
(3, 3, NULL, NULL),
(3, 4, NULL, NULL),
(3, 5, NULL, NULL),
(3, 6, NULL, NULL),
(3, 7, NULL, NULL),
(3, 8, NULL, NULL),
(4, 1, NULL, NULL),
(4, 2, NULL, NULL),
(4, 3, NULL, NULL),
(4, 4, NULL, NULL),
(4, 5, NULL, NULL),
(4, 6, NULL, NULL),
(4, 7, NULL, NULL),
(4, 8, NULL, NULL),
(6, 1, NULL, NULL),
(6, 2, NULL, NULL),
(6, 3, NULL, NULL),
(6, 4, NULL, NULL),
(6, 5, NULL, NULL),
(6, 6, NULL, NULL),
(6, 7, NULL, NULL),
(6, 8, NULL, NULL),
(7, 1, NULL, NULL),
(7, 2, NULL, NULL),
(7, 3, NULL, NULL),
(7, 4, NULL, NULL),
(7, 5, NULL, NULL),
(7, 6, NULL, NULL),
(7, 7, NULL, NULL),
(7, 8, NULL, NULL),
(9, 1, NULL, NULL),
(9, 2, NULL, NULL),
(9, 3, NULL, NULL),
(9, 4, NULL, NULL),
(9, 5, NULL, NULL),
(9, 6, NULL, NULL),
(9, 7, NULL, NULL),
(9, 8, NULL, NULL),
(11, 1, NULL, NULL),
(11, 2, NULL, NULL),
(11, 3, NULL, NULL),
(11, 4, NULL, NULL),
(11, 5, NULL, NULL),
(11, 6, NULL, NULL),
(11, 7, NULL, NULL),
(11, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ht_rooms_translations`
--

CREATE TABLE `ht_rooms_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_rooms_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_room_categories`
--

CREATE TABLE `ht_room_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_room_categories`
--

INSERT INTO `ht_room_categories` (`id`, `name`, `status`, `created_at`, `updated_at`, `order`, `is_featured`) VALUES
(1, 'Luxury', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09', 0, 1),
(2, 'Family', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09', 0, 1),
(3, 'Double Bed', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09', 0, 1),
(4, 'Relax', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ht_room_categories_translations`
--

CREATE TABLE `ht_room_categories_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_room_categories_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_room_dates`
--

CREATE TABLE `ht_room_dates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `value` decimal(15,2) DEFAULT NULL,
  `value_type` varchar(60) NOT NULL DEFAULT 'fixed',
  `max_guests` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `note_to_customer` text DEFAULT NULL,
  `note_to_admin` text DEFAULT NULL,
  `number_of_rooms` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_room_reviews`
--

CREATE TABLE `ht_room_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `star` tinyint(4) NOT NULL,
  `content` varchar(500) NOT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_room_reviews`
--

INSERT INTO `ht_room_reviews` (`id`, `customer_id`, `room_id`, `star`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 2, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(2, 4, 2, 4, 'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(3, 5, 1, 4, 'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(4, 6, 4, 5, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(5, 4, 7, 5, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(6, 3, 5, 4, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(7, 10, 8, 4, 'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(8, 2, 2, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(9, 7, 1, 5, 'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(10, 9, 8, 4, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(11, 2, 7, 5, 'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(12, 6, 7, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(13, 5, 3, 4, 'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(14, 6, 1, 4, 'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(15, 1, 6, 4, 'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(16, 11, 5, 4, 'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(17, 3, 3, 5, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(18, 7, 8, 4, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(19, 3, 7, 4, 'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(20, 9, 6, 5, 'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(21, 10, 6, 4, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(22, 9, 5, 4, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(23, 1, 4, 4, 'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(24, 9, 5, 5, 'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(25, 7, 7, 4, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(26, 9, 1, 4, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(27, 1, 1, 4, 'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(28, 3, 7, 4, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(29, 1, 5, 4, 'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(30, 8, 8, 5, 'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(31, 2, 5, 5, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(32, 7, 3, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(33, 9, 4, 4, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(34, 3, 1, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(35, 10, 3, 5, 'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(36, 4, 7, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(37, 5, 5, 5, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(38, 1, 7, 4, 'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(39, 11, 3, 5, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(40, 4, 4, 5, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(41, 7, 2, 5, 'Absolutely loved my experience here! The room was not only clean and comfortable but also offered stunning views of the surrounding area. A perfect choice for a relaxing getaway.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(42, 1, 3, 5, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(43, 2, 3, 5, 'Exceeded all my hopes! The room was not only comfortable but also surprisingly spacious. I loved the attention to cleanliness and the warm, inviting atmosphere.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(44, 9, 5, 4, 'An incredible stay! The room was spacious and beautifully decorated. The amenities provided made me feel right at home. I can’t wait to come back.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(45, 1, 1, 5, 'I was thoroughly impressed with the attention to detail in the room. Everything from the cozy bed to the modern bathroom exceeded my expectations. Highly recommend!', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(46, 8, 1, 4, 'Top-notch accommodations! The room was well-appointed and had all the necessary amenities. The staff was incredibly friendly and made my stay even more enjoyable.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(47, 3, 5, 4, 'I couldn’t have asked for a better place to stay. The room’s design was elegant, and the comfort level was off the charts. Staying here added a layer of luxury to my trip.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(48, 8, 4, 4, 'A hidden gem! The room was a haven of tranquility, providing a peaceful escape from the bustling city. I appreciated the little touches that made my stay truly special.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(49, 6, 3, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16'),
(50, 2, 1, 5, 'Five-star experience all the way. The room was meticulously maintained, and the staff was incredibly helpful throughout my stay. I’m already planning my next visit.', 'approved', '2023-11-14 23:28:16', '2023-11-14 23:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `ht_services`
--

CREATE TABLE `ht_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `price` decimal(15,0) UNSIGNED DEFAULT NULL,
  `price_type` varchar(191) NOT NULL DEFAULT 'once',
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_services`
--

INSERT INTO `ht_services` (`id`, `name`, `description`, `content`, `price`, `price_type`, `currency_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wifi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 100, 'once', NULL, NULL, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(2, 'Car Rental', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 30, 'once', NULL, NULL, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(3, 'Satellite TV', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 50, 'once', NULL, NULL, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(4, 'Sea View', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 10, 'once', NULL, NULL, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(5, 'Laundry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 10, 'once', NULL, NULL, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13'),
(6, 'Breakfast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 10, 'once', NULL, NULL, 'published', '2023-11-14 23:28:13', '2023-11-14 23:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `ht_services_translations`
--

CREATE TABLE `ht_services_translations` (
  `lang_code` varchar(191) NOT NULL,
  `ht_services_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_taxes`
--

CREATE TABLE `ht_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_taxes`
--

INSERT INTO `ht_taxes` (`id`, `title`, `percentage`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 10.000000, 1, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(2, 'None', 0.000000, 2, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17');

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
  `lang_id` bigint(20) UNSIGNED NOT NULL,
  `lang_name` varchar(120) NOT NULL,
  `lang_locale` varchar(20) NOT NULL,
  `lang_code` varchar(20) NOT NULL,
  `lang_flag` varchar(20) DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` bigint(20) UNSIGNED NOT NULL,
  `lang_meta_code` varchar(20) DEFAULT NULL,
  `lang_meta_origin` varchar(32) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_meta`
--

INSERT INTO `language_meta` (`lang_meta_id`, `lang_meta_code`, `lang_meta_origin`, `reference_id`, `reference_type`) VALUES
(1, 'en_US', 'd8816c491f6ac7a1d842e563c1351b67', 1, 'Botble\\Testimonial\\Models\\Testimonial'),
(2, 'en_US', '27c775b131f86d54ec5367c7ffdd4edc', 2, 'Botble\\Testimonial\\Models\\Testimonial'),
(3, 'en_US', '4b2b54664b1feb0f3f165124ac656449', 3, 'Botble\\Testimonial\\Models\\Testimonial'),
(4, 'en_US', '41dc7205192d834c1d9acd7748a99a5c', 1, 'Botble\\Menu\\Models\\MenuLocation'),
(5, 'en_US', 'da54753c39c153af2ba6799b4351350e', 1, 'Botble\\Menu\\Models\\Menu'),
(6, 'en_US', 'd7abcb82f76503a8d7c9b5db3a2206e1', 2, 'Botble\\Menu\\Models\\MenuLocation'),
(7, 'en_US', 'f669868c421eb11525ca2295e2638760', 2, 'Botble\\Menu\\Models\\Menu'),
(8, 'en_US', '55a6bcd0a5cd3e51502c3df3216b578a', 3, 'Botble\\Menu\\Models\\Menu');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `alt` varchar(191) DEFAULT NULL,
  `folder_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `alt`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, '01', '01', 1, 'image/jpeg', 9392, 'news/01.jpg', '[]', '2023-11-14 23:28:08', '2023-11-14 23:28:08', NULL),
(2, 0, '02', '02', 1, 'image/jpeg', 9392, 'news/02.jpg', '[]', '2023-11-14 23:28:08', '2023-11-14 23:28:08', NULL),
(3, 0, '03', '03', 1, 'image/jpeg', 9392, 'news/03.jpg', '[]', '2023-11-14 23:28:09', '2023-11-14 23:28:09', NULL),
(4, 0, '04', '04', 1, 'image/jpeg', 9392, 'news/04.jpg', '[]', '2023-11-14 23:28:09', '2023-11-14 23:28:09', NULL),
(5, 0, '05', '05', 1, 'image/jpeg', 9392, 'news/05.jpg', '[]', '2023-11-14 23:28:09', '2023-11-14 23:28:09', NULL),
(6, 0, '06', '06', 1, 'image/jpeg', 9392, 'news/06.jpg', '[]', '2023-11-14 23:28:09', '2023-11-14 23:28:09', NULL),
(7, 0, '01', '01', 2, 'image/jpeg', 10705, 'rooms/01.jpg', '[]', '2023-11-14 23:28:09', '2023-11-14 23:28:09', NULL),
(8, 0, '02', '02', 2, 'image/jpeg', 10705, 'rooms/02.jpg', '[]', '2023-11-14 23:28:09', '2023-11-14 23:28:09', NULL),
(9, 0, '03', '03', 2, 'image/jpeg', 10705, 'rooms/03.jpg', '[]', '2023-11-14 23:28:10', '2023-11-14 23:28:10', NULL),
(10, 0, '04', '04', 2, 'image/jpeg', 10705, 'rooms/04.jpg', '[]', '2023-11-14 23:28:10', '2023-11-14 23:28:10', NULL),
(11, 0, '05', '05', 2, 'image/jpeg', 10705, 'rooms/05.jpg', '[]', '2023-11-14 23:28:10', '2023-11-14 23:28:10', NULL),
(12, 0, '06', '06', 2, 'image/jpeg', 10705, 'rooms/06.jpg', '[]', '2023-11-14 23:28:10', '2023-11-14 23:28:10', NULL),
(13, 0, '01', '01', 3, 'image/jpeg', 9730, 'foods/01.jpg', '[]', '2023-11-14 23:28:11', '2023-11-14 23:28:11', NULL),
(14, 0, '02', '02', 3, 'image/jpeg', 9730, 'foods/02.jpg', '[]', '2023-11-14 23:28:11', '2023-11-14 23:28:11', NULL),
(15, 0, '03', '03', 3, 'image/jpeg', 9730, 'foods/03.jpg', '[]', '2023-11-14 23:28:11', '2023-11-14 23:28:11', NULL),
(16, 0, '04', '04', 3, 'image/jpeg', 9730, 'foods/04.jpg', '[]', '2023-11-14 23:28:11', '2023-11-14 23:28:11', NULL),
(17, 0, '05', '05', 3, 'image/jpeg', 9730, 'foods/05.jpg', '[]', '2023-11-14 23:28:12', '2023-11-14 23:28:12', NULL),
(18, 0, '06', '06', 3, 'image/jpeg', 9730, 'foods/06.jpg', '[]', '2023-11-14 23:28:12', '2023-11-14 23:28:12', NULL),
(19, 0, '07', '07', 3, 'image/jpeg', 9730, 'foods/07.jpg', '[]', '2023-11-14 23:28:12', '2023-11-14 23:28:12', NULL),
(20, 0, '08', '08', 3, 'image/jpeg', 9730, 'foods/08.jpg', '[]', '2023-11-14 23:28:12', '2023-11-14 23:28:12', NULL),
(21, 0, '09', '09', 3, 'image/jpeg', 9730, 'foods/09.jpg', '[]', '2023-11-14 23:28:12', '2023-11-14 23:28:12', NULL),
(22, 0, '10', '10', 3, 'image/jpeg', 9730, 'foods/10.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(23, 0, '1', '1', 4, 'image/jpeg', 11752, 'customers/1.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(24, 0, '10', '10', 4, 'image/jpeg', 27814, 'customers/10.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(25, 0, '2', '2', 4, 'image/jpeg', 19005, 'customers/2.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(26, 0, '3', '3', 4, 'image/jpeg', 20400, 'customers/3.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(27, 0, '4', '4', 4, 'image/jpeg', 26819, 'customers/4.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(28, 0, '5', '5', 4, 'image/jpeg', 14367, 'customers/5.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(29, 0, '6', '6', 4, 'image/jpeg', 12367, 'customers/6.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(30, 0, '7', '7', 4, 'image/jpeg', 20652, 'customers/7.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(31, 0, '8', '8', 4, 'image/jpeg', 21164, 'customers/8.jpg', '[]', '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(32, 0, '9', '9', 4, 'image/jpeg', 6084, 'customers/9.jpg', '[]', '2023-11-14 23:28:14', '2023-11-14 23:28:14', NULL),
(33, 0, '01', '01', 5, 'image/jpeg', 8787, 'places/01.jpg', '[]', '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL),
(34, 0, '02', '02', 5, 'image/jpeg', 8787, 'places/02.jpg', '[]', '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL),
(35, 0, '03', '03', 5, 'image/jpeg', 8787, 'places/03.jpg', '[]', '2023-11-14 23:28:17', '2023-11-14 23:28:17', NULL),
(36, 0, '04', '04', 5, 'image/jpeg', 8787, 'places/04.jpg', '[]', '2023-11-14 23:28:17', '2023-11-14 23:28:17', NULL),
(37, 0, '05', '05', 5, 'image/jpeg', 8787, 'places/05.jpg', '[]', '2023-11-14 23:28:17', '2023-11-14 23:28:17', NULL),
(38, 0, '06', '06', 5, 'image/jpeg', 8787, 'places/06.jpg', '[]', '2023-11-14 23:28:17', '2023-11-14 23:28:17', NULL),
(39, 0, '01', '01', 6, 'image/png', 9730, 'testimonials/01.png', '[]', '2023-11-14 23:28:17', '2023-11-14 23:28:17', NULL),
(40, 0, '02', '02', 6, 'image/png', 9730, 'testimonials/02.png', '[]', '2023-11-14 23:28:17', '2023-11-14 23:28:17', NULL),
(41, 0, '03', '03', 6, 'image/png', 9730, 'testimonials/03.png', '[]', '2023-11-14 23:28:18', '2023-11-14 23:28:18', NULL),
(42, 0, '01', '01', 7, 'image/jpeg', 9730, 'galleries/01.jpg', '[]', '2023-11-14 23:28:18', '2023-11-14 23:28:18', NULL),
(43, 0, '02', '02', 7, 'image/jpeg', 9730, 'galleries/02.jpg', '[]', '2023-11-14 23:28:18', '2023-11-14 23:28:18', NULL),
(44, 0, '03', '03', 7, 'image/jpeg', 9730, 'galleries/03.jpg', '[]', '2023-11-14 23:28:18', '2023-11-14 23:28:18', NULL),
(45, 0, '04', '04', 7, 'image/jpeg', 9730, 'galleries/04.jpg', '[]', '2023-11-14 23:28:18', '2023-11-14 23:28:18', NULL),
(46, 0, '05', '05', 7, 'image/jpeg', 9730, 'galleries/05.jpg', '[]', '2023-11-14 23:28:18', '2023-11-14 23:28:18', NULL),
(47, 0, '06', '06', 7, 'image/jpeg', 9730, 'galleries/06.jpg', '[]', '2023-11-14 23:28:19', '2023-11-14 23:28:19', NULL),
(48, 0, '07', '07', 7, 'image/jpeg', 9730, 'galleries/07.jpg', '[]', '2023-11-14 23:28:19', '2023-11-14 23:28:19', NULL),
(49, 0, '08', '08', 7, 'image/jpeg', 9730, 'galleries/08.jpg', '[]', '2023-11-14 23:28:19', '2023-11-14 23:28:19', NULL),
(50, 0, '01', '01', 8, 'image/jpeg', 4017, 'general/01.jpg', '[]', '2023-11-14 23:28:20', '2023-11-14 23:28:20', NULL),
(51, 0, '02', '02', 8, 'image/jpeg', 2939, 'general/02.jpg', '[]', '2023-11-14 23:28:20', '2023-11-14 23:28:20', NULL),
(52, 0, '03', '03', 8, 'image/jpeg', 5099, 'general/03.jpg', '[]', '2023-11-14 23:28:20', '2023-11-14 23:28:20', NULL),
(53, 0, '04', '04', 8, 'image/jpeg', 15744, 'general/04.jpg', '[]', '2023-11-14 23:28:20', '2023-11-14 23:28:20', NULL),
(54, 0, 'banner-news', 'banner-news', 8, 'image/jpeg', 8610, 'general/banner-news.jpg', '[]', '2023-11-14 23:28:20', '2023-11-14 23:28:20', NULL),
(55, 0, 'bg', 'bg', 8, 'image/jpeg', 20464, 'general/bg.jpg', '[]', '2023-11-14 23:28:21', '2023-11-14 23:28:21', NULL),
(56, 0, 'favicon', 'favicon', 8, 'image/png', 2386, 'general/favicon.png', '[]', '2023-11-14 23:28:21', '2023-11-14 23:28:21', NULL),
(57, 0, 'logo-white', 'logo-white', 8, 'image/png', 3052, 'general/logo-white.png', '[]', '2023-11-14 23:28:21', '2023-11-14 23:28:21', NULL),
(58, 0, 'logo', 'logo', 8, 'image/png', 3017, 'general/logo.png', '[]', '2023-11-14 23:28:21', '2023-11-14 23:28:21', NULL),
(59, 0, 'video-background-02', 'video-background-02', 8, 'image/jpeg', 19946, 'general/video-background-02.jpg', '[]', '2023-11-14 23:28:21', '2023-11-14 23:28:21', NULL),
(60, 0, 'video-banner-01', 'video-banner-01', 8, 'image/jpeg', 11487, 'general/video-banner-01.jpg', '[]', '2023-11-14 23:28:21', '2023-11-14 23:28:21', NULL),
(61, 0, '04', '04', 9, 'image/jpeg', 27518, 'sliders/04.jpg', '[]', '2023-11-14 23:28:22', '2023-11-14 23:28:22', NULL),
(62, 0, '05', '05', 9, 'image/jpeg', 27518, 'sliders/05.jpg', '[]', '2023-11-14 23:28:22', '2023-11-14 23:28:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'news', 'news', 0, '2023-11-14 23:28:08', '2023-11-14 23:28:08', NULL),
(2, 0, 'rooms', 'rooms', 0, '2023-11-14 23:28:09', '2023-11-14 23:28:09', NULL),
(3, 0, 'foods', 'foods', 0, '2023-11-14 23:28:11', '2023-11-14 23:28:11', NULL),
(4, 0, 'customers', 'customers', 0, '2023-11-14 23:28:13', '2023-11-14 23:28:13', NULL),
(5, 0, 'places', 'places', 0, '2023-11-14 23:28:16', '2023-11-14 23:28:16', NULL),
(6, 0, 'testimonials', 'testimonials', 0, '2023-11-14 23:28:17', '2023-11-14 23:28:17', NULL),
(7, 0, 'galleries', 'galleries', 0, '2023-11-14 23:28:18', '2023-11-14 23:28:18', NULL),
(8, 0, 'general', 'general', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20', NULL),
(9, 0, 'sliders', 'sliders', 0, '2023-11-14 23:28:22', '2023-11-14 23:28:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) NOT NULL,
  `value` text DEFAULT NULL,
  `media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Header menu', 'header-menu', 'published', '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(2, 'Our pages', 'our-pages', 'published', '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(3, 'Services.', 'services', 'published', '2023-11-14 23:28:20', '2023-11-14 23:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(120) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'header-menu', '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(2, 2, 'side-menu', '2023-11-14 23:28:20', '2023-11-14 23:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reference_type` varchar(255) DEFAULT NULL,
  `url` varchar(120) DEFAULT NULL,
  `icon_font` varchar(50) DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) DEFAULT NULL,
  `css_class` varchar(120) DEFAULT NULL,
  `target` varchar(20) NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, NULL, NULL, '/', NULL, 0, 'Home', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(2, 1, 0, NULL, NULL, '/rooms', NULL, 0, 'Rooms', NULL, '_self', 1, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(3, 1, 2, NULL, NULL, '/rooms/luxury-hall-of-fame', NULL, 0, 'Luxury Hall Of Fame', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(4, 1, 2, NULL, NULL, '/rooms/pendora-fame', NULL, 0, 'Pendora Fame', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(5, 1, 0, 2, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'News', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(6, 1, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(7, 2, 0, 6, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About Us', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(8, 2, 0, 5, 'Botble\\Page\\Models\\Page', '/our-gallery', NULL, 0, 'Our Gallery', NULL, '_self', 1, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(9, 2, 8, NULL, NULL, '/galleries/king-bed', NULL, 0, 'King Bed', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(10, 2, 8, NULL, NULL, '/galleries/duplex-restaurant', NULL, 0, 'Duplex Restaurant', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(11, 2, 0, 4, 'Botble\\Page\\Models\\Page', '/restaurant', NULL, 0, 'Restaurant', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(12, 2, 0, 7, 'Botble\\Page\\Models\\Page', '/places', NULL, 0, 'Places', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(13, 2, 0, 8, 'Botble\\Page\\Models\\Page', '/our-offers', NULL, 0, 'Our Offers', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(14, 3, 0, NULL, NULL, '#', NULL, 0, 'Restaurant & Bar', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(15, 3, 0, NULL, NULL, '#', NULL, 0, 'Swimming Pool', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(16, 3, 0, NULL, NULL, '#', NULL, 0, 'Restaurant', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(17, 3, 0, NULL, NULL, '#', NULL, 0, 'Conference Room', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(18, 3, 0, NULL, NULL, '#', NULL, 0, 'Cocktail Party Houses', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(19, 3, 0, NULL, NULL, '#', NULL, 0, 'Gaming Zone', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(20, 3, 0, NULL, NULL, '#', NULL, 0, 'Marriage Party', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(21, 3, 0, NULL, NULL, '#', NULL, 0, 'Party Planning', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20'),
(22, 3, 0, NULL, NULL, '#', NULL, 0, 'Tour Consultancy', NULL, '_self', 0, '2023-11-14 23:28:20', '2023-11-14 23:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` text DEFAULT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(120) NOT NULL,
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
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2021_08_05_134214_fix_social_link_theme_options', 1),
(17, '2022_04_20_100851_add_index_to_media_table', 1),
(18, '2022_04_20_101046_add_index_to_menu_table', 1),
(19, '2022_07_10_034813_move_lang_folder_to_root', 1),
(20, '2022_08_04_051940_add_missing_column_expires_at', 1),
(21, '2022_09_01_000001_create_admin_notifications_tables', 1),
(22, '2022_10_14_024629_drop_column_is_featured', 1),
(23, '2022_11_18_063357_add_missing_timestamp_in_table_settings', 1),
(24, '2022_12_02_093615_update_slug_index_columns', 1),
(25, '2023_01_30_024431_add_alt_to_media_table', 1),
(26, '2023_02_16_042611_drop_table_password_resets', 1),
(27, '2023_04_23_005903_add_column_permissions_to_admin_notifications', 1),
(28, '2023_05_10_075124_drop_column_id_in_role_users_table', 1),
(29, '2023_08_21_090810_make_page_content_nullable', 1),
(30, '2023_09_14_021936_update_index_for_slugs_table', 1),
(31, '2015_06_29_025744_create_audit_history', 2),
(32, '2023_11_14_033417_change_request_column_in_table_audit_histories', 2),
(33, '2015_06_18_033822_create_blog_table', 3),
(34, '2021_02_16_092633_remove_default_value_for_author_type', 3),
(35, '2021_12_03_030600_create_blog_translations', 3),
(36, '2022_04_19_113923_add_index_to_table_posts', 3),
(37, '2023_08_29_074620_make_column_author_id_nullable', 3),
(38, '2016_06_17_091537_create_contacts_table', 4),
(39, '2016_10_13_150201_create_galleries_table', 5),
(40, '2021_12_03_082953_create_gallery_translations', 5),
(41, '2022_04_30_034048_create_gallery_meta_translations_table', 5),
(42, '2023_08_29_075308_make_column_user_id_nullable', 5),
(43, '2020_09_02_033611_hotel_create_table', 6),
(44, '2021_06_25_084734_fix_theme_options', 6),
(45, '2021_08_18_011425_add_column_order_into_rooms', 6),
(46, '2021_08_25_153801_update_table_ht_room_categories', 6),
(47, '2021_08_29_031421_add_translations_tables_for_hotel', 6),
(48, '2023_04_09_083713_update_hotel_customers_table', 6),
(49, '2023_04_17_033111_add_booking_number_of_guests', 6),
(50, '2023_08_11_090349_add_column_password_customers_table', 6),
(51, '2023_08_14_090449_create_reset_password_table', 6),
(52, '2023_08_16_063152_update_ht_booking_room_table', 6),
(53, '2023_08_18_022454_add_new_field_to_ht_customers_table', 6),
(54, '2023_08_23_022361_create_ht_invoices_table', 6),
(55, '2023_08_23_041912_create_hotel_review_table', 6),
(56, '2023_08_23_443543_add_sub_total_to_booking_table', 6),
(57, '2023_08_23_904382_update_field_customer_id_to_invoice_table', 6),
(58, '2023_08_24_534892_add_fields_to_invoice_table', 6),
(59, '2023_08_24_745332_add_field_description_to_invoice_table', 6),
(60, '2023_08_25_061510_add_adjust_type_and_amount_column', 6),
(61, '2023_09_05_083354_create_ht_coupons_table', 6),
(62, '2023_09_06_062315_add_coupon_columns_to_booking_table', 6),
(63, '2023_10_18_024658_add_price_type_column_to_services_table', 6),
(64, '2023_10_24_014726_drop_unique_in_room_name', 6),
(65, '2016_10_03_032336_create_languages_table', 7),
(66, '2023_09_14_022423_add_index_for_language_table', 7),
(67, '2021_10_25_021023_fix-priority-load-for-language-advanced', 8),
(68, '2021_12_03_075608_create_page_translations', 8),
(69, '2023_07_06_011444_create_slug_translations_table', 8),
(70, '2017_10_24_154832_create_newsletter_table', 9),
(71, '2017_05_18_080441_create_payment_tables', 10),
(72, '2021_03_27_144913_add_customer_type_into_table_payments', 10),
(73, '2021_05_24_034720_make_column_currency_nullable', 10),
(74, '2021_08_09_161302_add_metadata_column_to_payments_table', 10),
(75, '2021_10_19_020859_update_metadata_field', 10),
(76, '2022_06_28_151901_activate_paypal_stripe_plugin', 10),
(77, '2022_07_07_153354_update_charge_id_in_table_payments', 10),
(78, '2018_07_09_214610_create_testimonial_table', 11),
(79, '2021_12_03_083642_create_testimonials_translations', 11),
(80, '2016_10_07_193005_create_translations_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` longtext DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `template` varchar(60) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Homepage', '<div>[home-banner][/home-banner]</div><div>[check-availability-form][/check-availability-form]</div><div>[hotel-about title=\"since 1994\" subtitle=\"Situated In Prime Position At The Foot Of The Slopes Of Courchevel Moriond.\" block_icon_1=\"flaticon-coffee\" block_text_1=\"Breakfast\" block_link_1=\"#\" block_icon_2=\"flaticon-air-freight\" block_text_2=\"Airport Pickup\" block_link_2=\"#\" block_icon_3=\"flaticon-marker\" block_text_3=\"City Guide\" block_link_3=\"#\" block_icon_4=\"flaticon-barbecue\" block_text_4=\"BBQ Party\" block_link_4=\"#\" block_icon_5=\"flaticon-hotel\" block_text_5=\"Luxury Room\" block_link_5=\"#\"][/hotel-about]</div><div>[room-categories title=\"Room Type\" subtitle=\"Inspired Loading\" background_image=\"general/bg.jpg\"][/room-categories]</div><div>[hotel-featured-features title=\"The Thin Escape\" subtitle=\"Miranda has everything for your trip & every single things.\" button_text=\"Take a tour\" button_url=\"/rooms\"][/hotel-featured-features]</div><div>[rooms][/rooms]</div><div>[video-introduction title=\"Take a tour\" subtitle=\"Discover Our Underground.\" content=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\" background_image=\"general/video-background-02.jpg\" video_image=\"general/video-banner-01.jpg\" video_url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" button_text=\"Book Now\" button_url=\"/rooms\"][/video-introduction]</div><div>[testimonial title=\"testimonials\" subtitle=\"Client Feedback\"][/testimonial]</div><div>[rooms-introduction title=\"Our rooms\" subtitle=\"Each of our nine lovely double guest rooms feature a private bath, wi-fi, cable television and include full breakfast.\" background_image=\"general/bg.jpg\" first_image=\"general/01.jpg\" second_image=\"general/02.jpg\" third_image=\"general/03.jpg\" button_text=\"Take a tour\" button_url=\"/rooms\"][/rooms-introduction]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\"][/featured-news]</div>', 1, NULL, 'homepage', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(2, 'News', '<p>--</p>', 1, NULL, 'default', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(3, 'Contact', '<div>[contact-info][/contact-info]</div><div>[google-map]19/A, Cirikon City hall Tower New York, NYC[/google-map]</div><div>[contact-form][/contact-form]</div>', 1, NULL, 'no-sidebar', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(4, 'Restaurant', '<div>[food-types][/food-types]</div><div>[foods title=\"Restaurant\" subtitle=\"Trending Menu\"][/foods]</div>', 1, NULL, 'no-sidebar', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(5, 'Our Gallery', '<div>[all-galleries title=\"Gallery\" subtitle=\"Our Rooms\"][/all-galleries]</div>', 1, NULL, 'no-sidebar', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(6, 'About us', '<div>[youtube-video url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" background_image=\"general/04.jpg\"][/youtube-video]</div><p>Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers.</p><div>[hotel-core-features title=\"Facilities\" subtitle=\"Core Features\"][/hotel-core-features]</div><div>[featured-news title=\"Blog\" subtitle=\"News Feeds\"][/featured-news]</div>', 1, NULL, 'no-sidebar', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(7, 'Places', '<div>[places][/places]</div>', 1, NULL, 'no-sidebar', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(8, 'Our Offers', '<div>[our-offers][/our-offers]</div>', 1, NULL, 'no-sidebar', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(9, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'default', NULL, 'published', '2023-11-14 23:28:17', '2023-11-14 23:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) NOT NULL,
  `pages_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `currency` varchar(120) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `charge_id` varchar(255) DEFAULT NULL,
  `payment_channel` varchar(60) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(60) DEFAULT 'pending',
  `payment_type` varchar(191) DEFAULT 'confirm',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT NULL,
  `metadata` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `currency`, `user_id`, `charge_id`, `payment_channel`, `description`, `amount`, `order_id`, `status`, `payment_type`, `customer_id`, `refunded_amount`, `refund_note`, `created_at`, `updated_at`, `customer_type`, `metadata`) VALUES
(1, 'USD', 2, 'oWAo4RN4tmuGnS4R8LJd', 'paypal', NULL, 435.00, 1, 'refunding', 'direct', 2, NULL, NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22', 'Botble\\Hotel\\Models\\Customer', NULL),
(2, 'USD', 3, 'D7WlhNNJE0C078g7ywQ2', 'stripe', NULL, 157.00, 2, 'failed', 'direct', 3, NULL, NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22', 'Botble\\Hotel\\Models\\Customer', NULL),
(3, 'USD', 11, 'PIxhNe6Ah7s6BKFMmLGT', 'paypal', NULL, 380.00, 3, 'fraud', 'direct', 11, NULL, NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22', 'Botble\\Hotel\\Models\\Customer', NULL),
(4, 'USD', 9, 'PUG37CBnb2G47Yg9Bp51', 'bank_transfer', NULL, 435.00, 4, 'refunding', 'direct', 9, NULL, NULL, '2023-11-14 23:28:22', '2023-11-14 23:28:22', 'Botble\\Hotel\\Models\\Customer', NULL),
(5, 'USD', 4, 'U9u2Bx8ffgkO6P9xViBu', 'cod', NULL, 390.00, 5, 'failed', 'direct', 4, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(6, 'USD', 9, 'e88VsHtjQgp16A2BG8ux', 'razorpay', NULL, 342.00, 6, 'refunding', 'direct', 9, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(7, 'USD', 7, 'NTrEA3awiCcIZTYg6aL4', 'paypal', NULL, 585.00, 7, 'failed', 'direct', 7, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(8, 'USD', 10, '53zVeiXdfIpdnDCrflfQ', 'sslcommerz', NULL, 171.00, 8, 'refunded', 'direct', 10, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(9, 'USD', 1, 'KEp9aIGOMB6qTBTMFc88', 'paypal', NULL, 171.00, 9, 'fraud', 'direct', 1, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(10, 'USD', 4, 'fzMKicCi9gfGh5gUg3kt', 'razorpay', NULL, 513.00, 10, 'refunding', 'direct', 4, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(11, 'USD', 6, 'uaapu1r4USEq5WYjXbDL', 'stripe', NULL, 570.00, 11, 'fraud', 'direct', 6, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(12, 'USD', 2, 'SEA1XQmopAs5UtFpDNFK', 'paypal', NULL, 471.00, 12, 'failed', 'direct', 2, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(13, 'USD', 8, 'HmaNVg85Upg7DaCpUMbU', 'cod', NULL, 195.00, 13, 'refunded', 'direct', 8, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(14, 'USD', 5, 'zeF9txLztZdJRh2x68VQ', 'paystack', NULL, 290.00, 14, 'pending', 'direct', 5, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(15, 'USD', 2, 'xw8mke7BQQ3qh90bEyYr', 'sslcommerz', NULL, 471.00, 15, 'refunding', 'direct', 2, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(16, 'USD', 4, 'AdiZ7wE23ma0DyqV9tNI', 'paystack', NULL, 453.00, 16, 'failed', 'direct', 4, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(17, 'USD', 5, 'pCQNl68RKoj02WkWZbIU', 'sslcommerz', NULL, 157.00, 17, 'refunded', 'direct', 5, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(18, 'USD', 11, 'PsG3p9va9Om7qouUQjln', 'paypal', NULL, 380.00, 18, 'refunding', 'direct', 11, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(19, 'USD', 1, 'QdS5H4fQMq5dA9bzLi01', 'cod', NULL, 178.00, 19, 'completed', 'direct', 1, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(20, 'USD', 8, 'yy5rPwUdhgHxhN6IN7fz', 'cod', NULL, 585.00, 20, 'failed', 'direct', 8, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(21, 'USD', 8, 'OonAIbsJZJaP4PCzJOSs', 'bank_transfer', NULL, 178.00, 21, 'pending', 'direct', 8, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(22, 'USD', 11, 'YGMJO0LjIkVcJCFWlZzs', 'stripe', NULL, 534.00, 22, 'refunded', 'direct', 11, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(23, 'USD', 2, 'DOsbXVvLmj2aBbFaPU1J', 'paypal', NULL, 314.00, 23, 'pending', 'direct', 2, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(24, 'USD', 8, 'JKp4HEeKOEgvCESk857q', 'stripe', NULL, 302.00, 24, 'completed', 'direct', 8, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(25, 'USD', 4, 'Mav6sgTqjKl5yeCaZTz8', 'stripe', NULL, 151.00, 25, 'completed', 'direct', 4, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(26, 'USD', 6, '7nBsVjubZfvk1XhwsQgy', 'cod', NULL, 190.00, 26, 'pending', 'direct', 6, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(27, 'USD', 10, 'lBUfvSG3RvqPdSxLkf2Q', 'stripe', NULL, 278.00, 27, 'refunded', 'direct', 10, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(28, 'USD', 4, 'eRPgvCzFsuaLVLpLO1wq', 'paypal', NULL, 195.00, 28, 'failed', 'direct', 4, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(29, 'USD', 5, 'QBS0Ii5EXtx1n42J11qE', 'bank_transfer', NULL, 290.00, 29, 'fraud', 'direct', 5, NULL, NULL, '2023-11-14 23:28:23', '2023-11-14 23:28:23', 'Botble\\Hotel\\Models\\Customer', NULL),
(30, 'USD', 8, 'OMgNcMGjIQ5KP9whsC9n', 'bank_transfer', NULL, 145.00, 30, 'failed', 'direct', 8, NULL, NULL, '2023-11-14 23:28:24', '2023-11-14 23:28:24', 'Botble\\Hotel\\Models\\Customer', NULL);

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, 'Each of our 8 double rooms has its own distinct.', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/01.jpg', 2375, NULL, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(2, 'Essential Qualities of Highly Successful Music', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/02.jpg', 586, NULL, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(3, '9 Things I Love About Shaving My Head', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/03.jpg', 2183, NULL, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(4, 'Why Teamwork Really Makes The Dream Work', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/04.jpg', 387, NULL, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(5, 'The World Caters to Average People', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/05.jpg', 728, NULL, '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(6, 'The litigants on the screen are not actors', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/04.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/05.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/06.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/06.jpg', 724, NULL, '2023-11-14 23:28:09', '2023-11-14 23:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translations`
--

CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) NOT NULL,
  `posts_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`category_id`, `post_id`) VALUES
(1, 1),
(4, 1),
(1, 2),
(3, 2),
(2, 3),
(3, 3),
(2, 4),
(3, 4),
(1, 5),
(3, 5),
(2, 6),
(3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`tag_id`, `post_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) NOT NULL,
  `revisionable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `key` varchar(191) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) NOT NULL,
  `name` varchar(120) NOT NULL,
  `permissions` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', '{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"room.index\":true,\"room.create\":true,\"room.edit\":true,\"room.destroy\":true,\"amenity.index\":true,\"amenity.create\":true,\"amenity.edit\":true,\"amenity.destroy\":true,\"food.index\":true,\"food.create\":true,\"food.edit\":true,\"food.destroy\":true,\"food-type.index\":true,\"food-type.create\":true,\"food-type.edit\":true,\"food-type.destroy\":true,\"booking.index\":true,\"booking.edit\":true,\"booking.destroy\":true,\"booking.reports.index\":true,\"booking-address.index\":true,\"booking-address.create\":true,\"booking-address.edit\":true,\"booking-address.destroy\":true,\"booking-room.index\":true,\"booking-room.create\":true,\"booking-room.edit\":true,\"booking-room.destroy\":true,\"customer.index\":true,\"customer.create\":true,\"customer.edit\":true,\"customer.destroy\":true,\"room-category.index\":true,\"room-category.create\":true,\"room-category.edit\":true,\"room-category.destroy\":true,\"feature.index\":true,\"feature.create\":true,\"feature.edit\":true,\"feature.destroy\":true,\"service.index\":true,\"service.create\":true,\"service.edit\":true,\"service.destroy\":true,\"place.index\":true,\"place.create\":true,\"place.edit\":true,\"place.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"invoice.template\":true,\"coupons.index\":true,\"coupons.create\":true,\"coupons.edit\":true,\"coupons.destroy\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}', 'Admin users role', 1, 2, 2, '2023-11-14 23:28:20', '2023-11-14 23:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2, 'api_enabled', '0', NULL, '2023-11-22 16:20:23'),
(3, 'activated_plugins', '[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"gallery\",\"hotel\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]', NULL, '2023-11-22 16:20:23'),
(6, 'language_hide_default', '1', NULL, '2023-11-22 16:20:23'),
(8, 'language_display', 'all', NULL, '2023-11-22 16:20:23'),
(9, 'language_hide_languages', '[]', NULL, '2023-11-22 16:20:23'),
(10, 'media_random_hash', '1d63f6029f3bb95ab3ab83d1272075c7', NULL, '2023-11-22 16:20:23'),
(11, 'theme', 'miranda', NULL, '2023-11-22 16:20:23'),
(12, 'show_admin_bar', '1', NULL, '2023-11-22 16:20:23'),
(13, 'language_switcher_display', 'dropdown', NULL, '2023-11-22 16:20:23'),
(14, 'admin_favicon', 'general/favicon.png', NULL, '2023-11-22 16:20:23'),
(15, 'admin_logo', 'general/logo-white.png', NULL, '2023-11-22 16:20:23'),
(16, 'permalink-botble-blog-models-post', 'news', NULL, '2023-11-22 16:20:23'),
(17, 'permalink-botble-blog-models-category', 'news', NULL, '2023-11-22 16:20:23'),
(18, 'payment_cod_status', '1', NULL, '2023-11-22 16:20:23'),
(19, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, '2023-11-22 16:20:23'),
(20, 'payment_bank_transfer_status', '1', NULL, '2023-11-22 16:20:23'),
(21, 'payment_bank_transfer_description', 'Please send money to our bank account: ACB - 69270 213 19.', NULL, '2023-11-22 16:20:23'),
(22, 'payment_stripe_payment_type', 'stripe_checkout', NULL, '2023-11-22 16:20:23'),
(23, 'theme-miranda-site_title', 'Hotel qutell', NULL, '2023-11-22 16:20:23'),
(24, 'theme-miranda-copyright', '©2023 Miranda. All right reserved.', NULL, '2023-11-22 16:20:23'),
(25, 'theme-miranda-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies ', NULL, '2023-11-22 16:20:23'),
(26, 'theme-miranda-cookie_consent_learn_more_url', '/cookie-policy', NULL, '2023-11-22 16:20:23'),
(27, 'theme-miranda-cookie_consent_learn_more_text', 'Cookie Policy', NULL, '2023-11-22 16:20:23'),
(28, 'theme-miranda-homepage_id', '1', NULL, '2023-11-22 16:20:23'),
(29, 'theme-miranda-blog_page_id', '2', NULL, '2023-11-22 16:20:23'),
(30, 'theme-miranda-logo', 'general/logo.png', NULL, '2023-11-22 16:20:23'),
(31, 'theme-miranda-logo_white', 'general/logo-white.png', NULL, '2023-11-22 16:20:23'),
(32, 'theme-miranda-favicon', 'general/favicon.png', NULL, '2023-11-22 16:20:23'),
(33, 'theme-miranda-email', 'info@webmail.com', NULL, '2023-11-22 16:20:23'),
(34, 'theme-miranda-address', '14/A, Miranda City, NYC', NULL, '2023-11-22 16:20:23'),
(35, 'theme-miranda-hotline', '+908 987 877 09', NULL, '2023-11-22 16:20:23'),
(36, 'theme-miranda-news_banner', 'general/banner-news.jpg', NULL, '2023-11-22 16:20:23'),
(37, 'theme-miranda-rooms_banner', 'general/banner-news.jpg', NULL, '2023-11-22 16:20:23'),
(38, 'theme-miranda-term_of_use_url', '#', NULL, '2023-11-22 16:20:23'),
(39, 'theme-miranda-privacy_policy_url', '#', NULL, '2023-11-22 16:20:23'),
(40, 'theme-miranda-preloader_enabled', 'no', NULL, '2023-11-22 16:20:23'),
(41, 'theme-miranda-about-us', 'Lorem ipsum dolor sit amet, consect etur adipisicing elit, sed doing eius mod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat ion ullamco laboris nisi.', NULL, '2023-11-22 16:20:23'),
(42, 'theme-miranda-hotel_rules', '<ul><li>No smoking, parties or events.</li><li>Check-in time from 2 PM, check-out by 10 AM.</li><li>Time to time car parking</li><li>Download Our minimal app</li><li>Browse regular our website</li></ul>', NULL, '2023-11-22 16:20:23'),
(43, 'theme-miranda-cancellation', '<p>Phasellus volutpat neque a tellus venenatis, a euismod augue facilisis. Fusce ut metus mattis, consequat metus nec, luctus lectus. Pellentesque orci quis hendrerit sed eu dolor. <strong>Cancel up</strong> to <strong>14 days</strong> to get a full refund.</p>', NULL, '2023-11-22 16:20:23'),
(44, 'theme-miranda-slider-image-1', 'sliders/04.jpg', NULL, '2023-11-22 16:20:23'),
(45, 'theme-miranda-slider-title-1', 'The ultimate luxury experience', NULL, '2023-11-22 16:20:23'),
(46, 'theme-miranda-slider-description-1', '<p>The Perfect<br>Base For You</p>', NULL, '2023-11-22 16:20:23'),
(47, 'theme-miranda-slider-primary-button-text-1', 'Take A tour', NULL, '2023-11-22 16:20:23'),
(48, 'theme-miranda-slider-primary-button-url-1', '/rooms', NULL, '2023-11-22 16:20:23'),
(49, 'theme-miranda-slider-secondary-button-text-1', 'Learn more', NULL, '2023-11-22 16:20:23'),
(50, 'theme-miranda-slider-secondary-button-url-1', '/about-us', NULL, '2023-11-22 16:20:23'),
(51, 'theme-miranda-slider-image-2', 'sliders/05.jpg', NULL, '2023-11-22 16:20:23'),
(52, 'theme-miranda-slider-title-2', 'The ultimate luxury experience', NULL, '2023-11-22 16:20:23'),
(53, 'theme-miranda-slider-description-2', '<p>The Perfect<br>Base For You</p>', NULL, '2023-11-22 16:20:23'),
(54, 'theme-miranda-slider-primary-button-text-2', 'Take A tour', NULL, '2023-11-22 16:20:23'),
(55, 'theme-miranda-slider-primary-button-url-2', '/rooms', NULL, '2023-11-22 16:20:23'),
(56, 'theme-miranda-slider-secondary-button-text-2', 'Learn more', NULL, '2023-11-22 16:20:23'),
(57, 'theme-miranda-slider-secondary-button-url-2', '/about-us', NULL, '2023-11-22 16:20:23'),
(58, 'theme-miranda-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Behance\"},{\"key\":\"social-icon\",\"value\":\"fab fa-behance\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.behance.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"fab fa-linkedin\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.linkedin.com\\/\"}]]', NULL, '2023-11-22 16:20:23'),
(59, 'theme-miranda-primary_color', '#578AA7', NULL, '2023-11-22 16:20:23'),
(60, 'theme-miranda-primary_font', 'Archivo', NULL, '2023-11-22 16:20:23'),
(61, 'theme-miranda-admin_logo', 'general/logo-white.png', NULL, '2023-11-22 16:20:23'),
(62, 'theme-miranda-admin_favicon', 'general/favicon.png', NULL, '2023-11-22 16:20:23'),
(63, 'is_completed_get_started', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL,
  `reference_type` varchar(255) NOT NULL,
  `prefix` varchar(120) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, 'general', 1, 'Botble\\Blog\\Models\\Category', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(2, 'hotel', 2, 'Botble\\Blog\\Models\\Category', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(3, 'booking', 3, 'Botble\\Blog\\Models\\Category', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(4, 'resort', 4, 'Botble\\Blog\\Models\\Category', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(5, 'travel', 5, 'Botble\\Blog\\Models\\Category', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(6, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(7, 'hotel', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(8, 'booking', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(9, 'resort', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(10, 'travel', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(11, 'each-of-our-8-double-rooms-has-its-own-distinct', 1, 'Botble\\Blog\\Models\\Post', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(12, 'essential-qualities-of-highly-successful-music', 2, 'Botble\\Blog\\Models\\Post', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(13, '9-things-i-love-about-shaving-my-head', 3, 'Botble\\Blog\\Models\\Post', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(14, 'why-teamwork-really-makes-the-dream-work', 4, 'Botble\\Blog\\Models\\Post', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(15, 'the-world-caters-to-average-people', 5, 'Botble\\Blog\\Models\\Post', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(16, 'the-litigants-on-the-screen-are-not-actors', 6, 'Botble\\Blog\\Models\\Post', 'news', '2023-11-14 23:28:09', '2023-11-14 23:28:20'),
(17, 'luxury-hall-of-fame', 1, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(18, 'pendora-fame', 2, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(19, 'pacific-room', 3, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(20, 'junior-suite', 4, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(21, 'family-suite', 5, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(22, 'relax-suite', 6, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(23, 'luxury-suite', 7, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(24, 'president-room', 8, 'Botble\\Hotel\\Models\\Room', 'rooms', '2023-11-14 23:28:11', '2023-11-14 23:28:11'),
(25, 'duplex-restaurant', 1, 'Botble\\Hotel\\Models\\Place', 'places', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(26, 'duplex-restaurant', 2, 'Botble\\Hotel\\Models\\Place', 'places', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(27, 'duplex-restaurant', 3, 'Botble\\Hotel\\Models\\Place', 'places', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(28, 'duplex-restaurant', 4, 'Botble\\Hotel\\Models\\Place', 'places', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(29, 'duplex-restaurant', 5, 'Botble\\Hotel\\Models\\Place', 'places', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(30, 'duplex-restaurant', 6, 'Botble\\Hotel\\Models\\Place', 'places', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(31, 'homepage', 1, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(32, 'news', 2, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(33, 'contact', 3, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(34, 'restaurant', 4, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(35, 'our-gallery', 5, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(36, 'about-us', 6, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(37, 'places', 7, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(38, 'our-offers', 8, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(39, 'cookie-policy', 9, 'Botble\\Page\\Models\\Page', '', '2023-11-14 23:28:17', '2023-11-14 23:28:17'),
(40, 'duplex-restaurant', 1, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(41, 'luxury-room', 2, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(42, 'pacific-room', 3, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(43, 'family-room', 4, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(44, 'king-bed', 5, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2023-11-14 23:28:19', '2023-11-14 23:28:19'),
(45, 'special-foods', 6, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2023-11-14 23:28:19', '2023-11-14 23:28:19');

-- --------------------------------------------------------

--
-- Table structure for table `slugs_translations`
--

CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) NOT NULL,
  `slugs_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `prefix` varchar(120) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_type` varchar(255) NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) DEFAULT '',
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(2, 'Hotel', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(3, 'Booking', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(4, 'Resort', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09'),
(5, 'Travel', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2023-11-14 23:28:09', '2023-11-14 23:28:09');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) NOT NULL,
  `tags_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL,
  `status` varchar(60) NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `content`, `image`, `company`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adam Williams', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'testimonials/01.png', 'CEO Of Microsoft', 'published', '2023-11-14 23:28:18', '2023-11-14 23:28:18'),
(2, 'Retha Deowalim', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'testimonials/02.png', 'CEO Of Apple', 'published', '2023-11-14 23:28:18', '2023-11-14 23:28:18'),
(3, 'Sam J. Wasim', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', 'testimonials/03.png', 'Pio Founder', 'published', '2023-11-14 23:28:18', '2023-11-14 23:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials_translations`
--

CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(191) NOT NULL,
  `testimonials_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(12, 1, 'en', 'validation', 'accepted_if', 'The :attribute must be accepted when :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(13, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(14, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(15, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(16, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(17, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(18, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(19, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(20, 1, 'en', 'validation', 'ascii', 'The :attribute field must only contain single-byte alphanumeric characters and symbols.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(21, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(22, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(23, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(24, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(25, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(26, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(27, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(28, 1, 'en', 'validation', 'can', 'The :attribute field contains an unauthorized value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(29, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(30, 1, 'en', 'validation', 'current_password', 'The password is incorrect.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(31, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(32, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(33, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(34, 1, 'en', 'validation', 'decimal', 'The :attribute field must have :decimal decimal places.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(35, 1, 'en', 'validation', 'declined', 'The :attribute must be declined.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(36, 1, 'en', 'validation', 'declined_if', 'The :attribute must be declined when :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(37, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(38, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(39, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(40, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(41, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(42, 1, 'en', 'validation', 'doesnt_end_with', 'The :attribute field must not end with one of the following: :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(43, 1, 'en', 'validation', 'doesnt_start_with', 'The :attribute may not start with one of the following: :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(44, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(45, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(46, 1, 'en', 'validation', 'enum', 'The selected :attribute is invalid.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(47, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(48, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(49, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(50, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(51, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(52, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(53, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(54, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(55, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal to :value kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(56, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal to :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(57, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal to :value characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(58, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(59, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(60, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(61, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(62, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(63, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(64, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(65, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(66, 1, 'en', 'validation', 'lowercase', 'The :attribute field must be lowercase.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(67, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(68, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(69, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(70, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(71, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(72, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal to :value kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(73, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal to :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(74, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal to :value characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(75, 1, 'en', 'validation', 'mac_address', 'The :attribute must be a valid MAC address.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(76, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(77, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(78, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(79, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(80, 1, 'en', 'validation', 'max_digits', 'The :attribute field must not have more than :max digits.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(81, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(82, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(83, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(84, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(85, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(86, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(87, 1, 'en', 'validation', 'min_digits', 'The :attribute field must have at least :min digits.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(88, 1, 'en', 'validation', 'missing', 'The :attribute field must be missing.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(89, 1, 'en', 'validation', 'missing_if', 'The :attribute field must be missing when :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(90, 1, 'en', 'validation', 'missing_unless', 'The :attribute field must be missing unless :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(91, 1, 'en', 'validation', 'missing_with', 'The :attribute field must be missing when :values is present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(92, 1, 'en', 'validation', 'missing_with_all', 'The :attribute field must be missing when :values are present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(93, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(94, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(95, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(96, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(97, 1, 'en', 'validation', 'password.letters', 'The :attribute must contain at least one letter.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(98, 1, 'en', 'validation', 'password.mixed', 'The :attribute must contain at least one uppercase and one lowercase letter.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(99, 1, 'en', 'validation', 'password.numbers', 'The :attribute must contain at least one number.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(100, 1, 'en', 'validation', 'password.symbols', 'The :attribute must contain at least one symbol.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(101, 1, 'en', 'validation', 'password.uncompromised', 'The given :attribute has appeared in a data leak. Please choose a different :attribute.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(102, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(103, 1, 'en', 'validation', 'present_if', 'The :attribute field must be present when :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(104, 1, 'en', 'validation', 'present_unless', 'The :attribute field must be present unless :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(105, 1, 'en', 'validation', 'present_with', 'The :attribute field must be present when :values is present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(106, 1, 'en', 'validation', 'present_with_all', 'The :attribute field must be present when :values are present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(107, 1, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(108, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(109, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(110, 1, 'en', 'validation', 'prohibits', 'The :attribute field prohibits :other from being present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(111, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(112, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(113, 1, 'en', 'validation', 'required_array_keys', 'The :attribute field must contain entries for: :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(114, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(115, 1, 'en', 'validation', 'required_if_accepted', 'The :attribute field is required when :other is accepted.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(116, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(117, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(118, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(119, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(120, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(121, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(122, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(123, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(124, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(125, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(126, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(127, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(128, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid timezone.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(129, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(130, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(131, 1, 'en', 'validation', 'uppercase', 'The :attribute field must be uppercase.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(132, 1, 'en', 'validation', 'url', 'The :attribute must be a valid URL.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(133, 1, 'en', 'validation', 'ulid', 'The :attribute field must be a valid ULID.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(134, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(135, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(136, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(137, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(138, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(139, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(140, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(141, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(142, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(143, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(144, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(145, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(146, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(147, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(148, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(149, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(150, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(151, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(152, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(153, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(154, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(155, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(156, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(157, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(158, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(159, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(160, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(161, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(162, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(163, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(164, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(165, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(166, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(167, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(168, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(169, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(170, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(171, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(172, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(173, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(174, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(175, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(176, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(177, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(178, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(179, 1, 'en', 'core/acl/auth', 'settings.email.title', 'ACL', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(180, 1, 'en', 'core/acl/auth', 'settings.email.description', 'ACL email configuration', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(181, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(182, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(183, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(184, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(185, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(186, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(187, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(188, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(189, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(190, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(191, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(192, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(193, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(194, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(195, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(196, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(197, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(198, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(199, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(200, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(201, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(202, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(203, 1, 'en', 'core/acl/permissions', 'details', 'Details \":name\"', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(204, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(205, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(206, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(207, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(208, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(209, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(210, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(211, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(212, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(213, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(214, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(215, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(216, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(217, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(218, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(219, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(220, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(221, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(222, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(223, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(224, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2023-11-14 23:28:24', '2023-11-14 23:28:24'),
(225, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(226, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(227, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(228, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(229, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(230, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(231, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(232, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(233, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(234, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(235, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(236, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(237, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(238, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(239, 1, 'en', 'core/acl/users', 'email', 'Email', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(240, 1, 'en', 'core/acl/users', 'role', 'Role', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(241, 1, 'en', 'core/acl/users', 'username', 'Username', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(242, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(243, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(244, 1, 'en', 'core/acl/users', 'message', 'Message', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(245, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(246, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(247, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(248, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(249, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(250, 1, 'en', 'core/acl/users', 'password', 'Password', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(251, 1, 'en', 'core/acl/users', 'save', 'Save', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(252, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(253, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(254, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(255, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(256, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(257, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(258, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(259, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(260, 1, 'en', 'core/acl/users', 'close', 'Close', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(261, 1, 'en', 'core/acl/users', 'update', 'Update', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(262, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(263, 1, 'en', 'core/acl/users', 'users', 'Users', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(264, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(265, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(266, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(267, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(268, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(269, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(270, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(271, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(272, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(273, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(274, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(275, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(276, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(277, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(278, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(279, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(280, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(281, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(282, 1, 'en', 'core/base/base', 'yes', 'Yes', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(283, 1, 'en', 'core/base/base', 'no', 'No', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(284, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(285, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(286, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(287, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(288, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(289, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(290, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(291, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(292, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(293, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(294, 1, 'en', 'core/base/base', 'email_template.twig.tag.apply', 'The apply tag allows you to apply Twig filters', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(295, 1, 'en', 'core/base/base', 'email_template.twig.tag.for', 'Loop over each item in a sequence', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(296, 1, 'en', 'core/base/base', 'email_template.twig.tag.if', 'The if statement in Twig is comparable with the if statements of PHP', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(297, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(298, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(299, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(300, 1, 'en', 'core/base/base', 'image', 'Image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(301, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(302, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(303, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(304, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(305, 1, 'en', 'core/base/base', 'tools', 'Tools', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(306, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(307, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(308, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(309, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(310, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(311, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(312, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(313, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(314, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(315, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(316, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(317, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(318, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(319, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(320, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(321, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(322, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(323, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(324, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(325, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(326, 1, 'en', 'core/base/enums', 'system_updater_steps.download', 'Download update files', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(327, 1, 'en', 'core/base/enums', 'system_updater_steps.update_files', 'Update system files', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(328, 1, 'en', 'core/base/enums', 'system_updater_steps.update_database', 'Update databases', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(329, 1, 'en', 'core/base/enums', 'system_updater_steps.publish_core_assets', 'Publish core assets', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(330, 1, 'en', 'core/base/enums', 'system_updater_steps.publish_packages_assets', 'Publish packages assets', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(331, 1, 'en', 'core/base/enums', 'system_updater_steps.clean_up', 'Clean up system update files', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(332, 1, 'en', 'core/base/enums', 'system_updater_steps.done', 'System updated successfully', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(333, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.download', 'Downloading update files...', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(334, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.update_files', 'Updating system files...', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(335, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.update_database', 'Updating databases...', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(336, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.publish_core_assets', 'Publishing core assets...', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(337, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.publish_packages_assets', 'Publishing packages assets...', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(338, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.clean_up', 'Cleaning up system update files...', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(339, 1, 'en', 'core/base/enums', 'system_updater_steps.messages.done', 'Done! Your browser will be refreshed in 30 seconds.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(340, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.download', 'Could not download update files', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(341, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.update_files', 'Could not update system files', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(342, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.update_database', 'Could not update databases', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(343, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.publish_core_assets', 'Could not publish core assets', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(344, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.publish_packages_assets', 'Could not publish packages assets', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(345, 1, 'en', 'core/base/enums', 'system_updater_steps.failed_messages.clean_up', 'Could not clean up system update files', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(346, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.download', 'Downloaded update files successfully.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(347, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.update_files', 'Updated system files successfully.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(348, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.update_database', 'Updated databases successfully.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(349, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.publish_core_assets', 'Published core assets successfully.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(350, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.publish_packages_assets', 'Published packages assets successfully.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(351, 1, 'en', 'core/base/enums', 'system_updater_steps.success_messages.clean_up', 'Cleaned up system update files successfully.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(352, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(353, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(354, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(355, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(356, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(357, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(358, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(359, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\":link\">clicking here</a>.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(360, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(361, 1, 'en', 'core/base/errors', 'results_not_found', 'Results not found!', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(362, 1, 'en', 'core/base/errors', 'error_when_sending_email', 'Error when sending email. Something wrong with your email settings in Admin → Settings → Email, please check your settings again.', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(363, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2023-11-14 23:28:25', '2023-11-14 23:28:25');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(364, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(365, 1, 'en', 'core/base/forms', 'save', 'Save & Exit', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(366, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(367, 1, 'en', 'core/base/forms', 'image', 'Image', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(368, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(369, 1, 'en', 'core/base/forms', 'create', 'Create', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(370, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(371, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(372, 1, 'en', 'core/base/forms', 'ok', 'OK', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(373, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(374, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(375, 1, 'en', 'core/base/forms', 'template', 'Template', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(376, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(377, 1, 'en', 'core/base/forms', 'file', 'File', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(378, 1, 'en', 'core/base/forms', 'content', 'Content', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(379, 1, 'en', 'core/base/forms', 'description', 'Description', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(380, 1, 'en', 'core/base/forms', 'name', 'Name', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(381, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(382, 1, 'en', 'core/base/forms', 'title', 'Title', '2023-11-14 23:28:25', '2023-11-14 23:28:25'),
(383, 1, 'en', 'core/base/forms', 'value', 'Value', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(384, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(385, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(386, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(387, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(388, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(389, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(390, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(391, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(392, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(393, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(394, 1, 'en', 'core/base/forms', 'update', 'Update', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(395, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(396, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(397, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(398, 1, 'en', 'core/base/forms', 'order', 'Order', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(399, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(400, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(401, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(402, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(403, 1, 'en', 'core/base/forms', 'add', 'Add', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(404, 1, 'en', 'core/base/forms', 'link', 'Link', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(405, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(406, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(407, 1, 'en', 'core/base/forms', 'expand_all', 'Expand all', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(408, 1, 'en', 'core/base/forms', 'collapse_all', 'Collapse all', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(409, 1, 'en', 'core/base/forms', 'view_new_tab', 'Open in new tab', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(410, 1, 'en', 'core/base/forms', 'view_preview_image', 'View preview image', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(411, 1, 'en', 'core/base/forms', 'edit_item', 'Edit \":name\"', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(412, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(413, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(414, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(415, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(416, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(417, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(418, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(419, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(420, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(421, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(422, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(423, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(424, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(425, 1, 'en', 'core/base/layouts', 'home', 'Home', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(426, 1, 'en', 'core/base/layouts', 'search', 'Search', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(427, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(428, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(429, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(430, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(431, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(432, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(433, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(434, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(435, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(436, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(437, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(438, 1, 'en', 'core/base/notices', 'error', 'Error!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(439, 1, 'en', 'core/base/notices', 'success', 'Success!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(440, 1, 'en', 'core/base/notices', 'info', 'Info!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(441, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(442, 1, 'en', 'core/base/notifications', 'notifications', 'Notifications', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(443, 1, 'en', 'core/base/notifications', 'mark_as_read', 'Mark as read', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(444, 1, 'en', 'core/base/notifications', 'clear', 'Clear', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(445, 1, 'en', 'core/base/notifications', 'no_notification_here', 'No notifications here', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(446, 1, 'en', 'core/base/notifications', 'please_check_again_later', 'Please check again later', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(447, 1, 'en', 'core/base/notifications', 'view_more', 'View more...', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(448, 1, 'en', 'core/base/notifications', 'view', 'View', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(449, 1, 'en', 'core/base/notifications', 'show_more', 'Show more', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(450, 1, 'en', 'core/base/notifications', 'show_less', 'Show less', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(451, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(452, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(453, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(454, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(455, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(456, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(457, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(458, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(459, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(460, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(461, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(462, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(463, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(464, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(465, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(466, 1, 'en', 'core/base/system', 'user.email', 'Email', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(467, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(468, 1, 'en', 'core/base/system', 'user.username', 'Username', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(469, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(470, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(471, 1, 'en', 'core/base/system', 'user.create', 'Create', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(472, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(473, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(474, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(475, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(476, 1, 'en', 'core/base/system', 'options.info', 'System information', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(477, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(478, 1, 'en', 'core/base/system', 'info.title', 'System information', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(479, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(480, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(481, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(482, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(483, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(484, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(485, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(486, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(487, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(488, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(489, 1, 'en', 'core/base/system', 'debug_mode_off', 'Debug Mode Off', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(490, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(491, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(492, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(493, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(494, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(495, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(496, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(497, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(498, 1, 'en', 'core/base/system', 'database', 'Database', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(499, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(500, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(501, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(502, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(503, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(504, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(505, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2023-11-14 23:28:26', '2023-11-14 23:28:26'),
(506, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(507, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(508, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(509, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(510, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(511, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(512, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(513, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(514, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(515, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(516, 1, 'en', 'core/base/system', 'version', 'Version', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(517, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(518, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(519, 1, 'en', 'core/base/system', 'updater', 'System Updater', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(520, 1, 'en', 'core/base/system', 'zip', 'Zip Ext', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(521, 1, 'en', 'core/base/system', 'iconv', 'Iconv Ext', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(522, 1, 'en', 'core/base/system', 'memory_limit', 'Memory limit', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(523, 1, 'en', 'core/base/system', 'max_execution_time', 'Max execution time (s)', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(524, 1, 'en', 'core/base/system', 'allow_url_fopen_enabled', 'allow_url_fopen enabled', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(525, 1, 'en', 'core/base/system', 'cleanup.title', 'Cleanup System', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(526, 1, 'en', 'core/base/system', 'cleanup.table.name', 'Table Name', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(527, 1, 'en', 'core/base/system', 'cleanup.table.count', 'Records', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(528, 1, 'en', 'core/base/system', 'cleanup.backup_alert', 'Please backup your database and script files before cleanup, it will clear your data in database.', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(529, 1, 'en', 'core/base/system', 'cleanup.messenger_choose_without_table', 'Please choose to ignore tables that do not want to be cleaned', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(530, 1, 'en', 'core/base/system', 'cleanup.messenger_confirm_cleanup', 'Are you sure you want to database cleanup action, it will clear your data in database?', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(531, 1, 'en', 'core/base/system', 'cleanup.submit_button', 'Cleanup', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(532, 1, 'en', 'core/base/system', 'cleanup.success_message', 'Cleaned data successfully', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(533, 1, 'en', 'core/base/system', 'cleanup.not_enabled_yet', 'This featured is not enabled yet. <br />Please add into .env: <code>CMS_ENABLED_CLEANUP_DATABASE=true</code> to enable this feature!', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(534, 1, 'en', 'core/base/tables', 'id', 'ID', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(535, 1, 'en', 'core/base/tables', 'name', 'Name', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(536, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(537, 1, 'en', 'core/base/tables', 'title', 'Title', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(538, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(539, 1, 'en', 'core/base/tables', 'order', 'Order', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(540, 1, 'en', 'core/base/tables', 'status', 'Status', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(541, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(542, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(543, 1, 'en', 'core/base/tables', 'description', 'Description', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(544, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(545, 1, 'en', 'core/base/tables', 'url', 'URL', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(546, 1, 'en', 'core/base/tables', 'author', 'Author', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(547, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(548, 1, 'en', 'core/base/tables', 'column', 'Column', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(549, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(550, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(551, 1, 'en', 'core/base/tables', 'views', 'Views', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(552, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(553, 1, 'en', 'core/base/tables', 'session', 'Session', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(554, 1, 'en', 'core/base/tables', 'activated', 'activated', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(555, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(556, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(557, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(558, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(559, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(560, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(561, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(562, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(563, 1, 'en', 'core/base/tables', 'export', 'Export', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(564, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(565, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(566, 1, 'en', 'core/base/tables', 'print', 'Print', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(567, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(568, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(569, 1, 'en', 'core/base/tables', 'display', 'Display', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(570, 1, 'en', 'core/base/tables', 'all', 'All', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(571, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(572, 1, 'en', 'core/base/tables', 'action', 'Actions', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(573, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(574, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(575, 1, 'en', 'core/base/tables', 'save', 'Save', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(576, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(577, 1, 'en', 'core/base/tables', 'to', 'to', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(578, 1, 'en', 'core/base/tables', 'in', 'in', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(579, 1, 'en', 'core/base/tables', 'records', 'records', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(580, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(581, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(582, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(583, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(584, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(585, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(586, 1, 'en', 'core/base/tables', 'template', 'Template', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(587, 1, 'en', 'core/base/tables', 'email', 'Email', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(588, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(589, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(590, 1, 'en', 'core/base/tables', 'image', 'Image', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(591, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(592, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(593, 1, 'en', 'core/base/tables', 'please_select_record', 'Please select at least one record to perform this action!', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(594, 1, 'en', 'core/base/tables', 'checkbox', 'Checkbox', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(595, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(596, 1, 'en', 'core/base/tabs', 'file', 'Files', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(597, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(598, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(599, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(600, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(601, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(602, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(603, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(604, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(605, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(606, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(607, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(608, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(609, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(610, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(611, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(612, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(613, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.today', 'Today', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(614, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.yesterday', 'Yesterday', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(615, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_week', 'This Week', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(616, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_7_days', 'Last 7 Days', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(617, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_month', 'This Month', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(618, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_30_days', 'Last 30 Days', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(619, 1, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_year', 'This Year', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(620, 1, 'en', 'core/media/media', 'filter', 'Filter', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(621, 1, 'en', 'core/media/media', 'everything', 'Everything', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(622, 1, 'en', 'core/media/media', 'image', 'Image', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(623, 1, 'en', 'core/media/media', 'video', 'Video', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(624, 1, 'en', 'core/media/media', 'document', 'Document', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(625, 1, 'en', 'core/media/media', 'view_in', 'View in', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(626, 1, 'en', 'core/media/media', 'all_media', 'All media', '2023-11-14 23:28:27', '2023-11-14 23:28:27'),
(627, 1, 'en', 'core/media/media', 'trash', 'Trash', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(628, 1, 'en', 'core/media/media', 'recent', 'Recent', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(629, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(630, 1, 'en', 'core/media/media', 'upload', 'Upload', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(631, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(632, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(633, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(634, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search in current folder', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(635, 1, 'en', 'core/media/media', 'sort', 'Sort', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(636, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(637, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(638, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(639, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(640, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(641, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(642, 1, 'en', 'core/media/media', 'actions', 'Actions', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(643, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(644, 1, 'en', 'core/media/media', 'insert', 'Insert', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(645, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(646, 1, 'en', 'core/media/media', 'create', 'Create', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(647, 1, 'en', 'core/media/media', 'rename', 'Rename', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(648, 1, 'en', 'core/media/media', 'crop', 'Crop', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(649, 1, 'en', 'core/media/media', 'close', 'Close', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(650, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(651, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(652, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(653, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(654, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(655, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(656, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(657, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(658, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(659, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(660, 1, 'en', 'core/media/media', 'alt_text', 'Alt text', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(661, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(662, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(663, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(664, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(665, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(666, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(667, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(668, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(669, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(670, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(671, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(672, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(673, 1, 'en', 'core/media/media', 'crop_success', 'Crop image successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(674, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(675, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(676, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(677, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(678, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(679, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(680, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(681, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(682, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(683, 1, 'en', 'core/media/media', 'file_too_big_readable_size', 'File too big. Max file upload is :size.', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(684, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(685, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(686, 1, 'en', 'core/media/media', 'failed_to_crop_image', 'The file cropping must be image type', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(687, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(688, 1, 'en', 'core/media/media', 'add', 'Add media', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(689, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(690, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(691, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(692, 1, 'en', 'core/media/media', 'javascript.alt', 'Alt text', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(693, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(694, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(695, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(696, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(697, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(698, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(699, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(700, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(701, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(702, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(703, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(704, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(705, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(706, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(707, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(708, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(709, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(710, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(711, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(712, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(713, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(714, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links have been copied to clipboard', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(715, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(716, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(717, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(718, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(719, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.crop', 'Crop', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(720, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(721, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(722, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(723, 1, 'en', 'core/media/media', 'javascript.actions_list.file.alt_text', 'ALT text', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(724, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(725, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(726, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(727, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(728, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(729, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(730, 1, 'en', 'core/media/media', 'javascript.change_image', 'Change image', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(731, 1, 'en', 'core/media/media', 'javascript.delete_image', 'Delete image', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(732, 1, 'en', 'core/media/media', 'javascript.choose_image', 'Choose image', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(733, 1, 'en', 'core/media/media', 'javascript.preview_image', 'Preview image', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(734, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(735, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(736, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(737, 1, 'en', 'core/media/media', 'download_link', 'Download', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(738, 1, 'en', 'core/media/media', 'url', 'URL', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(739, 1, 'en', 'core/media/media', 'download_explain', 'Enter one URL per line.', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(740, 1, 'en', 'core/media/media', 'downloading', 'Downloading...', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(741, 1, 'en', 'core/media/media', 'prepare_file_to_download', 'Preparing file to download...', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(742, 1, 'en', 'core/media/media', 'update_alt_text_success', 'Update alt text successfully!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(743, 1, 'en', 'core/media/media', 'cropper.height', 'Height', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(744, 1, 'en', 'core/media/media', 'cropper.width', 'Width', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(745, 1, 'en', 'core/media/media', 'cropper.aspect_ratio', 'Aspect ratio?', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(746, 1, 'en', 'core/media/media', 'unable_to_write', 'Unable to write file. Please chmod folder \":folder\" to make it writeable!', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(747, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(748, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(749, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(750, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(751, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(752, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(753, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(754, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(755, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(756, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(757, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(758, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(759, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(760, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(761, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(762, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(763, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(764, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(765, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(766, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(767, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(768, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2023-11-14 23:28:28', '2023-11-14 23:28:28'),
(769, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(770, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(771, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(772, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(773, 1, 'en', 'core/setting/setting', 'general.disable_cache_in_the_admin_panel', 'Disable cache in the admin panel?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(774, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(775, 1, 'en', 'core/setting/setting', 'general.enable_cache_site_map', 'Enable cache site map?', '2023-11-14 23:28:29', '2023-11-14 23:28:29');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(776, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map (minutes)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(777, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(778, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(779, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(780, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(781, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(782, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(783, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(784, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(785, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(786, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(787, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(788, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(789, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(790, 1, 'en', 'core/setting/setting', 'general.select', '— Select —', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(791, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(792, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(793, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Front site language direction', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(794, 1, 'en', 'core/setting/setting', 'general.admin_locale_direction', 'Admin language direction', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(795, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(796, 1, 'en', 'core/setting/setting', 'general.minutes', 'minutes', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(797, 1, 'en', 'core/setting/setting', 'general.datatables.title', 'Datatables', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(798, 1, 'en', 'core/setting/setting', 'general.datatables.description', 'Settings for datatables', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(799, 1, 'en', 'core/setting/setting', 'general.datatables.show_column_visibility', 'Default show column visibility?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(800, 1, 'en', 'core/setting/setting', 'general.datatables.show_export_button', 'Default show export button?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(801, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(802, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(803, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(804, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(805, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(806, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(807, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(808, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(809, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(810, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(811, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(812, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(813, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(814, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(815, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(816, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(817, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(818, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(819, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(820, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(821, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(822, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(823, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(824, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(825, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(826, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(827, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(828, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(829, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(830, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(831, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(832, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(833, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(834, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(835, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(836, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(837, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(838, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(839, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(840, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(841, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(842, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(843, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(844, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(845, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(846, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(847, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(848, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(849, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(850, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(851, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(852, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(853, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(854, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(855, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(856, 1, 'en', 'core/setting/setting', 'media.aws_endpoint', 'AWS Endpoint (Optional)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(857, 1, 'en', 'core/setting/setting', 'media.r2_access_key_id', 'R2 Access Key ID', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(858, 1, 'en', 'core/setting/setting', 'media.r2_secret_key', 'R2 Secret Key', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(859, 1, 'en', 'core/setting/setting', 'media.r2_bucket', 'R2 Bucket', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(860, 1, 'en', 'core/setting/setting', 'media.r2_url', 'R2 URL', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(861, 1, 'en', 'core/setting/setting', 'media.r2_endpoint', 'R2 Endpoint', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(862, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(863, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(864, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(865, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(866, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(867, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(868, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(869, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(870, 1, 'en', 'core/setting/setting', 'media.wasabi_access_key_id', 'Wasabi Access Key ID', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(871, 1, 'en', 'core/setting/setting', 'media.wasabi_secret_key', 'Wasabi Secret Key', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(872, 1, 'en', 'core/setting/setting', 'media.wasabi_default_region', 'Wasabi Default Region', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(873, 1, 'en', 'core/setting/setting', 'media.wasabi_bucket', 'Wasabi Bucket', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(874, 1, 'en', 'core/setting/setting', 'media.wasabi_root', 'Wasabi Root', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(875, 1, 'en', 'core/setting/setting', 'media.default_placeholder_image', 'Default placeholder image', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(876, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(877, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(878, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(879, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(880, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(881, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(882, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(883, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(884, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(885, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(886, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(887, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(888, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(889, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(890, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(891, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(892, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(893, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(894, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(895, 1, 'en', 'core/setting/setting', 'media.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(896, 1, 'en', 'core/setting/setting', 'media.bunnycdn_hostname', 'Hostname', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(897, 1, 'en', 'core/setting/setting', 'media.bunnycdn_zone', 'Zone Name (The name of your storage zone)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(898, 1, 'en', 'core/setting/setting', 'media.bunnycdn_key', 'FTP & API Access Password (The storage zone API Access Password)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(899, 1, 'en', 'core/setting/setting', 'media.bunnycdn_region', 'Region (The storage zone region)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(900, 1, 'en', 'core/setting/setting', 'media.optional', 'Optional', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(901, 1, 'en', 'core/setting/setting', 'media.sizes', 'Media thumbnails sizes', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(902, 1, 'en', 'core/setting/setting', 'media.media_sizes_helper', 'Set width or height to 0 if you just want to crop by width or height. Need to click on \"Generate thumbnails\" to apply changes.', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(903, 1, 'en', 'core/setting/setting', 'media.width', 'Width', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(904, 1, 'en', 'core/setting/setting', 'media.height', 'Height', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(905, 1, 'en', 'core/setting/setting', 'media.default_size_value', 'Default: :size', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(906, 1, 'en', 'core/setting/setting', 'media.all', 'All', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(907, 1, 'en', 'core/setting/setting', 'media.media_folders_can_add_watermark', 'Add watermark for images in folders:', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(908, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize', 'Max upload filesize (MB)', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(909, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_placeholder', 'Default: :size, must less than :size.', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(910, 1, 'en', 'core/setting/setting', 'media.max_upload_filesize_helper', 'Your server allows to upload files maximum :size, you can change this value to limit upload filesize.', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(911, 1, 'en', 'core/setting/setting', 'media.image_processing_library', 'Image processing library', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(912, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(913, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(914, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(915, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(916, 1, 'en', 'core/setting/setting', 'template', 'Template', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(917, 1, 'en', 'core/setting/setting', 'description', 'Description', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(918, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(919, 1, 'en', 'core/setting/setting', 'send', 'Send', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(920, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(921, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(922, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2023-11-14 23:28:29', '2023-11-14 23:28:29'),
(923, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(924, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(925, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(926, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(927, 1, 'en', 'core/setting/setting', 'saving', 'Saving...', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(928, 1, 'en', 'core/setting/setting', 'emails_warning', 'You can add up to :count emails', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(929, 1, 'en', 'core/setting/setting', 'email_add_more', 'Add more', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(930, 1, 'en', 'core/setting/setting', 'generate', 'Generate', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(931, 1, 'en', 'core/setting/setting', 'generate_thumbnails', 'Generate thumbnails', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(932, 1, 'en', 'core/setting/setting', 'generate_thumbnails_success', 'Generate thumbnails successfully. :count files are generated!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(933, 1, 'en', 'core/setting/setting', 'generate_thumbnails_error', 'We are unable to regenerate thumbnail for these files :count files!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(934, 1, 'en', 'core/setting/setting', 'generate_thumbnails_description', 'Are you sure you want to re-generate thumbnails for all images? It will take time so please DO NOT leave this page, wait until it is finished.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(935, 1, 'en', 'core/setting/setting', 'enable_chunk_description', 'Chunk size upload is used to upload large file size.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(936, 1, 'en', 'core/setting/setting', 'watermark_description', 'WARNING: Watermark is just added to new uploaded images, it won\'t be added to existing images. Disable watermark won\'t remove watermark from existing images.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(937, 1, 'en', 'core/setting/setting', 'submit', 'Submit', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(938, 1, 'en', 'core/setting/setting', 'back', 'Back', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(939, 1, 'en', 'core/setting/setting', 'enter_sample_value', 'Enter sample values for testing', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(940, 1, 'en', 'core/setting/setting', 'preview', 'Preview', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(941, 1, 'en', 'core/setting/setting', 'media_size_width', ':size size width must be greater than 0', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(942, 1, 'en', 'core/setting/setting', 'media_size_height', ':size size height must be greater than 0', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(943, 1, 'en', 'core/setting/setting', 'cronjob.name', 'Cronjob', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(944, 1, 'en', 'core/setting/setting', 'cronjob.description', 'Cronjob allow you to automate certain commands or scripts on your site.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(945, 1, 'en', 'core/setting/setting', 'cronjob.is_not_ready', 'To run the cronjob, follow the instructions below.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(946, 1, 'en', 'core/setting/setting', 'cronjob.is_working', 'Congratulations! Your cronjob is running.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(947, 1, 'en', 'core/setting/setting', 'cronjob.is_not_working', 'Your cronjob is not running. Please check your server\'s cronjob.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(948, 1, 'en', 'core/setting/setting', 'cronjob.last_checked', 'Last checked at :time.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(949, 1, 'en', 'core/setting/setting', 'cronjob.copy_button', 'Copy', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(950, 1, 'en', 'core/setting/setting', 'cronjob.setup.name', 'Setting up the Cronjob', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(951, 1, 'en', 'core/setting/setting', 'cronjob.setup.connect_to_server', 'Connect to your server via SSH or any preferred method.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(952, 1, 'en', 'core/setting/setting', 'cronjob.setup.open_crontab', 'Open the crontab file using a text editor (e.g., `crontab -e`).', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(953, 1, 'en', 'core/setting/setting', 'cronjob.setup.add_cronjob', 'Add the above command to the crontab file and save it.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(954, 1, 'en', 'core/setting/setting', 'cronjob.setup.done', 'The cronjob will now run at every minute and execute the specified command.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(955, 1, 'en', 'core/setting/setting', 'cronjob.setup.learn_more', 'You can learn more about cronjob from the Laravel :documentation', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(956, 1, 'en', 'core/setting/setting', 'cronjob.setup.documentation', 'documentation', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(957, 1, 'en', 'core/setting/setting', 'cronjob.setup.copied', 'Copied', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(958, 1, 'en', 'core/table/table', 'operations', 'Operations', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(959, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(960, 1, 'en', 'core/table/table', 'display', 'Display', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(961, 1, 'en', 'core/table/table', 'all', 'All', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(962, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(963, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(964, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(965, 1, 'en', 'core/table/table', 'to', 'to', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(966, 1, 'en', 'core/table/table', 'in', 'in', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(967, 1, 'en', 'core/table/table', 'records', 'records', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(968, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(969, 1, 'en', 'core/table/table', 'no_record', 'No record', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(970, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(971, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(972, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(973, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(974, 1, 'en', 'core/table/table', 'delete', 'Delete', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(975, 1, 'en', 'core/table/table', 'close', 'Close', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(976, 1, 'en', 'core/table/table', 'contains', 'Contains', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(977, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(978, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(979, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(980, 1, 'en', 'core/table/table', 'value', 'Value', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(981, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(982, 1, 'en', 'core/table/table', 'reset', 'Reset', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(983, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(984, 1, 'en', 'core/table/table', 'apply', 'Apply', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(985, 1, 'en', 'core/table/table', 'filters', 'Filters', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(986, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(987, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(988, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(989, 1, 'en', 'core/table/table', 'invalid_bulk_action', 'Invalid bulk action', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(990, 1, 'en', 'core/table/table', 'confirm_bulk_action', 'Confirm to perform this action', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(991, 1, 'en', 'core/table/table', 'confirm_bulk_message', 'Are you sure you want to do this action? This cannot be undone.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(992, 1, 'en', 'core/table/table', 'yes', 'Yes', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(993, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(994, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(995, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(996, 1, 'en', 'core/table/table', 'search', 'Search...', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(997, 1, 'en', 'packages/api/api', 'settings', 'API Settings', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(998, 1, 'en', 'packages/api/api', 'save_settings', 'Save settings', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(999, 1, 'en', 'packages/api/api', 'setting_title', 'API settings', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1000, 1, 'en', 'packages/api/api', 'setting_description', 'Settings for API', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1001, 1, 'en', 'packages/api/api', 'api_enabled', 'API enabled?', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1002, 1, 'en', 'packages/get-started/get-started', 'welcome_title', 'Welcome to your admin dashboard!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1003, 1, 'en', 'packages/get-started/get-started', 'welcome_description', 'In a few short steps, you can have your new dashboard up and running!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1004, 1, 'en', 'packages/get-started/get-started', 'get_started', 'Get Started!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1005, 1, 'en', 'packages/get-started/get-started', 'customize_branding_title', 'Customize branding', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1006, 1, 'en', 'packages/get-started/get-started', 'customize_branding_description', 'Customize your site with colors, logo and subdomain to match your business unique branding and identity.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1007, 1, 'en', 'packages/get-started/get-started', 'colors', 'Colors', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1008, 1, 'en', 'packages/get-started/get-started', 'fonts', 'Fonts', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1009, 1, 'en', 'packages/get-started/get-started', 'primary_color', 'Primary color', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1010, 1, 'en', 'packages/get-started/get-started', 'primary_font', 'Primary font', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1011, 1, 'en', 'packages/get-started/get-started', 'setup_wizard_button', ':link to finish Quick setup Wizard!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1012, 1, 'en', 'packages/get-started/get-started', 'click_here', 'Click here', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1013, 1, 'en', 'packages/get-started/get-started', 'site_title', 'Site title', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1014, 1, 'en', 'packages/get-started/get-started', 'identify', 'Identify', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1015, 1, 'en', 'packages/get-started/get-started', 'logo', 'Logo', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1016, 1, 'en', 'packages/get-started/get-started', 'admin_logo', 'Admin logo', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1017, 1, 'en', 'packages/get-started/get-started', 'favicon', 'Favicon', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1018, 1, 'en', 'packages/get-started/get-started', 'admin_favicon', 'Admin favicon', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1019, 1, 'en', 'packages/get-started/get-started', 'next_step', 'Next step', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1020, 1, 'en', 'packages/get-started/get-started', 'site_ready_title', 'Your site is ready!', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1021, 1, 'en', 'packages/get-started/get-started', 'site_ready_description', 'Welcome to your new site! Your website has been created and populated with sample data. You are in the admin area of your site where you can set up everything else needed to complete your site.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1022, 1, 'en', 'packages/get-started/get-started', 'finish', 'Finish', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1023, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_title', 'Are you sure you want to exit the Quick Setup Wizard?', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1024, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_confirm', 'Yes, I\'ll finish it later', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1025, 1, 'en', 'packages/get-started/get-started', 'exit_wizard_cancel', 'No, take me back to the wizard', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1026, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_title', 'Change default account info', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1027, 1, 'en', 'packages/get-started/get-started', 'change_default_account_info_description', 'The default account is using a weak password. You need to change it to a complex password for better security.', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1028, 1, 'en', 'packages/get-started/get-started', 'username', 'Username', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1029, 1, 'en', 'packages/get-started/get-started', 'email', 'Email', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1030, 1, 'en', 'packages/get-started/get-started', 'password', 'Password', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1031, 1, 'en', 'packages/get-started/get-started', 'password_confirmation', 'Password confirmation', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1032, 1, 'en', 'packages/installer/installer', 'title', 'Installer', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1033, 1, 'en', 'packages/installer/installer', 'next', 'Next Step', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1034, 1, 'en', 'packages/installer/installer', 'back', 'Previous', '2023-11-14 23:28:30', '2023-11-14 23:28:30'),
(1035, 1, 'en', 'packages/installer/installer', 'finish', 'Install', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1036, 1, 'en', 'packages/installer/installer', 'installation', 'Installation', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1037, 1, 'en', 'packages/installer/installer', 'forms.errorTitle', 'The following errors occurred:', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1038, 1, 'en', 'packages/installer/installer', 'welcome.templateTitle', 'Welcome', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1039, 1, 'en', 'packages/installer/installer', 'welcome.title', 'Welcome', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1040, 1, 'en', 'packages/installer/installer', 'welcome.message', 'Before getting started, we need some information on the database. You will need to know the following items before proceeding.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1041, 1, 'en', 'packages/installer/installer', 'welcome.next', 'Let\'s go', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1042, 1, 'en', 'packages/installer/installer', 'requirements.templateTitle', 'Step 1 | Server Requirements', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1043, 1, 'en', 'packages/installer/installer', 'requirements.title', 'Server Requirements', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1044, 1, 'en', 'packages/installer/installer', 'requirements.next', 'Check Permissions', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1045, 1, 'en', 'packages/installer/installer', 'permissions.templateTitle', 'Step 2 | Permissions', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1046, 1, 'en', 'packages/installer/installer', 'permissions.title', 'Permissions', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1047, 1, 'en', 'packages/installer/installer', 'permissions.next', 'Configure Environment', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1048, 1, 'en', 'packages/installer/installer', 'environment.wizard.templateTitle', 'Environment Settings', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1049, 1, 'en', 'packages/installer/installer', 'environment.wizard.title', 'Environment Settings', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1050, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.name_required', 'An environment name is required.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1051, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_label', 'Site title', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1052, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_name_placeholder', 'Site title', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1053, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_label', 'URL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1054, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.app_url_placeholder', 'URL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1055, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label', 'Database Connection', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1056, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_mysql', 'MySQL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1057, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_sqlite', 'SQLite', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1058, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connection_label_pgsql', 'PostgreSQL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1059, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_label', 'Database host', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1060, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_placeholder', 'Database host', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1061, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_label', 'Database port', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1062, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_port_placeholder', 'Database port', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1063, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_label', 'Database name', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1064, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_name_placeholder', 'Database name', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1065, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_label', 'Database username', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1066, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_username_placeholder', 'Database username', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1067, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_label', 'Database password', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1068, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_password_placeholder', 'Database password', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1069, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.buttons.install', 'Install', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1070, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_host_helper', 'If you use Laravel Sail, just change DB_HOST to DB_HOST=mysql. On some hosting DB_HOST can be localhost instead of 127.0.0.1', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1071, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.mysql', 'MySQL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1072, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.sqlite', 'SQLite', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1073, 1, 'en', 'packages/installer/installer', 'environment.wizard.form.db_connections.pgsql', 'PostgreSQL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1074, 1, 'en', 'packages/installer/installer', 'environment.success', 'Your .env file settings have been saved.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1075, 1, 'en', 'packages/installer/installer', 'environment.errors', 'Unable to save the .env file, Please create it manually.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1076, 1, 'en', 'packages/installer/installer', 'install', 'Install', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1077, 1, 'en', 'packages/installer/installer', 'final.title', 'Installation Finished', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1078, 1, 'en', 'packages/installer/installer', 'final.templateTitle', 'Installation Finished', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1079, 1, 'en', 'packages/installer/installer', 'final.finished', 'Application has been successfully installed.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1080, 1, 'en', 'packages/installer/installer', 'final.exit', 'Click here to exit', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1081, 1, 'en', 'packages/installer/installer', 'create_account', 'Create account', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1082, 1, 'en', 'packages/installer/installer', 'first_name', 'First name', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1083, 1, 'en', 'packages/installer/installer', 'last_name', 'Last name', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1084, 1, 'en', 'packages/installer/installer', 'username', 'Username', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1085, 1, 'en', 'packages/installer/installer', 'email', 'Email', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1086, 1, 'en', 'packages/installer/installer', 'password', 'Password', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1087, 1, 'en', 'packages/installer/installer', 'password_confirmation', 'Password confirmation', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1088, 1, 'en', 'packages/installer/installer', 'create', 'Create', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1089, 1, 'en', 'packages/installer/installer', 'install_success', 'Installed successfully!', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1090, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1091, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1092, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1093, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1094, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1095, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1096, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1097, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1098, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1099, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1100, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1101, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1102, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1103, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1104, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1105, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1106, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1107, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1108, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1109, 1, 'en', 'packages/menu/menu', 'title_placeholder', 'Title', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1110, 1, 'en', 'packages/menu/menu', 'icon_placeholder', 'Icon', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1111, 1, 'en', 'packages/menu/menu', 'url_placeholder', 'URL', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1112, 1, 'en', 'packages/menu/menu', 'css_class_placeholder', 'CSS class', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1113, 1, 'en', 'packages/menu/menu', 'menu_id', 'Menu ID', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1114, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1115, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1116, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1117, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space', 'Collapse white space', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1118, 1, 'en', 'packages/optimize/optimize', 'collapse_white_space_description', 'This filter reduces bytes transmitted in an HTML file by removing unnecessary whitespace.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1119, 1, 'en', 'packages/optimize/optimize', 'elide_attributes', 'Elide attributes', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1120, 1, 'en', 'packages/optimize/optimize', 'elide_attributes_description', 'This filter reduces the transfer size of HTML files by removing attributes from tags when the specified value is equal to the default value for that attribute. This can save a modest number of bytes, and may make the document more compressible by canonicalizing the affected tags.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1121, 1, 'en', 'packages/optimize/optimize', 'inline_css', 'Inline CSS', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1122, 1, 'en', 'packages/optimize/optimize', 'inline_css_description', 'This filter transforms the inline \"style\" attribute of tags into classes by moving the CSS to the header.', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1123, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch', 'Insert DNS prefetch', '2023-11-14 23:28:31', '2023-11-14 23:28:31'),
(1124, 1, 'en', 'packages/optimize/optimize', 'insert_dns_prefetch_description', 'This filter injects tags in the HEAD to enable the browser to do DNS prefetching.', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1125, 1, 'en', 'packages/optimize/optimize', 'remove_comments', 'Remove comments', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1126, 1, 'en', 'packages/optimize/optimize', 'remove_comments_description', 'This filter eliminates HTML, JS and CSS comments. The filter reduces the transfer size of HTML files by removing the comments. Depending on the HTML file, this filter can significantly reduce the number of bytes transmitted on the network.', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1127, 1, 'en', 'packages/optimize/optimize', 'remove_quotes', 'Remove quotes', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1128, 1, 'en', 'packages/optimize/optimize', 'remove_quotes_description', 'This filter eliminates unnecessary quotation marks from HTML attributes. While required by the various HTML specifications, browsers permit their omission when the value of an attribute is composed of a certain subset of characters (alphanumerics and some punctuation characters).', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1129, 1, 'en', 'packages/optimize/optimize', 'defer_javascript', 'Defer javascript', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1130, 1, 'en', 'packages/optimize/optimize', 'defer_javascript_description', 'Defers the execution of javascript in the HTML. If necessary cancel deferring in some script, use data-pagespeed-no-defer as script attribute to cancel deferring.', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1131, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1132, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1133, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1134, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1135, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1136, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2023-11-14 23:28:32', '2023-11-14 23:28:32');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1137, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1138, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1139, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1140, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1141, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1142, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1143, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1144, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1145, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1146, 1, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1147, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1148, 1, 'en', 'packages/plugin-management/marketplace', 'previous', '&laquo; Previous', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1149, 1, 'en', 'packages/plugin-management/marketplace', 'next', 'Next &raquo;', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1150, 1, 'en', 'packages/plugin-management/marketplace', 'showing', 'Showing', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1151, 1, 'en', 'packages/plugin-management/marketplace', 'to', 'to', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1152, 1, 'en', 'packages/plugin-management/marketplace', 'of', 'of', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1153, 1, 'en', 'packages/plugin-management/marketplace', 'results', 'results', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1154, 1, 'en', 'packages/plugin-management/marketplace', 'add_new', 'Add new', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1155, 1, 'en', 'packages/plugin-management/marketplace', 'installed', 'Installed', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1156, 1, 'en', 'packages/plugin-management/marketplace', 'install_now', 'Install now', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1157, 1, 'en', 'packages/plugin-management/marketplace', 'installing', 'Installing...', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1158, 1, 'en', 'packages/plugin-management/marketplace', 'detail', 'Details', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1159, 1, 'en', 'packages/plugin-management/marketplace', 'version', 'Version', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1160, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version', 'Minimum core version', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1161, 1, 'en', 'packages/plugin-management/marketplace', 'last_update', 'Last update', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1162, 1, 'en', 'packages/plugin-management/marketplace', 'compatible_version', 'Compatible with your version', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1163, 1, 'en', 'packages/plugin-management/marketplace', 'incompatible_version', 'Incompatible with your version', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1164, 1, 'en', 'packages/plugin-management/marketplace', 'deactivate', 'Deactivate', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1165, 1, 'en', 'packages/plugin-management/marketplace', 'activate', 'Activate', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1166, 1, 'en', 'packages/plugin-management/marketplace', 'activating', 'Activating...', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1167, 1, 'en', 'packages/plugin-management/marketplace', 'activated', 'Activated', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1168, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted', 'Connection Aborted', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1169, 1, 'en', 'packages/plugin-management/marketplace', 'connection_aborted_description', 'Connection Aborted Description', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1170, 1, 'en', 'packages/plugin-management/marketplace', 'api_connect_error', 'Connect to Marketplace API Error, please contact support', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1171, 1, 'en', 'packages/plugin-management/marketplace', 'keyword', 'Keyword', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1172, 1, 'en', 'packages/plugin-management/marketplace', 'search', 'Search', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1173, 1, 'en', 'packages/plugin-management/marketplace', 'all', 'All', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1174, 1, 'en', 'packages/plugin-management/marketplace', 'featured', 'Featured', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1175, 1, 'en', 'packages/plugin-management/marketplace', 'popular', 'Popular', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1176, 1, 'en', 'packages/plugin-management/marketplace', 'top_rated', 'Top Rated', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1177, 1, 'en', 'packages/plugin-management/marketplace', 'install_plugin', 'Install plugin', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1178, 1, 'en', 'packages/plugin-management/marketplace', 'cancel', 'Cancel', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1179, 1, 'en', 'packages/plugin-management/marketplace', 'yes_install', ' Yes! Install', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1180, 1, 'en', 'packages/plugin-management/marketplace', 'message_alert', 'Are you sure you want to install this plugin?', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1181, 1, 'en', 'packages/plugin-management/marketplace', 'folder_permissions', 'Folder does not have permission to write file or the update file path could not be resolved, please contact support', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1182, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_failed', 'Unzip extraction failed', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1183, 1, 'en', 'packages/plugin-management/marketplace', 'unzip_success', 'Download file extracted', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1184, 1, 'en', 'packages/plugin-management/marketplace', 'install_success', 'Installed plugin successfully!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1185, 1, 'en', 'packages/plugin-management/marketplace', 'update_success', 'Updated plugin successfully!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1186, 1, 'en', 'packages/plugin-management/marketplace', 'minimum_core_version_error', 'Cannot install this plugin. Minimum core version is :version.', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1187, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1188, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1189, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1190, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1191, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1192, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1193, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1194, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1195, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1196, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1197, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1198, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1199, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1200, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1201, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1202, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1203, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1204, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1205, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1206, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1207, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1208, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1209, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1210, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1211, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin has been removed!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1212, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1213, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1214, 1, 'en', 'packages/plugin-management/plugin', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1215, 1, 'en', 'packages/plugin-management/plugin', 'plugin_is_not_ready', 'Plugin :name is not ready to use', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1216, 1, 'en', 'packages/plugin-management/plugin', 'plugins_installed', 'Installed Plugins', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1217, 1, 'en', 'packages/plugin-management/plugin', 'plugins_add_new', 'Add new', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1218, 1, 'en', 'packages/plugin-management/plugin', 'update', 'Update', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1219, 1, 'en', 'packages/plugin-management/plugin', 'requirement_not_met', 'Plugin :plugin requires plugin(s): :required_plugins. Do you want to install them and activate :plugin now?', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1220, 1, 'en', 'packages/plugin-management/plugin', 'install', 'Install now', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1221, 1, 'en', 'packages/plugin-management/plugin', 'install_plugin', 'Install Plugin', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1222, 1, 'en', 'packages/plugin-management/plugin', 'minimum_core_version_not_met', 'Plugin :plugin requires :minimum_core_version version of core, but your core version is :current_core_version. Please upgrade your core to use this plugin!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1223, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1224, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1225, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1226, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1227, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1228, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1229, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1230, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1231, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1232, 1, 'en', 'packages/slug/slug', 'settings.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1233, 1, 'en', 'packages/slug/slug', 'settings.available_variables', 'Available variables', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1234, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1235, 1, 'en', 'packages/slug/slug', 'prefix_for', 'Prefix for :name', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1236, 1, 'en', 'packages/slug/slug', 'public_single_ending_url', 'Postfix for single page URL', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1237, 1, 'en', 'packages/slug/slug', 'current_year', 'Current year', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1238, 1, 'en', 'packages/slug/slug', 'current_month', 'Current month', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1239, 1, 'en', 'packages/slug/slug', 'current_day', 'Current day', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1240, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1241, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1242, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1243, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1244, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1245, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1246, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1247, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1248, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1249, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1250, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1251, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1252, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1253, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1254, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1255, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1256, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1257, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1258, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1259, 1, 'en', 'packages/theme/theme', 'custom_html', 'Custom HTML', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1260, 1, 'en', 'packages/theme/theme', 'custom_header_html', 'Header HTML', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1261, 1, 'en', 'packages/theme/theme', 'custom_header_html_placeholder', 'HTML in header of page, no special tags: script, style, iframe...', '2023-11-14 23:28:32', '2023-11-14 23:28:32'),
(1262, 1, 'en', 'packages/theme/theme', 'custom_body_html', 'Body HTML', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1263, 1, 'en', 'packages/theme/theme', 'custom_body_html_placeholder', 'HTML in body of page, no special tags: script, style, iframe...', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1264, 1, 'en', 'packages/theme/theme', 'custom_footer_html', 'Footer HTML', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1265, 1, 'en', 'packages/theme/theme', 'custom_footer_html_placeholder', 'HTML in footer of page, no special tags: script, style, iframe...', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1266, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1267, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1268, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1269, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1270, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1271, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1272, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1273, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1274, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1275, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1276, 1, 'en', 'packages/theme/theme', 'settings.redirect_404_to_homepage', 'Redirect all not found requests to homepage?', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1277, 1, 'en', 'packages/theme/theme', 'settings.show_guidelines', 'Show guidelines?', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1278, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1279, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1280, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1281, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1282, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1283, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1284, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1285, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1286, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1287, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1288, 1, 'en', 'packages/theme/theme', 'update_custom_html_success', 'Update custom HTML successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1289, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1290, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1291, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1292, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1293, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1294, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1295, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1296, 1, 'en', 'packages/theme/theme', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1297, 1, 'en', 'packages/theme/theme', 'breadcrumb_enabled', 'Enable breadcrumb?', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1298, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1299, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1300, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1301, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1302, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1303, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1304, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1305, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1306, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1307, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1308, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1309, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1310, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1311, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1312, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1313, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1314, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1315, 1, 'en', 'packages/widget/widget', 'widget_menu', 'Simple Menu', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1316, 1, 'en', 'packages/widget/widget', 'widget_menu_description', 'Add a simple menu to your widget area.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1317, 1, 'en', 'packages/widget/widget', 'widget_menu_label', 'Label', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1318, 1, 'en', 'packages/widget/widget', 'widget_menu_attributes', 'Attributes', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1319, 1, 'en', 'packages/widget/widget', 'widget_menu_url', 'URL', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1320, 1, 'en', 'packages/widget/widget', 'widget_menu_is_open_new_tab', 'Is open new tab?', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1321, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1322, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1323, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1324, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1325, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1326, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1327, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1328, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1329, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1330, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1331, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1332, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1333, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1334, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1335, 1, 'en', 'plugins/analytics/analytics', 'property_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1336, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1337, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1338, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a Google Analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1339, 1, 'en', 'plugins/analytics/analytics', 'property_id_is_invalid', 'Property ID is invalid. Check this: https://developers.google.com/analytics/devguides/reporting/data/v1/property-id', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1340, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1341, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1342, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id', 'Google tag ID', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1343, 1, 'en', 'plugins/analytics/analytics', 'settings.google_tag_id_placeholder', 'Example: G-76NX8HY29D', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1344, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id', 'Property ID for GA4', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1345, 1, 'en', 'plugins/analytics/analytics', 'settings.analytics_property_id_description', 'Google Analytics Property ID (GA4)', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1346, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1347, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1348, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1349, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1350, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1351, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1352, 1, 'en', 'plugins/analytics/analytics', 'missing_library_warning', 'Analytics plugin error: Missing third-party libraries, please run \"composer update\" to install them.', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1353, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1354, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1355, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1356, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1357, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1358, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1359, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1360, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1361, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1362, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1363, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1364, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1365, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1366, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1367, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1368, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1369, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1370, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1371, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1372, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1373, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1374, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1375, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2023-11-14 23:28:33', '2023-11-14 23:28:33'),
(1376, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1377, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1378, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1379, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1380, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1381, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1382, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1383, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1384, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1385, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1386, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1387, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1388, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1389, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1390, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1391, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1392, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1393, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1394, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1395, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1396, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1397, 1, 'en', 'plugins/backup/backup', 'proc_open_disabled_error', 'Function <strong>proc_open()</strong> has been disabled so the system cannot backup the database. Please contact your hosting provider to enable it.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1398, 1, 'en', 'plugins/backup/backup', 'database_backup_not_existed', 'Backup database is not existed!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1399, 1, 'en', 'plugins/backup/backup', 'uploads_folder_backup_not_existed', 'Backup uploads folder is not existed!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1400, 1, 'en', 'plugins/backup/backup', 'important_message1', 'This is a simple backup feature, it is a solution for you if your site has < 1GB data and can be used for quickly backup your site.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1401, 1, 'en', 'plugins/backup/backup', 'important_message2', 'If you have more than 1GB images/files in local storage, you should use backup feature of your hosting or VPS.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1402, 1, 'en', 'plugins/backup/backup', 'important_message3', 'To backup your database, function <strong>proc_open()</strong> or <strong>system()</strong> must be enabled. Contact your hosting provider to enable it if it is disabled.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1403, 1, 'en', 'plugins/backup/backup', 'important_message4', 'It is not a full backup, it is just back up uploaded files and your database.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1404, 1, 'en', 'plugins/backup/backup', 'important_message_pgsql1', 'Currently, we cannot backup <strong>PostgreSQL</strong> database on the web due to PostgreSQL doesnt have option to enter database password directly when exporting database.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1405, 1, 'en', 'plugins/backup/backup', 'important_message_pgsql2', 'You can run a command <strong>php artisan cms:backup:create {name}</strong> to generate the backup or <strong>php artisan cms:backup:restore</strong> to restore the latest backup.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1406, 1, 'en', 'plugins/backup/backup', 'cannot_restore_database', 'Cannot restore database. The database backup is missing!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1407, 1, 'en', 'plugins/backup/backup', 'database_driver_not_supported', 'Database driver is not supported.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1408, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1409, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1410, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1411, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1412, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1413, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1414, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1415, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1416, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1417, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1418, 1, 'en', 'plugins/blog/base', 'settings.title', 'Blog', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1419, 1, 'en', 'plugins/blog/base', 'settings.description', 'Settings for Blog', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1420, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema', 'Enable Blog Post Schema?', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1421, 1, 'en', 'plugins/blog/base', 'settings.enable_blog_post_schema_description', 'Learn more: https://schema.org/Article', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1422, 1, 'en', 'plugins/blog/base', 'settings.schema_type', 'Schema type', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1423, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1424, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1425, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1426, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1427, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1428, 1, 'en', 'plugins/blog/categories', 'total_posts', 'Total posts: :total', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1429, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1430, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1431, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1432, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1433, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1434, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1435, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1436, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1437, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1438, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1439, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1440, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1441, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1442, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1443, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1444, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1445, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1446, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1447, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1448, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1449, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1450, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1451, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1452, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1453, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1454, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1455, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1456, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1457, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1458, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1459, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1460, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1461, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1462, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1463, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1464, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1465, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1466, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1467, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1468, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1469, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1470, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1471, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1472, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1473, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1474, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1475, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1476, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1477, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1478, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1479, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1480, 1, 'en', 'plugins/captcha/captcha', 'numbers.0', 'Zero', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1481, 1, 'en', 'plugins/captcha/captcha', 'numbers.1', 'One', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1482, 1, 'en', 'plugins/captcha/captcha', 'numbers.2', 'Two', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1483, 1, 'en', 'plugins/captcha/captcha', 'numbers.3', 'Three', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1484, 1, 'en', 'plugins/captcha/captcha', 'numbers.4', 'Four', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1485, 1, 'en', 'plugins/captcha/captcha', 'numbers.5', 'Five', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1486, 1, 'en', 'plugins/captcha/captcha', 'numbers.6', 'Six', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1487, 1, 'en', 'plugins/captcha/captcha', 'numbers.7', 'Seven', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1488, 1, 'en', 'plugins/captcha/captcha', 'numbers.8', 'Eight', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1489, 1, 'en', 'plugins/captcha/captcha', 'numbers.9', 'Nine', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1490, 1, 'en', 'plugins/captcha/captcha', 'numbers.10', 'Ten', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1491, 1, 'en', 'plugins/captcha/captcha', 'numbers.11', 'Eleven', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1492, 1, 'en', 'plugins/captcha/captcha', 'numbers.12', 'Twelve', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1493, 1, 'en', 'plugins/captcha/captcha', 'operands.+', 'plus', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1494, 1, 'en', 'plugins/captcha/captcha', 'operands.-', 'minus', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1495, 1, 'en', 'plugins/captcha/captcha', 'operands.*', 'times', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1496, 1, 'en', 'plugins/captcha/captcha', 'operands./', 'divided by', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1497, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1498, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1499, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1500, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1501, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1502, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2023-11-14 23:28:34', '2023-11-14 23:28:34');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1503, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1504, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1505, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1506, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2023-11-14 23:28:34', '2023-11-14 23:28:34'),
(1507, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1508, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1509, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1510, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1511, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1512, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1513, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1514, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1515, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1516, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1517, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1518, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1519, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1520, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1521, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1522, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1523, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1524, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1525, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1526, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1527, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1528, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1529, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1530, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1531, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1532, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1533, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1534, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1535, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1536, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1537, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1538, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1539, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1540, 1, 'en', 'plugins/contact/contact', 'settings.title', 'Contact', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1541, 1, 'en', 'plugins/contact/contact', 'settings.description', 'Settings for contact plugin', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1542, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords', 'Blacklist keywords', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1543, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_placeholder', 'keywords...', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1544, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_keywords_helper', 'Blacklist contact requests if it includes those keywords in the content field (separate by comma).', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1545, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains', 'Blacklist email domains', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1546, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_placeholder', 'domain...', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1547, 1, 'en', 'plugins/contact/contact', 'settings.blacklist_email_domains_helper', 'Blacklist contact requests if the email domain is in blacklist domains (separate by comma).', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1548, 1, 'en', 'plugins/contact/contact', 'settings.enable_math_captcha', 'Enable math captcha?', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1549, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1550, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1551, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1552, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1553, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1554, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1555, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1556, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1557, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1558, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1559, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1560, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1561, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1562, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1563, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1564, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1565, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1566, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.style', 'Style', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1567, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.full_width', 'Full width', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1568, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.minimal', 'Minimal', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1569, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1570, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1571, 1, 'en', 'plugins/gallery/gallery', 'create', 'Create new gallery', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1572, 1, 'en', 'plugins/gallery/gallery', 'galleries', 'Galleries', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1573, 1, 'en', 'plugins/gallery/gallery', 'item', 'Gallery item', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1574, 1, 'en', 'plugins/gallery/gallery', 'select_image', 'Select images', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1575, 1, 'en', 'plugins/gallery/gallery', 'reset', 'Reset gallery', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1576, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description', 'Update photo\'s description', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1577, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description_placeholder', 'Photo\'s description...', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1578, 1, 'en', 'plugins/gallery/gallery', 'delete_photo', 'Delete this photo', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1579, 1, 'en', 'plugins/gallery/gallery', 'gallery_box', 'Gallery images', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1580, 1, 'en', 'plugins/gallery/gallery', 'by', 'By', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1581, 1, 'en', 'plugins/gallery/gallery', 'menu_name', 'Galleries', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1582, 1, 'en', 'plugins/gallery/gallery', 'gallery_images', 'Gallery images', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1583, 1, 'en', 'plugins/gallery/gallery', 'add_gallery_short_code', 'Add a gallery', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1584, 1, 'en', 'plugins/gallery/gallery', 'shortcode_name', 'Gallery images', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1585, 1, 'en', 'plugins/gallery/gallery', 'limit_display', 'Limit number display', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1586, 1, 'en', 'plugins/gallery/gallery', 'edit_this_gallery', 'Edit this gallery', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1587, 1, 'en', 'plugins/gallery/gallery', 'galleries_page', 'Galleries page', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1588, 1, 'en', 'plugins/hotel/amenity', 'name', 'Amenities', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1589, 1, 'en', 'plugins/hotel/amenity', 'create', 'New amenity', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1590, 1, 'en', 'plugins/hotel/amenity', 'edit', 'Edit amenity', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1591, 1, 'en', 'plugins/hotel/amenity', 'icon', 'Icon', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1592, 1, 'en', 'plugins/hotel/booking-address', 'name', 'Booking addresses', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1593, 1, 'en', 'plugins/hotel/booking-address', 'create', 'New booking address', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1594, 1, 'en', 'plugins/hotel/booking-address', 'edit', 'Edit booking address', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1595, 1, 'en', 'plugins/hotel/booking-room', 'name', 'Booking rooms', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1596, 1, 'en', 'plugins/hotel/booking-room', 'create', 'New booking room', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1597, 1, 'en', 'plugins/hotel/booking-room', 'edit', 'Edit booking room', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1598, 1, 'en', 'plugins/hotel/booking', 'name', 'Bookings', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1599, 1, 'en', 'plugins/hotel/booking', 'create', 'New booking', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1600, 1, 'en', 'plugins/hotel/booking', 'statuses.pending', 'Pending', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1601, 1, 'en', 'plugins/hotel/booking', 'statuses.processing', 'Processing', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1602, 1, 'en', 'plugins/hotel/booking', 'statuses.completed', 'Completed', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1603, 1, 'en', 'plugins/hotel/booking', 'statuses.cancelled', 'Cancelled', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1604, 1, 'en', 'plugins/hotel/booking', 'amount', 'Amount', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1605, 1, 'en', 'plugins/hotel/booking', 'customer', 'Customer', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1606, 1, 'en', 'plugins/hotel/booking', 'room', 'Room', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1607, 1, 'en', 'plugins/hotel/booking', 'booking_information', 'Booking Information', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1608, 1, 'en', 'plugins/hotel/booking', 'time', 'Time', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1609, 1, 'en', 'plugins/hotel/booking', 'full_name', 'Full Name', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1610, 1, 'en', 'plugins/hotel/booking', 'email', 'Email', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1611, 1, 'en', 'plugins/hotel/booking', 'phone', 'Phone', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1612, 1, 'en', 'plugins/hotel/booking', 'address', 'Address', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1613, 1, 'en', 'plugins/hotel/booking', 'arrival_time', 'Arrival Time', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1614, 1, 'en', 'plugins/hotel/booking', 'start_date', 'Start Date', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1615, 1, 'en', 'plugins/hotel/booking', 'end_date', 'End Date', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1616, 1, 'en', 'plugins/hotel/booking', 'settings.email.title', 'Booking', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1617, 1, 'en', 'plugins/hotel/booking', 'settings.email.description', 'Booking email configuration', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1618, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.notice_title', 'Send notice to administrator', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1619, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new booking', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1620, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.booking_success_title', 'Send email to guest', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1621, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.booking_success_description', 'Email template to send email to guest to confirm booking', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1622, 1, 'en', 'plugins/hotel/booking', 'new_booking_notice', 'You have <span class=\"bold\">:count</span> new booking(s)', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1623, 1, 'en', 'plugins/hotel/booking', 'view_all', 'View all', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1624, 1, 'en', 'plugins/hotel/booking', 'payment_method', 'Payment method', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1625, 1, 'en', 'plugins/hotel/booking', 'payment_status_label', 'Payment status', '2023-11-14 23:28:35', '2023-11-14 23:28:35'),
(1626, 1, 'en', 'plugins/hotel/booking', 'booking_period', 'Booking period', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1627, 1, 'en', 'plugins/hotel/booking', 'reports', 'Booking Reports', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1628, 1, 'en', 'plugins/hotel/booking', 'calendar', 'Booking Calendar', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1629, 1, 'en', 'plugins/hotel/booking', 'calendar_title', ':room (:number_of_rooms room(s), :number_of_guests guest(s))', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1630, 1, 'en', 'plugins/hotel/coupon', 'name', 'Coupons', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1631, 1, 'en', 'plugins/hotel/coupon', 'intro.button_text', 'Create coupon', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1632, 1, 'en', 'plugins/hotel/coupon', 'intro.title', 'Manage coupons code', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1633, 1, 'en', 'plugins/hotel/coupon', 'intro.description', 'Create and manage coupons code for your customers.', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1634, 1, 'en', 'plugins/hotel/coupon', 'types.percentage', 'Percentage', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1635, 1, 'en', 'plugins/hotel/coupon', 'types.fixed', 'Fixed', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1636, 1, 'en', 'plugins/hotel/coupon', 'type', 'Type', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1637, 1, 'en', 'plugins/hotel/coupon', 'created_message', 'Coupon has been created successfully.', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1638, 1, 'en', 'plugins/hotel/coupon', 'expires_date', 'Expires date', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1639, 1, 'en', 'plugins/hotel/coupon', 'expires_time', 'Expires time', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1640, 1, 'en', 'plugins/hotel/coupon', 'never_expired', 'Never expired', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1641, 1, 'en', 'plugins/hotel/coupon', 'save_button', 'Save', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1642, 1, 'en', 'plugins/hotel/coupon', 'coupon_code', 'Coupon code', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1643, 1, 'en', 'plugins/hotel/coupon', 'coupon_code_placeholder', 'Enter coupon code', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1644, 1, 'en', 'plugins/hotel/coupon', 'generate_code_button', 'Generate code', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1645, 1, 'en', 'plugins/hotel/coupon', 'value', 'Value', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1646, 1, 'en', 'plugins/hotel/coupon', 'value_placeholder', 'Enter coupon value', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1647, 1, 'en', 'plugins/hotel/coupon', 'value_off', ':value off', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1648, 1, 'en', 'plugins/hotel/coupon', 'total_used', 'Used', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1649, 1, 'en', 'plugins/hotel/coupon', 'expired', 'Expired', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1650, 1, 'en', 'plugins/hotel/coupon', 'active', 'Active', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1651, 1, 'en', 'plugins/hotel/coupon', 'unlimited', 'Unlimited coupon', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1652, 1, 'en', 'plugins/hotel/coupon', 'quantity', 'Quantity', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1653, 1, 'en', 'plugins/hotel/coupon', 'quantity_placeholder', 'Enter number of coupon', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1654, 1, 'en', 'plugins/hotel/coupon', 'discount_amount', 'Discount amount', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1655, 1, 'en', 'plugins/hotel/coupon', 'total', 'Total', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1656, 1, 'en', 'plugins/hotel/coupon', 'toggle_coupon_form_text', 'You have a coupon code?', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1657, 1, 'en', 'plugins/hotel/coupon', 'apply_coupon_code', 'Apply', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1658, 1, 'en', 'plugins/hotel/currency', 'currencies', 'Currencies', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1659, 1, 'en', 'plugins/hotel/currency', 'setting_description', 'List of currencies using on website', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1660, 1, 'en', 'plugins/hotel/currency', 'name', 'Name', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1661, 1, 'en', 'plugins/hotel/currency', 'symbol', 'Symbol', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1662, 1, 'en', 'plugins/hotel/currency', 'number_of_decimals', 'Number of decimals', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1663, 1, 'en', 'plugins/hotel/currency', 'exchange_rate', 'Exchange rate', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1664, 1, 'en', 'plugins/hotel/currency', 'is_prefix_symbol', 'Position of symbol', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1665, 1, 'en', 'plugins/hotel/currency', 'is_default', 'Is default?', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1666, 1, 'en', 'plugins/hotel/currency', 'remove', 'Remove', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1667, 1, 'en', 'plugins/hotel/currency', 'new_currency', 'Add a new currency', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1668, 1, 'en', 'plugins/hotel/currency', 'save_settings', 'Save settings', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1669, 1, 'en', 'plugins/hotel/currency', 'before_number', 'Before number', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1670, 1, 'en', 'plugins/hotel/currency', 'after_number', 'After number', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1671, 1, 'en', 'plugins/hotel/currency', 'require_at_least_one_currency', 'The system requires at least one currency!', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1672, 1, 'en', 'plugins/hotel/currency', 'thousands_separator', 'Thousands separator', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1673, 1, 'en', 'plugins/hotel/currency', 'decimal_separator', 'Decimal separator', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1674, 1, 'en', 'plugins/hotel/currency', 'separator_period', 'Period (.)', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1675, 1, 'en', 'plugins/hotel/currency', 'separator_comma', 'Comma (,)', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1676, 1, 'en', 'plugins/hotel/currency', 'separator_space', 'Space ( )', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1677, 1, 'en', 'plugins/hotel/currency', 'enable_auto_detect_visitor_currency', 'Enable auto-detect visitor currency?', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1678, 1, 'en', 'plugins/hotel/currency', 'add_space_between_price_and_currency', 'Add a space between price and currency?', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1679, 1, 'en', 'plugins/hotel/currency', 'instruction', 'Please check list currency code here: https://en.wikipedia.org/wiki/ISO_4217', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1680, 1, 'en', 'plugins/hotel/customer', 'name', 'Customers', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1681, 1, 'en', 'plugins/hotel/customer', 'create', 'New customer', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1682, 1, 'en', 'plugins/hotel/customer', 'edit', 'Edit customer', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1683, 1, 'en', 'plugins/hotel/customer', 'form.first_name', 'First Name', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1684, 1, 'en', 'plugins/hotel/customer', 'form.first_name_placeholder', 'First Name', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1685, 1, 'en', 'plugins/hotel/customer', 'form.last_name', 'Last Name', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1686, 1, 'en', 'plugins/hotel/customer', 'form.last_name_placeholder', 'Last Name', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1687, 1, 'en', 'plugins/hotel/customer', 'form.email', 'Email', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1688, 1, 'en', 'plugins/hotel/customer', 'form.email_placeholder', 'Ex: example@gmail.com', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1689, 1, 'en', 'plugins/hotel/customer', 'form.phone', 'Phone', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1690, 1, 'en', 'plugins/hotel/customer', 'change_password', 'Change password ?', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1691, 1, 'en', 'plugins/hotel/customer', 'password', 'Password', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1692, 1, 'en', 'plugins/hotel/customer', 'password_confirmation', 'Password confirmation', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1693, 1, 'en', 'plugins/hotel/feature', 'menu', 'Hotel features', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1694, 1, 'en', 'plugins/hotel/feature', 'name', 'Features', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1695, 1, 'en', 'plugins/hotel/feature', 'create', 'New feature', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1696, 1, 'en', 'plugins/hotel/feature', 'edit', 'Edit feature', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1697, 1, 'en', 'plugins/hotel/feature', 'form.icon', 'Icon', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1698, 1, 'en', 'plugins/hotel/food-type', 'name', 'Food types', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1699, 1, 'en', 'plugins/hotel/food-type', 'create', 'New food type', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1700, 1, 'en', 'plugins/hotel/food-type', 'edit', 'Edit food type', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1701, 1, 'en', 'plugins/hotel/food-type', 'form.icon', 'Icon', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1702, 1, 'en', 'plugins/hotel/food', 'name', 'Foods', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1703, 1, 'en', 'plugins/hotel/food', 'create', 'New food', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1704, 1, 'en', 'plugins/hotel/food', 'edit', 'Edit food', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1705, 1, 'en', 'plugins/hotel/food', 'form.food_type', 'Food Type', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1706, 1, 'en', 'plugins/hotel/food', 'form.price', 'Price', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1707, 1, 'en', 'plugins/hotel/food', 'form.currency', 'Currency', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1708, 1, 'en', 'plugins/hotel/food', 'form.images', 'Images', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1709, 1, 'en', 'plugins/hotel/hotel', 'name', 'Hotel', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1710, 1, 'en', 'plugins/hotel/hotel', 'settings', 'Settings', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1711, 1, 'en', 'plugins/hotel/hotel', 'booking_name', 'Booking name', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1712, 1, 'en', 'plugins/hotel/hotel', 'booking_email', 'Booking email', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1713, 1, 'en', 'plugins/hotel/hotel', 'booking_phone', 'Booking phone', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1714, 1, 'en', 'plugins/hotel/hotel', 'booking_address', 'Booking address', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1715, 1, 'en', 'plugins/hotel/hotel', 'booking_link', 'Booking link', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1716, 1, 'en', 'plugins/hotel/hotel', 'review_settings', 'Review settings', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1717, 1, 'en', 'plugins/hotel/hotel', 'review_settings_description', 'Review settings for Hotel', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1718, 1, 'en', 'plugins/hotel/hotel', 'enable_review_room', 'Enable review?', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1719, 1, 'en', 'plugins/hotel/hotel', 'reviews_per_page', 'Number of reviews per page?', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1720, 1, 'en', 'plugins/hotel/hotel', 'reviews', 'Reviews', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1721, 1, 'en', 'plugins/hotel/invoice', 'name', 'Invoices', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1722, 1, 'en', 'plugins/hotel/invoice', 'amount', 'Amount', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1723, 1, 'en', 'plugins/hotel/invoice', 'customer', 'Customer', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1724, 1, 'en', 'plugins/hotel/invoice', 'tax', 'Tax', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1725, 1, 'en', 'plugins/hotel/invoice', 'code', 'Code', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1726, 1, 'en', 'plugins/hotel/invoice', 'show', 'Invoice :code', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1727, 1, 'en', 'plugins/hotel/invoice', 'print', 'Print Invoice', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1728, 1, 'en', 'plugins/hotel/invoice', 'download', 'Download Invoice', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1729, 1, 'en', 'plugins/hotel/invoice', 'heading', 'Invoice', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1730, 1, 'en', 'plugins/hotel/invoice', 'purchase_at', 'Purchase at', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1731, 1, 'en', 'plugins/hotel/invoice', 'sub_total', 'Sub total', '2023-11-14 23:28:36', '2023-11-14 23:28:36'),
(1732, 1, 'en', 'plugins/hotel/invoice', 'tax_amount', 'Tax amount', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1733, 1, 'en', 'plugins/hotel/invoice', 'discount_amount', 'Discount amount', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1734, 1, 'en', 'plugins/hotel/invoice', 'total_amount', 'Total amount', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1735, 1, 'en', 'plugins/hotel/invoice', 'status', 'Status', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1736, 1, 'en', 'plugins/hotel/invoice', 'account', 'Account', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1737, 1, 'en', 'plugins/hotel/invoice', 'payment_info', 'Payment Information', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1738, 1, 'en', 'plugins/hotel/invoice', 'payment_method', 'Payment method', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1739, 1, 'en', 'plugins/hotel/invoice', 'payment_status', 'Payment status', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1740, 1, 'en', 'plugins/hotel/invoice', 'item.name', 'Name', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1741, 1, 'en', 'plugins/hotel/invoice', 'item.qty', 'Quantity', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1742, 1, 'en', 'plugins/hotel/invoice', 'item.description', 'Description', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1743, 1, 'en', 'plugins/hotel/invoice', 'statuses.pending', 'Pending', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1744, 1, 'en', 'plugins/hotel/invoice', 'statuses.processing', 'Processing', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1745, 1, 'en', 'plugins/hotel/invoice', 'statuses.completed', 'Completed', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1746, 1, 'en', 'plugins/hotel/invoice', 'statuses.canceled', 'Canceled', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1747, 1, 'en', 'plugins/hotel/invoice', 'template.name', 'Invoice Template', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1748, 1, 'en', 'plugins/hotel/invoice', 'template.setting', 'Invoice Settings', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1749, 1, 'en', 'plugins/hotel/invoice', 'template.setting_description', 'Settings for Invoice template', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1750, 1, 'en', 'plugins/hotel/invoice', 'template.setting_content', 'Content', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1751, 1, 'en', 'plugins/hotel/invoice', 'template.preview', 'Preview', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1752, 1, 'en', 'plugins/hotel/invoice', 'template.preview_heading', 'Preview Invoice template', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1753, 1, 'en', 'plugins/hotel/place', 'name', 'Places', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1754, 1, 'en', 'plugins/hotel/place', 'create', 'New place', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1755, 1, 'en', 'plugins/hotel/place', 'edit', 'Edit place', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1756, 1, 'en', 'plugins/hotel/place', 'form.distance', 'Distance', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1757, 1, 'en', 'plugins/hotel/place', 'form.distance_placeholder', 'Ex: 1,500m | 21 min. Walk', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1758, 1, 'en', 'plugins/hotel/review', 'name', 'Reviews', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1759, 1, 'en', 'plugins/hotel/review', 'author', 'Author', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1760, 1, 'en', 'plugins/hotel/review', 'star', 'Star', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1761, 1, 'en', 'plugins/hotel/review', 'content', 'Content', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1762, 1, 'en', 'plugins/hotel/review', 'room_id', 'Room ID', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1763, 1, 'en', 'plugins/hotel/review', 'moderation-statuses.pending', 'Pending', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1764, 1, 'en', 'plugins/hotel/review', 'moderation-statuses.approved', 'Approved', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1765, 1, 'en', 'plugins/hotel/review', 'moderation-statuses.rejected', 'Rejected', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1766, 1, 'en', 'plugins/hotel/room-category', 'name', 'Room categories', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1767, 1, 'en', 'plugins/hotel/room-category', 'create', 'New room category', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1768, 1, 'en', 'plugins/hotel/room-category', 'edit', 'Edit room category', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1769, 1, 'en', 'plugins/hotel/room', 'name', 'Rooms', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1770, 1, 'en', 'plugins/hotel/room', 'create', 'New room', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1771, 1, 'en', 'plugins/hotel/room', 'edit', 'Edit room', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1772, 1, 'en', 'plugins/hotel/room', 'images', 'Images', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1773, 1, 'en', 'plugins/hotel/room', 'amenities', 'Amenities', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1774, 1, 'en', 'plugins/hotel/room', 'form.price', 'Price', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1775, 1, 'en', 'plugins/hotel/room', 'form.currency', 'Currency', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1776, 1, 'en', 'plugins/hotel/room', 'form.max_children', 'Max children', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1777, 1, 'en', 'plugins/hotel/room', 'form.max_adults', 'Max adults', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1778, 1, 'en', 'plugins/hotel/room', 'form.category', 'Category', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1779, 1, 'en', 'plugins/hotel/room', 'form.size', 'Size (m2)', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1780, 1, 'en', 'plugins/hotel/room', 'form.number_of_rooms', 'Number of rooms (quantity)', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1781, 1, 'en', 'plugins/hotel/room', 'form.number_of_beds', 'Number of beds', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1782, 1, 'en', 'plugins/hotel/room', 'form.room_availability', 'Room Availability', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1783, 1, 'en', 'plugins/hotel/room', 'form.close', 'Close', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1784, 1, 'en', 'plugins/hotel/room', 'form.save_changes', 'Save changes', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1785, 1, 'en', 'plugins/hotel/room', 'form.is_available', 'Available for booking?', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1786, 1, 'en', 'plugins/hotel/room', 'form.status', 'Status', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1787, 1, 'en', 'plugins/hotel/room', 'form.value', 'Value', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1788, 1, 'en', 'plugins/hotel/room', 'form.fixed', 'Fixed', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1789, 1, 'en', 'plugins/hotel/room', 'form.amount_adjust', 'Amount Adjustment', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1790, 1, 'en', 'plugins/hotel/room', 'form.percentage_adjust', 'Percentage Adjustment (%)', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1791, 1, 'en', 'plugins/hotel/room', 'form.no_repeat', 'No Repeat', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1792, 1, 'en', 'plugins/hotel/room', 'form.weekly', 'Weekly', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1793, 1, 'en', 'plugins/hotel/room', 'form.weekend', 'Weekend', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1794, 1, 'en', 'plugins/hotel/room', 'form.start_date', 'Start date', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1795, 1, 'en', 'plugins/hotel/room', 'form.end_date', 'End date', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1796, 1, 'en', 'plugins/hotel/room', 'form.tax', 'Tax', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1797, 1, 'en', 'plugins/hotel/room', 'blocked', 'Blocked', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1798, 1, 'en', 'plugins/hotel/room', 'full_book', 'Full Book', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1799, 1, 'en', 'plugins/hotel/service', 'name', 'Services', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1800, 1, 'en', 'plugins/hotel/service', 'create', 'New service', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1801, 1, 'en', 'plugins/hotel/service', 'edit', 'Edit service', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1802, 1, 'en', 'plugins/hotel/service', 'form.price', 'Price', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1803, 1, 'en', 'plugins/hotel/service', 'form.currency', 'Currency', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1804, 1, 'en', 'plugins/hotel/service', 'form.price_type', 'Price type', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1805, 1, 'en', 'plugins/hotel/service', 'form.price_types.once', 'Pay once', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1806, 1, 'en', 'plugins/hotel/service', 'form.price_types.per_day', 'Per each day', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1807, 1, 'en', 'plugins/hotel/settings', 'invoicing.company_name', 'Company name', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1808, 1, 'en', 'plugins/hotel/settings', 'invoicing.company_address', 'Company address', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1809, 1, 'en', 'plugins/hotel/settings', 'invoicing.company_email', 'Company email', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1810, 1, 'en', 'plugins/hotel/settings', 'invoicing.company_phone', 'Company phone', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1811, 1, 'en', 'plugins/hotel/settings', 'invoicing.company_logo', 'Company logo', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1812, 1, 'en', 'plugins/hotel/settings', 'using_custom_font_for_invoice', 'Using custom font for invoice?', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1813, 1, 'en', 'plugins/hotel/settings', 'invoice_font_family', 'Invoice font family (Only work for Latin language)', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1814, 1, 'en', 'plugins/hotel/settings', 'enable_invoice_stamp', 'Enable invoice stamp?', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1815, 1, 'en', 'plugins/hotel/settings', 'invoice_support_arabic_language', 'Support Arabic language in invoice?', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1816, 1, 'en', 'plugins/hotel/settings', 'invoice_code_prefix', 'Invoice code prefix', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1817, 1, 'en', 'plugins/hotel/settings', 'invoice_settings', 'Invoice Settings', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1818, 1, 'en', 'plugins/hotel/settings', 'invoice_settings_description', 'Settings Invoice information for invoicing', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1819, 1, 'en', 'plugins/hotel/tax', 'name', 'Taxes', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1820, 1, 'en', 'plugins/hotel/tax', 'create', 'Create a tax', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1821, 1, 'en', 'plugins/hotel/tax', 'edit', 'Edit tax :title', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1822, 1, 'en', 'plugins/hotel/tax', 'title', 'Title', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1823, 1, 'en', 'plugins/hotel/tax', 'percentage', 'Percentage %', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1824, 1, 'en', 'plugins/hotel/tax', 'priority', 'Priority', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1825, 1, 'en', 'plugins/hotel/tax', 'select_tax', '-- select --', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1826, 1, 'en', 'plugins/language/language', 'name', 'Languages', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1827, 1, 'en', 'plugins/language/language', 'choose_language', 'Choose a language', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1828, 1, 'en', 'plugins/language/language', 'select_language', 'Select language', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1829, 1, 'en', 'plugins/language/language', 'choose_language_helper', 'You can choose a language in the list or directly edit it below.', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1830, 1, 'en', 'plugins/language/language', 'language_name', 'Language name', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1831, 1, 'en', 'plugins/language/language', 'language_name_helper', 'The name is how it is displayed on your site (for example: English).', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1832, 1, 'en', 'plugins/language/language', 'locale', 'Locale', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1833, 1, 'en', 'plugins/language/language', 'locale_helper', 'Laravel Locale for the language (for example: <code>en</code>).', '2023-11-14 23:28:37', '2023-11-14 23:28:37'),
(1834, 1, 'en', 'plugins/language/language', 'language_code', 'Language code', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1835, 1, 'en', 'plugins/language/language', 'language_code_helper', 'Language code - preferably 2-letters ISO 639-1 (for example: en)', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1836, 1, 'en', 'plugins/language/language', 'text_direction', 'Text direction', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1837, 1, 'en', 'plugins/language/language', 'text_direction_helper', 'Choose the text direction for the language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1838, 1, 'en', 'plugins/language/language', 'left_to_right', 'Left to right', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1839, 1, 'en', 'plugins/language/language', 'right_to_left', 'Right to left', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1840, 1, 'en', 'plugins/language/language', 'flag', 'Flag', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1841, 1, 'en', 'plugins/language/language', 'flag_helper', 'Choose a flag for the language.', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1842, 1, 'en', 'plugins/language/language', 'order', 'Order', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1843, 1, 'en', 'plugins/language/language', 'order_helper', 'Position of the language in the language switcher', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1844, 1, 'en', 'plugins/language/language', 'add_new_language', 'Add new language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1845, 1, 'en', 'plugins/language/language', 'code', 'Code', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1846, 1, 'en', 'plugins/language/language', 'default_language', 'Is default?', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1847, 1, 'en', 'plugins/language/language', 'actions', 'Actions', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1848, 1, 'en', 'plugins/language/language', 'translations', 'Translations', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1849, 1, 'en', 'plugins/language/language', 'edit', 'Edit', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1850, 1, 'en', 'plugins/language/language', 'edit_tooltip', 'Edit this language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1851, 1, 'en', 'plugins/language/language', 'delete', 'Delete', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1852, 1, 'en', 'plugins/language/language', 'delete_tooltip', 'Delete this language and all its associated data', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1853, 1, 'en', 'plugins/language/language', 'choose_default_language', 'Choose :language as default language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1854, 1, 'en', 'plugins/language/language', 'current_language', 'Current record\'s language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1855, 1, 'en', 'plugins/language/language', 'edit_related', 'Edit related language for this record', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1856, 1, 'en', 'plugins/language/language', 'add_language_for_item', 'Add other language version for this record', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1857, 1, 'en', 'plugins/language/language', 'settings', 'Settings', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1858, 1, 'en', 'plugins/language/language', 'language_hide_default', 'Hide default language from URL?', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1859, 1, 'en', 'plugins/language/language', 'language_display_flag_only', 'Flag only', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1860, 1, 'en', 'plugins/language/language', 'language_display_name_only', 'Name only', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1861, 1, 'en', 'plugins/language/language', 'language_display_all', 'Display all flag and name', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1862, 1, 'en', 'plugins/language/language', 'language_display', 'Language display', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1863, 1, 'en', 'plugins/language/language', 'switcher_display', 'Switcher language display', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1864, 1, 'en', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1865, 1, 'en', 'plugins/language/language', 'language_switcher_display_list', 'List', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1866, 1, 'en', 'plugins/language/language', 'current_language_edit_notification', 'You are editing \"<strong class=\"current_language_text\">:language</strong>\" version', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1867, 1, 'en', 'plugins/language/language', 'confirm-change-language', 'Confirm change language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1868, 1, 'en', 'plugins/language/language', 'confirm-change-language-message', 'Do you really want to change language to \"<strong class=\"change_to_language_text\"></strong>\" ? This action will be override \"<strong class=\"change_to_language_text\"></strong>\" version if it\'s existed!', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1869, 1, 'en', 'plugins/language/language', 'confirm-change-language-btn', 'Confirm change', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1870, 1, 'en', 'plugins/language/language', 'hide_languages', 'Hide languages', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1871, 1, 'en', 'plugins/language/language', 'hide_languages_description', 'You can completely hide content in specific languages from visitors and search engines, but still view it yourself. This allows reviewing translations that are in progress.', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1872, 1, 'en', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} All languages are currently displayed.|{1} :language is currently hidden to visitors.|[2, Inf] :language are currently hidden to visitors.', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1873, 1, 'en', 'plugins/language/language', 'show_all', 'Show all', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1874, 1, 'en', 'plugins/language/language', 'change_language', 'Language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1875, 1, 'en', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Show item in default language if it is not existed in current language', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1876, 1, 'en', 'plugins/language/language', 'select_flag', 'Select a flag...', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1877, 1, 'en', 'plugins/language/language', 'delete_confirmation_message', 'Do you really want to delete this language? It also deletes all items in this language and cannot rollback!', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1878, 1, 'en', 'plugins/language/language', 'added_already', 'This language was added already!', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1879, 1, 'en', 'plugins/language/language', 'language_auto_detect_user_language', 'Auto detect user language?', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1880, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1881, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1882, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1883, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1884, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1885, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1886, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1887, 1, 'en', 'plugins/newsletter/newsletter', 'settings.title', 'Newsletter', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1888, 1, 'en', 'plugins/newsletter/newsletter', 'settings.description', 'Settings for newsletter (auto send newsletter email to SendGrid, Mailchimp... when someone register newsletter on website).', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1889, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_api_key', 'Mailchimp API Key', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1890, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list_id', 'Mailchimp List ID', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1891, 1, 'en', 'plugins/newsletter/newsletter', 'settings.mailchimp_list', 'Mailchimp List', '2023-11-14 23:28:38', '2023-11-14 23:28:38');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1892, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_api_key', 'Sendgrid API Key', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1893, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list_id', 'Sendgrid List ID', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1894, 1, 'en', 'plugins/newsletter/newsletter', 'settings.sendgrid_list', 'Sendgrid List', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1895, 1, 'en', 'plugins/newsletter/newsletter', 'settings.enable_newsletter_contacts_list_api', 'Enable newsletter contacts list API?', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1896, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1897, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1898, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1899, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1900, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1901, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1902, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1903, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1904, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1905, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1906, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1907, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1908, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1909, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1910, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1911, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Fast and safe online payment via PayPal.', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1912, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1913, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1914, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1915, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1916, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1917, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1918, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1919, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1920, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1921, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1922, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1923, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1924, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2023-11-14 23:28:38', '2023-11-14 23:28:38'),
(1925, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1926, 1, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1927, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1928, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1929, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1930, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1931, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1932, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1933, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1934, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1935, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1936, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1937, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1938, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1939, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1940, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1941, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1942, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1943, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1944, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1945, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1946, 1, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1947, 1, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1948, 1, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1949, 1, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1950, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1951, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1952, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1953, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1954, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1955, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1956, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1957, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1958, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1959, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1960, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1961, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1962, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1963, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1964, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1965, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1966, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1967, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1968, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1969, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1970, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1971, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1972, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1973, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1974, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1975, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1976, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1977, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1978, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1979, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1980, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1981, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1982, 1, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1983, 1, 'en', 'plugins/payment/payment', 'refunds.title', 'Refunds', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1984, 1, 'en', 'plugins/payment/payment', 'refunds.id', 'ID', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1985, 1, 'en', 'plugins/payment/payment', 'refunds.breakdowns', 'Breakdowns', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1986, 1, 'en', 'plugins/payment/payment', 'refunds.gross_amount', 'Gross amount', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1987, 1, 'en', 'plugins/payment/payment', 'refunds.paypal_fee', 'PayPal fee', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1988, 1, 'en', 'plugins/payment/payment', 'refunds.net_amount', 'Net amount', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1989, 1, 'en', 'plugins/payment/payment', 'refunds.total_refunded_amount', 'Total refunded amount', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1990, 1, 'en', 'plugins/payment/payment', 'refunds.create_time', 'Create time', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1991, 1, 'en', 'plugins/payment/payment', 'refunds.update_time', 'Update time', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1992, 1, 'en', 'plugins/payment/payment', 'refunds.status', 'Status', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1993, 1, 'en', 'plugins/payment/payment', 'refunds.description', 'Description', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1994, 1, 'en', 'plugins/payment/payment', 'refunds.refunded_at', 'Refunded at', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1995, 1, 'en', 'plugins/payment/payment', 'refunds.error_message', 'Error message', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1996, 1, 'en', 'plugins/payment/payment', 'view_response_source', 'View response source', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1997, 1, 'en', 'plugins/payment/payment', 'status_is_not_completed', 'Status is not COMPLETED', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1998, 1, 'en', 'plugins/payment/payment', 'cannot_found_capture_id', 'Can not found capture id with payment detail', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(1999, 1, 'en', 'plugins/payment/payment', 'amount_refunded', 'Amount refunded', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(2000, 1, 'en', 'plugins/payment/payment', 'amount_remaining', 'Amount remaining', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(2001, 1, 'en', 'plugins/payment/payment', 'paid_at', 'Paid At', '2023-11-14 23:28:39', '2023-11-14 23:28:39'),
(2002, 1, 'en', 'plugins/payment/payment', 'invalid_settings', 'Settings for :name are invalid!', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2003, 1, 'en', 'plugins/payment/payment', 'view_transaction', 'Transaction \":charge_id\"', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2004, 1, 'en', 'plugins/payment/payment', 'payment_description', 'Pay for your order #:order_id at :site_url', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2005, 1, 'en', 'plugins/testimonial/testimonial', 'name', 'Testimonials', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2006, 1, 'en', 'plugins/testimonial/testimonial', 'create', 'New testimonial', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2007, 1, 'en', 'plugins/testimonial/testimonial', 'company', 'Position/Company', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2008, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2009, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2010, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to lang folder. Please use \"Publish translations\" button to apply changes.', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2011, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2012, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2013, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2014, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2015, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2016, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2017, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2018, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2019, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2020, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2021, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2022, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2023, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2024, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2025, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Other translations', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2026, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2027, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2028, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2029, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2030, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2031, 1, 'en', 'plugins/translation/translation', 'locale_placeholder', 'Ex: en', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2032, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2033, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2034, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2035, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2036, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2037, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2038, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2039, 1, 'en', 'plugins/translation/translation', 'folder_is_not_writeable', 'Cannot write files! Folder :lang_path is not writable. Please chmod to make it writable!', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2040, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2041, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in :lang_path!', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2042, 1, 'en', 'plugins/translation/translation', 'download', 'Download', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2043, 1, 'en', 'plugins/translation/translation', 'select_locale', 'Select locale', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2044, 1, 'en', 'plugins/translation/translation', 'theme_translations_instruction', 'Click on text to translate. Do NOT translate variables, Eg. :username, :query, :link...', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2045, 1, 'en', 'plugins/translation/translation', 'import_available_locale', 'Or import available locale from our GitHub repository', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2046, 1, 'en', 'plugins/translation/translation', 'add_new_locale', 'Add new locale', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2047, 1, 'en', 'plugins/translation/translation', 'download_locale', 'Download locale', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2048, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation', 'Download locale from GitHub', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2049, 1, 'en', 'plugins/translation/translation', 'import_available_locale_confirmation_content', 'Are you sure you want to download this locale? It will be downloaded into :lang_path, you can delete it later if you want.', '2023-11-14 23:28:40', '2023-11-14 23:28:40'),
(2050, 1, 'en', 'plugins/translation/translation', 'is_default', 'Is default?', '2023-11-14 23:28:40', '2023-11-14 23:28:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `avatar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `permissions`, `last_login`) VALUES
(1, 'prog.basma@gmail.com', NULL, '$2y$12$d9qCTfnZJivDwtPv19ji3uVreJ2C2pNp5T6hzHPhdRZwg5hX.bGKW', 'QLwf33hp0QMFhCSTwdZiAYajYjAFOuBrbGB82b3Mr3U0DV5NSPdEG8rZAxnv', '2023-11-22 16:17:41', '2023-11-22 16:17:41', 'Basma', 'Ahmed', 'progbasma', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) NOT NULL,
  `sidebar_id` varchar(120) NOT NULL,
  `theme` varchar(120) NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'CustomMenuWidget', 'footer_sidebar', 'miranda', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Services.\",\"menu_id\":\"services\"}', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(2, 'RecentPostsWidget', 'primary_sidebar', 'miranda', 0, '{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":5}', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(3, 'BlogCategoriesWidget', 'primary_sidebar', 'miranda', 1, '{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"number_display\":5}', '2023-11-14 23:28:22', '2023-11-14 23:28:22'),
(4, 'BlogTagsWidget', 'primary_sidebar', 'miranda', 2, '{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\",\"number_display\":5}', '2023-11-14 23:28:22', '2023-11-14 23:28:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_status_index` (`status`),
  ADD KEY `categories_created_at_index` (`created_at`);

--
-- Indexes for table `categories_translations`
--
ALTER TABLE `categories_translations`
  ADD PRIMARY KEY (`lang_code`,`categories_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `galleries_translations`
--
ALTER TABLE `galleries_translations`
  ADD PRIMARY KEY (`lang_code`,`galleries_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `gallery_meta_translations`
--
ALTER TABLE `gallery_meta_translations`
  ADD PRIMARY KEY (`lang_code`,`gallery_meta_id`);

--
-- Indexes for table `ht_amenities`
--
ALTER TABLE `ht_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_amenities_translations`
--
ALTER TABLE `ht_amenities_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_amenities_id`);

--
-- Indexes for table `ht_bookings`
--
ALTER TABLE `ht_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_booking_addresses`
--
ALTER TABLE `ht_booking_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_booking_rooms`
--
ALTER TABLE `ht_booking_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_booking_services`
--
ALTER TABLE `ht_booking_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_coupons`
--
ALTER TABLE `ht_coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ht_coupons_code_unique` (`code`);

--
-- Indexes for table `ht_currencies`
--
ALTER TABLE `ht_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_customers`
--
ALTER TABLE `ht_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ht_customers_email_unique` (`email`);

--
-- Indexes for table `ht_customer_password_resets`
--
ALTER TABLE `ht_customer_password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `ht_features`
--
ALTER TABLE `ht_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_features_translations`
--
ALTER TABLE `ht_features_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_features_id`);

--
-- Indexes for table `ht_foods`
--
ALTER TABLE `ht_foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_foods_translations`
--
ALTER TABLE `ht_foods_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_foods_id`);

--
-- Indexes for table `ht_food_types`
--
ALTER TABLE `ht_food_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_food_types_translations`
--
ALTER TABLE `ht_food_types_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_food_types_id`);

--
-- Indexes for table `ht_invoices`
--
ALTER TABLE `ht_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ht_invoices_code_unique` (`code`),
  ADD KEY `ht_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  ADD KEY `ht_invoices_payment_id_index` (`payment_id`),
  ADD KEY `ht_invoices_status_index` (`status`),
  ADD KEY `ht_invoices_customer_id_index` (`customer_id`);

--
-- Indexes for table `ht_invoice_items`
--
ALTER TABLE `ht_invoice_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_places`
--
ALTER TABLE `ht_places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_places_translations`
--
ALTER TABLE `ht_places_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_places_id`);

--
-- Indexes for table `ht_rooms`
--
ALTER TABLE `ht_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_rooms_amenities`
--
ALTER TABLE `ht_rooms_amenities`
  ADD PRIMARY KEY (`amenity_id`,`room_id`),
  ADD KEY `ht_rooms_amenities_amenity_id_index` (`amenity_id`),
  ADD KEY `ht_rooms_amenities_room_id_index` (`room_id`);

--
-- Indexes for table `ht_rooms_translations`
--
ALTER TABLE `ht_rooms_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_rooms_id`);

--
-- Indexes for table `ht_room_categories`
--
ALTER TABLE `ht_room_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_room_categories_translations`
--
ALTER TABLE `ht_room_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_room_categories_id`);

--
-- Indexes for table `ht_room_dates`
--
ALTER TABLE `ht_room_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_room_reviews`
--
ALTER TABLE `ht_room_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_services`
--
ALTER TABLE `ht_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_services_translations`
--
ALTER TABLE `ht_services_translations`
  ADD PRIMARY KEY (`lang_code`,`ht_services_id`);

--
-- Indexes for table `ht_taxes`
--
ALTER TABLE `ht_taxes`
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
  ADD PRIMARY KEY (`lang_id`),
  ADD KEY `lang_locale_index` (`lang_locale`),
  ADD KEY `lang_code_index` (`lang_code`),
  ADD KEY `lang_is_default_index` (`lang_is_default`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_reference_id_index` (`reference_id`),
  ADD KEY `meta_code_index` (`lang_meta_code`),
  ADD KEY `meta_origin_index` (`lang_meta_origin`),
  ADD KEY `meta_reference_type_index` (`reference_type`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`),
  ADD KEY `media_files_index` (`folder_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`),
  ADD KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `reference_id` (`reference_id`),
  ADD KEY `reference_type` (`reference_type`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_reference_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_index` (`user_id`);

--
-- Indexes for table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`lang_code`,`pages_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_status_index` (`status`),
  ADD KEY `posts_author_id_index` (`author_id`),
  ADD KEY `posts_author_type_index` (`author_type`),
  ADD KEY `posts_created_at_index` (`created_at`);

--
-- Indexes for table `posts_translations`
--
ALTER TABLE `posts_translations`
  ADD PRIMARY KEY (`lang_code`,`posts_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD KEY `post_categories_category_id_index` (`category_id`),
  ADD KEY `post_categories_post_id_index` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_tag_id_index` (`tag_id`),
  ADD KEY `post_tags_post_id_index` (`post_id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slugs_reference_id_index` (`reference_id`),
  ADD KEY `slugs_key_index` (`key`),
  ADD KEY `slugs_prefix_index` (`prefix`),
  ADD KEY `slugs_reference_index` (`reference_id`,`reference_type`);

--
-- Indexes for table `slugs_translations`
--
ALTER TABLE `slugs_translations`
  ADD PRIMARY KEY (`lang_code`,`slugs_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`lang_code`,`tags_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials_translations`
--
ALTER TABLE `testimonials_translations`
  ADD PRIMARY KEY (`lang_code`,`testimonials_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_amenities`
--
ALTER TABLE `ht_amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ht_bookings`
--
ALTER TABLE `ht_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ht_booking_addresses`
--
ALTER TABLE `ht_booking_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ht_booking_rooms`
--
ALTER TABLE `ht_booking_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ht_booking_services`
--
ALTER TABLE `ht_booking_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ht_coupons`
--
ALTER TABLE `ht_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ht_currencies`
--
ALTER TABLE `ht_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ht_customers`
--
ALTER TABLE `ht_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ht_features`
--
ALTER TABLE `ht_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_foods`
--
ALTER TABLE `ht_foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ht_food_types`
--
ALTER TABLE `ht_food_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_invoices`
--
ALTER TABLE `ht_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ht_invoice_items`
--
ALTER TABLE `ht_invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `ht_places`
--
ALTER TABLE `ht_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_rooms`
--
ALTER TABLE `ht_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ht_room_categories`
--
ALTER TABLE `ht_room_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ht_room_dates`
--
ALTER TABLE `ht_room_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ht_room_reviews`
--
ALTER TABLE `ht_room_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ht_services`
--
ALTER TABLE `ht_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_taxes`
--
ALTER TABLE `ht_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2051;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
