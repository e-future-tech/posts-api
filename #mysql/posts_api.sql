-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2025 at 08:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `posts_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 11, 9, '2025-08-28 11:45:26', '2025-08-28 11:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sports', '2025-08-28 11:06:10', '2025-08-28 11:06:10', NULL),
(2, 'game', '2025-08-28 11:06:16', '2025-08-28 11:06:16', NULL),
(3, 'electronic', '2025-08-28 11:06:26', '2025-08-28 11:06:26', NULL),
(4, 'programming', '2025-08-28 11:07:21', '2025-08-28 11:07:21', NULL),
(5, 'food', '2025-08-28 11:07:38', '2025-08-28 11:08:57', '2025-08-28 11:08:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Post', 13, 'f32450ae-2f59-4710-99b6-0ceff449f6d2', 'articles', 'book cover', 'book-cover.jpg', 'image/jpeg', 'public', 'public', 179699, '[]', '[]', '[]', '[]', 1, '2025-08-28 11:23:27', '2025-08-28 11:23:27');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_27_073255_create_personal_access_tokens_table', 1),
(5, '2025_08_27_114829 _create_categories_table', 1),
(6, '2025_08_27_125649_create_posts_table', 1),
(7, '2025_08_27_165348_create_bookmarks_table', 1),
(8, '2025_08_28_055237_create_media_table', 1),
(9, '2025_08_28_095044_add_deleted_at_to_posts_table', 1),
(10, '2025_08_28_095706_add_deleted_at_to_category_table', 1),
(11, '2025_08_28_114658_add_two_factor_columns_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'api-token', 'ef4bd6b495691eaa525b242dbca388d80479bd1970b25d58091cbc68c2109287', '[\"*\"]', NULL, NULL, '2025-08-28 07:41:20', '2025-08-28 07:41:20'),
(2, 'App\\Models\\User', 11, 'api-token', '2aeeafb2b16c12202a8f530566a37237cd8bb4ccd240704aeac6d8c98d6b15a3', '[\"*\"]', NULL, NULL, '2025-08-28 08:24:48', '2025-08-28 08:24:48'),
(4, 'App\\Models\\User', 11, 'api-token', '63fb9bedca0fe94ce123f3825aebda455dbaf8167a377881e1ef023009e6d0d6', '[\"*\"]', '2025-08-28 11:23:27', NULL, '2025-08-28 11:04:21', '2025-08-28 11:23:27'),
(5, 'App\\Models\\User', 12, 'api-token', '47f6e4e7a289538f5dc1caecf9b9c6c326684b5304734ae56ef5aaaacb28e50a', '[\"*\"]', NULL, NULL, '2025-08-28 11:32:25', '2025-08-28 11:32:25'),
(6, 'App\\Models\\User', 11, 'api-token', 'b002ca0cf677e7465ff6208ca482034d3dbce78bc16e0ca46675e55c36192590', '[\"*\"]', '2025-08-28 11:36:33', NULL, '2025-08-28 11:33:15', '2025-08-28 11:36:33'),
(7, 'App\\Models\\User', 11, 'api-token', 'ab896e9baf09a4056ea9c5012f33fc2acc2b20a2ee7df453e006a2364bb03b32', '[\"*\"]', '2025-08-28 11:46:47', NULL, '2025-08-28 11:36:53', '2025-08-28 11:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `slug`, `body`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, 2, 'Natus sit omnis.', 'Deserunt est quidem in voluptatem nam.', 'Exercitationem rerum officia consequatur porro optio cumque. Omnis quidem porro totam beatae sed beatae vel. Totam ullam minima aut est. Ut ut quaerat sunt saepe. Similique animi et beatae quo omnis culpa eum.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(2, 11, 2, 'Velit ipsa quia cum.', 'Quasi assumenda esse optio consequuntur.', 'Consequuntur vitae voluptatem consequatur sit. Rerum libero adipisci unde sed officiis vel ipsum. Quos est saepe atque ad. Rem asperiores ea nesciunt.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(3, 11, 2, 'Blanditiis sunt soluta.', 'Quo sunt est velit.', 'Ex recusandae pariatur est repellat. Alias in enim nemo qui quia dignissimos ipsa in. Incidunt cupiditate eligendi quis quaerat. Facere dolores et facilis corporis dolorum itaque sed. Voluptatem est quos beatae molestias et. Illum quo rerum mollitia sit.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(4, 11, 2, 'Qui vero ipsam.', 'Quis dignissimos aut consequatur est blanditiis quam.', 'Voluptatem et iste consequuntur quidem at expedita. Molestiae quos ut eum. Voluptatem saepe distinctio accusantium sit fugiat eum pariatur. Sed non nemo distinctio quidem tempore eum. Commodi a voluptas suscipit est. Et aut at maiores unde consectetur natus accusantium. Voluptatem perspiciatis nam quia excepturi quas.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(5, 11, 2, 'Laborum inventore.', 'Et deserunt accusantium assumenda quos sit autem.', 'Aperiam qui aliquam molestias provident tempore ea eos. Deleniti porro voluptas qui enim quia optio alias. Est est nihil fuga natus. Non et qui non unde. Eveniet eaque voluptatibus saepe ullam ea. Autem quaerat nihil aspernatur accusantium eveniet quam voluptas.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(6, 11, 2, 'Rerum hic eos.', 'Porro vel laborum distinctio quos neque id.', 'Nihil dolore voluptas in commodi eos repellendus. Repellat beatae ab et omnis perferendis quo optio. Aut perferendis laborum sit occaecati dolor. Voluptas placeat eum incidunt sed perferendis adipisci.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(7, 12, 3, 'At a.', 'Voluptates itaque consequatur blanditiis.', 'Magnam dolores delectus quas ut esse qui. Et optio eligendi aut a et. Totam perspiciatis est officiis sint voluptatem esse voluptas. Quae officiis quis ducimus nesciunt quia ea. Et saepe id qui accusantium. Totam ut corporis nemo neque.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(8, 12, 3, 'Rem architecto iusto aut.', 'Eos quo esse rerum.', 'Qui maiores quisquam autem sed. Enim eum omnis qui consequuntur quidem culpa dignissimos. Eum qui officia reprehenderit. Exercitationem alias dolorem nihil. Beatae sed et esse dolor. Quis repudiandae explicabo in non.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(9, 12, 3, 'Quasi reiciendis laudantium est.', 'Nulla facere autem eveniet.', 'Officiis earum sed voluptas est. Eius architecto praesentium non molestias et debitis numquam. Sit numquam aut molestias et non et aliquam. Magnam omnis vitae consequuntur quia velit illo. Enim distinctio rerum et. Ratione nisi earum voluptatibus iusto facilis fugiat. Quia iste repellendus et et.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(10, 12, 3, 'Ut necessitatibus voluptate.', 'Labore laudantium ea numquam in.', 'Exercitationem accusantium quis beatae repellat. Et et earum ut facilis non sit quia. Tempora deleniti dolore doloribus aut provident quidem. Expedita sit ea delectus eaque at molestias animi quia. Dolorem saepe quia aut vel.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(11, 12, 3, 'Recusandae quaerat fuga non.', 'Rerum expedita voluptatibus incidunt.', 'Qui magnam reprehenderit voluptatem velit ab. Vel quia voluptas impedit quia sed. Ipsam nesciunt sunt tempore eius nemo. Et corrupti aut sequi non modi aut est. Sunt excepturi magnam fugit. Facilis sint rerum possimus quo qui ratione dolor neque.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(12, 12, 3, 'Recusandae inventore aspernatur aspernatur.', 'Sunt fuga beatae rerum et consequatur.', 'Mollitia in dolorem autem qui ab. Unde eligendi modi veniam omnis atque ducimus. Quis quam reprehenderit reiciendis. Est rem et sed in consequatur consequuntur ut non. Non beatae incidunt non in delectus voluptas provident eum. Reiciendis natus beatae consequatur consequatur officiis totam provident sit. Dolorem aut nam ut blanditiis sunt soluta magni.', '2025-08-28 11:10:38', '2025-08-28 11:10:38', NULL),
(13, 11, 2, 'pencari nafkah versi 3', 'pencari_nafkah', 'sinopsis', '2025-08-28 11:23:27', '2025-08-28 11:38:26', '2025-08-28 11:38:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dKTEITw0AtUQ6Dh0PgTgXvoRILel15EQO1gLhWhm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVmxSMHJ6Z3JIbjlRVmxiM3oxS2NaaHRYbmhLRDVuVzh6V2YwMzJYOSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xvZ2luIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1756391102),
('qUd58QxMd0ji8xrLW43CRa4cplI7fj9WPtWgYCwE', NULL, '127.0.0.1', 'PostmanRuntime/7.45.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidVU1b0t3SElWWURkZ2tkZ1pWSlZVc091bHJ2eG5taVBySmhJQWp1cyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1756394209);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(11, 'nelson', 'nelson@gmail.com', '2025-08-28 07:37:19', '$2y$12$tYxs/mGVUKl.EExAsWm5NOIYYJJ3S0uXg83qJyLyo9H4pVQrmtI0y', NULL, NULL, NULL, 'jLPwqMZpgz5vwsReIHwGWDbXuv1DGpOpL2qMQNoic6v9fHPvaVi2CCbkt1hu', NULL, NULL, '2025-08-28 07:36:58', '2025-08-28 08:57:43'),
(12, 'eric', 'eric@gmail.com', '2025-08-28 11:32:21', '$2y$12$2Q.JGCV7uW8NQHLal4xj5udwK3oJb0d.gTOcSsyysvWUUHdtrObBG', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-28 07:38:28', '2025-08-28 11:32:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmarks_user_id_foreign` (`user_id`),
  ADD KEY `bookmarks_post_id_foreign` (`post_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
