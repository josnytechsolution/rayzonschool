-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2022 at 09:43 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schoolbest_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_subjects`
--

CREATE TABLE `academic_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_subjects`
--

INSERT INTO `academic_subjects` (`id`, `name`, `code`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'English Language', 'ENGLAN', 1, '2021-09-09 15:19:59', 1, '2021-09-09 15:31:40'),
(2, 'Kiswahili Lugha', 'KISWLUG', 1, '2021-09-09 15:21:08', 1, '2021-09-09 15:32:08'),
(3, 'Science', 'SCIE', 1, '2021-09-09 15:22:24', NULL, '2021-09-09 15:22:24'),
(4, 'Mathematics', 'MATH', 1, '2021-09-09 15:25:08', NULL, '2021-09-09 15:25:08'),
(5, 'Social Studies', 'SST', 1, '2021-09-09 15:25:24', NULL, '2021-09-09 15:25:24'),
(6, 'Christian Religious Education', 'CRE', 1, '2021-09-09 15:27:24', NULL, '2021-09-09 15:27:24'),
(7, 'English Compostion', 'ENGCOM', 1, '2021-09-09 15:32:58', 1, '2021-09-09 15:34:19'),
(8, 'Kiswahili Insha', 'KISWINS', 1, '2021-09-09 15:33:55', 1, '2021-09-09 15:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `academic_terms`
--

CREATE TABLE `academic_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academic_terms`
--

INSERT INTO `academic_terms` (`id`, `name`, `long_name`, `slug`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'TERM 1', 'Term One', 'term-one', 1, 1, '2021-05-08 07:28:58', NULL, '2021-05-08 07:28:58', NULL, NULL),
(2, 'TERM 2', 'Term Two', 'term-two', 1, 1, '2021-05-08 07:29:18', NULL, '2021-05-08 07:29:18', NULL, NULL),
(3, 'TERM 3', 'Term Three', 'term-three', 1, 1, '2021-05-08 07:29:31', NULL, '2021-05-08 07:29:31', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `slug`, `name`, `long_name`, `branch`, `account_name`, `account_no`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'consolidated-bank-123658741255100', 'CONSOLIDATED BANK', 'Consolidated Bank', 'Milimani Branch', 'SchoolBest Academy Limited', '123658741255100', 1, 1, '2021-11-12 12:01:44', 1, '2021-11-12 12:01:44', NULL, NULL),
(2, 'co-operative-bank-0110569874517000', 'CO-OP', 'Co-operative Bank', 'Parklands Branch', 'SchoolBest Academy Limited', '0110654987200', 1, 1, '2021-11-26 15:24:11', 1, '2021-11-12 12:01:32', NULL, NULL),
(3, 'paybill-admission-no', 'M-PESA', 'PAYBILL', '4018467', 'Schoolbest Academy', 'ADMISSION NO', 2, 1, '2021-10-22 08:37:22', 1, '2021-10-22 08:37:22', 1, '2021-10-22 08:37:22');

-- --------------------------------------------------------

--
-- Table structure for table `classrooms`
--

CREATE TABLE `classrooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `class_stream_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`id`, `name`, `long_name`, `slug`, `class_grade_id`, `class_stream_id`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'PG-BLUE', 'Play Group Blue', 'play-group-blue', 1, 1, 1, 1, '2021-05-08 09:33:36', NULL, '2021-05-08 09:33:36'),
(2, 'PP1-BLUE', 'Pre-Primary One Blue', 'pre-primary-one-blue', 2, 1, 1, 1, '2021-05-08 09:34:27', NULL, '2021-05-08 09:34:27'),
(3, 'PP2-BLUE', 'Pre-Primary Two Blue', 'pre-primary-two-blue', 3, 1, 1, 1, '2021-05-08 09:34:55', NULL, '2021-05-08 09:34:55'),
(4, 'GRD1-BLUE', 'Grade One Blue', 'grade-one-blue', 4, 1, 1, 1, '2021-05-08 09:35:25', NULL, '2021-05-08 09:35:25'),
(5, 'GRD2-BLUE', 'Grade Two Blue', 'grade-two-blue', 5, 1, 1, 1, '2021-05-08 09:35:55', NULL, '2021-05-08 09:35:55'),
(6, 'GRD3-BLUE', 'Grade Three Blue', 'grade-three-blue', 6, 1, 1, 1, '2021-05-08 09:36:19', NULL, '2021-05-08 09:36:19'),
(7, 'GRD4-BLUE', 'Grade Four Blue', 'grade-four-blue', 7, 1, 1, 1, '2021-05-08 09:36:55', NULL, '2021-05-08 09:36:55'),
(8, 'GRD5-BLUE', 'Grade Five Blue', 'grade-five-blue', 8, 1, 1, 1, '2021-05-08 09:37:21', NULL, '2021-05-08 09:37:21'),
(9, 'GRD6-BLUE', 'Grade Six Blue', 'grade-six-blue', 9, 1, 1, 1, '2021-05-08 09:37:48', NULL, '2021-05-08 09:37:48'),
(10, 'GRD7-BLUE', 'Grade Seven Blue', 'grade-seven-blue', 10, 1, 1, 1, '2021-05-08 09:39:07', NULL, '2021-05-08 09:39:07'),
(11, 'GRD8-BLUE', 'Grade Eight Blue', 'grade-eight-blue', 11, 1, 1, 1, '2021-05-08 09:39:34', NULL, '2021-05-08 09:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `class_fees`
--

CREATE TABLE `class_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `fee_parameter_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_fees`
--

INSERT INTO `class_fees` (`id`, `slug`, `current_session_id`, `fee_parameter_id`, `class_grade_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '1-3-1', 1, 3, 1, 16000, 1, 1, '2021-05-08 08:45:45', NULL, '2021-05-08 08:45:45', NULL, NULL),
(2, '1-4-1', 1, 4, 1, 1000, 1, 1, '2021-05-08 08:46:09', NULL, '2021-05-08 08:46:09', NULL, NULL),
(3, '1-5-1', 1, 5, 1, 6000, 1, 1, '2021-05-08 08:46:41', NULL, '2021-05-08 08:46:41', NULL, NULL),
(4, '1-3-2', 1, 3, 2, 16000, 1, 1, '2021-05-08 08:47:52', NULL, '2021-05-08 08:47:52', NULL, NULL),
(5, '1-4-2', 1, 4, 2, 1000, 1, 1, '2021-05-08 08:48:12', NULL, '2021-05-08 08:48:12', NULL, NULL),
(6, '1-5-2', 1, 5, 2, 6000, 1, 1, '2021-05-08 08:48:24', NULL, '2021-05-08 08:48:24', NULL, NULL),
(7, '1-3-3', 1, 3, 3, 16000, 1, 1, '2021-05-08 08:49:00', NULL, '2021-05-08 08:49:00', NULL, NULL),
(8, '1-4-3', 1, 4, 3, 1000, 1, 1, '2021-05-08 08:49:21', NULL, '2021-05-08 08:49:21', NULL, NULL),
(9, '1-5-3', 1, 5, 3, 6000, 1, 1, '2021-05-08 08:49:33', NULL, '2021-05-08 08:49:33', NULL, NULL),
(10, '1-3-4', 1, 3, 4, 17000, 1, 1, '2021-05-08 08:50:06', NULL, '2021-05-08 08:50:06', NULL, NULL),
(11, '1-5-4', 1, 5, 4, 6000, 1, 1, '2021-05-08 08:50:20', NULL, '2021-05-08 08:50:20', NULL, NULL),
(12, '1-4-4', 1, 4, 4, 1000, 1, 1, '2021-05-08 08:50:33', NULL, '2021-05-08 08:50:33', NULL, NULL),
(13, '1-3-5', 1, 3, 5, 17000, 1, 1, '2021-05-08 08:50:57', NULL, '2021-05-08 08:50:57', NULL, NULL),
(14, '1-5-5', 1, 5, 5, 6000, 1, 1, '2021-05-08 08:51:09', NULL, '2021-05-08 08:51:09', NULL, NULL),
(15, '1-4-5', 1, 4, 5, 1000, 1, 1, '2021-05-08 08:51:27', NULL, '2021-05-08 08:51:27', NULL, NULL),
(16, '1-3-6', 1, 3, 6, 17000, 1, 1, '2021-05-08 08:52:24', NULL, '2021-05-08 08:52:24', NULL, NULL),
(17, '1-5-6', 1, 5, 6, 6000, 1, 1, '2021-05-08 08:52:51', NULL, '2021-05-08 08:52:51', NULL, NULL),
(18, '1-4-6', 1, 4, 6, 1000, 1, 1, '2021-05-08 08:53:06', NULL, '2021-05-08 08:53:06', NULL, NULL),
(19, '1-3-7', 1, 3, 7, 17000, 1, 1, '2021-05-08 08:53:35', NULL, '2021-05-08 08:53:35', NULL, NULL),
(20, '1-5-7', 1, 5, 7, 6000, 1, 1, '2021-05-08 08:59:41', NULL, '2021-05-08 08:59:41', NULL, NULL),
(21, '1-4-7', 1, 4, 7, 1000, 1, 1, '2021-05-08 08:59:58', NULL, '2021-05-08 08:59:58', NULL, NULL),
(22, '1-3-8', 1, 3, 8, 18000, 1, 1, '2021-05-08 09:00:28', NULL, '2021-05-08 09:00:28', NULL, NULL),
(23, '1-5-8', 1, 5, 8, 6000, 1, 1, '2021-05-08 09:00:48', NULL, '2021-05-08 09:00:48', NULL, NULL),
(24, '1-4-8', 1, 4, 8, 1000, 1, 1, '2021-05-08 09:01:06', NULL, '2021-05-08 09:01:06', NULL, NULL),
(25, '1-3-9', 1, 3, 9, 18000, 1, 1, '2021-05-08 09:01:38', NULL, '2021-05-08 09:01:38', NULL, NULL),
(26, '1-5-9', 1, 5, 9, 6000, 1, 1, '2021-05-08 09:01:55', NULL, '2021-05-08 09:01:55', NULL, NULL),
(27, '1-4-9', 1, 4, 9, 1000, 1, 1, '2021-05-08 09:02:13', NULL, '2021-05-08 09:02:13', NULL, NULL),
(28, '2-3-1', 2, 3, 1, 16000, 1, 1, '2021-07-13 08:20:40', NULL, '2021-07-13 08:20:40', NULL, NULL),
(29, '2-5-1', 2, 5, 1, 6000, 1, 1, '2021-07-13 08:21:15', NULL, '2021-07-13 08:21:15', NULL, NULL),
(30, '2-4-1', 2, 4, 1, 1000, 1, 1, '2021-07-13 08:21:37', NULL, '2021-07-13 08:21:37', NULL, NULL),
(31, '2-6-1', 2, 6, 1, 2000, 1, 1, '2021-07-13 08:22:38', NULL, '2021-07-13 08:22:38', NULL, NULL),
(32, '2-3-2', 2, 3, 2, 16000, 1, 1, '2021-07-13 08:23:06', NULL, '2021-07-13 08:23:06', NULL, NULL),
(33, '2-5-2', 2, 5, 2, 6000, 1, 1, '2021-07-13 08:24:04', NULL, '2021-07-13 08:24:04', NULL, NULL),
(34, '2-4-2', 2, 4, 2, 1000, 1, 1, '2021-07-13 08:25:22', NULL, '2021-07-13 08:25:22', NULL, NULL),
(35, '2-6-2', 2, 6, 2, 2000, 1, 1, '2021-07-13 08:26:04', NULL, '2021-07-13 08:26:04', NULL, NULL),
(36, '2-3-3', 2, 3, 3, 16000, 1, 1, '2021-07-13 08:26:58', NULL, '2021-07-13 08:26:58', NULL, NULL),
(37, '2-5-3', 2, 5, 3, 6000, 1, 1, '2021-07-13 08:27:19', NULL, '2021-07-13 08:27:19', NULL, NULL),
(38, '2-4-3', 2, 4, 3, 1000, 1, 1, '2021-07-13 08:27:37', NULL, '2021-07-13 08:27:37', NULL, NULL),
(39, '2-6-3', 2, 6, 3, 2000, 1, 1, '2021-07-13 08:28:05', NULL, '2021-07-13 08:28:05', NULL, NULL),
(40, '2-3-4', 2, 3, 4, 17000, 1, 1, '2021-07-13 08:28:57', NULL, '2021-07-13 08:28:57', NULL, NULL),
(41, '2-5-4', 2, 5, 4, 6000, 1, 1, '2021-07-13 08:29:51', NULL, '2021-07-13 08:29:51', NULL, NULL),
(42, '2-4-4', 2, 4, 4, 1000, 1, 1, '2021-07-13 08:30:23', NULL, '2021-07-13 08:30:23', NULL, NULL),
(43, '2-6-4', 2, 6, 4, 2000, 1, 1, '2021-07-13 08:30:52', NULL, '2021-07-13 08:30:52', NULL, NULL),
(44, '2-3-5', 2, 3, 5, 17000, 1, 1, '2021-07-13 08:32:46', NULL, '2021-07-13 08:32:46', NULL, NULL),
(45, '2-5-5', 2, 5, 5, 6000, 1, 1, '2021-07-13 08:33:03', NULL, '2021-07-13 08:33:03', NULL, NULL),
(46, '2-4-5', 2, 4, 5, 1000, 1, 1, '2021-07-13 08:33:22', NULL, '2021-07-13 08:33:22', NULL, NULL),
(47, '2-6-5', 2, 6, 5, 2000, 1, 1, '2021-07-13 08:33:41', NULL, '2021-07-13 08:33:41', NULL, NULL),
(48, '2-3-6', 2, 3, 6, 17000, 1, 1, '2021-07-13 08:34:44', NULL, '2021-07-13 08:34:44', NULL, NULL),
(49, '2-5-6', 2, 5, 6, 6000, 1, 1, '2021-07-13 08:35:13', NULL, '2021-07-13 08:35:13', NULL, NULL),
(50, '2-4-6', 2, 4, 6, 1000, 1, 1, '2021-07-13 08:35:31', NULL, '2021-07-13 08:35:31', NULL, NULL),
(51, '2-6-6', 2, 6, 6, 2000, 1, 1, '2021-07-13 08:36:01', NULL, '2021-07-13 08:36:01', NULL, NULL),
(52, '2-3-7', 2, 3, 7, 17000, 1, 1, '2021-07-13 08:36:49', NULL, '2021-07-13 08:36:49', NULL, NULL),
(53, '2-5-7', 2, 5, 7, 6000, 1, 1, '2021-07-13 08:37:08', NULL, '2021-07-13 08:37:08', NULL, NULL),
(54, '2-4-7', 2, 4, 7, 1000, 1, 1, '2021-07-13 08:37:29', NULL, '2021-07-13 08:37:29', NULL, NULL),
(55, '2-6-7', 2, 6, 7, 2000, 1, 1, '2021-07-13 08:38:27', NULL, '2021-07-13 08:38:27', NULL, NULL),
(56, '2-3-8', 2, 3, 8, 18000, 1, 1, '2021-07-13 08:39:16', NULL, '2021-07-13 08:39:16', NULL, NULL),
(57, '2-5-8', 2, 5, 8, 6000, 1, 1, '2021-07-13 08:39:37', NULL, '2021-07-13 08:39:37', NULL, NULL),
(58, '2-4-8', 2, 4, 8, 1000, 1, 1, '2021-07-13 08:40:12', NULL, '2021-07-13 08:40:12', NULL, NULL),
(59, '2-6-8', 2, 6, 8, 2000, 1, 1, '2021-07-13 08:40:31', NULL, '2021-07-13 08:40:31', NULL, NULL),
(60, '2-3-9', 2, 3, 9, 18000, 1, 1, '2021-07-13 08:40:58', NULL, '2021-07-13 08:40:58', NULL, NULL),
(61, '2-5-9', 2, 5, 9, 6000, 1, 1, '2021-07-13 08:41:24', NULL, '2021-07-13 08:41:24', NULL, NULL),
(62, '2-4-9', 2, 4, 9, 1000, 1, 1, '2021-07-13 08:41:44', NULL, '2021-07-13 08:41:44', NULL, NULL),
(63, '2-6-9', 2, 6, 9, 2000, 1, 1, '2021-07-13 08:42:06', NULL, '2021-07-13 08:42:06', NULL, NULL),
(64, '2-3-10', 2, 3, 10, 18000, 1, 1, '2021-07-13 08:42:39', NULL, '2021-07-13 08:42:39', NULL, NULL),
(65, '2-5-10', 2, 5, 10, 6000, 1, 1, '2021-07-13 08:43:00', NULL, '2021-07-13 08:43:00', NULL, NULL),
(66, '2-4-10', 2, 4, 10, 1000, 1, 1, '2021-07-13 08:43:18', NULL, '2021-07-13 08:43:18', NULL, NULL),
(67, '2-6-10', 2, 6, 10, 2000, 1, 1, '2021-07-13 08:43:39', NULL, '2021-07-13 08:43:39', NULL, NULL),
(69, '3-1-1', 3, 1, 1, 1200, 1, 1, '2021-12-14 20:43:49', NULL, NULL, NULL, NULL),
(70, '3-2-1', 3, 2, 1, 1000, 1, 1, '2021-12-14 20:43:49', NULL, NULL, NULL, NULL),
(71, '3-3-1', 3, 3, 1, 14000, 1, 1, '2021-12-14 20:43:49', NULL, NULL, NULL, NULL),
(72, '3-4-1', 3, 4, 1, 1500, 1, 1, '2021-12-14 20:43:49', NULL, NULL, NULL, NULL),
(73, '3-5-1', 3, 5, 1, 5000, 1, 1, '2021-12-14 20:43:49', NULL, NULL, NULL, NULL),
(74, '3-6-1', 3, 6, 1, 2500, 1, 1, '2021-12-14 20:43:49', NULL, NULL, NULL, NULL),
(75, '3-3-2', 3, 3, 2, 15000, 1, 1, '2021-12-14 21:26:22', NULL, NULL, NULL, NULL),
(76, '3-4-2', 3, 4, 2, 1500, 1, 1, '2021-12-14 21:26:22', NULL, NULL, NULL, NULL),
(77, '3-5-2', 3, 5, 2, 5000, 1, 1, '2021-12-14 21:26:22', NULL, NULL, NULL, NULL),
(78, '3-6-2', 3, 6, 2, 2500, 1, 1, '2021-12-14 21:26:22', NULL, NULL, NULL, NULL),
(81, '2-8-4', 2, 8, 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, '2022-01-21 12:02:48', NULL, NULL),
(82, '3-3-11', 3, 3, 11, 18000, 1, 1, '2022-03-08 09:35:59', NULL, NULL, NULL, NULL),
(83, '3-4-11', 3, 4, 11, 1000, 1, 1, '2022-03-08 09:35:59', NULL, NULL, NULL, NULL),
(84, '3-5-11', 3, 5, 11, 6000, 1, 1, '2022-03-08 09:35:59', NULL, NULL, NULL, NULL),
(85, '3-6-11', 3, 6, 11, 2000, 1, 1, '2022-03-08 09:35:59', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_grades`
--

CREATE TABLE `class_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_grades`
--

INSERT INTO `class_grades` (`id`, `name`, `long_name`, `slug`, `level`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'PLAY GROUP', 'Play Group Class', 'play-group-class', '1', 1, 1, '2021-05-08 08:42:14', 1, '2021-05-08 08:42:14', NULL, NULL),
(2, 'PP1', 'Pre-Primary One', 'pre-primary-one', '2', 1, 1, '2021-05-08 08:41:36', NULL, '2021-05-08 08:41:36', NULL, NULL),
(3, 'PP2', 'Pre-Primary Two', 'pre-primary-two', '3', 1, 1, '2021-05-08 08:42:00', NULL, '2021-05-08 08:42:00', NULL, NULL),
(4, 'GRADE 1', 'Grade One', 'grade-one', '4', 1, 1, '2021-05-08 08:42:50', NULL, '2021-05-08 08:42:50', NULL, NULL),
(5, 'GRADE 2', 'Grade Two', 'grade-two', '5', 1, 1, '2021-05-08 08:43:10', NULL, '2021-05-08 08:43:10', NULL, NULL),
(6, 'GRADE 3', 'Grade Three', 'grade-three', '6', 1, 1, '2021-05-08 08:43:28', NULL, '2021-05-08 08:43:28', NULL, NULL),
(7, 'GRADE 4', 'Grade Four', 'grade-four', '7', 1, 1, '2021-05-08 08:43:46', NULL, '2021-05-08 08:43:46', NULL, NULL),
(8, 'GRADE 5', 'Grade Five', 'grade-five', '8', 1, 1, '2021-05-08 08:44:18', NULL, '2021-05-08 08:44:18', NULL, NULL),
(9, 'GRADE 6', 'Grade Six', 'grade-six', '9', 1, 1, '2021-05-08 08:44:32', NULL, '2021-05-08 08:44:32', NULL, NULL),
(10, 'GRADE 7', 'Grade Seven', 'grade-seven', '10', 1, 1, '2021-05-08 08:44:51', NULL, '2021-05-08 08:44:51', NULL, NULL),
(11, 'GRADE 8', 'Grade Eight', 'grade-eight', '11', 1, 1, '2021-05-08 08:45:16', NULL, '2021-05-08 08:45:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_managers`
--

CREATE TABLE `class_managers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `class_stream_id` bigint(20) UNSIGNED NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `staff_member_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_managers`
--

INSERT INTO `class_managers` (`id`, `class_grade_id`, `class_stream_id`, `classroom_id`, `staff_member_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 1, '2021-09-09 15:18:13', NULL, '2021-09-09 15:18:13'),
(2, 7, 1, 7, 1, 1, '2021-09-09 15:18:25', NULL, '2021-09-09 15:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `class_streams`
--

CREATE TABLE `class_streams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_streams`
--

INSERT INTO `class_streams` (`id`, `name`, `long_name`, `slug`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'BLUE', 'Stream Blue', 'stream-blue', 1, 1, '2021-05-08 09:29:24', NULL, '2021-05-08 09:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `academic_subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_subjects`
--

INSERT INTO `class_subjects` (`id`, `name`, `class_grade_id`, `academic_subject_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'GRD1-ENGLAN', 4, 1, 1, '2021-09-09 15:30:20', NULL, '2021-09-09 15:30:20'),
(2, 'GRD1-ENGCOM', 4, 7, 1, '2021-09-09 15:35:39', NULL, '2021-09-09 15:35:39'),
(3, 'GRD1-KISWLUG', 4, 2, 1, '2021-09-09 15:36:12', NULL, '2021-09-09 15:36:12'),
(4, 'GRD1-KISWINS', 4, 8, 1, '2021-09-09 15:37:18', NULL, '2021-09-09 15:37:18');

-- --------------------------------------------------------

--
-- Table structure for table `client_connections`
--

CREATE TABLE `client_connections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connectionID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connectionPassword` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_connections`
--

INSERT INTO `client_connections` (`id`, `connectionID`, `connectionPassword`, `institution`, `status`, `created_at`, `updated_at`) VALUES
(1, '057826703d114b9f849f9f924bebf2cd', '9ae02a2b8a35484eade36c25414ad630', 'Coop Bank', 'Active', '2021-11-26 15:01:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coop_outboxes`
--

CREATE TABLE `coop_outboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coop_payment_id` bigint(20) UNSIGNED NOT NULL,
  `messageId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coop_outboxes`
--

INSERT INTO `coop_outboxes` (`id`, `coop_payment_id`, `messageId`, `message`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 29, '78d4c40176d3425bb6e0f72b9124f163', 'Dear Parent/Guardian, Your payment of Ksh 2,000 for CLAUDIA WANJIKU WABERA via COOP BANK has been received. New Fees Balance is Ksh 28,000. Thank you', '0720871499', 'sent', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coop_payments`
--

CREATE TABLE `coop_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `transactionReferenceCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactionDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalAmount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documentReferenceNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bankCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branchCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentReferenceCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentMode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paymentAmount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additionalInfo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institutionCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institutionName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coop_payments`
--

INSERT INTO `coop_payments` (`id`, `student_id`, `current_session_id`, `transactionReferenceCode`, `transactionDate`, `totalAmount`, `currency`, `documentReferenceNumber`, `bankCode`, `branchCode`, `paymentDate`, `paymentReferenceCode`, `paymentCode`, `paymentMode`, `paymentAmount`, `additionalInfo`, `accountNumber`, `accountName`, `institutionCode`, `institutionName`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'IB116cd8a1d1b56FGE', '2021-11-25T17:32:02.7460598+03:00', '25000', NULL, 'SBT0003', '00011', '00011001', '2021-11-25T17:32:02.7460598+03:00', NULL, NULL, '1', '25000', 'SBT0003', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2021-11-26 15:24:54', '2021-11-26 15:24:54'),
(2, 3, 2, 'IB116cd8a1d1b56FGEL', '2021-11-25T17:32:02.7460598+03:00', '25000', NULL, 'SBT0003', '00011', '00011001', '2021-11-25T17:32:02.7460598+03:00', NULL, NULL, '1', '25000', 'SBT003', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2021-11-26 15:31:28', '2021-11-26 15:31:28'),
(3, 4, 2, 'IB116cd8a1d1b56BN6', '2021-11-25T17:32:02.7460598+03:00', '2500', NULL, 'SBT0004', '00011', '00011001', '2021-11-25T17:32:02.7460598+03:00', NULL, NULL, '1', '2500', 'SBT0004', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2021-11-26 15:56:23', NULL),
(17, 4, 2, 'IB116cd8a1d1b47BN6', '2021-11-25T17:32:02.7460598+03:00', '5000', NULL, 'SBT0004', '00011', '00011001', '2021-11-25T17:32:02.7460598+03:00', NULL, NULL, '1', '5000', 'SBT0004', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2021-11-26 18:15:39', NULL),
(18, 74, 2, 'IB116cd8a1d1b47NJ7', '2021-11-25T17:32:02.7460598+03:00', '5000', NULL, 'SBT0074', '00011', '00011001', '2021-11-25T17:32:02.7460598+03:00', NULL, NULL, '1', '5000', 'SBT0074', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2022-03-02 16:53:43', NULL),
(20, 74, 2, 'IB116cd8a1d1b47XV4', '2021-11-25T17:32:02.7460598+03:00', '800', NULL, 'SBT0074', '00011', '00011001', '2021-11-25T18:32:02.7460598+03:00', NULL, NULL, '1', '800', 'SBT0074', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2022-03-02 17:00:31', NULL),
(27, 151, 2, 'IB116cd8a1d1b54SP0', '2021-11-25T17:32:02.7460598+03:00', '500', NULL, 'SBT0151', '00011', '00011001', '2021-11-25T18:32:02.7460598+03:00', NULL, NULL, '1', '800', 'SBT0151', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2022-03-02 18:02:16', NULL),
(28, 151, 2, 'IB116cd8a1d1b54SP5', '2021-11-25T17:32:02.7460598+03:00', '500', NULL, 'SBT0151', '00011', '00011001', '2021-11-25T18:32:02.7460598+03:00', NULL, NULL, '1', '800', 'SBT0151', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2022-03-02 18:02:42', NULL),
(29, 70, 2, 'IB116cd8a1d1b54SP3', '2021-11-25T17:32:02.7460598+03:00', '2000', NULL, 'SBT0070', '00011', '00011001', '2021-11-25T18:32:02.7460598+03:00', NULL, NULL, '1', '2000', 'SBT0070', '0110654987200', NULL, '2100082', 'Schoolbest Academy', '2022-03-02 18:06:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `current_sessions`
--

CREATE TABLE `current_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_year_id` bigint(20) UNSIGNED NOT NULL,
  `academic_term_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '3',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `current_sessions`
--

INSERT INTO `current_sessions` (`id`, `slug`, `name`, `financial_year_id`, `academic_term_id`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'term-3-2021', 'TERM-3-2021', 1, 3, 1, 1, '2021-07-13 20:32:39', 1, '2021-07-13 20:32:39'),
(2, 'term-1-2021', 'TERM-1-2021', 1, 1, 2, 1, '2021-07-13 20:32:39', 1, '2021-07-13 20:32:39'),
(3, 'term-2-2021', 'TERM-2-2021', 1, 2, 3, 1, '2021-05-08 07:38:55', NULL, '2021-05-08 07:37:48'),
(4, 'term-3-2022', 'TERM-3-2022', 2, 3, 3, 1, '2021-05-08 07:39:49', NULL, '2021-05-08 07:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `discount_levels`
--

CREATE TABLE `discount_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_levels`
--

INSERT INTO `discount_levels` (`id`, `name`, `discount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'Second Child', 10, 1, 1, '2021-05-08 09:42:13', NULL, '2021-05-08 09:42:13', NULL, NULL),
(2, 'Third Child', 20, 1, 1, '2021-05-08 09:43:44', NULL, '2021-05-08 09:43:44', NULL, NULL),
(3, 'Fourth Child', 30, 1, 1, '2021-05-08 09:44:00', NULL, '2021-05-08 09:44:00', NULL, NULL),
(4, 'First Child', 0, 1, 1, '2021-05-08 09:47:39', NULL, '2021-05-08 09:47:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_department_id` bigint(20) UNSIGNED NOT NULL,
  `expense_section_id` bigint(20) UNSIGNED NOT NULL,
  `transport_fleet_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_date` date NOT NULL,
  `amount` bigint(20) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `bank_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `slug`, `expense_department_id`, `expense_section_id`, `transport_fleet_id`, `description`, `expense_date`, `amount`, `payment_type`, `bank_id`, `account_no`, `ref_no`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'zcfau-gbu2w-xrl3y-xon4u-2021-11-10-19-09-04', 1, 1, NULL, 'Grade 4 Textbooks', '2021-11-10', 25600, 2, 1, 'Textbook Centre', '000258', 1, '2021-11-10 16:09:04', NULL, '2021-11-10 16:09:04'),
(2, '9oobc-0mlwm-cublb-832eu-2021-11-10-19-23-15', 2, 5, NULL, 'Total Gas 13kg', '2021-11-10', 2750, 1, 2, NULL, NULL, 1, '2021-11-10 16:23:15', NULL, '2021-11-10 16:23:15'),
(3, 'y5ll2-8huie-pivkt-4vbab-2021-11-10-19-26-49', 3, 17, 1, '50 litres diesel', '2021-11-09', 16200, 4, 2, '112211', 'P54RFTYSFD7', 1, '2021-11-10 16:26:49', 1, '2021-11-10 17:06:14'),
(4, 'xisuy-8v1g5-4psam-yyeds-2021-11-10-19-27-50', 4, 15, NULL, 'Sept 2021', '2021-11-02', 2555, 4, 2, '444400', 'P04BHGY6T', 1, '2021-11-10 16:27:50', 1, '2021-11-10 17:05:22'),
(5, 'dv4gr-bz5ut-b3des-8qya3-2021-11-30-13-16-05', 1, 1, NULL, 'Office Diaries', '2021-11-09', 7850, 2, 2, 'Textbook Centre', '00641', 1, '2021-11-30 10:16:05', NULL, '2021-11-30 10:16:05'),
(6, 't2vut-cm5eg-fj9t4-hcwbf-2022-01-11-14-53-29', 2, 5, NULL, 'Firewood', '2022-01-11', 7600, 4, 2, '9998', '435354', 1, '2022-01-11 11:53:29', NULL, '2022-01-11 11:53:29'),
(7, 'rl7bt-ckpnm-a6tyz-owjoq-2022-02-07-12-59-23', 3, 17, 2, 'Fuel for week 3', '2022-02-07', 5800, 4, 1, '789654', 'qweuyuyrryewr', 1, '2022-02-07 09:59:23', NULL, '2022-02-07 09:59:23'),
(8, 'f76ev-76vob-zeiji-kgeiq-2022-02-25-11-26-47', 3, 19, 2, '2022-2023', '2022-02-25', 65000, 4, 2, '56984', 'qwertfsfdf', 1, '2022-02-25 08:26:47', NULL, '2022-02-25 08:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `expense_departments`
--

CREATE TABLE `expense_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_departments`
--

INSERT INTO `expense_departments` (`id`, `name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Office', 1, '2021-05-27 20:15:28', NULL, '2021-05-27 20:15:28'),
(2, 'Kitchen', 1, '2021-05-27 20:15:36', NULL, '2021-05-27 20:15:36'),
(3, 'Vehicles', 1, '2021-05-27 20:15:56', NULL, '2021-05-27 20:15:56'),
(4, 'Bill', 1, '2021-05-27 20:22:06', 2, '2021-07-30 10:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `expense_sections`
--

CREATE TABLE `expense_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_department_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_sections`
--

INSERT INTO `expense_sections` (`id`, `expense_department_id`, `name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 'Stationery', 1, '2021-05-27 20:16:35', NULL, '2021-05-27 20:16:35'),
(2, 1, 'Exams', 1, '2021-05-27 20:16:51', NULL, '2021-05-27 20:16:51'),
(3, 1, 'It Service/products', 1, '2021-05-27 20:17:40', NULL, '2021-05-27 20:17:40'),
(4, 1, 'Allowances', 1, '2021-05-27 20:18:31', NULL, '2021-05-27 20:18:31'),
(5, 2, 'Fuel', 1, '2021-05-27 20:18:55', NULL, '2021-05-27 20:18:55'),
(6, 2, 'Cereals', 1, '2021-05-27 20:19:15', NULL, '2021-05-27 20:19:15'),
(7, 2, 'Rice', 1, '2021-05-27 20:19:48', NULL, '2021-05-27 20:19:48'),
(8, 2, 'Grocery', 1, '2021-05-27 20:19:57', NULL, '2021-05-27 20:19:57'),
(9, 2, 'Ingredients', 1, '2021-05-27 20:20:43', NULL, '2021-05-27 20:20:43'),
(10, 2, 'Maize Flour', 1, '2021-05-27 20:20:59', NULL, '2021-05-27 20:20:59'),
(11, 2, 'Wheat Flour', 1, '2021-05-27 20:21:12', NULL, '2021-05-27 20:21:12'),
(12, 4, 'Nhif', 1, '2021-05-27 20:23:56', NULL, '2021-05-27 20:23:56'),
(13, 4, 'Nssf', 1, '2021-05-27 20:24:06', NULL, '2021-05-27 20:24:06'),
(14, 4, 'Kra', 1, '2021-05-27 20:24:33', NULL, '2021-05-27 20:24:33'),
(15, 4, 'Water', 1, '2021-05-27 20:24:59', NULL, '2021-05-27 20:24:59'),
(16, 4, 'Power', 1, '2021-05-27 20:25:11', NULL, '2021-05-27 20:25:11'),
(17, 3, 'Fuel', 1, '2021-11-10 16:25:06', NULL, '2021-11-10 16:25:06'),
(18, 3, 'Repairs', 1, '2021-11-10 16:25:14', NULL, '2021-11-10 16:25:14'),
(19, 3, 'Insurance', 1, '2021-11-10 16:25:24', NULL, '2021-11-10 16:25:24'),
(20, 3, 'Inspection', 1, '2021-11-10 16:25:32', NULL, '2021-11-10 16:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `fee_discounts`
--

CREATE TABLE `fee_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_discounts`
--

INSERT INTO `fee_discounts` (`id`, `student_id`, `current_session_id`, `class_grade_id`, `name`, `description`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 15, 1, 5, 'Staff Child', 'Staff Child Discount', 12000, 1, 1, '2021-05-10 07:48:54', NULL, '2021-05-10 07:48:54', NULL, NULL),
(2, 39, 1, 4, 'Second Child', 'Second Child Discount', 1700, 1, 1, '2021-05-10 08:50:33', NULL, '2021-05-10 08:50:33', NULL, NULL),
(3, 42, 1, 4, 'Second Child', '10% Discount for Second Child', 1700, 1, 1, '2021-05-10 08:53:54', NULL, '2021-05-10 08:53:54', NULL, NULL),
(4, 45, 1, 4, 'Second Child', '10% Discount', 1700, 1, 1, '2021-05-10 09:01:26', NULL, '2021-05-10 09:01:26', NULL, NULL),
(5, 46, 1, 4, 'Second Child', '10% Discount', 1700, 1, 1, '2021-05-10 09:02:13', NULL, '2021-05-10 09:02:13', NULL, NULL),
(7, 54, 1, 3, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 09:26:05', NULL, '2021-05-10 09:26:05', NULL, NULL),
(8, 61, 1, 3, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 09:36:35', NULL, '2021-05-10 09:36:35', NULL, NULL),
(9, 63, 1, 5, 'Second Child', '10% Discount', 1700, 1, 1, '2021-05-10 09:41:59', NULL, '2021-05-10 09:41:59', NULL, NULL),
(10, 64, 1, 2, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 09:43:58', NULL, '2021-05-10 09:43:58', NULL, NULL),
(11, 66, 1, 3, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 09:51:30', NULL, '2021-05-10 09:51:30', NULL, NULL),
(12, 68, 1, 2, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 09:56:54', NULL, '2021-05-10 09:56:54', NULL, NULL),
(13, 78, 1, 2, 'Staff Child', 'Discount For Staff Child', 11000, 1, 1, '2021-05-10 10:11:12', NULL, '2021-05-10 10:11:12', NULL, NULL),
(15, 79, 1, 2, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 10:18:01', NULL, '2021-05-10 10:18:01', NULL, NULL),
(16, 86, 1, 2, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 10:27:53', NULL, '2021-05-10 10:27:53', NULL, NULL),
(17, 87, 1, 2, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 10:33:07', NULL, '2021-05-10 10:33:07', NULL, NULL),
(18, 98, 1, 4, 'Second Child', '10% Discount', 1700, 1, 1, '2021-05-10 10:40:05', NULL, '2021-05-10 10:40:05', NULL, NULL),
(19, 93, 1, 1, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 10:50:02', NULL, '2021-05-10 10:50:02', NULL, NULL),
(20, 95, 1, 1, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 10:59:00', NULL, '2021-05-10 10:59:00', NULL, NULL),
(21, 100, 1, 1, 'Third Child', '20% Discount', 3200, 1, 1, '2021-05-10 11:39:24', NULL, '2021-05-10 11:39:24', NULL, NULL),
(22, 106, 1, 1, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 11:45:55', NULL, '2021-05-10 11:45:55', NULL, NULL),
(23, 123, 1, 2, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 12:06:44', NULL, '2021-05-10 12:06:44', NULL, NULL),
(24, 124, 1, 1, 'Discount', 'Discount', 6000, 1, 1, '2021-05-10 12:10:14', NULL, '2021-05-10 12:10:14', NULL, NULL),
(25, 127, 1, 1, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 12:13:42', NULL, '2021-05-10 12:13:42', NULL, NULL),
(26, 129, 1, 1, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 12:19:10', NULL, '2021-05-10 12:19:10', NULL, NULL),
(27, 133, 1, 3, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 12:29:28', NULL, '2021-05-10 12:29:28', NULL, NULL),
(28, 135, 1, 6, 'Second Child', '10% Discount', 1700, 1, 1, '2021-05-10 12:35:58', NULL, '2021-05-10 12:35:58', NULL, NULL),
(29, 138, 1, 1, 'Second Child', '10% Discount', 1600, 1, 1, '2021-05-10 12:37:16', NULL, '2021-05-10 12:37:16', NULL, NULL),
(31, 142, 1, 1, 'Staff Child', 'Staff Child Discount', 11000, 1, 1, '2021-05-10 12:41:12', NULL, '2021-05-10 12:41:12', NULL, NULL),
(33, 148, 1, 1, 'staff', 'staff discount', 21000, 1, 2, '2021-06-10 22:34:42', NULL, '2021-06-10 22:34:42', NULL, NULL),
(35, 147, 1, 6, 'staff discount', 'staff discount', 22000, 1, 2, '2021-06-10 22:39:17', NULL, '2021-06-10 22:39:17', NULL, NULL),
(37, 105, 1, 9, 'sponsored', 'sponsored', 25000, 1, 2, '2021-06-10 22:47:53', NULL, '2021-06-10 22:47:53', NULL, NULL),
(38, 35, 1, 4, 'staff discount', 'sponsored', 11000, 1, 2, '2021-06-10 22:50:17', NULL, '2021-06-10 22:50:17', NULL, NULL),
(39, 27, 1, 5, 'PAID IN 2ND TERM', 'PAID', 23500, 1, 2, '2021-06-11 19:01:39', NULL, '2021-06-11 19:01:39', NULL, NULL),
(40, 35, 1, 4, 'STAFF', 'STAFF', 1000, 1, 2, '2021-06-11 19:20:50', NULL, '2021-06-11 19:20:50', NULL, NULL),
(43, 23, 1, 6, 'overpayment', 'paid more term 2', 3000, 1, 2, '2021-06-17 21:46:10', NULL, '2021-06-17 21:46:10', NULL, NULL),
(44, 73, 1, 2, 'overpayment', 'paid in term 2', 2000, 1, 2, '2021-06-17 21:58:07', NULL, '2021-06-17 21:58:07', NULL, NULL),
(45, 114, 1, 2, 'transport', 'changed route', 2000, 1, 2, '2021-06-17 22:05:11', NULL, '2021-06-17 22:05:11', NULL, NULL),
(46, 116, 1, 1, 'transport', 'change of route', 2000, 1, 2, '2021-06-17 22:07:49', NULL, '2021-06-17 22:07:49', NULL, NULL),
(47, 118, 1, 1, '2nd child', '10% off', 1600, 1, 2, '2021-06-17 22:11:05', NULL, '2021-06-17 22:11:05', NULL, NULL),
(48, 122, 1, 1, 'transport', 'not using transport', 4500, 1, 2, '2021-06-17 22:12:48', NULL, '2021-06-17 22:12:48', NULL, NULL),
(50, 131, 1, 1, 'transport', 'change of route', 2000, 1, 2, '2021-06-17 22:19:16', NULL, '2021-06-17 22:19:16', NULL, NULL),
(51, 156, 1, 1, 'Second Child', 'Second Child Discount 10%', 1600, 1, 1, '2021-06-19 21:42:38', NULL, '2021-06-19 21:42:38', NULL, NULL),
(52, 68, 1, 2, 'Overpaid In Second term', 'Overpaid In Second term', 23500, 1, 1, '2021-06-19 22:00:00', NULL, '2021-06-19 22:00:00', NULL, NULL),
(53, 5, 2, 8, 'Discount', 'Special Discount', 3700, 1, 1, '2021-11-20 15:38:16', 1, '2021-11-20 15:38:16', NULL, NULL),
(54, 40, 2, 5, 'Transport', 'Transport', 1000, 1, 1, '2022-01-06 11:53:44', NULL, '2022-01-06 11:53:44', NULL, NULL),
(55, 156, 2, 2, 'Transport', 'Transport', 750, 1, 1, '2022-02-07 09:26:14', NULL, '2022-02-07 09:26:14', NULL, NULL),
(56, 126, 2, 2, 'Transport', 'Transport', 500, 1, 1, '2022-02-08 09:23:22', NULL, '2022-02-08 09:23:22', NULL, NULL),
(57, 160, 2, 1, 'Transport', 'Transport', 1200, 1, 1, '2022-02-16 09:06:30', NULL, '2022-02-16 09:06:30', NULL, NULL),
(58, 17, 2, 9, 'Transport', 'Transport', 2000, 1, 1, '2022-02-16 11:28:32', NULL, '2022-02-16 11:28:32', NULL, NULL),
(59, 59, 2, 5, 'Unwell', 'Child was unwell for 2 weeks', 4500, 1, 1, '2022-02-25 07:48:49', NULL, '2022-02-25 07:48:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fee_parameters`
--

CREATE TABLE `fee_parameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_parameters`
--

INSERT INTO `fee_parameters` (`id`, `name`, `description`, `slug`, `type`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'REGISTRATION FEE', 'Admission Fee', 'registration-fee', NULL, 1, 1, '2021-05-08 07:40:36', NULL, '2021-05-08 07:40:36', NULL, NULL),
(2, 'INTERVIEW FEE', 'Interview fee', 'interview-fee', NULL, 1, 1, '2021-05-08 07:40:58', NULL, '2021-05-08 07:40:58', NULL, NULL),
(3, 'TUITION FEE', 'Tuition Fee', 'tuition-fee', 'main_fee', 1, 1, '2021-11-15 08:17:40', 1, '2021-06-09 18:39:44', NULL, NULL),
(4, 'WRITING MATERIALS FEE', 'Fee for Writing materials', 'writing-materials-fee', NULL, 1, 1, '2021-06-09 08:39:10', 1, '2021-06-09 18:39:10', NULL, NULL),
(5, 'LUNCH FEE', 'Lunch Fee', 'lunch-fee', NULL, 1, 1, '2021-05-08 07:43:04', NULL, '2021-05-08 07:43:04', NULL, NULL),
(6, 'MAINTENANCE FEE', 'Maintenance Fee', 'maintenance-fee', NULL, 1, 1, '2021-05-08 07:43:28', NULL, '2021-05-08 07:43:28', NULL, NULL),
(7, 'BALANCE B/F', 'Last Term Balance', 'balance-bf', 'balance_bf', 1, 1, '2022-01-20 07:44:42', NULL, '2021-05-10 06:30:46', NULL, NULL),
(8, 'UNIFORM', 'School Uniform', 'uniform', NULL, 1, 1, '2021-06-17 22:45:00', NULL, '2021-06-17 22:45:00', NULL, NULL),
(9, 'TAE KWON DO', 'Tae Kwon Do Lessons', 'tae-kwon-do', NULL, 1, 1, '2021-08-10 11:32:19', NULL, '2021-08-10 11:32:19', NULL, NULL),
(10, 'PIANO', 'Piano Lessons', 'piano', NULL, 1, 1, '2021-08-10 11:32:36', NULL, '2021-08-10 11:32:36', NULL, NULL),
(11, 'GUITAR', 'Guitar Lessons', 'guitar', NULL, 1, 1, '2021-08-10 11:32:51', NULL, '2021-08-10 11:32:51', NULL, NULL),
(12, 'CHESS', 'Chess Lessons', 'chess', NULL, 1, 1, '2021-08-10 11:33:07', NULL, '2021-08-10 11:33:07', NULL, NULL),
(13, 'BALLET DANCE', 'Ballet Dancing Lessons', 'ballet-dance', NULL, 1, 1, '2021-08-10 11:33:49', NULL, '2021-08-10 11:33:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fee_payments`
--

CREATE TABLE `fee_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_detail_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `receipt_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `expected` int(11) NOT NULL DEFAULT '0',
  `fees` int(11) NOT NULL DEFAULT '0',
  `arrears` int(11) NOT NULL DEFAULT '0',
  `paid` int(11) NOT NULL DEFAULT '0',
  `balance` int(11) NOT NULL DEFAULT '0',
  `pay_date` date NOT NULL,
  `slip_date` date NOT NULL,
  `bank_id` bigint(20) UNSIGNED NOT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `print` int(11) NOT NULL DEFAULT '0',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_payments`
--

INSERT INTO `fee_payments` (`id`, `slug`, `parent_detail_id`, `student_id`, `receipt_no`, `current_session_id`, `class_grade_id`, `expected`, `fees`, `arrears`, `paid`, `balance`, `pay_date`, `slip_date`, `bank_id`, `ref_no`, `print`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(6, NULL, 11, 28, '2021000001', 1, 5, 57500, 27300, 30200, 57500, 0, '2021-05-12', '2021-05-12', 1, '4047', 0, 2, '2021-06-21 17:26:39', NULL, '2021-06-21 17:26:39', NULL, NULL),
(7, NULL, 30, 34, '2021000002', 1, 5, 27200, 14000, 0, 14000, 13200, '2021-05-20', '2021-05-20', 2, '4118', 0, 2, '2021-06-21 17:32:10', NULL, '2021-06-21 17:32:10', NULL, NULL),
(8, NULL, 30, 34, '2021000003', 1, 5, 13200, 13200, 0, 13200, 0, '2021-05-20', '2021-06-21', 2, 'pfk5ddd16h', 0, 2, '2021-06-21 17:34:39', NULL, '2021-06-21 17:34:39', NULL, NULL),
(9, NULL, 5, 2, '2021000004', 1, 9, 31000, 31000, 0, 31000, 0, '2021-05-13', '2021-06-17', 1, '4067,4211', 0, 2, '2021-06-21 17:44:18', NULL, '2021-06-21 17:44:18', NULL, NULL),
(10, NULL, 105, 126, '2021000005', 1, 1, 25500, 10000, 0, 10000, 15500, '2021-05-13', '2021-05-13', 2, '4059', 0, 2, '2021-06-21 17:46:03', NULL, '2021-06-21 17:46:03', NULL, NULL),
(11, NULL, 105, 126, '2021000006', 1, 1, 15500, 12000, 0, 12000, 3500, '2021-05-20', '2021-06-21', 2, '4214', 0, 2, '2021-06-21 17:47:08', NULL, '2021-06-21 17:47:08', NULL, NULL),
(12, NULL, 15, 12, '2021000007', 1, 8, 89500, 0, 10000, 10000, 79500, '2021-05-18', '2021-05-18', 2, 'PDL137X2A', 0, 2, '2021-06-21 18:09:30', NULL, '2021-06-21 18:09:30', NULL, NULL),
(13, NULL, 15, 12, '2021000008', 1, 8, 79500, 0, 5000, 5000, 74500, '2021-05-18', '2021-05-18', 2, 'PDO66WGAJ8', 0, 2, '2021-06-21 18:10:59', NULL, '2021-06-21 18:10:59', NULL, NULL),
(14, NULL, 15, 12, '2021000009', 1, 8, 74500, 0, 4500, 4500, 70000, '2021-05-19', '2021-05-19', 2, 'PEC4VFGSS6', 0, 2, '2021-06-21 18:12:18', NULL, '2021-06-21 18:12:18', NULL, NULL),
(15, NULL, 15, 12, '2021000010', 1, 8, 70000, 0, 2000, 2000, 68000, '2021-06-02', '2021-06-02', 2, 'PF18MMO1MO', 0, 2, '2021-06-21 18:15:00', NULL, '2021-06-21 18:15:00', NULL, NULL),
(16, NULL, 16, 13, '2021000011', 1, 6, 26500, 26500, 0, 26500, 0, '2021-05-19', '2021-05-19', 1, '4106', 0, 2, '2021-06-21 18:19:52', NULL, '2021-06-21 18:19:52', NULL, NULL),
(17, NULL, 22, 20, '2021000012', 1, 6, 35000, 25000, 0, 25000, 10000, '2021-05-12', '2021-05-12', 2, 'PEA45SE8WG6', 0, 2, '2021-06-21 18:40:54', NULL, '2021-06-21 18:40:54', NULL, NULL),
(18, NULL, 22, 20, '2021000013', 1, 6, 13300, 1500, 0, 1500, 11800, '2021-05-12', '2021-05-12', 2, 'PED5W3U285', 0, 2, '2021-06-21 18:44:12', NULL, '2021-06-21 18:44:12', NULL, NULL),
(19, NULL, 22, 20, '2021000014', 1, 6, 11800, 1800, 0, 1800, 10000, '2021-05-12', '2021-05-12', 2, 'PEQ9DQQGJB', 0, 2, '2021-06-21 18:45:20', NULL, '2021-06-21 18:45:20', NULL, NULL),
(20, NULL, 55, 22, '2021000015', 1, 6, 44500, 4500, 15500, 20000, 24500, '2021-05-20', '2021-05-20', 1, '4112', 0, 2, '2021-06-21 18:47:08', NULL, '2021-06-21 18:47:08', NULL, NULL),
(21, NULL, 24, 23, '2021000016', 1, 6, 26500, 26500, 0, 26500, 0, '2021-05-24', '2021-05-24', 1, '4141', 0, 2, '2021-06-21 18:49:03', NULL, '2021-06-21 18:49:03', NULL, NULL),
(22, NULL, 80, 24, '2021000017', 1, 5, 31000, 10000, 0, 10000, 21000, '2021-05-17', '2021-05-17', 1, '4082', 0, 2, '2021-06-21 18:53:23', NULL, '2021-06-21 18:53:23', NULL, NULL),
(23, NULL, 80, 24, '2021000018', 1, 5, 21000, 21000, 0, 21000, 0, '2021-05-20', '2021-05-20', 1, '4111', 0, 2, '2021-06-21 18:54:29', NULL, '2021-06-21 18:54:29', NULL, NULL),
(24, NULL, 25, 25, '2021000019', 1, 5, 31000, 31000, 0, 31000, 0, '2021-05-20', '2021-05-20', 2, 'PE154773UJ', 0, 2, '2021-06-21 19:02:18', NULL, '2021-06-21 19:02:18', NULL, NULL),
(25, NULL, 57, 27, '2021000020', 1, 5, 5500, 5500, 0, 5500, 0, '2021-05-26', '2021-06-09', 1, '4152', 0, 2, '2021-06-21 19:19:20', NULL, '2021-06-21 19:19:20', NULL, NULL),
(26, NULL, 32, 29, '2021000021', 1, 5, 33000, 11000, 0, 11000, 22000, '2021-05-17', '2021-05-17', 1, 'PE48174U1S', 0, 2, '2021-06-21 19:27:49', NULL, '2021-06-21 19:27:49', NULL, NULL),
(27, NULL, 32, 29, '2021000022', 1, 5, 22000, 10000, 0, 10000, 12000, '2021-05-25', '2021-05-25', 1, 'PEH92HLWR5', 0, 2, '2021-06-21 19:29:46', NULL, '2021-06-21 19:29:46', NULL, NULL),
(28, NULL, 32, 29, '2021000023', 1, 5, 12000, 11700, 0, 11700, 300, '2021-06-14', '2021-06-12', 1, 'PFB8ZCBVJO', 0, 2, '2021-06-21 19:41:04', NULL, '2021-06-21 19:41:04', NULL, NULL),
(29, NULL, 26, 30, '2021000024', 1, 6, 29000, 29000, 0, 29000, 0, '2021-05-11', '2021-05-11', 2, 'PEB5TCAGE9', 0, 2, '2021-06-21 19:47:37', NULL, '2021-06-21 19:47:37', NULL, NULL),
(30, NULL, 27, 31, '2021000025', 1, 5, 29000, 29000, 0, 29000, 0, '2021-05-12', '2021-05-12', 1, '4053', 0, 2, '2021-06-21 19:48:54', NULL, '2021-06-21 19:48:54', NULL, NULL),
(31, NULL, 28, 32, '2021000026', 1, 8, 33500, 23500, 0, 23500, 10000, '2021-05-17', '2021-05-17', 3, 'PEH4215DFS', 0, 2, '2021-06-21 19:50:15', NULL, '2021-06-21 19:50:15', NULL, NULL),
(32, NULL, 29, 33, '2021000027', 1, 6, 33000, 30000, 0, 30000, 3000, '2021-06-11', '2021-06-11', 2, 'PFB7ZC4YDJ', 0, 2, '2021-06-21 19:58:50', NULL, '2021-06-21 19:58:50', NULL, NULL),
(33, NULL, 74, 36, '2021000028', 1, 5, 31000, 20000, 0, 20000, 11000, '2021-05-17', '2021-05-17', 1, '4085', 0, 2, '2021-06-21 20:00:50', NULL, '2021-06-21 20:00:50', NULL, NULL),
(34, NULL, 74, 36, '2021000029', 1, 5, 11000, 11000, 0, 11000, 0, '2021-06-10', '2021-06-10', 1, '4177', 0, 2, '2021-06-21 20:01:55', NULL, '2021-06-21 20:01:55', NULL, NULL),
(35, NULL, 82, 37, '2021000030', 1, 5, 29500, 29500, 0, 29500, 0, '2021-05-12', '2021-05-12', 1, '4155', 0, 2, '2021-06-21 20:03:26', NULL, '2021-06-21 20:03:26', NULL, NULL),
(36, NULL, 99, 38, '2021000031', 1, 4, 24000, 24000, 0, 24000, 0, '2021-05-20', '2021-05-20', 3, 'PEK06H8XHE', 0, 2, '2021-06-21 20:17:06', NULL, '2021-06-21 20:17:06', NULL, NULL),
(37, NULL, 1, 99, '2021000032', 1, 1, 33500, 0, 6000, 6000, 27500, '2021-05-15', '2021-06-02', 2, '4166', 0, 2, '2021-06-21 21:23:35', NULL, '2021-06-21 21:23:35', NULL, NULL),
(38, NULL, 1, 99, '2021000033', 1, 1, 31750, 10000, 0, 10000, 21750, '2021-05-25', '2021-05-25', 1, '4146', 0, 2, '2021-06-21 21:27:59', NULL, '2021-06-21 21:27:59', NULL, NULL),
(39, NULL, 1, 99, '2021000034', 1, 1, 21750, 12000, 0, 12000, 9750, '2021-06-09', '2021-06-09', 3, '4176', 0, 2, '2021-06-21 21:29:06', NULL, '2021-06-21 21:29:06', NULL, NULL),
(40, NULL, 32, 39, '2021000035', 1, 4, 31300, 31300, 0, 31300, 0, '2021-06-14', '2021-06-14', 1, '4194', 0, 2, '2021-06-21 21:40:05', NULL, '2021-06-21 21:40:05', NULL, NULL),
(41, NULL, 33, 40, '2021000036', 1, 4, 31000, 31000, 0, 31000, 0, '2021-05-20', '2021-06-04', 3, '4191', 0, 2, '2021-06-21 21:45:22', NULL, '2021-06-21 21:45:22', NULL, NULL),
(42, NULL, 34, 41, '2021000037', 1, 4, 41300, 23700, 11300, 35000, 6300, '2021-05-12', '2021-06-15', 2, '4201', 0, 2, '2021-06-21 21:47:38', NULL, '2021-06-21 21:47:38', NULL, NULL),
(43, NULL, 16, 42, '2021000038', 1, 4, 25800, 25800, 0, 25800, 0, '2021-05-19', '2021-05-19', 1, '4107', 0, 2, '2021-06-21 21:49:42', NULL, '2021-06-21 21:49:42', NULL, NULL),
(44, NULL, 53, 43, '2021000039', 1, 3, 23000, 23000, 0, 23000, 0, '2021-05-10', '2021-05-14', 3, 'PDU3E7X1DP', 0, 2, '2021-06-21 21:51:33', NULL, '2021-06-21 21:51:33', NULL, NULL),
(45, NULL, 35, 44, '2021000040', 1, 4, 28700, 18100, 2200, 20300, 8400, '2021-05-18', '2021-06-15', 1, '4199', 0, 2, '2021-06-21 21:55:09', NULL, '2021-06-21 21:55:09', NULL, NULL),
(46, NULL, 35, 45, '2021000041', 1, 4, 26800, 18300, 2000, 20300, 6500, '2021-05-18', '2021-06-15', 1, '4200', 0, 2, '2021-06-21 21:56:48', NULL, '2021-06-21 21:56:48', NULL, NULL),
(47, NULL, 38, 48, '2021000042', 1, 4, 83000, 0, 20000, 20000, 63000, '2021-06-14', '2021-06-14', 3, '4189', 0, 2, '2021-06-21 21:58:31', NULL, '2021-06-21 21:58:31', NULL, NULL),
(48, NULL, 39, 49, '2021000043', 1, 3, 27000, 20400, 0, 20400, 6600, '2021-05-18', '2021-05-18', 1, '4095', 0, 2, '2021-06-21 22:02:45', NULL, '2021-06-21 22:02:45', NULL, NULL),
(49, NULL, 40, 50, '2021000044', 1, 3, 40500, 0, 11000, 11000, 29500, '2021-05-27', '2021-05-27', 3, '4158', 0, 2, '2021-06-21 22:07:16', NULL, '2021-06-21 22:07:16', NULL, NULL),
(50, NULL, 42, 52, '2021000045', 1, 3, 28000, 28000, 0, 28000, 0, '2021-05-20', '2021-05-20', 3, '4124', 0, 2, '2021-06-21 22:15:42', NULL, '2021-06-21 22:15:42', NULL, NULL),
(51, NULL, 45, 55, '2021000046', 1, 3, 28000, 28000, 0, 28000, 0, '2021-06-08', '2021-06-08', 3, '4172', 0, 2, '2021-06-21 22:17:30', NULL, '2021-06-21 22:17:30', NULL, NULL),
(52, NULL, 46, 56, '2021000047', 1, 3, 35000, 17000, 3000, 20000, 15000, '2021-06-08', '2021-06-08', 3, '4174', 0, 2, '2021-06-21 22:19:18', NULL, '2021-06-21 22:19:18', NULL, NULL),
(53, NULL, 48, 58, '2021000048', 1, 3, 28500, 28500, 0, 28500, 0, '2021-05-22', '2021-05-22', 3, '4137', 0, 2, '2021-06-21 22:20:31', NULL, '2021-06-21 22:20:31', NULL, NULL),
(54, NULL, 50, 59, '2021000049', 1, 4, 34000, 0, 10000, 10000, 24000, '2021-05-19', '2021-09-10', 3, '4104', 0, 2, '2021-06-21 22:22:02', NULL, '2021-06-21 22:22:02', NULL, NULL),
(55, NULL, 49, 60, '2021000050', 1, 3, 23000, 5000, 0, 5000, 18000, '2021-06-15', '2021-06-15', 3, '4198', 0, 2, '2021-06-21 22:24:07', NULL, '2021-06-21 22:24:07', NULL, NULL),
(56, NULL, 50, 61, '2021000051', 1, 3, 29800, 0, 8400, 8400, 21400, '2021-05-19', '2021-05-19', 3, '230', 0, 2, '2021-06-21 22:26:05', NULL, '2021-06-21 22:26:05', NULL, NULL),
(57, NULL, 51, 62, '2021000052', 1, 3, 29000, 29000, 0, 29000, 0, '2021-05-12', '2021-05-12', 3, 'PECQUQE6FD', 0, 2, '2021-06-21 22:27:30', NULL, '2021-06-21 22:27:30', NULL, NULL),
(58, NULL, 52, 63, '2021000053', 1, 5, 44600, 0, 15000, 15000, 29600, '2021-05-24', '2021-05-24', 3, '4142', 0, 2, '2021-06-21 22:29:23', NULL, '2021-06-21 22:29:23', NULL, NULL),
(59, NULL, 53, 64, '2021000054', 1, 2, 26400, 26400, 0, 26400, 0, '2021-05-10', '2021-05-10', 3, '4041', 0, 2, '2021-06-21 22:32:51', NULL, '2021-06-21 22:32:51', NULL, NULL),
(60, NULL, 121, 65, '2021000055', 1, 2, 39000, 6000, 7000, 13000, 26000, '2021-05-22', '2021-05-22', 3, 'PEJP4RQQFHC', 0, 2, '2021-06-22 16:57:44', NULL, '2021-06-22 16:57:44', NULL, NULL),
(61, NULL, 55, 66, '2021000056', 1, 3, 37800, 8600, 11400, 20000, 17800, '2021-05-20', '2021-05-20', 1, '4113', 0, 2, '2021-06-22 17:00:08', NULL, '2021-06-22 17:00:08', NULL, NULL),
(62, NULL, 56, 67, '2021000057', 1, 2, 32000, 16000, 2000, 18000, 14000, '2021-05-18', '2021-05-18', 3, 'PEEOXYBV93', 0, 2, '2021-06-22 17:03:35', NULL, '2021-06-22 17:03:35', NULL, NULL),
(63, NULL, 57, 68, '2021000058', 1, 2, 2900, 2900, 0, 2900, 0, '2021-05-26', '2021-05-26', 1, '4153', 0, 2, '2021-06-22 17:05:05', NULL, '2021-06-22 17:05:05', NULL, NULL),
(64, NULL, 58, 69, '2021000059', 1, 3, 28000, 28000, 0, 28000, 0, '2021-05-22', '2021-05-22', 2, 'PE1830NO9K', 0, 2, '2021-06-22 17:06:46', NULL, '2021-06-22 17:06:46', NULL, NULL),
(65, NULL, 59, 70, '2021000060', 1, 2, 28000, 28000, 0, 28000, 0, '2021-05-14', '2021-05-15', 2, '4051', 0, 2, '2021-06-22 17:08:26', NULL, '2021-06-22 17:08:26', NULL, NULL),
(66, NULL, 60, 71, '2021000061', 1, 3, 23000, 23000, 0, 23000, 0, '2021-05-14', '2021-05-17', 3, 'PEHTN4YYF', 0, 2, '2021-06-22 17:09:40', NULL, '2021-06-22 17:09:40', NULL, NULL),
(67, NULL, 61, 72, '2021000062', 1, 2, 28000, 28000, 0, 28000, 0, '2021-05-22', '2021-05-22', 3, 'PECSUTBD2D', 0, 2, '2021-06-22 17:11:38', NULL, '2021-06-22 17:11:38', NULL, NULL),
(68, NULL, 62, 73, '2021000063', 1, 2, 30000, 15000, 0, 15000, 15000, '2021-06-02', '2021-06-02', 2, '4163', 0, 2, '2021-06-22 17:14:45', NULL, '2021-06-22 17:14:45', NULL, NULL),
(69, NULL, 63, 74, '2021000064', 1, 2, 28000, 15000, 0, 15000, 13000, '2021-05-19', '2021-05-19', 3, 'PE361J3MC2', 0, 2, '2021-06-22 17:16:26', NULL, '2021-06-22 17:16:26', NULL, NULL),
(70, NULL, 64, 75, '2021000065', 1, 2, 28000, 27500, 0, 27500, 500, '2021-05-13', '2021-01-13', 2, '4068', 0, 2, '2021-06-22 17:18:01', NULL, '2021-06-22 17:18:01', NULL, NULL),
(71, NULL, 65, 76, '2021000066', 1, 2, 26250, 11000, 0, 11000, 15250, '2021-05-22', '2021-05-22', 3, 'PEH3215G47', 0, 2, '2021-06-22 17:20:03', NULL, '2021-06-22 17:20:03', NULL, NULL),
(72, NULL, 66, 77, '2021000067', 1, 5, 31500, 31500, 0, 31500, 0, '2021-05-12', '2021-05-12', 3, 'PEC4V3PG90', 0, 2, '2021-06-22 17:21:12', NULL, '2021-06-22 17:21:12', NULL, NULL),
(73, NULL, 41, 79, '2021000068', 1, 2, 21400, 20000, 0, 20000, 1400, '2021-05-18', '2021-05-24', 3, 'PE02B1TUD1', 0, 2, '2021-06-22 17:22:44', NULL, '2021-06-22 17:22:44', NULL, NULL),
(74, NULL, 68, 80, '2021000069', 1, 5, 30500, 23000, 0, 23000, 7500, '2021-05-21', '2021-05-21', 2, '4119', 0, 2, '2021-06-22 17:24:23', NULL, '2021-06-22 17:24:23', NULL, NULL),
(75, NULL, 69, 81, '2021000070', 1, 2, 30800, 17200, 7800, 25000, 5800, '2021-04-12', '2021-05-12', 3, 'PCK45X71CG', 0, 2, '2021-06-22 17:26:13', NULL, '2021-06-22 17:26:13', NULL, NULL),
(76, NULL, 70, 82, '2021000071', 1, 2, 28000, 28000, 0, 28000, 0, '2021-05-10', '2021-05-10', 1, '4036', 0, 2, '2021-06-22 17:27:06', NULL, '2021-06-22 17:27:06', NULL, NULL),
(77, NULL, 71, 83, '2021000072', 1, 2, 29500, 29500, 0, 29500, 0, '2021-05-12', '2021-05-12', 3, 'PEB4UF9HHG', 0, 2, '2021-06-22 17:28:06', NULL, '2021-06-22 17:28:06', NULL, NULL),
(78, NULL, 73, 85, '2021000073', 1, 5, 27500, 27500, 0, 27500, 0, '2021-06-08', '2021-06-08', 3, 'PF85V8TNCH', 0, 2, '2021-06-22 17:31:21', NULL, '2021-06-22 17:31:21', NULL, NULL),
(79, NULL, 74, 86, '2021000074', 1, 2, 28400, 28400, 0, 28400, 0, '2021-05-17', '2021-06-10', 1, '4084', 0, 2, '2021-06-22 17:33:19', NULL, '2021-06-22 17:33:19', NULL, NULL),
(82, NULL, 73, 87, '2021000075', 1, 2, 24900, 24900, 0, 24900, 0, '2021-06-08', '2021-06-08', 2, '4171', 0, 2, '2021-06-22 17:36:16', NULL, '2021-06-22 17:36:16', NULL, NULL),
(83, NULL, 75, 88, '2021000076', 1, 4, 33000, 33000, 0, 33000, 0, '2021-05-05', '2021-05-31', 2, '4354', 0, 2, '2021-06-22 17:37:52', NULL, '2021-06-22 17:37:52', NULL, NULL),
(84, NULL, 76, 89, '2021000077', 1, 4, 40600, 12400, 7600, 20000, 20600, '2021-05-18', '2021-05-18', 2, '4093', 0, 2, '2021-06-22 17:38:44', NULL, '2021-06-22 17:38:44', NULL, NULL),
(85, NULL, 77, 90, '2021000078', 1, 4, 32000, 32000, 0, 32000, 0, '2021-05-13', '2021-05-13', 1, '201443376006', 0, 2, '2021-06-22 17:43:26', NULL, '2021-06-22 17:43:26', NULL, NULL),
(86, NULL, 1, 98, '2021000079', 1, 4, 30300, 30300, 0, 30300, 0, '2021-05-10', '2021-05-10', 2, 'PE88Q1DAZ8', 0, 2, '2021-06-22 17:44:29', NULL, '2021-06-22 17:44:29', NULL, NULL),
(87, NULL, 78, 91, '2021000080', 1, 1, 29000, 20000, 0, 20000, 9000, '2021-06-15', '2021-06-15', 2, '4203', 0, 2, '2021-06-22 17:47:57', NULL, '2021-06-22 17:47:57', NULL, NULL),
(88, NULL, 79, 92, '2021000081', 1, 8, 32500, 32500, 0, 32500, 0, '2021-05-10', '2021-05-13', 1, '4035', 0, 2, '2021-06-22 17:51:18', NULL, '2021-06-22 17:51:18', NULL, NULL),
(89, NULL, 80, 93, '2021000082', 1, 1, 28400, 28400, 0, 28400, 0, '2021-05-17', '2021-05-20', 1, '4083', 0, 2, '2021-06-22 17:53:12', NULL, '2021-06-22 17:53:12', NULL, NULL),
(90, NULL, 81, 94, '2021000083', 1, 1, 33500, 0, 5000, 5000, 28500, '2021-02-09', '2021-05-12', 2, '4000', 0, 2, '2021-06-22 17:54:33', NULL, '2021-06-22 17:54:33', NULL, NULL),
(91, NULL, 81, 94, '2021000084', 1, 1, 28500, 28500, 0, 28500, 0, '2021-05-27', '2021-05-27', 2, 'PER6FK3GU', 0, 2, '2021-06-22 17:55:43', NULL, '2021-06-22 17:55:43', NULL, NULL),
(92, NULL, 82, 95, '2021000085', 1, 1, 26900, 26900, 0, 26900, 0, '2021-05-27', '2021-05-27', 1, '4156', 0, 2, '2021-06-22 17:56:51', NULL, '2021-06-22 17:56:51', NULL, NULL),
(93, NULL, 83, 96, '2021000086', 1, 5, 29500, 29500, 0, 29500, 0, '2021-05-22', '2021-05-24', 3, 'PEH02C1WFI', 0, 2, '2021-06-22 18:00:03', NULL, '2021-06-22 18:00:03', NULL, NULL),
(94, NULL, 11, 100, '2021000087', 1, 1, 29600, 19800, 9800, 29600, 0, '2021-05-12', '2021-05-12', 2, '4048', 0, 2, '2021-06-22 18:01:37', NULL, '2021-06-22 18:01:37', NULL, NULL),
(95, NULL, 134, 155, '2021000088', 1, 1, 29000, 29000, 0, 29000, 0, '2021-06-10', '2021-06-10', 3, 'PF94X62YAY', 0, 2, '2021-06-22 18:02:51', NULL, '2021-06-22 18:02:51', NULL, NULL),
(96, NULL, 134, 156, '2021000089', 1, 1, 27400, 27400, 0, 27400, 0, '2021-06-10', '2021-06-10', 2, 'PF95X65RN1', 0, 2, '2021-06-22 18:06:30', NULL, '2021-06-22 18:06:30', NULL, NULL),
(97, NULL, 86, 101, '2021000090', 1, 1, 38000, 23000, 15000, 38000, 0, '2021-06-16', '2021-06-16', 2, '4207', 0, 2, '2021-06-22 18:14:35', NULL, '2021-06-22 18:14:35', NULL, NULL),
(98, NULL, 1, 102, '2021000091', 1, 2, 30500, 30500, 0, 30500, 0, '2021-05-22', '2021-05-22', 2, '4139', 0, 2, '2021-06-22 18:16:21', NULL, '2021-06-22 18:16:21', NULL, NULL),
(99, NULL, 87, 103, '2021000092', 1, 2, 28000, 28000, 0, 28000, 0, '2021-06-10', '2021-06-10', 1, '4179', 0, 2, '2021-06-22 18:17:12', NULL, '2021-06-22 18:17:12', NULL, NULL),
(100, NULL, 88, 104, '2021000093', 1, 2, 30000, 20000, 0, 20000, 10000, '2021-06-10', '2021-06-10', 1, '4183', 0, 2, '2021-06-22 18:21:55', NULL, '2021-06-22 18:21:55', NULL, NULL),
(101, NULL, 1, 106, '2021000094', 1, 1, 21400, 20000, 0, 20000, 1400, '2021-06-14', '2021-06-14', 1, '4186', 0, 2, '2021-06-22 18:22:41', NULL, '2021-06-22 18:22:41', NULL, NULL),
(102, NULL, 111, 107, '2021000095', 1, 2, 28000, 28000, 0, 28000, 0, '2021-05-21', '2021-05-21', 2, '4120', 0, 2, '2021-06-22 18:25:26', NULL, '2021-06-22 18:25:26', NULL, NULL),
(103, NULL, 90, 108, '2021000096', 1, 1, 22750, 15250, 7500, 22750, 0, '2021-06-07', '2021-06-15', 2, '4206', 0, 2, '2021-06-22 18:26:21', NULL, '2021-06-22 18:26:21', NULL, NULL),
(104, NULL, 95, 114, '2021000097', 1, 2, 39000, 0, 6000, 6000, 33000, '2021-05-12', '2021-05-12', 2, '4209', 0, 2, '2021-06-22 18:27:56', NULL, '2021-06-22 18:27:56', NULL, NULL),
(105, NULL, 96, 115, '2021000098', 1, 5, 34000, 34000, 0, 34000, 0, '2021-05-18', '2021-05-18', 2, '4094', 0, 2, '2021-06-22 18:29:01', NULL, '2021-06-22 18:29:01', NULL, NULL),
(106, NULL, 97, 116, '2021000099', 1, 1, 29000, 29000, 0, 29000, 0, '2021-05-13', '2021-05-13', 2, '4065', 0, 2, '2021-06-22 18:35:09', NULL, '2021-06-22 18:35:09', NULL, NULL),
(107, NULL, 98, 117, '2021000100', 1, 1, 25500, 0, 2000, 2000, 23500, '2021-06-15', '2021-06-15', 1, '4204', 0, 2, '2021-06-22 18:36:06', NULL, '2021-06-22 18:36:06', NULL, NULL),
(108, NULL, 99, 118, '2021000101', 1, 1, 21400, 21400, 0, 21400, 0, '2021-05-20', '2021-05-20', 2, '4115', 0, 2, '2021-06-22 18:37:17', NULL, '2021-06-22 18:37:17', NULL, NULL),
(109, NULL, 100, 119, '2021000102', 1, 1, 33800, 16000, 10800, 26800, 7000, '2021-05-11', '2021-06-10', 2, '4045, 4208', 0, 2, '2021-06-22 18:39:21', NULL, '2021-06-22 18:39:21', NULL, NULL),
(110, NULL, 101, 120, '2021000103', 1, 5, 29500, 29000, 0, 29000, 500, '2021-05-17', '2021-06-15', 1, '4080, 4205', 0, 2, '2021-06-22 18:40:43', NULL, '2021-06-22 18:40:43', NULL, NULL),
(111, NULL, 64, 121, '2021000104', 1, 1, 27500, 23000, 0, 23000, 4500, '2021-05-13', '2021-05-13', 2, '4061', 0, 2, '2021-06-22 18:41:48', NULL, '2021-06-22 18:41:48', NULL, NULL),
(112, NULL, 102, 122, '2021000105', 1, 1, 23000, 23000, 0, 23000, 0, '2021-05-17', '2021-05-17', 2, '4081', 0, 2, '2021-06-22 18:44:08', NULL, '2021-06-22 18:44:08', NULL, NULL),
(113, NULL, 28, 123, '2021000106', 1, 2, 26900, 16500, 0, 16500, 10400, '2021-05-17', '2021-05-17', 2, '4087', 0, 2, '2021-06-22 18:45:56', NULL, '2021-06-22 18:45:56', NULL, NULL),
(114, NULL, 15, 124, '2021000107', 1, 1, 14500, 4250, 2250, 6500, 8000, '2021-05-22', '2021-06-02', 2, '4130, 4164', 0, 2, '2021-06-22 18:47:18', NULL, '2021-06-22 18:47:18', NULL, NULL),
(115, NULL, 104, 125, '2021000108', 1, 1, 32000, 24000, 0, 24000, 8000, '2021-05-17', '2021-06-07', 1, '4074, 4167', 0, 2, '2021-06-22 18:48:27', NULL, '2021-06-22 18:48:27', NULL, NULL),
(116, NULL, 1, 127, '2021000109', 1, 1, 29400, 29400, 0, 29400, 0, '2021-05-13', '2021-05-13', 2, '4064', 0, 2, '2021-06-22 18:50:20', NULL, '2021-06-22 18:50:20', NULL, NULL),
(117, NULL, 107, 130, '2021000110', 1, 8, 33000, 20000, 0, 20000, 13000, '2021-05-26', '2021-05-26', 2, '4151', 0, 2, '2021-06-22 19:03:20', NULL, '2021-06-22 19:03:20', NULL, NULL),
(118, NULL, 108, 131, '2021000111', 1, 1, 30500, 30500, 0, 30500, 0, '2021-05-27', '2021-05-27', 1, '4159', 0, 2, '2021-06-22 19:05:08', NULL, '2021-06-22 19:05:08', NULL, NULL),
(119, NULL, 109, 132, '2021000112', 1, 5, 48800, 17200, 16800, 34000, 14800, '2021-05-21', '2021-05-26', 2, '4150', 0, 2, '2021-06-22 19:08:03', NULL, '2021-06-22 19:08:03', NULL, NULL),
(120, NULL, 110, 133, '2021000113', 1, 3, 35400, 23000, 7000, 30000, 5400, '2021-05-22', '2021-06-14', 2, '4132, 4195', 0, 2, '2021-06-22 19:09:13', NULL, '2021-06-22 19:09:13', NULL, NULL),
(121, NULL, 110, 134, '2021000114', 1, 1, 36800, 23200, 6800, 30000, 6800, '2021-05-22', '2021-06-14', 2, '4131,4196', 0, 2, '2021-06-22 19:10:14', NULL, '2021-06-22 19:10:14', NULL, NULL),
(122, NULL, 111, 135, '2021000115', 1, 6, 27300, 27300, 0, 27300, 0, '2021-06-07', '2021-06-07', 2, '4168', 0, 2, '2021-06-22 19:11:51', NULL, '2021-06-22 19:11:51', NULL, NULL),
(123, NULL, 112, 136, '2021000116', 1, 1, 28000, 28000, 0, 28000, 0, '2021-05-12', '2021-05-12', 2, '4054', 0, 2, '2021-06-22 19:13:04', NULL, '2021-06-22 19:13:04', NULL, NULL),
(124, NULL, 113, 137, '2021000117', 1, 4, 24000, 20000, 0, 20000, 4000, '2021-05-10', '2021-05-17', 1, '4073', 0, 2, '2021-06-22 19:14:12', NULL, '2021-06-22 19:14:12', NULL, NULL),
(125, NULL, 112, 138, '2021000118', 1, 1, 21400, 11000, 0, 11000, 10400, '2021-05-22', '2021-05-22', 2, '4127', 0, 2, '2021-06-22 19:15:25', NULL, '2021-06-22 19:15:25', NULL, NULL),
(126, NULL, 116, 142, '2021000119', 1, 1, 5000, 5000, 0, 5000, 0, '2021-05-13', '2021-05-13', 2, '4062', 0, 2, '2021-06-22 19:16:58', NULL, '2021-06-22 19:16:58', NULL, NULL),
(127, NULL, 122, 143, '2021000120', 1, 1, 6800, 6800, 0, 6800, 0, '2021-05-12', '2021-05-12', 2, '001', 0, 2, '2021-06-22 19:17:47', NULL, '2021-06-22 19:17:47', NULL, NULL),
(128, NULL, 123, 144, '2021000121', 1, 1, 6800, 6800, 0, 6800, 0, '2021-05-12', '2021-05-12', 2, '002', 0, 2, '2021-06-22 19:18:34', NULL, '2021-06-22 19:18:34', NULL, NULL),
(129, NULL, 124, 145, '2021000122', 1, 1, 37300, 37500, 0, 37500, -200, '2021-05-04', '2021-05-31', 2, '4161,4033', 0, 2, '2021-06-22 19:19:46', NULL, '2021-06-22 19:19:46', NULL, NULL),
(130, NULL, 125, 146, '2021000123', 1, 7, 6800, 5000, 0, 5000, 1800, '2021-05-22', '2021-05-22', 2, '4134', 0, 2, '2021-06-22 19:21:02', NULL, '2021-06-22 19:21:02', NULL, NULL),
(131, NULL, 126, 147, '2021000124', 1, 6, 11800, 5000, 0, 5000, 6800, '2021-05-13', '2021-06-16', 2, '4066', 0, 2, '2021-06-22 19:22:15', NULL, '2021-06-22 19:22:15', NULL, NULL),
(132, NULL, 127, 148, '2021000125', 1, 1, 11800, 8000, 0, 8000, 3800, '2021-05-22', '2021-05-22', 2, '4135', 0, 2, '2021-06-22 19:23:38', NULL, '2021-06-22 19:23:38', NULL, NULL),
(133, NULL, 128, 149, '2021000126', 1, 1, 40800, 20240, 0, 20240, 20560, '2021-05-03', '2021-06-14', 2, '4190', 0, 2, '2021-06-22 19:25:27', NULL, '2021-06-22 19:25:27', NULL, NULL),
(134, NULL, 129, 150, '2021000127', 1, 1, 40300, 40300, 0, 40300, 0, '2021-05-12', '2021-05-12', 2, '4050', 0, 2, '2021-06-22 19:26:33', NULL, '2021-06-22 19:26:33', NULL, NULL),
(135, NULL, 130, 151, '2021000128', 1, 1, 38300, 24000, 0, 24000, 14300, '2021-05-22', '2021-05-22', 1, '4136', 0, 2, '2021-06-22 19:27:25', NULL, '2021-06-22 19:27:25', NULL, NULL),
(136, NULL, 131, 152, '2021000129', 1, 2, 40300, 40300, 0, 40300, 0, '2021-05-24', '2021-06-14', 2, '4038, 4143', 0, 2, '2021-06-22 19:31:31', NULL, '2021-06-22 19:31:31', NULL, NULL),
(137, NULL, 132, 153, '2021000130', 1, 1, 42300, 17000, 0, 17000, 25300, '2021-05-15', '2021-05-15', 2, '4071', 0, 2, '2021-06-22 19:32:26', NULL, '2021-06-22 19:32:26', NULL, NULL),
(138, NULL, 132, 153, '2021000131', 1, 1, 25300, 25300, 0, 25300, 0, '2021-06-22', '2021-06-22', 3, 'PFM6FN09PY', 0, 2, '2021-06-22 20:18:02', NULL, '2021-06-22 20:18:02', NULL, NULL),
(139, NULL, 104, 125, '2021000132', 1, 1, 8000, 8000, 0, 8000, 0, '2021-05-21', '2021-05-21', 1, '4215', 0, 2, '2021-06-23 17:41:43', NULL, '2021-06-23 17:41:43', NULL, NULL),
(140, NULL, 107, 130, '2021000133', 1, 8, 13000, 13000, 0, 13000, 0, '2021-05-21', '2021-05-21', 2, '4217', 0, 2, '2021-06-23 17:45:29', NULL, '2021-06-23 17:45:29', NULL, NULL),
(141, NULL, 112, 138, '2021000134', 1, 1, 10400, 10400, 0, 10400, 0, '2021-06-23', '2021-06-24', 3, 'PFN9H6S2Z', 0, 2, '2021-06-24 18:33:08', NULL, '2021-06-24 18:33:08', NULL, NULL),
(142, NULL, 41, 79, '2021000135', 1, 2, 1400, 1400, 0, 1400, 0, '2021-06-24', '2021-06-21', 3, 'PFO8II6WMY', 0, 2, '2021-06-25 19:22:28', NULL, '2021-06-25 19:22:28', NULL, NULL),
(143, NULL, 21, 19, '2021000136', 1, 6, 36300, 25300, 11000, 36300, 0, '2021-06-27', '2021-06-28', 1, 'PFR2MYZK8S', 0, 2, '2021-06-28 16:59:04', NULL, '2021-06-28 16:59:04', NULL, NULL),
(144, NULL, 21, 18, '2021000137', 1, 6, 38000, 27000, 11000, 38000, 0, '2021-06-27', '2021-06-28', 1, '00001', 0, 2, '2021-06-28 17:03:02', NULL, '2021-06-28 17:03:02', NULL, NULL),
(145, NULL, 95, 114, '2021000138', 1, 2, 33000, 33000, 0, 33000, 0, '2021-06-27', '2021-06-28', 3, 'PFR5MDA2X5', 0, 2, '2021-06-28 17:06:27', NULL, '2021-06-28 17:06:27', NULL, NULL),
(146, NULL, 34, 41, '2021000139', 1, 4, 6300, 6300, 0, 6300, 0, '2021-06-27', '2021-06-28', 2, 'PFS9NIRLFF', 0, 2, '2021-06-28 17:08:43', NULL, '2021-06-28 17:08:43', NULL, NULL),
(147, NULL, 72, 84, '2021000140', 1, 5, 27000, 24000, 3000, 27000, 0, '2021-06-29', '2021-06-29', 3, 'PFS60V73LA', 0, 2, '2021-06-29 17:55:50', NULL, '2021-06-29 17:55:50', NULL, NULL),
(148, NULL, 128, 149, '2021000141', 1, 1, 20560, 20560, 0, 20560, 0, '2021-06-30', '2021-06-30', 2, 'PFU9QEWF4D', 0, 2, '2021-06-30 17:06:53', NULL, '2021-06-30 17:06:53', NULL, NULL),
(149, NULL, 130, 151, '2021000142', 1, 1, 14300, 14300, 0, 14300, 0, '2021-06-28', '2021-06-28', 2, 'PFS809APTG', 0, 2, '2021-06-30 17:11:15', NULL, '2021-06-30 17:11:15', NULL, NULL),
(150, NULL, 121, 65, '2021000143', 1, 2, 26000, 15000, 0, 15000, 11000, '2021-06-30', '2021-06-30', 1, '4239', 0, 2, '2021-06-30 20:20:13', NULL, '2021-06-30 20:20:13', NULL, NULL),
(151, NULL, 98, 117, '2021000144', 1, 1, 23500, 3500, 500, 4000, 19500, '2021-06-30', '2021-06-30', 2, 'PFT9P392L9', 0, 2, '2021-06-30 20:22:08', NULL, '2021-06-30 20:22:08', NULL, NULL),
(152, NULL, 12, 140, '2021000145', 1, 1, 19000, 2000, 7000, 9000, 10000, '2021-06-30', '2021-06-30', 1, 'PFJ1JVAMPJ', 0, 2, '2021-06-30 20:24:07', NULL, '2021-06-30 20:24:07', NULL, NULL),
(153, NULL, 62, 73, '2021000146', 1, 2, 15000, 15000, 0, 15000, 0, '2021-06-30', '2021-06-30', 2, 'PFP6K6AMM6', 0, 2, '2021-06-30 20:45:18', NULL, '2021-06-30 20:45:18', NULL, NULL),
(154, NULL, 55, 66, '2021000147', 1, 3, 17800, 17800, 0, 17800, 0, '2021-06-30', '2021-06-30', 1, '4230', 0, 2, '2021-06-30 20:46:59', NULL, '2021-06-30 20:46:59', NULL, NULL),
(155, NULL, 55, 22, '2021000148', 1, 6, 24500, 24500, 0, 24500, 0, '2021-06-30', '2021-06-30', 1, '4229', 0, 2, '2021-06-30 20:48:00', NULL, '2021-06-30 20:48:00', NULL, NULL),
(156, NULL, 1, 106, '2021000149', 1, 1, 1400, 1400, 0, 1400, 0, '2021-06-30', '2021-06-30', 1, '4234', 0, 2, '2021-06-30 21:00:40', NULL, '2021-06-30 21:00:40', NULL, NULL),
(157, NULL, 65, 76, '2021000150', 1, 2, 15250, 15250, 0, 15250, 0, '2021-06-24', '2021-06-24', 2, '4221', 0, 2, '2021-06-30 21:05:21', NULL, '2021-06-30 21:05:21', NULL, NULL),
(158, NULL, 52, 26, '2021000151', 1, 8, 55400, 0, 15000, 15000, 40400, '2021-06-28', '2021-06-28', 2, '4223', 0, 2, '2021-06-30 21:06:41', NULL, '2021-06-30 21:06:41', NULL, NULL),
(159, NULL, 23, 21, '2021000152', 1, 6, 29000, 29000, 0, 29000, 0, '2021-06-30', '2021-06-30', 1, '4240', 0, 2, '2021-06-30 21:11:53', NULL, '2021-06-30 21:11:53', NULL, NULL),
(160, NULL, 20, 17, '2021000153', 1, 8, 37500, 0, 10000, 10000, 27500, '2021-06-30', '2021-06-30', 1, '4213', 0, 2, '2021-06-30 21:17:25', NULL, '2021-06-30 21:17:25', NULL, NULL),
(161, NULL, 56, 67, '2021000154', 1, 2, 14000, 7000, 0, 7000, 7000, '2021-07-01', '2021-07-01', 3, 'PG12S1Z821', 0, 2, '2021-07-01 18:00:42', NULL, '2021-07-01 18:00:42', NULL, NULL),
(162, NULL, 63, 74, '2021000155', 1, 2, 13000, 13000, 0, 13000, 0, '2021-06-30', '2021-07-01', 3, 'PFU5R0UJ3B', 0, 2, '2021-07-01 18:03:56', NULL, '2021-07-01 18:03:56', NULL, NULL),
(163, NULL, 106, 128, '2021000156', 1, 5, 48800, 0, 15000, 15000, 33800, '2021-06-30', '2021-07-01', 3, 'PFU1R2L71L', 0, 2, '2021-07-01 18:09:51', NULL, '2021-07-01 18:09:51', NULL, NULL),
(164, NULL, 106, 129, '2021000157', 1, 1, 34600, 1800, 13200, 15000, 19600, '2021-06-30', '2021-07-01', 3, '200', 0, 2, '2021-07-01 18:10:54', NULL, '2021-07-01 18:10:54', NULL, NULL),
(165, NULL, 16, 13, '2021000158', 1, 6, 3100, 3100, 0, 3100, 0, '2021-06-30', '2021-07-01', 1, '201', 0, 2, '2021-07-01 18:15:37', NULL, '2021-07-01 18:15:37', NULL, NULL),
(166, NULL, 40, 50, '2021000159', 1, 3, 29500, 29500, 0, 29500, 0, '2021-05-22', '2021-05-22', 3, '4125', 0, 2, '2021-07-01 18:41:50', NULL, '2021-07-01 18:41:50', NULL, NULL),
(167, NULL, 49, 60, '2021000160', 1, 3, 18000, 5000, 0, 5000, 13000, '2021-07-06', '2021-07-06', 2, 'PG60ZJW270', 0, 2, '2021-07-06 21:39:03', NULL, '2021-07-06 21:39:03', NULL, NULL),
(168, NULL, 88, 104, '2021000161', 1, 2, 10000, 10000, 0, 10000, 0, '2021-06-05', '2021-07-06', 2, 'PG53YSQ71F', 0, 2, '2021-07-06 21:40:23', NULL, '2021-07-06 21:40:23', NULL, NULL),
(169, NULL, 105, 126, '2021000162', 1, 1, 3500, 3500, 0, 3500, 0, '2021-07-06', '2021-07-06', 2, 'PG53XMA9XL', 0, 2, '2021-07-06 21:41:46', NULL, '2021-07-06 21:41:46', NULL, NULL),
(170, NULL, 22, 20, '2021000163', 1, 6, 10000, 10000, 0, 10000, 0, '2021-07-06', '2021-07-06', 2, 'PG52XLJ388', 0, 2, '2021-07-06 21:43:24', NULL, '2021-07-06 21:43:24', NULL, NULL),
(171, NULL, 52, 63, '2021000164', 1, 5, 29600, 7700, 7300, 15000, 14600, '2021-07-06', '2021-07-06', 2, 'PG42XBLZZ2', 0, 2, '2021-07-06 21:44:51', NULL, '2021-07-06 21:44:51', NULL, NULL),
(172, NULL, 43, 53, '2021000165', 1, 3, 35500, 9000, 7000, 16000, 19500, '2021-07-01', '2021-07-01', 1, 'PFH58774G1', 0, 2, '2021-07-08 17:32:05', NULL, '2021-07-08 17:32:05', NULL, NULL),
(173, NULL, 39, 49, '2021000166', 1, 3, 6600, 6600, 0, 6600, 0, '2021-07-02', '2021-07-02', 1, '4245', 0, 2, '2021-07-08 17:32:55', NULL, '2021-07-08 17:32:55', NULL, NULL),
(174, NULL, 76, 89, '2021000167', 1, 4, 20600, 15000, 0, 15000, 5600, '2021-07-02', '2021-07-02', 2, 'PG20T8PX3N', 0, 2, '2021-07-08 17:34:02', NULL, '2021-07-08 17:34:02', NULL, NULL),
(175, NULL, 68, 80, '2021000168', 1, 5, 7500, 7500, 0, 7500, 0, '2021-07-05', '2021-07-05', 2, '4250', 0, 2, '2021-07-08 17:36:12', NULL, '2021-07-08 17:36:12', NULL, NULL),
(176, NULL, 46, 56, '2021000169', 1, 3, 15000, 15000, 0, 15000, 0, '2021-07-06', '2021-07-06', 2, 'PG57Y8T1U2', 0, 2, '2021-07-08 17:38:32', NULL, '2021-07-08 17:38:32', NULL, NULL),
(177, NULL, 126, 147, '2021000170', 1, 6, 6800, 3800, 0, 3800, 3000, '2021-07-07', '2021-07-07', 2, 'PG7122U6M9', 0, 2, '2021-07-08 17:40:08', NULL, '2021-07-08 17:40:08', NULL, NULL),
(178, NULL, 52, 26, '2021000171', 1, 8, 40400, 0, 15000, 15000, 25400, '2021-07-08', '2021-07-08', 2, 'PG863EZAFO', 0, 2, '2021-07-08 21:26:52', NULL, '2021-07-08 21:26:52', NULL, NULL),
(179, NULL, 133, 154, '2021000172', 1, 5, 152000, 0, 10000, 10000, 142000, '2021-06-05', '2021-07-07', 1, '0005', 0, 2, '2021-07-08 21:29:14', NULL, '2021-07-08 21:29:14', NULL, NULL),
(180, NULL, 1, 99, '2021000173', 1, 1, 9750, 3000, 0, 3000, 6750, '2021-07-07', '2021-07-09', 1, '4259', 0, 2, '2021-07-12 17:21:51', NULL, '2021-07-12 17:21:51', NULL, NULL),
(181, NULL, 28, 32, '2021000174', 1, 8, 10000, 10000, 0, 10000, 0, '2021-07-07', '2021-07-08', 1, '5260', 0, 2, '2021-07-12 17:23:07', NULL, '2021-07-12 17:23:07', NULL, NULL),
(182, NULL, 28, 123, '2021000175', 1, 2, 10400, 10400, 0, 10400, 0, '2021-07-07', '2021-07-08', 1, '4261', 0, 2, '2021-07-12 17:24:27', NULL, '2021-07-12 17:24:27', NULL, NULL),
(183, NULL, 110, 133, '2021000176', 1, 3, 5400, 5400, 0, 5400, 0, '2021-07-12', '2021-07-12', 2, 'PGC1961HZ3', 0, 2, '2021-07-13 04:27:11', NULL, '2021-07-13 04:27:11', NULL, NULL),
(184, NULL, 110, 134, '2021000177', 1, 1, 6800, 6800, 0, 6800, 0, '2021-07-12', '2021-07-12', 2, 'PGC89648DS', 0, 2, '2021-07-13 04:28:44', NULL, '2021-07-13 04:28:44', NULL, NULL),
(185, NULL, 31, 35, '2021000178', 1, 4, 13000, 0, 5000, 5000, 8000, '2021-07-12', '2021-07-12', 2, 'PGC39OURPX', 0, 2, '2021-07-13 04:29:56', NULL, '2021-07-13 04:29:56', NULL, NULL),
(186, NULL, 30, 34, '2021000179', 2, 6, 26000, 6000, 0, 6000, 20000, '2021-07-20', '2021-07-20', 1, '98765432', 0, 1, '2021-07-20 14:25:31', NULL, '2021-07-20 14:25:31', NULL, NULL),
(187, NULL, 33, 40, '2021000180', 2, 5, 33000, 4500, 0, 4500, 28500, '2021-07-19', '2021-07-19', 1, '876523014', 0, 1, '2021-07-20 16:47:09', NULL, '2021-07-20 16:47:09', NULL, NULL),
(188, NULL, 63, 74, '2021000181', 2, 3, 30000, 7500, 0, 7500, 22500, '2021-07-21', '2021-07-21', 2, '1234569805', 0, 1, '2021-07-21 11:54:13', NULL, '2021-07-21 11:54:13', NULL, NULL),
(189, NULL, 12, 140, '2021000182', 2, 2, 35000, 0, 5000, 5000, 30000, '2021-07-21', '2021-07-21', 1, '852369852', 0, 1, '2021-07-21 20:25:50', NULL, '2021-07-21 20:25:50', NULL, NULL),
(190, NULL, 63, 74, '2021000183', 2, 3, 22500, 2500, 0, 2500, 20000, '2021-07-30', '2021-07-30', 1, '2536140258', 1, 2, '2022-02-16 11:34:59', NULL, '2022-02-16 11:34:59', NULL, NULL),
(191, NULL, 8, 5, '2021000184', 2, 8, 27000, 5200, 0, 5200, 21800, '2021-08-07', '2021-08-07', 2, '1223665478', 0, 2, '2021-08-07 20:15:25', NULL, '2021-08-07 20:15:25', NULL, NULL),
(192, NULL, 121, 65, '2021000185', 2, 3, 45000, 0, 5000, 5000, 40000, '2021-08-12', '2021-08-12', 1, '258963147', 0, 1, '2021-08-12 18:19:25', NULL, '2021-08-12 18:19:25', NULL, NULL),
(193, NULL, 15, 124, '2021000186', 2, 2, 35250, 2000, 8000, 10000, 25250, '2021-08-13', '2021-08-13', 1, '2345678765', 0, 1, '2021-08-13 07:12:42', NULL, '2021-08-13 07:12:42', NULL, NULL),
(194, NULL, 28, 32, '2021000187', 2, 9, 35500, 12000, 0, 12000, 23500, '2021-08-13', '2021-08-13', 1, '1234567876', 0, 1, '2021-08-13 10:23:39', NULL, '2021-08-13 10:23:39', NULL, NULL),
(195, NULL, 20, 17, '2021000188', 2, 9, 54500, 0, 13000, 13000, 41500, '2021-08-16', '2021-08-16', 1, '7418529654', 1, 1, '2022-03-22 10:31:32', NULL, '2022-03-22 10:31:32', NULL, NULL),
(196, NULL, 1, 99, '2021000189', 2, 2, 36250, 4250, 6750, 11000, 25250, '2021-08-16', '2021-08-16', 1, '12345698741', 0, 1, '2021-08-16 09:39:38', NULL, '2021-08-16 09:39:38', NULL, NULL),
(197, NULL, 130, 151, '2021000190', 2, 2, 35000, 15000, 0, 15000, 20000, '2021-08-17', '2021-08-17', 1, '12345676543', 0, 1, '2021-08-17 09:13:22', NULL, '2021-08-17 09:13:22', NULL, NULL),
(199, NULL, 8, 5, '2021000192', 2, 8, 16800, 6000, 0, 6000, 10800, '2021-09-15', '2021-09-15', 3, 'OKJ7HLOJKU', 0, 1, '2021-09-14 23:46:48', NULL, '2021-09-14 23:46:48', NULL, NULL),
(200, NULL, 8, 5, '2021000193', 2, 8, 10800, 2000, 0, 2000, 8800, '2021-09-15', '2021-09-15', 3, 'OKJ7HLOTKU', 0, 1, '2021-09-14 23:51:05', NULL, '2021-09-14 23:51:05', NULL, NULL),
(201, NULL, 8, 5, '2021000194', 2, 8, 8800, 2000, 0, 2000, 6800, '2021-09-15', '2021-09-15', 3, 'OKJ8HLOTKU', 0, 1, '2021-09-14 23:54:21', NULL, '2021-09-14 23:54:21', NULL, NULL),
(202, NULL, 50, 59, '2021000195', 2, 5, 54500, 0, 10000, 10000, 44500, '2021-09-21', '2021-09-21', 1, '12369857421', 1, 1, '2022-02-25 07:52:47', NULL, '2022-02-25 07:52:47', NULL, NULL),
(203, NULL, 14, 11, '2021000196', 2, 8, 27000, 20000, 0, 20000, 7000, '2021-10-19', '2021-10-19', 3, 'PTY56UJH23', 0, 1, '2021-10-19 11:10:47', NULL, '2021-10-19 11:10:47', NULL, NULL),
(204, NULL, 11, 100, '2021000197', 2, 2, 23400, 23500, 0, 23500, -100, '2021-11-08', '2021-11-08', 1, '12354658912', 0, 1, '2021-11-08 07:08:57', NULL, '2021-11-08 07:08:57', NULL, NULL),
(205, NULL, 15, 124, '2021000198', 2, 2, 25250, 5000, 0, 5000, 20250, '2021-11-18', '2021-11-18', 2, '236545879', 0, 1, '2021-11-18 07:38:32', NULL, '2021-11-18 07:38:32', NULL, NULL),
(206, NULL, 6, 3, '2021000199', 2, 8, 45000, 7000, 18000, 25000, 20000, '2021-11-26', '2021-11-26', 2, 'IB116cd8a1d1b56FGE', 0, 1, '2021-11-26 15:24:54', NULL, NULL, NULL, NULL),
(208, NULL, 7, 4, '2021000200', 2, 8, 71500, 0, 2500, 2500, 69000, '2021-11-26', '2021-11-26', 2, 'IB116cd8a1d1b56BN6', 0, 1, '2021-11-26 15:56:23', NULL, NULL, NULL, NULL),
(209, NULL, 7, 4, '2021000201', 2, 8, 69000, 0, 5000, 5000, 64000, '2021-11-26', '2021-11-26', 2, 'IB116cd8a1d1b47BN6', 0, 1, '2021-11-26 18:15:39', NULL, NULL, NULL, NULL),
(210, NULL, 107, 130, '2021000202', 2, 9, 35000, 15000, 0, 15000, 20000, '2021-12-11', '2021-12-11', 2, '45678987654', 0, 1, '2021-12-11 08:12:33', NULL, '2021-12-11 08:12:33', NULL, NULL),
(211, NULL, 20, 54, '2021000203', 2, 4, 78700, 7300, 52700, 60000, 18700, '2021-12-15', '2021-12-15', 2, '5421298774455', 0, 1, '2021-12-15 11:45:38', NULL, '2021-12-15 11:45:38', NULL, NULL),
(212, NULL, 130, 151, '2021000204', 2, 2, 20000, 20000, 0, 20000, 0, '2021-12-15', '2021-12-15', 1, '456865221324', 0, 1, '2021-12-15 20:36:37', NULL, '2021-12-15 20:36:37', NULL, NULL),
(213, NULL, 47, 57, '2021000205', 2, 8, 27000, 27000, 0, 27000, 0, '2021-12-07', '2021-12-06', 2, '75676756436436', 0, 1, '2021-12-15 20:37:13', NULL, '2021-12-15 20:37:13', NULL, NULL),
(214, NULL, 107, 130, '2021000206', 2, 9, 20000, 20000, 0, 20000, 0, '2021-11-30', '2021-11-30', 1, '12345678', 0, 1, '2021-12-15 20:38:03', NULL, '2021-12-15 20:38:03', NULL, NULL),
(215, NULL, 12, 140, '2021000207', 2, 2, 30000, 27000, 5000, 32000, -2000, '2021-11-29', '2021-11-29', 2, '676434522343258', 0, 1, '2021-12-15 20:38:58', NULL, '2021-12-15 20:38:58', NULL, NULL),
(216, NULL, 63, 74, '2021000208', 2, 4, 25500, 25500, 0, 25500, 0, '2021-12-01', '2021-12-01', 1, '98870045321', 0, 1, '2021-12-15 20:39:36', NULL, '2021-12-15 20:39:36', NULL, NULL),
(217, NULL, 50, 59, '2021000209', 2, 5, 44500, 30500, 14000, 44500, 0, '2021-12-02', '2021-12-02', 2, '5678676543522', 0, 1, '2021-12-15 20:40:22', NULL, '2021-12-15 20:40:22', NULL, NULL),
(218, NULL, 98, 117, '2021000210', 2, 2, 44500, 22500, 19500, 42000, 2500, '2021-12-02', '2021-12-02', 2, '6784568768643', 0, 1, '2021-12-15 20:41:26', NULL, '2021-12-15 20:41:26', NULL, NULL),
(219, NULL, 42, 52, '2021000211', 2, 4, 31000, 31000, 0, 31000, 0, '2021-12-03', '2021-12-03', 1, '4656758455673412', 0, 1, '2021-12-15 20:42:02', NULL, '2021-12-15 20:42:02', NULL, NULL),
(220, NULL, 80, 24, '2021000212', 2, 6, 33000, 18000, 0, 18000, 15000, '2021-12-06', '2021-12-06', 1, '76867900009776', 0, 1, '2021-12-15 20:42:51', NULL, '2021-12-15 20:42:51', NULL, NULL),
(221, NULL, 80, 24, '2021000213', 2, 6, 15000, 15000, 0, 15000, 0, '2021-12-05', '2021-12-05', 2, '4564536445400021', 0, 1, '2021-12-15 20:43:28', NULL, '2021-12-15 20:43:28', NULL, NULL),
(222, NULL, 9, 6, '2021000214', 2, 8, 27000, 30000, 0, 30000, -3000, '2022-01-06', '2022-01-06', 2, '7896543214', 0, 1, '2022-01-06 11:20:01', NULL, '2022-01-06 11:20:01', NULL, NULL),
(223, NULL, 33, 40, '2021000215', 2, 5, 32000, 15000, 0, 15000, 17000, '2022-01-06', '2022-01-06', 2, '254789654', 0, 1, '2022-01-06 12:00:26', NULL, '2022-01-06 12:00:26', NULL, NULL),
(224, NULL, 7, 4, '2021000216', 2, 8, 64000, 13000, 37000, 50000, 14000, '2022-01-06', '2022-01-06', 1, '121213545648', 0, 1, '2022-01-06 12:11:53', NULL, '2022-01-06 12:11:53', NULL, NULL),
(225, NULL, 12, 140, '2021000217', 2, 2, -2000, 5000, 0, 5000, -7000, '2022-01-11', '2022-01-11', 1, '1236548745', 0, 1, '2022-01-11 11:43:38', NULL, '2022-01-11 11:43:38', NULL, NULL),
(226, NULL, 94, 113, '2021000218', 2, 10, 33500, 22700, 2300, 25000, 8500, '2022-01-20', '2022-01-20', 1, '43658396588900', 0, 1, '2022-01-20 07:51:40', NULL, '2022-01-20 07:51:40', NULL, NULL),
(227, NULL, 134, 156, '2021000219', 2, 2, 36800, 2000, 0, 2000, 34800, '2022-02-07', '2022-02-06', 1, '876543209873', 1, 1, '2022-02-07 09:33:38', 1, '2022-02-07 09:33:38', NULL, NULL),
(228, NULL, 10, 7, '2021000220', 2, 8, 27750, 250, 750, 1000, 26750, '2022-02-07', '2022-02-07', 2, '46936359532543', 0, 1, '2022-02-07 09:38:52', NULL, '2022-02-07 09:38:52', NULL, NULL),
(229, NULL, 105, 126, '2021000221', 2, 2, 31950, 10000, 0, 10000, 21950, '2022-02-08', '2022-02-08', 2, '5678765432', 2, 1, '2022-02-08 09:29:27', NULL, '2022-02-08 09:29:27', NULL, NULL),
(230, NULL, 138, 160, '2021000222', 2, 1, 45800, 2000, 0, 2000, 43800, '2022-02-16', '2022-02-16', 1, '2365478954', 2, 1, '2022-02-16 09:15:58', 1, '2022-02-16 09:15:58', NULL, NULL),
(231, NULL, 138, 160, '2021000223', 2, 1, 43800, 10000, 0, 10000, 33800, '2022-02-16', '2022-02-16', 1, '67890765432', 3, 1, '2022-02-23 21:21:17', 1, '2022-02-23 21:21:17', NULL, NULL),
(232, NULL, 15, 12, '2021000224', 2, 9, 95000, 0, 5000, 5000, 90000, '2022-02-24', '2022-02-24', 1, '123654785', 0, 1, '2022-02-24 11:39:09', NULL, '2022-02-24 11:39:09', NULL, NULL),
(233, NULL, 138, 160, '2021000225', 2, 1, 33800, 2000, 0, 2000, 31800, '2022-02-25', '2022-02-25', 1, '25487125452', 1, 1, '2022-02-25 07:58:05', 1, '2022-02-25 07:58:05', NULL, NULL),
(235, NULL, 4, 1, '2021000226', 2, 9, 27000, 5000, 0, 5000, 22000, '2021-09-15', '2021-09-15', 3, 'OKJ7HLOGRE', 0, 1, '2022-03-02 16:31:09', NULL, '2022-03-02 16:31:09', NULL, NULL),
(236, NULL, 63, 74, '2021000227', 2, 4, 5050, 5000, 0, 5000, 50, '2022-03-02', '2022-03-02', 2, 'IB116cd8a1d1b47NJ7', 0, 1, '2022-03-02 16:53:43', NULL, NULL, NULL, NULL),
(237, NULL, 63, 74, '2021000228', 2, 4, 50, 800, 0, 800, -750, '2022-03-02', '2022-03-02', 2, 'IB116cd8a1d1b47XV4', 0, 1, '2022-03-02 17:00:31', NULL, NULL, NULL, NULL),
(238, NULL, 130, 151, '2021000229', 2, 2, 1500, 0, 500, 500, 1000, '2022-03-02', '2022-03-02', 2, 'IB116cd8a1d1b54SP0', 0, 1, '2022-03-02 17:54:30', NULL, NULL, NULL, NULL),
(241, NULL, 130, 151, '2021000230', 2, 2, 1000, 0, 500, 500, 500, '2022-03-02', '2022-03-02', 2, 'IB116cd8a1d1b54SP5', 0, 1, '2022-03-02 18:02:42', NULL, NULL, NULL, NULL),
(242, NULL, 59, 70, '2021000231', 2, 3, 30000, 2000, 0, 2000, 28000, '2022-03-02', '2022-03-02', 2, 'IB116cd8a1d1b54SP3', 0, 1, '2022-03-02 18:06:11', NULL, NULL, NULL, NULL),
(244, NULL, 53, 43, '2021000232', 2, 4, 39050, 2000, 0, 2000, 37050, '2021-09-15', '2021-09-15', 3, 'OKJ8HLOTKA', 0, 1, '2022-03-02 19:42:27', NULL, '2022-03-02 19:42:27', NULL, NULL),
(245, NULL, 112, 138, '2021000233', 2, 2, 25000, 10000, 0, 10000, 15000, '2022-03-22', '2022-03-22', 1, '321654789', 1, 1, '2022-03-22 10:33:49', NULL, '2022-03-22 10:33:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `financial_years`
--

CREATE TABLE `financial_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_years`
--

INSERT INTO `financial_years` (`id`, `name`, `long_name`, `slug`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '2021', '2020-2021', '2020-2021', 1, 1, '2021-05-08 07:28:14', NULL, '2021-05-08 07:28:14', NULL, NULL),
(2, '2022', '2021-2022', '2021-2022', 1, 1, '2021-05-08 07:39:30', NULL, '2021-05-08 07:39:30', NULL, NULL),
(3, '2023', '2022-2023', '2022-2023', 1, 1, '2021-07-13 08:19:19', NULL, '2021-07-13 08:19:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gen_students`
--

CREATE TABLE `gen_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_outboxes`
--

CREATE TABLE `message_outboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_id` bigint(20) NOT NULL,
  `externalMessageId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messageId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneno` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `characters` int(11) NOT NULL,
  `sms_units` int(11) NOT NULL,
  `sms_cost` double(6,2) NOT NULL,
  `target` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusCode` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_outboxes`
--

INSERT INTO `message_outboxes` (`id`, `code`, `recipient_id`, `externalMessageId`, `messageId`, `message`, `phoneno`, `characters`, `sms_units`, `sms_cost`, `target`, `statusCode`, `status`, `delivered_at`, `created_at`, `updated_at`) VALUES
(1, '4c1cc48427b244e3a6e2db82565f9ec7', 1, NULL, '354b9e34f4844aaf9dc9261fa439f5bf', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0010', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(2, '4c1cc48427b244e3a6e2db82565f9ec7', 2, NULL, '5b5c94e6004641babb3c73d82743975c', 'Dear Parent, Kindly clear Moses Mwangi Njamba fees balance of 34000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0019', '0720871499', 197, 2, 1.60, 'students', NULL, NULL, '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(3, '4c1cc48427b244e3a6e2db82565f9ec7', 3, NULL, '9db81c5d24b540cb8a32918748bd74ae', 'Dear Parent, Kindly clear Jack Otieno Ogendo fees balance of 45000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0022', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(4, '4c1cc48427b244e3a6e2db82565f9ec7', 4, NULL, '137fbfbc7e9940a784a2437e0fe14143', 'Dear Parent, Kindly clear Salome Mwende Mutiso fees balance of 71500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0026', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(5, '4c1cc48427b244e3a6e2db82565f9ec7', 5, NULL, '524f89f17af14aab8f77c0af3918895f', 'Dear Parent, Kindly clear Abigail Wambui Wangui fees balance of 6800 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0034', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(6, '4c1cc48427b244e3a6e2db82565f9ec7', 6, NULL, '3953cc545aab46ed84a000406d0520cc', 'Dear Parent, Kindly clear Shawn Kinuthia Njenga fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0035', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(7, '4c1cc48427b244e3a6e2db82565f9ec7', 7, NULL, 'f0f45e4f26eb4dd69800712a32351a58', 'Dear Parent, Kindly clear Yvonne Wanjiru Kimani fees balance of 27750 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0036', '0720871499', 199, 2, 1.60, 'students', NULL, 'UserNameBlacklisted', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(8, '4c1cc48427b244e3a6e2db82565f9ec7', 8, NULL, '868164b73f0c4b188f4b58c4e9b57f2e', 'Dear Parent, Kindly clear Christian Muchene fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0037', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(9, '4c1cc48427b244e3a6e2db82565f9ec7', 9, NULL, '071227f11a62494298ed0aa68f3295da', 'Dear Parent, Kindly clear Ivanna Wambui Kimani fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0041', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(10, '4c1cc48427b244e3a6e2db82565f9ec7', 11, NULL, '9c733fe2756b40b786b47b8c141d0a1b', 'Dear Parent, Kindly clear Bernard Kamiti Mwaura fees balance of 7000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0057', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(11, '4c1cc48427b244e3a6e2db82565f9ec7', 12, NULL, '0ba2832f6c0149b884d964c61b1cc167', 'Dear Parent, Kindly clear Amos Kipkorir fees balance of 95000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0059', '0714730671', 191, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(12, '4c1cc48427b244e3a6e2db82565f9ec7', 13, NULL, '15fc43a47d3345e69fbf4b715ff58f7f', 'Dear Parent, Kindly clear Justus Munene Kirangi fees balance of 29500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0073', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(13, '4c1cc48427b244e3a6e2db82565f9ec7', 14, NULL, '1da8c688e0c14bc48617ddce4021f77a', 'Dear Parent, Kindly clear Benjamin Wanjala Shiundu fees balance of 40250 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0075', '0720871499', 202, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(14, '4c1cc48427b244e3a6e2db82565f9ec7', 15, NULL, '2fbf0ca807ba4742a887983c6a7d18a4', 'Dear Parent, Kindly clear Janelle Agutu Ontomwa fees balance of 42500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0078', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(15, '4c1cc48427b244e3a6e2db82565f9ec7', 17, NULL, '30cd4b0cc8bd4a33abdb5ed7a9fcc4f7', 'Dear Parent, Kindly clear Amos Ochieng Odiwour fees balance of 41500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0082', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(16, '4c1cc48427b244e3a6e2db82565f9ec7', 18, NULL, '3956c6bbb6254a0897239cefd851a7a6', 'Dear Parent, Kindly clear Rayan Wanjohi Mureu fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0084', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(17, '4c1cc48427b244e3a6e2db82565f9ec7', 19, NULL, 'a4df17f57aa54bd090f6fb57b1f2ad06', 'Dear Parent, Kindly clear Johnstone Kagwanja Muiruri fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0085', '0720871499', 204, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(18, '4c1cc48427b244e3a6e2db82565f9ec7', 20, NULL, 'c2aa49632efa4b9da9117e783ecfa1c3', 'Dear Parent, Kindly clear Felistus Nyambura fees balance of 37000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0086', '0720871499', 195, 2, 1.60, 'students', NULL, 'UserNameBlacklisted', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(19, '4c1cc48427b244e3a6e2db82565f9ec7', 21, NULL, '2330f94c29aa4f918c16d480766749c1', 'Dear Parent, Kindly clear Evans Mwaniki fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0096', '0720871499', 191, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(20, '4c1cc48427b244e3a6e2db82565f9ec7', 22, NULL, 'f3f08014b05c40519b58f6eaa6ebf298', 'Dear Parent, Kindly clear Samwel Mureithi fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0098', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(21, '4c1cc48427b244e3a6e2db82565f9ec7', 23, NULL, '9c87961bf2b848a89edbf4e921e4ab0f', 'Dear Parent, Kindly clear Faith Muthoni  fees balance of 31500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0127', '0720871499', 192, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(22, '4c1cc48427b244e3a6e2db82565f9ec7', 24, NULL, 'b013c19acde044219d7296876f982b96', 'Dear Parent, Kindly clear Ian Jomo Kianangi  fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0132', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:35', '2021-10-19 21:41:35'),
(23, '4c1cc48427b244e3a6e2db82565f9ec7', 25, NULL, '52fd8b05c70f422a8e258ef092d85b01', 'Dear Parent, Kindly clear Shamira Wanjeri fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0136', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(24, '4c1cc48427b244e3a6e2db82565f9ec7', 26, NULL, '0dba55eb5c234313b9273430e55311e3', 'Dear Parent, Kindly clear Nicole Atieno Oliech fees balance of 52400 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0137', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(25, '4c1cc48427b244e3a6e2db82565f9ec7', 27, NULL, '4c947fee445249279c59dfecaf3231d5', 'Dear Parent, Kindly clear Jeremiah Wandaro fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0144', '0720871499', 194, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(26, '4c1cc48427b244e3a6e2db82565f9ec7', 28, NULL, 'b38f5bda7929468f835117842539a21e', 'Dear Parent, Kindly clear Onesmus Nyanteri fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0145', '0720871499', 194, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(27, '4c1cc48427b244e3a6e2db82565f9ec7', 29, NULL, 'ea272ce8d345431b9935c1db6d94a377', 'Dear Parent, Kindly clear Jayden Nyamweya Omweri fees balance of 35300 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0146', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(28, '4c1cc48427b244e3a6e2db82565f9ec7', 30, NULL, '40839410ab004f5f803e0575c195ab91', 'Dear Parent, Kindly clear Martha Wambui Mburu fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0147', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(29, '4c1cc48427b244e3a6e2db82565f9ec7', 31, NULL, 'c805171a2c424643bdb3b8900ae6ecdc', 'Dear Parent, Kindly clear Leah Muthoni fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0152', '0720871499', 190, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(30, '4c1cc48427b244e3a6e2db82565f9ec7', 32, NULL, 'e1cb72bb86d64cedb3894dc49fc08b1d', 'Dear Parent, Kindly clear Chantaal Nyambura fees balance of 23500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0157', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(31, '4c1cc48427b244e3a6e2db82565f9ec7', 33, NULL, '4943af9d219c479e89a3bea7366c9dbe', 'Dear Parent, Kindly clear Junior James Gitau fees balance of 38000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0159', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(32, '4c1cc48427b244e3a6e2db82565f9ec7', 34, NULL, '187d6d5da31c43cbb64417e8e4118ab8', 'Dear Parent, Kindly clear Anastacia Wanjira Njoki fees balance of 20000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0163', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(33, '4c1cc48427b244e3a6e2db82565f9ec7', 35, NULL, '1c6bbc7fc9a64d1db3cbd8d05b59d5f6', 'Dear Parent, Kindly clear Elizabeth Wambui fees balance of 34000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0165', '0720871499', 194, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(34, '4c1cc48427b244e3a6e2db82565f9ec7', 36, NULL, 'bb9e1989425b4b4e8450688e6c1def11', 'Dear Parent, Kindly clear Delilah Wawendo Murage fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0166', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(35, '4c1cc48427b244e3a6e2db82565f9ec7', 37, NULL, '0eb927e558184d0bafcb5ae8fd8e4a20', 'Dear Parent, Kindly clear Monicah Njeri Kamau fees balance of 31500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0167', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(36, '4c1cc48427b244e3a6e2db82565f9ec7', 38, NULL, 'b89d3a7b29534b2fb8b885dfcb9107b9', 'Dear Parent, Kindly clear Rachael Kanyi fees balance of 26000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0175', '0720871499', 191, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(37, '4c1cc48427b244e3a6e2db82565f9ec7', 39, NULL, 'fcc88d3dd1674a838197fce20cf5a497', 'Dear Parent, Kindly clear Kelsey Nyaboke fees balance of 35000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0177', '0720871499', 192, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(38, '4c1cc48427b244e3a6e2db82565f9ec7', 40, NULL, '1653f00d85584384a965ec5e028cb72f', 'Dear Parent, Kindly clear Benson Macharia Wambugu fees balance of 28500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0180', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(39, '4c1cc48427b244e3a6e2db82565f9ec7', 42, NULL, '0b56f66be7a441d58483f5ac71844741', 'Dear Parent, Kindly clear Peter Kamau Maina fees balance of 29500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0182', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(40, '4c1cc48427b244e3a6e2db82565f9ec7', 43, NULL, '26baca76b57a450a88f33937959393f1', 'Dear Parent, Kindly clear Caleb Muikamba fees balance of 26000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0192', '0720871499', 192, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(41, '4c1cc48427b244e3a6e2db82565f9ec7', 44, NULL, '0a0c047bb3dd4a829300fc1e8aac7589', 'Dear Parent, Kindly clear Ethan Jones Maina fees balance of 36900 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0193', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(42, '4c1cc48427b244e3a6e2db82565f9ec7', 45, NULL, '08394a001a31439596337eaa3530643a', 'Dear Parent, Kindly clear Elaine Mwikali fees balance of 35000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0194', '0720871499', 192, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(43, '4c1cc48427b244e3a6e2db82565f9ec7', 47, NULL, '4b954bc0ece74107a4493ff9b4169da4', 'Dear Parent, Kindly clear Liz Wangui Kamau fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0202', '0720871499', 194, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(44, '4c1cc48427b244e3a6e2db82565f9ec7', 48, NULL, '59d6e706c27249b9954092d0fb95e100', 'Dear Parent, Kindly clear Martin Gacheru fees balance of 94000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0205', '0720871499', 192, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(45, '4c1cc48427b244e3a6e2db82565f9ec7', 49, NULL, '9f8d15252ecc4716b0bf3be678f8d2f7', 'Dear Parent, Kindly clear Phoebe Wangui Nyambura fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0211', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(46, '4c1cc48427b244e3a6e2db82565f9ec7', 50, NULL, 'f130ac8c385b46be974c9ab8e31210c2', 'Dear Parent, Kindly clear Allan Ndirangu Mwaura fees balance of 32500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0214', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(47, '4c1cc48427b244e3a6e2db82565f9ec7', 51, NULL, '55d5f566a65043119ac276c6ed0151ea', 'Dear Parent, Kindly clear Vincent Muteti fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0215', '0720871499', 192, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(48, '4c1cc48427b244e3a6e2db82565f9ec7', 52, NULL, '64fd2f2d03ac4a15af246ad29e00138b', 'Dear Parent, Kindly clear Jacky Wamaitha Nyutu fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0218', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(49, '4c1cc48427b244e3a6e2db82565f9ec7', 53, NULL, '80f6ac7d7b8440129462131dd49e29dd', 'Dear Parent, Kindly clear Eliana Wanjira Thuku fees balance of 51000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0219', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(50, '4c1cc48427b244e3a6e2db82565f9ec7', 54, NULL, '2940a34dcdd244eca9e594e066131e91', 'Dear Parent, Kindly clear Kelvin Ngugi Kamau fees balance of 78700 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0222', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(51, '4c1cc48427b244e3a6e2db82565f9ec7', 55, NULL, 'd1523b2040fb4d64b82951f6b5dabdf4', 'Dear Parent, Kindly clear Michael Wanjiru Gichuga fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0223', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(52, '4c1cc48427b244e3a6e2db82565f9ec7', 56, NULL, 'df28c4835067403286e15617e749ca53', 'Dear Parent, Kindly clear James Ngugi Maina fees balance of 35000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0224', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(53, '4c1cc48427b244e3a6e2db82565f9ec7', 57, NULL, 'a69ecc1a003b48e1997eb445c0041bf8', 'Dear Parent, Kindly clear Evans Kibue Kiama fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0225', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(54, '4c1cc48427b244e3a6e2db82565f9ec7', 58, NULL, '5220b6470b7f490681738180fbfad075', 'Dear Parent, Kindly clear Marx Maina Muteria fees balance of 31500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0228', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(55, '4c1cc48427b244e3a6e2db82565f9ec7', 59, NULL, '985a2c6db2e3464b839e7cd8a3e1e8d1', 'Dear Parent, Kindly clear Alex Kiriama Gitau fees balance of 44500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0230', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(56, '4c1cc48427b244e3a6e2db82565f9ec7', 60, NULL, 'e9c303039be04bd289a03d5457452a8d', 'Dear Parent, Kindly clear Milanda Anyango Onyango fees balance of 39000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0234', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(57, '4c1cc48427b244e3a6e2db82565f9ec7', 61, NULL, 'a4451b3e465140a4b0f4a1b6c0ad7344', 'Dear Parent, Kindly clear Stacie Wanjiku Wamucii fees balance of 47400 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0235', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(58, '4c1cc48427b244e3a6e2db82565f9ec7', 62, NULL, '3fb7f81dc0f04374974a7ad8f08365af', 'Dear Parent, Kindly clear Moses Kariuki Munyaka fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0236', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(59, '4c1cc48427b244e3a6e2db82565f9ec7', 63, NULL, 'b4b9e1960eaa4a0c85812156e0e5bf28', 'Dear Parent, Kindly clear Horace Odara Obara fees balance of 40600 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0237', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(60, '4c1cc48427b244e3a6e2db82565f9ec7', 64, NULL, '68e5c6452c1b481bb7c50f70b70045d8', 'Dear Parent, Kindly clear Kilvin Mutembei fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0238', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(61, '4c1cc48427b244e3a6e2db82565f9ec7', 65, NULL, '773c4f26f0e6423eaa7f1f81338042f8', 'Dear Parent, Kindly clear Jane Njambi Muriuki fees balance of 41000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0239', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(62, '4c1cc48427b244e3a6e2db82565f9ec7', 66, NULL, '15ead8b387924753b4fd50c1ee975494', 'Dear Parent, Kindly clear Emmah Riziki Ashah fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0241', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(63, '4c1cc48427b244e3a6e2db82565f9ec7', 67, NULL, 'd94ed808176f461f985dbe537229e08f', 'Dear Parent, Kindly clear Washington Nyongesa Masika fees balance of 39000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0242', '0720871499', 204, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(64, '4c1cc48427b244e3a6e2db82565f9ec7', 68, NULL, 'ff5e22e81f0d4e338aad3ca05ba10433', 'Dear Parent, Kindly clear Joanace Gathiga Mwaniki fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0243', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(65, '4c1cc48427b244e3a6e2db82565f9ec7', 69, NULL, '2ca5eae3c32842398e24972bd25683b5', 'Dear Parent, Kindly clear Jane Karinge Mande fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0244', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(66, '4c1cc48427b244e3a6e2db82565f9ec7', 70, NULL, 'a7f458bccb644ea9b917473088ede221', 'Dear Parent, Kindly clear Claudia Wanjiku Wabera fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0245', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(67, '4c1cc48427b244e3a6e2db82565f9ec7', 71, NULL, 'ea685c0b63104e869c217abdad1282b1', 'Dear Parent, Kindly clear Vincent Kungu Kimathi fees balance of 26000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0246', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(68, '4c1cc48427b244e3a6e2db82565f9ec7', 72, NULL, '7476fc2909d74623b46821e1eed415a6', 'Dear Parent, Kindly clear Eddie Karanja Kiogora fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0247', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(69, '4c1cc48427b244e3a6e2db82565f9ec7', 73, NULL, '4f41c568f58d494684bebeeb19261312', 'Dear Parent, Kindly clear Susan Naemba Wanjala fees balance of 34000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0249', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(70, '4c1cc48427b244e3a6e2db82565f9ec7', 74, NULL, 'c3d3419e42e146539c3d31319ef02a9a', 'Dear Parent, Kindly clear Adriel Maina Macharia fees balance of 25500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0250', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(71, '4c1cc48427b244e3a6e2db82565f9ec7', 75, NULL, '558894bc2f5e4e06afba822abbf15d4f', 'Dear Parent, Kindly clear Quintah Wema Gitonga fees balance of 30500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0253', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(72, '4c1cc48427b244e3a6e2db82565f9ec7', 76, NULL, '7249e0049e674530b43219150444feea', 'Dear Parent, Kindly clear Mathias Njenga Macharia fees balance of 28250 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0255', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(73, '4c1cc48427b244e3a6e2db82565f9ec7', 77, NULL, '054869b66344414ca8fa1b9b99e5aad5', 'Dear Parent, Kindly clear Mike Gichinga Kimani fees balance of 33500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0257', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(74, '4c1cc48427b244e3a6e2db82565f9ec7', 78, NULL, '15bc52315bd34bcb97e1ebfbaa2643f0', 'Dear Parent, Kindly clear Loreen Njeri Njeru fees balance of 35000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0258', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(75, '4c1cc48427b244e3a6e2db82565f9ec7', 79, NULL, 'ee3ad1b0575541e6b8147b8b3705f444', 'Dear Parent, Kindly clear Terrence Otieno fees balance of 25000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0261', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(76, '4c1cc48427b244e3a6e2db82565f9ec7', 80, NULL, '112f1048cc2643f0b6146a9306b6c5ea', 'Dear Parent, Kindly clear Janet Pendo Mwamba fees balance of 32500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0263', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(77, '4c1cc48427b244e3a6e2db82565f9ec7', 81, NULL, '4715113bdc5f4932a0d462d9471c559d', 'Dear Parent, Kindly clear Imani Nyanumba fees balance of 30800 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0266', '0720871499', 192, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(78, '4c1cc48427b244e3a6e2db82565f9ec7', 82, NULL, 'b6c7c8ab463b4ac6b7f1223c7a8b7a39', 'Dear Parent, Kindly clear Moses Karanja fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0267', '0720871499', 191, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(79, '4c1cc48427b244e3a6e2db82565f9ec7', 83, NULL, 'f2d9cac5167c46138ad72c2bb717f88d', 'Dear Parent, Kindly clear Ethern Mungai Githinga fees balance of 31500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0269', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(80, '4c1cc48427b244e3a6e2db82565f9ec7', 84, NULL, 'c19ac2dd5e83454aadac571f0c546cf0', 'Dear Parent, Kindly clear Jackson Gichuhi Muchiri fees balance of 26000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0270', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(81, '4c1cc48427b244e3a6e2db82565f9ec7', 85, NULL, '6b97e86272e24c17942daac7ad73314c', 'Dear Parent, Kindly clear Yvette Moraa Moracha fees balance of 29500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0271', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(82, '4c1cc48427b244e3a6e2db82565f9ec7', 86, NULL, '450cabd244e44f6888d05c8c311277dc', 'Dear Parent, Kindly clear Kyla Wanjeri fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0272', '0720871499', 190, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(83, '4c1cc48427b244e3a6e2db82565f9ec7', 87, NULL, 'ebd8fb54bb7e47729abf5385ebe6ed5e', 'Dear Parent, Kindly clear Victoria Valery fees balance of 28500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0273', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(84, '4c1cc48427b244e3a6e2db82565f9ec7', 88, NULL, '75690d473537417ca979e8c389bcec0a', 'Dear Parent, Kindly clear Tanice Simintei fees balance of 35000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0276', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(85, '4c1cc48427b244e3a6e2db82565f9ec7', 89, NULL, '8bf2b482cec44272a0f87f477941df6c', 'Dear Parent, Kindly clear Fiona Chepchirchir Cheruiyot fees balance of 40600 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0277', '0720871499', 206, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(86, '4c1cc48427b244e3a6e2db82565f9ec7', 90, NULL, '14c76bd1eab041de92e4ccc444cafba9', 'Dear Parent, Kindly clear Terryann Cheruto fees balance of 34000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0278', '0720871499', 194, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(87, '4c1cc48427b244e3a6e2db82565f9ec7', 91, NULL, '33b8c11afcdd4228b3cf51367fd24da1', 'Dear Parent, Kindly clear Robert Mbugua Wanyeki fees balance of 40000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0280', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(88, '4c1cc48427b244e3a6e2db82565f9ec7', 92, NULL, 'd7c769a07057460d837d44f0b08b76c9', 'Dear Parent, Kindly clear Viviana Njambi Njuguna fees balance of 34500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0282', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(89, '4c1cc48427b244e3a6e2db82565f9ec7', 93, NULL, '7340acac235f430ea59063ad97d67310', 'Dear Parent, Kindly clear Maya Blessing Mwandie fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0283', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(90, '4c1cc48427b244e3a6e2db82565f9ec7', 94, NULL, 'b7b84ea61b6941d8bc3b9d3059107496', 'Dear Parent, Kindly clear Isabella Muthoni fees balance of 30500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0284', '0720871499', 194, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(91, '4c1cc48427b244e3a6e2db82565f9ec7', 95, NULL, 'a13eb818d4da40aa9898fb8245a7106f', 'Dear Parent, Kindly clear Natalie Muthoni Muthomi fees balance of 30500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0285', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:36', '2021-10-19 21:41:36'),
(92, '4c1cc48427b244e3a6e2db82565f9ec7', 96, NULL, 'fc592c3a6bf34c7c89e7656eba712c99', 'Dear Parent, Kindly clear Lilian Njoki Mbiu fees balance of 31500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0286', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(93, '4c1cc48427b244e3a6e2db82565f9ec7', 97, NULL, '2575d03098f84c09b2f028f54d592897', 'Dear Parent, Kindly clear Immaculate Nyambura Nderitu fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0287', '0720871499', 205, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(94, '4c1cc48427b244e3a6e2db82565f9ec7', 98, NULL, 'ec5e8b6fea87411e806ce349f3e01064', 'Dear Parent, Kindly clear Imela Waembu Karimi fees balance of 33200 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0279', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(95, '4c1cc48427b244e3a6e2db82565f9ec7', 99, NULL, 'eb2da6405a454902bde75cf3e7d9f41f', 'Dear Parent, Kindly clear Asher Mwalimu fees balance of 25250 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0293', '0720871499', 191, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(96, '4c1cc48427b244e3a6e2db82565f9ec7', 100, NULL, '5504ab320dc8480db1c1a6ba5898941b', 'Dear Parent, Kindly clear Davies Ngugi Gathogo fees balance of 23400 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0294', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(97, '4c1cc48427b244e3a6e2db82565f9ec7', 101, NULL, 'a26eb518605c414f8f709addeb0a9bf8', 'Dear Parent, Kindly clear Tamara Wangui Nungari fees balance of 25000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0297', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(98, '4c1cc48427b244e3a6e2db82565f9ec7', 102, NULL, '6dff04f8fbc840eabc8d4a379bc28153', 'Dear Parent, Kindly clear Keslie Njoki Mwendandu fees balance of 32500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0298', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(99, '4c1cc48427b244e3a6e2db82565f9ec7', 103, NULL, 'cb5f1da9d5014fcba661c271630303ac', 'Dear Parent, Kindly clear Oliver Wekesa Shilandura fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0299', '0720871499', 202, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(100, '4c1cc48427b244e3a6e2db82565f9ec7', 104, NULL, '23cee887f164405d98a2a2e50df8f22e', 'Dear Parent, Kindly clear Declan Mbecha Kuria fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0300', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(101, '4c1cc48427b244e3a6e2db82565f9ec7', 105, NULL, '2f9a3015683c4e1797f03b7ad617d64f', 'Dear Parent, Kindly clear Hellen Wangui Wanjiru fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0301', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(102, '4c1cc48427b244e3a6e2db82565f9ec7', 106, NULL, '01646804b6ca4a3588a0f3abbf34c171', 'Dear Parent, Kindly clear Alice Njeri Makena fees balance of 25000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0302', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(103, '4c1cc48427b244e3a6e2db82565f9ec7', 107, NULL, '18ff9776a58e44539fd265bd83effb5b', 'Dear Parent, Kindly clear Nancy Nduta Kanyiri fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0303', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(104, '4c1cc48427b244e3a6e2db82565f9ec7', 108, NULL, '2a0490e7dba64329aafb8f15f2517160', 'Dear Parent, Kindly clear Tracyann Wambui Mwendia fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0304', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(105, '4c1cc48427b244e3a6e2db82565f9ec7', 109, NULL, '2adebea798774b0fbf2ecda3d72f5a9e', 'Dear Parent, Kindly clear Elius Waringa Nduta fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0305', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(106, '4c1cc48427b244e3a6e2db82565f9ec7', 110, NULL, '03a84909edd14c6e98b953520d06a8e1', 'Dear Parent, Kindly clear Wilberforce Simiyu fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0306', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(107, '4c1cc48427b244e3a6e2db82565f9ec7', 111, NULL, '58d7121c5b7a4f3bad34631844d4d268', 'Dear Parent, Kindly clear Purity Agunda Ochieng fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0307', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(108, '4c1cc48427b244e3a6e2db82565f9ec7', 112, NULL, '2709a0a566f14cbb8fbfbdb0d8716314', 'Dear Parent, Kindly clear Kelseyann Gathoni Gacheru fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0309', '0720871499', 203, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(109, '4c1cc48427b244e3a6e2db82565f9ec7', 113, NULL, '778993695cfd44dfaadf8ce9dd05b9b5', 'Dear Parent, Kindly clear Innocent Simiyu Wanjala fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0310', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(110, '4c1cc48427b244e3a6e2db82565f9ec7', 114, NULL, '1361125c08434e76b85d998948504091', 'Dear Parent, Kindly clear Verena Waturi Mburu fees balance of 37000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0312', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(111, '4c1cc48427b244e3a6e2db82565f9ec7', 115, NULL, '57be4ccc878f4c6bbaa38cb5b3dda24c', 'Dear Parent, Kindly clear Shirleen Gathoni fees balance of 36000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0313', '0720871499', 194, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(112, '4c1cc48427b244e3a6e2db82565f9ec7', 116, NULL, 'a1bade6d845e4a6fbf19f8c9ddf6ef55', 'Dear Parent, Kindly clear Natania Wanjiku fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0314', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(113, '4c1cc48427b244e3a6e2db82565f9ec7', 117, NULL, '3dc21b73e6b742ffb6b1990693dcf4bd', 'Dear Parent, Kindly clear Allan Macharia Munyaka fees balance of 44500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0316', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(114, '4c1cc48427b244e3a6e2db82565f9ec7', 118, NULL, '96286c68f9274daf9002ec8320cd0265', 'Dear Parent, Kindly clear Melanie Wamuyu Wanyoike fees balance of 25000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0317', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(115, '4c1cc48427b244e3a6e2db82565f9ec7', 119, NULL, '5a40a66b93f44940a29fa8763e40ffa7', 'Dear Parent, Kindly clear Vivian Wangui Nduati fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0318', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(116, '4c1cc48427b244e3a6e2db82565f9ec7', 120, NULL, 'fb957dbe274246eb917efbcc5079d29d', 'Dear Parent, Kindly clear Fabius Wanderi Nderu fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0319', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(117, '4c1cc48427b244e3a6e2db82565f9ec7', 121, NULL, '2b68d861d9734efc9eca357d0ef1d572', 'Dear Parent, Kindly clear Daniel Muturi Chomba fees balance of 34000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0320', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37');
INSERT INTO `message_outboxes` (`id`, `code`, `recipient_id`, `externalMessageId`, `messageId`, `message`, `phoneno`, `characters`, `sms_units`, `sms_cost`, `target`, `statusCode`, `status`, `delivered_at`, `created_at`, `updated_at`) VALUES
(118, '4c1cc48427b244e3a6e2db82565f9ec7', 122, NULL, '80e7ef223ead4a209161b37ed062676f', 'Dear Parent, Kindly clear Nyce Waithera fees balance of 29500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0321', '0720871499', 191, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(119, '4c1cc48427b244e3a6e2db82565f9ec7', 123, NULL, 'e8958cbe22fc4a3f9bd331dadb1e5125', 'Dear Parent, Kindly clear David Kimiti Mateu fees balance of 30500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0322', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(120, '4c1cc48427b244e3a6e2db82565f9ec7', 124, NULL, 'f822ac8ac3d7419c98d82149dc104f63', 'Dear Parent, Kindly clear Celine Wairimu Chege fees balance of 25250 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0323', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(121, '4c1cc48427b244e3a6e2db82565f9ec7', 125, NULL, 'a82eaf0ffd714b6d88fa1f08e1012cd8', 'Dear Parent, Kindly clear Esther Achieng Oluoch fees balance of 34000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0324', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(122, '4c1cc48427b244e3a6e2db82565f9ec7', 126, NULL, 'b87982a5c938499995e932687bdbc1fc', 'Dear Parent, Kindly clear Andrew Karanu Njoroge fees balance of 27500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0325', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(123, '4c1cc48427b244e3a6e2db82565f9ec7', 127, NULL, 'a9f0d8d283d946f79d0109ce311a3695', 'Dear Parent, Kindly clear Edrian Karanja Mbugua fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0326', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(124, '4c1cc48427b244e3a6e2db82565f9ec7', 128, NULL, 'f9fca0d57cff47338bb61af842d07b06', 'Dear Parent, Kindly clear Clement Njoroge Kamau fees balance of 59800 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0327', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(125, '4c1cc48427b244e3a6e2db82565f9ec7', 129, NULL, 'a5fcda36895d4eadb36452c9d58b0351', 'Dear Parent, Kindly clear Jayson Kiarie Manyeki fees balance of 44600 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0328', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(126, '4c1cc48427b244e3a6e2db82565f9ec7', 130, NULL, 'f0d6aceb091949c49445b7194f5fc741', 'Dear Parent, Kindly clear Caleb Moses fees balance of 35000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0329', '0720871499', 189, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(127, '4c1cc48427b244e3a6e2db82565f9ec7', 131, NULL, 'd22cd6a176dc41bdaaa19eea83aeaf05', 'Dear Parent, Kindly clear Siobhan Sibwoga fees balance of 34500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0330', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(128, '4c1cc48427b244e3a6e2db82565f9ec7', 132, NULL, '341e7401eaec4f95b0f4f5e7673c0756', 'Dear Parent, Kindly clear Tasha Baraka Wangeci fees balance of 48800 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0331', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(129, '4c1cc48427b244e3a6e2db82565f9ec7', 133, NULL, '8bf8fce6e14c432ca851ab4926066595', 'Dear Parent, Kindly clear Rebecca Kendi Muraya fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0332', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(130, '4c1cc48427b244e3a6e2db82565f9ec7', 134, NULL, 'e7cf24896e9b4dc78cd24a4e85412ae7', 'Dear Parent, Kindly clear Taraji Wanjiru Kimemia fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0333', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(131, '4c1cc48427b244e3a6e2db82565f9ec7', 135, NULL, '720ed1b0b8e749e8add11e2f264dddf1', 'Dear Parent, Kindly clear Roy Mungai Muigai fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0334', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(132, '4c1cc48427b244e3a6e2db82565f9ec7', 136, NULL, 'a2efe998d4444668b9afd84ee6fff8e2', 'Dear Parent, Kindly clear Zenita Wangui Blessings fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0335', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(133, '4c1cc48427b244e3a6e2db82565f9ec7', 137, NULL, '2f042bf05a3347ccaf02de0795154d31', 'Dear Parent, Kindly clear John Njagi Mwaura fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0336', '0720871499', 195, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(134, '4c1cc48427b244e3a6e2db82565f9ec7', 138, NULL, 'f9f7b9f2d69d4c759f46acf889c20c37', 'Dear Parent, Kindly clear Alicia Mwitemania Kariuki fees balance of 25000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0337', '0720871499', 203, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(135, '4c1cc48427b244e3a6e2db82565f9ec7', 140, NULL, 'baf72db2482c4b77855335b16da7f0da', 'Dear Parent, Kindly clear Abraham Nyutu Kimani fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0339', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(136, '4c1cc48427b244e3a6e2db82565f9ec7', 142, NULL, '3164dece223b4144b26a8a93aaddb2a8', 'Dear Parent, Kindly clear Linah Warembo fees balance of 25000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0341', '0720871499', 191, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(137, '4c1cc48427b244e3a6e2db82565f9ec7', 143, NULL, 'f62948b8e0774f639cf973c69ae3b70b', 'Dear Parent, Kindly clear Luciano Thuo Wanjohi fees balance of 25000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0342', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(138, '4c1cc48427b244e3a6e2db82565f9ec7', 144, NULL, '94f58a1f770b49b99b34eaa3d1de9d69', 'Dear Parent, Kindly clear Veronicah Wamucii Munini fees balance of 23400 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0343', '0720871499', 202, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(139, '4c1cc48427b244e3a6e2db82565f9ec7', 145, NULL, 'a74d8aa2384c4418a76f2ae2220d42e3', 'Dear Parent, Kindly clear Mitchell Waceke Nduati fees balance of 29300 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0344', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(140, '4c1cc48427b244e3a6e2db82565f9ec7', 146, NULL, '8dee5cfa723544d5a8089486a5bafaa3', 'Dear Parent, Kindly clear Elijah Githua Njoroge fees balance of 28800 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0345', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(141, '4c1cc48427b244e3a6e2db82565f9ec7', 147, NULL, 'e4ddc11a895741a8ac5740f120e5e152', 'Dear Parent, Kindly clear Joe Kagai fees balance of 29000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0346', '0720871499', 187, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(142, '4c1cc48427b244e3a6e2db82565f9ec7', 148, NULL, '1b412c72b89e48e7abf9cf67dda47386', 'Dear Parent, Kindly clear Tamilla Noni Njenga fees balance of 28800 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0347', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(143, '4c1cc48427b244e3a6e2db82565f9ec7', 149, NULL, '0b8fa1e0deda4f658ea6bf247a567dda', 'Dear Parent, Kindly clear Simeone Mutua Kilonzo fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0348', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(144, '4c1cc48427b244e3a6e2db82565f9ec7', 150, NULL, '829351bb79af46b994924f457999607d', 'Dear Parent, Kindly clear Fabian Muchene Murugami fees balance of 30500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0349', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(145, '4c1cc48427b244e3a6e2db82565f9ec7', 151, NULL, '838856d8189e4f8abea829f25fa910f8', 'Dear Parent, Kindly clear Annice Waithira Kungu fees balance of 20000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0350', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(146, '4c1cc48427b244e3a6e2db82565f9ec7', 152, NULL, 'ac44c756be1541f198268296a2553750', 'Dear Parent, Kindly clear Jacinta Wahito Kahura fees balance of 30500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0351', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(147, '4c1cc48427b244e3a6e2db82565f9ec7', 153, NULL, '4c564d05a3114eca803617ad50ca66af', 'Dear Parent, Kindly clear Cherly Wambui Gitagia fees balance of 34500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0352', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(148, '4c1cc48427b244e3a6e2db82565f9ec7', 154, NULL, 'd38f86ab7490446a87a890c922243852', 'Dear Parent, Kindly clear Shadrack Odhiambo Odiwour fees balance of 177500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0158', '0720871499', 204, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(149, '4c1cc48427b244e3a6e2db82565f9ec7', 155, NULL, 'f7c9ba0fc306440a8a476d727bae4290', 'Dear Parent, Kindly clear Precious Waithera Muteria fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0295', '0720871499', 203, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(150, '4c1cc48427b244e3a6e2db82565f9ec7', 156, NULL, '5d14f6d7632b48e78db16b9ae5e996d3', 'Dear Parent, Kindly clear Meshack Kiarie Njuguna fees balance of 32700 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0296', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:41:37', '2021-10-19 21:41:37'),
(151, '8e852af1313b4e4f9ef3751d17739b8c', 1, NULL, '7fb2c6ab67964acb917a6b96b270d93a', 'Dear Parent, The school officially opens on 01/01/2021. Give Jane Njeri Mwaniki the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(152, '8e852af1313b4e4f9ef3751d17739b8c', 2, NULL, '64029d29e6bc427b9c5dfb69d752f6aa', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Mwangi Njamba the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(153, '8e852af1313b4e4f9ef3751d17739b8c', 3, NULL, 'fc7b6db9b66842308e144f57f64a698e', 'Dear Parent, The school officially opens on 01/01/2021. Give Jack Otieno Ogendo the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(154, '8e852af1313b4e4f9ef3751d17739b8c', 4, NULL, 'e12eb20da4d34ce3a4fe00c059cb76d3', 'Dear Parent, The school officially opens on 01/01/2021. Give Salome Mwende Mutiso the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(155, '8e852af1313b4e4f9ef3751d17739b8c', 5, NULL, '65cd0b55b1d24dcb9676033040dc90df', 'Dear Parent, The school officially opens on 01/01/2021. Give Abigail Wambui Wangui the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(156, '8e852af1313b4e4f9ef3751d17739b8c', 6, NULL, '09eb28d62b484ca29bcfb944d97f450b', 'Dear Parent, The school officially opens on 01/01/2021. Give Shawn Kinuthia Njenga the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(157, '8e852af1313b4e4f9ef3751d17739b8c', 7, NULL, 'c4c12007715446dd81389ededc278335', 'Dear Parent, The school officially opens on 01/01/2021. Give Yvonne Wanjiru Kimani the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(158, '8e852af1313b4e4f9ef3751d17739b8c', 8, NULL, '234a8840a7944c28ac0ab84767c8b0fa', 'Dear Parent, The school officially opens on 01/01/2021. Give Christian Muchene the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(159, '8e852af1313b4e4f9ef3751d17739b8c', 9, NULL, 'e8f7f610e2cb44a8b5b13aac6aa29d98', 'Dear Parent, The school officially opens on 01/01/2021. Give Ivanna Wambui Kimani the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(160, '8e852af1313b4e4f9ef3751d17739b8c', 11, NULL, '920da09ca119413ca39ff932c614858e', 'Dear Parent, The school officially opens on 01/01/2021. Give Bernard Kamiti Mwaura the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(161, '8e852af1313b4e4f9ef3751d17739b8c', 12, NULL, '9dc1aa289be147b6a3fefb6f634375b1', 'Dear Parent, The school officially opens on 01/01/2021. Give Amos Kipkorir the items required.', '0714730671', 94, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(162, '8e852af1313b4e4f9ef3751d17739b8c', 13, NULL, 'e01979930e004729ab57b1f91234dd1c', 'Dear Parent, The school officially opens on 01/01/2021. Give Justus Munene Kirangi the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(163, '8e852af1313b4e4f9ef3751d17739b8c', 14, NULL, 'd2d83697e71e4953bb9c8563efb806bd', 'Dear Parent, The school officially opens on 01/01/2021. Give Benjamin Wanjala Shiundu the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(164, '8e852af1313b4e4f9ef3751d17739b8c', 15, NULL, 'fad0e002909246c28ef7d7f45d67beda', 'Dear Parent, The school officially opens on 01/01/2021. Give Janelle Agutu Ontomwa the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(165, '8e852af1313b4e4f9ef3751d17739b8c', 17, NULL, 'c6076d2d3b01481c911f8e607b97ec78', 'Dear Parent, The school officially opens on 01/01/2021. Give Amos Ochieng Odiwour the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(166, '8e852af1313b4e4f9ef3751d17739b8c', 18, NULL, '9166477904414aaf9a3e51bc7dadf366', 'Dear Parent, The school officially opens on 01/01/2021. Give Rayan Wanjohi Mureu the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(167, '8e852af1313b4e4f9ef3751d17739b8c', 19, NULL, '0135f49a24c3441fbc6978a1bef48156', 'Dear Parent, The school officially opens on 01/01/2021. Give Johnstone Kagwanja Muiruri the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(168, '8e852af1313b4e4f9ef3751d17739b8c', 20, NULL, '93eaec80bf2b48a8b9ce098c178d4cec', 'Dear Parent, The school officially opens on 01/01/2021. Give Felistus Nyambura the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(169, '8e852af1313b4e4f9ef3751d17739b8c', 21, NULL, 'df186bef26f64016b596e35dfd45711e', 'Dear Parent, The school officially opens on 01/01/2021. Give Evans Mwaniki the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(170, '8e852af1313b4e4f9ef3751d17739b8c', 22, NULL, 'c2ff22526aa545739b8f3194fdb75ab9', 'Dear Parent, The school officially opens on 01/01/2021. Give Samwel Mureithi the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(171, '8e852af1313b4e4f9ef3751d17739b8c', 23, NULL, 'c40e2312bf7d411782fed4974092d784', 'Dear Parent, The school officially opens on 01/01/2021. Give Faith Muthoni  the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(172, '8e852af1313b4e4f9ef3751d17739b8c', 24, NULL, '4966fbbc406049d49c0dbefa7ed57752', 'Dear Parent, The school officially opens on 01/01/2021. Give Ian Jomo Kianangi  the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(173, '8e852af1313b4e4f9ef3751d17739b8c', 25, NULL, 'bf570e6d7c5f4e56a62627ad3daeec09', 'Dear Parent, The school officially opens on 01/01/2021. Give Shamira Wanjeri the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(174, '8e852af1313b4e4f9ef3751d17739b8c', 26, NULL, 'b9812fe8497d451e88377ac0f27ca75a', 'Dear Parent, The school officially opens on 01/01/2021. Give Nicole Atieno Oliech the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(175, '8e852af1313b4e4f9ef3751d17739b8c', 27, NULL, '231b9e6b63e74d97aa2934ef1b347a0b', 'Dear Parent, The school officially opens on 01/01/2021. Give Jeremiah Wandaro the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(176, '8e852af1313b4e4f9ef3751d17739b8c', 28, NULL, 'e88a403160f74736afea590504646e4a', 'Dear Parent, The school officially opens on 01/01/2021. Give Onesmus Nyanteri the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(177, '8e852af1313b4e4f9ef3751d17739b8c', 29, NULL, '386390f7719b43baac17b000829b9647', 'Dear Parent, The school officially opens on 01/01/2021. Give Jayden Nyamweya Omweri the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(178, '8e852af1313b4e4f9ef3751d17739b8c', 30, NULL, '1c301904ad05479ca1ce445b5e5a6088', 'Dear Parent, The school officially opens on 01/01/2021. Give Martha Wambui Mburu the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(179, '8e852af1313b4e4f9ef3751d17739b8c', 31, NULL, 'eeb5cd07f70442599e85a29123a099d7', 'Dear Parent, The school officially opens on 01/01/2021. Give Leah Muthoni the items required.', '0720871499', 93, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(180, '8e852af1313b4e4f9ef3751d17739b8c', 32, NULL, 'd979ee10611d48b29b06ebbc0ab3efad', 'Dear Parent, The school officially opens on 01/01/2021. Give Chantaal Nyambura the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(181, '8e852af1313b4e4f9ef3751d17739b8c', 33, NULL, '06d76d83b2af4eb0b5ecc81a0f31b059', 'Dear Parent, The school officially opens on 01/01/2021. Give Junior James Gitau the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(182, '8e852af1313b4e4f9ef3751d17739b8c', 34, NULL, 'd004416a9b2c4f9283225d04a5425e4d', 'Dear Parent, The school officially opens on 01/01/2021. Give Anastacia Wanjira Njoki the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(183, '8e852af1313b4e4f9ef3751d17739b8c', 35, NULL, '5365e422c5044e7caf2e4726b396b661', 'Dear Parent, The school officially opens on 01/01/2021. Give Elizabeth Wambui the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(184, '8e852af1313b4e4f9ef3751d17739b8c', 36, NULL, '9e3dd211fe6d48db94e56869ea0679a6', 'Dear Parent, The school officially opens on 01/01/2021. Give Delilah Wawendo Murage the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(185, '8e852af1313b4e4f9ef3751d17739b8c', 37, NULL, '1a670389184843b49ef788c3d834af96', 'Dear Parent, The school officially opens on 01/01/2021. Give Monicah Njeri Kamau the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(186, '8e852af1313b4e4f9ef3751d17739b8c', 38, NULL, 'd4ffb47c3b2b4190b8150e0547798c01', 'Dear Parent, The school officially opens on 01/01/2021. Give Rachael Kanyi the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(187, '8e852af1313b4e4f9ef3751d17739b8c', 39, NULL, '02dd8f0bad0044f0b85820d584a4dc8a', 'Dear Parent, The school officially opens on 01/01/2021. Give Kelsey Nyaboke the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(188, '8e852af1313b4e4f9ef3751d17739b8c', 40, NULL, 'fe84174bf8824c57846e4af6c4c6bb99', 'Dear Parent, The school officially opens on 01/01/2021. Give Benson Macharia Wambugu the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(189, '8e852af1313b4e4f9ef3751d17739b8c', 42, NULL, 'c4bec8c132ff402dbd4ff1f21b5b6abd', 'Dear Parent, The school officially opens on 01/01/2021. Give Peter Kamau Maina the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(190, '8e852af1313b4e4f9ef3751d17739b8c', 43, NULL, '867c7ffb728c4ff4a6cbbf029351125d', 'Dear Parent, The school officially opens on 01/01/2021. Give Caleb Muikamba the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:42:59', '2021-10-19 21:42:59'),
(191, '8e852af1313b4e4f9ef3751d17739b8c', 44, NULL, '432faa3a8f0d4866a5ad9c0a578c09c0', 'Dear Parent, The school officially opens on 01/01/2021. Give Ethan Jones Maina the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(192, '8e852af1313b4e4f9ef3751d17739b8c', 45, NULL, '4f02ca22e94d4ad3848e012a1a0069d5', 'Dear Parent, The school officially opens on 01/01/2021. Give Elaine Mwikali the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(193, '8e852af1313b4e4f9ef3751d17739b8c', 47, NULL, '786db31fc244460a8314ba483301e187', 'Dear Parent, The school officially opens on 01/01/2021. Give Liz Wangui Kamau the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(194, '8e852af1313b4e4f9ef3751d17739b8c', 48, NULL, '54244db169874d74a497488fcb112d6d', 'Dear Parent, The school officially opens on 01/01/2021. Give Martin Gacheru the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(195, '8e852af1313b4e4f9ef3751d17739b8c', 49, NULL, 'baf5107efa014b6f9d2ad589536f5a5b', 'Dear Parent, The school officially opens on 01/01/2021. Give Phoebe Wangui Nyambura the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(196, '8e852af1313b4e4f9ef3751d17739b8c', 50, NULL, '45efb739ff6046068f362ce5f02ab290', 'Dear Parent, The school officially opens on 01/01/2021. Give Allan Ndirangu Mwaura the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(197, '8e852af1313b4e4f9ef3751d17739b8c', 51, NULL, 'a936f5494c6c4dfa86b589313643b51d', 'Dear Parent, The school officially opens on 01/01/2021. Give Vincent Muteti the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(198, '8e852af1313b4e4f9ef3751d17739b8c', 52, NULL, '1bd1e8145f5b40a98f43af960a309bcd', 'Dear Parent, The school officially opens on 01/01/2021. Give Jacky Wamaitha Nyutu the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(199, '8e852af1313b4e4f9ef3751d17739b8c', 53, NULL, 'de920e9b0a994a879777999295e09e23', 'Dear Parent, The school officially opens on 01/01/2021. Give Eliana Wanjira Thuku the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(200, '8e852af1313b4e4f9ef3751d17739b8c', 54, NULL, '4f2583493815456c911a1f7019bce7c6', 'Dear Parent, The school officially opens on 01/01/2021. Give Kelvin Ngugi Kamau the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(201, '8e852af1313b4e4f9ef3751d17739b8c', 55, NULL, '1af335ed2f76475cb09ccc6fe1c09a70', 'Dear Parent, The school officially opens on 01/01/2021. Give Michael Wanjiru Gichuga the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(202, '8e852af1313b4e4f9ef3751d17739b8c', 56, NULL, 'c5cf39244b1e4ec79480bc58fd515beb', 'Dear Parent, The school officially opens on 01/01/2021. Give James Ngugi Maina the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(203, '8e852af1313b4e4f9ef3751d17739b8c', 57, NULL, '7632b9e935d746d39277f3d850a43b5d', 'Dear Parent, The school officially opens on 01/01/2021. Give Evans Kibue Kiama the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(204, '8e852af1313b4e4f9ef3751d17739b8c', 58, NULL, 'b2c3e332e2a9415faee5b1eea50d7fd9', 'Dear Parent, The school officially opens on 01/01/2021. Give Marx Maina Muteria the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(205, '8e852af1313b4e4f9ef3751d17739b8c', 59, NULL, '1a43afd078184b30b9cc222ddb388f12', 'Dear Parent, The school officially opens on 01/01/2021. Give Alex Kiriama Gitau the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(206, '8e852af1313b4e4f9ef3751d17739b8c', 60, NULL, '522b2624244a4fdf9e834d69a65a39d2', 'Dear Parent, The school officially opens on 01/01/2021. Give Milanda Anyango Onyango the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(207, '8e852af1313b4e4f9ef3751d17739b8c', 61, NULL, '1bc6f9a14edd4d17a22f4db5024db1bc', 'Dear Parent, The school officially opens on 01/01/2021. Give Stacie Wanjiku Wamucii the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(208, '8e852af1313b4e4f9ef3751d17739b8c', 62, NULL, '323b77f9d6a943c182c017cbc8a40d3c', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Kariuki Munyaka the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(209, '8e852af1313b4e4f9ef3751d17739b8c', 63, NULL, '9652da4e3414497e8e5920855db35152', 'Dear Parent, The school officially opens on 01/01/2021. Give Horace Odara Obara the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(210, '8e852af1313b4e4f9ef3751d17739b8c', 64, NULL, 'a6210cc7f6a443eeb60f3d7b2bfde4ac', 'Dear Parent, The school officially opens on 01/01/2021. Give Kilvin Mutembei the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(211, '8e852af1313b4e4f9ef3751d17739b8c', 65, NULL, '0dc66d801d014eb48b414f46950dcfb7', 'Dear Parent, The school officially opens on 01/01/2021. Give Jane Njambi Muriuki the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(212, '8e852af1313b4e4f9ef3751d17739b8c', 66, NULL, 'fc4201ebfb494fa6ae23f84a4d162c7f', 'Dear Parent, The school officially opens on 01/01/2021. Give Emmah Riziki Ashah the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(213, '8e852af1313b4e4f9ef3751d17739b8c', 67, NULL, '95bfa3fd5e25480db83a44cb57668f68', 'Dear Parent, The school officially opens on 01/01/2021. Give Washington Nyongesa Masika the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(214, '8e852af1313b4e4f9ef3751d17739b8c', 68, NULL, '4818f3d5549b4fd182f21899fe617f6e', 'Dear Parent, The school officially opens on 01/01/2021. Give Joanace Gathiga Mwaniki the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(215, '8e852af1313b4e4f9ef3751d17739b8c', 69, NULL, 'c32c0c24d421485bb87f71e918e14599', 'Dear Parent, The school officially opens on 01/01/2021. Give Jane Karinge Mande the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(216, '8e852af1313b4e4f9ef3751d17739b8c', 70, NULL, '19fbf2d493024168874d9f9b6fbdbe62', 'Dear Parent, The school officially opens on 01/01/2021. Give Claudia Wanjiku Wabera the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(217, '8e852af1313b4e4f9ef3751d17739b8c', 71, NULL, '21316c2f1232465d805cee383b8fe0a8', 'Dear Parent, The school officially opens on 01/01/2021. Give Vincent Kungu Kimathi the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(218, '8e852af1313b4e4f9ef3751d17739b8c', 72, NULL, '67afe2db9b8d41f7a71c67ecfc394f54', 'Dear Parent, The school officially opens on 01/01/2021. Give Eddie Karanja Kiogora the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(219, '8e852af1313b4e4f9ef3751d17739b8c', 73, NULL, 'f7b51f766c384e5cab2436739e20f8d1', 'Dear Parent, The school officially opens on 01/01/2021. Give Susan Naemba Wanjala the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(220, '8e852af1313b4e4f9ef3751d17739b8c', 74, NULL, '8ce49a04205c4bafaab0912e9cf7f3f0', 'Dear Parent, The school officially opens on 01/01/2021. Give Adriel Maina Macharia the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(221, '8e852af1313b4e4f9ef3751d17739b8c', 75, NULL, 'f34ad503456c49249a71f29213e6ec85', 'Dear Parent, The school officially opens on 01/01/2021. Give Quintah Wema Gitonga the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(222, '8e852af1313b4e4f9ef3751d17739b8c', 76, NULL, '816be06d801740258bc76d3912bea6b2', 'Dear Parent, The school officially opens on 01/01/2021. Give Mathias Njenga Macharia the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(223, '8e852af1313b4e4f9ef3751d17739b8c', 77, NULL, 'c3da18ce77a340ceb7e5aa2ca764732f', 'Dear Parent, The school officially opens on 01/01/2021. Give Mike Gichinga Kimani the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(224, '8e852af1313b4e4f9ef3751d17739b8c', 78, NULL, '2f626b57f6e7428d8f2357af15259c45', 'Dear Parent, The school officially opens on 01/01/2021. Give Loreen Njeri Njeru the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(225, '8e852af1313b4e4f9ef3751d17739b8c', 79, NULL, '9aef6cba9bf04189af29d5eca3baa5fa', 'Dear Parent, The school officially opens on 01/01/2021. Give Terrence Otieno the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(226, '8e852af1313b4e4f9ef3751d17739b8c', 80, NULL, '0c614db47c0b46d4a72095d0277887e3', 'Dear Parent, The school officially opens on 01/01/2021. Give Janet Pendo Mwamba the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(227, '8e852af1313b4e4f9ef3751d17739b8c', 81, NULL, 'd6f80d1b3d3b4d42b29a35de0ec2801d', 'Dear Parent, The school officially opens on 01/01/2021. Give Imani Nyanumba the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(228, '8e852af1313b4e4f9ef3751d17739b8c', 82, NULL, '0e6a487828ec433191a91f1e6ff7fd08', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Karanja the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(229, '8e852af1313b4e4f9ef3751d17739b8c', 83, NULL, 'a4bdcb7aad5644978964f537f39ae7ef', 'Dear Parent, The school officially opens on 01/01/2021. Give Ethern Mungai Githinga the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(230, '8e852af1313b4e4f9ef3751d17739b8c', 84, NULL, 'd297267622844096bd46e3ead4f17193', 'Dear Parent, The school officially opens on 01/01/2021. Give Jackson Gichuhi Muchiri the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(231, '8e852af1313b4e4f9ef3751d17739b8c', 85, NULL, 'ce4de99f35f247e3b56b00a6fe89f2d8', 'Dear Parent, The school officially opens on 01/01/2021. Give Yvette Moraa Moracha the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(232, '8e852af1313b4e4f9ef3751d17739b8c', 86, NULL, 'be05930de73040538b170b342712c5a0', 'Dear Parent, The school officially opens on 01/01/2021. Give Kyla Wanjeri the items required.', '0720871499', 93, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(233, '8e852af1313b4e4f9ef3751d17739b8c', 87, NULL, '87efd106b1284fc0bcbc8022abe7292d', 'Dear Parent, The school officially opens on 01/01/2021. Give Victoria Valery the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(234, '8e852af1313b4e4f9ef3751d17739b8c', 88, NULL, '0f374a5385bf4d7db07fefc37d31133d', 'Dear Parent, The school officially opens on 01/01/2021. Give Tanice Simintei the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(235, '8e852af1313b4e4f9ef3751d17739b8c', 89, NULL, '096b52b324a2440188c5e1466bb36fe3', 'Dear Parent, The school officially opens on 01/01/2021. Give Fiona Chepchirchir Cheruiyot the items required.', '0720871499', 109, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(236, '8e852af1313b4e4f9ef3751d17739b8c', 90, NULL, 'a5cc14450f374af7adfc36a523f50fa5', 'Dear Parent, The school officially opens on 01/01/2021. Give Terryann Cheruto the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(237, '8e852af1313b4e4f9ef3751d17739b8c', 91, NULL, 'b69faab366be42ddbe99fd980b0ad7d9', 'Dear Parent, The school officially opens on 01/01/2021. Give Robert Mbugua Wanyeki the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(238, '8e852af1313b4e4f9ef3751d17739b8c', 92, NULL, '86bd17b99df94d3c94e643ee6e4168fc', 'Dear Parent, The school officially opens on 01/01/2021. Give Viviana Njambi Njuguna the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(239, '8e852af1313b4e4f9ef3751d17739b8c', 93, NULL, 'b854f50348af4dbe8c1216ef2bbb49df', 'Dear Parent, The school officially opens on 01/01/2021. Give Maya Blessing Mwandie the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(240, '8e852af1313b4e4f9ef3751d17739b8c', 94, NULL, 'bed9265bf9204c1ab89676c2681a0212', 'Dear Parent, The school officially opens on 01/01/2021. Give Isabella Muthoni the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(241, '8e852af1313b4e4f9ef3751d17739b8c', 95, NULL, '6712baaa6d0c40ee9abb8a5ddcf2e0c9', 'Dear Parent, The school officially opens on 01/01/2021. Give Natalie Muthoni Muthomi the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(242, '8e852af1313b4e4f9ef3751d17739b8c', 96, NULL, '34d2f6c50e0d4e2993cf56a7d123083b', 'Dear Parent, The school officially opens on 01/01/2021. Give Lilian Njoki Mbiu the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(243, '8e852af1313b4e4f9ef3751d17739b8c', 97, NULL, 'fad8b1f46554450ca54e968365ca66ce', 'Dear Parent, The school officially opens on 01/01/2021. Give Immaculate Nyambura Nderitu the items required.', '0720871499', 108, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(244, '8e852af1313b4e4f9ef3751d17739b8c', 98, NULL, '1d61bdb24c894f07b403b094cf12ac22', 'Dear Parent, The school officially opens on 01/01/2021. Give Imela Waembu Karimi the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(245, '8e852af1313b4e4f9ef3751d17739b8c', 99, NULL, 'f79b44b0cdda44669f5bbcf2328dea19', 'Dear Parent, The school officially opens on 01/01/2021. Give Asher Mwalimu the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(246, '8e852af1313b4e4f9ef3751d17739b8c', 100, NULL, '7a95a459292d498a897f1dd764332d59', 'Dear Parent, The school officially opens on 01/01/2021. Give Davies Ngugi Gathogo the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(247, '8e852af1313b4e4f9ef3751d17739b8c', 101, NULL, 'e5706898f00d438ea6786717b48b1cf0', 'Dear Parent, The school officially opens on 01/01/2021. Give Tamara Wangui Nungari the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(248, '8e852af1313b4e4f9ef3751d17739b8c', 102, NULL, '52b5ef6bbdf547059feeff6b9d709e1f', 'Dear Parent, The school officially opens on 01/01/2021. Give Keslie Njoki Mwendandu the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:00', '2021-10-19 21:43:00'),
(249, '8e852af1313b4e4f9ef3751d17739b8c', 103, NULL, 'b072672718154d61ac48af40cf7d44ef', 'Dear Parent, The school officially opens on 01/01/2021. Give Oliver Wekesa Shilandura the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(250, '8e852af1313b4e4f9ef3751d17739b8c', 104, NULL, '47d5e7db75714d6b96504ba7257c9eac', 'Dear Parent, The school officially opens on 01/01/2021. Give Declan Mbecha Kuria the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(251, '8e852af1313b4e4f9ef3751d17739b8c', 105, NULL, '109df806f03548298a2096cda1228203', 'Dear Parent, The school officially opens on 01/01/2021. Give Hellen Wangui Wanjiru the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(252, '8e852af1313b4e4f9ef3751d17739b8c', 106, NULL, '70fa62c0851c4a3084032c962f81739b', 'Dear Parent, The school officially opens on 01/01/2021. Give Alice Njeri Makena the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(253, '8e852af1313b4e4f9ef3751d17739b8c', 107, NULL, '172a761b3d8f4bfba3e3b2602b12d5b0', 'Dear Parent, The school officially opens on 01/01/2021. Give Nancy Nduta Kanyiri the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(254, '8e852af1313b4e4f9ef3751d17739b8c', 108, NULL, '57b5b9da2004436895156ce65bccdd6a', 'Dear Parent, The school officially opens on 01/01/2021. Give Tracyann Wambui Mwendia the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(255, '8e852af1313b4e4f9ef3751d17739b8c', 109, NULL, 'b05a292e95c14c058632f94eae9e4aa8', 'Dear Parent, The school officially opens on 01/01/2021. Give Elius Waringa Nduta the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(256, '8e852af1313b4e4f9ef3751d17739b8c', 110, NULL, 'd422c323ea9e4bbaacbf242059ab2e3c', 'Dear Parent, The school officially opens on 01/01/2021. Give Wilberforce Simiyu the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(257, '8e852af1313b4e4f9ef3751d17739b8c', 111, NULL, '3d01217ce8ca446c881224fab62bd29c', 'Dear Parent, The school officially opens on 01/01/2021. Give Purity Agunda Ochieng the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(258, '8e852af1313b4e4f9ef3751d17739b8c', 112, NULL, '14c003f3a562447e82f00d00b4d15931', 'Dear Parent, The school officially opens on 01/01/2021. Give Kelseyann Gathoni Gacheru the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01');
INSERT INTO `message_outboxes` (`id`, `code`, `recipient_id`, `externalMessageId`, `messageId`, `message`, `phoneno`, `characters`, `sms_units`, `sms_cost`, `target`, `statusCode`, `status`, `delivered_at`, `created_at`, `updated_at`) VALUES
(259, '8e852af1313b4e4f9ef3751d17739b8c', 113, NULL, '8f4d48dfb3e44c2bb10d4e06394854cf', 'Dear Parent, The school officially opens on 01/01/2021. Give Innocent Simiyu Wanjala the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(260, '8e852af1313b4e4f9ef3751d17739b8c', 114, NULL, 'ec32053dcfb348f8b5091028a0c61c3a', 'Dear Parent, The school officially opens on 01/01/2021. Give Verena Waturi Mburu the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(261, '8e852af1313b4e4f9ef3751d17739b8c', 115, NULL, 'a0266870ed5a4599a14301f0c034798e', 'Dear Parent, The school officially opens on 01/01/2021. Give Shirleen Gathoni the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(262, '8e852af1313b4e4f9ef3751d17739b8c', 116, NULL, '25997d2bc8e34468816a41650b4ab796', 'Dear Parent, The school officially opens on 01/01/2021. Give Natania Wanjiku the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(263, '8e852af1313b4e4f9ef3751d17739b8c', 117, NULL, 'd56ad9087d464da9967990abf08a47f4', 'Dear Parent, The school officially opens on 01/01/2021. Give Allan Macharia Munyaka the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(264, '8e852af1313b4e4f9ef3751d17739b8c', 118, NULL, '6cf43e6af2e044139a01e4f07c1f9633', 'Dear Parent, The school officially opens on 01/01/2021. Give Melanie Wamuyu Wanyoike the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(265, '8e852af1313b4e4f9ef3751d17739b8c', 119, NULL, 'e4baeea508a84a7ba7c25c9974b01967', 'Dear Parent, The school officially opens on 01/01/2021. Give Vivian Wangui Nduati the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(266, '8e852af1313b4e4f9ef3751d17739b8c', 120, NULL, 'b6caac3cd3d74c21bed532b1ad72fc82', 'Dear Parent, The school officially opens on 01/01/2021. Give Fabius Wanderi Nderu the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(267, '8e852af1313b4e4f9ef3751d17739b8c', 121, NULL, 'd634ce12796d45d691908b418aa6db68', 'Dear Parent, The school officially opens on 01/01/2021. Give Daniel Muturi Chomba the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(268, '8e852af1313b4e4f9ef3751d17739b8c', 122, NULL, '3b567660f4c1485fb76221a9f619943a', 'Dear Parent, The school officially opens on 01/01/2021. Give Nyce Waithera the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(269, '8e852af1313b4e4f9ef3751d17739b8c', 123, NULL, '5b8073cc3b4b49e48910e15d3594e814', 'Dear Parent, The school officially opens on 01/01/2021. Give David Kimiti Mateu the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(270, '8e852af1313b4e4f9ef3751d17739b8c', 124, NULL, '87a7da41766b4dab901ab6ba63a26ac4', 'Dear Parent, The school officially opens on 01/01/2021. Give Celine Wairimu Chege the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(271, '8e852af1313b4e4f9ef3751d17739b8c', 125, NULL, 'ce091ee6076a494d98daf0b8f7892907', 'Dear Parent, The school officially opens on 01/01/2021. Give Esther Achieng Oluoch the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(272, '8e852af1313b4e4f9ef3751d17739b8c', 126, NULL, 'b8e59a4862714e94b1b159de638b5165', 'Dear Parent, The school officially opens on 01/01/2021. Give Andrew Karanu Njoroge the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(273, '8e852af1313b4e4f9ef3751d17739b8c', 127, NULL, 'ec77cac41e024fc8b141b3e40f414245', 'Dear Parent, The school officially opens on 01/01/2021. Give Edrian Karanja Mbugua the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(274, '8e852af1313b4e4f9ef3751d17739b8c', 128, NULL, '38471a8869cd4267932604c0d6f8b132', 'Dear Parent, The school officially opens on 01/01/2021. Give Clement Njoroge Kamau the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(275, '8e852af1313b4e4f9ef3751d17739b8c', 129, NULL, '4dd6bcedf71a48bcbf382307dd7fbb98', 'Dear Parent, The school officially opens on 01/01/2021. Give Jayson Kiarie Manyeki the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(276, '8e852af1313b4e4f9ef3751d17739b8c', 130, NULL, 'f508bcdf9c1041a2bacc8553a4fc0a1a', 'Dear Parent, The school officially opens on 01/01/2021. Give Caleb Moses the items required.', '0720871499', 92, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(277, '8e852af1313b4e4f9ef3751d17739b8c', 131, NULL, '5aa4ef3403154974ae7d817b1a3bafe4', 'Dear Parent, The school officially opens on 01/01/2021. Give Siobhan Sibwoga the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(278, '8e852af1313b4e4f9ef3751d17739b8c', 132, NULL, '56b80c3f5f3348ebb27a7f0b8cde3c55', 'Dear Parent, The school officially opens on 01/01/2021. Give Tasha Baraka Wangeci the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(279, '8e852af1313b4e4f9ef3751d17739b8c', 133, NULL, '97a3df01923f4727ac64f1a25d965f64', 'Dear Parent, The school officially opens on 01/01/2021. Give Rebecca Kendi Muraya the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(280, '8e852af1313b4e4f9ef3751d17739b8c', 134, NULL, '05c1bf1190c34823b724f0569d519a0f', 'Dear Parent, The school officially opens on 01/01/2021. Give Taraji Wanjiru Kimemia the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(281, '8e852af1313b4e4f9ef3751d17739b8c', 135, NULL, 'f7850443756c42479c5f004e5e45cf9a', 'Dear Parent, The school officially opens on 01/01/2021. Give Roy Mungai Muigai the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(282, '8e852af1313b4e4f9ef3751d17739b8c', 136, NULL, '76c0b098e2c2403892f60a6429267bd6', 'Dear Parent, The school officially opens on 01/01/2021. Give Zenita Wangui Blessings the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(283, '8e852af1313b4e4f9ef3751d17739b8c', 137, NULL, 'e9b92c96087448468dab7f41b30d52c0', 'Dear Parent, The school officially opens on 01/01/2021. Give John Njagi Mwaura the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(284, '8e852af1313b4e4f9ef3751d17739b8c', 138, NULL, '3907a9929d5f414e9bc5be56d70fdfe6', 'Dear Parent, The school officially opens on 01/01/2021. Give Alicia Mwitemania Kariuki the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(285, '8e852af1313b4e4f9ef3751d17739b8c', 140, NULL, 'fbd217aec3134ea3800ac7cbc4311218', 'Dear Parent, The school officially opens on 01/01/2021. Give Abraham Nyutu Kimani the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(286, '8e852af1313b4e4f9ef3751d17739b8c', 142, NULL, '42d04e7f3da04ce8bad9d2c184d985fc', 'Dear Parent, The school officially opens on 01/01/2021. Give Linah Warembo the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(287, '8e852af1313b4e4f9ef3751d17739b8c', 143, NULL, '34ab525d170b47ad9ef76127ad700801', 'Dear Parent, The school officially opens on 01/01/2021. Give Luciano Thuo Wanjohi the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(288, '8e852af1313b4e4f9ef3751d17739b8c', 144, NULL, 'b9d2861657f449559424f489279fc65e', 'Dear Parent, The school officially opens on 01/01/2021. Give Veronicah Wamucii Munini the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(289, '8e852af1313b4e4f9ef3751d17739b8c', 145, NULL, '46d421da76db4895b654f438adf9ecdb', 'Dear Parent, The school officially opens on 01/01/2021. Give Mitchell Waceke Nduati the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(290, '8e852af1313b4e4f9ef3751d17739b8c', 146, NULL, '41ac72714f884749b92bcf003b94b719', 'Dear Parent, The school officially opens on 01/01/2021. Give Elijah Githua Njoroge the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(291, '8e852af1313b4e4f9ef3751d17739b8c', 147, NULL, '256cdd430b574f0f913bd4faede2119c', 'Dear Parent, The school officially opens on 01/01/2021. Give Joe Kagai the items required.', '0720871499', 90, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(292, '8e852af1313b4e4f9ef3751d17739b8c', 148, NULL, 'f2f9cc16369e48dd9b804365f20ae507', 'Dear Parent, The school officially opens on 01/01/2021. Give Tamilla Noni Njenga the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(293, '8e852af1313b4e4f9ef3751d17739b8c', 149, NULL, 'c31f15869a514626a036ea3b5e99f0e4', 'Dear Parent, The school officially opens on 01/01/2021. Give Simeone Mutua Kilonzo the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(294, '8e852af1313b4e4f9ef3751d17739b8c', 150, NULL, 'a87db6403c7a4164bf03de96528d7387', 'Dear Parent, The school officially opens on 01/01/2021. Give Fabian Muchene Murugami the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(295, '8e852af1313b4e4f9ef3751d17739b8c', 151, NULL, '666cce4f30204235901f59bb36a5b470', 'Dear Parent, The school officially opens on 01/01/2021. Give Annice Waithira Kungu the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(296, '8e852af1313b4e4f9ef3751d17739b8c', 152, NULL, 'a15c3e7172ee4278ac68eae120550be4', 'Dear Parent, The school officially opens on 01/01/2021. Give Jacinta Wahito Kahura the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(297, '8e852af1313b4e4f9ef3751d17739b8c', 153, NULL, 'b0d52007bc8549c28a858d7a474c4fbd', 'Dear Parent, The school officially opens on 01/01/2021. Give Cherly Wambui Gitagia the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(298, '8e852af1313b4e4f9ef3751d17739b8c', 154, NULL, '745b99242ef34e80b686a8aeb1e31f22', 'Dear Parent, The school officially opens on 01/01/2021. Give Shadrack Odhiambo Odiwour the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(299, '8e852af1313b4e4f9ef3751d17739b8c', 155, NULL, '2252b3ce0f9346fd9414fc2037b8737b', 'Dear Parent, The school officially opens on 01/01/2021. Give Precious Waithera Muteria the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(300, '8e852af1313b4e4f9ef3751d17739b8c', 156, NULL, 'ba9953bf44304cba90cfa427d7c2fb9b', 'Dear Parent, The school officially opens on 01/01/2021. Give Meshack Kiarie Njuguna the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-19 21:43:01', '2021-10-19 21:43:01'),
(301, '32ed68b4dc034ec7b865652485d9a791', 43, NULL, 'ff640fa5fe934e55bb4d55d7622d03e1', 'Hello Parent, Kindly clear Caleb Muikamba fees balance of 26000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0192', '0720871499', 193, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(302, '32ed68b4dc034ec7b865652485d9a791', 49, NULL, 'cd0e446722344bec94e061fdb5e4747d', 'Hello Parent, Kindly clear Phoebe Wangui Nyambura fees balance of 30000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0211', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(303, '32ed68b4dc034ec7b865652485d9a791', 50, NULL, '45cfb63371af4dc2bf35eee5233d9493', 'Hello Parent, Kindly clear Allan Ndirangu Mwaura fees balance of 32500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0214', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(304, '32ed68b4dc034ec7b865652485d9a791', 52, NULL, '25fc662cd9fb439cb150b97061745fe0', 'Hello Parent, Kindly clear Jacky Wamaitha Nyutu fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0218', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(305, '32ed68b4dc034ec7b865652485d9a791', 53, NULL, '6c2bec59ac3a42139b44f06a023d179a', 'Hello Parent, Kindly clear Eliana Wanjira Thuku fees balance of 51000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0219', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(306, '32ed68b4dc034ec7b865652485d9a791', 54, NULL, '1a8cae7e57304da495a64573a84c9379', 'Hello Parent, Kindly clear Kelvin Ngugi Kamau fees balance of 78700 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0222', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(307, '32ed68b4dc034ec7b865652485d9a791', 55, NULL, '4fa3d107a63847d08bdf1dc7db9d4b9b', 'Hello Parent, Kindly clear Michael Wanjiru Gichuga fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0223', '0720871499', 202, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(308, '32ed68b4dc034ec7b865652485d9a791', 56, NULL, '4ab399190e554246857048fa95e810a6', 'Hello Parent, Kindly clear James Ngugi Maina fees balance of 35000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0224', '0720871499', 196, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(309, '32ed68b4dc034ec7b865652485d9a791', 58, NULL, '6f4a228c879f49268a2e24191e9287a5', 'Hello Parent, Kindly clear Marx Maina Muteria fees balance of 31500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0228', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(310, '32ed68b4dc034ec7b865652485d9a791', 60, NULL, 'f4f730b639b24ff4b0b62fb7d5d2fb6a', 'Hello Parent, Kindly clear Milanda Anyango Onyango fees balance of 39000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0234', '0720871499', 202, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(311, '32ed68b4dc034ec7b865652485d9a791', 61, NULL, '9e04aab0a12945b78bd0559cd5ec331a', 'Hello Parent, Kindly clear Stacie Wanjiku Wamucii fees balance of 47400 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0235', '0720871499', 201, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(312, '32ed68b4dc034ec7b865652485d9a791', 62, NULL, 'cfbb8f99d1f84274a9655e92e22fe0db', 'Hello Parent, Kindly clear Moses Kariuki Munyaka fees balance of 32000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0236', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(313, '32ed68b4dc034ec7b865652485d9a791', 65, NULL, '808153c0039b4bcf95fd80b17842fd60', 'Hello Parent, Kindly clear Jane Njambi Muriuki fees balance of 41000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0239', '0720871499', 198, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(314, '32ed68b4dc034ec7b865652485d9a791', 66, NULL, 'cbfc61b2fefa4a14a30d023bc7957f66', 'Hello Parent, Kindly clear Emmah Riziki Ashah fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0241', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(315, '32ed68b4dc034ec7b865652485d9a791', 69, NULL, 'ed04e90ecd5a4ae3a486ac0f22b5cb7e', 'Hello Parent, Kindly clear Jane Karinge Mande fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0244', '0720871499', 197, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(316, '32ed68b4dc034ec7b865652485d9a791', 71, NULL, '7b3abe53484d4f4e936bbbb43bc963a7', 'Hello Parent, Kindly clear Vincent Kungu Kimathi fees balance of 26000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0246', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(317, '32ed68b4dc034ec7b865652485d9a791', 74, NULL, '4c1b7655e45745b6a76659acb3ceac8d', 'Hello Parent, Kindly clear Adriel Maina Macharia fees balance of 25500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0250', '0720871499', 200, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(318, '32ed68b4dc034ec7b865652485d9a791', 133, NULL, 'ea593e05f9844a188ca5f45eff30c16f', 'Hello Parent, Kindly clear Rebecca Kendi Muraya fees balance of 33000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0332', '0720871499', 199, 2, 1.60, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-10-21 11:59:28', '2021-10-21 11:59:28'),
(319, '0b1d4e2e78cc43aa825fa2bd55ae00f2', 1, NULL, 'c721216f4c92458daee3591825bfaae6', 'Dear Parent, The school officially opens on 01/01/2021. Give Jane Njeri Mwaniki the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 07:47:09', '2021-11-08 07:47:09'),
(320, '0b1d4e2e78cc43aa825fa2bd55ae00f2', 2, NULL, '9da9c399544b41508d1a626fe0c48c34', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Mwangi Njamba the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 07:47:09', '2021-11-08 07:47:09'),
(321, '0b1d4e2e78cc43aa825fa2bd55ae00f2', 3, NULL, 'b0fd874da4df4b89a818b0e9e57f6952', 'Dear Parent, The school officially opens on 01/01/2021. Give Jack Otieno Ogendo the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 07:47:09', '2021-11-08 07:47:09'),
(322, 'fcb1acd1c56c49209958990cb985e02c', 1, NULL, '5f892fa1f818441d802258e15da12219', 'Dear Moses Maina Njogu , Kindly note, we will hold our termly meeting this coming Saturday starting at 9am. Keep time!', '0714730671', 118, 1, 0.80, 'staff', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:08:09', '2021-11-08 08:08:09'),
(323, 'fcb1acd1c56c49209958990cb985e02c', 2, NULL, '4340f4dbedc74c0ebdc83f12dbc7a125', 'Dear Jane Mwende Mutiso , Kindly note, we will hold our termly meeting this coming Saturday starting at 9am. Keep time!', '0720871499', 119, 1, 0.80, 'staff', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:08:09', '2021-11-08 08:08:09'),
(324, 'a05501e123fc439199742b1bfa968e9f', 2, NULL, '4aa666450b0d474f8e7ffd9850f4a983', 'Dear Transport, The school officially opens on 01/01/2021. Give Moses Mwangi Njamba the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(325, 'a05501e123fc439199742b1bfa968e9f', 32, NULL, '3c82a83cba724ab8ae2dc484d074cced', 'Dear Transport, The school officially opens on 01/01/2021. Give Chantaal Nyambura the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(326, 'a05501e123fc439199742b1bfa968e9f', 92, NULL, '32df5c480b6f4664bfb85306e05f52cc', 'Dear Transport, The school officially opens on 01/01/2021. Give Viviana Njambi Njuguna the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(327, 'a05501e123fc439199742b1bfa968e9f', 130, NULL, '889ee8dd66db411baed5ee18067ee219', 'Dear Transport, The school officially opens on 01/01/2021. Give Caleb Moses the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(328, 'a05501e123fc439199742b1bfa968e9f', 13, NULL, 'eb92503aaafd4ea9b9f440c2d3f67c6c', 'Dear Transport, The school officially opens on 01/01/2021. Give Justus Munene Kirangi the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(329, 'a05501e123fc439199742b1bfa968e9f', 18, NULL, '01a64da53110472a837e6b4811e94c41', 'Dear Transport, The school officially opens on 01/01/2021. Give Rayan Wanjohi Mureu the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(330, 'a05501e123fc439199742b1bfa968e9f', 19, NULL, '58e6a2a23fbb4eb0b56853e56d04cd13', 'Dear Transport, The school officially opens on 01/01/2021. Give Johnstone Kagwanja Muiruri the items required.', '0720871499', 110, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(331, 'a05501e123fc439199742b1bfa968e9f', 20, NULL, '8ca5eebb759943c2b0c1ec26fa447371', 'Dear Transport, The school officially opens on 01/01/2021. Give Felistus Nyambura the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(332, 'a05501e123fc439199742b1bfa968e9f', 21, NULL, 'edf2d40bb439450f8108efa16b8b41ba', 'Dear Transport, The school officially opens on 01/01/2021. Give Evans Mwaniki the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(333, 'a05501e123fc439199742b1bfa968e9f', 22, NULL, '45b309620e7f4cb19157ccd3edc8d493', 'Dear Transport, The school officially opens on 01/01/2021. Give Samwel Mureithi the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(334, 'a05501e123fc439199742b1bfa968e9f', 23, NULL, '162a13daf8784aa9876270d4dad18262', 'Dear Transport, The school officially opens on 01/01/2021. Give Faith Muthoni  the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(335, 'a05501e123fc439199742b1bfa968e9f', 30, NULL, '6cc9932c380f4bd4a8936c4715d5951d', 'Dear Transport, The school officially opens on 01/01/2021. Give Martha Wambui Mburu the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(336, 'a05501e123fc439199742b1bfa968e9f', 33, NULL, '9e618253da1e482c82a0e47722760913', 'Dear Transport, The school officially opens on 01/01/2021. Give Junior James Gitau the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(337, 'a05501e123fc439199742b1bfa968e9f', 135, NULL, 'e85524fc58f441bab1b2512617f48ab3', 'Dear Transport, The school officially opens on 01/01/2021. Give Roy Mungai Muigai the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(338, 'a05501e123fc439199742b1bfa968e9f', 24, NULL, '0018d0fcd1fa46818c1babe516c33488', 'Dear Transport, The school officially opens on 01/01/2021. Give Ian Jomo Kianangi  the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(339, 'a05501e123fc439199742b1bfa968e9f', 25, NULL, '3f3ff0d5d7664de983e9f9f60f1c2a5a', 'Dear Transport, The school officially opens on 01/01/2021. Give Shamira Wanjeri the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(340, 'a05501e123fc439199742b1bfa968e9f', 27, NULL, 'c03dee4a71324ebd89eaf861482cc1cb', 'Dear Transport, The school officially opens on 01/01/2021. Give Jeremiah Wandaro the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(341, 'a05501e123fc439199742b1bfa968e9f', 28, NULL, 'bcaf02b71b354bf587c5711aede48433', 'Dear Transport, The school officially opens on 01/01/2021. Give Onesmus Nyanteri the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(342, 'a05501e123fc439199742b1bfa968e9f', 29, NULL, 'db65028718f945219ed4958c99fc8da9', 'Dear Transport, The school officially opens on 01/01/2021. Give Jayden Nyamweya Omweri the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(343, 'a05501e123fc439199742b1bfa968e9f', 31, NULL, '81add50c750d4f77929624af31e820a1', 'Dear Transport, The school officially opens on 01/01/2021. Give Leah Muthoni the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(344, 'a05501e123fc439199742b1bfa968e9f', 36, NULL, 'c09eb9846c7544f1afbf385b271e05dc', 'Dear Transport, The school officially opens on 01/01/2021. Give Delilah Wawendo Murage the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(345, 'a05501e123fc439199742b1bfa968e9f', 37, NULL, '802df83f01ba43978d7967360f6246df', 'Dear Transport, The school officially opens on 01/01/2021. Give Monicah Njeri Kamau the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(346, 'a05501e123fc439199742b1bfa968e9f', 77, NULL, 'b8103116d8ba479da2544a799adefec8', 'Dear Transport, The school officially opens on 01/01/2021. Give Mike Gichinga Kimani the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(347, 'a05501e123fc439199742b1bfa968e9f', 80, NULL, '8aca5d8dd61747bfbde5c506243f87a4', 'Dear Transport, The school officially opens on 01/01/2021. Give Janet Pendo Mwamba the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(348, 'a05501e123fc439199742b1bfa968e9f', 85, NULL, '75d516bae4ba4cdc91ad0eb35b02ea8d', 'Dear Transport, The school officially opens on 01/01/2021. Give Yvette Moraa Moracha the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(349, 'a05501e123fc439199742b1bfa968e9f', 96, NULL, 'a1ea364dee544996b7c94f2934d038eb', 'Dear Transport, The school officially opens on 01/01/2021. Give Lilian Njoki Mbiu the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(350, 'a05501e123fc439199742b1bfa968e9f', 115, NULL, 'ba44991f5cf74083bc7a6bc915b4348d', 'Dear Transport, The school officially opens on 01/01/2021. Give Shirleen Gathoni the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(351, 'a05501e123fc439199742b1bfa968e9f', 120, NULL, '5a5c88589e394a5e8c781e9ae65c9fb1', 'Dear Transport, The school officially opens on 01/01/2021. Give Fabius Wanderi Nderu the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(352, 'a05501e123fc439199742b1bfa968e9f', 132, NULL, '4e3f799491ad4090addc197d6d717b42', 'Dear Transport, The school officially opens on 01/01/2021. Give Tasha Baraka Wangeci the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:27', '2021-11-08 08:27:27'),
(353, 'a05501e123fc439199742b1bfa968e9f', 154, NULL, '7f0d8fe8a4d84c0b9200e849cc609026', 'Dear Transport, The school officially opens on 01/01/2021. Give Shadrack Odhiambo Odiwour the items required.', '0720871499', 109, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(354, 'a05501e123fc439199742b1bfa968e9f', 39, NULL, '7746b79098244a4bb9dbb118c9e89487', 'Dear Transport, The school officially opens on 01/01/2021. Give Kelsey Nyaboke the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(355, 'a05501e123fc439199742b1bfa968e9f', 40, NULL, 'dcb654a693b346079e1596ab2aebcd08', 'Dear Transport, The school officially opens on 01/01/2021. Give Benson Macharia Wambugu the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(356, 'a05501e123fc439199742b1bfa968e9f', 42, NULL, '35be7f5e152e44119ef09b11ac94ed85', 'Dear Transport, The school officially opens on 01/01/2021. Give Peter Kamau Maina the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(357, 'a05501e123fc439199742b1bfa968e9f', 44, NULL, '306f2bbed178447bb02a87d038008048', 'Dear Transport, The school officially opens on 01/01/2021. Give Ethan Jones Maina the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(358, 'a05501e123fc439199742b1bfa968e9f', 45, NULL, 'fd578bd37309489894924fd79cb97bb3', 'Dear Transport, The school officially opens on 01/01/2021. Give Elaine Mwikali the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(359, 'a05501e123fc439199742b1bfa968e9f', 48, NULL, 'dd9b729f34684496bcaec1db0302abbb', 'Dear Transport, The school officially opens on 01/01/2021. Give Martin Gacheru the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(360, 'a05501e123fc439199742b1bfa968e9f', 88, NULL, '5f08fd870142450ab25a2280541573cc', 'Dear Transport, The school officially opens on 01/01/2021. Give Tanice Simintei the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(361, 'a05501e123fc439199742b1bfa968e9f', 89, NULL, 'a705295453264363870ded636d0858f8', 'Dear Transport, The school officially opens on 01/01/2021. Give Fiona Chepchirchir Cheruiyot the items required.', '0720871499', 112, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(362, 'a05501e123fc439199742b1bfa968e9f', 90, NULL, 'd1a858c210084641adc40fd896b18af8', 'Dear Transport, The school officially opens on 01/01/2021. Give Terryann Cheruto the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(363, 'a05501e123fc439199742b1bfa968e9f', 98, NULL, '899b019b21fd4b16b3b2e13c9bd6cc9f', 'Dear Transport, The school officially opens on 01/01/2021. Give Imela Waembu Karimi the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(364, 'a05501e123fc439199742b1bfa968e9f', 49, NULL, 'b15538fc08004204ad0ef2d7cce8e237', 'Dear Transport, The school officially opens on 01/01/2021. Give Phoebe Wangui Nyambura the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(365, 'a05501e123fc439199742b1bfa968e9f', 50, NULL, 'edcf384c4a314c04afaad23f9f585e7d', 'Dear Transport, The school officially opens on 01/01/2021. Give Allan Ndirangu Mwaura the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(366, 'a05501e123fc439199742b1bfa968e9f', 52, NULL, 'f2499235ab1f445dbcd83f8f4b4b8d16', 'Dear Transport, The school officially opens on 01/01/2021. Give Jacky Wamaitha Nyutu the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(367, 'a05501e123fc439199742b1bfa968e9f', 53, NULL, '21f869000c2148c7b66aae650f90f603', 'Dear Transport, The school officially opens on 01/01/2021. Give Eliana Wanjira Thuku the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(368, 'a05501e123fc439199742b1bfa968e9f', 55, NULL, '0cc03963a0af4cb2b0732d1ed6aba5e7', 'Dear Transport, The school officially opens on 01/01/2021. Give Michael Wanjiru Gichuga the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(369, 'a05501e123fc439199742b1bfa968e9f', 56, NULL, 'd79c73e6bb2842cca09417326ee354f7', 'Dear Transport, The school officially opens on 01/01/2021. Give James Ngugi Maina the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(370, 'a05501e123fc439199742b1bfa968e9f', 58, NULL, '3d4a25d659584e82b8a86f3389357b1d', 'Dear Transport, The school officially opens on 01/01/2021. Give Marx Maina Muteria the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(371, 'a05501e123fc439199742b1bfa968e9f', 62, NULL, '2c23ac595b174e5ea4c5255d622a53cb', 'Dear Transport, The school officially opens on 01/01/2021. Give Moses Kariuki Munyaka the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(372, 'a05501e123fc439199742b1bfa968e9f', 66, NULL, '7818b35627dc4c7daf76cfaea0d1205a', 'Dear Transport, The school officially opens on 01/01/2021. Give Emmah Riziki Ashah the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(373, 'a05501e123fc439199742b1bfa968e9f', 69, NULL, 'e09a9aa136fb4ba0a67e2559e9438977', 'Dear Transport, The school officially opens on 01/01/2021. Give Jane Karinge Mande the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(374, 'a05501e123fc439199742b1bfa968e9f', 133, NULL, 'e554d4c62627495ea4b9943366c1aad5', 'Dear Transport, The school officially opens on 01/01/2021. Give Rebecca Kendi Muraya the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(375, 'a05501e123fc439199742b1bfa968e9f', 64, NULL, 'e68c22bf51a844b5846d3376a6a3cb85', 'Dear Transport, The school officially opens on 01/01/2021. Give Kilvin Mutembei the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(376, 'a05501e123fc439199742b1bfa968e9f', 65, NULL, '87a0d2b129d34821823241412e3fc699', 'Dear Transport, The school officially opens on 01/01/2021. Give Jane Njambi Muriuki the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(377, 'a05501e123fc439199742b1bfa968e9f', 67, NULL, '6e1afc4bf383469c96994366a89605a4', 'Dear Transport, The school officially opens on 01/01/2021. Give Washington Nyongesa Masika the items required.', '0720871499', 110, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:28', '2021-11-08 08:27:28'),
(378, 'a05501e123fc439199742b1bfa968e9f', 68, NULL, '51cb7f593ded42d682b8faa217ae60f2', 'Dear Transport, The school officially opens on 01/01/2021. Give Joanace Gathiga Mwaniki the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(379, 'a05501e123fc439199742b1bfa968e9f', 70, NULL, 'fbfc5c75953649b39cb99cbd05913fef', 'Dear Transport, The school officially opens on 01/01/2021. Give Claudia Wanjiku Wabera the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(380, 'a05501e123fc439199742b1bfa968e9f', 72, NULL, '993260336c96405099835c36cee24b58', 'Dear Transport, The school officially opens on 01/01/2021. Give Eddie Karanja Kiogora the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(381, 'a05501e123fc439199742b1bfa968e9f', 73, NULL, 'e4543a249cd041978bd03319ba78fdd0', 'Dear Transport, The school officially opens on 01/01/2021. Give Susan Naemba Wanjala the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(382, 'a05501e123fc439199742b1bfa968e9f', 74, NULL, '35bda9119a3548e8984c237bc9aaaac0', 'Dear Transport, The school officially opens on 01/01/2021. Give Adriel Maina Macharia the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(383, 'a05501e123fc439199742b1bfa968e9f', 75, NULL, '7fac6283851e4027af16c43da3b33de3', 'Dear Transport, The school officially opens on 01/01/2021. Give Quintah Wema Gitonga the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(384, 'a05501e123fc439199742b1bfa968e9f', 76, NULL, 'eafb2c56067c499485721d9f5b4edff8', 'Dear Transport, The school officially opens on 01/01/2021. Give Mathias Njenga Macharia the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(385, 'a05501e123fc439199742b1bfa968e9f', 82, NULL, '504fdcd3172847c0aa52c5ed61cbba42', 'Dear Transport, The school officially opens on 01/01/2021. Give Moses Karanja the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(386, 'a05501e123fc439199742b1bfa968e9f', 83, NULL, '342c200316ca4375a452f81c75d6ebd6', 'Dear Transport, The school officially opens on 01/01/2021. Give Ethern Mungai Githinga the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(387, 'a05501e123fc439199742b1bfa968e9f', 86, NULL, 'de9a0de1cb8c494aaa96fb64ad208d18', 'Dear Transport, The school officially opens on 01/01/2021. Give Kyla Wanjeri the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(388, 'a05501e123fc439199742b1bfa968e9f', 87, NULL, 'd87993cdc494416585d5354d0060785b', 'Dear Transport, The school officially opens on 01/01/2021. Give Victoria Valery the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(389, 'a05501e123fc439199742b1bfa968e9f', 102, NULL, '04c1b6fb033846408a225a8b27e48b04', 'Dear Transport, The school officially opens on 01/01/2021. Give Keslie Njoki Mwendandu the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(390, 'a05501e123fc439199742b1bfa968e9f', 103, NULL, '80873e68b15a4c9bb1d677ee19db8715', 'Dear Transport, The school officially opens on 01/01/2021. Give Oliver Wekesa Shilandura the items required.', '0720871499', 108, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(391, 'a05501e123fc439199742b1bfa968e9f', 104, NULL, 'f30bca7d88d64473b09d0914e46c6dd0', 'Dear Transport, The school officially opens on 01/01/2021. Give Declan Mbecha Kuria the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(392, 'a05501e123fc439199742b1bfa968e9f', 107, NULL, '776a5564ebd14482946139e6b4ef9d87', 'Dear Transport, The school officially opens on 01/01/2021. Give Nancy Nduta Kanyiri the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(393, 'a05501e123fc439199742b1bfa968e9f', 114, NULL, '9e50545073f74f14973ae8ed566028a2', 'Dear Transport, The school officially opens on 01/01/2021. Give Verena Waturi Mburu the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(394, 'a05501e123fc439199742b1bfa968e9f', 123, NULL, 'a0cd10a88ecb426899129a2ff492de69', 'Dear Transport, The school officially opens on 01/01/2021. Give David Kimiti Mateu the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(395, 'a05501e123fc439199742b1bfa968e9f', 152, NULL, '3475bac5bcfa41b5ac23f2d676784642', 'Dear Transport, The school officially opens on 01/01/2021. Give Jacinta Wahito Kahura the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(396, 'a05501e123fc439199742b1bfa968e9f', 91, NULL, '5b9332ae84154b22ba089047eac53a04', 'Dear Transport, The school officially opens on 01/01/2021. Give Robert Mbugua Wanyeki the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(397, 'a05501e123fc439199742b1bfa968e9f', 93, NULL, 'b4b76e8ee2fa411085628b81190b446a', 'Dear Transport, The school officially opens on 01/01/2021. Give Maya Blessing Mwandie the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(398, 'a05501e123fc439199742b1bfa968e9f', 94, NULL, '143d8cbfde7a4c5b989f255299302fad', 'Dear Transport, The school officially opens on 01/01/2021. Give Isabella Muthoni the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(399, 'a05501e123fc439199742b1bfa968e9f', 95, NULL, '535a07a044b94be6ae2c16b76df3ab5e', 'Dear Transport, The school officially opens on 01/01/2021. Give Natalie Muthoni Muthomi the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(400, 'a05501e123fc439199742b1bfa968e9f', 99, NULL, '3087c2f25d224fbfb7260d0d60d2cf97', 'Dear Transport, The school officially opens on 01/01/2021. Give Asher Mwalimu the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(401, 'a05501e123fc439199742b1bfa968e9f', 108, NULL, 'b9b29e4f89dd4bfb9ef4b24a221a021e', 'Dear Transport, The school officially opens on 01/01/2021. Give Tracyann Wambui Mwendia the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(402, 'a05501e123fc439199742b1bfa968e9f', 116, NULL, '550db5d118d645f383c247f20da29267', 'Dear Transport, The school officially opens on 01/01/2021. Give Natania Wanjiku the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29');
INSERT INTO `message_outboxes` (`id`, `code`, `recipient_id`, `externalMessageId`, `messageId`, `message`, `phoneno`, `characters`, `sms_units`, `sms_cost`, `target`, `statusCode`, `status`, `delivered_at`, `created_at`, `updated_at`) VALUES
(403, 'a05501e123fc439199742b1bfa968e9f', 121, NULL, 'b179681b78004b93b664db413aebab46', 'Dear Transport, The school officially opens on 01/01/2021. Give Daniel Muturi Chomba the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(404, 'a05501e123fc439199742b1bfa968e9f', 122, NULL, 'a5ee26bec0ed461f9a764dc7dedaa6b1', 'Dear Transport, The school officially opens on 01/01/2021. Give Nyce Waithera the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(405, 'a05501e123fc439199742b1bfa968e9f', 124, NULL, 'd6b3b9ba61a54821be519d1832557376', 'Dear Transport, The school officially opens on 01/01/2021. Give Celine Wairimu Chege the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(406, 'a05501e123fc439199742b1bfa968e9f', 125, NULL, '3365dea887754b1c850882c46f2b25f1', 'Dear Transport, The school officially opens on 01/01/2021. Give Esther Achieng Oluoch the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(407, 'a05501e123fc439199742b1bfa968e9f', 126, NULL, '620aa80f6626477ca70ecf5caba5181f', 'Dear Transport, The school officially opens on 01/01/2021. Give Andrew Karanu Njoroge the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(408, 'a05501e123fc439199742b1bfa968e9f', 127, NULL, 'ec3e4854da49402eaac1f5fe0b51ad51', 'Dear Transport, The school officially opens on 01/01/2021. Give Edrian Karanja Mbugua the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(409, 'a05501e123fc439199742b1bfa968e9f', 131, NULL, 'a048e5e0a9d14630b06d9c7cbc2afdd9', 'Dear Transport, The school officially opens on 01/01/2021. Give Siobhan Sibwoga the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(410, 'a05501e123fc439199742b1bfa968e9f', 134, NULL, '1d9f2eaab500469da5857c8cdb7c936d', 'Dear Transport, The school officially opens on 01/01/2021. Give Taraji Wanjiru Kimemia the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(411, 'a05501e123fc439199742b1bfa968e9f', 136, NULL, '0cc41b92315b4890a76dd6419d14b3b9', 'Dear Transport, The school officially opens on 01/01/2021. Give Zenita Wangui Blessings the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(412, 'a05501e123fc439199742b1bfa968e9f', 145, NULL, '4c045d379a9c45ce9f513cea3e8c6a98', 'Dear Transport, The school officially opens on 01/01/2021. Give Mitchell Waceke Nduati the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(413, 'a05501e123fc439199742b1bfa968e9f', 149, NULL, '8dc32e196ff7432fbf18102527283490', 'Dear Transport, The school officially opens on 01/01/2021. Give Simeone Mutua Kilonzo the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(414, 'a05501e123fc439199742b1bfa968e9f', 150, NULL, '978762f183e1424d94c1413883d45ba4', 'Dear Transport, The school officially opens on 01/01/2021. Give Fabian Muchene Murugami the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(415, 'a05501e123fc439199742b1bfa968e9f', 151, NULL, 'b52d862bb37a4d228f17869c9a3ab331', 'Dear Transport, The school officially opens on 01/01/2021. Give Annice Waithira Kungu the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(416, 'a05501e123fc439199742b1bfa968e9f', 153, NULL, '21d5d11f1f7c421c8ede7883305fd4ed', 'Dear Transport, The school officially opens on 01/01/2021. Give Cherly Wambui Gitagia the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(417, 'a05501e123fc439199742b1bfa968e9f', 155, NULL, '1580e170e55544a7b1871d708e49860e', 'Dear Transport, The school officially opens on 01/01/2021. Give Precious Waithera Muteria the items required.', '0720871499', 109, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(418, 'a05501e123fc439199742b1bfa968e9f', 156, NULL, '9296362ccc8948d59e19af7b4a82f2f8', 'Dear Transport, The school officially opens on 01/01/2021. Give Meshack Kiarie Njuguna the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:29', '2021-11-08 08:27:29'),
(419, 'a05501e123fc439199742b1bfa968e9f', 14, NULL, '2480c7d72fcf483795dcc3ca8da639d9', 'Dear Transport, The school officially opens on 01/01/2021. Give Benjamin Wanjala Shiundu the items required.', '0720871499', 108, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:30', '2021-11-08 08:27:30'),
(420, 'a05501e123fc439199742b1bfa968e9f', 15, NULL, '70094a4350cc4023a792a45a2f30a6e4', 'Dear Transport, The school officially opens on 01/01/2021. Give Janelle Agutu Ontomwa the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:27:30', '2021-11-08 08:27:30'),
(421, '0498dc0cc2c64aff91b282de58282e03', 2, NULL, 'b0a28f33ff744ce9bd9b9dd156df89fd', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:23', '2021-11-08 08:49:23'),
(422, '0498dc0cc2c64aff91b282de58282e03', 32, NULL, '6eb97c13b8764957a7060cb7582e6351', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(423, '0498dc0cc2c64aff91b282de58282e03', 92, NULL, '06737955db03404f9c1f329d8813868b', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(424, '0498dc0cc2c64aff91b282de58282e03', 130, NULL, '58ab7be0e7934a169383d434eca31308', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(425, '0498dc0cc2c64aff91b282de58282e03', 13, NULL, 'ef39f27ccea146b0936d077587d8f48a', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(426, '0498dc0cc2c64aff91b282de58282e03', 18, NULL, '9b52bad8a56240c4a6e4bd77bef7f403', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(427, '0498dc0cc2c64aff91b282de58282e03', 19, NULL, '87cbbb228baf478d912522477369a7c1', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(428, '0498dc0cc2c64aff91b282de58282e03', 20, NULL, 'a1e720367a25495fa2cf8bfdb0a0c9ff', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(429, '0498dc0cc2c64aff91b282de58282e03', 21, NULL, 'eaed001f05af46379397f4cfd17e0fd2', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(430, '0498dc0cc2c64aff91b282de58282e03', 22, NULL, '918795c09a144f64a1d8473b08846003', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(431, '0498dc0cc2c64aff91b282de58282e03', 23, NULL, '69115a3d44e04c38aa7180c8db5ae08f', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(432, '0498dc0cc2c64aff91b282de58282e03', 30, NULL, 'ccd2bdeb535c4b72aaa4dbdff6a07533', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(433, '0498dc0cc2c64aff91b282de58282e03', 33, NULL, '85e0f3fd5afa404fa6a4d5da17bd017b', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(434, '0498dc0cc2c64aff91b282de58282e03', 135, NULL, '3257b611ae22466dac3030b76d895815', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(435, '0498dc0cc2c64aff91b282de58282e03', 24, NULL, '8cf459afe9f0485489b64de52e7396b5', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(436, '0498dc0cc2c64aff91b282de58282e03', 25, NULL, '2b0fc336cc9c410190f60e1801da8d41', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(437, '0498dc0cc2c64aff91b282de58282e03', 27, NULL, '6a1aed5fc54e4acba8405ca159a3e8c0', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(438, '0498dc0cc2c64aff91b282de58282e03', 28, NULL, '8f5451566b2b47c5abc4d18c72801572', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(439, '0498dc0cc2c64aff91b282de58282e03', 29, NULL, 'd821f838e4bc45a3a3fc7379dbe6e83e', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(440, '0498dc0cc2c64aff91b282de58282e03', 31, NULL, '358b22a9bf774ca6986720629c1492fc', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(441, '0498dc0cc2c64aff91b282de58282e03', 36, NULL, '691bb212c698496da1778265f801c5ac', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(442, '0498dc0cc2c64aff91b282de58282e03', 37, NULL, 'c5dddb9dda7641dfbfa5302ed94904c4', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(443, '0498dc0cc2c64aff91b282de58282e03', 77, NULL, 'c17ef90020a54665863fbfad95d0d81c', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(444, '0498dc0cc2c64aff91b282de58282e03', 80, NULL, '8850831402884e308c4dcdda13dad6c9', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(445, '0498dc0cc2c64aff91b282de58282e03', 85, NULL, 'c6fd4d9d4ff84bba8d73dc66edaaccca', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(446, '0498dc0cc2c64aff91b282de58282e03', 96, NULL, 'fc5c1ad46b85447aaa221ee5d0488bf6', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(447, '0498dc0cc2c64aff91b282de58282e03', 115, NULL, '4b8f4382dcf340cc9c68509e9b89873e', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(448, '0498dc0cc2c64aff91b282de58282e03', 120, NULL, '90b1c2a0c5454dbeb25c34d8129f6b6d', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(449, '0498dc0cc2c64aff91b282de58282e03', 132, NULL, '666febd3f51844b8ab2884fa6875b561', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(450, '0498dc0cc2c64aff91b282de58282e03', 154, NULL, 'dd489fee1041476bac975717a0c66d74', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(451, '0498dc0cc2c64aff91b282de58282e03', 39, NULL, '163ccd54a59e4f91ad1b68e57000ff46', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(452, '0498dc0cc2c64aff91b282de58282e03', 40, NULL, 'b9673126fc324e82bb82720ccdf43cc8', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(453, '0498dc0cc2c64aff91b282de58282e03', 42, NULL, '8249f18c04c74a79bef4c597d45e3565', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(454, '0498dc0cc2c64aff91b282de58282e03', 44, NULL, '347e77fa85d743a6b6161e7225630538', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(455, '0498dc0cc2c64aff91b282de58282e03', 45, NULL, '8e83bb7c1e3a4c3996e6c8a196f22ff7', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(456, '0498dc0cc2c64aff91b282de58282e03', 48, NULL, 'c7bde8559f244e938b0edd63c5ee10c5', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(457, '0498dc0cc2c64aff91b282de58282e03', 88, NULL, '89848085dc5c4382a1dfcd802efe9de1', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(458, '0498dc0cc2c64aff91b282de58282e03', 89, NULL, '310f969834c94dedb2a5913f46e89032', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(459, '0498dc0cc2c64aff91b282de58282e03', 90, NULL, 'fca2a468dee94453b11f98d212b9edc2', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(460, '0498dc0cc2c64aff91b282de58282e03', 98, NULL, 'd4692bc11fa34813b9e06fe0bf2c59a5', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(461, '0498dc0cc2c64aff91b282de58282e03', 49, NULL, '273f779839c84684a42251adfcbccbff', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(462, '0498dc0cc2c64aff91b282de58282e03', 50, NULL, '8af51cfbb21747ca80cd14e945f7c998', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(463, '0498dc0cc2c64aff91b282de58282e03', 52, NULL, '26d1fc55a22d49f58be50b7a0ed80b6b', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(464, '0498dc0cc2c64aff91b282de58282e03', 53, NULL, '892e5f57f81c41a0b75d4386cf61c5ba', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:24', '2021-11-08 08:49:24'),
(465, '0498dc0cc2c64aff91b282de58282e03', 55, NULL, '1e7238ff3e9c464e805f5d8a17f4d874', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(466, '0498dc0cc2c64aff91b282de58282e03', 56, NULL, '8e032a91c1b54d0ca91891aa24bbd929', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(467, '0498dc0cc2c64aff91b282de58282e03', 58, NULL, '59f9659ac68c4ab88448d6588c8c5aff', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(468, '0498dc0cc2c64aff91b282de58282e03', 62, NULL, '003068abf4fd4ce780011e0ff430db50', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(469, '0498dc0cc2c64aff91b282de58282e03', 66, NULL, '7eb3cfe6738744eba80d8258aca742f5', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(470, '0498dc0cc2c64aff91b282de58282e03', 69, NULL, 'f75c0156d37c49c1b9a541cba31e586c', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(471, '0498dc0cc2c64aff91b282de58282e03', 133, NULL, 'c5ae4202676d4c1183e8d642bcf50592', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(472, '0498dc0cc2c64aff91b282de58282e03', 64, NULL, '128bd6b900fd4bdca05926e070283bdb', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(473, '0498dc0cc2c64aff91b282de58282e03', 65, NULL, '306c7f3dfb0346c18d5058f0beca6014', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(474, '0498dc0cc2c64aff91b282de58282e03', 67, NULL, '8c896957b79e4671b313fc556c682355', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(475, '0498dc0cc2c64aff91b282de58282e03', 68, NULL, '43830a3d20034a4faa11828f7891fc99', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(476, '0498dc0cc2c64aff91b282de58282e03', 70, NULL, '4b402a1cb865466aa955a6f7811f17c2', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(477, '0498dc0cc2c64aff91b282de58282e03', 72, NULL, '49ce9b7c9898497ea30e1a484983a1f6', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(478, '0498dc0cc2c64aff91b282de58282e03', 73, NULL, '5fb414c60d534fccabd38c2f472ec82c', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(479, '0498dc0cc2c64aff91b282de58282e03', 74, NULL, 'a8cdad0289e14933a58f9f48019cd546', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(480, '0498dc0cc2c64aff91b282de58282e03', 75, NULL, '28fa57dda3fa42c5830552d3c545eae1', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(481, '0498dc0cc2c64aff91b282de58282e03', 76, NULL, 'de126e43162e487a98352a7d9139c268', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(482, '0498dc0cc2c64aff91b282de58282e03', 82, NULL, '551f6e52eeb144b8ad26b9d4d45d0213', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(483, '0498dc0cc2c64aff91b282de58282e03', 83, NULL, 'a6f35b3052004433989d10b795a1bb0c', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(484, '0498dc0cc2c64aff91b282de58282e03', 86, NULL, '75ff13987f0843cd9f92fe7172ff8178', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(485, '0498dc0cc2c64aff91b282de58282e03', 87, NULL, 'a13f7b51a2d24b10b473c11f8daa4752', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(486, '0498dc0cc2c64aff91b282de58282e03', 102, NULL, 'bb875c97543549f19411e258b04fb0e7', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(487, '0498dc0cc2c64aff91b282de58282e03', 103, NULL, '62a976a9dbd140e193443c6439cf898d', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(488, '0498dc0cc2c64aff91b282de58282e03', 104, NULL, 'fd446ed381ed4bfd926f57d7ae8aaacc', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(489, '0498dc0cc2c64aff91b282de58282e03', 107, NULL, 'a315c118e32f423493916cd6f8adb5fa', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(490, '0498dc0cc2c64aff91b282de58282e03', 114, NULL, 'de38b7e40cc74e34888ddb2f4975a810', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(491, '0498dc0cc2c64aff91b282de58282e03', 123, NULL, '78ca6b23af294cffb985e36c3a47ebd5', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(492, '0498dc0cc2c64aff91b282de58282e03', 152, NULL, '11b88cddd0714881afb10a3ba35b4cc7', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(493, '0498dc0cc2c64aff91b282de58282e03', 91, NULL, '06fa90500c29420fb13ccd8f75bf02ef', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(494, '0498dc0cc2c64aff91b282de58282e03', 93, NULL, '967868c156664be180a8dc6bc1de1276', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(495, '0498dc0cc2c64aff91b282de58282e03', 94, NULL, '4cd9d7440b9f4bcfbeedb62670a940cd', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(496, '0498dc0cc2c64aff91b282de58282e03', 95, NULL, '82b31619899a4a48909e35c8355b8504', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(497, '0498dc0cc2c64aff91b282de58282e03', 99, NULL, '7ac612055adf49d480c4b3ba02580580', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(498, '0498dc0cc2c64aff91b282de58282e03', 108, NULL, 'dc4193f3ad074c09a39f71404b3acd3a', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(499, '0498dc0cc2c64aff91b282de58282e03', 116, NULL, '8974070ea9f9459f8f0d7af7f4fa195b', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(500, '0498dc0cc2c64aff91b282de58282e03', 121, NULL, '2e93f63479ea4120bf8bb19f2fcf1f1c', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(501, '0498dc0cc2c64aff91b282de58282e03', 122, NULL, 'f4a62ecfffad4990b9dd0f80022588e0', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(502, '0498dc0cc2c64aff91b282de58282e03', 124, NULL, '996ee1f152cb4d6e946dba5a283f568c', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(503, '0498dc0cc2c64aff91b282de58282e03', 125, NULL, '193702403d6749c7aae5211d94b3d30b', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:25', '2021-11-08 08:49:25'),
(504, '0498dc0cc2c64aff91b282de58282e03', 126, NULL, '823628f44a27433cb81910aa8c53c45a', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(505, '0498dc0cc2c64aff91b282de58282e03', 127, NULL, '8af297e14cbb4fd2ba51095e71a59984', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(506, '0498dc0cc2c64aff91b282de58282e03', 131, NULL, '221b06475bd34d09b709c5333ddd30fc', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(507, '0498dc0cc2c64aff91b282de58282e03', 134, NULL, '68c9ad694d634bc890477b5598eb37f5', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(508, '0498dc0cc2c64aff91b282de58282e03', 136, NULL, 'c52088f22e7840169c2e2bf8c483dd73', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(509, '0498dc0cc2c64aff91b282de58282e03', 145, NULL, 'ca32e22131f647259099d63a4c4ff1b8', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(510, '0498dc0cc2c64aff91b282de58282e03', 149, NULL, '389f7664f16241bf98252f63f78658b9', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(511, '0498dc0cc2c64aff91b282de58282e03', 150, NULL, '9bddd679c49f481db58235e5b80dea61', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(512, '0498dc0cc2c64aff91b282de58282e03', 151, NULL, '5df56b52ee5d40d3a3d3631789656874', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(513, '0498dc0cc2c64aff91b282de58282e03', 153, NULL, '84814eb2d5374a3bbcabb8c4ade2cde2', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(514, '0498dc0cc2c64aff91b282de58282e03', 155, NULL, 'ca7608875c334bd0a904d6a4961f1c05', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(515, '0498dc0cc2c64aff91b282de58282e03', 156, NULL, '6757063d3edd4410b703a3e77feeac99', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(516, '0498dc0cc2c64aff91b282de58282e03', 14, NULL, '4535b9b8419c44779aeb734ee56fdfa2', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(517, '0498dc0cc2c64aff91b282de58282e03', 15, NULL, 'f461deb346174dd6bbf939bcab413cfb', 'Transport will be late today', '0720871499', 28, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-08 08:49:26', '2021-11-08 08:49:26'),
(518, '1fe040bb8ddb4ec7baaaf7906eaa7df9', 1, NULL, 'efe657f0dab744cfb105c785eb8b3bb4', 'Good Morning, Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/12/2021. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0010', '0720871499', 142, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-09 17:15:15', '2021-11-09 17:15:15'),
(519, '1fe040bb8ddb4ec7baaaf7906eaa7df9', 3, NULL, '0c367f9a3f584dabb1251dd8789b17e2', 'Good Morning, Parent, Kindly clear Jack Otieno Ogendo fees balance of 45000 by 01/12/2021. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0022', '0720871499', 142, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-09 17:15:15', '2021-11-09 17:15:15'),
(520, '1fe040bb8ddb4ec7baaaf7906eaa7df9', 4, NULL, '771bf1f6a2be4311a2e263d3906c10b5', 'Good Morning, Parent, Kindly clear Salome Mwende Mutiso fees balance of 71500 by 01/12/2021. You can pay via PAYBILL NO: 4018467 ACC NO: SSK0026', '0720871499', 144, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-09 17:15:15', '2021-11-09 17:15:15'),
(521, '7981d09088144f1788aadba7a5d73c6a', 1, NULL, 'f82c193029c942778fde90cce58df8cd', 'Hello Parent, The school officially opens on 01/01/2022. Give Jane Njeri Mwaniki the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, 'DeliveredToTerminal', '2021-11-09 13:59:08', '2021-11-09 18:18:12', '2021-11-09 18:18:12'),
(522, '7981d09088144f1788aadba7a5d73c6a', 2, NULL, '1c966e1e60cd4decb57a519d9857e2ce', 'Hello Parent, The school officially opens on 01/01/2022. Give Moses Mwangi Njamba the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, 'UserNameBlacklisted', '2021-11-09 13:59:08', '2021-11-09 18:18:12', '2021-11-09 18:18:12'),
(523, '7981d09088144f1788aadba7a5d73c6a', 27, NULL, 'bda1d5cff0954174af0565dee28acff0', 'Hello Parent, The school officially opens on 01/01/2022. Give Jeremiah Wandaro the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, '2021-11-09 13:59:08', '2021-11-09 18:18:12', '2021-11-09 18:18:12'),
(524, '19dc2c268480420e9a2fdbc53a68198a', 1, NULL, '57c9e76ef1664c06b0c1a62b3b42c320', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 196, 2, 1.60, 'students', NULL, NULL, NULL, '2021-11-15 13:47:15', NULL),
(525, '19dc2c268480420e9a2fdbc53a68198a', 159, NULL, '98ac30123f2a4d589377f11ca3a6d7d0', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0713962189', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2021-11-15 13:47:15', NULL),
(526, '19dc2c268480420e9a2fdbc53a68198a', 159, NULL, 'a1c4a2de18d94ee189c26f52921e7fb0', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0713962189', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2021-11-15 13:47:15', NULL),
(527, '19dc2c268480420e9a2fdbc53a68198a', 155, NULL, 'baa0c38ad80c4b8ca9cd69ccea2d8052', 'Dear Parent, Kindly clear Precious Waithera Muteria fees balance of 31000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0155', '0714730671', 203, 2, 1.60, 'students', NULL, NULL, NULL, '2021-11-15 13:47:15', NULL),
(528, '730b0606555c48dcb9333d3683d6027c', 159, NULL, '944ee03e8454468289e2416b82b604dd', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0713962189', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2021-11-15 13:49:23', NULL),
(529, '730b0606555c48dcb9333d3683d6027c', 159, NULL, '7f7ca3ade14c45818c014a5d69f4cff3', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0713962189', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2021-11-15 13:49:23', NULL),
(530, 'c107efa065e54554954deb6c662ee191', 2, NULL, '11a55297b1e64c7ab5065d9c668b404c', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Mwangi Njamba the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(531, 'c107efa065e54554954deb6c662ee191', 13, NULL, 'a2145bade39748b28dc32070c4b4ec53', 'Dear Parent, The school officially opens on 01/01/2021. Give Justus Munene Kirangi the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(532, 'c107efa065e54554954deb6c662ee191', 18, NULL, 'c0dd34d798b84caa8b91d4e70c24b228', 'Dear Parent, The school officially opens on 01/01/2021. Give Rayan Wanjohi Mureu the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(533, 'c107efa065e54554954deb6c662ee191', 19, NULL, '5533aab0de6d460688ef52c251124ffc', 'Dear Parent, The school officially opens on 01/01/2021. Give Johnstone Kagwanja Muiruri the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(534, 'c107efa065e54554954deb6c662ee191', 20, NULL, 'f8f8965dcfce4501a43472cf1a61c9f3', 'Dear Parent, The school officially opens on 01/01/2021. Give Felistus Nyambura the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(535, 'c107efa065e54554954deb6c662ee191', 21, NULL, '1a8ec43203a947098aceb0fe34e0c113', 'Dear Parent, The school officially opens on 01/01/2021. Give Evans Mwaniki the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(536, 'c107efa065e54554954deb6c662ee191', 22, NULL, '401960f3cea64552aa2d7a6b89a7e652', 'Dear Parent, The school officially opens on 01/01/2021. Give Samwel Mureithi the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(537, 'c107efa065e54554954deb6c662ee191', 23, NULL, '7798ab4b55514a9d9fb95682954d6735', 'Dear Parent, The school officially opens on 01/01/2021. Give Faith Muthoni  the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(538, 'c107efa065e54554954deb6c662ee191', 24, NULL, 'fadd01b1d99e4572aa4fb15fcb95554b', 'Dear Parent, The school officially opens on 01/01/2021. Give Ian Jomo Kianangi  the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(539, 'c107efa065e54554954deb6c662ee191', 25, NULL, '4972ca896c974cb683260b6a7352d608', 'Dear Parent, The school officially opens on 01/01/2021. Give Shamira Wanjeri the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(540, 'c107efa065e54554954deb6c662ee191', 27, NULL, '545121d4697f4b8f93f9c21bb69fd200', 'Dear Parent, The school officially opens on 01/01/2021. Give Jeremiah Wandaro the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(541, 'c107efa065e54554954deb6c662ee191', 28, NULL, '937c14e7a825475f97ab457380e27c9b', 'Dear Parent, The school officially opens on 01/01/2021. Give Onesmus Nyanteri the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(542, 'c107efa065e54554954deb6c662ee191', 29, NULL, '22d04c7c54da4e50a2dacfac1d5077fd', 'Dear Parent, The school officially opens on 01/01/2021. Give Jayden Nyamweya Omweri the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(543, 'c107efa065e54554954deb6c662ee191', 30, NULL, 'd458770d25be4f3e86377bf0f2ca2d25', 'Dear Parent, The school officially opens on 01/01/2021. Give Martha Wambui Mburu the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(544, 'c107efa065e54554954deb6c662ee191', 31, NULL, 'ec9116eaf09547a7931c08ea10c87fa2', 'Dear Parent, The school officially opens on 01/01/2021. Give Leah Muthoni the items required.', '0720871499', 93, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(545, 'c107efa065e54554954deb6c662ee191', 32, NULL, 'a8e021d3e86c4b67990e4af855b2f8cc', 'Dear Parent, The school officially opens on 01/01/2021. Give Chantaal Nyambura the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(546, 'c107efa065e54554954deb6c662ee191', 33, NULL, '37bf8888384441f3a5348f7e46b0e5bc', 'Dear Parent, The school officially opens on 01/01/2021. Give Junior James Gitau the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(547, 'c107efa065e54554954deb6c662ee191', 36, NULL, 'd7e70b1b6b654772854226571946d8fd', 'Dear Parent, The school officially opens on 01/01/2021. Give Delilah Wawendo Murage the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(548, 'c107efa065e54554954deb6c662ee191', 37, NULL, '3bfa54c6344841eda890df629470eb0a', 'Dear Parent, The school officially opens on 01/01/2021. Give Monicah Njeri Kamau the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:14', NULL),
(549, 'c107efa065e54554954deb6c662ee191', 39, NULL, '80a51795c979469a82b2c0730326258f', 'Dear Parent, The school officially opens on 01/01/2021. Give Kelsey Nyaboke the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(550, 'c107efa065e54554954deb6c662ee191', 40, NULL, '059815189c23445aa3467850f0e6ed70', 'Dear Parent, The school officially opens on 01/01/2021. Give Benson Macharia Wambugu the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(551, 'c107efa065e54554954deb6c662ee191', 42, NULL, '9a8bc09a715c463c913d45b80d76b6e2', 'Dear Parent, The school officially opens on 01/01/2021. Give Peter Kamau Maina the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(552, 'c107efa065e54554954deb6c662ee191', 44, NULL, 'b84341bd052b4df3857e3ba520162d9d', 'Dear Parent, The school officially opens on 01/01/2021. Give Ethan Jones Maina the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(553, 'c107efa065e54554954deb6c662ee191', 45, NULL, '74698c493f624df987486bd0a634c16b', 'Dear Parent, The school officially opens on 01/01/2021. Give Elaine Mwikali the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(554, 'c107efa065e54554954deb6c662ee191', 48, NULL, 'f2deda6a90c44352a2752e1b663faec6', 'Dear Parent, The school officially opens on 01/01/2021. Give Martin Gacheru the items required.', '0720871499', 95, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(555, 'c107efa065e54554954deb6c662ee191', 49, NULL, '617b9da65c26441ba9d6c19473119eac', 'Dear Parent, The school officially opens on 01/01/2021. Give Phoebe Wangui Nyambura the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(556, 'c107efa065e54554954deb6c662ee191', 50, NULL, '1abe22c6b5c14bd0a166b45193feecce', 'Dear Parent, The school officially opens on 01/01/2021. Give Allan Ndirangu Mwaura the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(557, 'c107efa065e54554954deb6c662ee191', 52, NULL, '56a39b9b191a4f81a2b3ebb36b387c35', 'Dear Parent, The school officially opens on 01/01/2021. Give Jacky Wamaitha Nyutu the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(558, 'c107efa065e54554954deb6c662ee191', 53, NULL, '1c808d78296d47d0b43e3346247ff1bc', 'Dear Parent, The school officially opens on 01/01/2021. Give Eliana Wanjira Thuku the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(559, 'c107efa065e54554954deb6c662ee191', 55, NULL, '6b67c68d4da54843a3b2cd88971be44c', 'Dear Parent, The school officially opens on 01/01/2021. Give Michael Wanjiru Gichuga the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(560, 'c107efa065e54554954deb6c662ee191', 56, NULL, '973f415028ca4d0abf360fe0a0c80fcb', 'Dear Parent, The school officially opens on 01/01/2021. Give James Ngugi Maina the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(561, 'c107efa065e54554954deb6c662ee191', 58, NULL, '39c7abc7fcb645109fddf1eba30d6963', 'Dear Parent, The school officially opens on 01/01/2021. Give Marx Maina Muteria the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(562, 'c107efa065e54554954deb6c662ee191', 62, NULL, '72dff0e7d5354a6388b2cb3a500ea4f2', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Kariuki Munyaka the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(563, 'c107efa065e54554954deb6c662ee191', 64, NULL, 'c84ce5f734f948c28142223d6d59609c', 'Dear Parent, The school officially opens on 01/01/2021. Give Kilvin Mutembei the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(564, 'c107efa065e54554954deb6c662ee191', 65, NULL, 'e7750593399f4211bfb700c74282eba2', 'Dear Parent, The school officially opens on 01/01/2021. Give Jane Njambi Muriuki the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(565, 'c107efa065e54554954deb6c662ee191', 66, NULL, '8e7971f75cdd48c4b72dfca3bd21d754', 'Dear Parent, The school officially opens on 01/01/2021. Give Emmah Riziki Ashah the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(566, 'c107efa065e54554954deb6c662ee191', 67, NULL, 'c014ebe995a54efeb9ceb4082d4845e5', 'Dear Parent, The school officially opens on 01/01/2021. Give Washington Nyongesa Masika the items required.', '0720871499', 107, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(567, 'c107efa065e54554954deb6c662ee191', 68, NULL, '43ef1d1f2bbf4068a9ecd9af0960a51f', 'Dear Parent, The school officially opens on 01/01/2021. Give Joanace Gathiga Mwaniki the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(568, 'c107efa065e54554954deb6c662ee191', 69, NULL, 'd6751cd104bf4b40b8d98550be1153dc', 'Dear Parent, The school officially opens on 01/01/2021. Give Jane Karinge Mande the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(569, 'c107efa065e54554954deb6c662ee191', 70, NULL, '46960024697f4ad3968be92c84c4f096', 'Dear Parent, The school officially opens on 01/01/2021. Give Claudia Wanjiku Wabera the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(570, 'c107efa065e54554954deb6c662ee191', 72, NULL, 'f40d5a677521489d9a39580caa8a49e8', 'Dear Parent, The school officially opens on 01/01/2021. Give Eddie Karanja Kiogora the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(571, 'c107efa065e54554954deb6c662ee191', 73, NULL, 'ab523ebbb55b4f9ab8f3b3c799f5be20', 'Dear Parent, The school officially opens on 01/01/2021. Give Susan Naemba Wanjala the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(572, 'c107efa065e54554954deb6c662ee191', 74, NULL, '43b521841ab74027a225554ff510aa7a', 'Dear Parent, The school officially opens on 01/01/2021. Give Adriel Maina Macharia the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(573, 'c107efa065e54554954deb6c662ee191', 75, NULL, '885d3552738d4d7db64f943f9de5e681', 'Dear Parent, The school officially opens on 01/01/2021. Give Quintah Wema Gitonga the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(574, 'c107efa065e54554954deb6c662ee191', 76, NULL, 'c54c4704bc5e4a5bb91358d0593fa306', 'Dear Parent, The school officially opens on 01/01/2021. Give Mathias Njenga Macharia the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(575, 'c107efa065e54554954deb6c662ee191', 77, NULL, '2235f1756b5340a1b90e3897f15002c0', 'Dear Parent, The school officially opens on 01/01/2021. Give Mike Gichinga Kimani the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(576, 'c107efa065e54554954deb6c662ee191', 80, NULL, '05d76cb619a44dcf91460f638add73b4', 'Dear Parent, The school officially opens on 01/01/2021. Give Janet Pendo Mwamba the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(577, 'c107efa065e54554954deb6c662ee191', 82, NULL, '53a60b423317436f9c84b67230eac9c4', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Karanja the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(578, 'c107efa065e54554954deb6c662ee191', 83, NULL, '29f90dc8a3e641d785c3753b9825a95e', 'Dear Parent, The school officially opens on 01/01/2021. Give Ethern Mungai Githinga the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(579, 'c107efa065e54554954deb6c662ee191', 85, NULL, 'd3022bcf26114636a730163229e3ab71', 'Dear Parent, The school officially opens on 01/01/2021. Give Yvette Moraa Moracha the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(580, 'c107efa065e54554954deb6c662ee191', 86, NULL, 'c4aac5d44d0949d79f484286cdc564b1', 'Dear Parent, The school officially opens on 01/01/2021. Give Kyla Wanjeri the items required.', '0720871499', 93, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(581, 'c107efa065e54554954deb6c662ee191', 87, NULL, 'e4fb8bbf98b24c139232e618ee567c78', 'Dear Parent, The school officially opens on 01/01/2021. Give Victoria Valery the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL);
INSERT INTO `message_outboxes` (`id`, `code`, `recipient_id`, `externalMessageId`, `messageId`, `message`, `phoneno`, `characters`, `sms_units`, `sms_cost`, `target`, `statusCode`, `status`, `delivered_at`, `created_at`, `updated_at`) VALUES
(582, 'c107efa065e54554954deb6c662ee191', 88, NULL, '2639a7c76e7a4c7db7f9ff0303628290', 'Dear Parent, The school officially opens on 01/01/2021. Give Tanice Simintei the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(583, 'c107efa065e54554954deb6c662ee191', 89, NULL, 'f6697950963e472892117fc1f163b170', 'Dear Parent, The school officially opens on 01/01/2021. Give Fiona Chepchirchir Cheruiyot the items required.', '0720871499', 109, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(584, 'c107efa065e54554954deb6c662ee191', 90, NULL, 'ced81344028d48a8ab0583c9b5de9c51', 'Dear Parent, The school officially opens on 01/01/2021. Give Terryann Cheruto the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(585, 'c107efa065e54554954deb6c662ee191', 91, NULL, '3f45edee72094ddda638ad79cc2ad322', 'Dear Parent, The school officially opens on 01/01/2021. Give Robert Mbugua Wanyeki the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(586, 'c107efa065e54554954deb6c662ee191', 92, NULL, '901414474b75461c877ea4c36faca605', 'Dear Parent, The school officially opens on 01/01/2021. Give Viviana Njambi Njuguna the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(587, 'c107efa065e54554954deb6c662ee191', 93, NULL, 'a39a23d529924f8689534e1b72511a22', 'Dear Parent, The school officially opens on 01/01/2021. Give Maya Blessing Mwandie the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(588, 'c107efa065e54554954deb6c662ee191', 94, NULL, '4b6f2f70eaaf45faaf7d1832b4268cfe', 'Dear Parent, The school officially opens on 01/01/2021. Give Isabella Muthoni the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(589, 'c107efa065e54554954deb6c662ee191', 95, NULL, 'ab3b1a14b8524cc19b9d3f4fc808a1cd', 'Dear Parent, The school officially opens on 01/01/2021. Give Natalie Muthoni Muthomi the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(590, 'c107efa065e54554954deb6c662ee191', 96, NULL, '635c8a4f9a554d1b9c57e0209d4b7750', 'Dear Parent, The school officially opens on 01/01/2021. Give Lilian Njoki Mbiu the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(591, 'c107efa065e54554954deb6c662ee191', 98, NULL, '0b1645fcbcdd4921b423380873e86be6', 'Dear Parent, The school officially opens on 01/01/2021. Give Imela Waembu Karimi the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(592, 'c107efa065e54554954deb6c662ee191', 99, NULL, '185d2a79814144c6a8aee732a3f6b585', 'Dear Parent, The school officially opens on 01/01/2021. Give Asher Mwalimu the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(593, 'c107efa065e54554954deb6c662ee191', 102, NULL, '0e091a541e204b3c86212e0b09e40b2d', 'Dear Parent, The school officially opens on 01/01/2021. Give Keslie Njoki Mwendandu the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(594, 'c107efa065e54554954deb6c662ee191', 103, NULL, 'd66fdff99f3a481ba3f0cfb299836c21', 'Dear Parent, The school officially opens on 01/01/2021. Give Oliver Wekesa Shilandura the items required.', '0720871499', 105, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:15', NULL),
(595, 'c107efa065e54554954deb6c662ee191', 104, NULL, '0d64b900f1af4707afbc4d5511ef09f3', 'Dear Parent, The school officially opens on 01/01/2021. Give Declan Mbecha Kuria the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(596, 'c107efa065e54554954deb6c662ee191', 107, NULL, '52e887ae74e6462f92c0411c1db93e06', 'Dear Parent, The school officially opens on 01/01/2021. Give Nancy Nduta Kanyiri the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(597, 'c107efa065e54554954deb6c662ee191', 108, NULL, '24ec1d790b4841cca68503caafbcc409', 'Dear Parent, The school officially opens on 01/01/2021. Give Tracyann Wambui Mwendia the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(598, 'c107efa065e54554954deb6c662ee191', 114, NULL, '19e479f39b4d48a78db94ee85fc62d3c', 'Dear Parent, The school officially opens on 01/01/2021. Give Verena Waturi Mburu the items required.', '0720871499', 100, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(599, 'c107efa065e54554954deb6c662ee191', 115, NULL, '741e13132806447c9d06824b8d087842', 'Dear Parent, The school officially opens on 01/01/2021. Give Shirleen Gathoni the items required.', '0720871499', 97, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(600, 'c107efa065e54554954deb6c662ee191', 116, NULL, '93b532a84b384044a27b7ff7e2db4511', 'Dear Parent, The school officially opens on 01/01/2021. Give Natania Wanjiku the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(601, 'c107efa065e54554954deb6c662ee191', 120, NULL, '99b20853bef0413e802e940f64ca8ca2', 'Dear Parent, The school officially opens on 01/01/2021. Give Fabius Wanderi Nderu the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(602, 'c107efa065e54554954deb6c662ee191', 121, NULL, 'ac2d4487a6a64d05bbcb8bfe7a4af42d', 'Dear Parent, The school officially opens on 01/01/2021. Give Daniel Muturi Chomba the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(603, 'c107efa065e54554954deb6c662ee191', 122, NULL, '33038433e40a40afb520d8ecf570a7bb', 'Dear Parent, The school officially opens on 01/01/2021. Give Nyce Waithera the items required.', '0720871499', 94, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(604, 'c107efa065e54554954deb6c662ee191', 123, NULL, '094ab64562d64727a716ecdad215b4e8', 'Dear Parent, The school officially opens on 01/01/2021. Give David Kimiti Mateu the items required.', '0720871499', 99, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(605, 'c107efa065e54554954deb6c662ee191', 124, NULL, 'b7f1417004be4f4abbc152c3b90a6824', 'Dear Parent, The school officially opens on 01/01/2021. Give Celine Wairimu Chege the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(606, 'c107efa065e54554954deb6c662ee191', 125, NULL, '927b323602834f2586c40a83640944cb', 'Dear Parent, The school officially opens on 01/01/2021. Give Esther Achieng Oluoch the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(607, 'c107efa065e54554954deb6c662ee191', 126, NULL, 'cbf7d0705410495e98a13dd3d38b73dd', 'Dear Parent, The school officially opens on 01/01/2021. Give Andrew Karanu Njoroge the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(608, 'c107efa065e54554954deb6c662ee191', 127, NULL, 'a63f8cd35def47e0b0b3b1f4381f3918', 'Dear Parent, The school officially opens on 01/01/2021. Give Edrian Karanja Mbugua the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(609, 'c107efa065e54554954deb6c662ee191', 130, NULL, '8a6d035021a64385b94f322ed04d2fce', 'Dear Parent, The school officially opens on 01/01/2021. Give Caleb Moses the items required.', '0720871499', 92, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(610, 'c107efa065e54554954deb6c662ee191', 131, NULL, 'a84a55dc00ce4ffeb03eac126ee338a8', 'Dear Parent, The school officially opens on 01/01/2021. Give Siobhan Sibwoga the items required.', '0720871499', 96, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(611, 'c107efa065e54554954deb6c662ee191', 132, NULL, '775395b816c2477a841d84c3f0227d75', 'Dear Parent, The school officially opens on 01/01/2021. Give Tasha Baraka Wangeci the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(612, 'c107efa065e54554954deb6c662ee191', 133, NULL, '2db48ea7c9f74c199c1a828c8d2b3e58', 'Dear Parent, The school officially opens on 01/01/2021. Give Rebecca Kendi Muraya the items required.', '0720871499', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(613, 'c107efa065e54554954deb6c662ee191', 134, NULL, '978bd906d79242af891c40ff538f4826', 'Dear Parent, The school officially opens on 01/01/2021. Give Taraji Wanjiru Kimemia the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(614, 'c107efa065e54554954deb6c662ee191', 135, NULL, '8b20672020834bfcbaa99ca0d8ace35f', 'Dear Parent, The school officially opens on 01/01/2021. Give Roy Mungai Muigai the items required.', '0720871499', 98, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(615, 'c107efa065e54554954deb6c662ee191', 136, NULL, 'b3a14e54698d42d78739fb93c1945701', 'Dear Parent, The school officially opens on 01/01/2021. Give Zenita Wangui Blessings the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(616, 'c107efa065e54554954deb6c662ee191', 145, NULL, '9d72e472dee54046adc01027832b136e', 'Dear Parent, The school officially opens on 01/01/2021. Give Mitchell Waceke Nduati the items required.', '0720871499', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(617, 'c107efa065e54554954deb6c662ee191', 149, NULL, '5c8bb47b0f864bf3b3d0c985f36ee4bb', 'Dear Parent, The school officially opens on 01/01/2021. Give Simeone Mutua Kilonzo the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(618, 'c107efa065e54554954deb6c662ee191', 150, NULL, '6f13f5e7b1cb453ea5d758189a4d82f1', 'Dear Parent, The school officially opens on 01/01/2021. Give Fabian Muchene Murugami the items required.', '0720871499', 104, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(619, 'c107efa065e54554954deb6c662ee191', 151, NULL, 'c09a270ba1d04f26b5e7e8cc1ff8d9e2', 'Dear Parent, The school officially opens on 01/01/2021. Give Annice Waithira Kungu the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(620, 'c107efa065e54554954deb6c662ee191', 152, NULL, '11310fd739a247108df0f9b02be2f1b7', 'Dear Parent, The school officially opens on 01/01/2021. Give Jacinta Wahito Kahura the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(621, 'c107efa065e54554954deb6c662ee191', 153, NULL, '993fafb124e04c8f800639891fd6b3c1', 'Dear Parent, The school officially opens on 01/01/2021. Give Cherly Wambui Gitagia the items required.', '0720871499', 102, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(622, 'c107efa065e54554954deb6c662ee191', 154, NULL, 'e25f975899d14df7aa1d9d996a050479', 'Dear Parent, The school officially opens on 01/01/2021. Give Shadrack Odhiambo Odiwour the items required.', '0720871499', 106, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(623, 'c107efa065e54554954deb6c662ee191', 155, NULL, '9feb25a6538f4dcb9ddf00f8bd565c1b', 'Dear Parent, The school officially opens on 01/01/2021. Give Precious Waithera Muteria the items required.', '0714730671', 106, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(624, 'c107efa065e54554954deb6c662ee191', 156, NULL, '266a28c7a2b04da0857270552530b44f', 'Dear Parent, The school officially opens on 01/01/2021. Give Meshack Kiarie Njuguna the items required.', '0714730671', 103, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(625, 'c107efa065e54554954deb6c662ee191', 159, NULL, '67312bf4e89548c7b2649d58efba0e8a', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Githegi Nduati the items required.', '0713962189', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(626, 'c107efa065e54554954deb6c662ee191', 159, NULL, 'ca0b7eece35143638614df0f68cfcd17', 'Dear Parent, The school officially opens on 01/01/2021. Give Moses Githegi Nduati the items required.', '0713962189', 101, 1, 0.80, 'students', NULL, NULL, NULL, '2021-11-15 14:00:16', NULL),
(627, 'beb26058bea84c0a81d374f211b59be2', 4, NULL, '59bd99e2eff948119bd600ffe2e33bd6', 'Dear Parent/Guardian, Your payment of Ksh 2,500 for SALOME MWENDE MUTISO via COOP BANK has been received. New Fees Balance is Ksh 69,000. Thank you', '0720871499', 147, 1, 0.80, 'coop', NULL, NULL, NULL, '2021-11-26 15:56:24', NULL),
(628, '764aca57ddd94abaa1f250b7167b9933', 4, NULL, 'c3140441175a4f4a841ebac3e60c6f82', 'Dear Parent/Guardian, Your payment of Ksh 5,000 for SALOME MWENDE MUTISO via COOP BANK has been received. New Fees Balance is Ksh 64,000. Thank you', '0720871499', 147, 1, 0.80, 'coop', NULL, NULL, NULL, '2021-11-26 18:15:39', NULL),
(629, '63b8fa0219744f5eb1fec50c2bef9b11', 1, NULL, '3ff9cb3ec9554b629e7f125058f9e491', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2022. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 196, 2, 1.60, 'students', NULL, NULL, NULL, '2021-12-09 09:59:04', NULL),
(630, '45b3d1d6bbc94e74881a3588239eb701', 1, NULL, 'eb55fc23d8aa4a2ea2f4fa4ae776b368', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2022. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 133, 1, 0.80, 'students', NULL, NULL, NULL, '2021-12-11 08:22:03', NULL),
(631, '45b3d1d6bbc94e74881a3588239eb701', 3, NULL, 'ef2c1d8147264899b95252db9cd8aed0', 'Dear Parent, Kindly clear Jack Otieno Ogendo fees balance of 20000 by 01/01/2022. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0003', '0720871499', 133, 1, 0.80, 'students', NULL, NULL, NULL, '2021-12-11 08:22:03', NULL),
(632, 'f2a444707989451b939ef77b00505a8a', 1, NULL, '45200e2aeb61472d926c0275d3b20b81', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2022. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 133, 1, 0.80, 'students', NULL, NULL, NULL, '2021-12-15 12:01:49', NULL),
(633, 'f2a444707989451b939ef77b00505a8a', 29, NULL, '8d34f15e73e4493b8835bb9e970585a6', 'Dear Parent, Kindly clear Jayden Nyamweya Omweri fees balance of 35300 by 01/01/2022. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0029', '0720871499', 137, 1, 0.80, 'students', NULL, NULL, NULL, '2021-12-15 12:01:49', NULL),
(634, '2b7ffc0a83da4df89f622899e6f831b9', 1, NULL, '72a9b044af3b44ceb5ac61a3b30db4a2', 'Dear Parent,  Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/02/2022. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 134, 1, 0.80, 'students', NULL, NULL, NULL, '2022-01-06 12:30:44', NULL),
(635, '2b7ffc0a83da4df89f622899e6f831b9', 13, NULL, 'e5e840b86628488eac9a8064b8ba94f5', 'Dear Parent,  Kindly clear Justus Munene Kirangi fees balance of 29500 by 01/02/2022. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0013', '0720871499', 137, 1, 0.80, 'students', NULL, NULL, NULL, '2022-01-06 12:30:44', NULL),
(636, '4fbb4070fa42486fa973ee5ea1c68b87', 2, NULL, '152cdca4c9094f89a60210d1bb8e3d3c', 'Dear Parent,   Kindly clear Moses Mwangi Njamba fees balance of 34000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0002', '0720871499', 199, 2, 1.60, 'students', NULL, NULL, NULL, '2022-01-11 11:49:37', NULL),
(637, '4fbb4070fa42486fa973ee5ea1c68b87', 7, NULL, '80725c3c692e46c1b4fb100b4a23913d', 'Dear Parent,   Kindly clear Yvonne Wanjiru Kimani fees balance of 27750 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0007', '0720871499', 201, 2, 1.60, 'students', NULL, NULL, NULL, '2022-01-11 11:49:37', NULL),
(638, 'f270217089b943c7b0167fc401e540b3', 159, NULL, '3b48d43d97a440b58718ad9aa8a40575', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/03/2022. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0722178234', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-07 09:49:14', NULL),
(639, 'f270217089b943c7b0167fc401e540b3', 159, NULL, '0de0782402e544a78782d844da4424bc', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/03/2022. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0713962189', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-07 09:49:14', NULL),
(640, 'cf1ab484039c4177977e7ca91af858dd', 1, NULL, '56472704f4ac493baffac4481f9ba3a4', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 196, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-08 09:49:59', NULL),
(641, '375292a491764f72b81089d890d755c8', 1, NULL, '1b567cb87e4d4139b4b56947a5b0b1ed', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 196, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-11 20:39:43', NULL),
(642, 'c87efe86ab974ef09e288e472340d3ce', 159, NULL, '14560444ccc94db1a9e7e70d40b9505b', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0748844432', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-16 09:54:29', NULL),
(643, 'c87efe86ab974ef09e288e472340d3ce', 159, NULL, '8ddf3003d81041eb87a5bfe2f81f4b55', 'Dear Parent, Kindly clear Moses Githegi Nduati fees balance of 45900 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0157', '0713962189', 198, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-16 09:54:29', NULL),
(644, 'c87efe86ab974ef09e288e472340d3ce', 154, NULL, 'fabbb438d8e44cb09335bce7e620ea55', 'Dear Parent, Kindly clear Shadrack Odhiambo Odiwour fees balance of 177500 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0154', '0720871499', 204, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-16 09:54:29', NULL),
(645, 'cdb0f736524e40c28e9a8534577e3dd1', 1, NULL, '1302e54a39144f8988b488d35ba37cd2', 'Dear Parent, Kindly clear Jane Njeri Mwaniki fees balance of 27000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0001', '0720871499', 196, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-16 11:50:36', NULL),
(646, 'cdb0f736524e40c28e9a8534577e3dd1', 3, NULL, '014f01a532d44feda41301d2348844bb', 'Dear Parent, Kindly clear Jack Otieno Ogendo fees balance of 20000 by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: SBT0003', '0720871499', 196, 2, 1.60, 'students', NULL, NULL, NULL, '2022-02-16 11:50:36', NULL),
(647, 'dbcfe1c3b88041cc84f81d2ae16b223b', 1, NULL, '88be0a336fbc4d989d1dff3af51afaa9', 'Dear JOSEPH NYUTU GITAU, Your payment of Ksh 5000.00 for Jane Njeri Mwaniki has been received. New Fees Balance 22000.  Thank you', '254720871499', 129, 1, 0.80, 'mpesa', NULL, NULL, NULL, '2022-03-02 16:31:09', '2022-03-02 16:31:09'),
(648, 'ed52655fae7b442a96e3ff8501779ddb', 74, NULL, 'e5c8c44bc9ba44fa919b32bb1764fae5', 'Dear Parent/Guardian, Your payment of Ksh 5,000 for ADRIEL MAINA MACHARIA via COOP BANK has been received. New Fees Balance is Ksh 50. Thank you', '0720871499', 144, 1, 0.80, 'coop', NULL, NULL, NULL, '2022-03-02 16:53:43', NULL),
(649, '4f432a64e5b64130ae5a7652f2d2e6dd', 74, NULL, 'f419d0598576406ca26d7b7895b1c176', 'Dear Parent/Guardian, Your payment of Ksh 800 for ADRIEL MAINA MACHARIA via COOP BANK has been received. New Fees Overpay is Ksh -750. Thank you', '0720871499', 144, 1, 0.80, 'coop', NULL, NULL, NULL, '2022-03-02 17:00:31', NULL),
(650, '11a14c81a9f44ff1ba80b4f5b10850f5', 151, NULL, '73f9072e1d1c4b9ab607e84b619a584d', 'Dear Parent/Guardian, Your payment of Ksh 500 for ANNICE WAITHIRA KUNGU via COOP BANK has been received. New Fees Balance is Ksh 1,000. Thank you', '0720871499', 145, 1, 0.80, 'coop', NULL, NULL, NULL, '2022-03-02 17:54:31', NULL),
(651, '495f8f3d4e8846c6bfc51c61bc09829a', 151, NULL, '98a994701b8746e69820a671ed35456c', 'Dear Parent/Guardian, Your payment of Ksh 500 for ANNICE WAITHIRA KUNGU via COOP BANK has been received. New Fees Balance is Ksh 500. Thank you', '0720871499', 143, 1, 0.80, 'coop', NULL, NULL, NULL, '2022-03-02 18:02:43', NULL),
(652, '96be55b181bc4fdc907a9063c54be295', 70, NULL, '78d4c40176d3425bb6e0f72b9124f163', 'Dear Parent/Guardian, Your payment of Ksh 2,000 for CLAUDIA WANJIKU WABERA via COOP BANK has been received. New Fees Balance is Ksh 28,000. Thank you', '0720871499', 149, 1, 0.80, 'coop', NULL, NULL, NULL, '2022-03-02 18:06:11', NULL),
(653, 'ee5134838fd6406ea1d473b31d079a24', 89, NULL, '85853e7654aa47ce99f56288ba629f49', 'Dear JOSEPH NYUTU GITAU, Your payment of Ksh 2000.00 for Fiona Chepchirchir Cheruiyot has been received. New Fees Balance 38600.  Thank you', '254720871499', 139, 1, 0.80, 'mpesa', NULL, NULL, NULL, '2022-03-02 19:34:20', '2022-03-02 19:34:20'),
(654, 'fc4f7232a01a4963bbc27a13b7a45495', 43, NULL, '46d4769d2e364ae3bb58a342fdea3bfe', 'Dear JOSEPH NYUTU GITAU, Your payment of Ksh 2000.00 for Caleb Muikamba has been received. New Fees Balance 37050.  Thank you', '254720871499', 125, 1, 0.80, 'mpesa', NULL, NULL, NULL, '2022-03-02 19:42:27', '2022-03-02 19:42:27'),
(655, 'e0131dd7be1c438da46406c98d837179', 2, NULL, '39ff1fb18b9743f6b22aff49e5cb129b', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Moses Mwangi Njamba school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(656, 'e0131dd7be1c438da46406c98d837179', 13, NULL, '3abe7abb84a148678d61dfb4be02f21f', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Justus Munene Kirangi school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(657, 'e0131dd7be1c438da46406c98d837179', 14, NULL, 'e1149d7eaac14352a4ade27e88ec30e9', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Benjamin Wanjala Shiundu school by 7am.', '0720871499', 147, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(658, 'e0131dd7be1c438da46406c98d837179', 15, NULL, '5e69c1f9c1654d35a6549ffc89ceef7d', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Janelle Agutu Ontomwa school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(659, 'e0131dd7be1c438da46406c98d837179', 18, NULL, '508f49e7f3c44e0990148a1530ecd857', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Rayan Wanjohi Mureu school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(660, 'e0131dd7be1c438da46406c98d837179', 19, NULL, '130371c546d64477a9f6389ec7119f63', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Johnstone Kagwanja Muiruri school by 7am.', '0720871499', 149, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(661, 'e0131dd7be1c438da46406c98d837179', 20, NULL, '5e3b73fe373743e29e2e267a4aad3b3e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Felistus Nyambura school by 7am.', '0720871499', 140, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(662, 'e0131dd7be1c438da46406c98d837179', 21, NULL, 'd78fd45eca9648cf8a8340a310a2f8e6', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Evans Mwaniki school by 7am.', '0720871499', 136, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(663, 'e0131dd7be1c438da46406c98d837179', 22, NULL, '48817d8131254eb0bfac1e317dcd3da4', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Samwel Mureithi school by 7am.', '0720871499', 138, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(664, 'e0131dd7be1c438da46406c98d837179', 23, NULL, 'aad2b281d26642b7ac37a8613b02b546', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Faith Muthoni  school by 7am.', '0720871499', 137, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(665, 'e0131dd7be1c438da46406c98d837179', 24, NULL, '80fb44a7ae8243b9a03aff56ee0ab67e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Ian Jomo Kianangi  school by 7am.', '0720871499', 141, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(666, 'e0131dd7be1c438da46406c98d837179', 25, NULL, '71742e258ba24b1ba255fac8611b2124', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Shamira Wanjeri school by 7am.', '0720871499', 138, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(667, 'e0131dd7be1c438da46406c98d837179', 27, NULL, '1495de837ac84fc78474e9a61b465b57', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Jeremiah Wandaro school by 7am.', '0720871499', 139, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(668, 'e0131dd7be1c438da46406c98d837179', 28, NULL, 'fb6734f2020748da996dcb882c2b1064', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Onesmus Nyanteri school by 7am.', '0720871499', 139, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(669, 'e0131dd7be1c438da46406c98d837179', 29, NULL, 'dc470fe28a674962aa9f7631fa99e3eb', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Jayden Nyamweya Omweri school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(670, 'e0131dd7be1c438da46406c98d837179', 30, NULL, '2604ee73a946434e96b70d4c13bdc015', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Martha Wambui Mburu school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(671, 'e0131dd7be1c438da46406c98d837179', 31, NULL, 'c2ec8052be1b4c06b8bb6831ac4b370e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Leah Muthoni school by 7am.', '0720871499', 135, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(672, 'e0131dd7be1c438da46406c98d837179', 32, NULL, '8717dc28ce8e4e9d901e3220d48c7eb7', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Chantaal Nyambura school by 7am.', '0720871499', 140, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(673, 'e0131dd7be1c438da46406c98d837179', 33, NULL, 'aafc913c8cc04dd1a6209ad4960b90b9', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Junior James Gitau school by 7am.', '0720871499', 141, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(674, 'e0131dd7be1c438da46406c98d837179', 36, NULL, '87c898dd2fe34198b68297561466752a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Delilah Wawendo Murage school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(675, 'e0131dd7be1c438da46406c98d837179', 37, NULL, '8153e7b11368485c848b1eaf644332f4', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Monicah Njeri Kamau school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(676, 'e0131dd7be1c438da46406c98d837179', 39, NULL, 'c6eb18bc193d47b2b96cb82f5d1accba', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Kelsey Nyaboke school by 7am.', '0720871499', 137, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(677, 'e0131dd7be1c438da46406c98d837179', 40, NULL, 'd6887dce88644c599d631e78a15da9dd', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Benson Macharia Wambugu school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(678, 'e0131dd7be1c438da46406c98d837179', 42, NULL, '9f223d16d3e04ae9a76f0415645bfe5a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Peter Kamau Maina school by 7am.', '0720871499', 140, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(679, 'e0131dd7be1c438da46406c98d837179', 44, NULL, '52c24108703a4366867bbad4b6824777', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Ethan Jones Maina school by 7am.', '0720871499', 140, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(680, 'e0131dd7be1c438da46406c98d837179', 45, NULL, '7217625852a240faad027e88492df5a8', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Elaine Mwikali school by 7am.', '0720871499', 137, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(681, 'e0131dd7be1c438da46406c98d837179', 48, NULL, '3b57559ab7e74cb8a773d36bf6fea31c', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Martin Gacheru school by 7am.', '0720871499', 137, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(682, 'e0131dd7be1c438da46406c98d837179', 49, NULL, 'd821edcda0b24df8a86d314c990f4a4d', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Phoebe Wangui Nyambura school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(683, 'e0131dd7be1c438da46406c98d837179', 50, NULL, 'b5c3b8f2599346528d5ab7bb776f3ade', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Allan Ndirangu Mwaura school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(684, 'e0131dd7be1c438da46406c98d837179', 52, NULL, '7a120ecd5ab642f1aa4d6640b5ba501a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Jacky Wamaitha Nyutu school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(685, 'e0131dd7be1c438da46406c98d837179', 53, NULL, 'd3ece83877ad4cdb838c83d29ac85e18', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Eliana Wanjira Thuku school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:55', NULL),
(686, 'e0131dd7be1c438da46406c98d837179', 55, NULL, '71fc59b7522d49518670b5c851a3804a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Michael Wanjiru Gichuga school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(687, 'e0131dd7be1c438da46406c98d837179', 56, NULL, '21230d0ca8d844c99ba557dff9ccfb3d', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring James Ngugi Maina school by 7am.', '0720871499', 140, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(688, 'e0131dd7be1c438da46406c98d837179', 58, NULL, 'b316f072e5254987b7b3d18262562596', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Marx Maina Muteria school by 7am.', '0720871499', 141, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(689, 'e0131dd7be1c438da46406c98d837179', 62, NULL, '6210f394a7384fb29ad1bd1cb2c39a31', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Moses Kariuki Munyaka school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(690, 'e0131dd7be1c438da46406c98d837179', 64, NULL, 'f111954eddda4776a44ee1a09feff990', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Kilvin Mutembei school by 7am.', '0720871499', 138, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(691, 'e0131dd7be1c438da46406c98d837179', 65, NULL, 'd3bfcaf8112e4764b58bf29b2c7a4292', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Jane Njambi Muriuki school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(692, 'e0131dd7be1c438da46406c98d837179', 66, NULL, '73fbcc232b1a4c2c9b065fbd2648d3b2', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Emmah Riziki Ashah school by 7am.', '0720871499', 141, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(693, 'e0131dd7be1c438da46406c98d837179', 67, NULL, 'aced8382ba0d4ef3b184734b684c7ea1', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Washington Nyongesa Masika school by 7am.', '0720871499', 149, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(694, 'e0131dd7be1c438da46406c98d837179', 68, NULL, 'ec8e498c1ff54b1a95d5fc52de672ef1', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Joanace Gathiga Mwaniki school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(695, 'e0131dd7be1c438da46406c98d837179', 69, NULL, 'ed4e3ef6d41d41e4ad32a142caf8576f', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Jane Karinge Mande school by 7am.', '0720871499', 141, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(696, 'e0131dd7be1c438da46406c98d837179', 70, NULL, 'cacace9c99dc4031b46c4b65458407ee', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Claudia Wanjiku Wabera school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(697, 'e0131dd7be1c438da46406c98d837179', 72, NULL, '61e6859318394bdcaf2c3fae7fd30e2e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Eddie Karanja Kiogora school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(698, 'e0131dd7be1c438da46406c98d837179', 73, NULL, '289b4de2e95b43149eaf419b7a8052ca', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Susan Naemba Wanjala school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(699, 'e0131dd7be1c438da46406c98d837179', 74, NULL, '76ce00746bc343e18f4eb433e6953d6f', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Adriel Maina Macharia school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(700, 'e0131dd7be1c438da46406c98d837179', 75, NULL, 'ebe8c8a444c6498e96f6ecb41f308e87', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Quintah Wema Gitonga school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(701, 'e0131dd7be1c438da46406c98d837179', 76, NULL, 'e98d9f56eeff4d0593ad2fc7940480e9', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Mathias Njenga Macharia school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(702, 'e0131dd7be1c438da46406c98d837179', 77, NULL, '36a17c4d86564615b49407d50a9e7166', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Mike Gichinga Kimani school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(703, 'e0131dd7be1c438da46406c98d837179', 80, NULL, '644529b263df4b85b426ab3c989e3ce8', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Janet Pendo Mwamba school by 7am.', '0720871499', 141, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(704, 'e0131dd7be1c438da46406c98d837179', 82, NULL, '12c960f7b622496fbf2b2ac04558af63', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Moses Karanja school by 7am.', '0720871499', 136, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(705, 'e0131dd7be1c438da46406c98d837179', 83, NULL, '2cc2a1a6c8d443519b4d275dc48a3e6b', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Ethern Mungai Githinga school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(706, 'e0131dd7be1c438da46406c98d837179', 85, NULL, '3504e1a2138846bb879cb23af4243309', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Yvette Moraa Moracha school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(707, 'e0131dd7be1c438da46406c98d837179', 86, NULL, 'c5d4b6c361b445ed898fb474e24bd311', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Kyla Wanjeri school by 7am.', '0720871499', 135, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(708, 'e0131dd7be1c438da46406c98d837179', 87, NULL, 'c6dcafc7973f46c78b834cfd98ffdb98', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Victoria Valery school by 7am.', '0720871499', 138, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(709, 'e0131dd7be1c438da46406c98d837179', 88, NULL, '0c52c884fec6440f9e7b94295581b55e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Tanice Simintei school by 7am.', '0720871499', 138, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(710, 'e0131dd7be1c438da46406c98d837179', 89, NULL, '6021f8d46d8f453a952ed9eccde8fb7e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Fiona Chepchirchir Cheruiyot school by 7am.', '0720871499', 151, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(711, 'e0131dd7be1c438da46406c98d837179', 90, NULL, '9d94e262d8484225bcd6b318b3a2ef3c', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Terryann Cheruto school by 7am.', '0720871499', 139, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(712, 'e0131dd7be1c438da46406c98d837179', 91, NULL, 'e1d660008c5946a9a23f8022245ed5c0', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Robert Mbugua Wanyeki school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(713, 'e0131dd7be1c438da46406c98d837179', 92, NULL, '3a8eed67207a46108dced051c89ed748', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Viviana Njambi Njuguna school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(714, 'e0131dd7be1c438da46406c98d837179', 93, NULL, '5920a926f6d8426e9a8f108a4deaf35e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Maya Blessing Mwandie school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(715, 'e0131dd7be1c438da46406c98d837179', 94, NULL, 'd9d1b466b0a44f40a79f06e0d9ac5b98', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Isabella Muthoni school by 7am.', '0720871499', 139, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(716, 'e0131dd7be1c438da46406c98d837179', 95, NULL, '50a326c5482c47b889fe9ae61aff98a5', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Natalie Muthoni Muthomi school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(717, 'e0131dd7be1c438da46406c98d837179', 96, NULL, '72fc97e333d14484bcbc08c15b4087e8', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Lilian Njoki Mbiu school by 7am.', '0720871499', 140, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(718, 'e0131dd7be1c438da46406c98d837179', 98, NULL, '72968e9dca094af9a13223624bc74e38', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Imela Waembu Karimi school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(719, 'e0131dd7be1c438da46406c98d837179', 99, NULL, '14bada43150940cb98a885eaa725afe0', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Asher Mwalimu school by 7am.', '0720871499', 136, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(720, 'e0131dd7be1c438da46406c98d837179', 102, NULL, 'c8f44b666a0a4afc9a3429978113a60a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Keslie Njoki Mwendandu school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(721, 'e0131dd7be1c438da46406c98d837179', 103, NULL, 'da396e9d2299488e9780cde9a53000ee', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Oliver Wekesa Shilandura school by 7am.', '0720871499', 147, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(722, 'e0131dd7be1c438da46406c98d837179', 104, NULL, '1d75c64d7e574dea97f88491fb569aa5', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Declan Mbecha Kuria school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(723, 'e0131dd7be1c438da46406c98d837179', 107, NULL, '7fa40be0ff59497385aa4b288fe302d4', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Nancy Nduta Kanyiri school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(724, 'e0131dd7be1c438da46406c98d837179', 108, NULL, '53789993c9eb4f4b8968b571c4b3b3b2', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Tracyann Wambui Mwendia school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(725, 'e0131dd7be1c438da46406c98d837179', 114, NULL, '370542f3ca20462f9176ee9902e6afa7', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Verena Waturi Mburu school by 7am.', '0720871499', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(726, 'e0131dd7be1c438da46406c98d837179', 115, NULL, 'afd90d787f1c4499a3d6018a97a3c49d', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Shirleen Gathoni school by 7am.', '0720871499', 139, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(727, 'e0131dd7be1c438da46406c98d837179', 116, NULL, '495a4aa70e6b4170ab2802079a196efd', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Natania Wanjiku school by 7am.', '0720871499', 138, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:56', NULL),
(728, 'e0131dd7be1c438da46406c98d837179', 120, NULL, '8ca4a754daa74f849f2ed35a62d0d12f', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Fabius Wanderi Nderu school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(729, 'e0131dd7be1c438da46406c98d837179', 121, NULL, 'cca2c7b16d50436b8b0b70bb9132998a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Daniel Muturi Chomba school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(730, 'e0131dd7be1c438da46406c98d837179', 122, NULL, '771ea28a007b4b77a0578e98b2768882', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Nyce Waithera school by 7am.', '0720871499', 136, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(731, 'e0131dd7be1c438da46406c98d837179', 123, NULL, '19c7c4cbca0144828f5544207d708ea4', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring David Kimiti Mateu school by 7am.', '0720871499', 141, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(732, 'e0131dd7be1c438da46406c98d837179', 124, NULL, '2076334d3af540b18efa425f6319cb6e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Celine Wairimu Chege school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(733, 'e0131dd7be1c438da46406c98d837179', 125, NULL, 'd8ecb0654f9b4a289d7dfee6dc8727c1', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Esther Achieng Oluoch school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(734, 'e0131dd7be1c438da46406c98d837179', 126, NULL, 'ce339225a15e4d51be1db37aadede4ae', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Andrew Karanu Njoroge school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(735, 'e0131dd7be1c438da46406c98d837179', 127, NULL, '09129b3a64d148fdbf82df44c469987c', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Edrian Karanja Mbugua school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(736, 'e0131dd7be1c438da46406c98d837179', 130, NULL, '96270a4040b14b35b4784761071a2dce', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Caleb Moses school by 7am.', '0720871499', 134, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(737, 'e0131dd7be1c438da46406c98d837179', 131, NULL, '265485745de94becb3f18a29b8966284', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Siobhan Sibwoga school by 7am.', '0720871499', 138, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(738, 'e0131dd7be1c438da46406c98d837179', 132, NULL, '14dd3eb3fcd648c3af2c2c6065fec269', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Tasha Baraka Wangeci school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(739, 'e0131dd7be1c438da46406c98d837179', 133, NULL, 'b1a2684673ec48cd8e7978e12e3a83b7', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Rebecca Kendi Muraya school by 7am.', '0720871499', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(740, 'e0131dd7be1c438da46406c98d837179', 134, NULL, 'f1af6f8e45074430b15a3ffd728d576f', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Taraji Wanjiru Kimemia school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL);
INSERT INTO `message_outboxes` (`id`, `code`, `recipient_id`, `externalMessageId`, `messageId`, `message`, `phoneno`, `characters`, `sms_units`, `sms_cost`, `target`, `statusCode`, `status`, `delivered_at`, `created_at`, `updated_at`) VALUES
(741, 'e0131dd7be1c438da46406c98d837179', 135, NULL, 'd696b6aa6a904874a3db1eec98e107b6', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Roy Mungai Muigai school by 7am.', '0720871499', 140, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(742, 'e0131dd7be1c438da46406c98d837179', 136, NULL, 'fe0998eb3a84468783b18ac361a3102d', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Zenita Wangui Blessings school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(743, 'e0131dd7be1c438da46406c98d837179', 145, NULL, 'f6532ce94b404e2aaa3ef01c23f099f7', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Mitchell Waceke Nduati school by 7am.', '0720871499', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(744, 'e0131dd7be1c438da46406c98d837179', 149, NULL, '5d56cf1c812046efa454d0e760cc1b13', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Simeone Mutua Kilonzo school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(745, 'e0131dd7be1c438da46406c98d837179', 150, NULL, 'd10520e1c9fb4d76840f0a7c01d613a5', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Fabian Muchene Murugami school by 7am.', '0720871499', 146, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(746, 'e0131dd7be1c438da46406c98d837179', 151, NULL, '36ba6d661e304458939306ddc751641c', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Annice Waithira Kungu school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(747, 'e0131dd7be1c438da46406c98d837179', 152, NULL, 'cb701d9f0c5541c9bd6030abb7947317', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Jacinta Wahito Kahura school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(748, 'e0131dd7be1c438da46406c98d837179', 153, NULL, '03e830c2bc51481cae8df458f5e88abe', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Cherly Wambui Gitagia school by 7am.', '0720871499', 144, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(749, 'e0131dd7be1c438da46406c98d837179', 154, NULL, '530b452719ad4e288695c3761e191231', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Shadrack Odhiambo Odiwour school by 7am.', '0720871499', 148, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(750, 'e0131dd7be1c438da46406c98d837179', 155, NULL, 'a9b2ce27c7a4473fa0871dbd4cca4b9b', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Precious Waithera Muteria school by 7am.', '0714730671', 148, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(751, 'e0131dd7be1c438da46406c98d837179', 156, NULL, '3f9e8118af364ed4b6ed1649483f2d58', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Meshack Kiarie Njuguna school by 7am.', '0714730671', 145, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(752, 'e0131dd7be1c438da46406c98d837179', 159, NULL, 'e4e8daab4e6b4cbbb73036be3268d394', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Moses Githegi Nduati school by 7am.', '0714730671', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(753, 'e0131dd7be1c438da46406c98d837179', 159, NULL, '0e750f65546d4cde96139c99738df195', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Moses Githegi Nduati school by 7am.', '0713962189', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(754, 'e0131dd7be1c438da46406c98d837179', 160, NULL, '807a6d539b5f44169254b451dbd76870', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Amos Wangai Muchene school by 7am.', '0714730671', 142, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 21:39:57', NULL),
(755, '4aa86257d3554f9db01f614048107f53', 14, NULL, 'e3da31d8bc2b418ab87c3e4d1ba2b1b9', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Benjamin Wanjala Shiundu school by 7am.', '0720871499', 147, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 22:00:58', NULL),
(756, '4aa86257d3554f9db01f614048107f53', 159, NULL, '3ef7073ff5a84133a1593ba199727a5f', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Moses Githegi Nduati school by 7am.', '0714730671', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 22:00:58', NULL),
(757, '4aa86257d3554f9db01f614048107f53', 159, NULL, '1a196d9a77d448fbb67609c53932da86', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring Moses Githegi Nduati school by 7am.', '0713962189', 143, 1, 0.80, 'students', NULL, NULL, NULL, '2022-03-02 22:00:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_12_07_100427_create_class_grades_table', 1),
(4, '2020_12_07_100428_create_class_streams_table', 1),
(5, '2020_12_07_100429_create_classrooms_table', 1),
(6, '2020_12_17_104010_create_academic_terms_table', 1),
(7, '2020_12_17_114444_create_financial_years_table', 1),
(8, '2020_12_17_120049_create_current_sessions_table', 1),
(9, '2020_12_17_124839_create_fee_parameters_table', 1),
(10, '2020_12_23_160259_create_class_fees_table', 1),
(11, '2020_12_30_221903_create_optional_fees_table', 1),
(12, '2020_12_30_225316_create_one_time_fees_table', 1),
(13, '2020_12_31_010250_create_transport_zones_table', 1),
(14, '2021_01_01_211932_create_transport_zone_fees_table', 1),
(15, '2021_01_01_220544_create_transport_fleets_table', 1),
(16, '2021_01_02_152506_create_discount_levels_table', 1),
(17, '2021_01_07_201013_create_parent_details_table', 1),
(18, '2021_01_07_201347_create_students_table', 1),
(19, '2021_02_01_232653_create_student_fees_table', 1),
(20, '2021_03_02_001249_create_banks_table', 1),
(21, '2021_03_31_234800_create_fee_discounts_table', 1),
(22, '2021_04_02_001751_create_school_profiles_table', 1),
(23, '2021_04_03_114143_create_student_transports_table', 1),
(25, '2021_04_03_135413_create_fee_payments_table', 1),
(26, '2021_04_22_230043_create_student_timelines_table', 1),
(27, '2021_04_30_233745_create_mpesa_payments_table', 1),
(28, '2021_05_01_011354_create_mpesa_outboxes_table', 1),
(29, '2021_05_04_165559_create_fee_messages_table', 1),
(30, '2021_05_24_174600_create_temp_students_table', 2),
(31, '2021_05_24_184220_create_general_messages_table', 2),
(32, '2021_05_24_204753_create_gen_students_table', 2),
(33, '2021_05_25_101620_create_expense_departments_table', 2),
(34, '2021_05_25_101657_create_expense_sections_table', 2),
(35, '2021_05_25_101701_create_expenses_table', 2),
(36, '2021_05_30_165833_create_staff_departments_table', 3),
(37, '2021_06_02_155215_create_staff_sections_table', 3),
(38, '2021_06_02_172728_create_staff_members_table', 3),
(39, '2021_06_07_132809_create_staff_messages_table', 3),
(40, '2021_06_07_161357_create_temp_staff_table', 3),
(41, '2021_06_11_090325_create_class_managers_table', 3),
(42, '2021_06_11_090520_create_academic_subjects_table', 3),
(43, '2021_06_11_104831_create_class_subjects_table', 3),
(44, '2021_06_11_110156_create_subject_teachers_table', 3),
(45, '2021_07_02_222250_create_promotion_histories_table', 3),
(46, '2021_07_02_223810_create_student_promotions_table', 3),
(47, '2021_07_26_225330_create_payroll_parameters_table', 4),
(49, '2021_09_08_005641_create_message_queues_table', 5),
(50, '2021_09_08_122514_create_jobs_table', 6),
(51, '2021_09_10_010006_create_message_outboxes_table', 7),
(52, '2021_10_19_221903_create_original_messages_table', 8),
(58, '2016_06_01_000001_create_oauth_auth_codes_table', 9),
(59, '2016_06_01_000002_create_oauth_access_tokens_table', 9),
(60, '2016_06_01_000003_create_oauth_refresh_tokens_table', 9),
(61, '2016_06_01_000004_create_oauth_clients_table', 9),
(62, '2016_06_01_000005_create_oauth_personal_access_clients_table', 9),
(63, '2021_11_24_001440_create_client_connections_table', 10),
(64, '2021_11_24_021312_create_coop_payments_table', 10),
(65, '2022_02_23_024151_create_transaction_statuses_table', 11),
(66, '2022_03_02_203048_create_coop_outboxes_table', 12),
(67, '2022_03_08_112209_create_closing_balances_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_outboxes`
--

CREATE TABLE `mpesa_outboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mpesa_payment_id` bigint(20) UNSIGNED NOT NULL,
  `messageId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_outboxes`
--

INSERT INTO `mpesa_outboxes` (`id`, `mpesa_payment_id`, `messageId`, `message`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '88be0a336fbc4d989d1dff3af51afaa9', 'Dear JOSEPH NYUTU GITAU, Your payment of Ksh 5000.00 for Jane Njeri Mwaniki has been received. New Fees Balance 22000.  Thank you', '254720871499', 'sent', '2022-03-02 16:31:09', '2022-03-02 16:31:09'),
(2, 4, '85853e7654aa47ce99f56288ba629f49', 'Dear JOSEPH NYUTU GITAU, Your payment of Ksh 2000.00 for Fiona Chepchirchir Cheruiyot has been received. New Fees Balance 38600.  Thank you', '254720871499', 'sent', '2022-03-02 19:34:20', '2022-03-02 19:34:20'),
(3, 4, '46d4769d2e364ae3bb58a342fdea3bfe', 'Dear JOSEPH NYUTU GITAU, Your payment of Ksh 2000.00 for Caleb Muikamba has been received. New Fees Balance 37050.  Thank you', '254720871499', 'sent', '2022-03-02 19:42:27', '2022-03-02 19:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_payments`
--

CREATE TABLE `mpesa_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `transTime` text COLLATE utf8mb4_unicode_ci,
  `transAmount` text COLLATE utf8mb4_unicode_ci,
  `businessShortCode` text COLLATE utf8mb4_unicode_ci,
  `billRefNumber` text COLLATE utf8mb4_unicode_ci,
  `invoiceNumber` text COLLATE utf8mb4_unicode_ci,
  `orgAccountBalance` text COLLATE utf8mb4_unicode_ci,
  `thirdPartyTransID` text COLLATE utf8mb4_unicode_ci,
  `MSISDN` text COLLATE utf8mb4_unicode_ci,
  `firstName` text COLLATE utf8mb4_unicode_ci,
  `lastName` text COLLATE utf8mb4_unicode_ci,
  `middleName` text COLLATE utf8mb4_unicode_ci,
  `transID` text COLLATE utf8mb4_unicode_ci,
  `transactionType` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mpesa_payments`
--

INSERT INTO `mpesa_payments` (`id`, `student_id`, `current_session_id`, `transTime`, `transAmount`, `businessShortCode`, `billRefNumber`, `invoiceNumber`, `orgAccountBalance`, `thirdPartyTransID`, `MSISDN`, `firstName`, `lastName`, `middleName`, `transID`, `transactionType`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '20210915023457', '5000.00', '4018467', 'SBT0001', 'SSK0034', '105700.00', '', '254720871499', 'JOSEPH', 'GITAU', 'NYUTU', 'OKJ7HLOGRE', 'Pay Bill', 1, '2021-09-14 23:35:31', '2022-03-02 16:26:29'),
(2, 5, 2, '20210915024657', '6000.00', '4018467', 'SSK0034', 'SSK0034', '175700.00', '', '254720871499', 'JOSEPH', 'GITAU', 'NYUTU', 'OKJ7HLOJKU', 'Pay Bill', 1, '2021-09-14 23:46:48', '2021-09-14 23:46:48'),
(3, 5, 2, '20210915025057', '2000.00', '4018467', 'SSK0034', 'SSK0034', '175700.00', '', '254720871499', 'JOSEPH', 'GITAU', 'NYUTU', 'OKJ7HLOTKU', 'Pay Bill', 1, '2021-09-14 23:51:05', '2021-09-14 23:51:05'),
(4, 43, 2, '20210915025057', '2000.00', '4018467', 'SBT0043', 'SSK0034', '175700.00', '', '254720871499', 'JOSEPH', 'GITAU', 'NYUTU', 'OKJ8HLOTKA', 'Pay Bill', 1, '2021-09-14 23:54:21', '2022-03-02 19:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('ab80b029eef5619d7a17fd115146dc075709b05680e263deb6ec86206847bbf30bfffbb6ddcea2a2', NULL, '4c1cc48427b244e3a6e2db82565f9ec7', NULL, '[]', 0, '2021-11-03 07:09:33', '2021-11-03 07:09:33', '2021-11-04 10:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('4c1cc48427b244e3a6e2db82565f9ec7', 2, 'User Two', '6c7f80e8e1b04c7eb2f4591a7a2ea75b', 'http://dev.schoolbest.co.ke/v1/this-url', 1, 0, 0, '2021-11-03 06:52:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `one_time_fees`
--

CREATE TABLE `one_time_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `fee_parameter_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `one_time_fees`
--

INSERT INTO `one_time_fees` (`id`, `slug`, `current_session_id`, `fee_parameter_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '1-1-3000', 1, 1, 3000, 1, 1, '2021-05-08 07:45:22', NULL, '2021-05-08 07:45:22', NULL, NULL),
(2, '2-1-3000', 2, 1, 3000, 1, 1, '2021-06-19 23:00:45', NULL, '2021-06-19 23:00:45', NULL, NULL),
(3, '2-6-2000', 2, 6, 2000, 2, 1, '2021-06-19 13:01:53', NULL, '2021-06-19 23:01:53', 1, '2021-06-19 23:01:53'),
(4, '2-8-6000', 2, 8, 6000, 1, 1, '2022-01-11 21:41:03', NULL, '2022-01-11 21:41:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `optional_fees`
--

CREATE TABLE `optional_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `fee_parameter_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `optional_fees`
--

INSERT INTO `optional_fees` (`id`, `slug`, `current_session_id`, `fee_parameter_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '2-9-2000', 2, 9, 2000, 1, 1, '2021-08-10 11:34:09', NULL, '2021-08-10 11:34:09', NULL, NULL),
(2, '2-10-4500', 2, 10, 4500, 1, 1, '2021-08-10 11:34:20', NULL, '2021-08-10 11:34:20', NULL, NULL),
(3, '2-11-4500', 2, 11, 4500, 1, 1, '2021-08-10 11:34:33', NULL, '2021-08-10 11:34:33', NULL, NULL),
(4, '2-12-2500', 2, 12, 2500, 1, 1, '2021-08-10 11:34:46', NULL, '2021-08-10 11:34:46', NULL, NULL),
(5, '2-13-3500', 2, 13, 3500, 1, 1, '2021-08-10 11:34:58', NULL, '2021-08-10 11:34:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `original_messages`
--

CREATE TABLE `original_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'isQueued',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `original_messages`
--

INSERT INTO `original_messages` (`id`, `slug`, `message`, `target`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, '4c1cc48427b244e3a6e2db82565f9ec7', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2021-10-19 21:41:35', 1, '2021-10-19 21:41:45'),
(2, '8e852af1313b4e4f9ef3751d17739b8c', 'Dear Parent, The school officially opens on 01/01/2021. Give full_name the items required.', 'students', 'isSent', 1, '2021-10-19 21:42:59', 1, '2021-10-21 11:58:51'),
(3, '32ed68b4dc034ec7b865652485d9a791', 'Hello Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isQueued', 1, '2021-10-21 11:59:28', 1, '2021-10-21 17:44:51'),
(4, '0b1d4e2e78cc43aa825fa2bd55ae00f2', 'Dear Parent, The school officially opens on 01/01/2021. Give full_name the items required.', 'students', 'isSent', 1, '2021-11-08 07:47:08', 1, '2021-11-08 07:47:27'),
(5, 'fcb1acd1c56c49209958990cb985e02c', 'Dear full_name , Kindly note, we will hold our termly meeting this coming Saturday starting at 9am. Keep time!', 'students', 'isSent', 1, '2021-11-08 08:08:09', 1, '2021-11-08 08:08:16'),
(6, '148923bfe3b947aeb69a7c19c4ad81a0', 'Dear Transport, The school officially opens on 01/01/2021. Give full_name the items required.', 'students', 'isQueued', 1, '2021-11-08 08:25:14', NULL, '2021-11-08 08:25:14'),
(7, 'a05501e123fc439199742b1bfa968e9f', 'Dear Transport, The school officially opens on 01/01/2021. Give full_name the items required.', 'students', 'isSent', 1, '2021-11-08 08:27:27', 1, '2021-11-08 08:27:47'),
(8, '0498dc0cc2c64aff91b282de58282e03', 'Transport will be late today', 'students', 'isSent', 1, '2021-11-08 08:49:23', 1, '2021-11-08 16:48:40'),
(9, '1fe040bb8ddb4ec7baaaf7906eaa7df9', 'Good Morning, Parent, Kindly clear full_name fees balance of fee_balance by 01/12/2021. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2021-11-09 17:15:15', 1, '2021-11-09 17:20:14'),
(10, '7981d09088144f1788aadba7a5d73c6a', 'Hello Parent, The school officially opens on 01/01/2022. Give full_name the items required.', 'students', 'isSent', 1, '2021-11-09 18:18:11', 1, '2021-11-09 18:18:30'),
(11, '87c7fd5a6f2642b496ad93b758432160', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isQueued', 1, '2021-11-15 13:38:48', NULL, '2021-11-15 13:38:48'),
(12, '19dc2c268480420e9a2fdbc53a68198a', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isQueued', 1, '2021-11-15 13:47:15', NULL, '2021-11-15 13:47:15'),
(13, '730b0606555c48dcb9333d3683d6027c', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isQueued', 1, '2021-11-15 13:49:23', NULL, '2021-11-15 13:49:23'),
(14, 'c107efa065e54554954deb6c662ee191', 'Dear Parent, The school officially opens on 01/01/2021. Give full_name the items required.', 'students', 'isQueued', 1, '2021-11-15 14:00:14', NULL, '2021-11-15 14:00:14'),
(15, '63b8fa0219744f5eb1fec50c2bef9b11', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2022. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2021-12-09 09:59:04', 1, '2021-12-09 09:59:13'),
(16, '45b3d1d6bbc94e74881a3588239eb701', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2022. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2021-12-11 08:22:03', 1, '2021-12-11 08:22:14'),
(17, 'f2a444707989451b939ef77b00505a8a', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2022. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2021-12-15 12:01:49', 1, '2021-12-15 12:02:13'),
(18, '2b7ffc0a83da4df89f622899e6f831b9', 'Dear Parent,  Kindly clear full_name fees balance of fee_balance by 01/02/2022. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2022-01-06 12:30:44', 1, '2022-01-06 12:30:55'),
(19, '4fbb4070fa42486fa973ee5ea1c68b87', 'Dear Parent,   Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2022-01-11 11:49:37', 1, '2022-01-11 11:50:02'),
(20, 'f270217089b943c7b0167fc401e540b3', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/03/2022. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2022-02-07 09:49:14', 1, '2022-02-07 09:49:30'),
(21, 'cf1ab484039c4177977e7ca91af858dd', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2022-02-08 09:49:59', 1, '2022-02-08 09:50:04'),
(22, '375292a491764f72b81089d890d755c8', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2022-02-11 20:39:43', 1, '2022-02-11 20:39:53'),
(23, 'c87efe86ab974ef09e288e472340d3ce', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2022-02-16 09:54:29', 1, '2022-02-16 09:55:41'),
(24, 'cdb0f736524e40c28e9a8534577e3dd1', 'Dear Parent, Kindly clear full_name fees balance of fee_balance by 01/01/2021. Otherwise, your child will not be allowed in school next term. You can pay via PAYBILL NO: 4018467 ACC NO: adm_no', 'students', 'isSent', 1, '2022-02-16 11:50:36', 1, '2022-02-16 11:51:16'),
(25, 'd2466160324e4d2a85d6dbb6949af862', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:38:48', NULL, '2022-03-02 21:38:48'),
(26, 'e0131dd7be1c438da46406c98d837179', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:39:55', NULL, '2022-03-02 21:39:55'),
(27, '942932e255744cdf870a0a2890e0a797', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:40:40', NULL, '2022-03-02 21:40:40'),
(28, '01d4a580d6bf4cb7972a3e7e1a96d73b', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:41:31', NULL, '2022-03-02 21:41:31'),
(29, '7f7c1fa141c547b7a36fcca6dbd36e4e', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:45:24', NULL, '2022-03-02 21:45:24'),
(30, '7ff3862b1f284c5c83fc00436638fb6a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:45:33', NULL, '2022-03-02 21:45:33'),
(31, 'b0deb1f81e6b488c864236772f73db06', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:45:43', NULL, '2022-03-02 21:45:43'),
(32, '416ac34127864d55bbca99d70eb66869', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:46:38', NULL, '2022-03-02 21:46:38'),
(33, '7a72be1329544165ba760e4ebb76d977', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:47:01', NULL, '2022-03-02 21:47:01'),
(34, '4dbdeea1c6bd4e4890da34a1c1ce1faa', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:47:46', NULL, '2022-03-02 21:47:46'),
(35, '06148f28262146e3b5b2d4a1b8fd2469', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:51:17', NULL, '2022-03-02 21:51:17'),
(36, '3270232f3fc6413387b5bbc2ca530c03', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:52:58', NULL, '2022-03-02 21:52:58'),
(37, '7fe79d0859524c2d9261423239df27b4', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:54:34', NULL, '2022-03-02 21:54:34'),
(38, '43db5efcf9a14d18beb6da25fc546de7', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:55:20', NULL, '2022-03-02 21:55:20'),
(39, '15f3d6ce287d4d319e310a30b1caf744', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:55:52', NULL, '2022-03-02 21:55:52'),
(40, '80d2cfdcad634cc4b3c0fe204d4eb469', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:57:04', NULL, '2022-03-02 21:57:04'),
(41, '15ac54a7c44b48048f37b61cb245e71a', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 21:59:18', NULL, '2022-03-02 21:59:18'),
(42, '4aa86257d3554f9db01f614048107f53', 'Dear Parent, The school officially opens on 01/01/2021. Transport will not offered on this day Kindly bring full_name school by 7am.', 'students', 'isQueued', 1, '2022-03-02 22:00:58', NULL, '2022-03-02 22:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `parent_details`
--

CREATE TABLE `parent_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_contact` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcontact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `femail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foccupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mcontact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moccupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gcontact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gemail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grelation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credential_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_details`
--

INSERT INTO `parent_details` (`id`, `slug`, `parent_no`, `primary_contact`, `secondary_contact`, `primary_email`, `fname`, `fcontact`, `femail`, `foccupation`, `mname`, `mcontact`, `memail`, `moccupation`, `gname`, `gcontact`, `gemail`, `grelation`, `credential_email`, `credential_password`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'josnytech-solution-8c', 'SBP0001', '0720871499', NULL, 'schoolbestms@gmail.com', 'Dummy Parent', '0714730671', 'schoolbestms@gmail.com', NULL, NULL, '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0001@schoolbest.co.ke', '98765432', 1, 1, '2021-11-15 09:12:55', 1, '2021-11-15 09:12:55', NULL, NULL),
(4, 'cplyl-cy1se-i7xxq-xupmb-w0qqc-6drf', 'SBP0002', '0720871499', NULL, 'schoolbestms@gmail.com', 'Benjamin Mwangi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Eva Mukami Mwangi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0010@schoolbest.co.ke', '52883193', 1, 1, '2021-12-10 17:29:38', 1, '2021-12-10 17:29:38', NULL, NULL),
(5, 'uqv2l-njxut-ezmpo-qqmwo-autxi-9bev', 'SBP0003', '0720871499', NULL, 'schoolbestms@gmail.com', 'Samson Njau Wanderi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Eunice Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0011@schoolbest.co.ke', '52450538', 1, 1, '2021-12-10 17:30:01', 1, '2021-12-10 17:30:01', NULL, NULL),
(6, 'vkdnj-znirc-senyl-vmqqb-oqdmw-41pu', 'SBP0004', '0720871499', NULL, 'schoolbestms@gmail.com', 'Paul Kimani Nyutu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Janet Wangechi Kimani', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0012@schoolbest.co.ke', '89999537', 1, 1, '2021-12-10 17:30:42', 1, '2021-12-10 17:30:42', NULL, NULL),
(7, 'hy29j-njtdq-tuthm-ucxaa-pws0s-cis7', 'SBP0005', '0720871499', NULL, 'schoolbestms@gmail.com', 'Peter Njenga', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mary Nduta', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0013@schoolbest.co.ke', '84849556', 1, 1, '2021-12-10 17:31:21', 1, '2021-12-10 17:31:21', NULL, NULL),
(8, 'zjlip-mtiyv-vmbtr-zgtrn-xtg54-aify', 'SBP0006', '0720871499', NULL, 'schoolbestms@gmail.com', 'Eric Oyondi Ontomwa', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mary Nyasukuta', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0014@schoolbest.co.ke', '52242516', 1, 1, '2021-12-10 17:32:16', 1, '2021-12-10 17:32:16', NULL, NULL),
(9, 'f6rvg-p0ulf-j1awd-atdnq-7x0ck-yybn', 'SBP0007', '0720871499', NULL, 'schoolbestms@gmail.com', 'Fredrick Wainaina Njunge', '0714730671', 'schoolbestms@gmail.com', NULL, 'Lilian Wanjiku Wainaina', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0015@schoolbest.co.ke', '23335121', 1, 1, '2021-12-10 17:32:53', 1, '2021-12-10 17:32:53', NULL, NULL),
(10, 'na0rc-pvunu-3tla4-qm5mq-iuhok-u7gg', 'SBP0008', '0720871499', NULL, 'schoolbestms@gmail.com', 'Alex Kungu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Veronicah Wangui Kungu', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0016@schoolbest.co.ke', '32312620', 1, 1, '2021-12-10 17:33:28', 1, '2021-12-10 17:33:28', NULL, NULL),
(11, '7mzsj-bwem4-6i3oc-kzzfg-fabi4-6xqf', 'SBP0009', '0720871499', NULL, 'schoolbestms@gmail.com', 'Joseph Gathogo Ndirangu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Agnes Ndirangu', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0017@schoolbest.co.ke', '74624756', 1, 1, '2021-12-10 17:33:56', 1, '2021-12-10 17:33:56', NULL, NULL),
(12, 'q7dcp-pjoim-khk0l-jijyr-mc5vo-kuv9', 'SBP0010', '0720871499', NULL, 'schoolbestms@gmail.com', 'Kenneth Njoroge', '0714730671', 'schoolbestms@gmail.com', NULL, 'Hellen Njambi Maina', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0018@schoolbest.co.ke', '28293378', 1, 1, '2021-12-10 17:34:24', 1, '2021-12-10 17:34:24', NULL, NULL),
(13, '0vj5x-a6ik3-0avt6-kk56s-g5i1i-twnz', 'SBP0011', '0720871499', NULL, 'schoolbestms@gmail.com', 'John Nganga Njenga', '0714730671', 'schoolbestms@gmail.com', NULL, 'Lucia Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0019@schoolbest.co.ke', '29685466', 1, 1, '2021-12-10 17:34:49', 1, '2021-12-10 17:34:49', NULL, NULL),
(14, 'nvuc1-ngoyp-ftmdy-0bpwt-sdqdy-y5ou', 'SBP0012', '0720871499', NULL, 'schoolbestms@gmail.com', 'Benard Waititu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Nancy Wanja', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0020@schoolbest.co.ke', '23992779', 1, 1, '2021-12-10 17:35:32', 1, '2021-12-10 17:35:32', NULL, NULL),
(15, 'taj7c-lg24s-6difp-0yxdd-ddcgd-dcb9', 'SBP0013', '0720871499', NULL, 'schoolbestms@gmail.com', 'Zedekiah Muhia', '0714730671', 'schoolbestms@gmail.com', NULL, 'Felistus Wanja', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0021@schoolbest.co.ke', '82427684', 1, 1, '2021-12-10 17:36:06', 1, '2021-12-10 17:36:06', NULL, NULL),
(16, 'fmurg-8crsf-kxu9h-otdij-dpohk-pzxj', 'SBP0014', '0720871499', NULL, 'schoolbestms@gmail.com', 'Thomas Thande', '0714730671', 'schoolbestms@gmail.com', NULL, 'Maria Wema', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0022@schoolbest.co.ke', '97392286', 1, 1, '2021-12-10 17:36:27', 1, '2021-12-10 17:36:27', NULL, NULL),
(17, 'cihrk-sbine-02ulc-5qjvy-kqnnf-kkrs', 'SBP0015', '0720871499', NULL, 'schoolbestms@gmail.com', 'Washington Onyango Oloo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Marion Achieng Onyango', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0023@schoolbest.co.ke', '94668821', 1, 1, '2021-12-10 17:37:02', 1, '2021-12-10 17:37:02', NULL, NULL),
(18, 'kw6p6-an56u-pf2af-wvjxp-5xqkq-th3f', 'SBP0016', '0720871499', NULL, 'schoolbestms@gmail.com', 'Ephantus Njeru', '0714730671', 'schoolbestms@gmail.com', NULL, 'Joyce Wambui Njeru', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0024@schoolbest.co.ke', '41167255', 1, 1, '2021-12-10 18:10:37', 1, '2021-12-10 18:10:37', NULL, NULL),
(19, 'v8btb-a09da-obghh-kq9x7-l4kcv-m9ul', 'SBP0017', '0720871499', NULL, 'schoolbestms@gmail.com', 'Meshack Otieno Oburu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Dorcas Chitau', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0025@schoolbest.co.ke', '31968295', 1, 1, '2021-12-10 18:11:14', 1, '2021-12-10 18:11:14', NULL, NULL),
(20, 'tjldd-r7dtn-ruuby-mdlro-yl2b9-kj1o', 'SBP0018', '0720871499', NULL, 'schoolbestms@gmail.com', 'Eric Njagi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Jacinta Waithira', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0026@schoolbest.co.ke', '15043825', 1, 1, '2021-12-10 18:16:52', 1, '2021-12-10 18:16:52', NULL, NULL),
(21, 'pr8sj-f2jzi-hjllr-aqcaj-xrz3a-7tso', 'SBP0019', '0720871499', NULL, 'schoolbestms@gmail.com', 'Moses Wanjohi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Elizabeth  Wanjira Wanjohi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0027@schoolbest.co.ke', '25469549', 1, 1, '2021-12-10 18:12:13', 1, '2021-12-10 18:12:13', NULL, NULL),
(22, 'j40a6-skc86-mebee-pu76q-fruwd-1i0j', 'SBP0020', '0720871499', NULL, 'schoolbestms@gmail.com', 'Simeon Branson', '0714730671', 'schoolbestms@gmail.com', NULL, 'Lydia Bethany', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0028@schoolbest.co.ke', '94809086', 1, 1, '2021-12-10 18:12:50', 1, '2021-12-10 18:12:50', NULL, NULL),
(23, 'j40a6-skc86-mebee-pu76q-fruwd-f101', 'SBP0021', '0720871499', NULL, 'schoolbestms@gmail.com', 'Francis Nderitu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Leah Muthoni', '0720871499', 'info@schoolbest.co.ke', 'WORK', NULL, NULL, NULL, NULL, 'ssp0029@schoolbest.co.ke', '45753052', 1, 1, '2021-12-10 18:13:28', 1, '2021-12-10 18:13:28', NULL, NULL),
(24, 'j40a6-skc86-mebee-pu76q-fruwd-f102', 'SBP0022', '0720871499', NULL, 'schoolbestms@gmail.com', 'Benjamin Macharia', '0714730671', 'schoolbestms@gmail.com', NULL, 'Tabitha Wangari', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0030@schoolbest.co.ke', '39456051', 1, 1, '2021-12-10 18:14:08', 1, '2021-12-10 18:14:08', 0, '0000-00-00 00:00:00'),
(25, 'j40a6-skc86-mebee-pu76q-fruwd-f103', 'SBP0023', '0720871499', NULL, 'schoolbestms@gmail.com', 'Josphat Mukuni', '0714730671', 'schoolbestms@gmail.com', NULL, 'Phyllis Nyambura', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0031@schoolbest.co.ke', '60491366', 1, 1, '2021-12-10 18:14:47', 1, '2021-12-10 18:14:47', NULL, NULL),
(26, 'j40a6-skc86-mebee-pu76q-fruwd-f104', 'SBP0024', '0720871499', NULL, 'schoolbestms@gmail.com', 'Patrick Gatwe', '0714730671', 'schoolbestms@gmail.com', NULL, 'Susan Gatwe', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0032@schoolbest.co.ke', '49743576', 1, 1, '2021-12-10 18:15:44', 1, '2021-12-10 18:15:44', NULL, NULL),
(27, 'j40a6-skc86-mebee-pu76q-fruwd-f105', 'SBP0025', '0720871499', NULL, 'schoolbestms@gmail.com', 'Kinyua Wa Kimani', '0714730671', 'schoolbestms@gmail.com', NULL, 'Juliana Muthaka', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0033@schoolbest.co.ke', '69157284', 1, 1, '2021-12-10 18:16:08', 1, '2021-12-10 18:16:08', NULL, NULL),
(28, 'j40a6-skc86-mebee-pu76q-fruwd-f106', 'SBP0026', '0720871499', NULL, 'schoolbestms@gmail.com', 'Jack Muriu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Grace Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0034@schoolbest.co.ke', '26982771', 1, 1, '2021-12-10 18:17:35', 1, '2021-12-10 18:17:35', NULL, NULL),
(29, 'j40a6-skc86-mebee-pu76q-fruwd-f107', 'SBP0027', '0720871499', NULL, 'schoolbestms@gmail.com', 'Danson Mureithi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Naomi Wambere', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0035@schoolbest.co.ke', '82170719', 1, 1, '2021-12-10 18:18:37', 1, '2021-12-10 18:18:37', NULL, NULL),
(30, 'j40a6-skc86-mebee-pu76q-fruwd-f108', 'SBP0028', '0720871499', NULL, 'schoolbestms@gmail.com', 'John Kipkoech', '0714730671', 'schoolbestms@gmail.com', NULL, 'Monalisa Chirchir', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0036@schoolbest.co.ke', '48892887', 1, 1, '2021-12-10 18:19:29', 1, '2021-12-10 18:19:29', NULL, NULL),
(31, 'j40a6-skc86-mebee-pu76q-fruwd-f109', 'SBP0029', '0720871499', NULL, 'schoolbestms@gmail.com', 'James Wafula', '0714730671', 'schoolbestms@gmail.com', NULL, 'Ruth Namesi', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0037@schoolbest.co.ke', '69323262', 1, 1, '2021-12-10 18:20:12', 1, '2021-12-10 18:20:12', NULL, NULL),
(32, 'j40a6-skc86-mebee-pu76q-fruwd-f110', 'SBP0030', '0720871499', NULL, 'schoolbestms@gmail.com', 'Johnson Onyancha', '0714730671', 'schoolbestms@gmail.com', NULL, 'Nancy Kemunto', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0038@schoolbest.co.ke', '60790723', 1, 1, '2021-12-10 18:20:57', 1, '2021-12-10 18:20:57', NULL, NULL),
(33, 'j40a6-skc86-mebee-pu76q-fruwd-f111', 'SBP0031', '0720871499', NULL, 'schoolbestms@gmail.com', 'Michael Mwiti', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mitchelle Mukami', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0039@schoolbest.co.ke', '25710748', 1, 1, '2021-12-10 18:22:41', 1, '2021-12-10 18:22:41', NULL, NULL),
(34, 'j40a6-skc86-mebee-pu76q-fruwd-f112', 'SBP0032', '0720871499', NULL, 'schoolbestms@gmail.com', 'Moses Gichuhi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Trizah Wanjiku', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0040@schoolbest.co.ke', '28555509', 1, 1, '2021-12-10 18:23:32', 1, '2021-12-10 18:23:32', NULL, NULL),
(35, 'j40a6-skc86-mebee-pu76q-fruwd-f115', 'SBP0033', '0720871499', NULL, 'schoolbestms@gmail.com', 'Benson Mungai', '0714730671', 'schoolbestms@gmail.com', NULL, 'Julia Mungai', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0041@schoolbest.co.ke', '39780393', 1, 1, '2021-12-10 18:28:31', 1, '2021-12-10 18:28:31', NULL, NULL),
(38, 'j40a6-skc86-mebee-pu76q-fruwd-f118', 'SBP0034', '0720871499', NULL, 'schoolbestms@gmail.com', 'Anderson Chege', '0714730671', 'schoolbestms@gmail.com', NULL, 'Phoebe Njeri', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0044@schoolbest.co.ke', '21973958', 1, 1, '2021-12-10 18:42:41', 1, '2021-12-10 18:42:41', NULL, NULL),
(39, 'j40a6-skc86-mebee-pu76q-fruwd-f119', 'SBP0035', '0720871499', NULL, 'schoolbestms@gmail.com', 'Stephen Muchene', '0714730671', 'schoolbestms@gmail.com', NULL, 'Jane Wangechi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0045@schoolbest.co.ke', '19712824', 1, 1, '2021-12-10 18:42:22', 1, '2021-12-10 18:42:22', NULL, NULL),
(40, 'j40a6-skc86-mebee-pu76q-fruwd-f120', 'SBP0036', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Linet Osoro', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0046@schoolbest.co.ke', '20213102', 1, 1, '2021-12-10 18:43:08', 1, '2021-12-10 18:43:08', NULL, NULL),
(41, 'j40a6-skc86-mebee-pu76q-fruwd-f121', 'SBP0037', '0720871499', NULL, 'schoolbestms@gmail.com', 'Edward Odiwour', '0714730671', 'schoolbestms@gmail.com', NULL, 'Kate Achieng', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0047@schoolbest.co.ke', '52917343', 1, 1, '2021-12-10 18:43:37', 1, '2021-12-10 18:43:37', NULL, NULL),
(42, 'j40a6-skc86-mebee-pu76q-fruwd-f122', 'SBP0038', '0720871499', NULL, 'schoolbestms@gmail.com', 'Peterson Gicharu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Vanessa Kate', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0048@schoolbest.co.ke', '75964570', 1, 1, '2021-12-10 18:44:27', 1, '2021-12-10 18:44:27', NULL, NULL),
(43, 'j40a6-skc86-mebee-pu76q-fruwd-f123', 'SBP0039', '0720871499', NULL, 'schoolbestms@gmail.com', 'Josh Munene', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mary Wairimu Munene', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0049@schoolbest.co.ke', '39865761', 1, 1, '2021-12-10 18:45:01', 1, '2021-12-10 18:45:01', NULL, NULL),
(45, 'j40a6-skc86-mebee-pu76q-fruwd-f125', 'SBP0040', '0720871499', NULL, 'schoolbestms@gmail.com', 'William Magoha', '0714730671', 'schoolbestms@gmail.com', NULL, 'Felistus Nyakundi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0051@schoolbest.co.ke', '67257238', 1, 1, '2021-12-10 18:46:54', 1, '2021-12-10 18:46:54', NULL, NULL),
(46, 'j40a6-skc86-mebee-pu76q-fruwd-f126', 'SBP0041', '0720871499', NULL, 'schoolbestms@gmail.com', 'Juma Mswahili', '0714730671', 'schoolbestms@gmail.com', NULL, 'Auma Fatma', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0052@schoolbest.co.ke', '12311221', 1, 1, '2021-12-10 18:58:16', 1, '2021-12-10 18:58:16', NULL, NULL),
(47, 'j40a6-skc86-mebee-pu76q-fruwd-f127', 'SBP0042', '0720871499', NULL, 'schoolbestms@gmail.com', 'Bravyn Obiero Obama', '0714730671', 'schoolbestms@gmail.com', NULL, 'Bernice Obiero', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0053@schoolbest.co.ke', '19328704', 1, 1, '2021-12-10 18:59:04', 1, '2021-12-10 18:59:04', NULL, NULL),
(48, 'j40a6-skc86-mebee-pu76q-fruwd-f128', 'SBP0043', '0720871499', NULL, 'schoolbestms@gmail.com', 'Sam Mwenda', '0714730671', 'schoolbestms@gmail.com', NULL, 'Maryann Mwenda', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0054@schoolbest.co.ke', '29257221', 1, 1, '2021-12-10 19:00:56', 1, '2021-12-10 19:00:56', NULL, NULL),
(49, 'j40a6-skc86-mebee-pu76q-fruwd-f129', 'SBP0044', '0720871499', NULL, 'schoolbestms@gmail.com', 'Raymond Muchunu', '0714730671', 'schoolbestms@gmail.com', NULL, NULL, '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0055@schoolbest.co.ke', '95279313', 1, 1, '2021-12-10 19:01:33', 1, '2021-12-10 19:01:33', NULL, NULL),
(50, 'j40a6-skc86-mebee-pu76q-fruwd-f130', 'SBP0045', '0720871499', NULL, 'schoolbestms@gmail.com', 'Francis Kuria Mwangi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Lucy Wanjeri Kuria', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0056@schoolbest.co.ke', '52276564', 1, 1, '2021-12-10 19:02:22', 1, '2021-12-10 19:02:22', NULL, NULL),
(51, 'j40a6-skc86-mebee-pu76q-fruwd-f131', 'SBP0046', '0720871499', NULL, 'schoolbestms@gmail.com', 'Richard Monda', '0714730671', 'schoolbestms@gmail.com', NULL, 'Racheal Nambi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0057@schoolbest.co.ke', '21119345', 1, 1, '2021-12-10 19:04:02', 1, '2021-12-10 19:04:02', NULL, NULL),
(52, 'j40a6-skc86-mebee-pu76q-fruwd-f132', 'SBP0047', '0720871499', NULL, 'schoolbestms@gmail.com', 'Joseph Gitau Wachira', '0714730671', 'schoolbestms@gmail.com', NULL, 'Tabitha Njoki Gitau', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0058@schoolbest.co.ke', '53334707', 1, 1, '2021-12-10 19:05:01', 1, '2021-12-10 19:05:01', NULL, NULL),
(53, 'j40a6-skc86-mebee-pu76q-fruwd-f133', 'SBP0048', '0720871499', NULL, 'schoolbestms@gmail.com', 'George Muriuki', '0714730671', 'schoolbestms@gmail.com', NULL, 'Betty Mulela', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0059@schoolbest.co.ke', '68434022', 1, 1, '2021-12-10 19:05:28', 1, '2021-12-10 19:05:28', NULL, NULL),
(54, 'j40a6-skc86-mebee-pu76q-fruwd-f134', 'SBP0049', NULL, NULL, NULL, NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Elizabeth Muteria', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0060@schoolbest.co.ke', '16529481', 1, 1, '2021-12-10 19:11:10', 1, '2021-12-10 19:11:10', NULL, NULL),
(55, 'j40a6-skc86-mebee-pu76q-fruwd-f135', 'SBP0050', '0720871499', NULL, 'schoolbestms@gmail.com', 'John Obara', '0714730671', 'schoolbestms@gmail.com', NULL, 'Naomi Obara', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0061@schoolbest.co.ke', '26345413', 1, 1, '2021-12-10 19:11:32', 1, '2021-12-10 19:11:32', NULL, NULL),
(56, 'j40a6-skc86-mebee-pu76q-fruwd-f136', 'SBP0051', '0720871499', NULL, 'schoolbestms@gmail.com', 'Sospeter Osinde', '0714730671', 'schoolbestms@gmail.com', NULL, 'Susan Nyakich', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0062@schoolbest.co.ke', '11478216', 1, 1, '2021-12-10 19:13:09', 1, '2021-12-10 19:13:09', NULL, NULL),
(57, 'j40a6-skc86-mebee-pu76q-fruwd-f137', 'SBP0052', '0720871499', NULL, 'schoolbestms@gmail.com', 'Anorld Wafula Shiundu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mary Wema', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0063@schoolbest.co.ke', '81509984', 1, 1, '2021-12-10 19:13:49', 1, '2021-12-10 19:13:49', NULL, NULL),
(58, 'j40a6-skc86-mebee-pu76q-fruwd-f138', 'SBP0053', '0720871499', NULL, 'schoolbestms@gmail.com', 'John Njagi  Kimemia', '0714730671', 'schoolbestms@gmail.com', NULL, 'Josphine Njue', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0064@schoolbest.co.ke', '69495548', 1, 1, '2021-12-10 19:16:05', 1, '2021-12-10 19:16:05', NULL, NULL),
(59, 'j40a6-skc86-mebee-pu76q-fruwd-f139', 'SBP0054', '0720871499', NULL, 'schoolbestms@gmail.com', 'David Njenga Karugu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Jackline Wangui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0065@schoolbest.co.ke', '86239576', 1, 1, '2021-12-10 19:21:01', 1, '2021-12-10 19:21:01', NULL, NULL),
(60, 'j40a6-skc86-mebee-pu76q-fruwd-f140', 'SBP0055', '0720871499', NULL, 'schoolbestms@gmail.com', 'Peter Mwaniki', '0714730671', 'schoolbestms@gmail.com', NULL, 'Hannah Wanjiku', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0066@schoolbest.co.ke', '56236695', 1, 1, '2022-02-24 12:40:22', 1, '2022-02-24 12:40:22', NULL, NULL),
(61, 'j40a6-skc86-mebee-pu76q-fruwd-f141', 'SBP0056', '0720871499', NULL, 'schoolbestms@gmail.com', 'James Maina Kamenju', '0714730671', 'schoolbestms@gmail.com', NULL, 'Sophia Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0067@schoolbest.co.ke', '72930324', 1, 1, '2022-02-24 12:40:57', 1, '2022-02-24 12:40:57', NULL, NULL),
(62, 'j40a6-skc86-mebee-pu76q-fruwd-f142', 'SBP0057', '0720871499', NULL, 'schoolbestms@gmail.com', 'Lazarus Wainaina', '0714730671', 'schoolbestms@gmail.com', NULL, 'Winnie Wangechi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0068@schoolbest.co.ke', '60309188', 1, 1, '2022-02-24 12:41:30', 1, '2022-02-24 12:41:30', NULL, NULL),
(63, 'j40a6-skc86-mebee-pu76q-fruwd-f143', 'SBP0058', '0720871499', NULL, 'schoolbestms@gmail.com', 'Moses Kasolo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mariam Mila', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0069@schoolbest.co.ke', '76809582', 1, 1, '2022-02-24 12:42:10', 1, '2022-02-24 12:42:10', NULL, NULL),
(64, 'j40a6-skc86-mebee-pu76q-fruwd-f144', 'SBP0059', '0720871499', NULL, 'schoolbestms@gmail.com', 'Onesmus Mogaka', '0714730671', 'schoolbestms@gmail.com', NULL, 'Susan Ogake', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0070@schoolbest.co.ke', '51195948', 1, 1, '2022-02-24 12:42:43', 1, '2022-02-24 12:42:43', NULL, NULL),
(65, 'j40a6-skc86-mebee-pu76q-fruwd-f145', 'SBP0060', '0720871499', NULL, 'schoolbestms@gmail.com', 'Johnson Muchiri', '0714730671', 'schoolbestms@gmail.com', NULL, 'Veronica Wangui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0071@schoolbest.co.ke', '45201450', 1, 1, '2022-02-24 12:43:13', 1, '2022-02-24 12:43:13', NULL, NULL),
(66, 'j40a6-skc86-mebee-pu76q-fruwd-f146', 'SBP0061', '0720871499', NULL, 'schoolbestms@gmail.com', 'Kimani Wa Chege', '0714730671', 'schoolbestms@gmail.com', NULL, 'Dorcas Watheru', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0072@schoolbest.co.ke', '60326981', 1, 1, '2022-02-24 12:43:44', 1, '2022-02-24 12:43:44', NULL, NULL),
(68, 'j40a6-skc86-mebee-pu76q-fruwd-f148', 'SBP0062', '0720871499', NULL, 'schoolbestms@gmail.com', 'Ephantus Shiundu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Phyllis Malelu', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0074@schoolbest.co.ke', '47293725', 1, 1, '2022-02-24 12:44:23', 1, '2022-02-24 12:44:23', NULL, NULL),
(69, 'j40a6-skc86-mebee-pu76q-fruwd-f149', 'SBP0063', '0720871499', NULL, 'schoolbestms@gmail.com', 'Joseph Mwangi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Gladys Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0075@schoolbest.co.ke', '38307226', 1, 1, '2022-02-24 12:44:50', 1, '2022-02-24 12:44:50', NULL, NULL),
(70, 'j40a6-skc86-mebee-pu76q-fruwd-f150', 'SBP0064', '0720871499', NULL, 'schoolbestms@gmail.com', 'Daniel Gitahi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Rose Mbechai', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0076@schoolbest.co.ke', '48195755', 1, 1, '2022-02-24 12:46:13', 1, '2022-02-24 12:46:13', NULL, NULL),
(71, 'j40a6-skc86-mebee-pu76q-fruwd-f151', 'SBP0065', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Faith Njeri', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0077@schoolbest.co.ke', '71526760', 1, 1, '2022-02-24 12:46:45', 1, '2022-02-24 12:46:45', NULL, NULL),
(72, 'j40a6-skc86-mebee-pu76q-fruwd-f152', 'SBP0066', '0720871499', NULL, 'schoolbestms@gmail.com', 'Mark Kimani', '0714730671', 'schoolbestms@gmail.com', NULL, 'Jane Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0078@schoolbest.co.ke', '26374509', 1, 1, '2022-02-24 12:52:07', 1, '2022-02-24 12:52:07', NULL, NULL),
(73, 'j40a6-skc86-mebee-pu76q-fruwd-f153', 'SBP0067', '0720871499', NULL, 'schoolbestms@gmail.com', 'Michael Githae', '0714730671', 'schoolbestms@gmail.com', NULL, 'Pauline Wanjiru', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0079@schoolbest.co.ke', '94309387', 1, 1, '2022-02-24 12:52:43', 1, '2022-02-24 12:52:43', NULL, NULL),
(74, 'j40a6-skc86-mebee-pu76q-fruwd-f154', 'SBP0068', '0720871499', NULL, 'schoolbestms@gmail.com', 'Jefferson Kiptoo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Jackline Jepkemboi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0080@schoolbest.co.ke', '39941789', 1, 1, '2022-02-24 12:53:33', 1, '2022-02-24 12:53:33', NULL, NULL),
(75, 'j40a6-skc86-mebee-pu76q-fruwd-f156', 'SBP0069', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Joyce Waredi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0081@schoolbest.co.ke', '86256093', 1, 1, '2022-02-24 12:54:12', 1, '2022-02-24 12:54:12', NULL, NULL),
(76, 'j40a6-skc86-mebee-pu76q-fruwd-f157', 'SBP0070', '0720871499', NULL, 'schoolbestms@gmail.com', 'Ian Kiprono', '0714730671', 'schoolbestms@gmail.com', NULL, 'Felistus Chelangat', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0082@schoolbest.co.ke', '25489885', 1, 1, '2022-02-24 12:55:27', 1, '2022-02-24 12:55:27', NULL, NULL),
(77, 'j40a6-skc86-mebee-pu76q-fruwd-f158', 'SBP0071', '0720871499', NULL, 'schoolbestms@gmail.com', 'James Wachira Nyutu', '0714730671', 'schoolbestms@gmail.com', NULL, 'Magdalene Nyambura', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0083@schoolbest.co.ke', '86033853', 1, 1, '2022-02-24 12:56:07', 1, '2022-02-24 12:56:07', NULL, NULL),
(78, 'j40a6-skc86-mebee-pu76q-fruwd-f159', 'SBP0072', '0720871499', NULL, 'schoolbestms@gmail.com', 'Jacob Munyendo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mary Nafula', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0084@schoolbest.co.ke', '36617127', 1, 1, '2022-02-24 12:57:26', 1, '2022-02-24 12:57:26', NULL, NULL),
(79, 'j40a6-skc86-mebee-pu76q-fruwd-f160', 'SBP0073', '0720871499', NULL, 'schoolbestms@gmail.com', 'Henry Njunga', '0714730671', 'schoolbestms@gmail.com', NULL, 'Beth Mugo', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0085@schoolbest.co.ke', '44639584', 1, 1, '2022-02-24 12:58:03', 1, '2022-02-24 12:58:03', NULL, NULL),
(80, 'j40a6-skc86-mebee-pu76q-fruwd-f161', 'SBP0074', '0720871499', NULL, 'schoolbestms@gmail.com', 'Njenga Karuga', '0714730671', 'schoolbestms@gmail.com', NULL, 'Catherine Njambi', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0086@schoolbest.co.ke', '55680601', 1, 1, '2022-02-24 12:58:38', 1, '2022-02-24 12:58:38', NULL, NULL),
(81, 'j40a6-skc86-mebee-pu76q-fruwd-f162', 'SBP0075', '0720871499', NULL, 'schoolbestms@gmail.com', 'Josphat Mundia', '0714730671', 'schoolbestms@gmail.com', NULL, 'Fridah Mundia', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0087@schoolbest.co.ke', '49241927', 1, 1, '2022-02-24 12:59:26', 1, '2022-02-24 12:59:26', NULL, NULL),
(82, 'j40a6-skc86-mebee-pu76q-fruwd-f163', 'SBP0076', '0720871499', NULL, 'schoolbestms@gmail.com', 'Francis Muhindo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Theresah Wanda', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0088@schoolbest.co.ke', '83958166', 1, 1, '2022-02-24 12:59:59', 1, '2022-02-24 12:59:59', NULL, NULL),
(83, 'j40a6-skc86-mebee-pu76q-fruwd-f164', 'SBP0077', '0720871499', NULL, 'schoolbestms@gmail.com', 'Moses Agunda', '0714730671', 'schoolbestms@gmail.com', NULL, 'Fransiscah Achieng', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0089@schoolbest.co.ke', '87986320', 1, 1, '2022-02-24 13:00:49', 1, '2022-02-24 13:00:49', NULL, NULL),
(84, 'j40a6-skc86-mebee-pu76q-fruwd-f165', 'SBP0078', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Millicent Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0090@schoolbest.co.ke', '37432878', 1, 1, '2022-02-24 13:01:03', 1, '2022-02-24 13:01:03', NULL, NULL),
(86, 'j40a6-skc86-mebee-pu76q-fruwd-f167', 'SBP0079', '0720871499', NULL, 'schoolbestms@gmail.com', 'Chris Wekesa', '0714730671', 'schoolbestms@gmail.com', NULL, 'Janet Nekesa', '0720871499', 'info@schoolbest.co.ke', NULL, 'Siraka Mwonjoru Kinyua', NULL, NULL, NULL, 'ssp0092@schoolbest.co.ke', '87564489', 1, 1, '2022-02-24 13:03:03', 1, '2022-02-24 13:03:03', NULL, NULL),
(87, 'j40a6-skc86-mebee-pu76q-fruwd-f168', 'SBP0080', '0720871499', NULL, 'schoolbestms@gmail.com', 'Samson Suguti', '0714730671', 'schoolbestms@gmail.com', NULL, 'Millicent Adhiambo', '0720871499', 'info@schoolbest.co.ke', NULL, 'ERIC MATHAI KIHETHU', NULL, NULL, NULL, 'ssp0093@schoolbest.co.ke', '48282358', 1, 1, '2022-02-24 13:04:27', 1, '2022-02-24 13:04:27', NULL, NULL),
(88, 'j40a6-skc86-mebee-pu76q-fruwd-f169', 'SBP0081', '0720871499', NULL, 'schoolbestms@gmail.com', 'Edward Muchina', '0714730671', 'schoolbestms@gmail.com', NULL, NULL, '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0094@schoolbest.co.ke', '97300870', 1, 1, '2022-02-24 13:04:56', 1, '2022-02-24 13:04:56', NULL, NULL),
(89, 'j40a6-skc86-mebee-pu76q-fruwd-f170', 'SBP0082', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Esther Okumu', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0095@schoolbest.co.ke', '84316071', 1, 1, '2022-02-24 13:05:09', 1, '2022-02-24 13:05:09', NULL, NULL),
(90, 'j40a6-skc86-mebee-pu76q-fruwd-f171', 'SBP0083', '0720871499', NULL, 'schoolbestms@gmail.com', 'Cleophas Onyango', '0714730671', 'schoolbestms@gmail.com', NULL, 'Kate Onyango', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0096@schoolbest.co.ke', '61088682', 1, 1, '2022-02-24 13:05:47', 1, '2022-02-24 13:05:47', NULL, NULL),
(91, 'j40a6-skc86-mebee-pu76q-fruwd-f172', 'SBP0084', '0720871499', NULL, 'schoolbestms@gmail.com', 'Felix Musyoka', '0714730671', 'schoolbestms@gmail.com', NULL, 'NANCY WANGECI ', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0097@schoolbest.co.ke', '41336026', 1, 1, '2022-02-24 13:06:07', 1, '2022-02-24 13:06:07', NULL, NULL),
(92, 'j40a6-skc86-mebee-pu76q-fruwd-f173', 'SBP0085', '0720871499', NULL, 'schoolbestms@gmail.com', 'Stephen Ogunda', '0714730671', 'schoolbestms@gmail.com', NULL, 'Pamela Achieng', '0720871499', 'info@schoolbest.co.ke', NULL, 'MARK HENERY AGUNDA', NULL, NULL, NULL, 'ssp0098@schoolbest.co.ke', '56382096', 1, 1, '2022-02-24 13:10:20', 1, '2022-02-24 13:10:20', NULL, NULL),
(93, 'j40a6-skc86-mebee-pu76q-fruwd-f174', 'SBP0086', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'CATHERINE NJERI', '0720871499', 'info@schoolbest.co.ke', NULL, 'NELLY NDUTA MURIITHI', NULL, NULL, NULL, 'ssp0099@schoolbest.co.ke', '67134478', 1, 1, '2021-11-15 09:12:57', 1, '2021-11-15 09:12:57', NULL, NULL),
(94, 'j40a6-skc86-mebee-pu76q-fruwd-f175', 'SBP0087', '0720871499', NULL, 'schoolbestms@gmail.com', 'Evans John', '0714730671', 'schoolbestms@gmail.com', NULL, 'Mary Magdalene', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0100@schoolbest.co.ke', '27084987', 1, 1, '2022-02-24 13:10:50', 1, '2022-02-24 13:10:50', NULL, NULL),
(95, 'j40a6-skc86-mebee-pu76q-fruwd-f176', 'SBP0088', '0720871499', NULL, 'schoolbestms@gmail.com', 'Josphat Mwangi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Joy Wanjiku', '0720871499', 'info@schoolbest.co.ke', NULL, 'AGGREY ASHIHUNDU ', NULL, NULL, NULL, 'ssp0101@schoolbest.co.ke', '33899518', 1, 1, '2022-02-24 13:11:25', 1, '2022-02-24 13:11:25', NULL, NULL),
(96, 'j40a6-skc86-mebee-pu76q-fruwd-f177', 'SBP0089', '0720871499', NULL, 'schoolbestms@gmail.com', 'Edwin Ogendo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Wilkister Ogendo', '0720871499', 'info@schoolbest.co.ke', NULL, 'JENNIFER NJARAMBA', NULL, NULL, NULL, 'ssp0102@schoolbest.co.ke', '41714179', 1, 1, '2022-02-24 13:12:07', 1, '2022-02-24 13:12:07', NULL, NULL),
(97, 'j40a6-skc86-mebee-pu76q-fruwd-f178', 'SBP0090', '0720871499', NULL, 'schoolbestms@gmail.com', 'Evans Kirumba', '0714730671', 'schoolbestms@gmail.com', NULL, 'Patricia Wambui Kirumba', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0103@schoolbest.co.ke', '97954104', 1, 1, '2022-02-24 13:13:16', 1, '2022-02-24 13:13:16', NULL, NULL),
(98, 'j40a6-skc86-mebee-pu76q-fruwd-f179', 'SBP0091', '0720871499', NULL, 'schoolbestms@gmail.com', 'Micah Mwaniki', '0714730671', 'schoolbestms@gmail.com', NULL, 'Doreen Wangechi', '0720871499', 'info@schoolbest.co.ke', NULL, ' DAN MUNYIRI', NULL, NULL, NULL, 'ssp0104@schoolbest.co.ke', '22995270', 1, 1, '2022-02-24 13:14:18', 1, '2022-02-24 13:14:18', NULL, NULL),
(99, 'j40a6-skc86-mebee-pu76q-fruwd-f180', 'SBP0092', '0720871499', NULL, 'schoolbestms@gmail.com', 'Richie Abuya', '0714730671', 'schoolbestms@gmail.com', NULL, 'Damaris Abuya', '0720871499', 'info@schoolbest.co.ke', NULL, 'RACHAEL NJERI', NULL, NULL, NULL, 'ssp0105@schoolbest.co.ke', '59748407', 1, 1, '2022-02-24 13:14:47', 1, '2022-02-24 13:14:47', NULL, NULL),
(100, 'j40a6-skc86-mebee-pu76q-fruwd-f181', 'SBP0093', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Vivianah Njambi', '0720871499', 'info@schoolbest.co.ke', NULL, 'CHARLES NDIRITU', NULL, NULL, NULL, 'ssp0106@schoolbest.co.ke', '41061233', 1, 1, '2022-02-24 13:15:07', 1, '2022-02-24 13:15:07', NULL, NULL),
(101, 'j40a6-skc86-mebee-pu76q-fruwd-f182', 'SBP0094', '0720871499', NULL, 'schoolbestms@gmail.com', 'Richard Muriuki', '0714730671', 'schoolbestms@gmail.com', NULL, 'Jane Waruguru', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0107@schoolbest.co.ke', '17970043', 1, 1, '2022-02-24 13:15:37', 1, '2022-02-24 13:15:37', NULL, NULL),
(102, 'j40a6-skc86-mebee-pu76q-fruwd-f183', 'SBP0095', '0720871499', NULL, 'schoolbestms@gmail.com', 'Samwel Kamau', '0714730671', 'schoolbestms@gmail.com', NULL, 'Rosemary Wangui', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0108@schoolbest.co.ke', '85347732', 1, 1, '2022-02-24 13:16:03', 1, '2022-02-24 13:16:03', NULL, NULL),
(104, 'j40a6-skc86-mebee-pu76q-fruwd-f186', 'SBP0096', '0720871499', NULL, 'schoolbestms@gmail.com', 'Peter Mugo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Faith Njeri', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0110@schoolbest.co.ke', '15499333', 1, 1, '2022-02-24 13:16:34', 1, '2022-02-24 13:16:34', NULL, NULL),
(105, 'j40a6-skc86-mebee-pu76q-fruwd-f187', 'SBP0097', '0720871499', NULL, 'schoolbestms@gmail.com', 'Andrew Wamiti', '0714730671', 'schoolbestms@gmail.com', NULL, 'Doreen Nyambura', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0111@schoolbest.co.ke', '58459827', 1, 1, '2022-02-24 13:17:04', 1, '2022-02-24 13:17:04', NULL, NULL),
(106, 'j40a6-skc86-mebee-pu76q-fruwd-f188', 'SBP0098', '0720871499', NULL, 'schoolbestms@gmail.com', 'Patrick Muchomba', '0714730671', 'schoolbestms@gmail.com', NULL, 'Fridah Muchomba', '0720871499', 'info@schoolbest.co.ke', NULL, 'Cyilbert Kiarie', NULL, NULL, NULL, 'ssp0112@schoolbest.co.ke', '28145079', 1, 1, '2022-02-24 13:17:37', 1, '2022-02-24 13:17:37', NULL, NULL),
(107, 'j40a6-skc86-mebee-pu76q-fruwd-f189', 'SBP0099', '0720871499', NULL, 'schoolbestms@gmail.com', 'Julius Kibe', '0714730671', 'schoolbestms@gmail.com', NULL, 'Grace Muthaka', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0113@schoolbest.co.ke', '75706123', 1, 1, '2022-02-24 13:18:01', 1, '2022-02-24 13:18:01', NULL, NULL),
(108, 'j40a6-skc86-mebee-pu76q-fruwd-f190', 'SBP0100', '0720871499', NULL, 'schoolbestms@gmail.com', 'Henry Waithaka', '0714730671', 'schoolbestms@gmail.com', NULL, 'Veronicah Watetu', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0114@schoolbest.co.ke', '78798614', 1, 1, '2022-02-24 13:18:40', 1, '2022-02-24 13:18:40', NULL, NULL),
(109, 'j40a6-skc86-mebee-pu76q-fruwd-f191', 'SBP0101', '0720871499', NULL, 'schoolbestms@gmail.com', 'Sammy Dereba', '0714730671', 'schoolbestms@gmail.com', NULL, 'Agnes Wamene', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0115@schoolbest.co.ke', '41688871', 1, 1, '2022-02-24 13:19:26', 1, '2022-02-24 13:19:26', NULL, NULL),
(110, 'j40a6-skc86-mebee-pu76q-fruwd-f192', 'SBP0102', '0720871499', NULL, 'schoolbestms@gmail.com', 'Timothy Gene', '0714730671', 'schoolbestms@gmail.com', NULL, 'Stellah Wanjiku', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0116@schoolbest.co.ke', '93922782', 1, 1, '2022-02-24 13:19:59', 1, '2022-02-24 13:19:59', NULL, NULL),
(111, 'j40a6-skc86-mebee-pu76q-fruwd-f193', 'SBP0103', '0720871499', NULL, 'schoolbestms@gmail.com', 'John Murihi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Winfrey Wangui', '0720871499', 'info@schoolbest.co.ke', NULL, 'Samuel Muriithi', NULL, NULL, NULL, 'ssp0117@schoolbest.co.ke', '54506677', 1, 1, '2022-02-24 13:20:24', 1, '2022-02-24 13:20:24', NULL, NULL),
(112, 'j40a6-skc86-mebee-pu76q-fruwd-f194', 'SBP0104', '0720871499', NULL, 'schoolbestms@gmail.com', 'Michael Wambua', '0714730671', 'schoolbestms@gmail.com', NULL, 'Millicent Mbithe', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0118@schoolbest.co.ke', '30837625', 1, 1, '2022-02-24 13:21:05', 1, '2022-02-24 13:21:05', NULL, NULL),
(113, 'j40a6-skc86-mebee-pu76q-fruwd-f195', 'SBP0105', '0720871499', NULL, 'schoolbestms@gmail.com', 'Charles Thuo', '0714730671', 'schoolbestms@gmail.com', NULL, 'Wanjiku Thuo', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0119@schoolbest.co.ke', '36107925', 1, 1, '2022-02-24 13:21:41', 1, '2022-02-24 13:21:41', NULL, NULL),
(115, 'j40a6-skc86-mebee-pu76q-fruwd-f197', 'SBP0106', '0720871499', NULL, 'schoolbestms@gmail.com', 'Tony Nafasi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Lydia Waithira', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0121@schoolbest.co.ke', '84833705', 1, 1, '2022-02-24 13:22:13', 1, '2022-02-24 13:22:13', NULL, NULL),
(116, 'j40a6-skc86-mebee-pu76q-fruwd-f198', 'SBP0107', '0720871499', NULL, 'schoolbestms@gmail.com', NULL, '0714730671', 'schoolbestms@gmail.com', NULL, 'Esther Nyathira', '0720871499', 'info@schoolbest.co.ke', NULL, NULL, NULL, NULL, NULL, 'ssp0122@schoolbest.co.ke', '78287928', 1, 1, '2022-02-24 13:22:36', 1, '2022-02-24 13:22:36', NULL, NULL),
(121, 'uqwjj-ylyxr-jeqnz-b91tc-aueoh-4aub', 'SBP0108', '0720871499', NULL, 'schoolbestms@gmail.com', 'Mohammed Osman', '0714730671', 'schoolbestms@gmail.com', NULL, 'Fatma Aisha', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0123@schoolbest.co.ke', '76884994', 1, 1, '2022-02-24 13:23:10', 1, '2022-02-24 13:23:10', NULL, NULL),
(122, 'zg63n-9lmvv-l21vx-xwauj-gmmr7-7ana', 'SBP0109', '0720871499', NULL, 'schoolbestms@gmail.com', 'Eunice Wambui', '0714730671', 'schoolbestms@gmail.com', NULL, 'Judy Wambui', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0124@schoolbest.co.ke', '55391847', 1, 2, '2022-02-24 13:23:30', 1, '2022-02-24 13:23:30', NULL, NULL),
(123, 's3tdc-jaho8-ljemu-clpep-sjvz5-0ors', 'SBP0110', '0720871499', NULL, 'schoolbestms@gmail.com', 'Wilberforce Wafula', '0714730671', 'schoolbestms@gmail.com', NULL, '', '0720871499', 'info@schoolbest.co.ke', NULL, 'Sharlene Waruiru Nduta', NULL, NULL, 'civil servant', 'ssp0125@schoolbest.co.ke', '42959753', 1, 2, '2022-02-24 13:24:43', 1, '2022-02-24 13:24:43', NULL, NULL),
(124, 'qkdru-k30sd-bzhrx-1okss-yjv3d-xyvd', 'SBP0111', '0720871499', NULL, 'schoolbestms@gmail.com', '', '0714730671', 'schoolbestms@gmail.com', NULL, 'Judy Wairimu Njoroge', '0720871499', 'info@schoolbest.co.ke', 'operations Admin', '', NULL, NULL, NULL, 'ssp0126@schoolbest.co.ke', '95608829', 1, 2, '2021-11-15 09:12:57', 1, '2021-11-15 09:12:57', NULL, NULL),
(125, 'onz0t-qojvs-vfxwg-tjziz-9mf3e-cod6', 'SBP0112', '0720871499', NULL, 'schoolbestms@gmail.com', 'Joseph Mwangi', '0714730671', 'schoolbestms@gmail.com', NULL, 'Lydia Mwangi', '0720871499', 'info@schoolbest.co.ke', 'CATERER', '', NULL, NULL, NULL, 'ssp0127@schoolbest.co.ke', '70628523', 1, 2, '2022-02-24 13:25:06', 1, '2022-02-24 13:25:06', NULL, NULL),
(126, 'w5cdk-p9b2y-50dzc-eo0oj-mwmfc-i5tr', 'SBP0113', '0720871499', NULL, 'schoolbestms@gmail.com', '', '0714730671', 'schoolbestms@gmail.com', NULL, 'Grace Wangui Kagai', '0720871499', 'info@schoolbest.co.ke', 'teacher', '', NULL, NULL, NULL, 'ssp0128@schoolbest.co.ke', '59711577', 1, 2, '2021-11-15 09:12:58', 1, '2021-11-15 09:12:58', NULL, NULL),
(127, 'akx7r-osiqb-fgjqj-sboxh-o1rjp-zaf2', 'SBP0114', '0720871499', NULL, 'schoolbestms@gmail.com', 'Ayub Musa', '0714730671', 'schoolbestms@gmail.com', 'business', 'Mariah Sahidi', '0720871499', 'info@schoolbest.co.ke', 'HOUSE KEEPING', '', NULL, NULL, NULL, 'ssp0129@schoolbest.co.ke', '71727014', 1, 2, '2022-02-24 13:25:42', 1, '2022-02-24 13:25:42', NULL, NULL),
(128, 'qmert-pcodx-zv4vr-dm5xu-cpiol-teg0', 'SBP0115', '0720871499', NULL, 'schoolbestms@gmail.com', 'Raphael Kimani', '0714730671', 'schoolbestms@gmail.com', 'business', 'Freshia Wambui', '0720871499', 'info@schoolbest.co.ke', 'business', '', NULL, NULL, NULL, 'ssp0130@schoolbest.co.ke', '76139563', 1, 2, '2022-02-24 13:27:08', 1, '2022-02-24 13:27:08', NULL, NULL),
(129, 'gddux-boxnx-xmcsb-qkzs1-zz7m8-1rqk', 'SBP0116', '0720871499', NULL, 'schoolbestms@gmail.com', 'Eustace Njau', '0714730671', 'schoolbestms@gmail.com', 'business', 'Caroline Mutuku', '0720871499', 'info@schoolbest.co.ke', 'business', '', NULL, NULL, NULL, 'ssp0131@schoolbest.co.ke', '45731939', 1, 2, '2022-02-24 13:27:34', 1, '2022-02-24 13:27:34', NULL, NULL),
(130, 'gs2ue-ywgve-2gpml-jwkkh-kpg3w-tggl', 'SBP0117', '0720871499', NULL, 'schoolbestms@gmail.com', 'James Nganga', '0714730671', 'schoolbestms@gmail.com', 'Businesswoman', 'Nancy Wanja', '0720871499', 'info@schoolbest.co.ke', 'TEACHER', '', NULL, NULL, NULL, 'ssp0132@schoolbest.co.ke', '90540843', 1, 2, '2022-02-24 13:28:17', 1, '2022-02-24 13:28:17', NULL, NULL),
(131, 'tlrxg-nw9ai-ekxcq-1ajib-hnybq-rinz', 'SBP0118', '0720871499', NULL, 'schoolbestms@gmail.com', 'Tilbia Owuor', '0714730671', 'schoolbestms@gmail.com', 'sales', 'Caroline Nyakech', '0720871499', 'info@schoolbest.co.ke', 'credit officer', '', NULL, NULL, NULL, 'ssp0133@schoolbest.co.ke', '22055985', 1, 2, '2022-02-24 13:28:50', 1, '2022-02-24 13:28:50', NULL, NULL),
(132, 'g5w6a-2vyp5-okcei-ul8ja-1xxkv-h6q9', 'SBP0119', '0720871499', NULL, 'schoolbestms@gmail.com', 'David Chege', '0714730671', 'schoolbestms@gmail.com', 'clinician', 'Maria Njeri', '0720871499', 'info@schoolbest.co.ke', 'sociologist', '', NULL, NULL, NULL, 'ssp0134@schoolbest.co.ke', '29303158', 1, 2, '2022-02-24 13:30:05', 1, '2022-02-24 13:30:05', NULL, NULL),
(133, 'fcyaf-r9jmu-jfth9-q0twp-j6lcv-qm19', 'SBP0120', '0720871499', NULL, 'schoolbestms@gmail.com', 'Valencia Muchina', '0714730671', 'schoolbestms@gmail.com', NULL, '', '0720871499', 'info@schoolbest.co.ke', NULL, '', NULL, NULL, NULL, 'ssp0135@schoolbest.co.ke', '39653000', 1, 2, '2022-02-24 13:30:18', 1, '2022-02-24 13:30:18', NULL, NULL),
(134, 'mt4fr-rzcmw-fmvox-czbsi-ggchv-w6le', 'SBP0121', '0714730671', '0720871499', 'schoolbestmss@gmail.com', 'Moses Kinyanjui', '0720871499', 'schoolbestmss@gmail.com', 'economist', 'Annie Wangui', '0714730671', 'infos@schoolbest.co.ke', 'business', '', NULL, NULL, NULL, 'ssp0136@schoolbest.co.ke', '36757631', 1, 2, '2022-02-24 13:30:50', 1, '2022-02-24 13:30:50', NULL, NULL),
(137, 'wsehe-mkw3i-9t517-y5fou-ppkiq-f2sj-20211115133456', 'SBP0122', '0714730671', '0713962189', 'josnytechsolution@gmail.com', 'Michael Muchene', '0713962189', 'josnytechsolution@gmail.com', 'Doctor', 'Veronicah Njoki', NULL, 'josnytechsolution@yahoo.com', 'Nurse', '', NULL, NULL, NULL, 'sbp0122@schoolbest.co.ke', '66633993', 1, 1, '2022-02-24 13:31:14', 1, '2022-02-24 13:31:14', NULL, NULL),
(138, 'bdpyj-m6ek5-kokk3-a4yf0-riinj-tmzv-20211201112134', 'SBP0123', '0714730671', '0720871499', NULL, 'Alex Muchiri', '0714730672', NULL, NULL, '', '0720871499', NULL, NULL, '', NULL, NULL, NULL, 'sbp0123@schoolbest.co.ke', '56426216', 1, 1, '2022-02-24 13:31:35', NULL, '2022-02-24 13:31:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('margaret@pleng.net', '$2y$10$siDdGrjYLazqrZJ1/sjKn.0mhucQQ/5YYg.jq3Iz0rH3H0HpGDez6', '2021-05-31 19:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_parameters`
--

CREATE TABLE `payroll_parameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payroll_parameters`
--

INSERT INTO `payroll_parameters` (`id`, `name`, `description`, `type`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'NHIF', 'National Health Insurance Fund', 'deduction', 1, '2021-07-26 21:38:44', NULL, '2021-07-26 21:38:44'),
(2, 'NSSF', 'National Social Security Fund', 'deduction', 1, '2021-07-26 21:49:40', NULL, '2021-07-26 21:49:40'),
(3, 'PAYE', 'Pay As You Earn (KRA)', 'deduction', 1, '2021-07-26 21:51:33', 1, '2022-03-23 22:12:03'),
(4, 'House Allowance', 'House Allowances', 'allowance', 1, '2021-07-26 21:54:26', 1, '2021-07-26 22:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `promotion_histories`
--

CREATE TABLE `promotion_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_from` bigint(20) UNSIGNED NOT NULL,
  `class_to` bigint(20) UNSIGNED NOT NULL,
  `from_session_id` bigint(20) UNSIGNED NOT NULL,
  `to_session_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion_histories`
--

INSERT INTO `promotion_histories` (`id`, `class_from`, `class_to`, `from_session_id`, `to_session_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 9, 10, 1, 2, 1, '2021-07-13 20:32:38', '2021-07-13 20:32:38'),
(2, 8, 9, 1, 2, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(3, 7, 8, 1, 2, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(4, 6, 7, 1, 2, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(5, 5, 6, 1, 2, 1, '2021-07-13 20:36:19', '2021-07-13 20:36:19'),
(6, 4, 5, 1, 2, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(7, 3, 4, 1, 2, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(8, 2, 3, 1, 2, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(9, 1, 2, 1, 2, 1, '2021-07-13 20:38:02', '2021-07-13 20:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `pin_number` varchar(11) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `salary` decimal(11,2) DEFAULT NULL,
  `contribution` decimal(11,2) DEFAULT NULL,
  `taxable_pay` decimal(11,2) DEFAULT NULL,
  `tax_payable` decimal(11,2) DEFAULT NULL,
  `relief` decimal(11,2) DEFAULT NULL,
  `paye` decimal(11,2) DEFAULT NULL,
  `month` varchar(25) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`id`, `pin_number`, `name`, `salary`, `contribution`, `taxable_pay`, `tax_payable`, `relief`, `paye`, `month`, `year`, `created_at`, `updated_at`) VALUES
(1, 'A002006549N', 'Ihaji Richard Kanusu', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(2, 'A002296022K', 'Jane Nyambura Wachira', '50000.00', '200.00', '49800.00', '9723.35', '2400.00', '7323.35', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(3, 'A002737013Z', 'Beatrice Auma Kojalla', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(4, 'A002789830J', 'Caroline Atieno Ogutu', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(5, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(6, 'A004162603X', 'Eliud Wamamily Mwongongi', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(7, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(8, 'A004548699W', 'Mercelline Adhiambo', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(9, 'A004686381L', 'Hassan Vincent Ogega', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(10, 'A004788272P', 'Gerald Mbogo Muriuki', '32000.00', '200.00', '31800.00', '4350.00', '2400.00', '1950.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(11, 'A005407750X', 'Paul Omwala Opondo', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(12, 'A005922577I', 'Cyrus Kariuki Kirangi', '36000.00', '200.00', '35800.00', '5523.35', '2400.00', '3123.35', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(13, 'A006238881H', 'Joseph Nyutu Gitau', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(14, 'A006448646F', 'Hannah Wairimu Kamukwa', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(15, 'A006572282A', 'Anne Mutheu Kioko', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(16, 'A006744834B', 'Felix Kipkorir Cheruiyot', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(17, 'A006860350U', 'Samwel Nyoro Mwangi', '23500.00', '200.00', '23300.00', '2330.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(18, 'A006989415L', 'Stephen Mwangi Wanjiru', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(19, 'A007251247H', 'Lilian Wanjiru Maina', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(20, 'A007300681N', 'Eunice Amubi Malala', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:01', '2022-03-12 10:37:01'),
(21, 'A007360543K', 'Stanley Wabwire Wafula', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(22, 'A007766505C', 'Jane Wanjiku Stephen', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(23, 'A008311108Y', 'Jacinta Khasoha', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(24, 'A008985198A', 'Patrick Akungwi Shiundu', '33000.00', '200.00', '32800.00', '4623.35', '2400.00', '2223.35', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(25, 'A008985886D', 'Washington Odiwuor Ogendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(26, 'A008987958E', 'Susan Nyakio Ngigi', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(27, 'A008988898N', 'James Mwangi Ndung\'u', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(28, 'A008993285R', 'George Mbugua Mwaura', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(29, 'A009361081Z', 'Consolata Agatha Asoga', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(30, 'A009361394W', 'Jane Gathigia Mwangi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(31, 'A009363592D', 'Josphat Ontomwa Mageto', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(32, 'A009372252R', 'Jotham Kanyanga Sega', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(33, 'A009725907E', 'Felistus Misiko Ikumilu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(34, 'A009740236S', 'Ann Wamuyu Thauthi', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(35, 'A009871020M', 'Leonidah Ogake Momanyi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(36, 'A010178321G', 'Diana Amoit Imoh', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(37, 'A010267725Q', 'Moses Aludah Songore', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(38, 'A010463846Q', 'Wilckister Lwosi Khalisia', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(39, 'A010586272C', 'Paul Mureithi Muteria', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(40, 'A010646983K', 'Carolyne Ndinda Muange', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(41, 'A010647183E', 'Moses Kamau Kiragu', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(42, 'A010652901H', 'Janet Chepkurui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(43, 'A010787630A', 'Sarah Wanjiru Mburu', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(44, 'A011182703W', 'Josphat Siro Nyanteri', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(45, 'A011506995J', 'Joseph Ndua Matee', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(46, 'A011751422F', 'Ann Wamboi Kinyua', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(47, 'A011900373R', 'Annastacia  Wambui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(48, 'A011938213U', 'Grace Awour Muma', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(49, 'A011947380K', 'Christine Egonya', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(50, 'A011972722T', 'Zipporah Ong\'uti', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(51, 'A012015951L', 'Edward Wachira Nderitu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(52, 'A012223154F', 'Steven Ochieng\' Otieno', '12500.00', '200.00', '12300.00', '1230.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(53, 'A012328156V', 'Julian Nyogesa', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(54, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(55, 'A013055425H', 'Caro Sigara Mirieri', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(56, 'A013067289C', 'Lucy Masitsa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(57, 'A013305515E', 'Samuel Kariuki Ngethe', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(58, 'A013921280S', 'Peter Onyango Owuacha', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(59, 'A014094845Q', 'Amos Juma Otieno', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(60, 'A014652534Q', 'Shaban Otokoma Munyendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(61, 'A014755100M', 'Josphat Njuguna Mwangi', '16500.00', '200.00', '16300.00', '1630.00', '2400.00', '0.00', 'January', 2021, '2022-03-12 10:37:02', '2022-03-12 10:37:02'),
(62, 'A002006549N', 'Ihaji Richard Kanusu', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(63, 'A002296022K', 'Jane Nyambura Wachira', '50000.00', '200.00', '49800.00', '9723.35', '2400.00', '7323.35', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(64, 'A002737013Z', 'Beatrice Auma Kojalla', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(65, 'A002789830J', 'Caroline Atieno Ogutu', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(66, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(67, 'A004162603X', 'Eliud Wamamily Mwongongi', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(68, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(69, 'A004548699W', 'Mercelline Adhiambo', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(70, 'A004686381L', 'Hassan Vincent Ogega', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(71, 'A004788272P', 'Gerald Mbogo Muriuki', '32000.00', '200.00', '31800.00', '4350.00', '2400.00', '1950.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(72, 'A005407750X', 'Paul Omwala Opondo', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(73, 'A005922577I', 'Cyrus Kariuki Kirangi', '36000.00', '200.00', '35800.00', '5523.35', '2400.00', '3123.35', 'February', 2021, '2022-03-12 10:40:20', '2022-03-12 10:40:20'),
(74, 'A006238881H', 'Joseph Nyutu Gitau', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(75, 'A006448646F', 'Hannah Wairimu Kamukwa', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(76, 'A006572282A', 'Anne Mutheu Kioko', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(77, 'A006744834B', 'Felix Kipkorir Cheruiyot', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(78, 'A006860350U', 'Samwel Nyoro Mwangi', '23500.00', '200.00', '23300.00', '2330.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(79, 'A006989415L', 'Stephen Mwangi Wanjiru', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(80, 'A007251247H', 'Lilian Wanjiru Maina', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(81, 'A007300681N', 'Eunice Amubi Malala', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(82, 'A007360543K', 'Stanley Wabwire Wafula', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(83, 'A007766505C', 'Jane Wanjiku Stephen', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(84, 'A008311108Y', 'Jacinta Khasoha', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(85, 'A008985198A', 'Patrick Akungwi Shiundu', '33000.00', '200.00', '32800.00', '4623.35', '2400.00', '2223.35', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(86, 'A008985886D', 'Washington Odiwuor Ogendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(87, 'A008987958E', 'Susan Nyakio Ngigi', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(88, 'A008988898N', 'James Mwangi Ndung\'u', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(89, 'A008993285R', 'George Mbugua Mwaura', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(90, 'A009361081Z', 'Consolata Agatha Asoga', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(91, 'A009361394W', 'Jane Gathigia Mwangi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(92, 'A009363592D', 'Josphat Ontomwa Mageto', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(93, 'A009372252R', 'Jotham Kanyanga Sega', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(94, 'A009725907E', 'Felistus Misiko Ikumilu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(95, 'A009740236S', 'Ann Wamuyu Thauthi', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(96, 'A009871020M', 'Leonidah Ogake Momanyi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(97, 'A010178321G', 'Diana Amoit Imoh', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(98, 'A010267725Q', 'Moses Aludah Songore', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(99, 'A010463846Q', 'Wilckister Lwosi Khalisia', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(100, 'A010586272C', 'Paul Mureithi Muteria', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(101, 'A010646983K', 'Carolyne Ndinda Muange', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(102, 'A010647183E', 'Moses Kamau Kiragu', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(103, 'A010652901H', 'Janet Chepkurui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(104, 'A010787630A', 'Sarah Wanjiru Mburu', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(105, 'A011182703W', 'Josphat Siro Nyanteri', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(106, 'A011506995J', 'Joseph Ndua Matee', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(107, 'A011751422F', 'Ann Wamboi Kinyua', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(108, 'A011900373R', 'Annastacia  Wambui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(109, 'A011938213U', 'Grace Awour Muma', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(110, 'A011947380K', 'Christine Egonya', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(111, 'A011972722T', 'Zipporah Ong\'uti', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(112, 'A012015951L', 'Edward Wachira Nderitu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:21', '2022-03-12 10:40:21'),
(113, 'A012223154F', 'Steven Ochieng\' Otieno', '12500.00', '200.00', '12300.00', '1230.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(114, 'A012328156V', 'Julian Nyogesa', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(115, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(116, 'A013055425H', 'Caro Sigara Mirieri', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(117, 'A013067289C', 'Lucy Masitsa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(118, 'A013305515E', 'Samuel Kariuki Ngethe', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(119, 'A013921280S', 'Peter Onyango Owuacha', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(120, 'A014094845Q', 'Amos Juma Otieno', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(121, 'A014652534Q', 'Shaban Otokoma Munyendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(122, 'A014755100M', 'Josphat Njuguna Mwangi', '16500.00', '200.00', '16300.00', '1630.00', '2400.00', '0.00', 'February', 2021, '2022-03-12 10:40:22', '2022-03-12 10:40:22'),
(123, 'A014094845Q', 'Amos Juma Otieno', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(124, 'A011751422F', 'Ann Wamboi Kinyua', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(125, 'A009740236S', 'Ann Wamuyu Thauthi', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(126, 'A011900373R', 'Annastacia  Wambui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(127, 'A006572282A', 'Anne Mutheu Kioko', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(128, 'A002737013Z', 'Beatrice Auma Kojalla', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(129, 'A013055425H', 'Caro Sigara Mirieri', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(130, 'A002789830J', 'Caroline Atieno Ogutu', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(131, 'A010646983K', 'Carolyne Ndinda Muange', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(132, 'A011947380K', 'Christine Egonya', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(133, 'A009361081Z', 'Consolata Agatha Asoga', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(134, 'A005922577I', 'Cyrus Kariuki Kirangi', '36000.00', '200.00', '35800.00', '5523.35', '2400.00', '3123.35', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(135, 'A010178321G', 'Diana Amoit Imoh', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(136, 'A004162603X', 'Eliud Wamamily Mwongongi', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(137, 'A007300681N', 'Eunice Amubi Malala', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(138, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:14', '2022-03-12 10:41:14'),
(139, 'A009725907E', 'Felistus Misiko Ikumilu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(140, 'A006744834B', 'Felix Kipkorir Cheruiyot', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(141, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(142, 'A008993285R', 'George Mbugua Mwaura', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(143, 'A011938213U', 'Grace Awour Muma', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(144, 'A006448646F', 'Hannah Wairimu Kamukwa', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(145, 'A002006549N', 'Ihaji Richard Kanusu', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(146, 'A008311108Y', 'Jacinta Khasoha', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(147, 'A008988898N', 'James Mwangi Ndung\'u', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(148, 'A009361394W', 'Jane Gathigia Mwangi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(149, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(150, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(151, 'A007766505C', 'Jane Wanjiku Stephen', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(152, 'A010652901H', 'Janet Chepkurui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(153, 'A011506995J', 'Joseph Ndua Matee', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(154, 'A006238881H', 'Joseph Nyutu Gitau', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(155, 'A014755100M', 'Josphat Njuguna Mwangi', '16500.00', '200.00', '16300.00', '1630.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(156, 'A009363592D', 'Josphat Ontomwa Mageto', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(157, 'A011182703W', 'Josphat Siro Nyanteri', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(158, 'A009372252R', 'Jotham Kanyanga Sega', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(159, 'A012328156V', 'Julian Nyogesa', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(160, 'A009871020M', 'Leonidah Ogake Momanyi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(161, 'A012015951L', 'Edward Wachira Nderitu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(162, 'A007251247H', 'Lilian Wanjiru Maina', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(163, 'A013067289C', 'Lucy Masitsa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(164, 'A004548699W', 'Mercelline Adhiambo', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(165, 'A010267725Q', 'Moses Aludah Songore', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(166, 'A010647183E', 'Moses Kamau Kiragu', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(167, 'A004788272P', 'Gerald Mbogo Muriuki', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(168, 'A008985198A', 'Patrick Akongwi Shiundu', '33000.00', '200.00', '32800.00', '4623.35', '2400.00', '2223.35', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(169, 'A010586272C', 'Paul Mureithi Muteria', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(170, 'A005407750X', 'Paul Omwala Opondo', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(171, 'A013921280S', 'Peter Onyango Owuacha', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(172, 'A013305515E', 'Samuel Kariuki Ngethe', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(173, 'A006860350U', 'Samwel Nyoro Mwangi', '23500.00', '200.00', '23300.00', '2330.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(174, 'A010787630A', 'Sarah Wanjiru Mburu', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(175, 'A014652534Q', 'Shaban Otokoma Munyendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(176, 'A007360543K', 'Stanley Wabwire Wafula', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(177, 'A006989415L', 'Stephen Mwangi Wanjiru', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(178, 'A012223154F', 'Steven Ochieng\' Otieno', '12500.00', '200.00', '12300.00', '1230.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(179, 'A008987958E', 'Susan Nyakio Ngigi', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:15', '2022-03-12 10:41:15'),
(180, 'A008985886D', 'Washington Odiwuor Ogendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'March', 2021, '2022-03-12 10:41:16', '2022-03-12 10:41:16'),
(181, 'A010463846Q', 'Wilckister Lwosi Khalisia', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:16', '2022-03-12 10:41:16'),
(182, 'A011972722T', 'Zipporah Ong\'uti', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:16', '2022-03-12 10:41:16'),
(183, 'A004686381L', 'Hassan Vincent Ogega', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'March', 2021, '2022-03-12 10:41:16', '2022-03-12 10:41:16'),
(184, 'A014094845Q', 'Amos Juma Otieno', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(185, 'A011751422F', 'Ann Wamboi Kinyua', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(186, 'A009740236S', 'Ann Wamuyu Thauthi', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(187, 'A011900373R', 'Annastacia  Wambui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(188, 'A006572282A', 'Anne Mutheu Kioko', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(189, 'A002737013Z', 'Beatrice Auma Kojalla', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(190, 'A013055425H', 'Caro Sigara Mirieri', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(191, 'A002789830J', 'Caroline Atieno Ogutu', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(192, 'A010646983K', 'Carolyne Ndinda Muange', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(193, 'A011947380K', 'Christine Egonya', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(194, 'A009361081Z', 'Consolata Agatha Asoga', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(195, 'A005922577I', 'Cyrus Kariuki Kirangi', '36000.00', '200.00', '35800.00', '5523.35', '2400.00', '3123.35', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(196, 'A010178321G', 'Diana Amoit Imoh', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(197, 'A004162603X', 'Eliud Wamamily Mwongongi', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(198, 'A007300681N', 'Eunice Amubi Malala', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(199, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(200, 'A009725907E', 'Felistus Misiko Ikumilu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(201, 'A006744834B', 'Felix Kipkorir Cheruiyot', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(202, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(203, 'A008993285R', 'George Mbugua Mwaura', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(204, 'A011938213U', 'Grace Awour Muma', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(205, 'A006448646F', 'Hannah Wairimu Kamukwa', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(206, 'A002006549N', 'Ihaji Richard Kanusu', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(207, 'A008311108Y', 'Jacinta Khasoha', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(208, 'A008988898N', 'James Mwangi Ndung\'u', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(209, 'A009361394W', 'Jane Gathigia Mwangi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(210, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(211, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(212, 'A007766505C', 'Jane Wanjiku Stephen', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(213, 'A010652901H', 'Janet Chepkurui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(214, 'A011506995J', 'Joseph Ndua Matee', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(215, 'A006238881H', 'Joseph Nyutu Gitau', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(216, 'A014755100M', 'Josphat Njuguna Mwangi', '16500.00', '200.00', '16300.00', '1630.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(217, 'A009363592D', 'Josphat Ontomwa Mageto', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(218, 'A011182703W', 'Josphat Siro Nyanteri', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(219, 'A009372252R', 'Jotham Kanyanga Sega', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(220, 'A012328156V', 'Julian Nyogesa', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(221, 'A009871020M', 'Leonidah Ogake Momanyi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(222, 'A012015951L', 'Edward Wachira Nderitu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(223, 'A007251247H', 'Lilian Wanjiru Maina', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(224, 'A013067289C', 'Lucy Masitsa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(225, 'A004548699W', 'Mercelline Adhiambo', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(226, 'A010267725Q', 'Moses Aludah Songore', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(227, 'A010647183E', 'Moses Kamau Kiragu', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(228, 'A004788272P', 'Gerald Mbogo Muriuki', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(229, 'A008985198A', 'Patrick Akongwi Shiundu', '33000.00', '200.00', '32800.00', '4623.35', '2400.00', '2223.35', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(230, 'A010586272C', 'Paul Mureithi Muteria', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(231, 'A005407750X', 'Paul Omwala Opondo', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(232, 'A013921280S', 'Peter Onyango Owuacha', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(233, 'A013305515E', 'Samuel Kariuki Ngethe', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(234, 'A006860350U', 'Samwel Nyoro Mwangi', '23500.00', '200.00', '23300.00', '2330.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(235, 'A010787630A', 'Sarah Wanjiru Mburu', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(236, 'A014652534Q', 'Shaban Otokoma Munyendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(237, 'A007360543K', 'Stanley Wabwire Wafula', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(238, 'A006989415L', 'Stephen Mwangi Wanjiru', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(239, 'A012223154F', 'Steven Ochieng\' Otieno', '12500.00', '200.00', '12300.00', '1230.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(240, 'A008987958E', 'Susan Nyakio Ngigi', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(241, 'A008985886D', 'Washington Odiwuor Ogendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'April', 2021, '2022-03-12 10:48:27', '2022-03-12 10:48:27'),
(242, 'A010463846Q', 'Wilckister Lwosi Khalisia', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:28', '2022-03-12 10:48:28'),
(243, 'A011972722T', 'Zipporah Ong\'uti', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:28', '2022-03-12 10:48:28'),
(244, 'A011399183G', 'Mildred Vidembu Mikoli', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:28', '2022-03-12 10:48:28'),
(245, 'A014908417A', 'Jescar Mkaluma Mombo', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'April', 2021, '2022-03-12 10:48:28', '2022-03-12 10:48:28'),
(246, 'A014094845Q', 'Amos Juma Otieno', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(247, 'A011751422F', 'Ann Wamboi Kinyua', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(248, 'A009740236S', 'Ann Wamuyu Thauthi', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(249, 'A011900373R', 'Annastacia  Wambui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(250, 'A006572282A', 'Anne Mutheu Kioko', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(251, 'A002737013Z', 'Beatrice Auma Kojalla', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(252, 'A013055425H', 'Caro Sigara Mirieri', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(253, 'A002789830J', 'Caroline Atieno Ogutu', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(254, 'A010646983K', 'Carolyne Ndinda Muange', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(255, 'A011947380K', 'Christine Egonya', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(256, 'A009361081Z', 'Consolata Agatha Asoga', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(257, 'A005922577I', 'Cyrus Kariuki Kirangi', '36000.00', '200.00', '35800.00', '5523.35', '2400.00', '3123.35', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(258, 'A010178321G', 'Diana Amoit Imoh', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(259, 'A004162603X', 'Eliud Wamamily Mwongongi', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(260, 'A007300681N', 'Eunice Amubi Malala', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(261, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(262, 'A009725907E', 'Felistus Misiko Ikumilu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(263, 'A006744834B', 'Felix Kipkorir Cheruiyot', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(264, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(265, 'A008993285R', 'George Mbugua Mwaura', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(266, 'A011938213U', 'Grace Awour Muma', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(267, 'A006448646F', 'Hannah Wairimu Kamukwa', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(268, 'A002006549N', 'Ihaji Richard Kanusu', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(269, 'A008988898N', 'James Mwangi Ndung\'u', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(270, 'A009361394W', 'Jane Gathigia Mwangi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(271, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(272, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(273, 'A007766505C', 'Jane Wanjiku Stephen', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(274, 'A010652901H', 'Janet Chepkurui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:53', '2022-03-12 10:51:53'),
(275, 'A011506995J', 'Joseph Ndua Matee', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(276, 'A014755100M', 'Josphat Njuguna Mwangi', '16500.00', '200.00', '16300.00', '1630.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(277, 'A009363592D', 'Josphat Ontomwa Mageto', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(278, 'A011182703W', 'Josphat Siro Nyanteri', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(279, 'A009372252R', 'Jotham Kanyanga Sega', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(280, 'A009871020M', 'Leonidah Ogake Momanyi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(281, 'A012015951L', 'Edward Wachira Nderitu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(282, 'A007251247H', 'Lilian Wanjiru Maina', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(283, 'A013067289C', 'Lucy Masitsa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(284, 'A004548699W', 'Mercelline Adhiambo', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(285, 'A010267725Q', 'Moses Aludah Songore', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(286, 'A010647183E', 'Moses Kamau Kiragu', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(287, 'A004788272P', 'Gerald Mbogo Muriuki', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(288, 'A008985198A', 'Patrick Akongwi Shiundu', '33000.00', '200.00', '32800.00', '4623.35', '2400.00', '2223.35', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(289, 'A010586272C', 'Paul Mureithi Muteria', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(290, 'A005407750X', 'Paul Omwala Opondo', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(291, 'A013921280S', 'Peter Onyango Owuacha', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(292, 'A013305515E', 'Samuel Kariuki Ngethe', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(293, 'A006860350U', 'Samwel Nyoro Mwangi', '23500.00', '200.00', '23300.00', '2330.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54');
INSERT INTO `returns` (`id`, `pin_number`, `name`, `salary`, `contribution`, `taxable_pay`, `tax_payable`, `relief`, `paye`, `month`, `year`, `created_at`, `updated_at`) VALUES
(294, 'A010787630A', 'Sarah Wanjiru Mburu', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(295, 'A014652534Q', 'Shaban Otokoma Munyendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(296, 'A007360543K', 'Stanley Wabwire Wafula', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(297, 'A006989415L', 'Stephen Mwangi Wanjiru', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(298, 'A012223154F', 'Steven Ochieng\' Otieno', '12500.00', '200.00', '12300.00', '1230.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(299, 'A008987958E', 'Susan Nyakio Ngigi', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(300, 'A008985886D', 'Washington Odiwuor Ogendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(301, 'A010463846Q', 'Wilckister Lwosi Khalisia', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(302, 'A011972722T', 'Zipporah Ong\'uti', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(303, 'A011399183G', 'Mildred Vidembu Mikoli', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(304, 'A014908417A', 'Jescar Mkaluma Mombo', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'May', 2021, '2022-03-12 10:51:54', '2022-03-12 10:51:54'),
(305, 'A014094845Q', 'Amos Juma Otieno', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:22', '2022-03-12 11:00:22'),
(306, 'A011751422F', 'Ann Wamboi Kinyua', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:22', '2022-03-12 11:00:22'),
(307, 'A009740236S', 'Ann Wamuyu Thauthi', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:22', '2022-03-12 11:00:22'),
(308, 'A011900373R', 'Annastacia  Wambui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:22', '2022-03-12 11:00:22'),
(309, 'A006572282A', 'Anne Mutheu Kioko', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:22', '2022-03-12 11:00:22'),
(310, 'A002737013Z', 'Beatrice Auma Kojalla', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:22', '2022-03-12 11:00:22'),
(311, 'A013055425H', 'Caro Sigara Mirieri', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(312, 'A002789830J', 'Caroline Atieno Ogutu', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(313, 'A010646983K', 'Carolyne Ndinda Muange', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(314, 'A011947380K', 'Christine Egonya', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(315, 'A009361081Z', 'Consolata Agatha Asoga', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(316, 'A005922577I', 'Cyrus Kariuki Kirangi', '36000.00', '200.00', '35800.00', '5523.35', '2400.00', '3123.35', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(317, 'A010178321G', 'Diana Amoit Imoh', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(318, 'A004162603X', 'Eliud Wamamily Mwongongi', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(319, 'A007300681N', 'Eunice Amubi Malala', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(320, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(321, 'A009725907E', 'Felistus Misiko Ikumilu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(322, 'A006744834B', 'Felix Kipkorir Cheruiyot', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(323, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(324, 'A008993285R', 'George Mbugua Mwaura', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(325, 'A011938213U', 'Grace Awour Muma', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(326, 'A006448646F', 'Hannah Wairimu Kamukwa', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(327, 'A002006549N', 'Ihaji Richard Kanusu', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(328, 'A008988898N', 'James Mwangi Ndung\'u', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(329, 'A009361394W', 'Jane Gathigia Mwangi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(330, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(331, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(332, 'A007766505C', 'Jane Wanjiku Stephen', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(333, 'A010652901H', 'Janet Chepkurui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(334, 'A011506995J', 'Joseph Ndua Matee', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(335, 'A014755100M', 'Josphat Njuguna Mwangi', '16500.00', '200.00', '16300.00', '1630.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(336, 'A009363592D', 'Josphat Ontomwa Mageto', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(337, 'A011182703W', 'Josphat Siro Nyanteri', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(338, 'A009372252R', 'Jotham Kanyanga Sega', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(339, 'A009871020M', 'Leonidah Ogake Momanyi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(340, 'A012015951L', 'Edward Wachira Nderitu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(341, 'A007251247H', 'Lilian Wanjiru Maina', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(342, 'A013067289C', 'Lucy Masitsa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(343, 'A004548699W', 'Mercelline Adhiambo', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(344, 'A010267725Q', 'Moses Aludah Songore', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(345, 'A011720411X', 'Fedinard Mutunga', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(346, 'A004788272P', 'Gerald Mbogo Muriuki', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(347, 'A008985198A', 'Patrick Akongwi Shiundu', '33000.00', '200.00', '32800.00', '4623.35', '2400.00', '2223.35', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(348, 'A010586272C', 'Paul Mureithi Muteria', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(349, 'A005407750X', 'Paul Omwala Opondo', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(350, 'A013921280S', 'Peter Onyango Owuacha', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(351, 'A013305515E', 'Samuel Kariuki Ngethe', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(352, 'A006860350U', 'Samwel Nyoro Mwangi', '23500.00', '200.00', '23300.00', '2330.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(353, 'A010787630A', 'Sarah Wanjiru Mburu', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(354, 'A014652534Q', 'Shaban Otokoma Munyendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(355, 'A007360543K', 'Stanley Wabwire Wafula', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(356, 'A006989415L', 'Stephen Mwangi Wanjiru', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(357, 'A012223154F', 'Steven Ochieng\' Otieno', '12500.00', '200.00', '12300.00', '1230.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(358, 'A008987958E', 'Susan Nyakio Ngigi', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(359, 'A008985886D', 'Washington Odiwuor Ogendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(360, 'A010463846Q', 'Wilckister Lwosi Khalisia', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(361, 'A011972722T', 'Zipporah Ong\'uti', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(362, 'A011399183G', 'Mildred Vidembu Mikoli', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:23', '2022-03-12 11:00:23'),
(363, 'A014908417A', 'Jescar Mkaluma Mombo', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:24', '2022-03-12 11:00:24'),
(364, 'A003662216J', 'Purity Koskei Cheruto', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'June', 2021, '2022-03-12 11:00:24', '2022-03-12 11:00:24'),
(365, 'A014094845Q', 'Amos Juma Otieno', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(366, 'A011751422F', 'Ann Wamboi Kinyua', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(367, 'A009740236S', 'Ann Wamuyu Thauthi', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(368, 'A011900373R', 'Annastacia  Wambui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(369, 'A006572282A', 'Anne Mutheu Kioko', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(370, 'A002737013Z', 'Beatrice Auma Kojalla', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(371, 'A013055425H', 'Caro Sigara Mirieri', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(372, 'A002789830J', 'Caroline Atieno Ogutu', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(373, 'A010646983K', 'Carolyne Ndinda Muange', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(374, 'A011947380K', 'Christine Egonya', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(375, 'A009361081Z', 'Consolata Agatha Asoga', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(376, 'A005922577I', 'Cyrus Kariuki Kirangi', '36000.00', '200.00', '35800.00', '5523.35', '2400.00', '3123.35', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(377, 'A010178321G', 'Diana Amoit Imoh', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(378, 'A004162603X', 'Eliud Wamamily Mwongongi', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(379, 'A007300681N', 'Eunice Amubi Malala', '11000.00', '200.00', '10800.00', '1080.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(380, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(381, 'A009725907E', 'Felistus Misiko Ikumilu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(382, 'A006744834B', 'Felix Kipkorir Cheruiyot', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(383, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(384, 'A008993285R', 'George Mbugua Mwaura', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(385, 'A011938213U', 'Grace Awour Muma', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(386, 'A006448646F', 'Hannah Wairimu Kamukwa', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(387, 'A002006549N', 'Ihaji Richard Kanusu', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(388, 'A008988898N', 'James Mwangi Ndung\'u', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(389, 'A009361394W', 'Jane Gathigia Mwangi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(390, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(391, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(392, 'A007766505C', 'Jane Wanjiku Stephen', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(393, 'A010652901H', 'Janet Chepkurui', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(394, 'A011506995J', 'Joseph Ndua Matee', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(395, 'A014755100M', 'Josphat Njuguna Mwangi', '16500.00', '200.00', '16300.00', '1630.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:28', '2022-03-12 11:06:28'),
(396, 'A009363592D', 'Josphat Ontomwa Mageto', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(397, 'A011182703W', 'Josphat Siro Nyanteri', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(398, 'A009372252R', 'Jotham Kanyanga Sega', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(399, 'A009871020M', 'Leonidah Ogake Momanyi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(400, 'A012015951L', 'Edward Wachira Nderitu', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(401, 'A007251247H', 'Lilian Wanjiru Maina', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(402, 'A013067289C', 'Lucy Masitsa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(403, 'A004548699W', 'Mercelline Adhiambo', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(404, 'A010267725Q', 'Moses Aludah Songore', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(405, 'A011720411X', 'Fedinard Mutunga', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(406, 'A004788272P', 'Gerald Mbogo Muriuki', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(407, 'A008985198A', 'Patrick Akongwi Shiundu', '33000.00', '200.00', '32800.00', '4623.35', '2400.00', '2223.35', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(408, 'A010586272C', 'Paul Mureithi Muteria', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(409, 'A005407750X', 'Paul Omwala Opondo', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(410, 'A013921280S', 'Peter Onyango Owuacha', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(411, 'A013305515E', 'Samuel Kariuki Ngethe', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(412, 'A006860350U', 'Samwel Nyoro Mwangi', '23500.00', '200.00', '23300.00', '2330.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(413, 'A010787630A', 'Sarah Wanjiru Mburu', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(414, 'A007360543K', 'Stanley Wabwire Wafula', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(415, 'A006989415L', 'Stephen Mwangi Wanjiru', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(416, 'A012223154F', 'Steven Ochieng\' Otieno', '12500.00', '200.00', '12300.00', '1230.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(417, 'A008987958E', 'Susan Nyakio Ngigi', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(418, 'A008985886D', 'Washington Odiwuor Ogendo', '26000.00', '200.00', '25800.00', '2850.00', '2400.00', '450.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(419, 'A010463846Q', 'Wilckister Lwosi Khalisia', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(420, 'A011972722T', 'Zipporah Ong\'uti', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(421, 'A011399183G', 'Mildred Vidembu Mikoli', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(422, 'A014908417A', 'Jescar Mkaluma Mombo', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(423, 'A003662216J', 'Purity Koskei Cheruto', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'July', 2021, '2022-03-12 11:06:29', '2022-03-12 11:06:29'),
(424, 'A014094845Q', 'Amos Juma Otieno', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:15', '2022-03-12 11:09:15'),
(425, 'A011751422F', 'Ann Wamboi Kinyua', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:15', '2022-03-12 11:09:15'),
(426, 'A009740236S', 'Ann Wamuyu Thauthi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(427, 'A011900373R', 'Annastacia  Wambui', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(428, 'A006572282A', 'Anne Mutheu Kioko', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(429, 'A012939212W', 'Sarah Okoti Ashikoye', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(430, 'A013055425H', 'Caro Sigara Mirieri', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(431, 'A002789830J', 'Caroline Atieno Ogutu', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(432, 'A010646983K', 'Carolyne Ndinda Muange', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(433, 'A011947380K', 'Christine Egonya', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(434, 'A009361081Z', 'Consolata Agatha Asoga', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(435, 'A005922577I', 'Cyrus Kariuki Kirangi', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(436, 'A011804813L', 'Angel Nambande Njuki', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(437, 'A004162603X', 'Eliud Wamamily Mwongongi', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(438, 'A007300681N', 'Eunice Amubi Malala', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(439, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(440, 'A009725907E', 'Felistus Misiko Ikumilu', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(441, 'A006744834B', 'Felix Kipkorir Cheruiyot', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(442, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(443, 'A008993285R', 'George Mbugua Mwaura', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(444, 'A011938213U', 'Grace Awour Muma', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(445, 'A006448646F', 'Hannah Wairimu Kamukwa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(446, 'A002006549N', 'Ihaji Richard Kanusu', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(447, 'A008988898N', 'James Mwangi Ndung\'u', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(448, 'A009361394W', 'Jane Gathigia Mwangi', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(449, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(450, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(451, 'A007766505C', 'Jane Wanjiku Stephen', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(452, 'A010652901H', 'Janet Chepkurui', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(453, 'A011506995J', 'Joseph Ndua Matee', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(454, 'A014755100M', 'Josphat Njuguna Mwangi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(455, 'A009363592D', 'Josphat Ontomwa Mageto', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(456, 'A011182703W', 'Josphat Siro Nyanteri', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(457, 'A009372252R', 'Jotham Kanyanga Sega', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(458, 'A009871020M', 'Leonidah Ogake Momanyi', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(459, 'A012015951L', 'Edward Wachira Nderitu', '60000.00', '200.00', '59800.00', '12723.35', '2400.00', '10323.35', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(460, 'A007251247H', 'Lilian Wanjiru Maina', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(461, 'A013067289C', 'Lucy Masitsa', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(462, 'A004548699W', 'Mercelline Adhiambo', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(463, 'A010267725Q', 'Moses Aludah Songore', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(464, 'A011720411X', 'Fedinard Mutunga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(465, 'A004788272P', 'Gerald Mbogo Muriuki', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(466, 'A008985198A', 'Patrick Akongwi Shiundu', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(467, 'A010586272C', 'Paul Mureithi Muteria', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(468, 'A005407750X', 'Paul Omwala Opondo', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(469, 'A013921280S', 'Peter Onyango Owuacha', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(470, 'A013305515E', 'Samuel Kariuki Ngethe', '19500.00', '200.00', '19300.00', '1930.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(471, 'A006860350U', 'Samwel Nyoro Mwangi', '24500.00', '200.00', '24300.00', '2475.00', '2400.00', '75.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(472, 'A010787630A', 'Sarah Wanjiru Mburu', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(473, 'A009670897Z', 'Ladorna Anastacia Okochi', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(474, 'A007263084U', 'Jairus Odiwuor Amwata', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(475, 'A006989415L', 'Stephen Mwangi Wanjiru', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(476, 'A012223154F', 'Steven Ochieng\' Otieno', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(477, 'A008987958E', 'Susan Nyakio Ngigi', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(478, 'A008985886D', 'Washington Odiwuor Ogendo', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'August', 2021, '2022-03-12 11:09:16', '2022-03-12 11:09:16'),
(479, 'A010463846Q', 'Wilckister Lwosi Khalisia', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:17', '2022-03-12 11:09:17'),
(480, 'A011972722T', 'Zipporah Ong\'uti', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:17', '2022-03-12 11:09:17'),
(481, 'A011399183G', 'Mildred Vidembu Mikoli', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:17', '2022-03-12 11:09:17'),
(482, 'A014908417A', 'Jescar Mkaluma Mombo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:17', '2022-03-12 11:09:17'),
(483, 'A003662216J', 'Purity Koskei Cheruto', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:17', '2022-03-12 11:09:17'),
(484, 'A008288528E', 'Danson Kedenge ', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'August', 2021, '2022-03-12 11:09:17', '2022-03-12 11:09:17'),
(485, 'A014094845Q', 'Amos Juma Otieno', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(486, 'A011751422F', 'Ann Wamboi Kinyua', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(487, 'A009740236S', 'Ann Wamuyu Thauthi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(488, 'A011900373R', 'Annastacia  Wambui', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(489, 'A006572282A', 'Anne Mutheu Kioko', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(490, 'A012939212W', 'Sarah Okoti Ashikoye', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(491, 'A016771505M', 'Ann Njeri Mburu', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(492, 'A002789830J', 'Caroline Atieno Ogutu', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(493, 'A010646983K', 'Carolyne Ndinda Muange', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(494, 'A011947380K', 'Christine Egonya', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(495, 'A009361081Z', 'Consolata Agatha Asoga', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(496, 'A011804813L', 'Angel Nambande Njuki', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(497, 'A004162603X', 'Eliud Wamamily Mwongongi', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'September', 2021, '2022-03-12 11:12:52', '2022-03-12 11:12:52'),
(498, 'A007300681N', 'Eunice Amubi Malala', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(499, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(500, 'A009725907E', 'Felistus Misiko Ikumilu', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(501, 'A006744834B', 'Felix Kipkorir Cheruiyot', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(502, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(503, 'A008993285R', 'George Mbugua Mwaura', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(504, 'A011938213U', 'Grace Awour Muma', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(505, 'A006448646F', 'Hannah Wairimu Kamukwa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(506, 'A002006549N', 'Ihaji Richard Kanusu', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(507, 'A008988898N', 'James Mwangi Ndung\'u', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(508, 'A009361394W', 'Jane Gathigia Mwangi', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(509, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(510, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(511, 'A007766505C', 'Jane Wanjiku Stephen', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(512, 'A010652901H', 'Janet Chepkurui', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(513, 'A011506995J', 'Joseph Ndua Matee', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(514, 'A014755100M', 'Josphat Njuguna Mwangi', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(515, 'A009363592D', 'Josphat Ontomwa Mageto', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(516, 'A011182703W', 'Josphat Siro Nyanteri', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(517, 'A009372252R', 'Jotham Kanyanga Sega', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(518, 'A009871020M', 'Leonidah Ogake Momanyi', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(519, 'A012015951L', 'Edward Wachira Nderitu', '60000.00', '200.00', '59800.00', '12723.35', '2400.00', '10323.35', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(520, 'A007251247H', 'Lilian Wanjiru Maina', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(521, 'A013067289C', 'Lucy Masitsa', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(522, 'A004548699W', 'Mercelline Adhiambo', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(523, 'A010267725Q', 'Moses Aludah Songore', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(524, 'A011720411X', 'Fedinard Mutunga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(525, 'A004788272P', 'Gerald Mbogo Muriuki', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(526, 'A008985198A', 'Patrick Akongwi Shiundu', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(527, 'A010586272C', 'Paul Mureithi Muteria', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(528, 'A005407750X', 'Paul Omwala Opondo', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(529, 'A013921280S', 'Peter Onyango Owuacha', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(530, 'A013305515E', 'Samuel Kariuki Ngethe', '19500.00', '200.00', '19300.00', '1930.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(531, 'A006860350U', 'Samwel Nyoro Mwangi', '24500.00', '200.00', '24300.00', '2475.00', '2400.00', '75.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(532, 'A010787630A', 'Sarah Wanjiru Mburu', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(533, 'A009670897Z', 'Ladorna Anastacia Okochi', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(534, 'A007263084U', 'Jairus Odiwuor Amwata', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(535, 'A006989415L', 'Stephen Mwangi Wanjiru', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(536, 'A012223154F', 'Steven Ochieng\' Otieno', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(537, 'A008987958E', 'Susan Nyakio Ngigi', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(538, 'A008985886D', 'Washington Odiwuor Ogendo', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(539, 'A010463846Q', 'Wilckister Lwosi Khalisia', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(540, 'A011972722T', 'Zipporah Ong\'uti', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(541, 'A011399183G', 'Mildred Vidembu Mikoli', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(542, 'A014908417A', 'Jescar Mkaluma Mombo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(543, 'A003662216J', 'Purity Koskei Cheruto', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(544, 'A008288528E', 'Danson Kedenge ', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(545, 'A014017501B', 'John Nyangori', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(546, 'A016887325I', 'Leah Njeri', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(547, 'A014852349Z', 'Mercy Ambogo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(548, 'A014849417E', 'Getrude Laura Chao', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(549, 'A012684074A', 'Daisy Jelagat Kiprono', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(550, 'A010917690L', 'Denish Ochieng Onyore', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(551, 'A013012807X', 'Clare Atsenga', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'September', 2021, '2022-03-12 11:12:53', '2022-03-12 11:12:53'),
(552, 'A014094845Q', 'Amos Juma Otieno', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(553, 'A011751422F', 'Ann Wamboi Kinyua', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(554, 'A009740236S', 'Ann Wamuyu Thauthi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(555, 'A011900373R', 'Annastacia  Wambui', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(556, 'A006572282A', 'Anne Mutheu Kioko', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(557, 'A012939212W', 'Sarah Okoti Ashikoye', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(558, 'A016771505M', 'Ann Njeri Mburu', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(559, 'A002789830J', 'Caroline Atieno Ogutu', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(560, 'A010646983K', 'Carolyne Ndinda Muange', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(561, 'A011947380K', 'Christine Egonya', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(562, 'A009361081Z', 'Consolata Agatha Asoga', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(563, 'A017054935Z', 'Alvin Mudogo', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(564, 'A011804813L', 'Angel Nambande Njuki', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(565, 'A004162603X', 'Eliud Wamamily Mwongongi', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(566, 'A007300681N', 'Eunice Amubi Malala', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(567, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(568, 'A009725907E', 'Felistus Misiko Ikumilu', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(569, 'A006744834B', 'Felix Kipkorir Cheruiyot', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(570, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(571, 'A008993285R', 'George Mbugua Mwaura', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(572, 'A011938213U', 'Grace Awour Muma', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(573, 'A006448646F', 'Hannah Wairimu Kamukwa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(574, 'A002006549N', 'Ihaji Richard Kanusu', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(575, 'A008988898N', 'James Mwangi Ndung\'u', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(576, 'A009361394W', 'Jane Gathigia Mwangi', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(577, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(578, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(579, 'A007766505C', 'Jane Wanjiku Stephen', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(580, 'A010652901H', 'Janet Chepkurui', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(581, 'A011506995J', 'Joseph Ndua Matee', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(582, 'A009363592D', 'Josphat Ontomwa Mageto', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(583, 'A011182703W', 'Josphat Siro Nyanteri', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(584, 'A009372252R', 'Jotham Kanyanga Sega', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(585, 'A009871020M', 'Leonidah Ogake Momanyi', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19');
INSERT INTO `returns` (`id`, `pin_number`, `name`, `salary`, `contribution`, `taxable_pay`, `tax_payable`, `relief`, `paye`, `month`, `year`, `created_at`, `updated_at`) VALUES
(586, 'A012015951L', 'Edward Wachira Nderitu', '60000.00', '200.00', '59800.00', '12723.35', '2400.00', '10323.35', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(587, 'A007251247H', 'Lilian Wanjiru Maina', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(588, 'A013067289C', 'Lucy Masitsa', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(589, 'A004548699W', 'Mercelline Adhiambo', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(590, 'A010267725Q', 'Moses Aludah Songore', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(591, 'A011720411X', 'Fedinard Mutunga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(592, 'A004788272P', 'Gerald Mbogo Muriuki', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(593, 'A008985198A', 'Patrick Akongwi Shiundu', '40000.00', '200.00', '39800.00', '6723.35', '2400.00', '4323.35', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(594, 'A010586272C', 'Paul Mureithi Muteria', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(595, 'A005407750X', 'Paul Omwala Opondo', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(596, 'A013921280S', 'Peter Onyango Owuacha', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(597, 'A013305515E', 'Samuel Kariuki Ngethe', '19500.00', '200.00', '19300.00', '1930.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:19', '2022-03-12 11:17:19'),
(598, 'A006860350U', 'Samwel Nyoro Mwangi', '24500.00', '200.00', '24300.00', '2475.00', '2400.00', '75.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(599, 'A010787630A', 'Sarah Wanjiru Mburu', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(600, 'A009670897Z', 'Ladorna Anastacia Okochi', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(601, 'A007263084U', 'Jairus Odiwuor Amwata', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(602, 'A006989415L', 'Stephen Mwangi Wanjiru', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(603, 'A012223154F', 'Steven Ochieng\' Otieno', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(604, 'A008987958E', 'Susan Nyakio Ngigi', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(605, 'A008985886D', 'Washington Odiwuor Ogendo', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(606, 'A010463846Q', 'Wilckister Lwosi Khalisia', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(607, 'A011972722T', 'Zipporah Ong\'uti', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(608, 'A011399183G', 'Mildred Vidembu Mikoli', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(609, 'A014908417A', 'Jescar Mkaluma Mombo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(610, 'A003662216J', 'Purity Koskei Cheruto', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(611, 'A008288528E', 'Danson Kedenge ', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(612, 'A014017501B', 'John Nyangori', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(613, 'A016887325I', 'Leah Njeri', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(614, 'A014852349Z', 'Mercy Ambogo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(615, 'A014849417E', 'Getrude Laura Chao', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(616, 'A012684074A', 'Daisy Jelagat Kiprono', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(617, 'A010917690L', 'Denish Ochieng Onyore', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:20', '2022-03-12 11:17:20'),
(618, 'A013012807X', 'Clare Atsenga', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'October', 2021, '2022-03-12 11:17:21', '2022-03-12 11:17:21'),
(619, 'A014094845Q', 'Amos Juma Otieno', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(620, 'A011751422F', 'Ann Wamboi Kinyua', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(621, 'A009740236S', 'Ann Wamuyu Thauthi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(622, 'A011900373R', 'Annastacia  Wambui', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(623, 'A006572282A', 'Anne Mutheu Kioko', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(624, 'A012939212W', 'Sarah Okoti Ashikoye', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(625, 'A016771505M', 'Ann Njeri Mburu', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(626, 'A002789830J', 'Caroline Atieno Ogutu', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(627, 'A010646983K', 'Carolyne Ndinda Muange', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(628, 'A011947380K', 'Christine Egonya', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(629, 'A009361081Z', 'Consolata Agatha Asoga', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(630, 'A017054935Z', 'Alvin Mudogo', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(631, 'A011804813L', 'Angel Nambande Njuki', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(632, 'A004162603X', 'Eliud Wamamily Mwongongi', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(633, 'A007300681N', 'Eunice Amubi Malala', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(634, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(635, 'A009725907E', 'Felistus Misiko Ikumilu', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(636, 'A006744834B', 'Felix Kipkorir Cheruiyot', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(637, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(638, 'A008993285R', 'George Mbugua Mwaura', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(639, 'A011938213U', 'Grace Awour Muma', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(640, 'A006448646F', 'Hannah Wairimu Kamukwa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(641, 'A002006549N', 'Ihaji Richard Kanusu', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(642, 'A008988898N', 'James Mwangi Ndung\'u', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(643, 'A009361394W', 'Jane Gathigia Mwangi', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(644, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(645, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(646, 'A007766505C', 'Jane Wanjiku Stephen', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(647, 'A010652901H', 'Janet Chepkurui', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(648, 'A011506995J', 'Joseph Ndua Matee', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(649, 'A007555135X', 'Caroline Kisiari Lisaliza', '21000.00', '0.00', '21000.00', '2100.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(650, 'A009363592D', 'Josphat Ontomwa Mageto', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(651, 'A011182703W', 'Josphat Siro Nyanteri', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(652, 'A009372252R', 'Jotham Kanyanga Sega', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(653, 'A009871020M', 'Leonidah Ogake Momanyi', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(654, 'A012015951L', 'Edward Wachira Nderitu', '60000.00', '200.00', '59800.00', '12723.35', '2400.00', '10323.35', 'November', 2021, '2022-03-12 11:22:09', '2022-03-12 11:22:09'),
(655, 'A007251247H', 'Lilian Wanjiru Maina', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(656, 'A013067289C', 'Lucy Masitsa', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(657, 'A004548699W', 'Mercelline Adhiambo', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(658, 'A010267725Q', 'Moses Aludah Songore', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(659, 'A011720411X', 'Fedinard Mutunga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(660, 'A004788272P', 'Gerald Mbogo Muriuki', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(661, 'A008985198A', 'Patrick Akongwi Shiundu', '40000.00', '200.00', '39800.00', '6723.35', '2400.00', '4323.35', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(662, 'A010586272C', 'Paul Mureithi Muteria', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(663, 'A005407750X', 'Paul Omwala Opondo', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(664, 'A013921280S', 'Peter Onyango Owuacha', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(665, 'A013305515E', 'Samuel Kariuki Ngethe', '19500.00', '200.00', '19300.00', '1930.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(666, 'A006860350U', 'Samwel Nyoro Mwangi', '24500.00', '200.00', '24300.00', '2475.00', '2400.00', '75.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(667, 'A010787630A', 'Sarah Wanjiru Mburu', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(668, 'A009670897Z', 'Ladorna Anastacia Okochi', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(669, 'A007263084U', 'Jairus Odiwuor Amwata', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(670, 'A006989415L', 'Stephen Mwangi Wanjiru', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(671, 'A012223154F', 'Steven Ochieng\' Otieno', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(672, 'A008987958E', 'Susan Nyakio Ngigi', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(673, 'A008985886D', 'Washington Odiwuor Ogendo', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(674, 'A010463846Q', 'Wilckister Lwosi Khalisia', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(675, 'A011972722T', 'Zipporah Ong\'uti', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(676, 'A011399183G', 'Mildred Vidembu Mikoli', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(677, 'A014908417A', 'Jescar Mkaluma Mombo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(678, 'A003662216J', 'Purity Koskei Cheruto', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(679, 'A008288528E', 'Danson Kedenge ', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(680, 'A014017501B', 'John Nyangori', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(681, 'A016887325I', 'Leah Njeri', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(682, 'A014852349Z', 'Mercy Ambogo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(683, 'A014849417E', 'Getrude Laura Chao', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(684, 'A012684074A', 'Daisy Jelagat Kiprono', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(685, 'A010917690L', 'Denish Ochieng Onyore', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(686, 'A013012807X', 'Clare Atsenga', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(687, 'A003038228N', 'Kimani Kinyanjui', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'November', 2021, '2022-03-12 11:22:10', '2022-03-12 11:22:10'),
(688, 'A014094845Q', 'Amos Juma Otieno', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(689, 'A011751422F', 'Ann Wamboi Kinyua', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(690, 'A009740236S', 'Ann Wamuyu Thauthi', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(691, 'A011900373R', 'Annastacia  Wambui', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(692, 'A006572282A', 'Anne Mutheu Kioko', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(693, 'A012939212W', 'Sarah Okoti Ashikoye', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(694, 'A016771505M', 'Ann Njeri Mburu', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(695, 'A002789830J', 'Caroline Atieno Ogutu', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(696, 'A010646983K', 'Carolyne Ndinda Muange', '24000.00', '200.00', '23800.00', '2380.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(697, 'A011947380K', 'Christine Egonya', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(698, 'A009361081Z', 'Consolata Agatha Asoga', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(699, 'A017054935Z', 'Alvin Mudogo', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(700, 'A011804813L', 'Angel Nambande Njuki', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(701, 'A004162603X', 'Eliud Wamamily Mwongongi', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(702, 'A007300681N', 'Eunice Amubi Malala', '14000.00', '200.00', '13800.00', '1380.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(703, 'A012772789L', 'Faith Minoo Mutua', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(704, 'A009725907E', 'Felistus Misiko Ikumilu', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(705, 'A006744834B', 'Felix Kipkorir Cheruiyot', '27000.00', '200.00', '26800.00', '3100.00', '2400.00', '700.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(706, 'A004399110Z', 'Fredrick Mogoi Sibwoga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(707, 'A008993285R', 'George Mbugua Mwaura', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(708, 'A011938213U', 'Grace Awour Muma', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(709, 'A006448646F', 'Hannah Wairimu Kamukwa', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(710, 'A002006549N', 'Ihaji Richard Kanusu', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(711, 'A008988898N', 'James Mwangi Ndung\'u', '23000.00', '200.00', '22800.00', '2280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(712, 'A009361394W', 'Jane Gathigia Mwangi', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(713, 'A003449517V', 'Jane Njambi Ng\'ang\'a', '35000.00', '200.00', '34800.00', '5223.35', '2400.00', '2823.35', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(714, 'A002296022K', 'Jane Nyambura Wachira', '171000.00', '200.00', '170800.00', '46023.35', '2400.00', '43623.35', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(715, 'A007766505C', 'Jane Wanjiku Stephen', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(716, 'A010652901H', 'Janet Chepkurui', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(717, 'A011506995J', 'Joseph Ndua Matee', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'December', 2021, '2022-03-12 11:26:10', '2022-03-12 11:26:10'),
(718, 'A007555135X', 'Caroline Kisiari Lisaliza', '21000.00', '0.00', '21000.00', '2100.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(719, 'A009363592D', 'Josphat Ontomwa Mageto', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(720, 'A011182703W', 'Josphat Siro Nyanteri', '14500.00', '200.00', '14300.00', '1430.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(721, 'A009372252R', 'Jotham Kanyanga Sega', '15000.00', '200.00', '14800.00', '1480.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(722, 'A009871020M', 'Leonidah Ogake Momanyi', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(723, 'A012015951L', 'Edward Wachira Nderitu', '60000.00', '200.00', '59800.00', '12723.35', '2400.00', '10323.35', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(724, 'A007251247H', 'Lilian Wanjiru Maina', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(725, 'A013067289C', 'Lucy Masitsa', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(726, 'A004548699W', 'Mercelline Adhiambo', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(727, 'A010267725Q', 'Moses Aludah Songore', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(728, 'A011720411X', 'Fedinard Mutunga', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(729, 'A004788272P', 'Gerald Mbogo Muriuki', '38000.00', '200.00', '37800.00', '6123.35', '2400.00', '3723.35', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(730, 'A008985198A', 'Patrick Akongwi Shiundu', '40000.00', '200.00', '39800.00', '6723.35', '2400.00', '4323.35', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(731, 'A010586272C', 'Paul Mureithi Muteria', '19000.00', '200.00', '18800.00', '1880.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(732, 'A005407750X', 'Paul Omwala Opondo', '17000.00', '200.00', '16800.00', '1680.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(733, 'A013921280S', 'Peter Onyango Owuacha', '25000.00', '200.00', '24800.00', '2600.00', '2400.00', '200.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(734, 'A013305515E', 'Samuel Kariuki Ngethe', '19500.00', '200.00', '19300.00', '1930.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(735, 'A006860350U', 'Samwel Nyoro Mwangi', '24500.00', '200.00', '24300.00', '2475.00', '2400.00', '75.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(736, 'A010787630A', 'Sarah Wanjiru Mburu', '20000.00', '200.00', '19800.00', '1980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(737, 'A009670897Z', 'Ladorna Anastacia Okochi', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(738, 'A007263084U', 'Jairus Odiwuor Amwata', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(739, 'A006989415L', 'Stephen Mwangi Wanjiru', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(740, 'A012223154F', 'Steven Ochieng\' Otieno', '13500.00', '200.00', '13300.00', '1330.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(741, 'A008987958E', 'Susan Nyakio Ngigi', '28000.00', '200.00', '27800.00', '3350.00', '2400.00', '950.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(742, 'A008985886D', 'Washington Odiwuor Ogendo', '30000.00', '200.00', '29800.00', '3850.00', '2400.00', '1450.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(743, 'A010463846Q', 'Wilckister Lwosi Khalisia', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(744, 'A011972722T', 'Zipporah Ong\'uti', '18000.00', '200.00', '17800.00', '1780.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(745, 'A011399183G', 'Mildred Vidembu Mikoli', '12000.00', '200.00', '11800.00', '1180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(746, 'A014908417A', 'Jescar Mkaluma Mombo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(747, 'A003662216J', 'Purity Koskei Cheruto', '22000.00', '200.00', '21800.00', '2180.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(748, 'A008288528E', 'Danson Kedenge ', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(749, 'A014017501B', 'John Nyangori', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(750, 'A016887325I', 'Leah Njeri', '10000.00', '200.00', '9800.00', '980.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(751, 'A014852349Z', 'Mercy Ambogo', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(752, 'A014849417E', 'Getrude Laura Chao', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(753, 'A012684074A', 'Daisy Jelagat Kiprono', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(754, 'A010917690L', 'Denish Ochieng Onyore', '21000.00', '200.00', '20800.00', '2080.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(755, 'A013012807X', 'Clare Atsenga', '13000.00', '200.00', '12800.00', '1280.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11'),
(756, 'A003038228N', 'Kimani Kinyanjui', '16000.00', '200.00', '15800.00', '1580.00', '2400.00', '0.00', 'December', 2021, '2022-03-12 11:26:11', '2022-03-12 11:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `school_profiles`
--

CREATE TABLE `school_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motto` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `projectId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clientSecret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_profiles`
--

INSERT INTO `school_profiles` (`id`, `name`, `motto`, `postal`, `physical`, `contact1`, `contact2`, `contact3`, `contact4`, `email1`, `email2`, `email3`, `email4`, `website`, `logo`, `projectId`, `clientId`, `clientSecret`, `redirect`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'SchoolBest Academy', '\"Education Is The Key\"', 'P.O.BOX 12354-00508 NAIROBI', 'Dagoretti, Kenya', '0720871499', '0714730671', NULL, NULL, 'info@schoolbest.co.ke', NULL, NULL, NULL, 'www.schoolbest.co.ke', 'storage/profile\\1903687325.png', 'q7mezb53opiwcicfhklmyo2fveryztyy', '057826703d114b9f849f9f924bebf2cd', '9ae02a2b8a35484eade36c25414ad581', 'https://app.schoolbest.co.ke/v1//bulk-sms-delivery-report', 1, '2021-11-09 17:18:50', 1, '2021-11-09 17:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `staff_departments`
--

CREATE TABLE `staff_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_departments`
--

INSERT INTO `staff_departments` (`id`, `name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Teaching', 1, '2021-09-02 15:50:35', NULL, '2021-09-02 15:50:35'),
(2, 'Transport', 1, '2021-09-02 15:50:42', NULL, '2021-09-02 15:50:42'),
(3, 'Housekeeping', 1, '2021-09-09 14:52:12', NULL, '2021-09-09 14:52:12'),
(4, 'Adminstration', 1, '2021-09-09 14:57:43', NULL, '2021-09-09 14:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `staff_members`
--

CREATE TABLE `staff_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `marital` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `phoneno1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneno2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_department_id` bigint(20) UNSIGNED NOT NULL,
  `staff_section_id` bigint(20) UNSIGNED NOT NULL,
  `emp_type` int(11) NOT NULL DEFAULT '1',
  `tsc_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nssf` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nhif` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_members`
--

INSERT INTO `staff_members` (`id`, `slug`, `member_no`, `name`, `idno`, `gender`, `marital`, `dob`, `reg_date`, `phoneno1`, `phoneno2`, `email`, `staff_department_id`, `staff_section_id`, `emp_type`, `tsc_no`, `pin`, `nssf`, `nhif`, `bank_name`, `bank_branch`, `account_name`, `account_no`, `photo`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`) VALUES
(1, '4ns93-xdf5o-2raio-30urf-n3iyl-hzof', 'EMP0001', 'Moses Maina Njogu', '12345678', 1, 2, '1983-08-03', '2012-07-02', '0714730671', '0720871499', 'josnytechsolution@gmail.com', 1, 7, 1, '5648752', 'A0063078915H', '2004789654', '8523694', 'Equity Bank', 'Ruiru', 'Moses Maina Njogu', '51265478965320', 'storage/staff\\male.png', 1, 1, '2021-09-09 15:09:38', NULL, '2021-09-09 15:09:38', NULL),
(2, 'nmtbj-kpdww-oacus-jfl0p-jmirb-t6zj', 'EMP0002', 'Jane Mwende Mutiso', '87654321', 2, 1, '1993-05-05', '2018-10-01', '0720871499', '0714730671', 'josnytechsolution@yahoo.com', 1, 3, 1, '25874123', 'A00630211915H', '11587462258', '12547865', 'Cooperative Bank', 'Kawangware', 'Jane Mwende Mutiso', '01105647812900', 'storage/staff\\female.png', 1, 1, '2021-09-09 15:16:32', NULL, '2021-09-09 15:16:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_sections`
--

CREATE TABLE `staff_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_department_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff_sections`
--

INSERT INTO `staff_sections` (`id`, `staff_department_id`, `name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 2, 'Driver', 1, '2021-09-09 14:54:13', NULL, '2021-09-09 14:54:13'),
(2, 2, 'Conductor', 1, '2021-09-09 14:54:46', NULL, '2021-09-09 14:54:46'),
(3, 1, 'Kindergarten', 1, '2021-09-09 14:55:34', 1, '2021-09-09 15:00:26'),
(4, 1, 'Lower Primary', 1, '2021-09-09 14:56:54', 1, '2021-09-09 15:00:43'),
(5, 4, 'Head of Curriculum', 1, '2021-09-09 14:57:14', 1, '2021-09-09 15:04:14'),
(6, 4, 'Administrator', 1, '2021-09-09 14:58:09', NULL, '2021-09-09 14:58:09'),
(7, 1, 'Upper Primary', 1, '2021-09-09 15:01:13', NULL, '2021-09-09 15:01:13'),
(8, 4, 'Headteacher', 1, '2021-09-09 15:03:48', NULL, '2021-09-09 15:03:48');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_detail_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `class_stream_id` bigint(20) UNSIGNED NOT NULL,
  `expected` int(11) NOT NULL DEFAULT '0',
  `arrears` int(11) NOT NULL DEFAULT '0',
  `current` int(11) NOT NULL DEFAULT '0',
  `paid` int(11) NOT NULL DEFAULT '0',
  `balance` int(11) NOT NULL DEFAULT '0',
  `birth_cert` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nemis_upi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `dob` date NOT NULL,
  `doa` date NOT NULL,
  `yoc` year(4) DEFAULT NULL,
  `residence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adm_type` int(11) NOT NULL DEFAULT '1',
  `on_transport` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NO',
  `transport_zone_id` bigint(20) DEFAULT NULL,
  `way` int(4) DEFAULT NULL,
  `transport_fleet_id` bigint(20) DEFAULT NULL,
  `discount_level_id` bigint(20) UNSIGNED NOT NULL,
  `send_to` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `parent_detail_id`, `slug`, `admno`, `name`, `classroom_id`, `class_grade_id`, `class_stream_id`, `expected`, `arrears`, `current`, `paid`, `balance`, `birth_cert`, `nemis_upi`, `gender`, `dob`, `doa`, `yoc`, `residence`, `adm_type`, `on_transport`, `transport_zone_id`, `way`, `transport_fleet_id`, `discount_level_id`, `send_to`, `current_session_id`, `photo`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 4, 'zise7-irasc-6tape-ht1tx-k60jt-4qxp', 'SBT0001', 'Jane Njeri Mwaniki', 9, 9, 1, 27000, 0, 22000, 5000, 22000, '9153709', 'JH58S3', 2, '2009-07-22', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-03-02 20:55:38', 1, '2022-03-02 20:55:38', NULL, NULL),
(2, 5, 'vh3z6-eurb4-teu4h-kysu1-uhshc-nu3c', 'SBT0002', 'Moses Mwangi Njamba', 10, 10, 1, 34000, 0, 34000, 0, 34000, '0360816400', '', 1, '2008-09-16', '2021-05-03', NULL, 'kihunguro', 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(3, 6, 'kagly-tmjnd-lshds-1gcwv-5lqbm-6a6z', 'SBT0003', 'Jack Otieno Ogendo', 8, 8, 1, 45000, 0, 20000, 25000, 20000, '508327', 'XXZAUV', 1, '2009-11-17', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-26 15:24:54', 1, '2021-11-26 15:24:54', NULL, NULL),
(4, 7, 'fuk65-o7jez-orkw5-v1oye-wkoee-v7y7', 'SBT0004', 'Salome Mwende Mutiso', 8, 8, 1, 71500, 0, 14000, 57500, 14000, '94267', '4SC4UL', 1, '2010-04-13', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-06 12:11:53', 1, '2022-01-06 12:11:53', NULL, NULL),
(5, 8, 'icbl4-gcxjx-tvl2e-nrrvc-kgrur-ccps', 'SBT0005', 'Abigail Wambui Wangui', 8, 8, 1, 21000, 0, 800, 10200, 800, '564251', 'WULHUQ', 2, '2010-09-13', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-03-02 16:31:09', 1, '2022-03-02 16:31:09', NULL, NULL),
(6, 9, 'tas7w-jexp3-sk49x-gbmgb-zjim6-r9ps', 'SBT0006', 'Shawn Kinuthia Njenga', 8, 8, 1, 31500, 0, 1500, 30000, 1500, '459665', 'JJEW5K', 1, '2011-01-16', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-21 10:37:35', 1, '2022-01-21 10:37:35', NULL, NULL),
(7, 10, 'wobhu-t4v5r-cqd1q-yjcj2-8vfwc-a8qd', 'SBT0007', 'Yvonne Wanjiru Kimani', 8, 8, 1, 27750, 0, 26750, 1000, 26750, '9483122', 'JAHKUS', 2, '2010-09-26', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-02-07 09:38:52', 1, '2022-02-07 09:38:52', NULL, NULL),
(8, 11, 'adwhj-oplkq-sr5wz-sevjt-b4aee-xg2u', 'SBT0008', 'Christian Muchene', 8, 8, 1, 27000, 0, 27000, 0, 27000, '329835', 'JRL9Z2', 1, '2010-10-31', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:31', NULL, NULL),
(9, 12, 'qxroz-aud5r-lq9ho-bpyfj-qed8g-bmhl', 'SBT0009', 'Ivanna Wambui Kimani', 8, 8, 1, 27000, 0, 27000, 0, 27000, '658799', 'WGEMX6', 2, '2010-01-09', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:31', NULL, NULL),
(10, 13, 'wtkwb-lflbh-zsjdk-ghu6g-km2hd-jew5', 'SBT0010', 'Vivian Nyakio Waweru', 7, 7, 1, 0, 0, 0, 0, 0, '8039765', 'TCG37W', 2, '2010-10-20', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 2, 1, '2021-11-20 19:03:18', 2, '2021-11-12 11:46:31', NULL, NULL),
(11, 14, 'xohgq-0pohp-u5kso-ltfnc-gxhku-0f7k', 'SBT0011', 'Bernard Kamiti Mwaura', 8, 8, 1, 27000, 0, 7000, 20000, 7000, '72003', 'CS3WTC', 1, '2011-08-06', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:31', NULL, NULL),
(12, 15, 'xvlqj-iep0u-u5k8g-ojpfb-cedcq-gfmc', 'SBT0012', 'Amos Kipkorir', 9, 9, 1, 95000, 63000, 27000, 5000, 90000, '416904', 'WJK2QH', 2, '2009-07-25', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-02-24 11:39:09', 1, '2022-02-24 11:39:09', NULL, NULL),
(13, 16, 'de1qh-91nww-8k9qh-3selr-por22-gnwv', 'SBT0013', 'Justus Munene Kirangi', 7, 7, 1, 29500, 0, 29500, 0, 29500, '396138', 'K46KG2', 1, '2011-06-07', '2021-05-03', NULL, NULL, 2, 'YES', 22, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(14, 17, 'taa7a-kq7cm-ujggw-vwwqq-iojgr-kvcf', 'SBT0014', 'Benjamin Wanjala Shiundu', 8, 8, 1, 40250, 8000, 32250, 0, 40250, '175507', 'ZU5DKL', 1, '2011-02-15', '2021-05-03', NULL, NULL, 2, 'YES', 13, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(15, 18, 'nhpkb-4sjhg-l5vxq-ogvie-a5e7c-hhl4', 'SBT0015', 'Janelle Agutu Ontomwa', 8, 8, 1, 42500, 10000, 32500, 0, 42500, '0782152', 'QN2TEZ', 2, '2012-05-25', '2021-05-03', NULL, NULL, 2, 'YES', 3, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(16, 19, '177ps-1qr1d-s8kex-4v611-sbj8o-kjhy', 'SBT0016', 'Cindy Achieng Odhiambo', 7, 7, 1, 30000, 0, 30000, 0, 30000, '5405120', 'QRYSW5', 2, '2010-10-10', '2021-05-03', NULL, NULL, 2, 'YES', 6, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 2, 1, '2022-03-02 21:50:49', 1, '2021-11-12 11:46:31', NULL, NULL),
(17, 20, 'y8ajd-7lam0-grhag-xks7m-8eix4-gkn6', 'SBT0017', 'Amos Ochieng Odiwour', 9, 9, 1, 55450, 12500, 29950, 13000, 42450, '8604194', 'R8PBJH', 1, '2009-07-02', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-03-22 10:30:15', 1, '2022-03-22 10:30:15', NULL, NULL),
(18, 21, 'tmu4g-kczvd-c5abm-khf4s-bpsxz-82a8', 'SBT0018', 'Rayan Wanjohi Mureu', 7, 7, 1, 30000, 0, 30000, 0, 30000, '1560242', 'Gc73vv', 1, '2011-10-22', '2021-05-03', NULL, NULL, 2, 'YES', 24, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(19, 21, 'cub42-hsznk-ob4mh-krvru-8srau-idgh', 'SBT0019', 'Johnstone Kagwanja Muiruri', 7, 7, 1, 30000, 0, 30000, 0, 30000, '1546380', 'ZBFPXN', 1, '2011-10-22', '2021-05-03', NULL, NULL, 2, 'YES', 24, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(20, 22, 'i237n-7cexq-yinwc-ectxm-a0cyo-zz4u', 'SBT0020', 'Felistus Nyambura', 7, 7, 1, 37000, 0, 37000, 0, 37000, '8297852', 'C9YRE2', 2, '2012-07-18', '2021-05-03', NULL, NULL, 2, 'YES', 30, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(21, 23, '6lux7-2fsz2-4icrq-tlzya-ryxuw-kpyk', 'SBT0021', 'Evans Mwaniki', 7, 7, 1, 31000, 0, 31000, 0, 31000, '261675', '63E38B', 1, '2012-03-25', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(22, 55, '8j0xq-fvndv-8qa21-nbon5-zwfyy-anz2', 'SBT0022', 'Samwel Mureithi', 7, 7, 1, 31000, 0, 31000, 0, 31000, '1238860', 'LF7UZ6', 1, '2012-11-20', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(23, 24, 'qswuy-gttba-3b1n2-jehex-d601g-lszy', 'SBT0023', 'Faith Muthoni ', 7, 7, 1, 31500, 0, 31500, 0, 31500, '0444583', 'TM6TUL', 2, '2012-08-22', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(24, 80, 'akepm-o5hpb-6773c-w4h5v-djaj1-fl6d', 'SBT0024', 'Ian Jomo Kianangi ', 6, 6, 1, 33000, 0, 0, 33000, 0, '7618018', 'GMVP5Q', 1, '2013-03-21', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-12-15 20:43:28', 1, '2021-12-15 20:43:28', NULL, NULL),
(25, 25, 'a9l70-rz4cr-fzsah-mzz3s-r4rdv-kcyv', 'SBT0025', 'Shamira Wanjeri', 6, 6, 1, 33000, 0, 33000, 0, 33000, '1360036', 'C4UNHX', 2, '2013-11-02', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(26, 52, 'qjjht-s6vou-53vfi-kbydd-7jqcp-pc3n', 'SBT0026', 'Nicole Atieno Oliech', 9, 9, 1, 52400, 25400, 27000, 0, 52400, '1967625', 'XPQVFE', 2, '2009-10-30', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:31', NULL, NULL),
(27, 57, '7fmh4-viirj-q24g4-kr5aa-d2nmz-bet3', 'SBT0027', 'Jeremiah Wandaro', 6, 6, 1, 31000, 0, 31000, 0, 31000, '605915', '7V5C23', 1, '2012-07-22', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(28, 11, '2f6s1-gmxho-duogu-x0raq-ge7r8-pkqd', 'SBT0028', 'Onesmus Nyanteri', 6, 6, 1, 31000, 0, 31000, 0, 31000, '4160931', 'HQGAFK', 1, '2012-06-12', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(29, 32, 'sqipr-mtuci-tmzwf-ag26z-ppyqn-uiam', 'SBT0029', 'Jayden Nyamweya Omweri', 6, 6, 1, 35300, 300, 35000, 0, 35300, '0693584', 'G6JSNN', 1, '2012-05-26', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(30, 26, 'j7htj-fvlpw-ylbz8-l5ipj-pjht8-metm', 'SBT0030', 'Martha Wambui Mburu', 7, 7, 1, 31000, 0, 31000, 0, 31000, '01652018', '8ZTCUF', 2, '2011-07-31', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(31, 27, 'fxvkv-drdhx-rawaw-ekmc5-qnpqj-osu8', 'SBT0031', 'Leah Muthoni', 6, 6, 1, 31000, 0, 31000, 0, 31000, '4123109', '485FB6', 2, '2012-01-07', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(32, 28, 'apako-m82gz-i8unc-ivrmd-x8n9r-7df1', 'SBT0032', 'Chantaal Nyambura', 9, 9, 1, 35500, 0, 23500, 12000, 23500, '2158618', '7TNKC6', 2, '2010-12-24', '2021-05-03', NULL, NULL, 2, 'YES', 25, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(33, 29, 'xv2rb-arujl-iqbjj-eo7ul-yqx6d-ybow', 'SBT0033', 'Junior James Gitau', 7, 7, 1, 38000, 3000, 35000, 0, 38000, '352427', 'G3H5WP', 1, '2011-09-25', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(34, 30, 'yr6td-xbhyc-5wn5y-9m0rb-ums3z-fmg5', 'SBT0034', 'Anastacia Wanjira Njoki', 6, 6, 1, 26000, 0, 20000, 6000, 20000, '3000878', 'Y3DYBD', 2, '2012-04-18', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:31', NULL, NULL),
(35, 31, 'oygpn-ympfa-2r7ll-7bfvo-zdxzr-l9x2', 'SBT0035', 'Elizabeth Wambui', 5, 5, 1, 34000, 8000, 26000, 0, 34000, '1956165', '5ZXXHT', 2, '2013-08-20', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:31', NULL, NULL),
(36, 74, 'extqr-qwcah-ettm1-uinvq-f9eoy-lcmy', 'SBT0036', 'Delilah Wawendo Murage', 6, 6, 1, 33000, 0, 33000, 0, 33000, '1590378', 'R7YF7X', 2, '2013-11-03', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(37, 82, 's05hd-6hcv1-qh4kh-zudtk-tf7lc-fvwl', 'SBT0037', 'Monicah Njeri Kamau', 6, 6, 1, 31500, 0, 31500, 0, 31500, '284153', 'GCN4F7', 2, '2012-06-15', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(38, 99, 'pc3ms-l1hb4-vqklw-tvv8g-wqjkz-vvec', 'SBT0038', 'Rachael Kanyi', 5, 5, 1, 26000, 0, 26000, 0, 26000, '1967582', 'T4A5KP', 2, '2013-09-24', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:31', NULL, NULL),
(39, 32, 'c8sda-jwguo-cxe6k-fsdwu-klqo1-sae7', 'SBT0039', 'Kelsey Nyaboke', 5, 5, 1, 35000, 0, 35000, 0, 35000, '3559187', 'UCJTW4', 2, '2013-04-10', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(40, 33, 'jbebf-usxwi-hkdck-zki28-hyfvq-ghgq', 'SBT0040', 'Benson Macharia Wambugu', 5, 5, 1, 36500, 0, 17000, 19500, 17000, '116872', 'EHWTCY', 1, '2013-12-21', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-06 12:00:26', 1, '2022-01-06 12:00:26', NULL, NULL),
(41, 34, 'pfcjx-x1tst-cxx9m-htpaa-awb5m-oo8z', 'SBT0041', 'Maribell Mukami Nyanjau', 4, 4, 1, 41300, 0, 0, 41300, 0, '2361217', 'GJH4RR', 2, '2014-12-02', '2021-05-03', NULL, NULL, 2, 'YES', 4, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 2, 1, '2022-03-02 21:50:44', 1, '2021-11-12 11:46:32', NULL, NULL),
(42, 16, 'lofli-yvhva-czp27-7x4ip-vovy7-rwwm', 'SBT0042', 'Peter Kamau Maina', 5, 5, 1, 29500, 0, 29500, 0, 29500, '1986704', 'XN82CY', 1, '2013-05-10', '2021-05-03', NULL, NULL, 2, 'YES', 22, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(43, 53, 'dh9gi-migjg-rintr-ltunq-l5pvb-9lkv', 'SBT0043', 'Caleb Muikamba', 4, 4, 1, 39050, 0, 37050, 2000, 37050, '2841336', 'NZQ9R5', 1, '2014-05-17', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-03-02 19:42:27', 1, '2022-03-02 19:42:27', NULL, NULL),
(44, 35, 'zatk4-hut99-pecoe-cfohj-1qpbz-vp3e', 'SBT0044', 'Ethan Jones Maina', 5, 5, 1, 36900, 8400, 28500, 0, 36900, '5457935', 'XUV7GA', 1, '2013-10-23', '2021-05-03', NULL, NULL, 2, 'YES', 18, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(45, 35, 'y7kaw-wrcla-jecrn-rrwex-acj56-ijbz', 'SBT0045', 'Elaine Mwikali', 5, 5, 1, 35000, 6500, 28500, 0, 35000, '5457934', 'EA9P4E', 2, '2013-10-23', '2021-05-03', NULL, NULL, 2, 'YES', 18, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(46, 19, 'a0f9d-simcs-wmnnm-zxkmz-8k4n0-pgce', 'SBT0046', 'Glen Shuindu Wanyonyi', 4, 4, 1, 29300, 0, 29300, 0, 29300, '4748477', '5AEQJF', 1, '2014-04-05', '2021-05-03', NULL, NULL, 2, 'YES', 6, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 2, 1, '2022-03-02 21:50:53', 1, '2021-11-12 11:46:32', NULL, NULL),
(47, 23, 'n0cic-4v0nf-8cj3g-fdvdt-hexef-g9dr', 'SBT0047', 'Liz Wangui Kamau', 8, 8, 1, 27000, 0, 27000, 0, 27000, NULL, 'NZHXGG', 2, '2010-11-18', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:32', NULL, NULL),
(48, 38, 'tuul5-ioda5-fv8gr-ozog5-xxcvt-5bfz', 'SBT0048', 'Martin Gacheru', 5, 5, 1, 94000, 63000, 31000, 0, 94000, '9401626', 'E4A826', 1, '2014-05-30', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(49, 39, 'tp21f-vqdit-evcfz-o7vme-17trr-lomi', 'SBT0049', 'Phoebe Wangui Nyambura', 4, 4, 1, 35050, 0, 35050, 0, 35050, '4146746', 'XFYE5V', 2, '2016-03-29', '2021-05-03', NULL, NULL, 2, 'YES', 24, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(50, 40, 've7sd-z6uvq-rje9o-wroat-gtfen-l7tz', 'SBT0050', 'Allan Ndirangu Mwaura', 4, 4, 1, 37550, 0, 37550, 0, 37550, '7814088', '9UWT9Y', 1, '2013-06-30', '2021-05-03', NULL, NULL, 2, 'YES', 21, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(51, 41, '2gcdm-u48fy-z844r-sjivw-ym6go-jisl', 'SBT0051', 'Vincent Muteti', 8, 8, 1, 27000, 0, 27000, 0, 27000, '8482799', 'R4ZVNT', 1, '2008-01-06', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:32', NULL, NULL),
(52, 42, 'o33zc-l8brz-byqpt-xadgm-ahadu-xxia', 'SBT0052', 'Jacky Wamaitha Nyutu', 4, 4, 1, 36050, 0, 5050, 31000, 5050, '072170', 'LYQZQ5', 2, '2014-12-18', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(53, 43, 'k3uwn-bfo5v-js5ei-xgvzt-q7blk-imhv', 'SBT0053', 'Eliana Wanjira Thuku', 4, 4, 1, 56050, 19500, 36550, 0, 56050, '3995177', 'JGJA7K', 2, '2014-08-20', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(54, 20, 'icajw-weym0-v7c0n-hjz23-zspfx-eimp', 'SBT0054', 'Kelvin Ngugi Kamau', 4, 4, 1, 83750, 0, 23750, 60000, 23750, '8750363', 'HQGX5B', 1, '2014-07-14', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(55, 45, 'qs3dj-sztji-kyvnz-gsyll-vk3pg-o4ee', 'SBT0055', 'Michael Wanjiru Gichuga', 4, 4, 1, 36050, 0, 36050, 0, 36050, '0824049', '', 2, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(56, 46, 'iw0kq-ouixc-56r7m-nzqgf-0ocye-wkqz', 'SBT0056', 'James Ngugi Maina', 4, 4, 1, 40050, 0, 40050, 0, 40050, '189494', '7UVKKN', 2, '2014-09-08', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(57, 47, '8abqj-fhgjk-jnxoq-ymzx5-km1d5-tis5', 'SBT0057', 'Evans Kibue Kiama', 8, 8, 1, 27000, 0, 0, 27000, 0, '7099619', 'P6YP53', 1, '2011-03-13', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-12-15 20:37:13', 1, '2021-12-15 20:37:13', NULL, NULL),
(58, 48, 't9dyq-b75le-upfjy-qhhbt-dwddd-gthl', 'SBT0058', 'Marx Maina Muteria', 4, 4, 1, 36550, 0, 36550, 0, 36550, '346746', '', 1, '2015-02-16', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(59, 50, 'orfij-grbi9-ads5t-ffp9n-j9ihh-kyyj', 'SBT0059', 'Alex Kiriama Gitau', 5, 5, 1, 53850, 0, 3850, 54500, -650, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-02-25 07:50:37', 1, '2022-02-25 07:50:37', NULL, NULL),
(60, 49, 'd2ok0-jalch-afcjp-fs5tv-dijif-o6t4', 'SBT0060', 'Milanda Anyango Onyango', 4, 4, 1, 44050, 13000, 31050, 0, 44050, '5163021', '', 2, '2015-04-30', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(61, 50, 'lbpd9-zwpbz-zlxo3-hdg9a-bbktq-4ue1', 'SBT0061', 'Stacie Wanjiku Wamucii', 4, 4, 1, 52450, 21400, 31050, 0, 52450, 'AA104852', '', 2, '2015-10-06', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(62, 51, 'dzde2-ncim6-mq5ut-1kynb-hyuqa-hujr', 'SBT0062', 'Moses Kariuki Munyaka', 4, 4, 1, 37050, 0, 37050, 0, 37050, NULL, '', 1, '2015-08-06', '2021-05-03', NULL, NULL, 2, 'YES', 20, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(63, 52, 'qolii-vxt19-jwe4v-b3dmj-l9m2u-eonc', 'SBT0063', 'Horace Odara Obara', 6, 6, 1, 40600, 14600, 26000, 0, 40600, NULL, '', 2, '2012-09-14', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:32', NULL, NULL),
(64, 53, 'iggxv-r5cs5-aanhx-kgaqq-3cio8-wbs8', 'SBT0064', 'Kilvin Mutembei', 3, 3, 1, 30000, 0, 30000, 0, 30000, '261593396', '', 1, '2016-08-15', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(65, 121, 'hzwe0-so8xr-kyzrf-bwbiu-yhcaz-acw9', 'SBT0065', 'Jane Njambi Muriuki', 4, 4, 1, 51050, 6000, 40050, 5000, 46050, 'A0962823', '', 2, '2015-01-22', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(66, 55, 'hxrzi-uyelr-pyxga-vbst3-4nit9-tanq', 'SBT0066', 'Emmah Riziki Ashah', 4, 4, 1, 36050, 0, 36050, 0, 36050, '4123834', '', 2, '2015-07-11', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(67, 56, 'flkr9-kyanj-u4uok-aibfh-pu9ti-jmgg', 'SBT0067', 'Washington Nyongesa Masika', 3, 3, 1, 39000, 7000, 32000, 0, 39000, '1681506338', '', 1, '2015-05-26', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(68, 57, 'onu5u-fyxsm-trmrn-88clx-zrfgj-fcv4', 'SBT0068', 'Joanace Gathiga Mwaniki', 3, 3, 1, 30000, 0, 30000, 0, 30000, '5654308', '', 2, '2015-09-22', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(69, 58, 'fwv28-an4ek-28aiz-rci4p-d58gw-4gia', 'SBT0069', 'Jane Karinge Mande', 4, 4, 1, 36050, 0, 36050, 0, 36050, '8750872', '', 2, '2014-12-18', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(70, 59, 'j5zwy-t9sw3-eufo8-dbk5p-5b2du-lixl', 'SBT0070', 'Claudia Wanjiku Wabera', 3, 3, 1, 30000, 0, 28000, 2000, 28000, '5749082', '', 2, '2015-09-23', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-03-02 18:06:11', 1, '2022-03-02 18:06:11', NULL, NULL),
(71, 60, 'xzyhy-0qlcu-zbuah-d7s7w-lechy-ihf5', 'SBT0071', 'Vincent Kungu Kimathi', 4, 4, 1, 31050, 0, 31050, 0, 31050, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(72, 61, 'gkunj-uoge3-vzrvo-qwlhg-3brko-2knv', 'SBT0072', 'Eddie Karanja Kiogora', 3, 3, 1, 30000, 0, 30000, 0, 30000, '0261593379', '', 1, '2015-08-14', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(73, 62, 'ddgts-vpeo9-xw5xn-0pqxt-xmzgy-zbhv', 'SBT0073', 'Susan Naemba Wanjala', 3, 3, 1, 34000, 0, 34000, 0, 34000, NULL, '', 1, '2014-12-15', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(74, 63, 'trspj-s8prm-hnz0a-v65rs-0heqi-8wzp', 'SBT0074', 'Adriel Maina Macharia', 4, 4, 1, 40550, 0, -750, 41300, -750, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-03-02 17:00:31', 1, '2022-03-02 17:00:31', NULL, NULL),
(75, 64, '1tlbl-h3tpt-ugrag-5blqk-zzuvz-ocbg', 'SBT0075', 'Quintah Wema Gitonga', 3, 3, 1, 30500, 500, 30000, 0, 30500, '1265363', '', 2, '2015-07-06', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(76, 65, '3gv37-vfcmw-qftyq-fote9-pqppp-zlvt', 'SBT0076', 'Mathias Njenga Macharia', 3, 3, 1, 28250, 0, 28250, 0, 28250, NULL, '', 1, '2016-08-13', '2021-05-03', NULL, NULL, 2, 'YES', 21, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(77, 66, 'mvqgd-f6xxp-1xyhm-hqqzz-vdlbe-n8ek', 'SBT0077', 'Mike Gichinga Kimani', 6, 6, 1, 33500, 0, 33500, 0, 33500, '082181', '', 1, '2012-11-28', '2021-05-03', NULL, NULL, 2, 'YES', 23, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(78, 31, 'ahyzq-uivq2-ma7eh-kft1l-uvzct-yuzg', 'SBT0078', 'Loreen Njeri Njeru', 3, 3, 1, 35000, 10000, 25000, 0, 35000, '6229372', '', 2, '2015-08-23', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:33', NULL, NULL),
(79, 41, '3vdvi-qchxl-aqv3l-ol4p4-5dmh9-aexi', 'SBT0079', 'Terrence Otieno', 3, 3, 1, 25000, 0, 25000, 0, 25000, '380584', '', 1, '2016-03-26', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:33', NULL, NULL),
(80, 68, 'ymgvi-91mis-neiwd-rojbu-hr56m-acsk', 'SBT0080', 'Janet Pendo Mwamba', 6, 6, 1, 32500, 0, 32500, 0, 32500, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'YES', 21, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(81, 69, 'rqjss-dsrbo-ckbqe-ldsld-giwpl-qnan', 'SBT0081', 'Imani Nyanumba', 3, 3, 1, 30800, 5800, 25000, 0, 30800, NULL, '', 2, '2016-04-19', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:33', NULL, NULL),
(82, 70, 'vwadx-hduwy-ykzdg-n43nv-ezyvj-gljv', 'SBT0082', 'Moses Karanja', 3, 3, 1, 30000, 0, 30000, 0, 30000, NULL, '', 1, '2016-04-15', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(83, 71, 'ramlw-f8wir-e0i02-ark5v-itrry-5pgu', 'SBT0083', 'Ethern Mungai Githinga', 3, 3, 1, 31500, 0, 31500, 0, 31500, NULL, '', 1, '2015-04-10', '2021-05-03', NULL, NULL, 2, 'YES', 21, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(84, 72, 'agm1o-btdu8-tfpfk-alcbu-wmwgt-vg90', 'SBT0084', 'Jackson Gichuhi Muchiri', 6, 6, 1, 26000, 0, 26000, 0, 26000, NULL, '', 1, '2013-07-17', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:33', NULL, NULL),
(85, 73, 'ijy2l-v2wka-eyrvi-nspnj-b22w6-jf0s', 'SBT0085', 'Yvette Moraa Moracha', 6, 6, 1, 29500, 0, 29500, 0, 29500, NULL, '', 2, '2012-08-19', '2021-05-03', NULL, NULL, 2, 'YES', 22, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(86, 74, 'hn0qe-gr6ze-lmtvc-m4ioz-pavvd-ga3e', 'SBT0086', 'Kyla Wanjeri', 3, 3, 1, 32000, 0, 32000, 0, 32000, '6939384', '', 2, '2016-07-03', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(87, 73, '2b1oo-rvivr-t5lgy-sk8jm-rhxye-fv8n', 'SBT0087', 'Victoria Valery', 3, 3, 1, 28500, 0, 28500, 0, 28500, NULL, '', 2, '2016-09-07', '2021-05-03', NULL, NULL, 2, 'YES', 22, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(88, 75, 'gnvtz-nl9d5-pknpb-8tkkc-ddetx-ehbp', 'SBT0088', 'Tanice Simintei', 5, 5, 1, 35000, 0, 35000, 0, 35000, NULL, '', 2, '2014-03-29', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(89, 76, 'uz7ae-0nsqm-ecgyh-upko6-cusq0-3nlr', 'SBT0089', 'Fiona Chepchirchir Cheruiyot', 5, 5, 1, 42600, 5600, 35000, 0, 40600, NULL, '', 2, '2014-07-20', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-03-02 19:42:27', 1, '2022-03-02 19:42:27', NULL, NULL),
(90, 77, 'aasoi-burlf-ypupx-dixbb-omixb-amiq', 'SBT0090', 'Terryann Cheruto', 5, 5, 1, 34000, 0, 34000, 0, 34000, NULL, '', 2, '2013-07-17', '2021-05-03', NULL, NULL, 2, 'YES', 24, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(91, 78, 'aebnv-s261y-oec7t-prd0n-uvdco-5h1t', 'SBT0091', 'Robert Mbugua Wanyeki', 2, 2, 1, 40000, 9000, 31000, 0, 40000, '6687319', '', 1, '2016-07-06', '2021-05-03', NULL, NULL, 2, 'YES', 20, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(92, 79, 'njhes-k8wes-ttcqs-2f7cn-rd2bz-gsmp', 'SBT0092', 'Viviana Njambi Njuguna', 9, 9, 1, 34500, 0, 34500, 0, 34500, '187105', '', 2, '2009-02-28', '2021-05-03', NULL, NULL, 2, 'YES', 23, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(93, 80, '9dahs-ehh70-psvro-b66xc-tqo8d-i9o1', 'SBT0093', 'Maya Blessing Mwandie', 2, 2, 1, 32000, 0, 32000, 0, 32000, NULL, '', 2, '2016-08-20', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students/1093207270.jpg', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(94, 81, 'm2gvq-zzew9-pg0zn-i2lcs-bc2q7-jrx7', 'SBT0094', 'Isabella Muthoni', 2, 2, 1, 30500, 0, 30500, 0, 30500, NULL, '', 2, '2016-10-05', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(95, 82, 'pn391-lq51n-so5js-mvtp1-xqqnw-ngfu', 'SBT0095', 'Natalie Muthoni Muthomi', 2, 2, 1, 30500, 0, 30500, 0, 30500, '7053834', '', 2, '2017-05-01', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(96, 83, 'zhpdw-uhhbs-lhhd4-8tros-udf20-9qqf', 'SBT0096', 'Lilian Njoki Mbiu', 6, 6, 1, 31500, 0, 31500, 0, 31500, '3032243', '', 2, '2013-09-01', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(97, 84, 're98w-ajjze-4ebvm-ct0sb-v6qfm-phtd', 'SBT0097', 'Immaculate Nyambura Nderitu', 10, 10, 1, 27000, 0, 27000, 0, 27000, '5656512', '', 2, '2021-05-03', '2021-05-03', NULL, 'TOLL AREA', 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(98, 1, 'oyypj-4d1wf-27ib2-q762e-mad2e-ps2v', 'SBT0098', 'Imela Waembu Karimi', 8, 8, 1, 33200, 0, 33200, 0, 33200, NULL, '', 2, '2021-05-03', '2021-05-03', NULL, 'kenyatta road', 2, 'YES', 24, 2, NULL, 1, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(99, 1, 'ufkxg-klesy-zjkdn-pyljh-yk6ss-bvwb', 'SBT0099', 'Asher Mwalimu', 2, 2, 1, 36250, 0, 25250, 11000, 25250, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'YES', 17, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(100, 11, 'kagdf-6nr6o-eefsb-n4y30-ruaam-bwai', 'SBT0100', 'Davies Ngugi Gathogo', 2, 2, 1, 23100, 0, -400, 23500, -400, NULL, '', 1, '2016-10-20', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-20 15:21:34', NULL, NULL),
(101, 86, 'c6etz-scnho-csjui-rojvi-1euu8-nlcr', 'SBT0101', 'Tamara Wangui Nungari', 2, 2, 1, 25000, 0, 25000, 0, 25000, NULL, '', 2, '2016-03-23', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(102, 1, '2il1h-s0qxm-tfuiv-ho7yg-j8doq-yois', 'SBT0102', 'Keslie Njoki Mwendandu', 3, 3, 1, 32500, 0, 32500, 0, 32500, NULL, '', 2, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'YES', 23, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(103, 87, 'f5kxu-sl0vk-i6qka-f3p1o-ltpco-rslm', 'SBT0103', 'Oliver Wekesa Shilandura', 3, 3, 1, 30000, 0, 30000, 0, 30000, NULL, '', 1, '2016-12-18', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(104, 88, 'szi05-9rrr9-z6pif-lmwmn-vckpu-c8fe', 'SBT0104', 'Declan Mbecha Kuria', 3, 3, 1, 32000, 0, 32000, 0, 32000, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(105, 89, 'cylfm-ueu0o-achuq-zxe0w-2gllw-5r8q', 'SBT0105', 'Hellen Wangui Wanjiru', 10, 10, 1, 27000, 0, 27000, 0, 27000, '897805', '', 2, '2008-03-21', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(106, 1, 'jb0ae-qfc5i-4n8gl-pnicm-bzv1b-neif', 'SBT0106', 'Alice Njeri Makena', 2, 2, 1, 25000, 0, 25000, 0, 25000, NULL, '', 2, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(107, 111, 'cd1zi-vi2oh-4umjv-k1ere-cs9zg-htsn', 'SBT0107', 'Nancy Nduta Kanyiri', 3, 3, 1, 30000, 0, 30000, 0, 30000, NULL, '', 2, '2016-12-04', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(108, 90, 'sixjk-dmk2q-vwrsq-0lv1b-1gxew-a6k1', 'SBT0108', 'Tracyann Wambui Mwendia', 2, 2, 1, 32000, 0, 32000, 0, 32000, NULL, '', 2, '2016-08-07', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(109, 91, 'jnifu-gb1ld-m1fjz-5a6ww-zdkx7-a3gf', 'SBT0109', 'Elius Waringa Nduta', 10, 10, 1, 27000, 0, 27000, 0, 27000, '57063', '', 1, '2008-11-16', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(110, 1, '5phif-vanqr-apwlo-ehuoy-v63ak-duuf', 'SBT0110', 'Wilberforce Simiyu', 10, 10, 1, 27000, 0, 27000, 0, 27000, NULL, '', 1, '2005-03-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(111, 92, 'cagcs-51msc-ykuhp-vwajq-a5s1u-askb', 'SBT0111', 'Purity Agunda Ochieng', 10, 10, 1, 27000, 0, 27000, 0, 27000, NULL, '', 1, '2007-10-06', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(112, 93, 'wpmvc-sysiq-q7zzu-omj6k-nb9tp-fcxs', 'SBT0112', 'Kelseyann Gathoni Gacheru', 10, 10, 1, 27000, 0, 27000, 0, 27000, NULL, '', 2, '2007-08-20', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(113, 94, 'vfjcs-7pn75-vrxat-itxr2-8ngdc-8zb6', 'SBT0113', 'Innocent Simiyu Wanjala', 10, 10, 1, 33500, 0, 8500, 25000, 8500, NULL, '', 1, '2008-08-02', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-20 07:51:40', 1, '2022-01-20 07:51:40', NULL, NULL),
(114, 95, 'rykzr-mbhb8-3rcll-16ssc-sl6hz-qb8y', 'SBT0114', 'Verena Waturi Mburu', 3, 3, 1, 37000, 0, 37000, 0, 37000, NULL, '', 2, '2014-10-31', '2021-05-03', NULL, NULL, 2, 'YES', 32, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(115, 96, '4x5lk-ooebt-mpq5h-cppdw-18n64-dfxh', 'SBT0115', 'Shirleen Gathoni', 6, 6, 1, 36000, 0, 36000, 0, 36000, NULL, '', 2, '2012-06-15', '2021-05-03', NULL, NULL, 2, 'YES', 28, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(116, 97, 'rptpg-t8zph-icksr-bo4vi-gzqga-aw4g', 'SBT0116', 'Natania Wanjiku', 2, 2, 1, 33000, 0, 33000, 0, 33000, NULL, '', 2, '2017-11-03', '2021-05-03', NULL, NULL, 2, 'YES', 24, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(117, 98, 'cxrwb-ybher-venfu-thpbr-d02ja-icog', 'SBT0117', 'Allan Macharia Munyaka', 2, 2, 1, 44500, 0, 2500, 42000, 2500, NULL, '', 1, '2016-07-04', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-12-15 20:41:26', 1, '2021-12-15 20:41:26', NULL, NULL),
(118, 99, 'rr2o2-8pawo-5nvye-ahvju-vrli8-e8ed', 'SBT0118', 'Melanie Wamuyu Wanyoike', 2, 2, 1, 25000, 0, 25000, 0, 25000, NULL, '', 2, '2017-11-23', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(119, 100, 'e188h-qwwba-zfa5x-y4z4f-d9xqd-gicx', 'SBT0119', 'Vivian Wangui Nduati', 2, 2, 1, 32000, 7000, 25000, 0, 32000, NULL, '', 2, '2017-04-22', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(120, 101, 'x9179-fue0y-7hajl-idfhq-r5sqf-0que', 'SBT0120', 'Fabius Wanderi Nderu', 6, 6, 1, 32000, 500, 31500, 0, 32000, '2493438', '', 1, '2013-12-15', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(121, 64, 'meqvc-iymki-xvvfx-omdoo-kul9i-xeo8', 'SBT0121', 'Daniel Muturi Chomba', 2, 2, 1, 34000, 4500, 29500, 0, 34000, NULL, '', 1, '2017-09-02', '2021-05-03', NULL, NULL, 2, 'YES', 17, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(122, 102, 'upzz2-jrdod-gccck-anuch-qtikw-hgmw', 'SBT0122', 'Nyce Waithera', 2, 2, 1, 29500, 0, 29500, 0, 29500, '9975335', '', 2, '2017-11-13', '2021-05-03', NULL, NULL, 2, 'YES', 17, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(123, 28, 'a71wh-rq0h1-6gp2p-rt8up-a3h3s-khzw', 'SBT0123', 'David Kimiti Mateu', 3, 3, 1, 30500, 0, 30500, 0, 30500, NULL, '', 1, '2016-03-23', '2021-05-03', NULL, NULL, 2, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(124, 15, 'cz0ur-6ykdn-iwjto-o0egb-zuv13-xed6', 'SBT0124', 'Celine Wairimu Chege', 2, 2, 1, 42250, 0, 27250, 15000, 27250, '6585305', '', 2, '2016-06-12', '2021-05-03', NULL, NULL, 2, 'YES', 17, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-12-15 11:43:34', 1, '2021-12-15 11:43:34', NULL, NULL),
(125, 104, 'fxh5c-ui8o1-gpj0k-jarqu-bqups-6ukk', 'SBT0125', 'Esther Achieng Oluoch', 2, 2, 1, 34000, 0, 34000, 0, 34000, '4462436', '', 2, '2014-12-29', '2021-05-03', NULL, NULL, 2, 'YES', 26, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(126, 105, 'rdrlu-8clyu-znmi7-tw9k4-zor6r-jr1q', 'SBT0126', 'Andrew Karanu Njoroge', 2, 2, 1, 31950, 0, 21950, 10000, 21950, '463302', '', 1, '2017-08-21', '2021-05-03', NULL, NULL, 2, 'YES', 18, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-02-08 09:27:57', 1, '2022-02-08 09:27:57', NULL, NULL),
(127, 1, 'lqxr3-oob1k-bdkkc-t8ofw-etvjr-7mbw', 'SBT0127', 'Edrian Karanja Mbugua', 2, 2, 1, 33000, 0, 33000, 0, 33000, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'YES', 24, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(128, 106, '6lllu-rgnre-8r0km-l17ug-grjtc-shiy', 'SBT0128', 'Clement Njoroge Kamau', 6, 6, 1, 59800, 33800, 26000, 0, 59800, '05008', '', 1, '2012-04-17', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(129, 106, '6bdb6-zbafh-uwze0-xffjl-tvpd6-xwal', 'SBT0129', 'Jayson Kiarie Manyeki', 2, 2, 1, 44600, 19600, 25000, 0, 44600, NULL, '', 1, '2016-06-12', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(130, 107, '2ecjr-vfxmq-h2urr-op8ty-pdk3b-l8b7', 'SBT0130', 'Caleb Moses', 9, 9, 1, 35000, 0, 0, 35000, 0, '561035', '', 1, '2009-06-12', '2021-05-03', NULL, NULL, 2, 'YES', 24, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-12-15 20:38:03', 1, '2021-12-15 20:38:03', NULL, NULL),
(131, 108, 'pt5xp-d2uga-ceriz-dddpf-2wfk1-luqq', 'SBT0131', 'Siobhan Sibwoga', 2, 2, 1, 34500, 0, 34500, 0, 34500, NULL, '', 2, '2017-10-08', '2021-05-03', NULL, NULL, 2, 'YES', 27, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(132, 109, 'elfv6-qjrc5-wgh0o-vrpfl-p1p4b-0vxr', 'SBT0132', 'Tasha Baraka Wangeci', 6, 6, 1, 48800, 14800, 34000, 0, 48800, NULL, '', 2, '2012-08-17', '2021-05-03', NULL, NULL, 2, 'YES', 24, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(133, 110, 'yekax-huiyy-1syjx-hn2op-ri14n-nv4t', 'SBT0133', 'Rebecca Kendi Muraya', 4, 4, 1, 38050, 0, 38050, 0, 38050, '6759901', '', 2, '2015-09-06', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-01-21 12:02:48', 1, '2022-01-21 12:02:48', NULL, NULL),
(134, 110, 'jnioy-akapz-i24op-pbuzr-pm8yr-5hjz', 'SBT0134', 'Taraji Wanjiru Kimemia', 2, 2, 1, 32000, 0, 32000, 0, 32000, NULL, '', 2, '2017-04-20', '2021-05-03', NULL, NULL, 2, 'YES', 22, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(135, 111, 'tyowz-ayavv-mpv9u-7eh5h-mrbl1-hsrp', 'SBT0135', 'Roy Mungai Muigai', 7, 7, 1, 31000, 0, 31000, 0, 31000, '79661', '', 1, '2011-09-23', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:02', 1, '2021-11-20 19:01:02', NULL, NULL),
(136, 112, 'bv8bn-uezmf-dcuzw-utr5r-iax2y-v3ya', 'SBT0136', 'Zenita Wangui Blessings', 2, 2, 1, 30000, 0, 30000, 0, 30000, '001156197', '', 2, '2017-06-13', '2021-05-03', NULL, NULL, 2, 'YES', 18, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(137, 113, 'gajdm-bqzlj-m168i-a2vgc-3ocpo-5rok', 'SBT0137', 'John Njagi Mwaura', 5, 5, 1, 30000, 4000, 26000, 0, 30000, '5915484', '', 1, '2015-02-27', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(138, 112, 'l46hl-wukuh-h4z18-0p9v4-2qza8-ys4i', 'SBT0138', 'Alicia Mwitemania Kariuki', 2, 2, 1, 25000, 0, 15000, 10000, 15000, NULL, '', 2, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2022-03-22 10:33:16', 1, '2022-03-22 10:33:16', NULL, NULL),
(139, 1, 'frkgj-ckchm-tnl69-oeyn6-xu8oz-mtaq', 'SBT0139', 'Aiden Njega Njogu', 3, 3, 1, 23000, 0, 23000, 0, 23000, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 2, 1, '2021-11-20 19:03:18', 2, '2021-11-12 11:46:34', NULL, NULL),
(140, 12, 'gmlo7-4uva6-sdjmi-aiy7l-n8bpi-nx0l', 'SBT0140', 'Abraham Nyutu Kimani', 2, 2, 1, 35000, 0, -7000, 42000, -7000, NULL, '', 1, '2021-05-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-01-11 11:43:38', 1, '2022-01-11 11:43:38', NULL, NULL),
(141, 115, 'jqcoo-upar7-k4wj4-skoyg-cqhl4-rxqf', 'SBT0141', 'Queenter Nguhi Kimani', 5, 5, 1, 0, 0, 0, 0, 0, NULL, '', 2, '2013-07-03', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 2, 1, '2021-11-20 19:03:18', 2, '2021-11-12 11:46:34', NULL, NULL),
(142, 116, 'ummwg-rlukd-nqdif-bdgmv-i6ok1-cjjn', 'SBT0142', 'Linah Warembo', 2, 2, 1, 25000, 0, 25000, 0, 25000, NULL, '', 2, '2018-09-13', '2021-05-03', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 1, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(143, 122, 'bm3h7-8djfc-djpja-afz04-akpqp-oc2o', 'SBT0143', 'Luciano Thuo Wanjohi', 2, 2, 1, 25000, 0, 25000, 0, 25000, NULL, '', 1, '2017-04-26', '2021-05-12', NULL, 'TOLL 619', 1, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 2, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(144, 123, '1ln4c-i5a2y-zzyas-jrm9p-l73jn-ionw', 'SBT0144', 'Veronicah Wamucii Munini', 2, 2, 1, 23400, 0, 23400, 0, 23400, '0361715474', '', 2, '2017-11-07', '2021-05-12', NULL, NULL, 1, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(145, 124, '2zene-jlkor-bd2br-gvxvr-5srh1-xaoi', 'SBT0145', 'Mitchell Waceke Nduati', 2, 2, 1, 29300, 0, 29300, 0, 29300, '0263773469', '', 2, '2018-09-30', '2021-05-12', NULL, 'JUJA SHALOM', 1, 'YES', 26, 1, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(146, 125, 'bizkg-mayc8-b9bqh-wibui-10q9k-oxwa', 'SBT0146', 'Elijah Githua Njoroge', 8, 8, 1, 28800, 1800, 27000, 0, 28800, NULL, '', 1, '2011-07-18', '2021-05-12', NULL, 'TOLL AREA', 1, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 2, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(147, 126, 'b3fci-zjxlo-xf6vi-i8p80-wirif-5ijn', 'SBT0147', 'Joe Kagai', 6, 6, 1, 29000, 3000, 26000, 0, 29000, NULL, '', 1, '2011-09-20', '2021-05-12', NULL, 'TOLL AREA', 1, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 2, '2021-11-20 19:03:18', 1, '2021-11-12 11:46:34', NULL, NULL),
(148, 127, 'wghx1-csxxz-likmw-dehgq-x57ws-nj0o', 'SBT0148', 'Tamilla Noni Njenga', 2, 2, 1, 28800, 3800, 25000, 0, 28800, NULL, '', 2, '2018-09-24', '2021-05-12', NULL, 'TOLL AREA', 1, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2021-11-20 19:01:52', 1, '2021-11-12 11:46:34', NULL, NULL),
(149, 128, 'udtnx-uiy3q-biaxa-oxabp-iz6sc-vzuk', 'SBT0149', 'Simeone Mutua Kilonzo', 2, 2, 1, 33000, 0, 33000, 0, 33000, '0191613004', '', 1, '2016-12-04', '2021-05-12', NULL, 'BETHLEHEM AREA', 1, 'YES', 24, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 2, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(150, 129, 'zbash-fhvkn-ichlf-ymnz9-r3o3v-6bur', 'SBT0150', 'Fabian Muchene Murugami', 2, 2, 1, 30500, 0, 30500, 0, 30500, '0261799987', '', 2, '2017-04-14', '2021-05-12', NULL, 'TOLL 5TH STREET', 1, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(151, 130, 'uq84j-cxnrk-tim9u-ds841-llnzl-u7ad', 'SBT0151', 'Annice Waithira Kungu', 2, 2, 1, 36500, 500, 0, 36000, 500, NULL, '', 2, '2017-04-04', '2021-05-12', NULL, 'TOLL AREA', 1, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2022-03-02 18:02:42', 1, '2022-03-02 18:02:42', NULL, NULL),
(152, 131, '1rzg9-72qbm-ff8zi-khlpb-7yd6g-h8ca', 'SBT0152', 'Jacinta Wahito Kahura', 3, 3, 1, 30500, 0, 30500, 0, 30500, '261588474', '', 2, '2015-08-05', '2021-05-12', NULL, 'toll area', 1, 'YES', 19, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL);
INSERT INTO `students` (`id`, `parent_detail_id`, `slug`, `admno`, `name`, `classroom_id`, `class_grade_id`, `class_stream_id`, `expected`, `arrears`, `current`, `paid`, `balance`, `birth_cert`, `nemis_upi`, `gender`, `dob`, `doa`, `yoc`, `residence`, `adm_type`, `on_transport`, `transport_zone_id`, `way`, `transport_fleet_id`, `discount_level_id`, `send_to`, `current_session_id`, `photo`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(153, 132, '0adqu-uylxf-pgoie-c056s-vj8rj-bw01', 'SBT0153', 'Cherly Wambui Gitagia', 2, 2, 1, 34500, 0, 34500, 0, 34500, NULL, '', 2, '2017-01-15', '2021-05-12', NULL, NULL, 1, 'YES', 27, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(154, 133, 'p5yla-3w12n-diynu-diwuo-gxq99-5o7x', 'SBT0154', 'Shadrack Odhiambo Odiwour', 6, 6, 1, 177500, 142000, 35500, 0, 177500, NULL, '', 1, '2012-12-13', '2016-01-11', NULL, 'juja capital', 2, 'YES', 27, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 2, '2021-11-20 19:01:03', 1, '2021-11-20 19:01:03', NULL, NULL),
(155, 134, 'hlea7-nakqg-1ih8w-sb4em-bj99k-fe2n', 'SBT0155', 'Precious Waithera Muteria', 2, 2, 1, 31000, 0, 31000, 0, 31000, '2616118542', '', 2, '2016-10-03', '2020-01-08', NULL, 'TOLL AREA', 2, 'YES', 20, 2, NULL, 4, 'primary_contact', 2, 'storage/students\\female.png', 1, 2, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(156, 134, 'n8yle-aqqla-iwtp5-vtqfu-rvmic-ikqs', 'SBT0156', 'Meshack Kiarie Njuguna', 2, 2, 1, 56800, 0, 34800, 2000, 34800, '2616118543', '', 1, '2016-10-03', '2020-01-08', NULL, 'TOLL AREA', 2, 'YES', 20, 2, NULL, 1, 'primary_contact', 2, 'storage/students\\male.png', 1, 2, '2022-02-07 09:33:38', 1, '2022-02-07 09:33:38', NULL, NULL),
(159, 137, 'khwdc-fbtsu-nc0d7-fcf1t-iqdkn-gfvt-20211115140805', 'SBT0157', 'Moses Githegi Nduati', 1, 1, 1, 45900, 0, 45900, 0, 45900, '06542584', 'NM89RT', 1, '2021-11-15', '2021-11-15', NULL, NULL, 1, 'YES', 13, 2, NULL, 1, 'both_contacts', 2, 'storage/students\\male.png', 1, 1, '2021-11-20 19:01:04', 1, '2021-11-20 19:01:04', NULL, NULL),
(160, 138, 'o7lk4-i8rt5-ggdpo-c7gue-3oofn-a5np-20211201112134', 'SBT0158', 'Amos Wangai Muchene', 1, 1, 1, 105800, 0, 31800, 14000, 31800, NULL, '', 1, '2021-04-06', '2021-10-01', NULL, NULL, 1, 'YES', 12, 2, 1, 4, 'primary_contact', 2, 'storage/students\\male.png', 1, 1, '2022-03-02 20:54:38', 1, '2022-03-02 20:54:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_fees`
--

CREATE TABLE `student_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `fee_parameter_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_fees`
--

INSERT INTO `student_fees` (`id`, `student_id`, `current_session_id`, `fee_parameter_id`, `description`, `class_grade_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(4, 2, 1, 3, 'General Fee', 9, 18000, 1, 1, '2021-05-08 13:07:51', NULL, '2021-05-08 13:07:51', NULL, NULL),
(5, 2, 1, 5, 'General Fee', 9, 6000, 1, 1, '2021-05-08 13:07:51', NULL, '2021-05-08 13:07:51', NULL, NULL),
(34, 12, 1, 3, 'General Fee', 8, 18000, 1, 1, '2021-05-08 14:24:36', NULL, '2021-05-08 14:24:36', NULL, NULL),
(35, 12, 1, 5, 'General Fee', 8, 6000, 1, 1, '2021-05-08 14:24:36', NULL, '2021-05-08 14:24:36', NULL, NULL),
(37, 13, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-08 14:31:52', NULL, '2021-05-08 14:31:52', NULL, NULL),
(38, 13, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-08 14:31:52', NULL, '2021-05-08 14:31:52', NULL, NULL),
(43, 15, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-08 15:49:04', NULL, '2021-05-08 15:49:04', NULL, NULL),
(46, 16, 1, 3, 'General Fee', 7, 17000, 1, 1, '2021-05-08 15:54:37', NULL, '2021-05-08 15:54:37', NULL, NULL),
(47, 16, 1, 5, 'General Fee', 7, 6000, 1, 1, '2021-05-08 15:54:37', NULL, '2021-05-08 15:54:37', NULL, NULL),
(49, 17, 1, 3, 'General Fee', 8, 18000, 1, 1, '2021-05-08 15:57:49', NULL, '2021-05-08 15:57:49', NULL, NULL),
(50, 17, 1, 5, 'General Fee', 8, 6000, 1, 1, '2021-05-08 15:57:49', NULL, '2021-05-08 15:57:49', NULL, NULL),
(52, 18, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-08 16:03:23', NULL, '2021-05-08 16:03:23', NULL, NULL),
(53, 18, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-08 16:03:23', NULL, '2021-05-08 16:03:23', NULL, NULL),
(55, 19, 1, 3, 'General Fee', 6, 15300, 1, 1, '2021-05-10 08:12:24', NULL, '2021-05-08 16:09:13', NULL, NULL),
(56, 19, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-08 16:09:13', NULL, '2021-05-08 16:09:13', NULL, NULL),
(58, 20, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-08 16:21:02', NULL, '2021-05-08 16:21:02', NULL, NULL),
(59, 20, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-08 16:21:02', NULL, '2021-05-08 16:21:02', NULL, NULL),
(60, 20, 1, 4, 'General Fee', 6, 1000, 1, 1, '2021-05-08 16:21:02', NULL, '2021-05-08 16:21:02', NULL, NULL),
(61, 21, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-09 14:24:29', NULL, '2021-05-09 14:24:29', NULL, NULL),
(62, 21, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-09 14:24:29', NULL, '2021-05-09 14:24:29', NULL, NULL),
(63, 21, 1, 4, 'General Fee', 6, 1000, 1, 1, '2021-05-09 14:24:29', NULL, '2021-05-09 14:24:29', NULL, NULL),
(64, 22, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-09 14:26:22', NULL, '2021-05-09 14:26:22', NULL, NULL),
(65, 22, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-09 14:26:22', NULL, '2021-05-09 14:26:22', NULL, NULL),
(66, 22, 1, 4, 'General Fee', 6, 1000, 1, 1, '2021-05-09 14:26:22', NULL, '2021-05-09 14:26:22', NULL, NULL),
(67, 23, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-09 14:29:06', NULL, '2021-05-09 14:29:06', NULL, NULL),
(68, 23, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-09 14:29:07', NULL, '2021-05-09 14:29:07', NULL, NULL),
(69, 23, 1, 4, 'General Fee', 6, 1000, 1, 1, '2021-05-09 14:29:07', NULL, '2021-05-09 14:29:07', NULL, NULL),
(70, 24, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 14:31:51', NULL, '2021-05-09 14:31:51', NULL, NULL),
(71, 24, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:31:51', NULL, '2021-05-09 14:31:51', NULL, NULL),
(72, 24, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:31:51', NULL, '2021-05-09 14:31:51', NULL, NULL),
(73, 25, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 14:33:48', NULL, '2021-05-09 14:33:48', NULL, NULL),
(74, 25, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:33:48', NULL, '2021-05-09 14:33:48', NULL, NULL),
(75, 25, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:33:48', NULL, '2021-05-09 14:33:48', NULL, NULL),
(76, 26, 1, 3, 'General Fee', 8, 18000, 1, 1, '2021-05-09 14:36:27', NULL, '2021-05-09 14:36:27', NULL, NULL),
(77, 26, 1, 5, 'General Fee', 8, 6000, 1, 1, '2021-05-09 14:36:27', NULL, '2021-05-09 14:36:27', NULL, NULL),
(78, 26, 1, 4, 'General Fee', 8, 1000, 1, 1, '2021-05-09 14:36:27', NULL, '2021-05-09 14:36:27', NULL, NULL),
(79, 27, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 14:38:58', NULL, '2021-05-09 14:38:58', NULL, NULL),
(80, 27, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:38:58', NULL, '2021-05-09 14:38:58', NULL, NULL),
(81, 27, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:38:58', NULL, '2021-05-09 14:38:58', NULL, NULL),
(82, 28, 1, 3, 'General Fee', 5, 15300, 1, 1, '2021-05-10 08:30:07', NULL, '2021-05-09 14:41:38', NULL, NULL),
(83, 28, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:41:38', NULL, '2021-05-09 14:41:38', NULL, NULL),
(84, 28, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:41:38', NULL, '2021-05-09 14:41:38', NULL, NULL),
(85, 29, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 14:43:54', NULL, '2021-05-09 14:43:54', NULL, NULL),
(86, 29, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:43:54', NULL, '2021-05-09 14:43:54', NULL, NULL),
(87, 29, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:43:54', NULL, '2021-05-09 14:43:54', NULL, NULL),
(88, 30, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-09 14:45:58', NULL, '2021-05-09 14:45:58', NULL, NULL),
(89, 30, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-09 14:45:58', NULL, '2021-05-09 14:45:58', NULL, NULL),
(90, 30, 1, 4, 'General Fee', 6, 1000, 1, 1, '2021-05-09 14:45:58', NULL, '2021-05-09 14:45:58', NULL, NULL),
(91, 31, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 14:48:04', NULL, '2021-05-09 14:48:04', NULL, NULL),
(92, 31, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:48:04', NULL, '2021-05-09 14:48:04', NULL, NULL),
(93, 31, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:48:04', NULL, '2021-05-09 14:48:04', NULL, NULL),
(94, 32, 1, 3, 'General Fee', 8, 18000, 1, 1, '2021-05-09 14:50:00', NULL, '2021-05-09 14:50:00', NULL, NULL),
(95, 32, 1, 5, 'General Fee', 8, 6000, 1, 1, '2021-05-09 14:50:00', NULL, '2021-05-09 14:50:00', NULL, NULL),
(96, 32, 1, 4, 'General Fee', 8, 1000, 1, 1, '2021-05-09 14:50:00', NULL, '2021-05-09 14:50:00', NULL, NULL),
(97, 33, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-09 14:52:05', NULL, '2021-05-09 14:52:05', NULL, NULL),
(98, 33, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-09 14:52:05', NULL, '2021-05-09 14:52:05', NULL, NULL),
(99, 33, 1, 4, 'General Fee', 6, 1000, 1, 1, '2021-05-09 14:52:05', NULL, '2021-05-09 14:52:05', NULL, NULL),
(100, 34, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 14:54:09', NULL, '2021-05-09 14:54:09', NULL, NULL),
(101, 34, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:54:09', NULL, '2021-05-09 14:54:09', NULL, NULL),
(102, 34, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:54:09', NULL, '2021-05-09 14:54:09', NULL, NULL),
(103, 35, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 14:57:30', NULL, '2021-05-09 14:57:30', NULL, NULL),
(105, 35, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 14:57:30', NULL, '2021-05-09 14:57:30', NULL, NULL),
(106, 36, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 14:59:36', NULL, '2021-05-09 14:59:36', NULL, NULL),
(107, 36, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 14:59:36', NULL, '2021-05-09 14:59:36', NULL, NULL),
(108, 36, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 14:59:36', NULL, '2021-05-09 14:59:36', NULL, NULL),
(109, 37, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 15:02:48', NULL, '2021-05-09 15:02:48', NULL, NULL),
(110, 37, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 15:02:48', NULL, '2021-05-09 15:02:48', NULL, NULL),
(111, 37, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 15:02:48', NULL, '2021-05-09 15:02:48', NULL, NULL),
(112, 38, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:04:55', NULL, '2021-05-09 15:04:55', NULL, NULL),
(113, 38, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:04:55', NULL, '2021-05-09 15:04:55', NULL, NULL),
(114, 38, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:04:55', NULL, '2021-05-09 15:04:55', NULL, NULL),
(115, 39, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:06:35', NULL, '2021-05-09 15:06:35', NULL, NULL),
(116, 39, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:06:35', NULL, '2021-05-09 15:06:35', NULL, NULL),
(117, 39, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:06:35', NULL, '2021-05-09 15:06:35', NULL, NULL),
(118, 40, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:08:59', NULL, '2021-05-09 15:08:59', NULL, NULL),
(119, 40, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:08:59', NULL, '2021-05-09 15:08:59', NULL, NULL),
(120, 40, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:08:59', NULL, '2021-05-09 15:08:59', NULL, NULL),
(121, 41, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:10:45', NULL, '2021-05-09 15:10:45', NULL, NULL),
(122, 41, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:10:45', NULL, '2021-05-09 15:10:45', NULL, NULL),
(123, 41, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:10:45', NULL, '2021-05-09 15:10:45', NULL, NULL),
(124, 42, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:12:36', NULL, '2021-05-09 15:12:36', NULL, NULL),
(125, 42, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:12:36', NULL, '2021-05-09 15:12:36', NULL, NULL),
(126, 42, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:12:36', NULL, '2021-05-09 15:12:36', NULL, NULL),
(127, 43, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 15:14:27', NULL, '2021-05-09 15:14:27', NULL, NULL),
(128, 43, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 15:14:27', NULL, '2021-05-09 15:14:27', NULL, NULL),
(129, 43, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 15:14:27', NULL, '2021-05-09 15:14:27', NULL, NULL),
(130, 44, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:16:44', NULL, '2021-05-09 15:16:44', NULL, NULL),
(131, 44, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:16:44', NULL, '2021-05-09 15:16:44', NULL, NULL),
(132, 44, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:16:44', NULL, '2021-05-09 15:16:44', NULL, NULL),
(133, 45, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:18:17', NULL, '2021-05-09 15:18:17', NULL, NULL),
(134, 45, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:18:17', NULL, '2021-05-09 15:18:17', NULL, NULL),
(135, 45, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:18:17', NULL, '2021-05-09 15:18:17', NULL, NULL),
(136, 46, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:24:36', NULL, '2021-05-09 15:24:36', NULL, NULL),
(137, 46, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:24:36', NULL, '2021-05-09 15:24:36', NULL, NULL),
(138, 46, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:24:36', NULL, '2021-05-09 15:24:36', NULL, NULL),
(142, 48, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 15:45:04', NULL, '2021-05-09 15:45:04', NULL, NULL),
(143, 48, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 15:45:04', NULL, '2021-05-09 15:45:04', NULL, NULL),
(144, 48, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 15:45:04', NULL, '2021-05-09 15:45:04', NULL, NULL),
(145, 49, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 15:46:43', NULL, '2021-05-09 15:46:43', NULL, NULL),
(146, 49, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 15:46:43', NULL, '2021-05-09 15:46:43', NULL, NULL),
(147, 49, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 15:46:43', NULL, '2021-05-09 15:46:43', NULL, NULL),
(148, 50, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 15:48:41', NULL, '2021-05-09 15:48:41', NULL, NULL),
(149, 50, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 15:48:42', NULL, '2021-05-09 15:48:42', NULL, NULL),
(150, 50, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 15:48:42', NULL, '2021-05-09 15:48:42', NULL, NULL),
(154, 52, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:00:20', NULL, '2021-05-09 16:00:20', NULL, NULL),
(155, 52, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:00:20', NULL, '2021-05-09 16:00:20', NULL, NULL),
(156, 52, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:00:20', NULL, '2021-05-09 16:00:20', NULL, NULL),
(157, 53, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:02:22', NULL, '2021-05-09 16:02:22', NULL, NULL),
(158, 53, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:02:22', NULL, '2021-05-09 16:02:22', NULL, NULL),
(159, 53, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:02:22', NULL, '2021-05-09 16:02:22', NULL, NULL),
(160, 54, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:10:40', NULL, '2021-05-09 16:10:40', NULL, NULL),
(161, 54, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:10:40', NULL, '2021-05-09 16:10:40', NULL, NULL),
(162, 54, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:10:40', NULL, '2021-05-09 16:10:40', NULL, NULL),
(163, 55, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:13:32', NULL, '2021-05-09 16:13:32', NULL, NULL),
(164, 55, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:13:32', NULL, '2021-05-09 16:13:32', NULL, NULL),
(165, 55, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:13:32', NULL, '2021-05-09 16:13:32', NULL, NULL),
(166, 56, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:16:04', NULL, '2021-05-09 16:16:04', NULL, NULL),
(167, 56, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:16:04', NULL, '2021-05-09 16:16:04', NULL, NULL),
(168, 56, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:16:04', NULL, '2021-05-09 16:16:04', NULL, NULL),
(172, 58, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:19:56', NULL, '2021-05-09 16:19:56', NULL, NULL),
(173, 58, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:19:56', NULL, '2021-05-09 16:19:56', NULL, NULL),
(174, 58, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:19:56', NULL, '2021-05-09 16:19:56', NULL, NULL),
(175, 59, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 16:24:17', NULL, '2021-05-09 16:24:17', NULL, NULL),
(176, 59, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 16:24:17', NULL, '2021-05-09 16:24:17', NULL, NULL),
(177, 59, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 16:24:17', NULL, '2021-05-09 16:24:17', NULL, NULL),
(178, 60, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:26:24', NULL, '2021-05-09 16:26:24', NULL, NULL),
(179, 60, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:26:24', NULL, '2021-05-09 16:26:24', NULL, NULL),
(180, 60, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:26:24', NULL, '2021-05-09 16:26:24', NULL, NULL),
(181, 61, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:28:15', NULL, '2021-05-09 16:28:15', NULL, NULL),
(182, 61, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:28:15', NULL, '2021-05-09 16:28:15', NULL, NULL),
(183, 61, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:28:15', NULL, '2021-05-09 16:28:15', NULL, NULL),
(184, 62, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:30:47', NULL, '2021-05-09 16:30:47', NULL, NULL),
(185, 62, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:30:47', NULL, '2021-05-09 16:30:47', NULL, NULL),
(186, 62, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:30:47', NULL, '2021-05-09 16:30:47', NULL, NULL),
(187, 63, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 16:32:11', NULL, '2021-05-09 16:32:11', NULL, NULL),
(188, 63, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 16:32:11', NULL, '2021-05-09 16:32:11', NULL, NULL),
(189, 63, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 16:32:11', NULL, '2021-05-09 16:32:11', NULL, NULL),
(190, 64, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 16:34:02', NULL, '2021-05-09 16:34:02', NULL, NULL),
(191, 64, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 16:34:02', NULL, '2021-05-09 16:34:02', NULL, NULL),
(192, 64, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 16:34:02', NULL, '2021-05-09 16:34:02', NULL, NULL),
(193, 65, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 16:39:40', NULL, '2021-05-09 16:39:40', NULL, NULL),
(194, 65, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 16:39:40', NULL, '2021-05-09 16:39:40', NULL, NULL),
(195, 65, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 16:39:40', NULL, '2021-05-09 16:39:40', NULL, NULL),
(196, 66, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:43:06', NULL, '2021-05-09 16:43:06', NULL, NULL),
(197, 66, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:43:07', NULL, '2021-05-09 16:43:07', NULL, NULL),
(198, 66, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:43:07', NULL, '2021-05-09 16:43:07', NULL, NULL),
(199, 67, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 16:45:13', NULL, '2021-05-09 16:45:13', NULL, NULL),
(200, 67, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 16:45:13', NULL, '2021-05-09 16:45:13', NULL, NULL),
(201, 67, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 16:45:13', NULL, '2021-05-09 16:45:13', NULL, NULL),
(202, 68, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 16:47:15', NULL, '2021-05-09 16:47:15', NULL, NULL),
(203, 68, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 16:47:15', NULL, '2021-05-09 16:47:15', NULL, NULL),
(204, 68, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 16:47:15', NULL, '2021-05-09 16:47:15', NULL, NULL),
(205, 69, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:49:49', NULL, '2021-05-09 16:49:49', NULL, NULL),
(206, 69, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:49:49', NULL, '2021-05-09 16:49:49', NULL, NULL),
(207, 69, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:49:49', NULL, '2021-05-09 16:49:49', NULL, NULL),
(208, 70, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 16:51:32', NULL, '2021-05-09 16:51:32', NULL, NULL),
(209, 70, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 16:51:32', NULL, '2021-05-09 16:51:32', NULL, NULL),
(210, 70, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 16:51:32', NULL, '2021-05-09 16:51:32', NULL, NULL),
(211, 71, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 16:55:28', NULL, '2021-05-09 16:55:28', NULL, NULL),
(212, 71, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 16:55:28', NULL, '2021-05-09 16:55:28', NULL, NULL),
(213, 71, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 16:55:28', NULL, '2021-05-09 16:55:28', NULL, NULL),
(214, 72, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 16:57:03', NULL, '2021-05-09 16:57:03', NULL, NULL),
(215, 72, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 16:57:03', NULL, '2021-05-09 16:57:03', NULL, NULL),
(216, 72, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 16:57:03', NULL, '2021-05-09 16:57:03', NULL, NULL),
(217, 73, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 16:58:58', NULL, '2021-05-09 16:58:58', NULL, NULL),
(218, 73, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 16:58:58', NULL, '2021-05-09 16:58:58', NULL, NULL),
(219, 73, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 16:58:58', NULL, '2021-05-09 16:58:58', NULL, NULL),
(220, 74, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:00:10', NULL, '2021-05-09 17:00:10', NULL, NULL),
(221, 74, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:00:10', NULL, '2021-05-09 17:00:10', NULL, NULL),
(222, 74, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:00:10', NULL, '2021-05-09 17:00:10', NULL, NULL),
(223, 75, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:01:57', NULL, '2021-05-09 17:01:57', NULL, NULL),
(224, 75, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:01:57', NULL, '2021-05-09 17:01:57', NULL, NULL),
(225, 75, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:01:57', NULL, '2021-05-09 17:01:57', NULL, NULL),
(226, 76, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:04:05', NULL, '2021-05-09 17:04:05', NULL, NULL),
(227, 76, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:04:05', NULL, '2021-05-09 17:04:05', NULL, NULL),
(228, 76, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:04:05', NULL, '2021-05-09 17:04:05', NULL, NULL),
(229, 77, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 17:08:03', NULL, '2021-05-09 17:08:03', NULL, NULL),
(230, 77, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 17:08:03', NULL, '2021-05-09 17:08:03', NULL, NULL),
(231, 77, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 17:08:03', NULL, '2021-05-09 17:08:03', NULL, NULL),
(232, 78, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:11:20', NULL, '2021-05-09 17:11:20', NULL, NULL),
(235, 79, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:13:01', NULL, '2021-05-09 17:13:01', NULL, NULL),
(236, 79, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:13:01', NULL, '2021-05-09 17:13:01', NULL, NULL),
(237, 79, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:13:01', NULL, '2021-05-09 17:13:01', NULL, NULL),
(238, 80, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 17:14:22', NULL, '2021-05-09 17:14:22', NULL, NULL),
(239, 80, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 17:14:22', NULL, '2021-05-09 17:14:22', NULL, NULL),
(240, 80, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 17:14:22', NULL, '2021-05-09 17:14:22', NULL, NULL),
(241, 81, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:16:06', NULL, '2021-05-09 17:16:06', NULL, NULL),
(242, 81, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:16:06', NULL, '2021-05-09 17:16:06', NULL, NULL),
(243, 81, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:16:06', NULL, '2021-05-09 17:16:06', NULL, NULL),
(244, 82, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:17:39', NULL, '2021-05-09 17:17:39', NULL, NULL),
(245, 82, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:17:39', NULL, '2021-05-09 17:17:39', NULL, NULL),
(246, 82, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:17:39', NULL, '2021-05-09 17:17:39', NULL, NULL),
(247, 83, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:20:01', NULL, '2021-05-09 17:20:01', NULL, NULL),
(248, 83, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:20:01', NULL, '2021-05-09 17:20:01', NULL, NULL),
(249, 83, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:20:01', NULL, '2021-05-09 17:20:01', NULL, NULL),
(253, 85, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 17:24:07', NULL, '2021-05-09 17:24:07', NULL, NULL),
(254, 85, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 17:24:07', NULL, '2021-05-09 17:24:07', NULL, NULL),
(255, 85, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 17:24:07', NULL, '2021-05-09 17:24:07', NULL, NULL),
(256, 86, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:25:47', NULL, '2021-05-09 17:25:47', NULL, NULL),
(257, 86, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:25:47', NULL, '2021-05-09 17:25:47', NULL, NULL),
(258, 86, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:25:47', NULL, '2021-05-09 17:25:47', NULL, NULL),
(259, 87, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 17:27:31', NULL, '2021-05-09 17:27:31', NULL, NULL),
(260, 87, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 17:27:31', NULL, '2021-05-09 17:27:31', NULL, NULL),
(261, 87, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 17:27:31', NULL, '2021-05-09 17:27:31', NULL, NULL),
(262, 88, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 17:30:24', NULL, '2021-05-09 17:30:24', NULL, NULL),
(263, 88, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 17:30:24', NULL, '2021-05-09 17:30:24', NULL, NULL),
(264, 88, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 17:30:24', NULL, '2021-05-09 17:30:24', NULL, NULL),
(265, 89, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 17:32:08', NULL, '2021-05-09 17:32:08', NULL, NULL),
(266, 89, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 17:32:08', NULL, '2021-05-09 17:32:08', NULL, NULL),
(267, 89, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 17:32:08', NULL, '2021-05-09 17:32:08', NULL, NULL),
(268, 90, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 17:33:58', NULL, '2021-05-09 17:33:58', NULL, NULL),
(269, 90, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 17:33:58', NULL, '2021-05-09 17:33:58', NULL, NULL),
(270, 90, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 17:33:58', NULL, '2021-05-09 17:33:58', NULL, NULL),
(271, 91, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 18:37:50', NULL, '2021-05-09 18:37:50', NULL, NULL),
(272, 91, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 18:37:50', NULL, '2021-05-09 18:37:50', NULL, NULL),
(273, 91, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 18:37:50', NULL, '2021-05-09 18:37:50', NULL, NULL),
(274, 92, 1, 3, 'General Fee', 8, 18000, 1, 1, '2021-05-09 18:39:52', NULL, '2021-05-09 18:39:52', NULL, NULL),
(275, 92, 1, 5, 'General Fee', 8, 6000, 1, 1, '2021-05-09 18:39:52', NULL, '2021-05-09 18:39:52', NULL, NULL),
(276, 92, 1, 4, 'General Fee', 8, 1000, 1, 1, '2021-05-09 18:39:52', NULL, '2021-05-09 18:39:52', NULL, NULL),
(277, 93, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 18:41:46', NULL, '2021-05-09 18:41:46', NULL, NULL),
(279, 93, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 18:41:46', NULL, '2021-05-09 18:41:46', NULL, NULL),
(280, 94, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 18:43:17', NULL, '2021-05-09 18:43:17', NULL, NULL),
(281, 94, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 18:43:17', NULL, '2021-05-09 18:43:17', NULL, NULL),
(282, 94, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 18:43:17', NULL, '2021-05-09 18:43:17', NULL, NULL),
(283, 95, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 18:45:22', NULL, '2021-05-09 18:45:22', NULL, NULL),
(284, 95, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 18:45:22', NULL, '2021-05-09 18:45:22', NULL, NULL),
(285, 95, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 18:45:22', NULL, '2021-05-09 18:45:22', NULL, NULL),
(286, 96, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 18:47:33', NULL, '2021-05-09 18:47:33', NULL, NULL),
(287, 96, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 18:47:33', NULL, '2021-05-09 18:47:33', NULL, NULL),
(288, 96, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 18:47:33', NULL, '2021-05-09 18:47:33', NULL, NULL),
(292, 98, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 18:53:41', NULL, '2021-05-09 18:53:41', NULL, NULL),
(293, 98, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 18:53:41', NULL, '2021-05-09 18:53:41', NULL, NULL),
(294, 98, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 18:53:41', NULL, '2021-05-09 18:53:41', NULL, NULL),
(295, 99, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 18:54:49', NULL, '2021-05-09 18:54:49', NULL, NULL),
(296, 99, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 18:54:49', NULL, '2021-05-09 18:54:49', NULL, NULL),
(297, 99, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 18:54:49', NULL, '2021-05-09 18:54:49', NULL, NULL),
(298, 100, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 18:56:42', NULL, '2021-05-09 18:56:42', NULL, NULL),
(299, 100, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 18:56:42', NULL, '2021-05-09 18:56:42', NULL, NULL),
(300, 100, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 18:56:42', NULL, '2021-05-09 18:56:42', NULL, NULL),
(301, 101, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 18:59:20', NULL, '2021-05-09 18:59:20', NULL, NULL),
(302, 101, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 18:59:20', NULL, '2021-05-09 18:59:20', NULL, NULL),
(303, 101, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 18:59:20', NULL, '2021-05-09 18:59:20', NULL, NULL),
(304, 102, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 19:00:23', NULL, '2021-05-09 19:00:23', NULL, NULL),
(305, 102, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 19:00:23', NULL, '2021-05-09 19:00:23', NULL, NULL),
(306, 102, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 19:00:23', NULL, '2021-05-09 19:00:23', NULL, NULL),
(307, 103, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 19:02:01', NULL, '2021-05-09 19:02:01', NULL, NULL),
(308, 103, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 19:02:01', NULL, '2021-05-09 19:02:01', NULL, NULL),
(309, 103, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 19:02:01', NULL, '2021-05-09 19:02:01', NULL, NULL),
(310, 104, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 19:03:37', NULL, '2021-05-09 19:03:37', NULL, NULL),
(311, 104, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 19:03:37', NULL, '2021-05-09 19:03:37', NULL, NULL),
(312, 104, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 19:03:37', NULL, '2021-05-09 19:03:37', NULL, NULL),
(313, 105, 1, 3, 'General Fee', 9, 18000, 1, 1, '2021-05-09 19:05:17', NULL, '2021-05-09 19:05:17', NULL, NULL),
(314, 105, 1, 5, 'General Fee', 9, 6000, 1, 1, '2021-05-09 19:05:17', NULL, '2021-05-09 19:05:17', NULL, NULL),
(315, 105, 1, 4, 'General Fee', 9, 1000, 1, 1, '2021-05-09 19:05:17', NULL, '2021-05-09 19:05:17', NULL, NULL),
(316, 106, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:06:30', NULL, '2021-05-09 19:06:30', NULL, NULL),
(317, 106, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:06:30', NULL, '2021-05-09 19:06:30', NULL, NULL),
(318, 106, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:06:30', NULL, '2021-05-09 19:06:30', NULL, NULL),
(319, 107, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 19:11:02', NULL, '2021-05-09 19:11:02', NULL, NULL),
(320, 107, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 19:11:02', NULL, '2021-05-09 19:11:02', NULL, NULL),
(321, 107, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 19:11:02', NULL, '2021-05-09 19:11:02', NULL, NULL),
(322, 108, 1, 3, 'General Fee', 1, 5000, 1, 1, '2021-06-19 12:05:26', NULL, '2021-05-09 19:12:34', NULL, NULL),
(323, 108, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:12:34', NULL, '2021-05-09 19:12:34', NULL, NULL),
(324, 108, 1, 5, 'General Fee', 1, 2250, 1, 1, '2021-06-19 12:05:35', NULL, '2021-05-09 19:12:34', NULL, NULL),
(340, 114, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 19:24:47', NULL, '2021-05-09 19:24:47', NULL, NULL),
(341, 114, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 19:24:47', NULL, '2021-05-09 19:24:47', NULL, NULL),
(342, 114, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 19:24:47', NULL, '2021-05-09 19:24:47', NULL, NULL),
(343, 115, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 19:26:33', NULL, '2021-05-09 19:26:33', NULL, NULL),
(344, 115, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 19:26:33', NULL, '2021-05-09 19:26:33', NULL, NULL),
(345, 115, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 19:26:33', NULL, '2021-05-09 19:26:33', NULL, NULL),
(346, 116, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:28:39', NULL, '2021-05-09 19:28:39', NULL, NULL),
(347, 116, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:28:40', NULL, '2021-05-09 19:28:40', NULL, NULL),
(348, 116, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:28:40', NULL, '2021-05-09 19:28:40', NULL, NULL),
(349, 117, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:31:57', NULL, '2021-05-09 19:31:57', NULL, NULL),
(350, 117, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:31:57', NULL, '2021-05-09 19:31:57', NULL, NULL),
(351, 117, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:31:57', NULL, '2021-05-09 19:31:57', NULL, NULL),
(352, 118, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:33:35', NULL, '2021-05-09 19:33:35', NULL, NULL),
(353, 118, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:33:35', NULL, '2021-05-09 19:33:35', NULL, NULL),
(354, 118, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:33:35', NULL, '2021-05-09 19:33:35', NULL, NULL),
(355, 119, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:35:05', NULL, '2021-05-09 19:35:05', NULL, NULL),
(356, 119, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:35:05', NULL, '2021-05-09 19:35:05', NULL, NULL),
(357, 119, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:35:05', NULL, '2021-05-09 19:35:05', NULL, NULL),
(358, 120, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 19:37:44', NULL, '2021-05-09 19:37:44', NULL, NULL),
(359, 120, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 19:37:44', NULL, '2021-05-09 19:37:44', NULL, NULL),
(360, 120, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 19:37:44', NULL, '2021-05-09 19:37:44', NULL, NULL),
(361, 121, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:42:42', NULL, '2021-05-09 19:42:42', NULL, NULL),
(362, 121, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:42:42', NULL, '2021-05-09 19:42:42', NULL, NULL),
(363, 121, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:42:42', NULL, '2021-05-09 19:42:42', NULL, NULL),
(364, 122, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:44:49', NULL, '2021-05-09 19:44:49', NULL, NULL),
(365, 122, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:44:49', NULL, '2021-05-09 19:44:49', NULL, NULL),
(366, 122, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:44:49', NULL, '2021-05-09 19:44:49', NULL, NULL),
(367, 123, 1, 3, 'General Fee', 2, 16000, 1, 1, '2021-05-09 19:50:29', NULL, '2021-05-09 19:50:29', NULL, NULL),
(368, 123, 1, 4, 'General Fee', 2, 1000, 1, 1, '2021-05-09 19:50:29', NULL, '2021-05-09 19:50:29', NULL, NULL),
(369, 123, 1, 5, 'General Fee', 2, 6000, 1, 1, '2021-05-09 19:50:29', NULL, '2021-05-09 19:50:29', NULL, NULL),
(370, 124, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:56:15', NULL, '2021-05-09 19:56:15', NULL, NULL),
(373, 125, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 19:59:31', NULL, '2021-05-09 19:59:31', NULL, NULL),
(374, 125, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 19:59:32', NULL, '2021-05-09 19:59:32', NULL, NULL),
(375, 125, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 19:59:32', NULL, '2021-05-09 19:59:32', NULL, NULL),
(376, 126, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 20:04:13', NULL, '2021-05-09 20:04:13', NULL, NULL),
(377, 126, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 20:04:13', NULL, '2021-05-09 20:04:13', NULL, NULL),
(378, 126, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 20:04:13', NULL, '2021-05-09 20:04:13', NULL, NULL),
(379, 127, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 20:06:21', NULL, '2021-05-09 20:06:21', NULL, NULL),
(380, 127, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 20:06:21', NULL, '2021-05-09 20:06:21', NULL, NULL),
(381, 127, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 20:06:21', NULL, '2021-05-09 20:06:21', NULL, NULL),
(382, 128, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 20:10:35', NULL, '2021-05-09 20:10:35', NULL, NULL),
(383, 128, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 20:10:35', NULL, '2021-05-09 20:10:35', NULL, NULL),
(384, 128, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 20:10:35', NULL, '2021-05-09 20:10:35', NULL, NULL),
(385, 129, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 20:22:38', NULL, '2021-05-09 20:22:38', NULL, NULL),
(386, 129, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 20:22:38', NULL, '2021-05-09 20:22:38', NULL, NULL),
(387, 129, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 20:22:38', NULL, '2021-05-09 20:22:38', NULL, NULL),
(388, 130, 1, 3, 'General Fee', 8, 18000, 1, 1, '2021-05-09 20:25:38', NULL, '2021-05-09 20:25:38', NULL, NULL),
(389, 130, 1, 5, 'General Fee', 8, 6000, 1, 1, '2021-05-09 20:25:38', NULL, '2021-05-09 20:25:38', NULL, NULL),
(390, 130, 1, 4, 'General Fee', 8, 1000, 1, 1, '2021-05-09 20:25:38', NULL, '2021-05-09 20:25:38', NULL, NULL),
(391, 131, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 20:28:34', NULL, '2021-05-09 20:28:34', NULL, NULL),
(392, 131, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 20:28:34', NULL, '2021-05-09 20:28:34', NULL, NULL),
(393, 131, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 20:28:34', NULL, '2021-05-09 20:28:34', NULL, NULL),
(394, 132, 1, 3, 'General Fee', 5, 17000, 1, 1, '2021-05-09 20:31:24', NULL, '2021-05-09 20:31:24', NULL, NULL),
(395, 132, 1, 5, 'General Fee', 5, 6000, 1, 1, '2021-05-09 20:31:24', NULL, '2021-05-09 20:31:24', NULL, NULL),
(396, 132, 1, 4, 'General Fee', 5, 1000, 1, 1, '2021-05-09 20:31:24', NULL, '2021-05-09 20:31:24', NULL, NULL),
(397, 133, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 20:34:11', NULL, '2021-05-09 20:34:11', NULL, NULL),
(398, 133, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 20:34:11', NULL, '2021-05-09 20:34:11', NULL, NULL),
(399, 133, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 20:34:11', NULL, '2021-05-09 20:34:11', NULL, NULL),
(400, 134, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 20:37:34', NULL, '2021-05-09 20:37:34', NULL, NULL),
(401, 134, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 20:37:35', NULL, '2021-05-09 20:37:35', NULL, NULL),
(402, 134, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 20:37:35', NULL, '2021-05-09 20:37:35', NULL, NULL),
(403, 135, 1, 3, 'General Fee', 6, 17000, 1, 1, '2021-05-09 20:40:23', NULL, '2021-05-09 20:40:23', NULL, NULL),
(404, 135, 1, 5, 'General Fee', 6, 6000, 1, 1, '2021-05-09 20:40:23', NULL, '2021-05-09 20:40:23', NULL, NULL),
(405, 135, 1, 4, 'General Fee', 6, 1000, 1, 1, '2021-05-09 20:40:23', NULL, '2021-05-09 20:40:23', NULL, NULL),
(406, 136, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 20:43:54', NULL, '2021-05-09 20:43:54', NULL, NULL),
(407, 136, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 20:43:54', NULL, '2021-05-09 20:43:54', NULL, NULL),
(408, 136, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 20:43:54', NULL, '2021-05-09 20:43:54', NULL, NULL),
(409, 137, 1, 3, 'General Fee', 4, 17000, 1, 1, '2021-05-09 20:46:12', NULL, '2021-05-09 20:46:12', NULL, NULL),
(410, 137, 1, 5, 'General Fee', 4, 6000, 1, 1, '2021-05-09 20:46:12', NULL, '2021-05-09 20:46:12', NULL, NULL),
(411, 137, 1, 4, 'General Fee', 4, 1000, 1, 1, '2021-05-09 20:46:12', NULL, '2021-05-09 20:46:12', NULL, NULL),
(412, 138, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 20:50:04', NULL, '2021-05-09 20:50:04', NULL, NULL),
(413, 138, 1, 4, 'General Fee', 1, 1000, 1, 1, '2021-05-09 20:50:04', NULL, '2021-05-09 20:50:04', NULL, NULL),
(414, 138, 1, 5, 'General Fee', 1, 6000, 1, 1, '2021-05-09 20:50:05', NULL, '2021-05-09 20:50:05', NULL, NULL),
(415, 139, 1, 3, 'General Fee', 3, 16000, 1, 1, '2021-05-09 20:53:46', NULL, '2021-05-09 20:53:46', NULL, NULL),
(416, 139, 1, 4, 'General Fee', 3, 1000, 1, 1, '2021-05-09 20:53:47', NULL, '2021-05-09 20:53:47', NULL, NULL),
(417, 139, 1, 5, 'General Fee', 3, 6000, 1, 1, '2021-05-09 20:53:47', NULL, '2021-05-09 20:53:47', NULL, NULL),
(424, 142, 1, 3, 'General Fee', 1, 16000, 1, 1, '2021-05-09 21:04:30', NULL, '2021-05-09 21:04:30', NULL, NULL),
(427, 3, 1, 7, 'Additional Fee', 7, 18000, 1, 1, '2021-05-10 06:32:04', NULL, '2021-05-10 06:32:04', NULL, NULL),
(431, 12, 1, 7, 'Additional Fee', 8, 65500, 1, 1, '2021-05-10 07:43:06', NULL, '2021-05-10 07:43:06', NULL, NULL),
(432, 14, 1, 7, 'Additional Fee', 7, 8000, 1, 1, '2021-05-10 07:46:12', NULL, '2021-05-10 07:46:12', NULL, NULL),
(433, 15, 1, 7, 'Additional Fee', 5, 5000, 1, 1, '2021-05-10 07:49:15', NULL, '2021-05-10 07:49:15', NULL, NULL),
(434, 17, 1, 4, 'Additional Fee', 8, 1000, 1, 1, '2021-05-10 08:01:28', NULL, '2021-05-10 08:01:28', NULL, NULL),
(435, 17, 1, 7, 'Additional Fee', 8, 12500, 1, 1, '2021-05-10 08:02:27', NULL, '2021-05-10 08:02:27', NULL, NULL),
(436, 18, 1, 7, 'Additional Fee', 6, 11000, 1, 1, '2021-05-10 08:04:26', NULL, '2021-05-10 08:04:26', NULL, NULL),
(437, 19, 1, 7, 'Additional Fee', 6, 11000, 1, 1, '2021-05-10 08:07:28', NULL, '2021-05-10 08:07:28', NULL, NULL),
(438, 22, 1, 7, 'Additional Fee', 6, 15500, 1, 1, '2021-05-10 08:21:45', NULL, '2021-05-10 08:21:45', NULL, NULL),
(439, 26, 1, 7, 'Additional Fee', 8, 30400, 1, 1, '2021-05-10 08:25:33', NULL, '2021-05-10 08:25:33', NULL, NULL),
(440, 28, 1, 7, 'Additional Fee', 5, 30200, 1, 1, '2021-05-10 08:28:44', NULL, '2021-05-10 08:28:44', NULL, NULL),
(441, 35, 1, 7, 'Additional Fee', 4, 7000, 1, 1, '2021-05-10 08:42:08', NULL, '2021-05-10 08:42:08', NULL, NULL),
(442, 41, 1, 7, 'Additional Fee', 4, 11300, 1, 1, '2021-05-10 08:47:54', NULL, '2021-05-10 08:47:54', NULL, NULL),
(443, 44, 1, 7, 'Additional Fee', 4, 2200, 1, 1, '2021-05-10 08:56:37', NULL, '2021-05-10 08:56:37', NULL, NULL),
(444, 45, 1, 7, 'Additional Fee', 4, 2000, 1, 1, '2021-05-10 08:59:09', NULL, '2021-05-10 08:59:09', NULL, NULL),
(445, 48, 1, 7, 'Additional Fee', 4, 54000, 1, 1, '2021-05-10 09:05:40', NULL, '2021-05-10 09:05:40', NULL, NULL),
(446, 50, 1, 7, 'Additional Fee', 3, 11000, 1, 1, '2021-05-10 09:15:52', NULL, '2021-05-10 09:15:52', NULL, NULL),
(447, 53, 1, 7, 'Additional Fee', 3, 7000, 1, 1, '2021-05-10 09:22:06', NULL, '2021-05-10 09:22:06', NULL, NULL),
(448, 54, 1, 7, 'Additional Fee', 3, 31300, 1, 1, '2021-06-19 09:33:55', NULL, '2021-05-10 09:25:26', NULL, NULL),
(449, 56, 1, 7, 'Additional Fee', 3, 3000, 1, 1, '2021-05-10 09:30:20', NULL, '2021-05-10 09:30:20', NULL, NULL),
(450, 59, 1, 7, 'Additional Fee', 4, 10000, 1, 1, '2021-05-10 09:34:58', NULL, '2021-05-10 09:34:58', NULL, NULL),
(451, 61, 1, 7, 'Additional Fee', 3, 8400, 1, 1, '2021-05-10 09:36:50', NULL, '2021-05-10 09:36:50', NULL, NULL),
(452, 63, 1, 7, 'Additional Fee', 5, 22300, 1, 1, '2021-05-10 09:38:53', NULL, '2021-05-10 09:38:53', NULL, NULL),
(453, 65, 1, 7, 'Additional Fee', 2, 7000, 1, 1, '2021-05-10 09:45:35', NULL, '2021-05-10 09:45:35', NULL, NULL),
(454, 66, 1, 7, 'Additional Fee', 3, 11400, 1, 1, '2021-05-10 09:51:42', NULL, '2021-05-10 09:51:42', NULL, NULL),
(455, 67, 1, 7, 'Additional Fee', 2, 2000, 1, 1, '2021-05-10 09:55:01', NULL, '2021-05-10 09:55:01', NULL, NULL),
(457, 78, 1, 7, 'Additional Fee', 2, 5000, 1, 1, '2021-05-10 10:11:33', NULL, '2021-05-10 10:11:33', NULL, NULL),
(458, 81, 1, 7, 'Additional Fee', 2, 7800, 1, 1, '2021-05-10 10:20:33', NULL, '2021-05-10 10:20:33', NULL, NULL),
(459, 84, 1, 7, 'Additional Fee', 5, 27000, 1, 1, '2021-05-10 10:24:28', NULL, '2021-05-10 10:24:28', NULL, NULL),
(460, 89, 1, 7, 'Additional Fee', 4, 7600, 1, 1, '2021-05-10 10:36:37', NULL, '2021-05-10 10:36:37', NULL, NULL),
(461, 93, 1, 4, 'Additional Fee', 1, 1000, 1, 1, '2021-05-10 10:46:34', NULL, '2021-05-10 10:46:34', NULL, NULL),
(462, 94, 1, 7, 'Additional Fee', 1, 5000, 1, 1, '2021-05-10 10:53:25', NULL, '2021-05-10 10:53:25', NULL, NULL),
(463, 99, 1, 7, 'Additional Fee', 1, 6000, 1, 1, '2021-05-10 11:35:41', NULL, '2021-05-10 11:35:41', NULL, NULL),
(464, 100, 1, 7, 'Additional Fee', 1, 9800, 1, 1, '2021-05-10 11:39:45', NULL, '2021-05-10 11:39:45', NULL, NULL),
(465, 101, 1, 7, 'Additional Fee', 1, 15000, 1, 1, '2021-05-10 11:41:59', NULL, '2021-05-10 11:41:59', NULL, NULL),
(466, 108, 1, 7, 'Additional Fee', 1, 7500, 1, 1, '2021-05-10 11:48:51', NULL, '2021-05-10 11:48:51', NULL, NULL),
(467, 114, 1, 7, 'Additional Fee', 2, 6000, 1, 1, '2021-05-10 11:51:07', NULL, '2021-05-10 11:51:07', NULL, NULL),
(468, 117, 1, 7, 'Additional Fee', 1, 2500, 1, 1, '2021-05-10 11:57:20', NULL, '2021-05-10 11:57:20', NULL, NULL),
(469, 119, 1, 7, 'Additional Fee', 1, 10800, 1, 1, '2021-05-10 12:01:16', NULL, '2021-05-10 12:01:16', NULL, NULL),
(470, 124, 1, 7, 'Additional Fee', 1, 2250, 1, 1, '2021-05-10 12:08:56', NULL, '2021-05-10 12:08:56', NULL, NULL),
(471, 128, 1, 7, 'Additional Fee', 5, 24800, 1, 1, '2021-05-10 12:14:28', NULL, '2021-05-10 12:14:28', NULL, NULL),
(472, 129, 1, 7, 'Additional Fee', 1, 13200, 1, 1, '2021-05-10 12:20:27', NULL, '2021-05-10 12:20:27', NULL, NULL),
(473, 132, 1, 7, 'Additional Fee', 5, 16800, 1, 1, '2021-06-19 12:16:16', NULL, '2021-05-10 12:26:40', NULL, NULL),
(474, 133, 1, 7, 'Additional Fee', 3, 7000, 1, 1, '2021-05-10 12:29:43', NULL, '2021-05-10 12:29:43', NULL, NULL),
(475, 134, 1, 7, 'Additional Fee', 1, 6800, 1, 1, '2021-05-10 12:32:41', NULL, '2021-05-10 12:32:41', NULL, NULL),
(476, 140, 1, 7, 'Additional Fee', 1, 7000, 1, 1, '2021-05-10 12:39:00', NULL, '2021-05-10 12:39:00', NULL, NULL),
(485, 145, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-09 20:00:11', NULL, '2021-06-09 20:00:11', NULL, NULL),
(486, 145, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-09 20:00:11', NULL, '2021-06-09 20:00:11', NULL, NULL),
(487, 145, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-09 20:00:11', NULL, '2021-06-09 20:00:11', NULL, NULL),
(488, 145, 1, 1, 'One Time Fee', 1, 3000, 1, 2, '2021-06-09 20:00:11', NULL, '2021-06-09 20:00:11', NULL, NULL),
(493, 147, 1, 3, 'General Fee', 6, 17000, 1, 2, '2021-06-10 17:44:16', NULL, '2021-06-10 17:44:16', NULL, NULL),
(494, 147, 1, 5, 'General Fee', 6, 6000, 1, 2, '2021-06-10 17:44:16', NULL, '2021-06-10 17:44:16', NULL, NULL),
(495, 147, 1, 4, 'General Fee', 6, 1000, 1, 2, '2021-06-10 17:44:16', NULL, '2021-06-10 17:44:16', NULL, NULL),
(496, 147, 1, 1, 'One Time Fee', 6, 3000, 1, 2, '2021-06-10 17:44:16', NULL, '2021-06-10 17:44:16', NULL, NULL),
(497, 148, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-10 18:11:25', NULL, '2021-06-10 18:11:25', NULL, NULL),
(498, 148, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-10 18:11:25', NULL, '2021-06-10 18:11:25', NULL, NULL),
(499, 148, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-10 18:11:25', NULL, '2021-06-10 18:11:25', NULL, NULL),
(500, 148, 1, 1, 'One Time Fee', 1, 3000, 1, 2, '2021-06-10 18:11:25', NULL, '2021-06-10 18:11:25', NULL, NULL),
(501, 149, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-10 19:41:55', NULL, '2021-06-10 19:41:55', NULL, NULL),
(502, 149, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-10 19:41:55', NULL, '2021-06-10 19:41:55', NULL, NULL),
(503, 149, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-10 19:41:55', NULL, '2021-06-10 19:41:55', NULL, NULL),
(504, 149, 1, 1, 'One Time Fee', 1, 3000, 1, 2, '2021-06-10 19:41:55', NULL, '2021-06-10 19:41:55', NULL, NULL),
(505, 150, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-10 20:56:26', NULL, '2021-06-10 20:56:26', NULL, NULL),
(506, 150, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-10 20:56:26', NULL, '2021-06-10 20:56:26', NULL, NULL),
(507, 150, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-10 20:56:26', NULL, '2021-06-10 20:56:26', NULL, NULL),
(508, 150, 1, 1, 'One Time Fee', 1, 3000, 1, 2, '2021-06-10 20:56:26', NULL, '2021-06-10 20:56:26', NULL, NULL),
(509, 151, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-10 21:12:01', NULL, '2021-06-10 21:12:01', NULL, NULL),
(510, 151, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-10 21:12:01', NULL, '2021-06-10 21:12:01', NULL, NULL),
(511, 151, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-10 21:12:01', NULL, '2021-06-10 21:12:01', NULL, NULL),
(512, 151, 1, 1, 'One Time Fee', 1, 3000, 1, 2, '2021-06-10 21:12:01', NULL, '2021-06-10 21:12:01', NULL, NULL),
(513, 152, 1, 3, 'General Fee', 2, 16000, 1, 2, '2021-06-10 21:35:19', NULL, '2021-06-10 21:35:19', NULL, NULL),
(514, 152, 1, 4, 'General Fee', 2, 1000, 1, 2, '2021-06-10 21:35:19', NULL, '2021-06-10 21:35:19', NULL, NULL),
(515, 152, 1, 5, 'General Fee', 2, 6000, 1, 2, '2021-06-10 21:35:19', NULL, '2021-06-10 21:35:19', NULL, NULL),
(516, 152, 1, 1, 'One Time Fee', 2, 3000, 1, 2, '2021-06-10 21:35:19', NULL, '2021-06-10 21:35:19', NULL, NULL),
(517, 153, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-10 21:50:38', NULL, '2021-06-10 21:50:38', NULL, NULL),
(518, 153, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-10 21:50:38', NULL, '2021-06-10 21:50:38', NULL, NULL),
(519, 153, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-10 21:50:38', NULL, '2021-06-10 21:50:38', NULL, NULL),
(520, 153, 1, 1, 'One Time Fee', 1, 3000, 1, 2, '2021-06-10 21:50:38', NULL, '2021-06-10 21:50:38', NULL, NULL),
(522, 154, 1, 3, 'General Fee', 5, 17000, 1, 2, '2021-06-11 17:54:10', NULL, '2021-06-11 17:54:10', NULL, NULL),
(523, 154, 1, 5, 'General Fee', 5, 6000, 1, 2, '2021-06-11 17:54:10', NULL, '2021-06-11 17:54:10', NULL, NULL),
(524, 154, 1, 4, 'General Fee', 5, 1000, 1, 2, '2021-06-11 17:54:10', NULL, '2021-06-11 17:54:10', NULL, NULL),
(525, 154, 1, 7, 'Additional Fee', 5, 118500, 1, 2, '2021-06-11 18:06:19', NULL, '2021-06-11 18:06:19', NULL, NULL),
(527, 4, 1, 7, 'Additional Fee', 7, 44500, 1, 2, '2021-06-15 23:15:36', NULL, '2021-06-15 23:15:36', NULL, NULL),
(528, 155, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-16 20:42:52', NULL, '2021-06-16 20:42:52', NULL, NULL),
(529, 155, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-16 20:42:52', NULL, '2021-06-16 20:42:52', NULL, NULL),
(530, 155, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-16 20:42:52', NULL, '2021-06-16 20:42:52', NULL, NULL),
(531, 156, 1, 3, 'General Fee', 1, 16000, 1, 2, '2021-06-16 21:07:07', NULL, '2021-06-16 21:07:07', NULL, NULL),
(532, 156, 1, 4, 'General Fee', 1, 1000, 1, 2, '2021-06-16 21:07:07', NULL, '2021-06-16 21:07:07', NULL, NULL),
(533, 156, 1, 5, 'General Fee', 1, 6000, 1, 2, '2021-06-16 21:07:07', NULL, '2021-06-16 21:07:07', NULL, NULL),
(534, 153, 1, 8, 'Additional Fee', 1, 6800, 1, 2, '2021-06-19 18:32:25', NULL, '2021-06-19 18:32:25', NULL, NULL),
(535, 7, 1, 7, 'Additional Fee', 7, 750, 1, 1, '2021-06-19 19:30:30', NULL, '2021-06-19 19:30:30', NULL, NULL),
(536, 143, 1, 8, 'Additional Fee', 1, 6800, 1, 1, '2021-06-19 20:04:31', NULL, '2021-06-19 20:04:31', NULL, NULL),
(537, 144, 1, 8, 'Additional Fee', 1, 6800, 1, 1, '2021-06-19 20:05:01', NULL, '2021-06-19 20:05:01', NULL, NULL),
(538, 145, 1, 8, 'Additional Fee', 1, 6800, 1, 1, '2021-06-19 20:07:24', NULL, '2021-06-19 20:07:24', NULL, NULL),
(539, 146, 1, 8, 'Additional Fee', 7, 6800, 1, 1, '2021-06-19 20:07:57', NULL, '2021-06-19 20:07:57', NULL, NULL),
(540, 147, 1, 8, 'Additional Fee', 6, 6800, 1, 1, '2021-06-19 20:08:32', NULL, '2021-06-19 20:08:32', NULL, NULL),
(541, 148, 1, 8, 'Additional Fee', 1, 6800, 1, 1, '2021-06-19 20:09:03', NULL, '2021-06-19 20:09:03', NULL, NULL),
(542, 149, 1, 8, 'Additional Fee', 1, 6800, 1, 1, '2021-06-19 20:09:39', NULL, '2021-06-19 20:09:39', NULL, NULL),
(543, 150, 1, 8, 'Additional Fee', 1, 6800, 1, 1, '2021-06-19 20:10:12', NULL, '2021-06-19 20:10:12', NULL, NULL),
(544, 151, 1, 8, 'Additional Fee', 1, 6800, 1, 1, '2021-06-19 20:11:07', NULL, '2021-06-19 20:11:07', NULL, NULL),
(545, 152, 1, 8, 'Additional Fee', 2, 6800, 1, 1, '2021-06-19 20:11:34', NULL, '2021-06-19 20:11:34', NULL, NULL),
(546, 140, 1, 8, 'Additional Fee', 1, 5000, 1, 1, '2021-06-19 21:46:59', NULL, '2021-06-19 21:46:59', NULL, NULL),
(547, 140, 1, 3, 'Additional Fee', 1, 7000, 1, 1, '2021-06-19 21:47:55', NULL, '2021-06-19 21:47:55', NULL, NULL),
(548, 150, 1, 6, 'Additional Fee', 1, 2000, 1, 1, '2021-06-19 22:19:44', NULL, '2021-06-19 22:19:44', NULL, NULL),
(549, 34, 1, 8, 'Additional Fee', 5, 3200, 1, 2, '2021-06-21 17:29:26', NULL, '2021-06-21 17:29:26', NULL, NULL),
(550, 13, 1, 8, 'Additional Fee', 6, 3100, 1, 2, '2021-06-21 18:34:49', NULL, '2021-06-21 18:34:49', NULL, NULL),
(551, 20, 1, 8, 'Additional Fee', 6, 3300, 1, 2, '2021-06-21 18:43:06', NULL, '2021-06-21 18:43:06', NULL, NULL),
(552, 99, 1, 7, 'Additional Fee', 1, 2250, 1, 2, '2021-06-21 21:25:35', NULL, '2021-06-21 21:25:35', NULL, NULL),
(553, 99, 1, 7, 'Additional Fee', 1, 2000, 1, 2, '2021-06-21 21:26:58', NULL, '2021-06-21 21:26:58', NULL, NULL),
(554, 152, 1, 2, 'Additional Fee', 2, 2000, 1, 2, '2021-06-22 19:30:42', NULL, '2021-06-22 19:30:42', NULL, NULL),
(558, 2, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:38', NULL, '2021-07-13 20:32:38', NULL, NULL),
(559, 2, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:38', NULL, '2021-07-13 20:32:38', NULL, NULL);
INSERT INTO `student_fees` (`id`, `student_id`, `current_session_id`, `fee_parameter_id`, `description`, `class_grade_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(560, 2, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:38', NULL, '2021-07-13 20:32:38', NULL, NULL),
(561, 2, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:38', NULL, '2021-07-13 20:32:38', NULL, NULL),
(562, 97, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(563, 97, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(564, 97, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(565, 97, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(566, 105, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(567, 105, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(568, 105, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(569, 105, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(570, 109, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(571, 109, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(572, 109, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(573, 109, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(574, 110, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(575, 110, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(576, 110, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(577, 110, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(578, 111, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(579, 111, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(580, 111, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(581, 111, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(582, 112, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(583, 112, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(584, 112, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(585, 112, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(586, 113, 2, 3, 'General Fee', 10, 18000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(587, 113, 2, 5, 'General Fee', 10, 6000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(588, 113, 2, 4, 'General Fee', 10, 1000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(589, 113, 2, 6, 'General Fee', 10, 2000, 1, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39', NULL, NULL),
(590, 1, 2, 3, 'General Fee', 9, 18000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(591, 1, 2, 5, 'General Fee', 9, 6000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(592, 1, 2, 4, 'General Fee', 9, 1000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(593, 1, 2, 6, 'General Fee', 9, 2000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(594, 12, 2, 3, 'General Fee', 9, 18000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(595, 12, 2, 5, 'General Fee', 9, 6000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(596, 12, 2, 4, 'General Fee', 9, 1000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(597, 12, 2, 6, 'General Fee', 9, 2000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(598, 12, 2, 7, 'BALANCE B/F', 9, 68000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(599, 17, 2, 3, 'General Fee', 9, 18000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(600, 17, 2, 5, 'General Fee', 9, 6000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(601, 17, 2, 4, 'General Fee', 9, 1000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(602, 17, 2, 6, 'General Fee', 9, 2000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(603, 17, 2, 7, 'BALANCE B/F', 9, 27500, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(604, 26, 2, 3, 'General Fee', 9, 18000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(605, 26, 2, 5, 'General Fee', 9, 6000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(606, 26, 2, 4, 'General Fee', 9, 1000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(607, 26, 2, 6, 'General Fee', 9, 2000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(608, 26, 2, 7, 'BALANCE B/F', 9, 25400, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(609, 32, 2, 3, 'General Fee', 9, 18000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(610, 32, 2, 5, 'General Fee', 9, 6000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(611, 32, 2, 4, 'General Fee', 9, 1000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(612, 32, 2, 6, 'General Fee', 9, 2000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(613, 92, 2, 3, 'General Fee', 9, 18000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(614, 92, 2, 5, 'General Fee', 9, 6000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(615, 92, 2, 4, 'General Fee', 9, 1000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(616, 92, 2, 6, 'General Fee', 9, 2000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(617, 130, 2, 3, 'General Fee', 9, 18000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(618, 130, 2, 5, 'General Fee', 9, 6000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(619, 130, 2, 4, 'General Fee', 9, 1000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(620, 130, 2, 6, 'General Fee', 9, 2000, 1, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(621, 3, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(622, 3, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(623, 3, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(624, 3, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(625, 3, 2, 7, 'BALANCE B/F', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(626, 4, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(627, 4, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(628, 4, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(629, 4, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(630, 4, 2, 7, 'BALANCE B/F', 8, 44500, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(632, 5, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(633, 5, 2, 4, 'General Fee', 8, 1700, 1, 1, '2021-11-20 15:37:55', 1, '2021-11-20 15:37:55', NULL, NULL),
(634, 5, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(635, 6, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(636, 6, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(637, 6, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(638, 6, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(639, 7, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(640, 7, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(641, 7, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(642, 7, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(643, 7, 2, 7, 'BALANCE B/F', 8, 750, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(644, 8, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(645, 8, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(646, 8, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(647, 8, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(648, 9, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(649, 9, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(650, 9, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(651, 9, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(652, 11, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(653, 11, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(654, 11, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(655, 11, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(656, 14, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(657, 14, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(658, 14, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(659, 14, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(660, 14, 2, 7, 'BALANCE B/F', 8, 8000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(661, 47, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(662, 47, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(663, 47, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(664, 47, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(665, 51, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(666, 51, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(667, 51, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(668, 51, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(669, 57, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(670, 57, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(671, 57, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01', NULL, NULL),
(672, 57, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02', NULL, NULL),
(673, 146, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02', NULL, NULL),
(674, 146, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02', NULL, NULL),
(675, 146, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02', NULL, NULL),
(676, 146, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02', NULL, NULL),
(677, 146, 2, 7, 'BALANCE B/F', 8, 1800, 1, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02', NULL, NULL),
(678, 13, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(679, 13, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(680, 13, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(681, 13, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(682, 18, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(683, 18, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(684, 18, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(685, 18, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(686, 19, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(687, 19, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(688, 19, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(689, 19, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(690, 20, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(691, 20, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(692, 20, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(693, 20, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(694, 21, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(695, 21, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(696, 21, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(697, 21, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(698, 22, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(699, 22, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(700, 22, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(701, 22, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(702, 23, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(703, 23, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(704, 23, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(705, 23, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(706, 30, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(707, 30, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(708, 30, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(709, 30, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(710, 33, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(711, 33, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(712, 33, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(713, 33, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(714, 33, 2, 7, 'BALANCE B/F', 7, 3000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(715, 135, 2, 3, 'General Fee', 7, 17000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(716, 135, 2, 5, 'General Fee', 7, 6000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(717, 135, 2, 4, 'General Fee', 7, 1000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(718, 135, 2, 6, 'General Fee', 7, 2000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(723, 147, 2, 7, 'BALANCE B/F', 7, 3000, 1, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(728, 15, 2, 7, 'BALANCE B/F', 8, 10000, 1, 1, '2021-08-12 18:48:30', 1, '2021-08-12 18:48:30', NULL, NULL),
(729, 24, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(730, 24, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(731, 24, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(732, 24, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(733, 25, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(734, 25, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(735, 25, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(736, 25, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(737, 27, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(738, 27, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(739, 27, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(740, 27, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(741, 28, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(742, 28, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(743, 28, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(744, 28, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(745, 29, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(746, 29, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(747, 29, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(748, 29, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(749, 29, 2, 7, 'BALANCE B/F', 6, 300, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(750, 31, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(751, 31, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(752, 31, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(753, 31, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(754, 34, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(755, 34, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(756, 34, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(757, 34, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(758, 36, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(759, 36, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(760, 36, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(761, 36, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(762, 37, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(763, 37, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(764, 37, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(765, 37, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(766, 63, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(767, 63, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(768, 63, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(769, 63, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(770, 63, 2, 7, 'BALANCE B/F', 6, 14600, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(771, 77, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(772, 77, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(773, 77, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(774, 77, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(775, 80, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(776, 80, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(777, 80, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(778, 80, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(779, 84, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(780, 84, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(781, 84, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(782, 84, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(783, 85, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(784, 85, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(785, 85, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(786, 85, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(787, 96, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(788, 96, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(789, 96, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(790, 96, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(791, 115, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(792, 115, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(793, 115, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(794, 115, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(795, 120, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(796, 120, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(797, 120, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(798, 120, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(799, 120, 2, 7, 'BALANCE B/F', 6, 500, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(800, 128, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(801, 128, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(802, 128, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(803, 128, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(804, 128, 2, 7, 'BALANCE B/F', 6, 33800, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(805, 132, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(806, 132, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(807, 132, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(808, 132, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(809, 132, 2, 7, 'BALANCE B/F', 6, 14800, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(810, 154, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(811, 154, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(812, 154, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(813, 154, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(814, 154, 2, 7, 'BALANCE B/F', 6, 142000, 1, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(815, 35, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(816, 35, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(817, 35, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(818, 35, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(819, 35, 2, 7, 'BALANCE B/F', 5, 8000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(820, 38, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(821, 38, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(822, 38, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(823, 38, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(824, 39, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(825, 39, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(826, 39, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(827, 39, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(828, 40, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(829, 40, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(830, 40, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(831, 40, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(832, 42, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(833, 42, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(834, 42, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(835, 42, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(836, 44, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(837, 44, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(838, 44, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(839, 44, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(840, 44, 2, 7, 'BALANCE B/F', 5, 8400, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(841, 45, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(842, 45, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(843, 45, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(844, 45, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(845, 45, 2, 7, 'BALANCE B/F', 5, 6500, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(846, 48, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(847, 48, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(848, 48, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(849, 48, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(850, 48, 2, 7, 'BALANCE B/F', 5, 63000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(851, 59, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(852, 59, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(853, 59, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(854, 59, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(855, 59, 2, 7, 'BALANCE B/F', 5, 24000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(856, 88, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(857, 88, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(858, 88, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(859, 88, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(860, 89, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(861, 89, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(862, 89, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(863, 89, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(864, 89, 2, 7, 'BALANCE B/F', 5, 5600, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(865, 90, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(866, 90, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(867, 90, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(868, 90, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(873, 137, 2, 3, 'General Fee', 5, 17000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(874, 137, 2, 5, 'General Fee', 5, 6000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(875, 137, 2, 4, 'General Fee', 5, 1000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(876, 137, 2, 6, 'General Fee', 5, 2000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(877, 137, 2, 7, 'BALANCE B/F', 5, 4000, 1, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(878, 43, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(879, 43, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(880, 43, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(881, 43, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(882, 49, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(883, 49, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(884, 49, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(885, 49, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(886, 50, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(887, 50, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(888, 50, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(889, 50, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(890, 52, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(891, 52, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(892, 52, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(893, 52, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(894, 53, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(895, 53, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(896, 53, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(897, 53, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(898, 53, 2, 7, 'BALANCE B/F', 4, 19500, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(899, 54, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(900, 54, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(901, 54, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(902, 54, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(903, 54, 2, 7, 'BALANCE B/F', 4, 52700, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(904, 55, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(905, 55, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(906, 55, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(907, 55, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(908, 56, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(909, 56, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(910, 56, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(911, 56, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(912, 58, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(913, 58, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(914, 58, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(915, 58, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(916, 60, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(917, 60, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(918, 60, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(919, 60, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(920, 60, 2, 7, 'BALANCE B/F', 4, 13000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(921, 61, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(922, 61, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(923, 61, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(924, 61, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(925, 61, 2, 7, 'BALANCE B/F', 4, 21400, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(926, 62, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(927, 62, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(928, 62, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(929, 62, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(930, 66, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(931, 66, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(932, 66, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(933, 66, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(934, 69, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(935, 69, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(936, 69, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(937, 69, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(938, 71, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(939, 71, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(940, 71, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(941, 71, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(942, 133, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(943, 133, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(944, 133, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(945, 133, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(946, 64, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(947, 64, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(948, 64, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(949, 64, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(954, 65, 2, 7, 'BALANCE B/F', 4, 11000, 1, 1, '2021-08-12 18:19:30', 1, '2021-08-12 18:19:30', NULL, NULL),
(955, 67, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(956, 67, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(957, 67, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(958, 67, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(959, 67, 2, 7, 'BALANCE B/F', 3, 7000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(960, 68, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(961, 68, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(962, 68, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(963, 68, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(964, 70, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(965, 70, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(966, 70, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(967, 70, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(968, 72, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(969, 72, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(970, 72, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(971, 72, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(972, 73, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(973, 73, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(974, 73, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(975, 73, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(980, 75, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(981, 75, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(982, 75, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(983, 75, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(984, 75, 2, 7, 'BALANCE B/F', 3, 500, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(985, 76, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(986, 76, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(987, 76, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(988, 76, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(989, 78, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(990, 78, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(991, 78, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(992, 78, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(993, 78, 2, 7, 'BALANCE B/F', 3, 10000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(994, 79, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(995, 79, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(996, 79, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(997, 79, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(998, 81, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(999, 81, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1000, 81, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1001, 81, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1002, 81, 2, 7, 'BALANCE B/F', 3, 5800, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1003, 82, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1004, 82, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1005, 82, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1006, 82, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1007, 83, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1008, 83, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1009, 83, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1010, 83, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1011, 86, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1012, 86, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1013, 86, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1014, 86, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1015, 87, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1016, 87, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1017, 87, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1018, 87, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1019, 102, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1020, 102, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1021, 102, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1022, 102, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1023, 103, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1024, 103, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1025, 103, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1026, 103, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1027, 104, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1028, 104, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1029, 104, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(1030, 104, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1031, 107, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1032, 107, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1033, 107, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1034, 107, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL);
INSERT INTO `student_fees` (`id`, `student_id`, `current_session_id`, `fee_parameter_id`, `description`, `class_grade_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1035, 114, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1036, 114, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1037, 114, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1038, 114, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1039, 123, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1040, 123, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1041, 123, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1042, 123, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1043, 152, 2, 3, 'General Fee', 3, 16000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1044, 152, 2, 5, 'General Fee', 3, 6000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1045, 152, 2, 4, 'General Fee', 3, 1000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1046, 152, 2, 6, 'General Fee', 3, 2000, 1, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(1047, 91, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1048, 91, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1049, 91, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1050, 91, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1051, 91, 2, 7, 'BALANCE B/F', 2, 9000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1052, 93, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1053, 93, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1054, 93, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1055, 93, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1056, 94, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1057, 94, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1058, 94, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1059, 94, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1060, 95, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1061, 95, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1062, 95, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1063, 95, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(1064, 99, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1065, 99, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1066, 99, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1067, 99, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1068, 99, 2, 7, 'BALANCE B/F', 2, 6750, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1069, 100, 2, 3, 'General Fee', 2, 14100, 1, 1, '2021-11-20 15:21:34', 1, '2021-11-20 15:21:34', NULL, NULL),
(1070, 100, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1071, 100, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1072, 100, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1073, 101, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1074, 101, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1075, 101, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1076, 101, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1077, 106, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1078, 106, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1079, 106, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1080, 106, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1081, 108, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1082, 108, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1083, 108, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1084, 108, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1085, 116, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1086, 116, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1087, 116, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1088, 116, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1089, 117, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1090, 117, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1091, 117, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1092, 117, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1093, 117, 2, 7, 'BALANCE B/F', 2, 19500, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1094, 118, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1095, 118, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1096, 118, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1097, 118, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1098, 119, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1099, 119, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1100, 119, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1101, 119, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1102, 119, 2, 7, 'BALANCE B/F', 2, 7000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1103, 121, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1104, 121, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1105, 121, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1106, 121, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1107, 121, 2, 7, 'BALANCE B/F', 2, 4500, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1108, 122, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1109, 122, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1110, 122, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1111, 122, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1112, 124, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1113, 124, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1114, 124, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1115, 124, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1116, 124, 2, 7, 'BALANCE B/F', 2, 8000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1117, 125, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1118, 125, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1119, 125, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1120, 125, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1121, 126, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1122, 126, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1123, 126, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1124, 126, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1125, 127, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1126, 127, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1127, 127, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1128, 127, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1129, 129, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1130, 129, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1131, 129, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1132, 129, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1133, 129, 2, 7, 'BALANCE B/F', 2, 19600, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1134, 131, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1135, 131, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1136, 131, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1137, 131, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1138, 134, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1139, 134, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1140, 134, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1141, 134, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1142, 136, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1143, 136, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1144, 136, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1145, 136, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(1146, 138, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1147, 138, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1148, 138, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1149, 138, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1150, 140, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-11-20 15:15:13', 1, '2021-11-20 15:15:13', NULL, NULL),
(1151, 140, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1152, 140, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1153, 140, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1154, 140, 2, 7, 'BALANCE B/F', 2, 10000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1155, 142, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1156, 142, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1157, 142, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1158, 142, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1159, 143, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1160, 143, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1161, 143, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1162, 143, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1163, 144, 2, 3, 'General Fee', 2, 14400, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1164, 144, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1165, 144, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1166, 144, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1167, 145, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1168, 145, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1169, 145, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1170, 145, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1171, 148, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1172, 148, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1173, 148, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1174, 148, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1175, 148, 2, 7, 'BALANCE B/F', 2, 3800, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1176, 149, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1177, 149, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1178, 149, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1179, 149, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1184, 151, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1185, 151, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1186, 151, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1187, 151, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1188, 153, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1189, 153, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1190, 153, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1191, 153, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1192, 155, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1193, 155, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1194, 155, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1195, 155, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(1200, 74, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-08-11 07:10:02', NULL, '2021-08-11 07:10:02', NULL, NULL),
(1201, 74, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-08-11 07:10:02', NULL, '2021-08-11 07:10:02', NULL, NULL),
(1202, 74, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-08-11 07:10:02', NULL, '2021-08-11 07:10:02', NULL, NULL),
(1203, 74, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-08-11 07:10:02', NULL, '2021-08-11 07:10:02', NULL, NULL),
(1204, 147, 2, 3, 'General Fee', 6, 17000, 1, 1, '2021-08-11 09:13:14', NULL, '2021-08-11 09:13:14', NULL, NULL),
(1205, 147, 2, 5, 'General Fee', 6, 6000, 1, 1, '2021-08-11 09:13:14', NULL, '2021-08-11 09:13:14', NULL, NULL),
(1206, 147, 2, 4, 'General Fee', 6, 1000, 1, 1, '2021-08-11 09:13:14', NULL, '2021-08-11 09:13:14', NULL, NULL),
(1207, 147, 2, 6, 'General Fee', 6, 2000, 1, 1, '2021-08-11 09:13:14', NULL, '2021-08-11 09:13:14', NULL, NULL),
(1212, 156, 2, 3, 'General Fee', 2, 14400, 1, 1, '2021-08-11 09:38:01', NULL, '2021-08-11 09:38:01', NULL, NULL),
(1213, 156, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-08-11 09:38:01', NULL, '2021-08-11 09:38:01', NULL, NULL),
(1214, 156, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-08-11 09:38:01', NULL, '2021-08-11 09:38:01', NULL, NULL),
(1215, 156, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-08-11 09:38:01', NULL, '2021-08-11 09:38:01', NULL, NULL),
(1216, 65, 2, 3, 'General Fee', 4, 17000, 1, 1, '2021-08-12 18:19:30', NULL, '2021-08-12 18:19:30', NULL, NULL),
(1217, 65, 2, 5, 'General Fee', 4, 6000, 1, 1, '2021-08-12 18:19:30', NULL, '2021-08-12 18:19:30', NULL, NULL),
(1218, 65, 2, 4, 'General Fee', 4, 1000, 1, 1, '2021-08-12 18:19:30', NULL, '2021-08-12 18:19:30', NULL, NULL),
(1219, 65, 2, 6, 'General Fee', 4, 2000, 1, 1, '2021-08-12 18:19:30', NULL, '2021-08-12 18:19:30', NULL, NULL),
(1220, 15, 2, 3, 'General Fee', 8, 18000, 1, 1, '2021-08-12 18:48:30', NULL, '2021-08-12 18:48:30', NULL, NULL),
(1221, 15, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-08-12 18:48:30', NULL, '2021-08-12 18:48:30', NULL, NULL),
(1222, 15, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-08-12 18:48:30', NULL, '2021-08-12 18:48:30', NULL, NULL),
(1223, 15, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-08-12 18:48:30', NULL, '2021-08-12 18:48:30', NULL, NULL),
(1224, 98, 2, 3, 'General Fee', 8, 16200, 1, 1, '2021-08-12 19:02:36', NULL, '2021-08-12 19:02:36', NULL, NULL),
(1225, 98, 2, 5, 'General Fee', 8, 6000, 1, 1, '2021-08-12 19:02:36', NULL, '2021-08-12 19:02:36', NULL, NULL),
(1226, 98, 2, 4, 'General Fee', 8, 1000, 1, 1, '2021-08-12 19:02:36', NULL, '2021-08-12 19:02:36', NULL, NULL),
(1227, 98, 2, 6, 'General Fee', 8, 2000, 1, 1, '2021-08-12 19:02:36', NULL, '2021-08-12 19:02:36', NULL, NULL),
(1229, 151, 2, 9, 'Optional Fee', 2, 2000, 1, 1, '2021-08-17 09:11:35', NULL, '2021-08-17 09:11:35', NULL, NULL),
(1230, 151, 2, 12, 'Optional Fee', 2, 2500, 1, 1, '2021-08-17 09:11:35', NULL, '2021-08-17 09:11:35', NULL, NULL),
(1231, 150, 2, 3, 'General Fee', 2, 16000, 1, 1, '2021-09-02 15:39:47', 1, '2021-09-02 15:39:47', NULL, NULL),
(1232, 150, 2, 5, 'General Fee', 2, 6000, 1, 1, '2021-09-02 15:39:47', 1, '2021-09-02 15:39:47', NULL, NULL),
(1233, 150, 2, 4, 'General Fee', 2, 1000, 1, 1, '2021-09-02 15:39:47', 1, '2021-09-02 15:39:47', NULL, NULL),
(1234, 150, 2, 6, 'General Fee', 2, 2000, 1, 1, '2021-09-02 15:39:47', 1, '2021-09-02 15:39:47', NULL, NULL),
(1235, 74, 2, 11, 'Optional Fee', 4, 4500, 1, 1, '2021-09-21 09:46:37', NULL, '2021-09-21 09:46:37', NULL, NULL),
(1240, 159, 2, 3, 'General Fee', 1, 14400, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1241, 159, 2, 5, 'General Fee', 1, 6000, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1242, 159, 2, 4, 'General Fee', 1, 1000, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1243, 159, 2, 6, 'General Fee', 1, 2000, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1244, 159, 2, 10, 'Optional Fee', 1, 4500, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1245, 159, 2, 12, 'Optional Fee', 1, 2500, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1246, 159, 2, 1, 'One Time Fee', 1, 3000, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1247, 159, 2, 6, 'One Time Fee', 1, 2000, 1, 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(1248, 160, 2, 3, 'General Fee', 1, 16000, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1249, 160, 2, 5, 'General Fee', 1, 6000, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1250, 160, 2, 4, 'General Fee', 1, 1000, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1251, 160, 2, 6, 'General Fee', 1, 2000, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1252, 160, 2, 10, 'Optional Fee', 1, 4500, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1253, 160, 2, 12, 'Optional Fee', 1, 2500, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1254, 160, 2, 1, 'One Time Fee', 1, 3000, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1255, 160, 2, 6, 'One Time Fee', 1, 2000, 1, 1, '2021-12-01 08:21:34', NULL, NULL, NULL, NULL),
(1256, 43, 2, 10, 'Optional Fee', 4, 4500, 1, 1, '2021-12-11 08:11:15', NULL, '2021-12-11 08:11:15', NULL, NULL),
(1257, 43, 2, 13, 'Optional Fee', 4, 3500, 1, 1, '2021-12-11 08:11:16', NULL, '2021-12-11 08:11:16', NULL, NULL),
(1258, 124, 2, 10, 'Optional Fee', 2, 4500, 1, 1, '2021-12-15 11:43:34', NULL, '2021-12-15 11:43:34', NULL, NULL),
(1259, 124, 2, 12, 'Optional Fee', 2, 2500, 1, 1, '2021-12-15 11:43:34', NULL, '2021-12-15 11:43:34', NULL, NULL),
(1260, 40, 2, 10, 'Optional Fee', 5, 4500, 1, 1, '2022-01-06 11:54:15', NULL, '2022-01-06 11:54:15', NULL, NULL),
(1261, 151, 2, 7, 'BALANCE B/F', 2, 1500, 1, 1, '2022-01-20 07:49:27', NULL, '2022-01-20 07:49:27', NULL, NULL),
(1262, 113, 2, 7, 'BALANCE B/F', 10, 2300, 1, 1, '2022-01-20 07:50:24', NULL, '2022-01-20 07:50:24', NULL, NULL),
(1263, 113, 2, 8, 'Additional Fee', 10, 4200, 1, 1, '2022-01-20 07:51:15', NULL, '2022-01-20 07:51:15', NULL, NULL),
(1264, 5, 2, 7, 'BALANCE B/F', 8, 5000, 1, 1, '2022-01-21 10:36:30', NULL, '2022-01-21 10:36:30', NULL, NULL),
(1265, 6, 2, 7, 'BALANCE B/F', 8, 4500, 1, 1, '2022-01-21 10:37:35', NULL, '2022-01-21 10:37:35', NULL, NULL),
(1266, 43, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1267, 49, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1268, 50, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1269, 52, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1270, 53, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1271, 54, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1272, 55, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1273, 56, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1274, 58, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1275, 60, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1276, 61, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1277, 62, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1278, 65, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1279, 66, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1280, 69, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1281, 71, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1282, 74, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1283, 133, 2, 8, 'General Fee', 4, 5050, 1, 1, '2022-01-21 12:02:48', NULL, NULL, NULL, NULL),
(1284, 156, 2, 10, 'Optional Fee', 2, 4500, 1, 1, '2022-02-07 09:28:03', NULL, '2022-02-07 09:28:03', NULL, NULL),
(1285, 156, 2, 8, 'Additional Fee', 2, 350, 1, 1, '2022-02-07 09:28:41', NULL, '2022-02-07 09:28:41', NULL, NULL),
(1286, 126, 2, 10, 'Optional Fee', 2, 4500, 1, 1, '2022-02-08 09:23:51', NULL, '2022-02-08 09:23:51', NULL, NULL),
(1287, 126, 2, 8, 'Additional Fee', 2, 450, 1, 1, '2022-02-08 09:24:21', NULL, '2022-02-08 09:24:21', NULL, NULL),
(1289, 17, 2, 8, 'Additional Fee', 9, 450, 1, 1, '2022-02-16 11:29:50', NULL, '2022-02-16 11:29:50', NULL, NULL),
(1290, 59, 2, 11, 'Optional Fee', 5, 4500, 1, 1, '2022-02-25 07:49:58', NULL, '2022-02-25 07:49:58', NULL, NULL),
(1291, 59, 2, 13, 'Optional Fee', 5, 3500, 1, 1, '2022-02-25 07:49:58', NULL, '2022-02-25 07:49:58', NULL, NULL),
(1292, 59, 2, 8, 'Additional Fee', 5, 350, 1, 1, '2022-02-25 07:50:37', NULL, '2022-02-25 07:50:37', NULL, NULL),
(1293, 17, 2, 12, 'Optional Fee', 9, 2500, 1, 1, '2022-03-22 10:30:15', NULL, '2022-03-22 10:30:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_promotions`
--

CREATE TABLE `student_promotions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promotion_history_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `fees` bigint(20) NOT NULL,
  `arrears` bigint(20) NOT NULL,
  `balance` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_promotions`
--

INSERT INTO `student_promotions` (`id`, `promotion_history_id`, `student_id`, `class_grade_id`, `current_session_id`, `fees`, `arrears`, `balance`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 2, 9, 1, 0, 0, 0, 1, '2021-07-13 20:32:38', NULL, '2021-07-13 20:32:38'),
(2, 1, 97, 9, 1, 0, 0, 0, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39'),
(3, 1, 105, 9, 1, 2000, 0, 0, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39'),
(4, 1, 109, 9, 1, 0, 0, 0, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39'),
(5, 1, 110, 9, 1, 0, 0, 0, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39'),
(6, 1, 111, 9, 1, 0, 0, 0, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39'),
(7, 1, 112, 9, 1, 0, 0, 0, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39'),
(8, 1, 113, 9, 1, 0, 0, 0, 1, '2021-07-13 20:32:39', NULL, '2021-07-13 20:32:39'),
(9, 2, 1, 8, 1, 0, 0, 0, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04'),
(10, 2, 12, 8, 1, 24000, 44000, 68000, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04'),
(11, 2, 17, 8, 1, 25000, 2500, 27500, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04'),
(12, 2, 26, 8, 1, 25000, 400, 25400, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04'),
(13, 2, 32, 8, 1, 0, 0, 0, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04'),
(14, 2, 92, 8, 1, 0, 0, 0, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04'),
(15, 2, 130, 8, 1, 0, 0, 0, 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04'),
(16, 3, 3, 7, 1, 0, 18000, 18000, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(17, 3, 4, 7, 1, 0, 44500, 44500, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(18, 3, 5, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(19, 3, 6, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(20, 3, 7, 7, 1, 0, 750, 750, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(21, 3, 8, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(22, 3, 9, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(23, 3, 11, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(24, 3, 14, 7, 1, 0, 8000, 8000, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(25, 3, 47, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(26, 3, 51, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:01', NULL, '2021-07-13 20:35:01'),
(27, 3, 57, 7, 1, 0, 0, 0, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02'),
(28, 3, 146, 7, 1, 1800, 0, 1800, 1, '2021-07-13 20:35:02', NULL, '2021-07-13 20:35:02'),
(29, 4, 13, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(30, 4, 18, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(31, 4, 19, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(32, 4, 20, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(33, 4, 21, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(34, 4, 22, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(35, 4, 23, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(36, 4, 30, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(37, 4, 33, 6, 1, 3000, 0, 3000, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(38, 4, 135, 6, 1, 0, 0, 0, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(39, 4, 147, 6, 1, 3000, 0, 3000, 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51'),
(40, 5, 15, 5, 1, 5000, 5000, 10000, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19'),
(41, 5, 24, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19'),
(42, 5, 25, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19'),
(43, 5, 27, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19'),
(44, 5, 28, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19'),
(45, 5, 29, 5, 1, 300, 0, 300, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(46, 5, 31, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(47, 5, 34, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(48, 5, 36, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(49, 5, 37, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(50, 5, 63, 5, 1, 14600, 0, 14600, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(51, 5, 77, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(52, 5, 80, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(53, 5, 84, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(54, 5, 85, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(55, 5, 96, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(56, 5, 115, 5, 1, 0, 0, 0, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(57, 5, 120, 5, 1, 500, 0, 500, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(58, 5, 128, 5, 1, 24000, 9800, 33800, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(59, 5, 132, 5, 1, 14800, 0, 14800, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(60, 5, 154, 5, 1, 33500, 108500, 142000, 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20'),
(61, 6, 35, 4, 1, 6000, 2000, 8000, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(62, 6, 38, 4, 1, 0, 0, 0, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(63, 6, 39, 4, 1, 0, 0, 0, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(64, 6, 40, 4, 1, 0, 0, 0, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(65, 6, 42, 4, 1, 0, 0, 0, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(66, 6, 44, 4, 1, 8400, 0, 8400, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(67, 6, 45, 4, 1, 6500, 0, 6500, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(68, 6, 48, 4, 1, 29000, 34000, 63000, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(69, 6, 59, 4, 1, 24000, 0, 24000, 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59'),
(70, 6, 88, 4, 1, 0, 0, 0, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00'),
(71, 6, 89, 4, 1, 5600, 0, 5600, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00'),
(72, 6, 90, 4, 1, 0, 0, 0, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00'),
(73, 6, 98, 4, 1, 0, 0, 0, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00'),
(74, 6, 137, 4, 1, 4000, 0, 4000, 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00'),
(75, 7, 43, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(76, 7, 49, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(77, 7, 50, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(78, 7, 52, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(79, 7, 53, 3, 1, 19500, 0, 19500, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(80, 7, 54, 3, 1, 21400, 31300, 52700, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(81, 7, 55, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(82, 7, 56, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(83, 7, 58, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(84, 7, 60, 3, 1, 13000, 0, 13000, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(85, 7, 61, 3, 1, 21400, 0, 21400, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(86, 7, 62, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(87, 7, 66, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18'),
(88, 7, 69, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19'),
(89, 7, 71, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19'),
(90, 7, 133, 3, 1, 0, 0, 0, 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19'),
(91, 8, 64, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(92, 8, 65, 2, 1, 11000, 0, 11000, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(93, 8, 67, 2, 1, 7000, 0, 7000, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(94, 8, 68, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(95, 8, 70, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(96, 8, 72, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(97, 8, 73, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(98, 8, 74, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(99, 8, 75, 2, 1, 500, 0, 500, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(100, 8, 76, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(101, 8, 78, 2, 1, 5000, 5000, 10000, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(102, 8, 79, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(103, 8, 81, 2, 1, 5800, 0, 5800, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(104, 8, 82, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(105, 8, 83, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(106, 8, 86, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(107, 8, 87, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(108, 8, 102, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(109, 8, 103, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43'),
(110, 8, 104, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44'),
(111, 8, 107, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44'),
(112, 8, 114, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44'),
(113, 8, 123, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44'),
(114, 8, 152, 2, 1, 0, 0, 0, 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44'),
(115, 9, 91, 1, 1, 9000, 0, 9000, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02'),
(116, 9, 93, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02'),
(117, 9, 94, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02'),
(118, 9, 95, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(119, 9, 99, 1, 1, 6750, 0, 6750, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(120, 9, 100, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(121, 9, 101, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(122, 9, 106, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(123, 9, 108, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(124, 9, 116, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(125, 9, 117, 1, 1, 19500, 0, 19500, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(126, 9, 118, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(127, 9, 119, 1, 1, 7000, 0, 7000, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(128, 9, 121, 1, 1, 4500, 0, 4500, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(129, 9, 122, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(130, 9, 124, 1, 1, 8000, 0, 8000, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(131, 9, 125, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(132, 9, 126, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(133, 9, 127, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(134, 9, 129, 1, 1, 19600, 0, 19600, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(135, 9, 131, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(136, 9, 134, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03'),
(137, 9, 136, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(138, 9, 138, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(139, 9, 140, 1, 1, 10000, 0, 10000, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(140, 9, 142, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(141, 9, 143, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(142, 9, 144, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(143, 9, 145, 1, 1, -200, 0, -200, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(144, 9, 148, 1, 1, 3800, 0, 3800, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(145, 9, 149, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(146, 9, 150, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(147, 9, 151, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(148, 9, 153, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(149, 9, 155, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04'),
(150, 9, 156, 1, 1, 0, 0, 0, 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04');

-- --------------------------------------------------------

--
-- Table structure for table `student_timelines`
--

CREATE TABLE `student_timelines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_timelines`
--

INSERT INTO `student_timelines` (`id`, `student_id`, `current_session_id`, `class_grade_id`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 8, NULL, 1, '2021-05-08 12:04:51', '2021-05-08 12:04:51'),
(2, 2, 1, 9, NULL, 1, '2021-05-08 13:07:51', '2021-05-08 13:07:51'),
(3, 3, 1, 7, NULL, 1, '2021-05-08 13:16:36', '2021-05-08 13:16:36'),
(4, 4, 1, 7, NULL, 1, '2021-05-08 13:23:37', '2021-05-08 13:23:37'),
(5, 5, 1, 7, NULL, 1, '2021-05-08 13:30:05', '2021-05-08 13:30:05'),
(6, 6, 1, 7, NULL, 1, '2021-05-08 13:37:08', '2021-05-08 13:37:08'),
(7, 7, 1, 7, NULL, 1, '2021-05-08 13:49:28', '2021-05-08 13:49:28'),
(8, 8, 1, 7, NULL, 1, '2021-05-08 13:57:27', '2021-05-08 13:57:27'),
(9, 9, 1, 7, NULL, 1, '2021-05-08 14:04:20', '2021-05-08 14:04:20'),
(10, 10, 1, 7, NULL, 1, '2021-05-08 14:12:08', '2021-05-08 14:12:08'),
(11, 11, 1, 7, NULL, 1, '2021-05-08 14:18:34', '2021-05-08 14:18:34'),
(12, 12, 1, 8, NULL, 1, '2021-05-08 14:24:36', '2021-05-08 14:24:36'),
(13, 13, 1, 6, NULL, 1, '2021-05-08 14:31:53', '2021-05-08 14:31:53'),
(14, 14, 1, 7, NULL, 1, '2021-05-08 15:43:24', '2021-05-08 15:43:24'),
(15, 15, 1, 5, NULL, 1, '2021-05-08 15:49:04', '2021-05-08 15:49:04'),
(16, 16, 1, 7, NULL, 1, '2021-05-08 15:54:37', '2021-05-08 15:54:37'),
(17, 17, 1, 8, NULL, 1, '2021-05-08 15:57:50', '2021-05-08 15:57:50'),
(18, 18, 1, 6, NULL, 1, '2021-05-08 16:03:23', '2021-05-08 16:03:23'),
(19, 19, 1, 6, NULL, 1, '2021-05-08 16:15:50', '2021-05-08 16:15:50'),
(20, 20, 1, 6, NULL, 1, '2021-05-08 16:21:02', '2021-05-08 16:21:02'),
(21, 21, 1, 6, NULL, 1, '2021-05-09 14:24:29', '2021-05-09 14:24:29'),
(22, 22, 1, 6, NULL, 1, '2021-05-09 14:26:23', '2021-05-09 14:26:23'),
(23, 23, 1, 6, NULL, 1, '2021-05-09 14:29:07', '2021-05-09 14:29:07'),
(24, 24, 1, 5, NULL, 1, '2021-05-09 14:31:51', '2021-05-09 14:31:51'),
(25, 25, 1, 5, NULL, 1, '2021-05-09 14:33:48', '2021-05-09 14:33:48'),
(26, 26, 1, 8, NULL, 1, '2021-05-09 14:36:27', '2021-05-09 14:36:27'),
(27, 27, 1, 5, NULL, 1, '2021-05-09 14:38:59', '2021-05-09 14:38:59'),
(28, 28, 1, 5, NULL, 1, '2021-05-09 14:41:39', '2021-05-09 14:41:39'),
(29, 29, 1, 5, NULL, 1, '2021-05-09 14:43:54', '2021-05-09 14:43:54'),
(30, 30, 1, 6, NULL, 1, '2021-05-09 14:45:58', '2021-05-09 14:45:58'),
(31, 31, 1, 5, NULL, 1, '2021-05-09 14:48:04', '2021-05-09 14:48:04'),
(32, 32, 1, 8, NULL, 1, '2021-05-09 14:50:01', '2021-05-09 14:50:01'),
(33, 33, 1, 6, NULL, 1, '2021-05-09 14:52:05', '2021-05-09 14:52:05'),
(34, 34, 1, 5, NULL, 1, '2021-05-09 14:54:09', '2021-05-09 14:54:09'),
(35, 35, 1, 4, NULL, 1, '2021-05-09 14:57:30', '2021-05-09 14:57:30'),
(36, 36, 1, 5, NULL, 1, '2021-05-09 14:59:36', '2021-05-09 14:59:36'),
(37, 37, 1, 5, NULL, 1, '2021-05-09 15:02:48', '2021-05-09 15:02:48'),
(38, 38, 1, 4, NULL, 1, '2021-05-09 15:04:55', '2021-05-09 15:04:55'),
(39, 39, 1, 4, NULL, 1, '2021-05-09 15:06:35', '2021-05-09 15:06:35'),
(40, 40, 1, 4, NULL, 1, '2021-05-09 15:09:00', '2021-05-09 15:09:00'),
(41, 41, 1, 4, NULL, 1, '2021-05-09 15:10:45', '2021-05-09 15:10:45'),
(42, 42, 1, 4, NULL, 1, '2021-05-09 15:12:36', '2021-05-09 15:12:36'),
(43, 43, 1, 3, NULL, 1, '2021-05-09 15:14:27', '2021-05-09 15:14:27'),
(44, 44, 1, 4, NULL, 1, '2021-05-09 15:16:44', '2021-05-09 15:16:44'),
(45, 45, 1, 4, NULL, 1, '2021-05-09 15:18:17', '2021-05-09 15:18:17'),
(46, 46, 1, 4, NULL, 1, '2021-05-09 15:24:36', '2021-05-09 15:24:36'),
(47, 47, 1, 7, NULL, 1, '2021-05-09 15:42:35', '2021-05-09 15:42:35'),
(48, 48, 1, 4, NULL, 1, '2021-05-09 15:45:04', '2021-05-09 15:45:04'),
(49, 49, 1, 3, NULL, 1, '2021-05-09 15:46:44', '2021-05-09 15:46:44'),
(50, 50, 1, 3, NULL, 1, '2021-05-09 15:48:42', '2021-05-09 15:48:42'),
(51, 51, 1, 7, NULL, 1, '2021-05-09 15:50:53', '2021-05-09 15:50:53'),
(52, 52, 1, 3, NULL, 1, '2021-05-09 16:00:21', '2021-05-09 16:00:21'),
(53, 53, 1, 3, NULL, 1, '2021-05-09 16:02:22', '2021-05-09 16:02:22'),
(54, 54, 1, 3, NULL, 1, '2021-05-09 16:10:40', '2021-05-09 16:10:40'),
(55, 55, 1, 3, NULL, 1, '2021-05-09 16:13:32', '2021-05-09 16:13:32'),
(56, 56, 1, 3, NULL, 1, '2021-05-09 16:16:04', '2021-05-09 16:16:04'),
(57, 57, 1, 7, NULL, 1, '2021-05-09 16:18:23', '2021-05-09 16:18:23'),
(58, 58, 1, 3, NULL, 1, '2021-05-09 16:19:56', '2021-05-09 16:19:56'),
(59, 59, 1, 4, NULL, 1, '2021-05-09 16:24:17', '2021-05-09 16:24:17'),
(60, 60, 1, 3, NULL, 1, '2021-05-09 16:26:24', '2021-05-09 16:26:24'),
(61, 61, 1, 3, NULL, 1, '2021-05-09 16:28:15', '2021-05-09 16:28:15'),
(62, 62, 1, 3, NULL, 1, '2021-05-09 16:30:47', '2021-05-09 16:30:47'),
(63, 63, 1, 5, NULL, 1, '2021-05-09 16:32:11', '2021-05-09 16:32:11'),
(64, 64, 1, 2, NULL, 1, '2021-05-09 16:34:02', '2021-05-09 16:34:02'),
(65, 65, 1, 2, NULL, 1, '2021-05-09 16:39:40', '2021-05-09 16:39:40'),
(66, 66, 1, 3, NULL, 1, '2021-05-09 16:43:07', '2021-05-09 16:43:07'),
(67, 67, 1, 2, NULL, 1, '2021-05-09 16:45:13', '2021-05-09 16:45:13'),
(68, 68, 1, 2, NULL, 1, '2021-05-09 16:47:15', '2021-05-09 16:47:15'),
(69, 69, 1, 3, NULL, 1, '2021-05-09 16:49:49', '2021-05-09 16:49:49'),
(70, 70, 1, 2, NULL, 1, '2021-05-09 16:51:32', '2021-05-09 16:51:32'),
(71, 71, 1, 3, NULL, 1, '2021-05-09 16:55:28', '2021-05-09 16:55:28'),
(72, 72, 1, 2, NULL, 1, '2021-05-09 16:57:03', '2021-05-09 16:57:03'),
(73, 73, 1, 2, NULL, 1, '2021-05-09 16:58:58', '2021-05-09 16:58:58'),
(74, 74, 1, 2, NULL, 1, '2021-05-09 17:00:10', '2021-05-09 17:00:10'),
(75, 75, 1, 2, NULL, 1, '2021-05-09 17:01:57', '2021-05-09 17:01:57'),
(76, 76, 1, 2, NULL, 1, '2021-05-09 17:04:05', '2021-05-09 17:04:05'),
(77, 77, 1, 5, NULL, 1, '2021-05-09 17:08:03', '2021-05-09 17:08:03'),
(78, 78, 1, 2, NULL, 1, '2021-05-09 17:11:20', '2021-05-09 17:11:20'),
(79, 79, 1, 2, NULL, 1, '2021-05-09 17:13:01', '2021-05-09 17:13:01'),
(80, 80, 1, 5, NULL, 1, '2021-05-09 17:14:23', '2021-05-09 17:14:23'),
(81, 81, 1, 2, NULL, 1, '2021-05-09 17:16:06', '2021-05-09 17:16:06'),
(82, 82, 1, 2, NULL, 1, '2021-05-09 17:17:39', '2021-05-09 17:17:39'),
(83, 83, 1, 2, NULL, 1, '2021-05-09 17:20:01', '2021-05-09 17:20:01'),
(84, 84, 1, 5, NULL, 1, '2021-05-09 17:22:34', '2021-05-09 17:22:34'),
(85, 85, 1, 5, NULL, 1, '2021-05-09 17:24:07', '2021-05-09 17:24:07'),
(86, 86, 1, 2, NULL, 1, '2021-05-09 17:25:47', '2021-05-09 17:25:47'),
(87, 87, 1, 2, NULL, 1, '2021-05-09 17:27:31', '2021-05-09 17:27:31'),
(88, 88, 1, 4, NULL, 1, '2021-05-09 17:30:24', '2021-05-09 17:30:24'),
(89, 89, 1, 4, NULL, 1, '2021-05-09 17:32:08', '2021-05-09 17:32:08'),
(90, 90, 1, 4, NULL, 1, '2021-05-09 17:33:58', '2021-05-09 17:33:58'),
(91, 91, 1, 1, NULL, 1, '2021-05-09 18:37:50', '2021-05-09 18:37:50'),
(92, 92, 1, 8, NULL, 1, '2021-05-09 18:39:52', '2021-05-09 18:39:52'),
(93, 93, 1, 1, NULL, 1, '2021-05-09 18:41:46', '2021-05-09 18:41:46'),
(94, 94, 1, 1, NULL, 1, '2021-05-09 18:43:17', '2021-05-09 18:43:17'),
(95, 95, 1, 1, NULL, 1, '2021-05-09 18:45:22', '2021-05-09 18:45:22'),
(96, 96, 1, 5, NULL, 1, '2021-05-09 18:47:33', '2021-05-09 18:47:33'),
(97, 97, 1, 1, NULL, 1, '2021-05-09 18:49:13', '2021-05-09 18:49:13'),
(98, 98, 1, 4, NULL, 1, '2021-05-09 18:53:41', '2021-05-09 18:53:41'),
(99, 99, 1, 1, NULL, 1, '2021-05-09 18:54:49', '2021-05-09 18:54:49'),
(100, 100, 1, 1, NULL, 1, '2021-05-09 18:56:43', '2021-05-09 18:56:43'),
(101, 101, 1, 1, NULL, 1, '2021-05-09 18:59:20', '2021-05-09 18:59:20'),
(102, 102, 1, 2, NULL, 1, '2021-05-09 19:00:23', '2021-05-09 19:00:23'),
(103, 103, 1, 2, NULL, 1, '2021-05-09 19:02:02', '2021-05-09 19:02:02'),
(104, 104, 1, 2, NULL, 1, '2021-05-09 19:03:37', '2021-05-09 19:03:37'),
(105, 105, 1, 9, NULL, 1, '2021-05-09 19:05:17', '2021-05-09 19:05:17'),
(106, 106, 1, 1, NULL, 1, '2021-05-09 19:06:30', '2021-05-09 19:06:30'),
(107, 107, 1, 2, NULL, 1, '2021-05-09 19:11:02', '2021-05-09 19:11:02'),
(108, 108, 1, 1, NULL, 1, '2021-05-09 19:12:34', '2021-05-09 19:12:34'),
(109, 109, 1, 9, NULL, 1, '2021-05-09 19:14:10', '2021-05-09 19:14:10'),
(110, 110, 1, 9, NULL, 1, '2021-05-09 19:17:34', '2021-05-09 19:17:34'),
(111, 111, 1, 9, NULL, 1, '2021-05-09 19:19:50', '2021-05-09 19:19:50'),
(112, 112, 1, 9, NULL, 1, '2021-05-09 19:21:32', '2021-05-09 19:21:32'),
(113, 113, 1, 9, NULL, 1, '2021-05-09 19:23:17', '2021-05-09 19:23:17'),
(114, 114, 1, 2, NULL, 1, '2021-05-09 19:24:47', '2021-05-09 19:24:47'),
(115, 115, 1, 5, NULL, 1, '2021-05-09 19:26:33', '2021-05-09 19:26:33'),
(116, 116, 1, 1, NULL, 1, '2021-05-09 19:28:40', '2021-05-09 19:28:40'),
(117, 117, 1, 1, NULL, 1, '2021-05-09 19:31:57', '2021-05-09 19:31:57'),
(118, 118, 1, 1, NULL, 1, '2021-05-09 19:33:35', '2021-05-09 19:33:35'),
(119, 119, 1, 1, NULL, 1, '2021-05-09 19:35:05', '2021-05-09 19:35:05'),
(120, 120, 1, 5, NULL, 1, '2021-05-09 19:37:44', '2021-05-09 19:37:44'),
(121, 121, 1, 1, NULL, 1, '2021-05-09 19:42:42', '2021-05-09 19:42:42'),
(122, 122, 1, 1, NULL, 1, '2021-05-09 19:44:49', '2021-05-09 19:44:49'),
(123, 123, 1, 2, NULL, 1, '2021-05-09 19:50:29', '2021-05-09 19:50:29'),
(124, 124, 1, 1, NULL, 1, '2021-05-09 19:56:15', '2021-05-09 19:56:15'),
(125, 125, 1, 1, NULL, 1, '2021-05-09 19:59:32', '2021-05-09 19:59:32'),
(126, 126, 1, 1, NULL, 1, '2021-05-09 20:04:13', '2021-05-09 20:04:13'),
(127, 127, 1, 1, NULL, 1, '2021-05-09 20:06:21', '2021-05-09 20:06:21'),
(128, 128, 1, 5, NULL, 1, '2021-05-09 20:10:36', '2021-05-09 20:10:36'),
(129, 129, 1, 1, NULL, 1, '2021-05-09 20:22:38', '2021-05-09 20:22:38'),
(130, 130, 1, 8, NULL, 1, '2021-05-09 20:25:38', '2021-05-09 20:25:38'),
(131, 131, 1, 1, NULL, 1, '2021-05-09 20:28:34', '2021-05-09 20:28:34'),
(132, 132, 1, 5, NULL, 1, '2021-05-09 20:31:24', '2021-05-09 20:31:24'),
(133, 133, 1, 3, NULL, 1, '2021-05-09 20:34:11', '2021-05-09 20:34:11'),
(134, 134, 1, 1, NULL, 1, '2021-05-09 20:37:35', '2021-05-09 20:37:35'),
(135, 135, 1, 6, NULL, 1, '2021-05-09 20:40:23', '2021-05-09 20:40:23'),
(136, 136, 1, 1, NULL, 1, '2021-05-09 20:43:54', '2021-05-09 20:43:54'),
(137, 137, 1, 4, NULL, 1, '2021-05-09 20:46:12', '2021-05-09 20:46:12'),
(138, 138, 1, 1, NULL, 1, '2021-05-09 20:50:05', '2021-05-09 20:50:05'),
(139, 139, 1, 3, NULL, 1, '2021-05-09 20:53:47', '2021-05-09 20:53:47'),
(140, 140, 1, 1, NULL, 1, '2021-05-09 20:56:56', '2021-05-09 20:56:56'),
(141, 141, 1, 5, NULL, 1, '2021-05-09 21:00:10', '2021-05-09 21:00:10'),
(142, 142, 1, 1, NULL, 1, '2021-05-09 21:04:31', '2021-05-09 21:04:31'),
(143, 143, 1, 1, NULL, 2, '2021-06-09 19:46:48', '2021-06-09 19:46:48'),
(144, 144, 1, 1, NULL, 2, '2021-06-09 19:53:28', '2021-06-09 19:53:28'),
(145, 145, 1, 1, NULL, 2, '2021-06-09 20:00:11', '2021-06-09 20:00:11'),
(146, 146, 1, 7, NULL, 2, '2021-06-10 17:34:33', '2021-06-10 17:34:33'),
(147, 147, 1, 6, NULL, 2, '2021-06-10 17:44:16', '2021-06-10 17:44:16'),
(148, 148, 1, 1, NULL, 2, '2021-06-10 18:11:25', '2021-06-10 18:11:25'),
(149, 149, 1, 1, NULL, 2, '2021-06-10 19:41:55', '2021-06-10 19:41:55'),
(150, 150, 1, 1, NULL, 2, '2021-06-10 20:56:26', '2021-06-10 20:56:26'),
(151, 153, 1, 1, NULL, 2, '2021-06-10 21:50:38', '2021-06-10 21:50:38'),
(152, 154, 1, 5, NULL, 2, '2021-06-11 17:54:10', '2021-06-11 17:54:10'),
(153, 155, 1, 1, NULL, 2, '2021-06-16 20:42:52', '2021-06-16 20:42:52'),
(154, 156, 1, 1, NULL, 2, '2021-06-16 21:07:07', '2021-06-16 21:07:07'),
(155, 2, 2, 10, NULL, 1, '2021-07-13 20:32:38', '2021-07-13 20:32:38'),
(156, 97, 2, 10, NULL, 1, '2021-07-13 20:32:39', '2021-07-13 20:32:39'),
(157, 105, 2, 10, NULL, 1, '2021-07-13 20:32:39', '2021-07-13 20:32:39'),
(158, 109, 2, 10, NULL, 1, '2021-07-13 20:32:39', '2021-07-13 20:32:39'),
(159, 110, 2, 10, NULL, 1, '2021-07-13 20:32:39', '2021-07-13 20:32:39'),
(160, 111, 2, 10, NULL, 1, '2021-07-13 20:32:39', '2021-07-13 20:32:39'),
(161, 112, 2, 10, NULL, 1, '2021-07-13 20:32:39', '2021-07-13 20:32:39'),
(162, 113, 2, 10, NULL, 1, '2021-07-13 20:32:39', '2021-07-13 20:32:39'),
(163, 1, 2, 9, NULL, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(164, 12, 2, 9, NULL, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(165, 17, 2, 9, NULL, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(166, 26, 2, 9, NULL, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(167, 32, 2, 9, NULL, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(168, 92, 2, 9, NULL, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(169, 130, 2, 9, NULL, 1, '2021-07-13 20:33:04', '2021-07-13 20:33:04'),
(170, 3, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(171, 4, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(172, 5, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(173, 6, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(174, 7, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(175, 8, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(176, 9, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(177, 11, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(178, 14, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(179, 47, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(180, 51, 2, 8, NULL, 1, '2021-07-13 20:35:01', '2021-07-13 20:35:01'),
(181, 57, 2, 8, NULL, 1, '2021-07-13 20:35:02', '2021-07-13 20:35:02'),
(182, 146, 2, 8, NULL, 1, '2021-07-13 20:35:02', '2021-07-13 20:35:02'),
(183, 13, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(184, 18, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(185, 19, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(186, 20, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(187, 21, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(188, 22, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(189, 23, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(190, 30, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(191, 33, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(192, 135, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(193, 147, 2, 7, NULL, 1, '2021-07-13 20:35:51', '2021-07-13 20:35:51'),
(194, 15, 2, 6, NULL, 1, '2021-07-13 20:36:19', '2021-07-13 20:36:19'),
(195, 24, 2, 6, NULL, 1, '2021-07-13 20:36:19', '2021-07-13 20:36:19'),
(196, 25, 2, 6, NULL, 1, '2021-07-13 20:36:19', '2021-07-13 20:36:19'),
(197, 27, 2, 6, NULL, 1, '2021-07-13 20:36:19', '2021-07-13 20:36:19'),
(198, 28, 2, 6, NULL, 1, '2021-07-13 20:36:19', '2021-07-13 20:36:19'),
(199, 29, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(200, 31, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(201, 34, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(202, 36, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(203, 37, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(204, 63, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(205, 77, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(206, 80, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(207, 84, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(208, 85, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(209, 96, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(210, 115, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(211, 120, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(212, 128, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(213, 132, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(214, 154, 2, 6, NULL, 1, '2021-07-13 20:36:20', '2021-07-13 20:36:20'),
(215, 35, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(216, 38, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(217, 39, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(218, 40, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(219, 42, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(220, 44, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(221, 45, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(222, 48, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(223, 59, 2, 5, NULL, 1, '2021-07-13 20:36:59', '2021-07-13 20:36:59'),
(224, 88, 2, 5, NULL, 1, '2021-07-13 20:37:00', '2021-07-13 20:37:00'),
(225, 89, 2, 5, NULL, 1, '2021-07-13 20:37:00', '2021-07-13 20:37:00'),
(226, 90, 2, 5, NULL, 1, '2021-07-13 20:37:00', '2021-07-13 20:37:00'),
(227, 98, 2, 5, NULL, 1, '2021-07-13 20:37:00', '2021-07-13 20:37:00'),
(228, 137, 2, 5, NULL, 1, '2021-07-13 20:37:00', '2021-07-13 20:37:00'),
(229, 43, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(230, 49, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(231, 50, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(232, 52, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(233, 53, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(234, 54, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(235, 55, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(236, 56, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(237, 58, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(238, 60, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(239, 61, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(240, 62, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(241, 66, 2, 4, NULL, 1, '2021-07-13 20:37:18', '2021-07-13 20:37:18'),
(242, 69, 2, 4, NULL, 1, '2021-07-13 20:37:19', '2021-07-13 20:37:19'),
(243, 71, 2, 4, NULL, 1, '2021-07-13 20:37:19', '2021-07-13 20:37:19'),
(244, 133, 2, 4, NULL, 1, '2021-07-13 20:37:19', '2021-07-13 20:37:19'),
(245, 64, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(246, 65, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(247, 67, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(248, 68, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(249, 70, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(250, 72, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(251, 73, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(252, 74, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(253, 75, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(254, 76, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(255, 78, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(256, 79, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(257, 81, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(258, 82, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(259, 83, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(260, 86, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(261, 87, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(262, 102, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(263, 103, 2, 3, NULL, 1, '2021-07-13 20:37:43', '2021-07-13 20:37:43'),
(264, 104, 2, 3, NULL, 1, '2021-07-13 20:37:44', '2021-07-13 20:37:44'),
(265, 107, 2, 3, NULL, 1, '2021-07-13 20:37:44', '2021-07-13 20:37:44'),
(266, 114, 2, 3, NULL, 1, '2021-07-13 20:37:44', '2021-07-13 20:37:44'),
(267, 123, 2, 3, NULL, 1, '2021-07-13 20:37:44', '2021-07-13 20:37:44'),
(268, 152, 2, 3, NULL, 1, '2021-07-13 20:37:44', '2021-07-13 20:37:44'),
(269, 91, 2, 2, NULL, 1, '2021-07-13 20:38:02', '2021-07-13 20:38:02'),
(270, 93, 2, 2, NULL, 1, '2021-07-13 20:38:02', '2021-07-13 20:38:02'),
(271, 94, 2, 2, NULL, 1, '2021-07-13 20:38:02', '2021-07-13 20:38:02'),
(272, 95, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(273, 99, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(274, 100, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(275, 101, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(276, 106, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(277, 108, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(278, 116, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(279, 117, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(280, 118, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(281, 119, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(282, 121, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(283, 122, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(284, 124, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(285, 125, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(286, 126, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(287, 127, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(288, 129, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(289, 131, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(290, 134, 2, 2, NULL, 1, '2021-07-13 20:38:03', '2021-07-13 20:38:03'),
(291, 136, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(292, 138, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(293, 140, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(294, 142, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(295, 143, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(296, 144, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(297, 145, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(298, 148, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(299, 149, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(300, 150, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(301, 151, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(302, 153, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(303, 155, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(304, 156, 2, 2, NULL, 1, '2021-07-13 20:38:04', '2021-07-13 20:38:04'),
(305, 156, 2, 4, 'Switched from \'GRADE 1\' to \'GRADE 1\'', 1, '2021-08-11 09:35:09', '2021-08-11 09:35:09'),
(306, 156, 2, 2, 'Switched from GRADE ONE to PP1', 1, '2021-08-11 09:41:21', '2021-08-11 09:41:21'),
(307, 65, 2, 4, 'Switched from PRE-PRIMARY TWO to PRE-PRIMARY TWO', 1, '2021-08-12 18:19:30', '2021-08-12 18:19:30'),
(308, 15, 2, 8, 'Switched from GRADE THREE to GRADE FIVE', 1, '2021-08-12 18:48:30', '2021-08-12 18:48:30'),
(309, 98, 2, 8, 'Switched from GRADE TWO to GRADE FIVE', 1, '2021-08-12 19:02:36', '2021-08-12 19:02:36'),
(310, 150, 2, 2, 'Student activated to PRE-PRIMARY ONE TERM-1-2021', 1, '2021-09-02 15:39:47', '2021-09-02 15:39:47'),
(313, 159, 2, 1, 'Enrolled to PLAY GROUP CLASS', 1, '2021-11-15 11:08:05', '2021-11-15 11:08:05'),
(314, 160, 2, 1, 'Enrolled to PLAY GROUP CLASS', 1, '2021-12-01 08:21:35', '2021-12-01 08:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `student_transports`
--

CREATE TABLE `student_transports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `transport_zone_fee_id` bigint(20) UNSIGNED NOT NULL,
  `way` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_transports`
--

INSERT INTO `student_transports` (`id`, `student_id`, `current_session_id`, `class_grade_id`, `transport_zone_fee_id`, `way`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 2, 1, 9, 6, 2, 7000, '2', 1, '2021-07-13 20:32:38', 1, '2021-07-13 20:32:38', NULL, NULL),
(9, 13, 1, 6, 6, 1, 3500, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(10, 16, 1, 7, 6, 2, 7000, '1', 1, '2021-05-10 07:59:55', NULL, '2021-05-10 07:59:55', NULL, NULL),
(11, 18, 1, 6, 8, 1, 4000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(12, 19, 1, 6, 8, 1, 4000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(13, 20, 1, 6, 14, 2, 11000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(14, 21, 1, 6, 2, 2, 5000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(15, 22, 1, 6, 2, 2, 5000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(16, 23, 1, 6, 3, 2, 5500, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(17, 24, 1, 5, 6, 2, 7000, '2', 1, '2021-07-13 20:36:19', 1, '2021-07-13 20:36:19', NULL, NULL),
(18, 25, 1, 5, 6, 2, 7000, '2', 1, '2021-07-13 20:36:19', 1, '2021-07-13 20:36:19', NULL, NULL),
(19, 27, 1, 5, 2, 2, 5000, '2', 1, '2021-07-13 20:36:19', 1, '2021-07-13 20:36:19', NULL, NULL),
(20, 28, 1, 5, 2, 2, 5000, '2', 1, '2021-07-13 20:36:19', 1, '2021-07-13 20:36:19', NULL, NULL),
(21, 29, 1, 5, 10, 2, 9000, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(22, 30, 1, 6, 2, 2, 5000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(23, 31, 1, 5, 2, 2, 5000, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(24, 32, 1, 8, 9, 2, 8500, '2', 1, '2021-07-13 20:33:04', 1, '2021-07-13 20:33:04', NULL, NULL),
(25, 33, 1, 6, 10, 2, 9000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(26, 36, 1, 5, 6, 2, 7000, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(27, 37, 1, 5, 3, 2, 5500, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(28, 39, 1, 4, 10, 2, 9000, '2', 1, '2021-07-13 20:36:59', 1, '2021-07-13 20:36:59', NULL, NULL),
(29, 40, 1, 4, 6, 2, 7000, '2', 1, '2021-07-13 20:36:59', 1, '2021-07-13 20:36:59', NULL, NULL),
(30, 41, 1, 4, 4, 2, 6000, '1', 1, '2021-05-10 08:47:00', NULL, '2021-05-10 08:47:00', NULL, NULL),
(31, 42, 1, 4, 6, 1, 3500, '2', 1, '2021-07-13 20:36:59', 1, '2021-07-13 20:36:59', NULL, NULL),
(32, 44, 1, 4, 2, 1, 2500, '2', 1, '2021-07-13 20:36:59', 1, '2021-07-13 20:36:59', NULL, NULL),
(33, 45, 1, 4, 2, 1, 2500, '2', 1, '2021-07-13 20:36:59', 1, '2021-07-13 20:36:59', NULL, NULL),
(34, 46, 1, 4, 6, 2, 7000, '1', 1, '2021-05-10 09:00:38', NULL, '2021-05-10 09:00:38', NULL, NULL),
(36, 48, 1, 4, 2, 2, 5000, '2', 1, '2021-07-13 20:36:59', 1, '2021-07-13 20:36:59', NULL, NULL),
(37, 49, 1, 3, 8, 1, 4000, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(38, 50, 1, 3, 5, 2, 6500, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(39, 52, 1, 3, 2, 2, 5000, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(40, 53, 1, 3, 3, 2, 5500, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(41, 55, 1, 3, 2, 2, 5000, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(42, 56, 1, 3, 10, 2, 9000, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(44, 58, 1, 3, 3, 2, 5500, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(45, 62, 1, 3, 4, 2, 6000, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(46, 64, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(47, 65, 1, 2, 10, 2, 9000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(48, 66, 1, 3, 2, 2, 5000, '2', 1, '2021-07-13 20:37:18', 1, '2021-07-13 20:37:18', NULL, NULL),
(49, 67, 1, 2, 6, 2, 7000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(50, 68, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(51, 69, 1, 3, 2, 2, 5000, '2', 1, '2021-07-13 20:37:19', 1, '2021-07-13 20:37:19', NULL, NULL),
(52, 70, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(53, 72, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(54, 73, 1, 2, 10, 2, 9000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(55, 74, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(56, 75, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(57, 76, 1, 2, 5, 1, 3250, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(58, 77, 1, 5, 7, 2, 7500, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(59, 80, 1, 5, 5, 2, 6500, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(60, 82, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(61, 83, 1, 2, 5, 2, 6500, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(63, 85, 1, 5, 6, 1, 3500, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(64, 86, 1, 2, 6, 2, 7000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(65, 87, 1, 2, 6, 1, 3500, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(66, 88, 1, 4, 10, 2, 9000, '2', 1, '2021-07-13 20:37:00', 1, '2021-07-13 20:37:00', NULL, NULL),
(67, 89, 1, 4, 10, 2, 9000, '2', 1, '2021-07-13 20:37:00', 1, '2021-07-13 20:37:00', NULL, NULL),
(68, 90, 1, 4, 8, 2, 8000, '2', 1, '2021-07-13 20:37:00', 1, '2021-07-13 20:37:00', NULL, NULL),
(69, 98, 1, 4, 8, 2, 8000, '2', 1, '2021-07-13 20:37:00', 1, '2021-07-13 20:37:00', NULL, NULL),
(70, 91, 1, 1, 4, 2, 6000, '2', 1, '2021-07-13 20:38:02', 1, '2021-07-13 20:38:02', NULL, NULL),
(71, 92, 1, 8, 7, 2, 7500, '2', 1, '2021-07-13 20:33:04', 1, '2021-07-13 20:33:04', NULL, NULL),
(72, 93, 1, 1, 6, 2, 7000, '2', 1, '2021-07-13 20:38:02', 1, '2021-07-13 20:38:02', NULL, NULL),
(74, 94, 1, 1, 3, 2, 5500, '2', 1, '2021-07-13 20:38:02', 1, '2021-07-13 20:38:02', NULL, NULL),
(75, 95, 1, 1, 3, 2, 5500, '2', 1, '2021-07-13 20:38:02', 1, '2021-07-13 20:38:02', NULL, NULL),
(76, 102, 1, 2, 7, 2, 7500, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(77, 103, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:43', 1, '2021-07-13 20:37:43', NULL, NULL),
(78, 104, 1, 2, 6, 2, 7000, '2', 1, '2021-07-13 20:37:44', 1, '2021-07-13 20:37:44', NULL, NULL),
(79, 107, 1, 2, 2, 2, 5000, '2', 1, '2021-07-13 20:37:44', 1, '2021-07-13 20:37:44', NULL, NULL),
(81, 114, 1, 2, 16, 2, 12000, '2', 1, '2021-07-13 20:37:44', 1, '2021-07-13 20:37:44', NULL, NULL),
(82, 115, 1, 5, 12, 2, 10000, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(83, 116, 1, 1, 8, 2, 8000, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(84, 120, 1, 5, 3, 2, 5500, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(85, 121, 1, 1, 1, 2, 4500, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(86, 122, 1, 1, 1, 2, 4500, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(87, 123, 1, 2, 3, 2, 5500, '2', 1, '2021-07-13 20:37:44', 1, '2021-07-13 20:37:44', NULL, NULL),
(88, 124, 1, 1, 1, 1, 2250, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(89, 126, 1, 1, 2, 1, 2500, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(90, 127, 1, 1, 8, 2, 8000, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(91, 130, 1, 8, 8, 2, 8000, '2', 1, '2021-07-13 20:33:04', 1, '2021-07-13 20:33:04', NULL, NULL),
(92, 131, 1, 1, 11, 2, 9500, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(94, 133, 1, 3, 6, 2, 7000, '2', 1, '2021-07-13 20:37:19', 1, '2021-07-13 20:37:19', NULL, NULL),
(95, 134, 1, 1, 6, 2, 7000, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(96, 135, 1, 6, 2, 2, 5000, '2', 1, '2021-07-13 20:35:51', 1, '2021-07-13 20:35:51', NULL, NULL),
(97, 136, 1, 1, 2, 2, 5000, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(99, 149, 1, 1, 8, 2, 8000, '2', 2, '2021-07-13 20:38:04', 1, '2021-07-13 20:38:04', NULL, NULL),
(100, 154, 1, 5, 11, 2, 9500, '2', 2, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(101, 153, 1, 1, 11, 2, 9500, '2', 2, '2021-07-13 20:38:04', 1, '2021-07-13 20:38:04', NULL, NULL),
(102, 145, 1, 1, 10, 1, 4500, '2', 2, '2021-07-13 20:38:04', 1, '2021-07-13 20:38:04', NULL, NULL),
(103, 150, 1, 1, 3, 2, 5500, '2', 2, '2021-07-13 20:38:04', 1, '2021-07-13 20:38:04', NULL, NULL),
(104, 151, 1, 1, 3, 2, 5500, '2', 2, '2021-07-13 20:38:04', 1, '2021-07-13 20:38:04', NULL, NULL),
(105, 152, 1, 2, 3, 2, 5500, '2', 2, '2021-07-13 20:37:44', 1, '2021-07-13 20:37:44', NULL, NULL),
(106, 155, 1, 1, 4, 2, 6000, '2', 2, '2021-07-13 20:38:04', 1, '2021-07-13 20:38:04', NULL, NULL),
(107, 156, 1, 1, 4, 2, 6000, '2', 2, '2021-07-13 20:38:04', 1, '2021-07-13 20:38:04', NULL, NULL),
(108, 96, 1, 5, 3, 2, 5500, '2', 2, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(109, 125, 1, 1, 10, 2, 9000, '2', 2, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(110, 99, 1, 1, 1, 2, 4500, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(111, 108, 1, 1, 6, 2, 7000, '2', 1, '2021-07-13 20:38:03', 1, '2021-07-13 20:38:03', NULL, NULL),
(112, 132, 1, 5, 8, 2, 8000, '2', 1, '2021-07-13 20:36:20', 1, '2021-07-13 20:36:20', NULL, NULL),
(113, 2, 2, 10, 22, 2, 7000, '1', 1, '2021-07-13 20:32:38', NULL, '2021-07-13 20:32:38', NULL, NULL),
(114, 32, 2, 9, 25, 2, 8500, '1', 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(115, 92, 2, 9, 23, 2, 7500, '1', 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(116, 130, 2, 9, 24, 2, 8000, '1', 1, '2021-07-13 20:33:04', NULL, '2021-07-13 20:33:04', NULL, NULL),
(117, 13, 2, 7, 22, 1, 3500, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(118, 18, 2, 7, 24, 1, 4000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(119, 19, 2, 7, 24, 1, 4000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(120, 20, 2, 7, 30, 2, 11000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(121, 21, 2, 7, 18, 2, 5000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(122, 22, 2, 7, 18, 2, 5000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(123, 23, 2, 7, 19, 2, 5500, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(124, 30, 2, 7, 18, 2, 5000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(125, 33, 2, 7, 26, 2, 9000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(126, 135, 2, 7, 18, 2, 5000, '1', 1, '2021-07-13 20:35:51', NULL, '2021-07-13 20:35:51', NULL, NULL),
(127, 24, 2, 6, 22, 2, 7000, '1', 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(128, 25, 2, 6, 22, 2, 7000, '1', 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(129, 27, 2, 6, 18, 2, 5000, '1', 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(130, 28, 2, 6, 18, 2, 5000, '1', 1, '2021-07-13 20:36:19', NULL, '2021-07-13 20:36:19', NULL, NULL),
(131, 29, 2, 6, 26, 2, 9000, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(132, 31, 2, 6, 18, 2, 5000, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(133, 36, 2, 6, 22, 2, 7000, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(134, 37, 2, 6, 19, 2, 5500, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(135, 77, 2, 6, 23, 2, 7500, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(136, 80, 2, 6, 21, 2, 6500, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(137, 85, 2, 6, 22, 1, 3500, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(138, 96, 2, 6, 19, 2, 5500, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(139, 115, 2, 6, 28, 2, 10000, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(140, 120, 2, 6, 19, 2, 5500, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(141, 132, 2, 6, 24, 2, 8000, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(142, 154, 2, 6, 27, 2, 9500, '1', 1, '2021-07-13 20:36:20', NULL, '2021-07-13 20:36:20', NULL, NULL),
(143, 39, 2, 5, 26, 2, 9000, '1', 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(144, 40, 2, 5, 22, 2, 7000, '1', 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(145, 42, 2, 5, 22, 1, 3500, '1', 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(146, 44, 2, 5, 18, 1, 2500, '1', 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(147, 45, 2, 5, 18, 1, 2500, '1', 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(148, 48, 2, 5, 18, 2, 5000, '1', 1, '2021-07-13 20:36:59', NULL, '2021-07-13 20:36:59', NULL, NULL),
(149, 88, 2, 5, 26, 2, 9000, '1', 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(150, 89, 2, 5, 26, 2, 9000, '1', 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(151, 90, 2, 5, 24, 2, 8000, '1', 1, '2021-07-13 20:37:00', NULL, '2021-07-13 20:37:00', NULL, NULL),
(152, 98, 2, 8, 24, 2, 8000, '1', 1, '2021-08-12 19:02:36', 1, '2021-08-12 19:02:36', NULL, NULL),
(153, 49, 2, 4, 24, 1, 4000, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(154, 50, 2, 4, 21, 2, 6500, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(155, 52, 2, 4, 18, 2, 5000, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(156, 53, 2, 4, 19, 2, 5500, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(157, 55, 2, 4, 18, 2, 5000, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(158, 56, 2, 4, 26, 2, 9000, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(159, 58, 2, 4, 19, 2, 5500, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(160, 62, 2, 4, 20, 2, 6000, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(161, 66, 2, 4, 18, 2, 5000, '1', 1, '2021-07-13 20:37:18', NULL, '2021-07-13 20:37:18', NULL, NULL),
(162, 69, 2, 4, 18, 2, 5000, '1', 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(163, 133, 2, 4, 22, 2, 7000, '1', 1, '2021-07-13 20:37:19', NULL, '2021-07-13 20:37:19', NULL, NULL),
(164, 64, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(165, 65, 2, 4, 26, 2, 9000, '1', 1, '2021-08-12 18:19:30', 1, '2021-08-12 18:19:30', NULL, NULL),
(166, 67, 2, 3, 22, 2, 7000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(167, 68, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(168, 70, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(169, 72, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(170, 73, 2, 3, 26, 2, 9000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(171, 74, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(172, 75, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(173, 76, 2, 3, 21, 1, 3250, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(174, 82, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(175, 83, 2, 3, 21, 2, 6500, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(176, 86, 2, 3, 22, 2, 7000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(177, 87, 2, 3, 22, 1, 3500, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(178, 102, 2, 3, 23, 2, 7500, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(179, 103, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:43', NULL, '2021-07-13 20:37:43', NULL, NULL),
(180, 104, 2, 3, 22, 2, 7000, '1', 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(181, 107, 2, 3, 18, 2, 5000, '1', 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(182, 114, 2, 3, 32, 2, 12000, '1', 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(183, 123, 2, 3, 19, 2, 5500, '1', 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(184, 152, 2, 3, 19, 2, 5500, '1', 1, '2021-07-13 20:37:44', NULL, '2021-07-13 20:37:44', NULL, NULL),
(185, 91, 2, 2, 20, 2, 6000, '1', 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(186, 93, 2, 2, 22, 2, 7000, '1', 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(187, 94, 2, 2, 19, 2, 5500, '1', 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(188, 95, 2, 2, 19, 2, 5500, '1', 1, '2021-07-13 20:38:02', NULL, '2021-07-13 20:38:02', NULL, NULL),
(189, 99, 2, 2, 17, 2, 4500, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(190, 108, 2, 2, 22, 2, 7000, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(191, 116, 2, 2, 24, 2, 8000, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(192, 121, 2, 2, 17, 2, 4500, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(193, 122, 2, 2, 17, 2, 4500, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(194, 124, 2, 2, 17, 1, 2250, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(195, 125, 2, 2, 26, 2, 9000, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(196, 126, 2, 2, 18, 1, 2500, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(197, 127, 2, 2, 24, 2, 8000, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(198, 131, 2, 2, 27, 2, 9500, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(199, 134, 2, 2, 22, 2, 7000, '1', 1, '2021-07-13 20:38:03', NULL, '2021-07-13 20:38:03', NULL, NULL),
(200, 136, 2, 2, 18, 2, 5000, '1', 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(201, 145, 2, 2, 26, 1, 4500, '1', 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(202, 149, 2, 2, 24, 2, 8000, '1', 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(203, 150, 2, 2, 19, 2, 5500, '1', 1, '2021-09-02 15:39:47', 1, '2021-09-02 15:39:47', NULL, NULL),
(204, 151, 2, 2, 19, 2, 5500, '1', 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(205, 153, 2, 2, 27, 2, 9500, '1', 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(206, 155, 2, 2, 20, 2, 6000, '1', 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(207, 156, 2, 2, 20, 2, 6000, '1', 1, '2021-07-13 20:38:04', NULL, '2021-07-13 20:38:04', NULL, NULL),
(208, 14, 2, 8, 13, 1, 5250, '1', 1, '2021-07-27 07:51:36', NULL, '2021-07-27 07:51:36', NULL, NULL),
(209, 15, 2, 8, 3, 2, 5500, '1', 1, '2021-08-12 18:48:30', 1, '2021-08-12 18:48:30', NULL, NULL),
(212, 159, 2, 1, 13, 2, 10500, '1', 1, '2021-11-15 11:08:05', NULL, NULL, NULL, NULL),
(213, 160, 2, 1, 12, 2, 10000, '1', 1, '2022-02-07 09:42:06', 1, '2022-02-07 09:42:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_member_id` bigint(20) UNSIGNED NOT NULL,
  `class_grade_id` bigint(20) UNSIGNED NOT NULL,
  `class_stream_id` bigint(20) UNSIGNED NOT NULL,
  `classroom_id` bigint(20) UNSIGNED NOT NULL,
  `class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_teachers`
--

INSERT INTO `subject_teachers` (`id`, `staff_member_id`, `class_grade_id`, `class_stream_id`, `classroom_id`, `class_subject_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 4, 1, 4, 1, 1, '2021-09-09 15:45:54', NULL, '2021-09-09 15:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `temp_staff`
--

CREATE TABLE `temp_staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_member_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_students`
--

CREATE TABLE `temp_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_students`
--

INSERT INTO `temp_students` (`id`, `student_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-02-25 08:19:24', NULL),
(2, 4, 1, '2022-02-25 08:19:27', NULL),
(3, 14, 1, '2022-02-25 08:19:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_statuses`
--

CREATE TABLE `transaction_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originator_conversation_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversation_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversationid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `finalised_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit_party_charges` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit_account_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initiated_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originator_conversationid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_party_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit_party_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_statuses`
--

INSERT INTO `transaction_statuses` (`id`, `result_code`, `result_desc`, `originator_conversation_id`, `conversation_id`, `transaction_id`, `receipt_no`, `conversationid`, `finalised_time`, `amount`, `transaction_status`, `reason_type`, `transaction_reason`, `debit_party_charges`, `debit_account_type`, `initiated_time`, `originator_conversationid`, `credit_party_name`, `debit_party_name`, `created_at`, `updated_at`) VALUES
(1, '0', 'The service request is processed successfully.', '87013-42228644-1', 'AG_20220223_202045b5bc95ffbbd633', 'QBN0000000', 'QBM8LBOVRO', NULL, '20220222235952', '10', 'Completed', 'Pay Bill Online', NULL, NULL, 'MMF Account For Customer', '20220222235952', NULL, '4087119 -   MABE TWINKLING STARS SCHOOL         ', '254714730671 - JOSEPH GITAU', '2022-02-22 23:46:02', '2022-02-22 23:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `transport_fleets`
--

CREATE TABLE `transport_fleets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_fleets`
--

INSERT INTO `transport_fleets` (`id`, `name`, `reg_no`, `slug`, `capacity`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'FLEET1', 'KBV768R', 'fleet1-kbv768r', 10, 1, 1, '2021-05-27 20:28:02', NULL, '2021-05-27 20:28:02', NULL, NULL),
(2, 'FLEET2', 'KBZ127Z', 'fleet2-kbz127z', 29, 1, 1, '2021-05-27 10:30:44', 1, '2021-05-27 20:30:44', NULL, NULL),
(3, 'FLEET3', 'KCX296Z', 'fleet3-kcx296z', 33, 1, 1, '2021-05-27 20:28:56', NULL, '2021-05-27 20:28:56', NULL, NULL),
(4, 'FLEET-01', 'KAA021W', 'fleet-01-kaa021w', 33, 1, 1, '2021-11-10 16:24:24', NULL, '2021-11-10 16:24:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transport_zones`
--

CREATE TABLE `transport_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `areas` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_zones`
--

INSERT INTO `transport_zones` (`id`, `name`, `long_name`, `slug`, `areas`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'ZONE A', 'Zone One', 'zone-one', 'Junction Mall, Mzees', 1, 1, '2021-07-20 21:06:23', 1, '2021-07-20 21:06:23', NULL, NULL),
(2, 'ZONE B', 'Zone Two', 'zone-two', 'Naivas, Equity Bank', 1, 1, '2021-07-20 21:06:51', 1, '2021-07-20 21:06:51', NULL, NULL),
(3, 'ZONE C', 'Zone Three', 'zone-three', 'PCEA, Selait Academy, The Roundabout', 1, 1, '2021-07-20 21:08:04', 1, '2021-07-20 21:08:04', NULL, NULL),
(4, 'ZONE D', 'Zone Four', 'zone-four', 'Mgeni Lodge, Makutano, Muthithi Junction', 1, 1, '2021-07-20 21:08:50', 1, '2021-07-20 21:08:50', NULL, NULL),
(5, 'ZONE E', 'Zone Five', 'zone-five', 'Ngotho Road, Mwanya Market', 1, 1, '2021-07-20 21:10:09', 1, '2021-07-20 21:10:09', NULL, NULL),
(6, 'ZONE F', 'Zone Six', 'zone-six', 'Behind Shell Petrol Station, Kamwene Stage', 1, 1, '2021-07-20 21:12:05', 1, '2021-07-20 21:12:05', NULL, NULL),
(7, 'ZONE G', 'Zone Seven', 'zone-seven', 'White House, Race Course, Maka Heights, Pemwa Flats', 1, 1, '2021-07-20 21:13:09', 1, '2021-07-20 21:13:09', NULL, NULL),
(8, 'ZONE H', 'Zone Eight', 'zone-eight', 'Ndunyu Market, Riruta Satelite, Rubis Filling Station', 1, 1, '2021-07-20 21:15:22', 1, '2021-07-20 21:15:22', NULL, NULL),
(9, 'ZONE I', 'Zone Nine', 'zone-nine', 'Manyatta Road, Munyu Road, Bee Keeping', 1, 1, '2021-07-20 21:15:52', 1, '2021-07-20 21:15:52', NULL, NULL),
(10, 'ZONE J', 'Zone Ten', 'zone-ten', 'St Peters Primary School, Keiya Catholic, Bridge', 1, 1, '2021-07-20 21:20:56', 1, '2021-07-20 21:20:56', NULL, NULL),
(11, 'ZONE K', 'Zone Eleven', 'zone-eleven', 'Mutarakwa, Githima Church, Balze', 1, 1, '2021-07-20 21:23:14', 1, '2021-07-20 21:23:14', NULL, NULL),
(12, 'ZONE L', 'Zone Twelve', 'zone-twelve', 'Centre, Kwa Maiko, Police Station, Wema Children\'s Home', 1, 1, '2021-07-20 21:27:10', 1, '2021-07-20 21:27:10', NULL, NULL),
(13, 'ZONE M', 'Zone Thirteen', 'zone-thirteen', 'Palace Heights, Njema Apartments, Ngando', 1, 1, '2021-07-20 21:32:54', 1, '2021-07-20 21:32:54', NULL, NULL),
(14, 'ZONE N', 'Zone Fourteen', 'zone-fourteen', 'Muharati, Sian Apartments, Cinderalla', 1, 1, '2021-07-20 21:34:07', 1, '2021-07-20 21:34:07', NULL, NULL),
(15, 'ZONE O', 'Zone Fifteen', 'zone-fifteen', 'Kwa Sudd, Riverside, Bome Homes', 1, 1, '2021-07-20 21:27:57', 1, '2021-07-20 21:27:57', NULL, NULL),
(16, 'ZONE P', 'Zone Sixteen', 'zone-sixteen', 'Kwa Ng\'ang\'a, Country Resort, Bus Station', 1, 1, '2021-07-20 21:32:11', 1, '2021-07-20 21:32:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transport_zone_fees`
--

CREATE TABLE `transport_zone_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport_zone_id` bigint(20) UNSIGNED NOT NULL,
  `one_way` int(11) NOT NULL,
  `two_way` int(11) NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_zone_fees`
--

INSERT INTO `transport_zone_fees` (`id`, `slug`, `transport_zone_id`, `one_way`, `two_way`, `current_session_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'zone-a-term-3-2021', 1, 2250, 4500, 1, 1, '2021-05-10 07:23:16', NULL, '2021-05-08 08:13:29'),
(2, 'zone-b-term-3-2021', 2, 2500, 5000, 1, 1, '2021-05-10 07:23:33', NULL, '2021-05-08 08:14:50'),
(3, 'zone-c-term-3-2021', 3, 2750, 5500, 1, 1, '2021-05-10 07:23:51', NULL, '2021-05-08 08:15:14'),
(4, 'zone-d-term-3-2021', 4, 3000, 6000, 1, 1, '2021-05-10 07:24:04', NULL, '2021-05-08 08:15:28'),
(5, 'zone-e-term-3-2021', 5, 3250, 6500, 1, 1, '2021-05-10 07:24:27', NULL, '2021-05-08 08:15:42'),
(6, 'zone-f-term-3-2021', 6, 3500, 7000, 1, 1, '2021-05-10 07:24:46', NULL, '2021-05-08 08:16:05'),
(7, 'zone-g-term-3-2021', 7, 3750, 7500, 1, 1, '2021-05-10 07:25:04', NULL, '2021-05-08 08:16:23'),
(8, 'zone-h-term-3-2021', 8, 4000, 8000, 1, 1, '2021-05-10 07:25:26', NULL, '2021-05-08 08:17:02'),
(9, 'zone-i-term-3-2021', 9, 4250, 8500, 1, 1, '2021-05-10 07:25:42', NULL, '2021-05-08 08:17:20'),
(10, 'zone-j-term-3-2021', 10, 4500, 9000, 1, 1, '2021-05-10 07:25:58', NULL, '2021-05-08 08:17:33'),
(11, 'zone-k-term-3-2021', 11, 4750, 9500, 1, 1, '2021-05-10 07:26:29', NULL, '2021-05-08 08:17:51'),
(12, 'zone-l-term-3-2021', 12, 5000, 10000, 1, 1, '2021-05-10 08:16:31', NULL, '2021-05-10 08:16:31'),
(13, 'zone-m-term-3-2021', 13, 5250, 10500, 1, 1, '2021-05-10 08:17:13', NULL, '2021-05-10 08:17:13'),
(14, 'zone-n-term-3-2021', 14, 5500, 11000, 1, 1, '2021-05-10 08:17:49', NULL, '2021-05-10 08:17:49'),
(15, 'zone-o-term-3-2021', 15, 5750, 11500, 1, 1, '2021-05-10 08:18:26', NULL, '2021-05-10 08:18:26'),
(16, 'zone-p-term-3-2021', 16, 6000, 12000, 1, 1, '2021-05-10 08:18:49', NULL, '2021-05-10 08:18:49'),
(17, 'zone-a-term-1-2021', 1, 2250, 4500, 2, 1, '2021-07-13 07:23:16', NULL, '2021-05-08 08:13:29'),
(18, 'zone-b-term-1-2021', 2, 2500, 5000, 2, 1, '2021-07-13 07:23:33', NULL, '2021-05-08 08:14:50'),
(19, 'zone-c-term-1-2021', 3, 2750, 5500, 2, 1, '2021-07-13 07:23:51', NULL, '2021-05-08 08:15:14'),
(20, 'zone-d-term-1-2021', 4, 3000, 6000, 2, 1, '2021-07-13 07:24:04', NULL, '2021-05-08 08:15:28'),
(21, 'zone-e-term-1-2021', 5, 3250, 6500, 2, 1, '2021-07-13 07:24:27', NULL, '2021-05-08 08:15:42'),
(22, 'zone-f-term-1-2021', 6, 3500, 7000, 2, 1, '2021-07-13 07:24:46', NULL, '2021-05-08 08:16:05'),
(23, 'zone-g-term-1-2021', 7, 3750, 7500, 2, 1, '2021-07-13 07:25:04', NULL, '2021-05-08 08:16:23'),
(24, 'zone-h-term-1-2021', 8, 4000, 8000, 2, 1, '2021-07-13 07:25:26', NULL, '2021-05-08 08:17:02'),
(25, 'zone-i-term-1-2021', 9, 4250, 8500, 2, 1, '2021-07-13 07:25:42', NULL, '2021-05-08 08:17:20'),
(26, 'zone-j-term-1-2021', 10, 4500, 9000, 2, 1, '2021-07-13 07:25:58', NULL, '2021-05-08 08:17:33'),
(27, 'zone-k-term-1-2021', 11, 4750, 9500, 2, 1, '2021-07-13 07:26:29', NULL, '2021-05-08 08:17:51'),
(28, 'zone-l-term-1-2021', 12, 5000, 10000, 2, 1, '2021-07-13 08:16:31', NULL, '2021-05-10 08:16:31'),
(29, 'zone-m-term-1-2021', 13, 5250, 10500, 2, 1, '2021-07-13 08:17:13', NULL, '2021-05-10 08:17:13'),
(30, 'zone-n-term-1-2021', 14, 5500, 11000, 2, 1, '2021-07-13 08:17:49', NULL, '2021-05-10 08:17:49'),
(31, 'zone-o-term-1-2021', 15, 5750, 11500, 2, 1, '2021-07-13 08:18:26', NULL, '2021-05-10 08:18:26'),
(32, 'zone-p-term-1-2021', 16, 6000, 12000, 2, 1, '2021-07-13 08:18:49', NULL, '2021-05-10 08:18:49'),
(33, 'zone-p-term-2-2021', 16, 6000, 12000, 3, 1, '2021-07-13 08:18:49', NULL, NULL),
(34, 'zone-o-term-2-2021', 15, 5750, 11500, 3, 1, '2021-07-13 08:18:26', NULL, NULL),
(35, 'zone-n-term-2-2021', 14, 5500, 11000, 3, 1, '2021-07-13 08:17:49', NULL, NULL),
(36, 'zone-m-term-2-2021', 13, 5250, 10500, 3, 1, '2021-07-13 08:17:13', NULL, NULL),
(37, 'zone-l-term-2-2021', 12, 5000, 10000, 3, 1, '2021-07-13 08:16:31', NULL, NULL),
(38, 'zone-k-term-2-2021', 11, 4750, 9500, 3, 1, '2021-07-13 07:26:29', NULL, NULL),
(39, 'zone-j-term-2-2021', 10, 4500, 9000, 3, 1, '2021-07-13 07:25:58', NULL, '2021-05-08 08:17:33'),
(40, 'zone-i-term-2-2021', 9, 4250, 8500, 3, 1, '2021-07-13 07:25:42', NULL, NULL),
(41, 'zone-h-term-2-2021', 8, 4000, 8000, 3, 1, '2021-07-13 07:25:26', NULL, NULL),
(42, 'zone-g-term-2-2021', 7, 3750, 7500, 3, 1, '2021-07-13 07:25:04', NULL, NULL),
(43, 'zone-f-term-2-2021', 6, 3500, 7000, 3, 1, '2021-07-13 07:24:46', NULL, NULL),
(44, 'zone-e-term-2-2021', 5, 3250, 6500, 3, 1, '2021-07-13 07:24:27', NULL, NULL),
(45, 'zone-d-term-2-2021', 4, 3000, 6000, 3, 1, '2021-07-13 07:24:04', NULL, NULL),
(46, 'zone-c-term-2-2021', 3, 2750, 5500, 3, 1, '2021-07-13 07:23:51', NULL, NULL),
(47, 'zone-b-term-2-2021', 2, 2500, 5000, 3, 1, '2021-07-13 07:23:33', NULL, '0000-00-00 00:00:00'),
(48, 'zone-a-term-2-2021', 1, 2250, 4500, 3, 1, '2021-07-13 07:23:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` int(11) NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_detail_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile`, `position`, `parent_detail_id`, `status`, `remember_token`, `last_login`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Super User', 'admin@schoolbest.co.ke', NULL, '$2y$10$bf3xMo4EQ3tHcklvMsNVb.AfwUEVv7M7ZHbc3I5KrX4AniporrRAC', 1, 'Super Admin', 1, 1, NULL, '2021-12-01 17:19:30', 1, '2021-05-08 07:19:02', NULL, '2022-02-24 17:03:58'),
(2, 'Angeline Marie', 'demo@schoolbest.co.ke', NULL, '$2y$10$bf3xMo4EQ3tHcklvMsNVb.AfwUEVv7M7ZHbc3I5KrX4AniporrRAC', 1, 'Director', 1, 1, NULL, NULL, 1, '2021-05-27 09:46:08', 1, '2022-02-24 17:48:55'),
(3, 'Dummy Parent', 'ssp0001@schoolbest.co.ke', NULL, '$2y$10$Tf7W93qeLFFuQD7Aa6mhROHuOAntqIDZB85Hm/Ms1KWF8q6ibkSrG', 5, 'Parent', 1, 1, NULL, NULL, 1, '2021-07-15 06:54:22', NULL, '2021-07-15 07:11:09'),
(4, 'George Mwangi', 'ssp0010@schoolbest.co.ke', NULL, '$2y$10$t5H7f6UQzuOjnN/ulb4yy.HQFhh1hErDe77MMGrpPW.9.6wKH6cmC', 5, 'Parent', 4, 1, NULL, NULL, 1, '2021-07-15 06:54:22', NULL, '2021-07-15 06:54:22'),
(5, 'Sammy Gachau', 'ssp0011@schoolbest.co.ke', NULL, '$2y$10$uvygxEvDSS4XxdTMNW7GmOH/Z2FoBCEGwML9HrsHdC68GFYXDPnuW', 5, 'Parent', 5, 1, NULL, NULL, 1, '2021-07-15 06:54:22', NULL, '2021-07-15 06:54:22'),
(6, 'Paul Gitau Mwaura', 'ssp0012@schoolbest.co.ke', NULL, '$2y$10$.I2r4WMui6ETVsmHGpZcK.SBN2izvY437EgyEBjJo1fKbwgvwIN4u', 5, 'Parent', 6, 1, NULL, NULL, 1, '2021-07-15 06:54:22', NULL, '2021-07-15 06:54:22'),
(7, 'Peter Wairia', 'ssp0013@schoolbest.co.ke', NULL, '$2y$10$frBXQjyYG6dFLVzcuniyYOFf8XyuYGCbFH2sh1bRhiZTSSPYl4fDO', 5, 'Parent', 7, 1, NULL, NULL, 1, '2021-07-15 06:54:22', NULL, '2021-07-15 06:54:22'),
(8, 'Erastus M.mulungi', 'ssp0014@schoolbest.co.ke', NULL, '$2y$10$1MxCRVMv.TU.fye85ySACeWZiCvPwg6Oddi0F4QvTb2f54XdMe1Ja', 5, 'Parent', 8, 1, NULL, NULL, 1, '2021-07-15 06:54:22', NULL, '2021-07-15 06:54:22'),
(9, 'Benard Kinyanjui Wainaina', 'ssp0015@schoolbest.co.ke', NULL, '$2y$10$6CWmfob0nx2JN5cnGgd4RuEkKkg3S.e8sd07SiPAJHIo6yaQESMo.', 5, 'Parent', 9, 1, NULL, NULL, 1, '2021-07-15 06:54:23', NULL, '2021-07-15 06:54:23'),
(10, 'Antony Gicheru Kung\'u', 'ssp0016@schoolbest.co.ke', NULL, '$2y$10$H9VYheLzHSTbmoQk6GiVmevRf5V9C91cbfCZuYpmSTS5bc142dVXa', 5, 'Parent', 10, 1, NULL, NULL, 1, '2021-07-15 06:54:23', NULL, '2021-07-15 06:54:23'),
(11, 'Benjamin Gathogo Kihara', 'ssp0017@schoolbest.co.ke', NULL, '$2y$10$Zw3yBSWyzR5hYwJpgk5Agem5BiQPagEoupzgTXDc7sCsZedkoZhju', 5, 'Parent', 11, 1, NULL, NULL, 1, '2021-07-15 06:54:23', NULL, '2021-07-15 06:54:23'),
(12, 'Kennedy Kimani Wariua', 'ssp0018@schoolbest.co.ke', NULL, '$2y$10$Sc89ncnvPxAt65b511U.nuUe0YDHPgQ1EFHVkLTgntOwcBusb.f3m', 5, 'Parent', 12, 1, NULL, NULL, 1, '2021-07-15 06:54:23', NULL, '2021-07-15 06:54:23'),
(13, 'John W.njenga', 'ssp0019@schoolbest.co.ke', NULL, '$2y$10$7UgcmX6r6/bHJgTuSXIkBed1jqtkvbdiSLB9rQCu.0iRWhd61tDiq', 5, 'Parent', 13, 1, NULL, NULL, 1, '2021-07-15 06:54:23', NULL, '2021-07-15 06:54:23'),
(14, 'Benard Chege', 'ssp0020@schoolbest.co.ke', NULL, '$2y$10$GSHtxu58BvnwLv1bHMFxguzya6ngZ1lCWYUS7IuPEBJd7XaU571pW', 5, 'Parent', 14, 1, NULL, NULL, 1, '2021-07-15 06:54:23', NULL, '2021-07-15 06:54:23'),
(15, 'Charles Mungai Sairo', 'ssp0021@schoolbest.co.ke', NULL, '$2y$10$kn3lxr399gF5roKuf05JSeutvFxC2ax0yfL3y6Z7Ij7CIjt4V.gfK', 5, 'Parent', 15, 1, NULL, NULL, 1, '2021-07-15 06:54:24', NULL, '2021-07-15 06:54:24'),
(16, 'Thomas Kamau Waweru', 'ssp0022@schoolbest.co.ke', NULL, '$2y$10$C.3jLPtLKk29UgTjx53YMOqImqAqJ.ke/zRpquGOg/r7zKwV1U4h.', 5, 'Parent', 16, 1, NULL, NULL, 1, '2021-07-15 06:54:24', NULL, '2021-07-15 06:54:24'),
(17, 'Orare Alfred Arumba', 'ssp0023@schoolbest.co.ke', NULL, '$2y$10$lMw2gsk3VkLzi0l/MlOYP.0SE2kYw95gLrmw5grmnq61c4R.GG5ie', 5, 'Parent', 17, 1, NULL, NULL, 1, '2021-07-15 06:54:24', NULL, '2021-07-15 06:54:24'),
(18, 'Joyce Wambui', 'ssp0024@schoolbest.co.ke', NULL, '$2y$10$hg4k5Oxo3q5sw7MbuRTVc.H3uzynE2u8vuCst8dqAYTbmmoG864JK', 5, 'Parent', 18, 1, NULL, NULL, 1, '2021-07-15 06:54:24', NULL, '2021-07-15 06:54:24'),
(19, 'Meshack Odhiambo', 'ssp0025@schoolbest.co.ke', NULL, '$2y$10$0BFYiPp6.ohUaEYi1VvfTOyX9GvJawEzsziUe9z3aWV/S59gIExeC', 5, 'Parent', 19, 1, NULL, NULL, 1, '2021-07-15 06:54:24', NULL, '2021-07-15 06:54:24'),
(20, 'Jessica Mirie Wangui', 'ssp0026@schoolbest.co.ke', NULL, '$2y$10$qtI3uCCcQPXzWueBBF9OleKWxfch.F395D5AnQVFTFkKxj5Ihb5Lq', 5, 'Parent', 20, 1, NULL, NULL, 1, '2021-07-15 06:54:24', NULL, '2021-07-15 06:54:24'),
(21, 'Kenneth Wanjohi W.', 'ssp0027@schoolbest.co.ke', NULL, '$2y$10$plzZgFHLlFK8Z4M65GyNS.CKCJlL3ejB6olRmomKHPtgZS6zoZ9N2', 5, 'Parent', 21, 1, NULL, NULL, 1, '2021-07-15 06:54:25', NULL, '2021-07-15 06:54:25'),
(22, 'Simon Ndirangu', 'ssp0028@schoolbest.co.ke', NULL, '$2y$10$XuAxtLqDx470vLLlKFzPbOUQwUOQddqzYBEtnax41pQ01HiaC4yYK', 5, 'Parent', 22, 1, NULL, NULL, 1, '2021-07-15 06:54:25', NULL, '2021-07-15 06:54:25'),
(23, 'Fredrick Thairu Kimani', 'ssp0029@schoolbest.co.ke', NULL, '$2y$10$PR.TaK3Fgs2W4UQwZbHfR.3m2gcQxHx7nM2eRK4uYVk9cNnj7kWtS', 5, 'Parent', 23, 1, NULL, NULL, 1, '2021-07-15 06:54:25', NULL, '2021-07-15 06:54:25'),
(24, 'Benjamin Maundu', 'ssp0030@schoolbest.co.ke', NULL, '$2y$10$1wqu1I7tT81g1vxVGE5piOaFjJHMJe5BJSg5wnZm9/e5Vdi6pjEbG', 5, 'Parent', 24, 1, NULL, NULL, 1, '2021-07-15 06:54:25', NULL, '2021-07-15 06:54:25'),
(25, 'Joseph Kuria Kabi', 'ssp0031@schoolbest.co.ke', NULL, '$2y$10$ZnvEd/AsDBys5gPFARnpcuonkWAkBMVwIqyARajFENV9mKK833RLq', 5, 'Parent', 25, 1, NULL, NULL, 1, '2021-07-15 06:54:25', NULL, '2021-07-15 06:54:25'),
(26, 'Paul Njema', 'ssp0032@schoolbest.co.ke', NULL, '$2y$10$QMJn18aXUtcGQ8.sduqmCOncYeDKUNucUkiC7ZbQ4MljmrVp/36zm', 5, 'Parent', 26, 1, NULL, NULL, 1, '2021-07-15 06:54:25', NULL, '2021-07-15 06:54:25'),
(27, 'Muchiri Patric Kinyua', 'ssp0033@schoolbest.co.ke', NULL, '$2y$10$hwsCwXQ49d6PzU8dhMy1ZeEoQouYwcHPCowVieQICe5Xu5iUS49Gu', 5, 'Parent', 27, 1, NULL, NULL, 1, '2021-07-15 06:54:26', NULL, '2021-07-15 06:54:26'),
(28, 'John Mwangi Kamau', 'ssp0034@schoolbest.co.ke', NULL, '$2y$10$oM79ULfGGgSqMzRJO9xxs.bBy/hjy12FOASjYKieuP2VRE7h72WLK', 5, 'Parent', 28, 1, NULL, NULL, 1, '2021-07-15 06:54:26', NULL, '2021-07-15 06:54:26'),
(29, 'Karithi Dickson', 'ssp0035@schoolbest.co.ke', NULL, '$2y$10$AfcsgS0qCEG7A1MBgIvDluiD6e6NYgYTVxwDdWn68jzLLxcoNlME6', 5, 'Parent', 29, 1, NULL, NULL, 1, '2021-07-15 06:54:26', NULL, '2021-07-15 06:54:26'),
(30, 'John Njoroge', 'ssp0036@schoolbest.co.ke', NULL, '$2y$10$W10GNCSeHOU0Rb/FjTlDguPgYxXYiZmLo.z.UD8yU4Xke4zxRCHaq', 5, 'Parent', 30, 1, NULL, NULL, 1, '2021-07-15 06:54:26', NULL, '2021-07-15 06:54:26'),
(31, 'Gacheru Joseph', 'ssp0037@schoolbest.co.ke', NULL, '$2y$10$4l2Iy1q3MhnrePewBUnVvupHfEIOX8RVjUjY6ZklQVfw1BsMNOP1i', 5, 'Parent', 31, 1, NULL, NULL, 1, '2021-07-15 06:54:26', NULL, '2021-07-15 06:54:26'),
(32, 'Nyamweya Dennis Ongote', 'ssp0038@schoolbest.co.ke', NULL, '$2y$10$gOXc7YWCy4BB2hFN0q7J/OhmM8h.RmvnYH0h86siuCmYeb2mEuhQu', 5, 'Parent', 32, 1, NULL, NULL, 1, '2021-07-15 06:54:27', NULL, '2021-07-15 06:54:27'),
(33, 'Macharia Joseph Maina', 'ssp0039@schoolbest.co.ke', NULL, '$2y$10$VfIorX/l99laeJ0cUDSLtug7Eh2f5XmCGdlnQIt8XmWl5rh9YOHQC', 5, 'Parent', 33, 1, NULL, NULL, 1, '2021-07-15 06:54:27', NULL, '2021-07-15 06:54:27'),
(34, 'Gichohi  Amrose Wachira', 'ssp0040@schoolbest.co.ke', NULL, '$2y$10$HSUz7MpVqvgSk2PFzugS5uRq8vEXoKbj/uBrrNEI3eSVVLMOjct8i', 5, 'Parent', 34, 1, NULL, NULL, 1, '2021-07-15 06:54:27', NULL, '2021-07-15 06:54:27'),
(35, 'Muigai Patrick Ngugi', 'ssp0041@schoolbest.co.ke', NULL, '$2y$10$AyaUKNyJfLa6izTe3CP0LuxeS.p3JHtclWuyjbo5MYoFqOqaRoiwy', 5, 'Parent', 35, 1, NULL, NULL, 1, '2021-07-15 06:54:27', NULL, '2021-07-15 06:54:27'),
(36, 'Chege Kariuki', 'ssp0044@schoolbest.co.ke', NULL, '$2y$10$aY.THXkoaGHtM5CNZcrRYOpQw6sh/2ErjsAGI/R1SQcec9Zxi3AFK', 5, 'Parent', 38, 1, NULL, NULL, 1, '2021-07-15 06:54:27', NULL, '2021-07-15 06:54:27'),
(37, 'Maina Nelson Mwangi', 'ssp0045@schoolbest.co.ke', NULL, '$2y$10$yfq8/duatcJBSN5EWqQ.zuCESKLGcs/SkocZ79hhSu.KNbJuuomTm', 5, 'Parent', 39, 1, NULL, NULL, 1, '2021-07-15 06:54:27', NULL, '2021-07-15 06:54:27'),
(38, 'Ndegwa Zipporah Njoki', 'ssp0046@schoolbest.co.ke', NULL, '$2y$10$ggeRHBFG2KZZP05vh3jl7OLqaCrFaDnuwlSSobyiR.XU9iYbeftQK', 5, 'Parent', 40, 1, NULL, NULL, 1, '2021-07-15 06:54:28', NULL, '2021-07-15 06:54:28'),
(39, 'Erick Otieno', 'ssp0047@schoolbest.co.ke', NULL, '$2y$10$S7uTGqfLgUAO.4B//0r0POnhbDnrfICg5hK2drZm5q4d00t3Trg5e', 5, 'Parent', 41, 1, NULL, NULL, 1, '2021-07-15 06:54:28', NULL, '2021-07-15 06:54:28'),
(40, 'Mwaura Peter ', 'ssp0048@schoolbest.co.ke', NULL, '$2y$10$ki/vYgg8RV6429QYVw8kFuBfm43cJDj7x29Zv2ZswH10RS4HepwKK', 5, 'Parent', 42, 1, NULL, NULL, 1, '2021-07-15 06:54:28', NULL, '2021-07-15 06:54:28'),
(41, 'Gachomo Joshua Waweru', 'ssp0049@schoolbest.co.ke', NULL, '$2y$10$ehImBiG5rHACsrJnQpSUkeeoJ0m1GD25RGjR9SvGvvouocZVAOOdy', 5, 'Parent', 43, 1, NULL, NULL, 1, '2021-07-15 06:54:28', NULL, '2021-07-15 06:54:28'),
(42, 'Mugo Gichunga', 'ssp0051@schoolbest.co.ke', NULL, '$2y$10$4dN97ya1wkaEuZCqdOyawexvbc6ANpwfl48mEcpITHkPSSdbGsJ2q', 5, 'Parent', 45, 1, NULL, NULL, 1, '2021-07-15 06:54:28', NULL, '2021-07-15 06:54:28'),
(43, 'Jumanne Ezekiel Aluoch', 'ssp0052@schoolbest.co.ke', NULL, '$2y$10$IpfnqxEQ6Rzs9ZDZ/ftYlupJyoAM8rh1wn6J5SzXByybLR6xy9maK', 5, 'Parent', 46, 1, NULL, NULL, 1, '2021-07-15 06:54:28', NULL, '2021-07-15 06:54:28'),
(44, 'Ndegwa Peter Kibue', 'ssp0053@schoolbest.co.ke', NULL, '$2y$10$UIGxvlHceGO/m0EvVlU3.uVWfaApqMcngQNP4pZUwjEWOHbfil/RK', 5, 'Parent', 47, 1, NULL, NULL, 1, '2021-07-15 06:54:28', NULL, '2021-07-15 06:54:28'),
(45, 'Muchunu Samuel Mureithi', 'ssp0054@schoolbest.co.ke', NULL, '$2y$10$tpp2VLSVPK1xh6NIz6M0a.z0AVA8JOjtv3JXwHru8nfJVUi8cAuz.', 5, 'Parent', 48, 1, NULL, NULL, 1, '2021-07-15 06:54:29', NULL, '2021-07-15 06:54:29'),
(46, 'Kimetu Robert Waema', 'ssp0055@schoolbest.co.ke', NULL, '$2y$10$4SXMcj95fIhh5XLKPBoPIO/DWjt9CGrcf.xwyrUKYx9L8FKMgV4TC', 5, 'Parent', 49, 1, NULL, NULL, 1, '2021-07-15 06:54:29', NULL, '2021-07-15 06:54:29'),
(47, 'Kamau Francis Kaguru', 'ssp0056@schoolbest.co.ke', NULL, '$2y$10$iGPFmNfQcntoaqOYctxdreRlmMi1FOWLFo.BjmZ1AMOKNIsk1ztJi', 5, 'Parent', 50, 1, NULL, NULL, 1, '2021-07-15 06:54:29', NULL, '2021-07-15 06:54:29'),
(48, 'Kariuki Antony Maina', 'ssp0057@schoolbest.co.ke', NULL, '$2y$10$yL04rv.KhXFkjAD12ZzcmeykBkniCHXbC3pvCVkhGe.UtT3F1oPS2', 5, 'Parent', 51, 1, NULL, NULL, 1, '2021-07-15 06:54:29', NULL, '2021-07-15 06:54:29'),
(49, 'Obara Paul Barrack', 'ssp0058@schoolbest.co.ke', NULL, '$2y$10$NSpNVpw9E26PAn6JtTawburVFgmZdFmVanheTsamrBQqUu5QF50TC', 5, 'Parent', 52, 1, NULL, NULL, 1, '2021-07-15 06:54:29', NULL, '2021-07-15 06:54:29'),
(50, 'Muthuki George Kihuria', 'ssp0059@schoolbest.co.ke', NULL, '$2y$10$whTQjv80LnM66f7RyI1QyOse6GVGiajINReR./nNsLEmJuaYk90wK', 5, 'Parent', 53, 1, NULL, NULL, 1, '2021-07-15 06:54:29', NULL, '2021-07-15 06:54:29'),
(51, 'Kwamwaro Charles Waithaka', 'ssp0060@schoolbest.co.ke', NULL, '$2y$10$mFQHe6iAN4mCkx/ULALIt.eA5FMChvE.3k/XAehrG7aUS7AZ8gexO', 5, 'Parent', 54, 1, NULL, NULL, 1, '2021-07-15 06:54:30', NULL, '2021-07-15 06:54:30'),
(52, 'Muriithi Joseph Kathare', 'ssp0061@schoolbest.co.ke', NULL, '$2y$10$pGyE3nNG3hc8b0NFFSh0k.YDuHKUSpOgxQ2FoAq5Rv9ZmH/iC3bvG', 5, 'Parent', 55, 1, NULL, NULL, 1, '2021-07-15 06:54:30', NULL, '2021-07-15 06:54:30'),
(53, 'Nyongesa Sospeter Masika', 'ssp0062@schoolbest.co.ke', NULL, '$2y$10$9Wv22cs1Ph37d9lSQRvE2uPO1Vk/cpjpzrueOYLwCIaBFSCVEQ0H.', 5, 'Parent', 56, 1, NULL, NULL, 1, '2021-07-15 06:54:30', NULL, '2021-07-15 06:54:30'),
(54, 'Kamau James Mwangi', 'ssp0063@schoolbest.co.ke', NULL, '$2y$10$MaOvqf.8oYoDWbilX88ptuKnWhAJaQlluZOw2yGpxm4zwwY8Cg/Ye', 5, 'Parent', 57, 1, NULL, NULL, 1, '2021-07-15 06:54:30', NULL, '2021-07-15 06:54:30'),
(55, 'Njagi Gerald Karuga', 'ssp0064@schoolbest.co.ke', NULL, '$2y$10$GfEx2wZP1a.GA/DFjIiKfuvRhxomg7xih7eFdrkUi5G5gmRU0P20C', 5, 'Parent', 58, 1, NULL, NULL, 1, '2021-07-15 06:54:30', NULL, '2021-07-15 06:54:30'),
(56, 'Githinji David Getheru', 'ssp0065@schoolbest.co.ke', NULL, '$2y$10$sctF.13jF4OvhL3Vfg5On.oBZTPDWyXQRlm/T9uFbBk5w9eY8aFne', 5, 'Parent', 59, 1, NULL, NULL, 1, '2021-07-15 06:54:30', NULL, '2021-07-15 06:54:30'),
(57, 'Peter Mutwiri', 'ssp0066@schoolbest.co.ke', NULL, '$2y$10$bEvUHWhRcbQfU24jH7G6rulE5iNN7LjGAknrt1Lioo2O9Qkt8RH0y', 5, 'Parent', 60, 1, NULL, NULL, 1, '2021-07-15 06:54:31', NULL, '2021-07-15 06:54:31'),
(58, 'Ngugi James Njuguna', 'ssp0067@schoolbest.co.ke', NULL, '$2y$10$sXZk/nkSiTjTfMz0BIuyl.7L9y.pd5KGQhVGx3/MC84B6i7B8kwF6', 5, 'Parent', 61, 1, NULL, NULL, 1, '2021-07-15 06:54:31', NULL, '2021-07-15 06:54:31'),
(59, 'Muiruri Louis  Murigi', 'ssp0068@schoolbest.co.ke', NULL, '$2y$10$ijItM8Tu4YFxX845c31.Zu.tr2Fxm8htvV2eZbmi.5B21Vqxgbkl2', 5, 'Parent', 62, 1, NULL, NULL, 1, '2021-07-15 06:54:31', NULL, '2021-07-15 06:54:31'),
(60, 'Robert Maina', 'ssp0069@schoolbest.co.ke', NULL, '$2y$10$7HxtJgQ2mjjpuRFC9PML4e0FgGTA7KXNApUrYWi.gu2xUxN9OWtNa', 5, 'Parent', 63, 1, NULL, NULL, 1, '2021-07-15 06:54:31', NULL, '2021-07-15 06:54:31'),
(61, 'Matu Charles Wachira', 'ssp0070@schoolbest.co.ke', NULL, '$2y$10$Z7OItArlks6gO5ziMa.gGu3lQKNGhzQONfDe53aS565X2IWnfMtIu', 5, 'Parent', 64, 1, NULL, NULL, 1, '2021-07-15 06:54:31', NULL, '2021-07-15 06:54:31'),
(62, 'Machuhi John Njenga', 'ssp0071@schoolbest.co.ke', NULL, '$2y$10$HCcLsfMdvUfFNhDPNYAXD.1C3jfF0kxYkblINYP7JKj5.gvfSoBxS', 5, 'Parent', 65, 1, NULL, NULL, 1, '2021-07-15 06:54:31', NULL, '2021-07-15 06:54:31'),
(63, 'Gichimu Willy Kimani', 'ssp0072@schoolbest.co.ke', NULL, '$2y$10$bcCfNkdRy6Q3nafpx9SwUOeEX.P6JUFKpX5TnKGZztReSUYoQwAjy', 5, 'Parent', 66, 1, NULL, NULL, 1, '2021-07-15 06:54:32', NULL, '2021-07-15 06:54:32'),
(64, 'Jane Njoki', 'ssp0074@schoolbest.co.ke', NULL, '$2y$10$gWTS68.A4pbGrCUGyLw9mu8mwHb7k3A0Xr76b8XcHWg8HS9Vl.cya', 5, 'Parent', 68, 1, NULL, NULL, 1, '2021-07-15 06:54:32', NULL, '2021-07-15 06:54:32'),
(65, 'Muhoro James Kamunyo', 'ssp0075@schoolbest.co.ke', NULL, '$2y$10$CUjabV2uKum5qJXZLr/vzOGCwr1g.rW.q6/7fujdMSc0E94NACTj6', 5, 'Parent', 69, 1, NULL, NULL, 1, '2021-07-15 06:54:32', NULL, '2021-07-15 06:54:32'),
(66, 'Kiiru Daniel Karanja', 'ssp0076@schoolbest.co.ke', NULL, '$2y$10$8zgFHbelHtUwl0JUmpwjFumZB.5NxNiE4Tw275sdHL4O3aueWnKZS', 5, 'Parent', 70, 1, NULL, NULL, 1, '2021-07-15 06:54:32', NULL, '2021-07-15 06:54:32'),
(67, 'Moko Faith Njoki', 'ssp0077@schoolbest.co.ke', NULL, '$2y$10$9300ahVhLZLjIBbQZ1MfCeamujmSLmEI7Ey2JA04U.uJ3NGUtnhKW', 5, 'Parent', 71, 1, NULL, NULL, 1, '2021-07-15 06:54:32', NULL, '2021-07-15 06:54:32'),
(68, 'Kariuki Morris', 'ssp0078@schoolbest.co.ke', NULL, '$2y$10$JmfLIHzaKIecGJ/6fHFW/OgrAsTeQnFrVIabJEARaC5ZLmmXmhq0G', 5, 'Parent', 72, 1, NULL, NULL, 1, '2021-07-15 06:54:32', NULL, '2021-07-15 06:54:32'),
(69, 'Mathenge Michael Githae', 'ssp0079@schoolbest.co.ke', NULL, '$2y$10$BN5.b5qOP6FrhMvtzqsXWuFBqNHjhwGaTFrJS5pjBrf94neyIPSFu', 5, 'Parent', 73, 1, NULL, NULL, 1, '2021-07-15 06:54:33', NULL, '2021-07-15 06:54:33'),
(70, 'Gathuku Timothy Kihuria', 'ssp0080@schoolbest.co.ke', NULL, '$2y$10$BmMDmzam1UeSEddIVkbxdOt2Z8XJESu/rDm1sT6A1VedrkzuKy72a', 5, 'Parent', 74, 1, NULL, NULL, 1, '2021-07-15 06:54:33', NULL, '2021-07-15 06:54:33'),
(71, 'Kasienge Joyce Soila', 'ssp0081@schoolbest.co.ke', NULL, '$2y$10$OcJ9Di1wmOX0YZqZyfoxmOci3PhdEaZu2TPVNugkc.yFwF8BcOPGe', 5, 'Parent', 75, 1, NULL, NULL, 1, '2021-07-15 06:54:33', NULL, '2021-07-15 06:54:33'),
(72, 'Kirui Ian Kiptoo', 'ssp0082@schoolbest.co.ke', NULL, '$2y$10$tbJ64TU437Zwnc8CAbSqcOu.Ev3g6urMlXJdBdRylGKAFAMfO4YIS', 5, 'Parent', 76, 1, NULL, NULL, 1, '2021-07-15 06:54:33', NULL, '2021-07-15 06:54:33'),
(73, 'Kamau James Githinji', 'ssp0083@schoolbest.co.ke', NULL, '$2y$10$49occ.bhO7H4JJ42C4.RO.H.99eYwJvan.5RDFNSUnqIvJPZiyxuq', 5, 'Parent', 77, 1, NULL, NULL, 1, '2021-07-15 06:54:33', NULL, '2021-07-15 06:54:33'),
(74, 'Wanyoike Jacob', 'ssp0084@schoolbest.co.ke', NULL, '$2y$10$nV7zvaSVKtAFIHz290eC4eSdgbX9iO49gt712Y3jb2aoOkaEWFQBy', 5, 'Parent', 78, 1, NULL, NULL, 1, '2021-07-15 06:54:33', NULL, '2021-07-15 06:54:33'),
(75, 'Henery Njuguna', 'ssp0085@schoolbest.co.ke', NULL, '$2y$10$E5hPp.3stqBJGEEtccHIO.jr8guUJkEU01KFB3pFujg6lUXmMvBR.', 5, 'Parent', 79, 1, NULL, NULL, 1, '2021-07-15 06:54:34', NULL, '2021-07-15 06:54:34'),
(76, 'Njenga Hilary Kimani', 'ssp0086@schoolbest.co.ke', NULL, '$2y$10$YBvAQxbgiZECcCgFqQfbYecdY2xU0hT9uapmEIpRs7hmXvEsritgi', 5, 'Parent', 80, 1, NULL, NULL, 1, '2021-07-15 06:54:34', NULL, '2021-07-15 06:54:34'),
(77, 'Vincent Komo', 'ssp0087@schoolbest.co.ke', NULL, '$2y$10$giQ0Vty43BayNW.wD7KBKePUTRNhqguycCNBzka3AAuHn72q9U1sO', 5, 'Parent', 81, 1, NULL, NULL, 1, '2021-07-15 06:54:34', NULL, '2021-07-15 06:54:34'),
(78, 'Irungu Julius Kamau', 'ssp0088@schoolbest.co.ke', NULL, '$2y$10$Gw4yhrAauKZAF5UENfdl8.BREMslmyy9Oo2HdErZL728NBDEMVvSi', 5, 'Parent', 82, 1, NULL, NULL, 1, '2021-07-15 06:54:34', NULL, '2021-07-15 06:54:34'),
(79, 'Kinyanjui Joseph Mwangi', 'ssp0089@schoolbest.co.ke', NULL, '$2y$10$cAe.H.ECC.qqQI/8wNpOt.p7q.MyavfLK59qoReAVdLwMIu6GIOo6', 5, 'Parent', 83, 1, NULL, NULL, 1, '2021-07-15 06:54:34', NULL, '2021-07-15 06:54:34'),
(80, 'Kimaru Millicent', 'ssp0090@schoolbest.co.ke', NULL, '$2y$10$CeVeVRE3y7dJHluBp.tBtegM/h4gY94wNMrYAaOkQJB1Y/3st4iQC', 5, 'Parent', 84, 1, NULL, NULL, 1, '2021-07-15 06:54:34', NULL, '2021-07-15 06:54:34'),
(81, 'Christopher Wanjala Wekesa', 'ssp0092@schoolbest.co.ke', NULL, '$2y$10$GxiErk2W0LSfpxsnlrJHu.vezDr0PS969M2tdyR3SBiur/6qmejp6', 5, 'Parent', 86, 1, NULL, NULL, 1, '2021-07-15 06:54:35', NULL, '2021-07-15 06:54:35'),
(82, 'Kihethu Stanley Wambiri', 'ssp0093@schoolbest.co.ke', NULL, '$2y$10$qh5o1eEzl.XEpg90wHdR1u5eiFB0ofsXikLHKmCe0h6D5np6xGwg6', 5, 'Parent', 87, 1, NULL, NULL, 1, '2021-07-15 06:54:35', NULL, '2021-07-15 06:54:35'),
(83, 'Daniel Mwangi', 'ssp0094@schoolbest.co.ke', NULL, '$2y$10$qNGbojiKiuVpiQxvjbHBgOHf85IhxPBfaMxyv2iO8yerRq7amBFOi', 5, 'Parent', 88, 1, NULL, NULL, 1, '2021-07-15 06:54:35', NULL, '2021-07-15 06:54:35'),
(84, 'Okumu Esther Nanjala', 'ssp0095@schoolbest.co.ke', NULL, '$2y$10$jeK1vpUi0gn83cg13gQE5O3mZkb.sKqaIrJHU48LtHzc18ic5d2dC', 5, 'Parent', 89, 1, NULL, NULL, 1, '2021-07-15 06:54:35', NULL, '2021-07-15 06:54:35'),
(85, 'Njeri Moses Mundia', 'ssp0096@schoolbest.co.ke', NULL, '$2y$10$p/cWuEb4vypNUWQN8XANje2EUxmjBuVPJl9c.ntg9cu9.0WPUtOYS', 5, 'Parent', 90, 1, NULL, NULL, 1, '2021-07-15 06:54:35', NULL, '2021-07-15 06:54:35'),
(86, 'Peter Kweri Kamau', 'ssp0097@schoolbest.co.ke', NULL, '$2y$10$oHz3dcUPDBswb3fvVALnHOnmrzI2HxlyyuEdsNy9T20WOcJH4Zw4G', 5, 'Parent', 91, 1, NULL, NULL, 1, '2021-07-15 06:54:35', NULL, '2021-07-15 06:54:35'),
(87, 'Francis Agunda Achoch', 'ssp0098@schoolbest.co.ke', NULL, '$2y$10$cM9Wr4.tBBuEsYhy7ie/fe.y16knkyk7BigrVroh1zK149RQ/IrlG', 5, 'Parent', 92, 1, NULL, NULL, 1, '2021-07-15 06:54:36', NULL, '2021-07-15 06:54:36'),
(88, 'Catherine Njeri', 'ssp0099@schoolbest.co.ke', NULL, '$2y$10$GpNfe2DPGWtd3gYHtAQAf.xLrDvmpRMwFopnxHxPz/0MixxhX/UlS', 5, 'Parent', 93, 1, NULL, NULL, 1, '2021-07-15 06:54:36', NULL, '2021-07-15 06:54:36'),
(89, 'Jais Mukoya', 'ssp0100@schoolbest.co.ke', NULL, '$2y$10$7I7WHFIUTP1wFLxPN7ZXGu8dRgBzMC4cKSOlFftKqpgA2cdrPI7xi', 5, 'Parent', 94, 1, NULL, NULL, 1, '2021-07-15 06:54:36', NULL, '2021-07-15 06:54:36'),
(90, 'Ashundu Edwin Inziani', 'ssp0101@schoolbest.co.ke', NULL, '$2y$10$nnjYsjo9Zwn111Fzt9wUcO74FMgJsCkS5hGmd9ef7RY3APgfflU1m', 5, 'Parent', 95, 1, NULL, NULL, 1, '2021-07-15 06:54:36', NULL, '2021-07-15 06:54:36'),
(91, 'Onyango Edward Clement', 'ssp0102@schoolbest.co.ke', NULL, '$2y$10$QRvGhr10Ue7QZQeAHZKg/uBokz5wdkalooVKE7L4AbHiocjGOOUDW', 5, 'Parent', 96, 1, NULL, NULL, 1, '2021-07-15 06:54:36', NULL, '2021-07-15 06:54:36'),
(92, 'Ngugi Stephen Karumbi', 'ssp0103@schoolbest.co.ke', NULL, '$2y$10$rJmGT6iBU9U/i1jhudPU9.Nyc38MlftphLf.s6IteKNWS5oH/aSh.', 5, 'Parent', 97, 1, NULL, NULL, 1, '2021-07-15 06:54:36', NULL, '2021-07-15 06:54:36'),
(93, 'Macharia Michael Nderitu', 'ssp0104@schoolbest.co.ke', NULL, '$2y$10$tzSTmeKC2f5oGFeBwO9wzuEXb/z7t/GecLdEbxqcrxiyvxM5lPCKq', 5, 'Parent', 98, 1, NULL, NULL, 1, '2021-07-15 06:54:37', NULL, '2021-07-15 06:54:37'),
(94, 'Nyabuti Felix Ongaga', 'ssp0105@schoolbest.co.ke', NULL, '$2y$10$v9pWH7C9cFGBeb2nSTjFuer7dYWKikkj8SA25ZXuOTucSDcxRm1hS', 5, 'Parent', 99, 1, NULL, NULL, 1, '2021-07-15 06:54:37', NULL, '2021-07-15 06:54:37'),
(95, 'Vivian Ndiritu', 'ssp0106@schoolbest.co.ke', NULL, '$2y$10$zYTkYar/GrbFSpIz7kUkT.T5Y7jABXAuCVlkVaIY8LjNqLBfz.Jeq', 5, 'Parent', 100, 1, NULL, NULL, 1, '2021-07-15 06:54:37', NULL, '2021-07-15 06:54:37'),
(96, 'James Ndegwa', 'ssp0107@schoolbest.co.ke', NULL, '$2y$10$EW.6/pCscSp8fjb3pn6LEeqPoDlJ3xbV.wwTKrkiE0uaXcWx9z1Bq', 5, 'Parent', 101, 1, NULL, NULL, 1, '2021-07-15 06:54:37', NULL, '2021-07-15 06:54:37'),
(97, 'Kamau Samuel Mwaniki', 'ssp0108@schoolbest.co.ke', NULL, '$2y$10$vCoM8pLVG1NwCs1qCTQm..mQTFLGVfo8fhV195QqvUUtIxhZxMOnS', 5, 'Parent', 102, 1, NULL, NULL, 1, '2021-07-15 06:54:37', NULL, '2021-07-15 06:54:37'),
(98, 'Mugo Mwangi Richard', 'ssp0110@schoolbest.co.ke', NULL, '$2y$10$05wmptxEdSOMUSrzFM3Ake2lJb0qg.4jwa9GcMYoJ75bvLlffVtje', 5, 'Parent', 104, 1, NULL, NULL, 1, '2021-07-15 06:54:37', NULL, '2021-07-15 06:54:37'),
(99, 'Kinyanjui Njoroge Andrew', 'ssp0111@schoolbest.co.ke', NULL, '$2y$10$K6pSxHLNEZ5vHzK5It4Muu7yIw5hukCQh591kIx5DjVgyyvtjklR.', 5, 'Parent', 105, 1, NULL, NULL, 1, '2021-07-15 06:54:38', NULL, '2021-07-15 06:54:38'),
(100, 'Njoroge Patrick Maina', 'ssp0112@schoolbest.co.ke', NULL, '$2y$10$ApcR88YB1h/rqRSj1S3eTePJKK.Mqjm1CcBS8VOKu9nvmRC4NXHfK', 5, 'Parent', 106, 1, NULL, NULL, 1, '2021-07-15 06:54:38', NULL, '2021-07-15 06:54:38'),
(101, 'Githui Julius Ngatia', 'ssp0113@schoolbest.co.ke', NULL, '$2y$10$04RMe5GG1auRjkCwd73ZkOJJbXau872dXKndBGVABFqPxqBYHS1Z.', 5, 'Parent', 107, 1, NULL, NULL, 1, '2021-07-15 06:54:38', NULL, '2021-07-15 06:54:38'),
(102, 'Kiramba Samuel Karani', 'ssp0114@schoolbest.co.ke', NULL, '$2y$10$gd9.jPOa3WEjEzGCcg3UQ.bnvB.fb0.zfsBKK6uGCPkjVz50WL2I6', 5, 'Parent', 108, 1, NULL, NULL, 1, '2021-07-15 06:54:38', NULL, '2021-07-15 06:54:38'),
(103, 'Karanu Sammy Kuria', 'ssp0115@schoolbest.co.ke', NULL, '$2y$10$7hmTadK5Ow3AU4bWFI0iZOi9Mp.KMmtA3Qe7KWMXOGQ0Ir9rqV5Yq', 5, 'Parent', 109, 1, NULL, NULL, 1, '2021-07-15 06:54:38', NULL, '2021-07-15 06:54:38'),
(104, 'Gitonga  Timothy Mutuma', 'ssp0116@schoolbest.co.ke', NULL, '$2y$10$zPryxGm8Oosb2YG8i3j3G.mPCCLgwuBDg5XFt9zsJbD23VVYGaO4W', 5, 'Parent', 110, 1, NULL, NULL, 1, '2021-07-15 06:54:38', NULL, '2021-07-15 06:54:38'),
(105, 'Muigai John Murihia', 'ssp0117@schoolbest.co.ke', NULL, '$2y$10$zAx6aNLnnynNnnCwRd1NoO/V9GeeyqD7/hadgWQLgq6mNy/U1gqAi', 5, 'Parent', 111, 1, NULL, NULL, 1, '2021-07-15 06:54:39', NULL, '2021-07-15 06:54:39'),
(106, 'Ng\'ang\'a Robert  Wathumbu', 'ssp0118@schoolbest.co.ke', NULL, '$2y$10$jA67orxETRsQ/QYq1evOa.0nU3umcAt58yrIzSL28SsYJtU2.0lXy', 5, 'Parent', 112, 1, NULL, NULL, 1, '2021-07-15 06:54:39', NULL, '2021-07-15 06:54:39'),
(107, 'Henry Mwaura', 'ssp0119@schoolbest.co.ke', NULL, '$2y$10$FGfpKvgmbpWai2PFW8QqjuJyKgRE/MtkFQBD0DYb.VuktTO6ety2.', 5, 'Parent', 113, 1, NULL, NULL, 1, '2021-07-15 06:54:39', NULL, '2021-07-15 06:54:39'),
(108, 'Mwambura Anthony', 'ssp0121@schoolbest.co.ke', NULL, '$2y$10$cB249ah.p3VGw.9fXioCkugaZvA//iY0bX2pIrT04gUmUS9tqYOK.', 5, 'Parent', 115, 1, NULL, NULL, 1, '2021-07-15 06:54:39', NULL, '2021-07-15 06:54:39'),
(109, 'Stella Wangechi Mwangi', 'ssp0122@schoolbest.co.ke', NULL, '$2y$10$TH61d.uYltknk4Z/XkKwf.TRfosM6g58/EhAd5BsS4YITQbYSE56u', 5, 'Parent', 116, 1, NULL, NULL, 1, '2021-07-15 06:54:39', NULL, '2021-07-15 06:54:39'),
(110, 'Charles Kamwaro  Waithaka', 'ssp0123@schoolbest.co.ke', NULL, '$2y$10$JeAewfiPFluqBBBYIqt/e./oQ5fN0xB4MSWWzlFEmvysQAkZ77op.', 5, 'Parent', 121, 1, NULL, NULL, 1, '2021-07-15 06:54:39', NULL, '2021-07-15 06:54:39'),
(111, 'Charles Thuo Waruiru', 'ssp0124@schoolbest.co.ke', NULL, '$2y$10$0nYnMm4r9yKG0x3hB3u2b.5dJb.h3YL6I0UuY4fKsvYdN54uzSxVq', 5, 'Parent', 122, 1, NULL, NULL, 1, '2021-07-15 06:54:40', NULL, '2021-07-15 06:54:40'),
(112, 'Sharlene Waruiru Nduta', 'ssp0125@schoolbest.co.ke', NULL, '$2y$10$1ECbFR85DyBEddX/NCPTJu/yFjC3If99Ot1uGqS5lxJB4dSHK/XPC', 5, 'Parent', 123, 1, NULL, NULL, 1, '2021-07-15 06:54:40', NULL, '2021-07-15 06:54:40'),
(113, 'Judy Wairimu Njoroge', 'ssp0126@schoolbest.co.ke', NULL, '$2y$10$v3qh1Bu5kNCnwJX8raHqcuAtR7e6o4Pp1RgvjGikAXAKp4DBAQhQ.', 5, 'Parent', 124, 1, NULL, NULL, 1, '2021-07-15 06:54:40', NULL, '2021-07-15 06:54:40'),
(114, 'Lydia Wanjiru Mwangi', 'ssp0127@schoolbest.co.ke', NULL, '$2y$10$WCB4rq59qIIdGzD/pwdVs./YhE2jWUz6nStRnQ/aFNsvKj9etSQPG', 5, 'Parent', 125, 1, NULL, NULL, 1, '2021-07-15 06:54:40', NULL, '2021-07-15 06:54:40'),
(115, 'Grace Wangui Kagai', 'ssp0128@schoolbest.co.ke', NULL, '$2y$10$80UswjQqbbcnPPNMEr9JHOR/wyt3hG7fyrVDWax9gmF19sMJy7MYG', 5, 'Parent', 126, 1, NULL, NULL, 1, '2021-07-15 06:54:40', NULL, '2021-07-15 06:54:40'),
(116, 'Ayub Osman Hassan', 'ssp0129@schoolbest.co.ke', NULL, '$2y$10$XGRTnkOktIKatZEO4HWBRu3mJMicuP.djP7NyWnSQh2rQG6R1jJxe', 5, 'Parent', 127, 1, NULL, NULL, 1, '2021-07-15 06:54:40', NULL, '2021-07-15 06:54:40'),
(117, 'Micheal Mutua Wambua', 'ssp0130@schoolbest.co.ke', NULL, '$2y$10$VFrXTY1HlIB97WrAg2A.CutzLDju5tBUw8P3JZ68YqSbKFdrMjp2C', 5, 'Parent', 128, 1, NULL, NULL, 1, '2021-07-15 06:54:41', NULL, '2021-07-15 06:54:41'),
(118, 'Eustace Kiarii Gacanja', 'ssp0131@schoolbest.co.ke', NULL, '$2y$10$URaqOolX0uRW021yFiIAy.vaNeIYcorYhP9j4tBsVXZgciyiW1DKK', 5, 'Parent', 129, 1, NULL, NULL, 1, '2021-07-15 06:54:41', NULL, '2021-07-15 06:54:41'),
(119, 'James Kungu Nganga', 'ssp0132@schoolbest.co.ke', NULL, '$2y$10$ibtrYaStCFAzEJDpsoezyez4pl1WQTyFg3p81osjG6pq/gLKDKxlO', 5, 'Parent', 130, 1, NULL, NULL, 1, '2021-07-15 06:54:41', NULL, '2021-07-15 06:54:41'),
(120, 'Timothy N.k Wanjau', 'ssp0133@schoolbest.co.ke', NULL, '$2y$10$zeSBeBOyoRaUV9zfS7dmC.ep8/a3Mu42u1Ycr2L8qqPmG/gDWNPXO', 5, 'Parent', 131, 1, NULL, NULL, 1, '2021-07-15 06:54:41', NULL, '2021-07-15 06:54:41'),
(121, 'Micheal Gitahi', 'ssp0134@schoolbest.co.ke', NULL, '$2y$10$gwXSGXV0WKbjwN18o1wLzurG.o.ox.BCD5D1VzvEUN03CzF3okgPm', 5, 'Parent', 132, 1, NULL, NULL, 1, '2021-07-15 06:54:41', NULL, '2021-07-15 06:54:41'),
(122, 'Muchika Joseph', 'ssp0135@schoolbest.co.ke', NULL, '$2y$10$5zxPNnj.N/3K1GCnLttq0.nBlHdpQFeS7FHvZyb0ie08IUyDQ5kUe', 5, 'Parent', 133, 1, NULL, NULL, 1, '2021-07-15 06:54:41', NULL, '2021-07-15 06:54:41'),
(123, 'Raphael Njuguna Nduati', 'ssp0136@schoolbest.co.ke', NULL, '$2y$10$eYDCisETiaFLFoZ9o5XpgOpJtHRKhXRXiSQHuDSAARNIwv9eKrqSi', 5, 'Parent', 134, 1, NULL, NULL, 1, '2021-07-15 06:54:42', NULL, '2021-07-15 06:54:42'),
(126, 'Michael Nduati Kimani', 'sbp0122@schoolbest.co.ke', NULL, '$2y$10$MdnOSQ7EMdfqLHR/QhmMB.M7nzGJBeT85rAczhy01CXmNYd2A3/r2', 5, 'Parent', 137, 1, NULL, NULL, 1, '2021-11-15 10:34:56', NULL, NULL),
(127, 'Alex Muchene', 'sbp0123@schoolbest.co.ke', NULL, '$2y$10$vKzFjRFbuiQEpKL4p2lcg.JYKPUoisEsnx3mtwxuxBH/W9jnGEaeK', 5, 'Parent', 138, 1, NULL, NULL, 1, '2021-12-01 08:21:34', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_subjects`
--
ALTER TABLE `academic_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_subjects_name_unique` (`name`),
  ADD UNIQUE KEY `academic_subjects_code_unique` (`code`);

--
-- Indexes for table `academic_terms`
--
ALTER TABLE `academic_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_terms_name_unique` (`name`),
  ADD UNIQUE KEY `academic_terms_long_name_unique` (`long_name`),
  ADD UNIQUE KEY `academic_terms_slug_unique` (`slug`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banks_slug_unique` (`slug`),
  ADD UNIQUE KEY `banks_account_no_unique` (`account_no`);

--
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classrooms_name_unique` (`name`),
  ADD UNIQUE KEY `classrooms_long_name_unique` (`long_name`),
  ADD UNIQUE KEY `classrooms_slug_unique` (`slug`),
  ADD KEY `classrooms_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `classrooms_class_stream_id_foreign` (`class_stream_id`);

--
-- Indexes for table `class_fees`
--
ALTER TABLE `class_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_fees_slug_unique` (`slug`),
  ADD KEY `class_fees_current_session_id_foreign` (`current_session_id`),
  ADD KEY `class_fees_fee_parameter_id_foreign` (`fee_parameter_id`),
  ADD KEY `class_fees_class_grade_id_foreign` (`class_grade_id`);

--
-- Indexes for table `class_grades`
--
ALTER TABLE `class_grades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_grades_name_unique` (`name`),
  ADD UNIQUE KEY `class_grades_long_name_unique` (`long_name`),
  ADD UNIQUE KEY `class_grades_slug_unique` (`slug`);

--
-- Indexes for table `class_managers`
--
ALTER TABLE `class_managers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_managers_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `class_managers_class_stream_id_foreign` (`class_stream_id`),
  ADD KEY `class_managers_classroom_id_foreign` (`classroom_id`),
  ADD KEY `class_managers_staff_member_id_foreign` (`staff_member_id`);

--
-- Indexes for table `class_streams`
--
ALTER TABLE `class_streams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_streams_name_unique` (`name`),
  ADD UNIQUE KEY `class_streams_long_name_unique` (`long_name`),
  ADD UNIQUE KEY `class_streams_slug_unique` (`slug`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_subjects_name_unique` (`name`),
  ADD KEY `class_subjects_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `class_subjects_academic_subject_id_foreign` (`academic_subject_id`);

--
-- Indexes for table `client_connections`
--
ALTER TABLE `client_connections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `client_connections_connectionid_unique` (`connectionID`),
  ADD UNIQUE KEY `client_connections_connectionpassword_unique` (`connectionPassword`);

--
-- Indexes for table `coop_outboxes`
--
ALTER TABLE `coop_outboxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coop_outboxes_coop_payment_id_foreign` (`coop_payment_id`);

--
-- Indexes for table `coop_payments`
--
ALTER TABLE `coop_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactionReferenceCode` (`transactionReferenceCode`),
  ADD KEY `coop_payments_student_id_foreign` (`student_id`),
  ADD KEY `coop_payments_current_session_id_foreign` (`current_session_id`);

--
-- Indexes for table `current_sessions`
--
ALTER TABLE `current_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `current_sessions_slug_unique` (`slug`),
  ADD UNIQUE KEY `current_sessions_name_unique` (`name`),
  ADD KEY `current_sessions_financial_year_id_foreign` (`financial_year_id`),
  ADD KEY `current_sessions_academic_term_id_foreign` (`academic_term_id`);

--
-- Indexes for table `discount_levels`
--
ALTER TABLE `discount_levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discount_levels_name_unique` (`name`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expenses_slug_unique` (`slug`),
  ADD KEY `expenses_expense_department_id_foreign` (`expense_department_id`),
  ADD KEY `expenses_expense_section_id_foreign` (`expense_section_id`),
  ADD KEY `expenses_transport_fleet_id_foreign` (`transport_fleet_id`),
  ADD KEY `expenses_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `expense_departments`
--
ALTER TABLE `expense_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_sections`
--
ALTER TABLE `expense_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_sections_expense_department_id_foreign` (`expense_department_id`);

--
-- Indexes for table `fee_discounts`
--
ALTER TABLE `fee_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_discounts_student_id_foreign` (`student_id`),
  ADD KEY `fee_discounts_current_session_id_foreign` (`current_session_id`),
  ADD KEY `fee_discounts_class_grade_id_foreign` (`class_grade_id`);

--
-- Indexes for table `fee_parameters`
--
ALTER TABLE `fee_parameters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_parameters_name_unique` (`name`),
  ADD UNIQUE KEY `fee_parameters_description_unique` (`description`),
  ADD UNIQUE KEY `fee_parameters_slug_unique` (`slug`);

--
-- Indexes for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_payments_receipt_no_unique` (`receipt_no`),
  ADD UNIQUE KEY `fee_payments_ref_no_unique` (`ref_no`),
  ADD KEY `fee_payments_parent_detail_id_foreign` (`parent_detail_id`),
  ADD KEY `fee_payments_student_id_foreign` (`student_id`),
  ADD KEY `fee_payments_current_session_id_foreign` (`current_session_id`),
  ADD KEY `fee_payments_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `fee_payments_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `financial_years`
--
ALTER TABLE `financial_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `financial_years_name_unique` (`name`),
  ADD UNIQUE KEY `financial_years_long_name_unique` (`long_name`),
  ADD UNIQUE KEY `financial_years_slug_unique` (`slug`);

--
-- Indexes for table `gen_students`
--
ALTER TABLE `gen_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gen_students_student_id_unique` (`student_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `message_outboxes`
--
ALTER TABLE `message_outboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpesa_outboxes`
--
ALTER TABLE `mpesa_outboxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpesa_outboxes_mpesa_payment_id_foreign` (`mpesa_payment_id`);

--
-- Indexes for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mpesa_payments_student_id_foreign` (`student_id`),
  ADD KEY `mpesa_payments_current_session_id_foreign` (`current_session_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_foreign` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `one_time_fees`
--
ALTER TABLE `one_time_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `one_time_fees_slug_unique` (`slug`),
  ADD KEY `one_time_fees_current_session_id_foreign` (`current_session_id`),
  ADD KEY `one_time_fees_fee_parameter_id_foreign` (`fee_parameter_id`);

--
-- Indexes for table `optional_fees`
--
ALTER TABLE `optional_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `optional_fees_slug_unique` (`slug`),
  ADD KEY `optional_fees_current_session_id_foreign` (`current_session_id`),
  ADD KEY `optional_fees_fee_parameter_id_foreign` (`fee_parameter_id`);

--
-- Indexes for table `original_messages`
--
ALTER TABLE `original_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `original_messages_slug_unique` (`slug`);

--
-- Indexes for table `parent_details`
--
ALTER TABLE `parent_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_details_slug_unique` (`slug`),
  ADD UNIQUE KEY `parent_details_parent_no_unique` (`parent_no`),
  ADD UNIQUE KEY `parent_details_credential_email_unique` (`id`),
  ADD UNIQUE KEY `credential_email` (`credential_email`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payroll_parameters`
--
ALTER TABLE `payroll_parameters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_parameters_name_unique` (`name`);

--
-- Indexes for table `promotion_histories`
--
ALTER TABLE `promotion_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_histories_class_from_foreign` (`class_from`),
  ADD KEY `promotion_histories_class_to_foreign` (`class_to`),
  ADD KEY `promotion_histories_from_session_id_foreign` (`from_session_id`),
  ADD KEY `promotion_histories_to_session_id_foreign` (`to_session_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_profiles`
--
ALTER TABLE `school_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_departments`
--
ALTER TABLE `staff_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_members`
--
ALTER TABLE `staff_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_members_slug_unique` (`slug`),
  ADD UNIQUE KEY `staff_members_member_no_unique` (`member_no`),
  ADD UNIQUE KEY `staff_members_idno_unique` (`idno`),
  ADD KEY `staff_members_staff_department_id_foreign` (`staff_department_id`),
  ADD KEY `staff_members_staff_section_id_foreign` (`staff_section_id`);

--
-- Indexes for table `staff_sections`
--
ALTER TABLE `staff_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_sections_name_unique` (`name`),
  ADD KEY `staff_sections_staff_department_id_foreign` (`staff_department_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_slug_unique` (`slug`),
  ADD UNIQUE KEY `students_admno_unique` (`admno`),
  ADD KEY `students_parent_detail_id_foreign` (`parent_detail_id`),
  ADD KEY `students_classroom_id_foreign` (`classroom_id`),
  ADD KEY `students_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `students_class_stream_id_foreign` (`class_stream_id`),
  ADD KEY `students_discount_level_id_foreign` (`discount_level_id`),
  ADD KEY `students_transport_zone_id_foreign` (`transport_zone_id`),
  ADD KEY `students_current_session_id_foreign` (`current_session_id`),
  ADD KEY `students_transport_fleet_id_foreign` (`transport_fleet_id`);

--
-- Indexes for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_fees_student_id_foreign` (`student_id`),
  ADD KEY `student_fees_current_session_id_foreign` (`current_session_id`),
  ADD KEY `student_fees_fee_parameter_id_foreign` (`fee_parameter_id`),
  ADD KEY `student_fees_class_grade_id_foreign` (`class_grade_id`);

--
-- Indexes for table `student_promotions`
--
ALTER TABLE `student_promotions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_promotions_promotion_history_id_foreign` (`promotion_history_id`),
  ADD KEY `student_promotions_student_id_foreign` (`student_id`),
  ADD KEY `student_promotions_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `student_promotions_current_session_id_foreign` (`current_session_id`);

--
-- Indexes for table `student_timelines`
--
ALTER TABLE `student_timelines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_timelines_student_id_foreign` (`student_id`),
  ADD KEY `student_timelines_current_session_id_foreign` (`current_session_id`),
  ADD KEY `student_timelines_class_grade_id_foreign` (`class_grade_id`);

--
-- Indexes for table `student_transports`
--
ALTER TABLE `student_transports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_transports_student_id_foreign` (`student_id`),
  ADD KEY `student_transports_current_session_id_foreign` (`current_session_id`),
  ADD KEY `student_transports_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `student_transports_transport_zone_fee_id_foreign` (`transport_zone_fee_id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_teachers_staff_member_id_foreign` (`staff_member_id`),
  ADD KEY `subject_teachers_class_grade_id_foreign` (`class_grade_id`),
  ADD KEY `subject_teachers_class_stream_id_foreign` (`class_stream_id`),
  ADD KEY `subject_teachers_classroom_id_foreign` (`classroom_id`),
  ADD KEY `subject_teachers_class_subject_id_foreign` (`class_subject_id`);

--
-- Indexes for table `temp_staff`
--
ALTER TABLE `temp_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temp_staff_staff_member_id_foreign` (`staff_member_id`);

--
-- Indexes for table `temp_students`
--
ALTER TABLE `temp_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `temp_students_student_id_unique` (`student_id`);

--
-- Indexes for table `transaction_statuses`
--
ALTER TABLE `transaction_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transport_fleets`
--
ALTER TABLE `transport_fleets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transport_fleets_name_unique` (`name`),
  ADD UNIQUE KEY `transport_fleets_reg_no_unique` (`reg_no`),
  ADD UNIQUE KEY `transport_fleets_slug_unique` (`slug`);

--
-- Indexes for table `transport_zones`
--
ALTER TABLE `transport_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transport_zones_name_unique` (`name`),
  ADD UNIQUE KEY `transport_zones_long_name_unique` (`long_name`),
  ADD UNIQUE KEY `transport_zones_slug_unique` (`slug`);

--
-- Indexes for table `transport_zone_fees`
--
ALTER TABLE `transport_zone_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transport_zone_fees_slug_unique` (`slug`),
  ADD KEY `transport_zone_fees_transport_zone_id_foreign` (`transport_zone_id`),
  ADD KEY `transport_zone_fees_current_session_id_foreign` (`current_session_id`);

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
-- AUTO_INCREMENT for table `academic_subjects`
--
ALTER TABLE `academic_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `academic_terms`
--
ALTER TABLE `academic_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `class_fees`
--
ALTER TABLE `class_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `class_grades`
--
ALTER TABLE `class_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `class_managers`
--
ALTER TABLE `class_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_streams`
--
ALTER TABLE `class_streams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_connections`
--
ALTER TABLE `client_connections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coop_outboxes`
--
ALTER TABLE `coop_outboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coop_payments`
--
ALTER TABLE `coop_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `current_sessions`
--
ALTER TABLE `current_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discount_levels`
--
ALTER TABLE `discount_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `expense_departments`
--
ALTER TABLE `expense_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expense_sections`
--
ALTER TABLE `expense_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `fee_discounts`
--
ALTER TABLE `fee_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `fee_parameters`
--
ALTER TABLE `fee_parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `fee_payments`
--
ALTER TABLE `fee_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `financial_years`
--
ALTER TABLE `financial_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gen_students`
--
ALTER TABLE `gen_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_outboxes`
--
ALTER TABLE `message_outboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=758;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `mpesa_outboxes`
--
ALTER TABLE `mpesa_outboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `one_time_fees`
--
ALTER TABLE `one_time_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `optional_fees`
--
ALTER TABLE `optional_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `original_messages`
--
ALTER TABLE `original_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `parent_details`
--
ALTER TABLE `parent_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `payroll_parameters`
--
ALTER TABLE `payroll_parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promotion_histories`
--
ALTER TABLE `promotion_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=757;

--
-- AUTO_INCREMENT for table `school_profiles`
--
ALTER TABLE `school_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_departments`
--
ALTER TABLE `staff_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_members`
--
ALTER TABLE `staff_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_sections`
--
ALTER TABLE `staff_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1294;

--
-- AUTO_INCREMENT for table `student_promotions`
--
ALTER TABLE `student_promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `student_timelines`
--
ALTER TABLE `student_timelines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT for table `student_transports`
--
ALTER TABLE `student_transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `temp_staff`
--
ALTER TABLE `temp_staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_students`
--
ALTER TABLE `temp_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_statuses`
--
ALTER TABLE `transaction_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transport_fleets`
--
ALTER TABLE `transport_fleets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transport_zones`
--
ALTER TABLE `transport_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `transport_zone_fees`
--
ALTER TABLE `transport_zone_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `classrooms_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classrooms_class_stream_id_foreign` FOREIGN KEY (`class_stream_id`) REFERENCES `class_streams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_fees`
--
ALTER TABLE `class_fees`
  ADD CONSTRAINT `class_fees_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_fees_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_fees_fee_parameter_id_foreign` FOREIGN KEY (`fee_parameter_id`) REFERENCES `fee_parameters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class_managers`
--
ALTER TABLE `class_managers`
  ADD CONSTRAINT `class_managers_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_managers_class_stream_id_foreign` FOREIGN KEY (`class_stream_id`) REFERENCES `class_streams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_managers_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_managers_staff_member_id_foreign` FOREIGN KEY (`staff_member_id`) REFERENCES `staff_members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD CONSTRAINT `class_subjects_academic_subject_id_foreign` FOREIGN KEY (`academic_subject_id`) REFERENCES `academic_subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_subjects_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coop_outboxes`
--
ALTER TABLE `coop_outboxes`
  ADD CONSTRAINT `coop_outboxes_coop_payment_id_foreign` FOREIGN KEY (`coop_payment_id`) REFERENCES `coop_payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coop_payments`
--
ALTER TABLE `coop_payments`
  ADD CONSTRAINT `coop_payments_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`),
  ADD CONSTRAINT `coop_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `current_sessions`
--
ALTER TABLE `current_sessions`
  ADD CONSTRAINT `current_sessions_academic_term_id_foreign` FOREIGN KEY (`academic_term_id`) REFERENCES `academic_terms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `current_sessions_financial_year_id_foreign` FOREIGN KEY (`financial_year_id`) REFERENCES `financial_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_expense_department_id_foreign` FOREIGN KEY (`expense_department_id`) REFERENCES `expense_departments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_expense_section_id_foreign` FOREIGN KEY (`expense_section_id`) REFERENCES `expense_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `expenses_transport_fleet_id_foreign` FOREIGN KEY (`transport_fleet_id`) REFERENCES `transport_fleets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_sections`
--
ALTER TABLE `expense_sections`
  ADD CONSTRAINT `expense_sections_expense_department_id_foreign` FOREIGN KEY (`expense_department_id`) REFERENCES `expense_departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_discounts`
--
ALTER TABLE `fee_discounts`
  ADD CONSTRAINT `fee_discounts_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_discounts_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_discounts_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_payments`
--
ALTER TABLE `fee_payments`
  ADD CONSTRAINT `fee_payments_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`),
  ADD CONSTRAINT `fee_payments_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_payments_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_payments_parent_detail_id_foreign` FOREIGN KEY (`parent_detail_id`) REFERENCES `parent_details` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fee_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gen_students`
--
ALTER TABLE `gen_students`
  ADD CONSTRAINT `gen_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpesa_outboxes`
--
ALTER TABLE `mpesa_outboxes`
  ADD CONSTRAINT `mpesa_outboxes_mpesa_payment_id_foreign` FOREIGN KEY (`mpesa_payment_id`) REFERENCES `mpesa_payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  ADD CONSTRAINT `mpesa_payments_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mpesa_payments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD CONSTRAINT `oauth_clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `one_time_fees`
--
ALTER TABLE `one_time_fees`
  ADD CONSTRAINT `one_time_fees_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `one_time_fees_fee_parameter_id_foreign` FOREIGN KEY (`fee_parameter_id`) REFERENCES `fee_parameters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `optional_fees`
--
ALTER TABLE `optional_fees`
  ADD CONSTRAINT `optional_fees_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `optional_fees_fee_parameter_id_foreign` FOREIGN KEY (`fee_parameter_id`) REFERENCES `fee_parameters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `promotion_histories`
--
ALTER TABLE `promotion_histories`
  ADD CONSTRAINT `promotion_histories_class_from_foreign` FOREIGN KEY (`class_from`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promotion_histories_class_to_foreign` FOREIGN KEY (`class_to`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promotion_histories_from_session_id_foreign` FOREIGN KEY (`from_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `promotion_histories_to_session_id_foreign` FOREIGN KEY (`to_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff_members`
--
ALTER TABLE `staff_members`
  ADD CONSTRAINT `staff_members_staff_department_id_foreign` FOREIGN KEY (`staff_department_id`) REFERENCES `staff_departments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_members_staff_section_id_foreign` FOREIGN KEY (`staff_section_id`) REFERENCES `staff_sections` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `staff_sections`
--
ALTER TABLE `staff_sections`
  ADD CONSTRAINT `staff_sections_staff_department_id_foreign` FOREIGN KEY (`staff_department_id`) REFERENCES `staff_departments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`),
  ADD CONSTRAINT `students_class_stream_id_foreign` FOREIGN KEY (`class_stream_id`) REFERENCES `class_streams` (`id`),
  ADD CONSTRAINT `students_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`),
  ADD CONSTRAINT `students_discount_level_id_foreign` FOREIGN KEY (`discount_level_id`) REFERENCES `discount_levels` (`id`),
  ADD CONSTRAINT `students_parent_detail_id_foreign` FOREIGN KEY (`parent_detail_id`) REFERENCES `parent_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_fees`
--
ALTER TABLE `student_fees`
  ADD CONSTRAINT `student_fees_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_fee_parameter_id_foreign` FOREIGN KEY (`fee_parameter_id`) REFERENCES `fee_parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_promotions`
--
ALTER TABLE `student_promotions`
  ADD CONSTRAINT `student_promotions_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_promotions_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_promotions_promotion_history_id_foreign` FOREIGN KEY (`promotion_history_id`) REFERENCES `promotion_histories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_promotions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_timelines`
--
ALTER TABLE `student_timelines`
  ADD CONSTRAINT `student_timelines_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_timelines_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_timelines_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_transports`
--
ALTER TABLE `student_transports`
  ADD CONSTRAINT `student_transports_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_transports_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_transports_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_transports_transport_zone_fee_id_foreign` FOREIGN KEY (`transport_zone_fee_id`) REFERENCES `transport_zone_fees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD CONSTRAINT `subject_teachers_class_grade_id_foreign` FOREIGN KEY (`class_grade_id`) REFERENCES `class_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_teachers_class_stream_id_foreign` FOREIGN KEY (`class_stream_id`) REFERENCES `class_streams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_teachers_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_teachers_classroom_id_foreign` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subject_teachers_staff_member_id_foreign` FOREIGN KEY (`staff_member_id`) REFERENCES `staff_members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_staff`
--
ALTER TABLE `temp_staff`
  ADD CONSTRAINT `temp_staff_staff_member_id_foreign` FOREIGN KEY (`staff_member_id`) REFERENCES `staff_members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_students`
--
ALTER TABLE `temp_students`
  ADD CONSTRAINT `temp_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transport_zone_fees`
--
ALTER TABLE `transport_zone_fees`
  ADD CONSTRAINT `transport_zone_fees_current_session_id_foreign` FOREIGN KEY (`current_session_id`) REFERENCES `current_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transport_zone_fees_transport_zone_id_foreign` FOREIGN KEY (`transport_zone_id`) REFERENCES `transport_zones` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
