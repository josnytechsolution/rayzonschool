-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 10:32 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rayzon`
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `academic_terms`
--

CREATE TABLE `academic_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `slug`, `name`, `long_name`, `branch`, `account_name`, `account_no`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'kenya-commercial-bank-1234876655', 'KCB', 'Kenya Commercial Bank', 'Kitale', 'Rayzon Schools', '1234876655', 1, 1, '2022-03-25 17:37:21', NULL, '2022-03-25 17:37:21', NULL, NULL),
(2, 'kcb-paybill-number-27643kpupil-name-without-space', 'KCB PAYBILL', 'KCB Paybill Number', '522522', 'Rayzon Schools', '27643K(Pupil name without space)', 1, 1, '2022-03-25 17:39:39', NULL, '2022-03-25 17:39:39', NULL, NULL),
(3, 'safaricom-lipa-na-mpesa-paybill-adm-no', 'LIPA NA MPESA', 'Safaricom Lipa Na Mpesa Paybill', '522123', 'Rayzon Schools', 'adm_no', 1, 1, '2022-03-25 17:40:41', NULL, '2022-03-25 17:40:41', NULL, NULL);

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
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`id`, `name`, `long_name`, `slug`, `class_grade_id`, `class_stream_id`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'PG-PINK', 'Play Group Pink', 'play-group-pink', 1, 1, 1, 1, '2022-03-25 16:23:38', NULL, '2022-03-25 16:23:38'),
(2, 'PP1-PINK', 'Pre-Primary One Pink', 'pre-primary-one-pink', 2, 1, 1, 1, '2022-03-25 16:24:06', NULL, '2022-03-25 16:24:06'),
(3, 'PP2-PINK', 'Pre-Primary Two Pink', 'pre-primary-two-pink', 3, 1, 1, 1, '2022-03-25 16:24:56', NULL, '2022-03-25 16:24:56'),
(4, 'GRD1-PINK', 'Grade One Pink', 'grade-one-pink', 4, 1, 1, 1, '2022-03-25 16:26:16', NULL, '2022-03-25 16:26:16'),
(5, 'GRD2-PINK', 'Grade Two Pink', 'grade-two-pink', 5, 1, 1, 1, '2022-03-25 16:26:51', NULL, '2022-03-25 16:26:51'),
(6, 'GRD3-PINK', 'Grade Three Pink', 'grade-three-pink', 6, 1, 1, 1, '2022-03-25 16:27:40', NULL, '2022-03-25 16:27:40'),
(7, 'GRD4-PINK', 'Grade Four Pink', 'grade-four-pink', 7, 1, 1, 1, '2022-03-25 16:28:13', NULL, '2022-03-25 16:28:13'),
(8, 'GRD5-PINK', 'Grade Five Pink', 'grade-five-pink', 8, 1, 1, 1, '2022-03-25 16:28:51', NULL, '2022-03-25 16:28:51'),
(9, 'GRD6-PINK', 'Grade Six Pink', 'grade-six-pink', 9, 1, 1, 1, '2022-03-25 16:29:27', NULL, '2022-03-25 16:29:27'),
(10, 'GRD7-PINK', 'Grade Seven Pink', 'grade-seven-pink', 10, 1, 1, 1, '2022-03-25 16:30:33', NULL, '2022-03-25 16:30:33'),
(11, 'GRD8-PINK', 'Grade Eight Pink', 'grade-eight-pink', 11, 1, 1, 1, '2022-03-25 16:31:40', NULL, '2022-03-25 16:31:40');

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
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_fees`
--

INSERT INTO `class_fees` (`id`, `slug`, `current_session_id`, `fee_parameter_id`, `class_grade_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '1-1-1', 1, 1, 1, 10000, 1, 1, '2022-03-25 17:47:13', NULL, NULL, NULL, NULL),
(2, '1-2-1', 1, 2, 1, 1500, 1, 1, '2022-03-25 17:47:13', NULL, NULL, NULL, NULL),
(3, '1-3-1', 1, 3, 1, 6000, 1, 1, '2022-03-25 17:47:14', NULL, NULL, NULL, NULL),
(4, '1-4-1', 1, 4, 1, 1500, 1, 1, '2022-03-25 17:47:14', NULL, NULL, NULL, NULL),
(5, '1-7-1', 1, 7, 1, 1200, 1, 1, '2022-03-25 17:47:14', NULL, NULL, NULL, NULL),
(6, '1-8-1', 1, 8, 1, 1500, 1, 1, '2022-03-25 17:47:14', NULL, NULL, NULL, NULL),
(7, '1-9-1', 1, 9, 1, 2000, 1, 1, '2022-03-25 17:47:14', NULL, NULL, NULL, NULL),
(8, '1-1-2', 1, 1, 2, 12500, 1, 1, '2022-03-26 08:01:40', NULL, NULL, NULL, NULL),
(9, '1-2-2', 1, 2, 2, 1500, 1, 1, '2022-03-26 08:01:40', NULL, NULL, NULL, NULL),
(10, '1-3-2', 1, 3, 2, 6000, 1, 1, '2022-03-26 08:01:40', NULL, NULL, NULL, NULL),
(11, '1-4-2', 1, 4, 2, 1500, 1, 1, '2022-03-26 08:01:40', NULL, NULL, NULL, NULL),
(12, '1-8-2', 1, 8, 2, 2500, 1, 1, '2022-03-26 08:01:40', NULL, NULL, NULL, NULL),
(13, '1-9-2', 1, 9, 2, 2700, 1, 1, '2022-03-26 08:01:40', NULL, NULL, NULL, NULL),
(14, '1-1-3', 1, 1, 3, 12500, 1, 1, '2022-03-26 08:03:13', NULL, NULL, NULL, NULL),
(15, '1-2-3', 1, 2, 3, 1500, 1, 1, '2022-03-26 08:03:13', NULL, NULL, NULL, NULL),
(16, '1-3-3', 1, 3, 3, 6000, 1, 1, '2022-03-26 08:03:13', NULL, NULL, NULL, NULL),
(17, '1-4-3', 1, 4, 3, 1500, 1, 1, '2022-03-26 08:03:13', NULL, NULL, NULL, NULL),
(18, '1-8-3', 1, 8, 3, 2500, 1, 1, '2022-03-26 08:03:13', NULL, NULL, NULL, NULL),
(19, '1-9-3', 1, 9, 3, 2700, 1, 1, '2022-03-26 08:03:13', NULL, NULL, NULL, NULL),
(20, '1-1-4', 1, 1, 4, 12500, 1, 1, '2022-03-26 08:07:07', NULL, NULL, NULL, NULL),
(21, '1-2-4', 1, 2, 4, 1500, 1, 1, '2022-03-26 08:07:07', NULL, NULL, NULL, NULL),
(22, '1-3-4', 1, 3, 4, 6000, 1, 1, '2022-03-26 08:07:07', NULL, NULL, NULL, NULL),
(23, '1-4-4', 1, 4, 4, 2000, 1, 1, '2022-03-26 08:07:07', NULL, NULL, NULL, NULL),
(24, '1-8-4', 1, 8, 4, 2500, 1, 1, '2022-03-26 08:07:07', NULL, NULL, NULL, NULL),
(25, '1-9-4', 1, 9, 4, 2700, 1, 1, '2022-03-26 08:07:07', NULL, NULL, NULL, NULL),
(26, '1-1-5', 1, 1, 5, 12500, 1, 1, '2022-03-26 08:08:30', NULL, NULL, NULL, NULL),
(27, '1-2-5', 1, 2, 5, 1500, 1, 1, '2022-03-26 08:08:30', NULL, NULL, NULL, NULL),
(28, '1-3-5', 1, 3, 5, 6000, 1, 1, '2022-03-26 08:08:30', NULL, NULL, NULL, NULL),
(29, '1-4-5', 1, 4, 5, 2000, 1, 1, '2022-03-26 08:08:30', NULL, NULL, NULL, NULL),
(30, '1-8-5', 1, 8, 5, 2500, 1, 1, '2022-03-26 08:08:30', NULL, NULL, NULL, NULL),
(31, '1-9-5', 1, 9, 5, 2700, 1, 1, '2022-03-26 08:08:30', NULL, NULL, NULL, NULL),
(32, '1-1-6', 1, 1, 6, 12500, 1, 1, '2022-03-26 08:09:08', NULL, NULL, NULL, NULL),
(33, '1-2-6', 1, 2, 6, 1500, 1, 1, '2022-03-26 08:09:08', NULL, NULL, NULL, NULL),
(34, '1-3-6', 1, 3, 6, 6000, 1, 1, '2022-03-26 08:09:08', NULL, NULL, NULL, NULL),
(35, '1-4-6', 1, 4, 6, 2000, 1, 1, '2022-03-26 08:09:09', NULL, NULL, NULL, NULL),
(36, '1-8-6', 1, 8, 6, 2500, 1, 1, '2022-03-26 08:09:09', NULL, NULL, NULL, NULL),
(37, '1-9-6', 1, 9, 6, 2700, 1, 1, '2022-03-26 08:09:09', NULL, NULL, NULL, NULL),
(38, '1-1-7', 1, 1, 7, 12500, 1, 1, '2022-03-26 08:09:42', NULL, NULL, NULL, NULL),
(39, '1-2-7', 1, 2, 7, 1500, 1, 1, '2022-03-26 08:09:42', NULL, NULL, NULL, NULL),
(40, '1-3-7', 1, 3, 7, 6000, 1, 1, '2022-03-26 08:09:42', NULL, NULL, NULL, NULL),
(41, '1-4-7', 1, 4, 7, 2000, 1, 1, '2022-03-26 08:09:42', NULL, NULL, NULL, NULL),
(42, '1-8-7', 1, 8, 7, 2500, 1, 1, '2022-03-26 08:09:42', NULL, NULL, NULL, NULL),
(43, '1-9-7', 1, 9, 7, 2700, 1, 1, '2022-03-26 08:09:42', NULL, NULL, NULL, NULL),
(44, '1-1-8', 1, 1, 8, 12500, 1, 1, '2022-03-26 08:10:09', NULL, NULL, NULL, NULL),
(45, '1-2-8', 1, 2, 8, 1500, 1, 1, '2022-03-26 08:10:09', NULL, NULL, NULL, NULL),
(46, '1-3-8', 1, 3, 8, 6000, 1, 1, '2022-03-26 08:10:09', NULL, NULL, NULL, NULL),
(47, '1-4-8', 1, 4, 8, 2000, 1, 1, '2022-03-26 08:10:09', NULL, NULL, NULL, NULL),
(48, '1-8-8', 1, 8, 8, 2500, 1, 1, '2022-03-26 08:10:09', NULL, NULL, NULL, NULL),
(49, '1-9-8', 1, 9, 8, 2700, 1, 1, '2022-03-26 08:10:09', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_grades`
--

CREATE TABLE `class_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_grades`
--

INSERT INTO `class_grades` (`id`, `name`, `long_name`, `slug`, `level`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'PLAY GROUP', 'Play Group Class', 'play-group-class', 1, 1, 1, '2021-05-08 08:42:14', 1, '2021-05-08 08:42:14', NULL, NULL),
(2, 'PP1', 'Pre-Primary One', 'pre-primary-one', 2, 1, 1, '2021-05-08 08:41:36', NULL, '2021-05-08 08:41:36', NULL, NULL),
(3, 'PP2', 'Pre-Primary Two', 'pre-primary-two', 3, 1, 1, '2021-05-08 08:42:00', NULL, '2021-05-08 08:42:00', NULL, NULL),
(4, 'GRADE 1', 'Grade One', 'grade-one', 4, 1, 1, '2021-05-08 08:42:50', NULL, '2021-05-08 08:42:50', NULL, NULL),
(5, 'GRADE 2', 'Grade Two', 'grade-two', 5, 1, 1, '2021-05-08 08:43:10', NULL, '2021-05-08 08:43:10', NULL, NULL),
(6, 'GRADE 3', 'Grade Three', 'grade-three', 6, 1, 1, '2021-05-08 08:43:28', NULL, '2021-05-08 08:43:28', NULL, NULL),
(7, 'GRADE 4', 'Grade Four', 'grade-four', 7, 1, 1, '2021-05-08 08:43:46', NULL, '2021-05-08 08:43:46', NULL, NULL),
(8, 'GRADE 5', 'Grade Five', 'grade-five', 8, 1, 1, '2021-05-08 08:44:18', NULL, '2021-05-08 08:44:18', NULL, NULL),
(9, 'GRADE 6', 'Grade Six', 'grade-six', 9, 1, 1, '2021-05-08 08:44:32', NULL, '2021-05-08 08:44:32', NULL, NULL),
(10, 'GRADE 7', 'Grade Seven', 'grade-seven', 10, 1, 1, '2021-05-08 08:44:51', NULL, '2021-05-08 08:44:51', NULL, NULL),
(11, 'GRADE 8', 'Grade Eight', 'grade-eight', 11, 1, 1, '2021-05-08 08:45:16', NULL, '2021-05-08 08:45:16', NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_streams`
--

CREATE TABLE `class_streams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_streams`
--

INSERT INTO `class_streams` (`id`, `name`, `long_name`, `slug`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'PINK', 'House Pink', 'house-pink', 1, 1, '2022-03-25 16:23:04', NULL, '2022-03-25 16:23:04');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `status` int(11) NOT NULL DEFAULT 3,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `current_sessions`
--

INSERT INTO `current_sessions` (`id`, `slug`, `name`, `financial_year_id`, `academic_term_id`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'term-1-2022', 'TERM-1-2022', 1, 1, 2, 1, '2022-03-25 16:21:29', NULL, NULL),
(2, 'term-2-2022', 'TERM-2-2022', 1, 2, 3, 1, '2022-03-25 16:21:44', NULL, '2022-03-25 16:21:44'),
(3, 'term-3-2022', 'TERM-3-2022', 1, 3, 3, 1, '2022-03-25 16:21:56', NULL, '2022-03-25 16:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `discount_levels`
--

CREATE TABLE `discount_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_levels`
--

INSERT INTO `discount_levels` (`id`, `name`, `type`, `discount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'Normal', 'fixed', 0, 1, 1, '2022-03-26 13:20:04', NULL, '2022-03-26 13:20:04', NULL, NULL),
(2, 'Missionary', 'fixed', 12000, 1, 1, '2022-03-26 13:20:20', NULL, '2022-03-26 13:20:20', NULL, NULL),
(3, 'Scholarship', 'fixed', 17000, 1, 1, '2022-03-26 13:20:42', NULL, '2022-03-26 13:20:42', NULL, NULL),
(4, 'Staff', 'fixed', 10000, 1, 1, '2022-03-26 13:21:06', NULL, '2022-03-26 13:21:06', NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_departments`
--

CREATE TABLE `expense_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_sections`
--

CREATE TABLE `expense_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_department_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_discounts`
--

INSERT INTO `fee_discounts` (`id`, `student_id`, `current_session_id`, `class_grade_id`, `name`, `description`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 8, 1, 8, 'Scholarship', 'Scholarship Discount', 17000, 1, 1, '2022-03-28 06:35:30', NULL, NULL, NULL, NULL),
(2, 9, 1, 8, 'Staff', 'Staff Discount', 10000, 1, 1, '2022-03-28 06:40:18', NULL, NULL, NULL, NULL),
(3, 51, 1, 5, 'Scholarship', 'Scholarship Discount', 17000, 1, 1, '2022-03-28 14:54:04', NULL, NULL, NULL, NULL),
(4, 88, 1, 4, 'Staff', 'Staff Discount', 10000, 1, 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(5, 89, 1, 4, 'Staff', 'Staff Discount', 10000, 1, 1, '2022-03-28 21:50:28', NULL, NULL, NULL, NULL),
(6, 98, 1, 3, 'Scholarship', 'Scholarship Discount', 17000, 1, 1, '2022-03-28 22:41:10', NULL, NULL, NULL, NULL),
(7, 99, 1, 3, 'Missionary', 'Missionary Discount', 12000, 1, 1, '2022-03-28 22:45:53', NULL, NULL, NULL, NULL),
(8, 108, 1, 3, 'Scholarship', 'Scholarship Discount', 17000, 1, 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL);

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
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_parameters`
--

INSERT INTO `fee_parameters` (`id`, `name`, `description`, `slug`, `type`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'TUITION FEE', 'Tuition Fee', 'tuition-fee', 'main_fee', 1, 1, '2022-03-26 07:43:34', NULL, '2022-03-25 17:23:55', NULL, NULL),
(2, 'DEVELOPMENT FEE', 'Development Fee', 'development-fee', NULL, 1, 1, '2022-03-25 17:24:14', NULL, '2022-03-25 17:24:14', NULL, NULL),
(3, 'LUNCH', 'Lunch Fee', 'lunch', NULL, 1, 1, '2022-03-25 17:24:32', NULL, '2022-03-25 17:24:32', NULL, NULL),
(4, 'SNACK', 'Snack', 'snack', NULL, 1, 1, '2022-03-25 17:25:09', NULL, '2022-03-25 17:25:09', NULL, NULL),
(5, 'CAUTION FEE', 'Caution Fee', 'caution-fee', NULL, 1, 1, '2022-03-25 17:25:36', NULL, '2022-03-25 17:25:36', NULL, NULL),
(6, 'REGISTRATION FEE', 'Registration Fee', 'registration-fee', NULL, 1, 1, '2022-03-25 17:26:08', NULL, '2022-03-25 17:26:08', NULL, NULL),
(7, 'MONTESSORI MATERIALS', 'Montessori Materials', 'montessori-materials', NULL, 1, 1, '2022-03-25 17:26:36', NULL, '2022-03-25 17:26:36', NULL, NULL),
(8, 'EXERCISE BOOKS', 'Exercise Books', 'exercise-books', NULL, 1, 1, '2022-03-25 17:26:56', NULL, '2022-03-25 17:26:56', NULL, NULL),
(9, 'EXAM FEES', 'Exam Fees', 'exam-fees', NULL, 1, 1, '2022-03-25 17:27:08', NULL, '2022-03-25 17:27:08', NULL, NULL),
(10, 'ASSESSMENT FEE', 'Assessment Fee', 'assessment-fee', NULL, 1, 1, '2022-03-25 17:27:34', NULL, '2022-03-25 17:27:34', NULL, NULL),
(11, 'PARENTING CONFERENCE', 'Parenting Conference', 'parenting-conference', NULL, 1, 1, '2022-03-25 17:27:59', NULL, '2022-03-25 17:27:59', NULL, NULL),
(12, 'CHESS', 'Chess', 'chess', NULL, 1, 1, '2022-03-25 17:28:46', NULL, '2022-03-25 17:28:46', NULL, NULL),
(13, 'SWIMMING', 'Swimming Lessons', 'swimming', NULL, 1, 1, '2022-03-25 17:28:57', NULL, '2022-03-25 17:28:57', NULL, NULL),
(14, 'BALLET', 'Ballet Lessons', 'ballet', NULL, 1, 1, '2022-03-25 17:29:07', NULL, '2022-03-25 17:29:07', NULL, NULL),
(15, 'MUSIC', 'Music Lessons', 'music', NULL, 1, 1, '2022-03-25 17:29:20', NULL, '2022-03-25 17:29:20', NULL, NULL),
(16, 'GOLF', 'Golf Lessons', 'golf', NULL, 1, 1, '2022-03-25 17:29:31', NULL, '2022-03-25 17:29:31', NULL, NULL),
(17, 'SATURDAY ACTIVITIES', 'Robotics, Soccer, Tae Kwon Do, Skating, Drama', 'saturday-activities', NULL, 1, 1, '2022-03-25 17:30:37', NULL, '2022-03-25 17:30:37', NULL, NULL),
(18, 'BALANCE B/F', 'Last Term Balance', 'balance-bf', 'balance_bf', 1, 1, '2022-03-26 07:43:46', NULL, '2022-03-26 07:42:11', NULL, NULL),
(19, 'UNIFORM', 'School Uniform', 'uniform', NULL, 1, 1, '2022-03-29 20:27:26', NULL, '2022-03-29 20:27:26', NULL, NULL);

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
  `expected` int(11) NOT NULL DEFAULT 0,
  `fees` int(11) NOT NULL DEFAULT 0,
  `arrears` int(11) NOT NULL DEFAULT 0,
  `paid` int(11) NOT NULL DEFAULT 0,
  `balance` int(11) NOT NULL DEFAULT 0,
  `pay_date` date NOT NULL,
  `slip_date` date NOT NULL,
  `bank_id` bigint(20) UNSIGNED NOT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `print` int(11) NOT NULL DEFAULT 0,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `financial_years`
--

CREATE TABLE `financial_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_years`
--

INSERT INTO `financial_years` (`id`, `name`, `long_name`, `slug`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '2022', '2022', '2022', 1, 1, '2022-03-25 16:18:27', NULL, NULL, NULL, NULL),
(2, '2023', '2023', '2023', 1, 1, '2022-03-25 16:20:38', NULL, '2022-03-25 16:20:38', NULL, NULL),
(3, '2024', '2024', '2024', 1, 1, '2022-03-25 16:20:47', NULL, '2022-03-25 16:20:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gen_students`
--

CREATE TABLE `gen_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_payments`
--

CREATE TABLE `mpesa_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `transTime` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transAmount` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `businessShortCode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billRefNumber` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoiceNumber` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orgAccountBalance` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thirdPartyTransID` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MSISDN` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middleName` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transID` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactionType` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
('4c1cc48427b244e3a6e2db82565f9ec7', 1, 'User Two', '6c7f80e8e1b04c7eb2f4591a7a2ea75b', 'http://dev.schoolbest.co.ke/v1/this-url', 1, 0, 0, '2021-11-03 06:52:03', NULL);

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
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `one_time_fees`
--

INSERT INTO `one_time_fees` (`id`, `slug`, `current_session_id`, `fee_parameter_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '1-6-2500', 1, 6, 2500, 1, 1, '2022-03-25 17:32:58', NULL, '2022-03-25 17:32:58', NULL, NULL),
(2, '1-5-3000', 1, 5, 3000, 1, 1, '2022-03-25 17:33:17', NULL, '2022-03-25 17:33:17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `optional_fees`
--

CREATE TABLE `optional_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `fee_parameter_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `optional_fees`
--

INSERT INTO `optional_fees` (`id`, `slug`, `current_session_id`, `fee_parameter_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, '1-12-3000', 1, 12, 3000, 1, 1, '2022-03-25 17:33:57', NULL, '2022-03-25 17:33:57', NULL, NULL),
(2, '1-13-2600', 1, 13, 2600, 1, 1, '2022-03-25 17:34:12', NULL, '2022-03-25 17:34:12', NULL, NULL),
(3, '1-14-3500', 1, 14, 3500, 1, 1, '2022-03-25 17:34:30', NULL, '2022-03-25 17:34:30', NULL, NULL),
(4, '1-15-3500', 1, 15, 3500, 1, 1, '2022-03-25 17:35:01', NULL, '2022-03-25 17:35:01', NULL, NULL),
(5, '1-16-3500', 1, 16, 3500, 1, 1, '2022-03-25 17:35:20', NULL, '2022-03-25 17:35:20', NULL, NULL),
(6, '1-17-5500', 1, 17, 5500, 1, 1, '2022-03-25 17:35:39', NULL, '2022-03-25 17:35:39', NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_details`
--

INSERT INTO `parent_details` (`id`, `slug`, `parent_no`, `primary_contact`, `secondary_contact`, `primary_email`, `fname`, `fcontact`, `femail`, `foccupation`, `mname`, `mcontact`, `memail`, `moccupation`, `gname`, `gcontact`, `gemail`, `grelation`, `credential_email`, `credential_password`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'kxatp-ua15g-xrrcx-u9jqr-dinqo-4rkd', 'RYP0001', '0721936817', NULL, NULL, 'Dummy Father', '0721639817', NULL, NULL, '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'sbp0001@schoolbest.co.ke', '47576400', 1, 1, '2022-03-26 15:02:37', NULL, '2022-03-26 15:02:37', NULL, NULL),
(2, 'smhzb-i6xok-fcose-jsfna-ki4eu-cpla-20220328092802', 'RYP0002', '0721890904', '0722822535', 'takiso@yahoo.com', 'Humphrey Tabu', '0722822535', NULL, 'Pharmaceutical Technologist', 'Annete Akiso', '0721890904', 'takiso@yahoo.com', NULL, '', NULL, NULL, NULL, 'ryp0002@rayzonschools.com', '99141169', 1, 1, '2022-03-28 06:28:02', NULL, '2022-03-28 06:28:02', NULL, NULL),
(3, 'x6a31-dm0ji-kaqst-bzlud-pxm0x-tudk-20220328093530', 'RYP0003', '0725765214', '0721519856', 'mhenrietta.murauni@gmail.com', 'Kenneth Ijimba Otiende', '0721519856', 'jimba@gmail.com', 'Civil Servant', 'Henrietta Murauni', '0725765214', 'mhenrietta.murauni@gmail.com', 'Banker', '', NULL, NULL, NULL, 'ryp0003@rayzonschools.com', '17441324', 1, 1, '2022-03-28 06:35:30', NULL, '2022-03-28 06:35:30', NULL, NULL),
(4, 'aek1o-6wjod-glfq1-i9xqn-56ysx-wr0x-20220328094018', 'RYP0004', '0729385316', NULL, 'melodywegesa@gmail.com', '', NULL, NULL, NULL, 'Melody Wegesa', '0729385316', 'melodywegesa@gmail.com', 'Teacher', '', NULL, NULL, NULL, 'ryp0004@rayzonschools.com', '73710371', 1, 1, '2022-03-28 06:40:18', NULL, '2022-03-28 06:40:18', NULL, NULL),
(5, 'sxedp-xsjpq-x5avp-mevd7-xhga3-uk9y-20220328094829', 'RYP0005', '0716414600', '0795922995', 'annekipruto@gmail.com', 'Donald Ocheing', '0795922995', NULL, 'Accountant', 'Ann Kipruto', '0716414600', 'annekipruto@gmail.com', 'Nurse', '', NULL, NULL, NULL, 'ryp0005@rayzonschools.com', '43777955', 1, 1, '2022-03-28 06:48:29', NULL, '2022-03-28 06:48:29', NULL, NULL),
(6, 'jo3na-tlots-wxfrj-6hz0g-l71cz-sci3-20220328102835', 'RYP0006', '0725950886', '0720234878', 'immacchand@yahoo.com', 'Joash Ochieng', '0720234878', 'joashowuor@gmail.com', 'Accountant', 'Immaculate Awuor', '0725950886', 'immacchand@yahoo.com', 'Teacher', '', NULL, NULL, NULL, 'ryp0006@rayzonschools.com', '87421078', 1, 1, '2022-03-28 07:28:35', NULL, '2022-03-28 07:28:35', NULL, NULL),
(7, 'bp8ka-xhlrt-ri6wk-uulm4-gcn1j-sbqo-20220328103720', 'RYP0007', '0704101759', '0750593291', 'mercylums2000@gmail.com', 'George Matala', '0704101759', 'kwalaf1986@gmail.com', 'Business Man', 'Mercy Wasike', '0750593291', 'mercylums2000@gmail.com', 'Lab-Tech', '', NULL, NULL, NULL, 'ryp0007@rayzonschools.com', '95283497', 1, 1, '2022-03-28 07:37:20', NULL, '2022-03-28 07:37:20', NULL, NULL),
(8, 'cnipd-ieot7-unsgt-pyspg-of1nk-trnt-20220328104849', 'RYP0008', '0729499482', NULL, NULL, '', NULL, NULL, NULL, 'Annegrette Mela', '0729499482', NULL, 'Pharmacist', '', NULL, NULL, NULL, 'ryp0008@rayzonschools.com', '98931101', 1, 1, '2022-03-28 07:48:49', NULL, '2022-03-28 07:48:49', NULL, NULL),
(9, 'sktdr-xmadu-b0qey-xndfk-2iu81-f37t-20220328105654', 'RYP0009', '0710684136', '0723009226', 'mary.g.apopa@gmail.com', 'Kokeno Stephen Oloo', '0723009226', 'skokeno@yahoo.com', 'Accountant', 'Apopa Mary', '0710684136', 'mary.g.apopa@gmail.com', 'Police Officer', '', NULL, NULL, NULL, 'ryp0009@rayzonschools.com', '79735201', 1, 1, '2022-03-28 07:56:54', NULL, '2022-03-28 07:56:54', NULL, NULL),
(10, 'f3o2u-cj33m-a2n4q-y8w7d-uijxz-hmwp-20220328110709', 'RYP0010', '0710516665', '0723648580', 'meydad.en@gmail.com', 'Samst Amin', '0723648580', 'asamji80@gmail.com', 'Business Man', 'Esther Njeri', '0710516665', 'meydad.en@gmail.com', 'Accountant', '', NULL, NULL, NULL, 'ryp0010@rayzonschools.com', '26513663', 1, 1, '2022-03-28 08:07:09', NULL, '2022-03-28 08:07:09', NULL, NULL),
(11, 'wltc2-hx4q1-o1snt-k1b43-6lsai-gx1i-20220328111151', 'RYP0011', '0728756378', '0727929860', 'ryavanny@gmail.com', 'Richard Kiptoo', '0727929860', 'kiprichtoo@yahoo.com', 'Business Man', 'Violet Otieno', '0728756378', 'ryavanny@gmail.com', NULL, '', NULL, NULL, NULL, 'ryp0011@rayzonschools.com', '53143878', 1, 1, '2022-03-28 08:11:51', NULL, '2022-03-28 08:11:51', NULL, NULL),
(12, 'bcgd8-8efis-oqcij-iiadh-0ogpl-iam1-20220328111740', 'RYP0012', '0790869713', NULL, 'sylvianasimiyu85@gmail.com', '', NULL, NULL, NULL, 'Sylvia Nasimiyu', '0790869713', 'sylivianasimiyu85@gmail.com', 'Procurement Officer', '', NULL, NULL, NULL, 'ryp0012@rayzonschools.com', '33601151', 1, 1, '2022-03-28 08:17:40', NULL, '2022-03-28 08:17:40', NULL, NULL),
(13, 'tf5ig-ghjch-1nzjz-0meav-bph58-rsxn-20220328112507', 'RYP0013', '0721998270', NULL, NULL, 'Michael Lugalia', '0721998270', NULL, 'Farmer', 'Nancy N Chole', NULL, NULL, 'Business Woman', '', NULL, NULL, NULL, 'ryp0013@rayzonschools.com', '86975918', 1, 1, '2022-03-28 08:25:07', NULL, '2022-03-28 08:25:07', NULL, NULL),
(14, 'pndk2-rzowc-1sxp2-gsdab-iorq0-puiq-20220328112945', 'RYP0014', '0713123838', '0722711088', NULL, 'Peter Maloba Wamoto', '072211088', NULL, NULL, 'Esther Makokha', '0713123838', NULL, 'Business Woman', '', NULL, NULL, NULL, 'ryp0014@rayzonschools.com', '43003680', 1, 1, '2022-03-28 08:29:45', NULL, '2022-03-28 08:29:45', NULL, NULL),
(15, 'yxbjn-datzt-y74zi-rlym2-5cat8-xz4s-20220328162511', 'RYP0015', '0726913046', NULL, NULL, '', NULL, NULL, NULL, 'Mercy Werunga', '0726913046', NULL, 'Student', '', NULL, NULL, NULL, 'ryp0015@rayzonschools.com', '56937785', 1, 1, '2022-03-28 13:25:11', NULL, '2022-03-28 13:25:11', NULL, NULL),
(16, 's4tde-xirf7-0zhzv-tcds6-cqtcf-b6rr-20220328163420', 'RYP0016', '0722610283', '0726817598', NULL, 'Bernard Langat', '0726817598', NULL, 'Employed', 'Beatrice Chumba', '0722610283', 'chumbachemtai@gmail.com', 'Employed', '', NULL, NULL, NULL, 'ryp0016@rayzonschools.com', '55644367', 1, 1, '2022-03-28 13:34:20', NULL, '2022-03-28 13:34:20', NULL, NULL),
(17, 'lnvly-xavlj-4hfxc-b0ceb-qnd0u-yw6h-20220328164230', 'RYP0017', '0721335075', '0724414772', 'mringinia@yahoo.com', 'Solomon Kokwo', '0724414772', 'spkiach@yahoo.com', 'Doctor', 'Rachael Maikuma', '0721335075', 'mringinia@yahoo.com', 'Paediatrician', '', NULL, NULL, NULL, 'ryp0017@rayzonschools.com', '98480019', 1, 1, '2022-03-28 13:42:30', NULL, '2022-03-28 13:42:30', NULL, NULL),
(18, 'pl4hm-0q14u-shkwx-5raxr-bkt6x-zryk-20220328164832', 'RYP0018', '0721838008', '0726390363', 'gie2011.nekoye@gmail.com', 'Ferninard Ngome', '0726390363', 'ngomenafu@gmail.com', 'Branch Manager Madison', 'Celestine Nalianya', '0721838008', 'gie2001.nekoye@gmail.com', 'Clinical Officer', '', NULL, NULL, NULL, 'ryp0018@rayzonschools.com', '54548600', 1, 1, '2022-03-28 13:48:32', NULL, '2022-03-28 13:48:32', NULL, NULL),
(19, '4tvyd-zpsuz-o78y1-7dzug-1hx9w-uwwx-20220328165247', 'RYP0019', '0712972926', '0728428127', 'anneauma@gmail.com', 'Kevin Gumo Magero', '0728428127', 'magero2000@yahoo.com', NULL, 'Anne Magero', '0712972926', 'anneauma@gmail.com', NULL, '', NULL, NULL, NULL, 'ryp0019@rayzonschools.com', '31965375', 1, 1, '2022-03-28 13:52:47', NULL, '2022-03-28 13:52:47', NULL, NULL),
(20, 'uecvz-0ozds-aahpb-joltf-tqvsk-9o3u-20220328165600', 'RYP0020', '0711275459', NULL, NULL, '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'Batan Khaemba', '0711275459', NULL, 'Grandfather', 'ryp0020@rayzonschools.com', '36652925', 1, 1, '2022-03-28 13:56:00', NULL, '2022-03-28 13:56:00', NULL, NULL),
(21, 'm0qgu-6ppqp-z0bs5-hofs1-d8dpb-uwly-20220328171007', 'RYP0021', '0722260794', '0710893276', 'karolkashek@gmail.com', 'Thomas Odhiambo', '0710893276', 'koumate@gmail.com', 'Doctor', 'Carolyn Ekanusur', '0722260794', 'karolkashek@gmail.com', 'Farmer', '', NULL, NULL, NULL, 'ryp0021@rayzonschools.com', '95687728', 1, 1, '2022-03-28 14:10:07', NULL, '2022-03-28 14:10:07', NULL, NULL),
(22, 'jyznx-09vhj-cftcp-2dfm4-si5xl-5pyh-20220328171619', 'RYP0022', '0721731968', '0708808014', 'agolaimtrude@yahoo.com', 'Samson Kibet', '0721731968', 'samsonchemonges@gmail.com', 'Business Man', 'Imtrude Agola', '0708808014', 'agolaimtrude@yahoo.com', 'Business Woman', '', NULL, NULL, NULL, 'ryp0022@rayzonschools.com', '35458869', 1, 1, '2022-03-29 09:07:36', 1, '2022-03-29 09:07:36', NULL, NULL),
(23, 'sj0lr-8hydp-xrmtx-nipbw-ligbe-ng7y-20220328172242', 'RYP0023', '0729160529', '0721574898', NULL, 'Eliud Nyogesa', '0721574898', NULL, 'Business Man', 'Jackline Nyogesa', '0729160529', NULL, 'Business Woman', '', NULL, NULL, NULL, 'ryp0023@rayzonschools.com', '23488896', 1, 1, '2022-03-28 14:22:42', NULL, '2022-03-28 14:22:42', NULL, NULL),
(24, 'fheib-ayqx1-hkfj2-tckpq-yspge-7vvc-20220328174628', 'RYP0024', '0713856956', NULL, NULL, 'Douglas Lusaka', '0713856956', NULL, 'Business Man', 'Jacinta Waliaula', '0713856956', 'waliaulaj@gmail.com', 'Agronomist', '', NULL, NULL, NULL, 'ryp0024@rayzonschools.com', '70528047', 1, 1, '2022-03-28 14:46:28', NULL, '2022-03-28 14:46:28', NULL, NULL),
(25, 'op0j9-tkhap-bi1e5-z9qfj-awb24-mxzz-20220328175402', 'RYP0025', '0715401448', '0711184359', 'chemtaidaisy@gmail.com', 'Martin Kiprop', '0711184359', 'kipsmartin@gmail.com', 'Clinician', 'Daisy Chemtai', '0715401448', 'chemtaidaisy@gmail.com', 'Trade Development Represntative', '', NULL, NULL, NULL, 'ryp0025@rayzonschools.com', '33323215', 1, 1, '2022-03-28 14:54:02', NULL, '2022-03-28 14:54:02', NULL, NULL),
(26, 'cannp-wbrhq-zr9g3-04smr-81yxk-pogl-20220328210849', 'RYP0026', '0720725580', NULL, NULL, 'Arafat Mohsen', '0720725580', NULL, NULL, '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'ryp0026@rayzonschools.com', '46600702', 1, 1, '2022-03-28 18:08:49', NULL, '2022-03-28 18:08:49', NULL, NULL),
(27, 'zvet5-it7qc-9vkqp-ovmq9-x6jfq-1otq-20220328211614', 'RYP0027', '0729575246', '0711337764', NULL, 'Justine Abuga', '0711337764', 'abugajustine@gmail.com', 'Self Employed', 'Mercelyne Kibagendi', '0729575246', 'kibagendimercy89@gmail.com', 'Employed', '', NULL, NULL, NULL, 'ryp0027@rayzonschools.com', '74751404', 1, 1, '2022-03-28 18:16:14', NULL, '2022-03-28 18:16:14', NULL, NULL),
(28, '3cqt6-blrah-fioyl-wpepb-w25hb-vqws-20220328213049', 'RYP0028', '0704965113', '0722663011', 'snyongesa@gmail.com', 'Philip Simiyu', '0722663011', NULL, 'MCA', 'Sandra Nyongesa', '0704965113', 'snyongesa@gmail.com', 'Ass. Procurement Officer', '', NULL, NULL, NULL, 'ryp0028@rayzonschools.com', '21882609', 1, 1, '2022-03-28 18:30:49', NULL, '2022-03-28 18:30:49', NULL, NULL),
(29, 'fafch-xc03j-p3tnw-ksrxb-shgd0-3kvm-20220328213840', 'RYP0029', '0724696524', '0722547148', NULL, 'Kazungu Joseph', '0722547148', 'ngirabienterprises@gmail.com', 'Business Man', 'Leah Nyambura', '0724696524', 'leahmunyaka2015@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0029@rayzonschools.com', '78069047', 1, 1, '2022-03-29 11:03:25', 1, '2022-03-29 11:03:25', NULL, NULL),
(30, 'stbkr-1x4ui-m8gr8-tbiwo-v3hok-mxhx-20220328214857', 'RYP0030', '0707234500', '0721213216', 'beckywando2017@gmail.com', 'Fredrick Omondi', '0721213216', 'ofred972@gmail.com', 'Bank Employee', 'Rebeccah Akoth', '0707234500', 'beckywando2017@gmail.com', 'P.H.O', '', NULL, NULL, NULL, 'ryp0030@rayzonschools.com', '35478525', 1, 1, '2022-03-28 18:48:57', NULL, '2022-03-28 18:48:57', NULL, NULL),
(31, 'dkgye-dsvg5-yunbz-zkzqj-fbytq-g6d1-20220328215806', 'RYP0031', '0716254377', '0704615131', 'cynthialyabeda94@gmail.com', 'Boniface Musyoka', '0704615131', 'mubonnie@gmail.com', 'Banker', 'Cynthia Indiazi', '0716254377', 'cynthialyabeda94@gmail.com', 'Social Worker', '', NULL, NULL, NULL, 'ryp0031@rayzonschools.com', '20719656', 1, 1, '2022-03-28 18:58:06', NULL, '2022-03-28 18:58:06', NULL, NULL),
(32, '9y0s4-pj2x2-kmadv-cm3ww-ciw0c-kryp-20220328220507', 'RYP0032', '0723586529', NULL, 'elizabethlokalei@gmail.com', 'Lokalei Elizabeth', '0723586529', 'elizabethlokalei@gmail.com', 'Civil Servant', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'ryp0032@rayzonschools.com', '81150317', 1, 1, '2022-03-28 19:05:07', NULL, '2022-03-28 19:05:07', NULL, NULL),
(33, 'stoju-ojd3r-vddnd-7pfyc-utiur-txzv-20220328222146', 'RYP0033', '0725861108', '0724847330', 'jacquechero2006@yahoo.com', 'Bernard Koech', '0724847330', NULL, 'Farmer', 'Jackline Kibiego', '0725861108', 'jacquechero2006@yahoo.com', 'Nurse', '', NULL, NULL, NULL, 'ryp0033@rayzonschools.com', '99656534', 1, 1, '2022-03-28 19:21:46', NULL, '2022-03-28 19:21:46', NULL, NULL),
(34, 'bn1hs-wllfr-z5bfx-xwlkd-ptchu-vk0o-20220328222648', 'RYP0034', '0721255457', '0729931321', NULL, 'Richard Tormoi', '0729931321', NULL, 'Administrator', 'Carolyne Arusei', '0721255457', 'carolynearusei@gmail.com', 'Human Resource Officer', '', NULL, NULL, NULL, 'ryp0034@rayzonschools.com', '52383278', 1, 1, '2022-03-28 19:26:48', NULL, '2022-03-28 19:26:48', NULL, NULL),
(35, '93d1f-afujl-uvzh1-w51ip-hrlwc-z0rb-20220328223524', 'RYP0035', '0716826467', '0716505611', 'cowiti27@yahoo.com', 'Isaac Otieno Achiela', '0716505611', 'isackotieno@gmail.com', 'Accountant', 'Carolyne Anyango', '0716826467', 'cowiti27@yahoo.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0035@rayzonschools.com', '11166311', 1, 1, '2022-03-28 19:35:24', NULL, '2022-03-28 19:35:24', NULL, NULL),
(36, 'mubzf-sotsp-x3pag-xbcbr-vb7um-rcqc-20220328224616', 'RYP0036', '0713180117', '0721831787', 'estjeko@yahoo.com', 'Denis Panyako', '0721831787', 'dmurunga2004@yahoo.com', 'Accountant', 'Esther Jekombe', '0713180117', 'estjeko@yahoo.com', 'Teacher', '', NULL, NULL, NULL, 'ryp0036@rayzonschools.com', '97204971', 1, 1, '2022-03-28 19:46:16', NULL, '2022-03-28 19:46:16', NULL, NULL),
(37, 'pmaan-ftl6f-nd8m3-bfqdj-iejzl-hspi-20220328225139', 'RYP0037', '0726089580', NULL, NULL, '', NULL, NULL, NULL, 'June Kibor', '0726089580', 'junekibor2020@gmail.com', NULL, '', NULL, NULL, NULL, 'ryp0037@rayzonschools.com', '18489135', 1, 1, '2022-03-28 19:51:39', NULL, '2022-03-28 19:51:39', NULL, NULL),
(38, 'dolw8-ebtie-avv56-qdxyt-7536a-c0yw-20220328230651', 'RYP0038', '0727404619', '0713142390', 'rpkemoi2002@yahoo.com', 'Raymond Pkemoi', '0713142390', 'rpkemoi2002@yahoo.com', 'Business Man', 'Oglah Chumum', '0727404619', NULL, 'Civil Servant', '', NULL, NULL, NULL, 'ryp0038@rayzonschools.com', '48653759', 1, 1, '2022-03-28 20:06:51', NULL, '2022-03-28 20:06:51', NULL, NULL),
(39, 'ljgdg-j12zf-pfaop-14fym-bbvsh-lhaw-20220328231413', 'RYP0039', '0725473944', '0726877573', 'joanbirgen@yahoo.com', 'Leonard Ouma', '0726877573', 'mromdogo@gmail.com', 'Civil Engineer', 'Joan Birgen', '0725473944', 'joanbirgen@yahoo.com', NULL, '', NULL, NULL, NULL, 'ryp0039@rayzonschools.com', '44817541', 1, 1, '2022-03-28 20:14:13', NULL, '2022-03-28 20:14:13', NULL, NULL),
(40, 'awi8g-tqmvj-yahke-sn8yt-mgc8v-eplm-20220328233457', 'RYP0040', '0717067757', '0710282035', NULL, 'Laban Chweya', '0710282035', NULL, NULL, 'Emma Nyaberi', '0717067757', 'emmanyaberi@gmail.com', NULL, '', NULL, NULL, NULL, 'ryp0040@rayzonschools.com', '64268756', 1, 1, '2022-03-28 20:34:57', NULL, '2022-03-28 20:34:57', NULL, NULL),
(41, 'dteho-s5v0j-yao45-ebl1n-a4mmq-vohp-20220328234032', 'RYP0041', '0723267679', '0722865991', 'doreenwawire@yahoo.com', 'Edward Wanyonyi', '0722865991', 'edwanyonyi@gmail.com', 'Doctor', 'Doreen Wawire', '0723267679', 'doreenwawire@yahoo.com', 'Public Servant', '', NULL, NULL, NULL, 'ryp0041@rayzonschools.com', '69528627', 1, 1, '2022-03-28 20:40:32', NULL, '2022-03-28 20:40:32', NULL, NULL),
(42, 'zxv6j-pfwoq-rkrcl-p1m8m-yn9wa-mspm-20220328234807', 'RYP0042', '0712326864', '0721252929', 'winnie.kimberly101@gmail.com', 'Charles Murugami', '0721252929', 'michukicm@gmail.com', 'IT Specialist', 'Winny Rotich', '0712326864', 'winnie.kimberly101@gmail.com', 'Procurement Officer', '', NULL, NULL, NULL, 'ryp0042@rayzonschools.com', '31600198', 1, 1, '2022-03-28 20:48:07', NULL, '2022-03-28 20:48:07', NULL, NULL),
(43, 'ojdfg-jam5l-ic7br-iiwdc-xeh3t-xg9l-20220328235258', 'RYP0043', '0722311550', NULL, NULL, 'Nathan Makokha', '0722311550', 'nmakokha@gmail.com', 'Auditor', 'Caroline Wanjala', NULL, NULL, 'Customer Service', '', NULL, NULL, NULL, 'ryp0043@rayzonschools.com', '33724644', 1, 1, '2022-03-28 20:52:58', NULL, '2022-03-28 20:52:58', NULL, NULL),
(44, 'mxihi-a8exv-dmy85-uumz0-w7qji-3hp2-20220329000104', 'RYP0044', '0727870839', NULL, NULL, '', NULL, NULL, NULL, 'Juliet Mbarwa', '0727870839', 'mmbarwa@gmail.com', NULL, '', NULL, NULL, NULL, 'ryp0044@rayzonschools.com', '60841307', 1, 1, '2022-03-28 21:01:04', NULL, '2022-03-28 21:01:04', NULL, NULL),
(45, 'nhjnf-lgegh-tr3co-ipa1d-amyaa-vnba-20220329000713', 'RYP0045', '0715491717', '0722840005', 'ndiwajoanec@yahoo.com', 'Bernard Odari', '0722840005', 'bennodari@gmail.com', 'Civil Servant', 'Joan Cheptayek', '0715491717', 'ndiwajoanec@yahoo.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0045@rayzonschools.com', '62255181', 1, 1, '2022-03-28 21:07:13', NULL, '2022-03-28 21:07:13', NULL, NULL),
(46, 'pc4r4-ir44b-zqfmx-hbdey-5jjyg-7uz7-20220329001325', 'RYP0046', '0722572844', '0722770425', 'makokha-r@yahoo.com', 'Michael Muhanda', '0722770425', NULL, NULL, 'Rose Makokha', '0722572844', 'makokha-r@yahoo.com', 'Business Woman', '', NULL, NULL, NULL, 'ryp0046@rayzonschools.com', '16325733', 1, 1, '2022-03-28 21:13:25', NULL, '2022-03-28 21:13:25', NULL, NULL),
(47, 'qpzzn-lko4f-gngfu-xwjk0-vektn-bt6i-20220329002504', 'RYP0047', '0702942843', '0724200605', 'joykagombero@yahoo.com', 'Philip Kapten', '0724200605', 'philipkapten@gmail.com', 'Farmer', 'Joy Kagombero', '0702942843', 'joykagombero@yahoo.com', 'Farmer', '', NULL, NULL, NULL, 'ryp0047@rayzonschools.com', '51589918', 1, 1, '2022-03-28 21:25:04', NULL, '2022-03-28 21:25:04', NULL, NULL),
(48, 'viprh-vx6yn-wqt7o-l4gfc-txfyu-i6b8-20220329003000', 'RYP0048', '0708769871', '0723949904', 'cmarital58@gmail.com', 'Conrald Ongaro', '0723949904', 'congaro@gmail.com', NULL, 'Caroline Nyaboke', '0708769871', 'cmarital58@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0048@rayzonschools.com', '90537150', 1, 1, '2022-03-28 21:30:00', NULL, '2022-03-28 21:30:00', NULL, NULL),
(49, 'uauuq-mmyg3-x0rln-aab4k-fvx74-umkb-20220329004715', 'RYP0049', '0700406964', '0717170693', 'slilian443@gmail.com', 'Evans Muthama', '0717170693', NULL, 'Accountant', 'Lilian Sitati', '0700406964', 'slilian443@gmail.com', 'Secretary', '', NULL, NULL, NULL, 'ryp0049@rayzonschools.com', '73096564', 1, 1, '2022-03-28 21:47:15', NULL, '2022-03-28 21:47:15', NULL, NULL),
(50, 'icetf-mhwjk-dnwdp-2zwaz-ub11g-3tgd-20220329005754', 'RYP0050', '0706442960', NULL, NULL, 'Isiah Oyugi', '0706442960', NULL, 'Pastor', 'Christine Savai', NULL, NULL, 'Pastor', '', NULL, NULL, NULL, 'ryp0050@rayzonschools.com', '77404138', 1, 1, '2022-03-28 21:57:54', NULL, '2022-03-28 21:57:54', NULL, NULL),
(51, '35xd8-jg3js-cqtkx-vafqo-mb8xi-rxib-20220329010819', 'RYP0051', '0728534578', '0722692292', 'prudabu@gmail.com', 'Benson Masika', '0722692292', 'benbuluma@yahoo.com', 'Nurse', 'Prudence Abuga', '0728534578', 'prudabu@gmail.com', 'Nurse', '', NULL, NULL, NULL, 'ryp0051@rayzonschools.com', '57035777', 1, 1, '2022-03-28 22:08:19', NULL, '2022-03-28 22:08:19', NULL, NULL),
(52, 'fkcau-o0r0d-vhgjb-xint2-ityqh-vanz-20220329012306', 'RYP0052', '0721589640', '0715162752', 'tushmon@gmail.com', 'Stephen Gichana', '0715162752', 'makoristeve@gmail.com', 'Pharmacist', 'Monica Matundura', '0721589640', 'tushmon@gmail.com', 'Teacher', '', NULL, NULL, NULL, 'ryp0052@rayzonschools.com', '98871123', 1, 1, '2022-03-28 22:23:06', NULL, '2022-03-28 22:23:06', NULL, NULL),
(53, 'jlko2-hjv8b-dw8f5-dxymb-e0lfi-yebj-20220329013723', 'RYP0053', '0726638751', '0720659804', 'hchebichi@yahoo.com', 'David Wanjala', '0720659804', 'davidmukile@gmail.com', 'Teacher', 'Hildah Jebichi', '0726638751', 'hchebichi@yahoo.com', 'Teacher', '', NULL, NULL, NULL, 'ryp0053@rayzonschools.com', '17387303', 1, 1, '2022-03-28 22:37:23', NULL, '2022-03-28 22:37:23', NULL, NULL),
(54, 't0xg3-tjagw-wziha-pamxq-oicdg-zotr-20220329014553', 'RYP0054', '0726758651', NULL, 'jedidahmvula@hotmail.com', '', NULL, NULL, NULL, 'Jedidah Mvula', '0726758651', 'jedidahmvula@hotmail.com', 'Missionary', '', NULL, NULL, NULL, 'ryp0054@rayzonschools.com', '83274377', 1, 1, '2022-03-28 22:45:53', NULL, '2022-03-28 22:45:53', NULL, NULL),
(55, 'lxas5-0067f-muq21-tdwgb-8uzm6-ys09-20220329015220', 'RYP0055', '0718834569', '0769923515', 'janetkogo@gmail.com', 'William Yegon', '0769923515', NULL, 'Contractor', 'Janet Mvula', '0718834569', 'janetkogo@gmail.com', 'Business Woman', '', NULL, NULL, NULL, 'ryp0055@rayzonschools.com', '91114803', 1, 1, '2022-03-28 22:52:20', NULL, '2022-03-28 22:52:20', NULL, NULL),
(56, 'pqucc-5uv47-rtjfr-eqbbg-anyba-xtcu-20220329020354', 'RYP0056', '0724709902', '0724057660', 'mukwana79@gmail.com', 'Paul Otube Lukoriti', '0724057660', NULL, 'Teacher', 'Jacqueline Wekesa', '0724709902', 'mukwana79@gmail.com', 'Magistrate', '', NULL, NULL, NULL, 'ryp0056@rayzonschools.com', '77867370', 1, 1, '2022-03-28 23:03:54', NULL, '2022-03-28 23:03:54', NULL, NULL),
(57, 'iijyg-qmkve-l48zh-8v25e-jzwwm-wfma-20220329021157', 'RYP0057', '0708050342', '0721803441', 'wachiraevawanjiru@gmail.com', 'Jeffrey Kiptoo', '0721803441', NULL, 'Business Man', 'Eva Wanjiru Wachira', '070805342', 'wachiraevawanjiru@gmail.com', 'Animal Science', '', NULL, NULL, NULL, 'ryp0057@rayzonschools.com', '26202947', 1, 1, '2022-03-28 23:11:57', NULL, '2022-03-28 23:11:57', NULL, NULL),
(58, 'ygw39-xmom9-19uco-4vvzv-mrfm6-yxqd-20220329103633', 'RYP0058', '0721358932', NULL, 'abdullahihassan@gmail.com', 'Abdullahi Hassan', '0721358932', 'abdullahihassan@gmail.com', 'Business Man', 'Warmog Ali', NULL, NULL, 'Nurse', '', NULL, NULL, NULL, 'ryp0058@rayzonschools.com', '16538644', 1, 1, '2022-03-29 07:36:33', NULL, '2022-03-29 07:36:33', NULL, NULL),
(59, 'oqv0i-jatwc-npmem-56es4-1g8ls-uomm-20220329104038', 'RYP0059', '0719497705', NULL, NULL, '', NULL, NULL, NULL, 'Gladys Cheruto', '0719497705', 'gladycheru554@gmail.com', 'Self Employed', '', NULL, NULL, NULL, 'ryp0059@rayzonschools.com', '45410750', 1, 1, '2022-03-29 07:40:38', NULL, '2022-03-29 07:40:38', NULL, NULL),
(60, 'e3q3p-igak7-txs86-hdosg-8linz-twkr-20220329104950', 'RYP0060', '0725383868', '0725949387', 'roselineterei@gmail.com', 'Daniel Kiptoo', '0725949387', NULL, 'Doctor', 'Roseline Chepkemoi', '0725383868', 'roselineterei@gmail.com', 'Business Woman', '', NULL, NULL, NULL, 'ryp0060@rayzonschools.com', '35549549', 1, 1, '2022-03-29 07:49:50', NULL, '2022-03-29 07:49:50', NULL, NULL),
(61, 'jlfom-ywa2v-tqp2r-z1i4y-il8ew-e6ef-20220329105524', 'RYP0061', '0720777494', '0722832951', 'sheilangetich@gmail.com', 'Bernard Imbuye', '0722832951', 'benimb2020@yahoo.com', 'Farmer', 'Sheila Ngetich Imbuye', '0720777494', 'sheilangetich@gmail.com', 'Business Woman', '', NULL, NULL, NULL, 'ryp0061@rayzonschools.com', '81281076', 1, 1, '2022-03-29 07:55:24', NULL, '2022-03-29 07:55:24', NULL, NULL),
(62, 'bcsoi-pzc34-8jybu-zkk1g-dvh2o-wkyr-20220329105906', 'RYP0062', '0722333285', NULL, NULL, 'Michael Kimtai', '0722333285', NULL, NULL, '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'ryp0062@rayzonschools.com', '51062192', 1, 1, '2022-03-29 07:59:06', NULL, '2022-03-29 07:59:06', NULL, NULL),
(63, '57jxr-ldj6e-qu5yc-a8zcw-jarih-wfhc-20220329110507', 'RYP0063', '0707878279', '0720514327', 'pauloodhiambo@gmail.com', 'Paul Opiyo', '0720514327', 'pauloodhiambo@gmail.com', 'Business Man', 'Emily Akinyi', '0707878279', NULL, 'Sales Agent', '', NULL, NULL, NULL, 'ryp0063@rayzonschools.com', '89515492', 1, 1, '2022-03-29 08:05:07', NULL, '2022-03-29 08:05:07', NULL, NULL),
(64, 'r9qrd-estxs-47e7t-j8jey-rt3y9-ztir-20220329110920', 'RYP0064', '0710420915', '0723220594', 'okoyos@gmail.com', 'Simon Otieno', '0723220594', 'okoyos@gmail.com', 'Business Man', 'Emily Simiyu', '0710420915', 'cggy2010@gmail.com', 'Business Woman', '', NULL, NULL, NULL, 'ryp0064@rayzonschools.com', '38344740', 1, 1, '2022-03-29 08:09:20', NULL, '2022-03-29 08:09:20', NULL, NULL),
(65, '3qu1f-j6gk9-tzgpu-zlbiy-ovoly-wy0j-20220329112416', 'RYP0065', '0702204555', '0725273241', 'doreenkimeu@gmail.com', 'Paul Mutisya', '0725273241', 'mutisyapl@gmail.com', 'Business Man', 'Doreen Ngami Kimeu', '0702204555', 'doreenkimeu@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0065@rayzonschools.com', '41939676', 1, 1, '2022-03-29 08:24:16', NULL, '2022-03-29 08:24:16', NULL, NULL),
(66, '4rjtf-scudj-eg4dw-m5cza-j6c3i-ienb-20220329113319', 'RYP0066', '0714698251', '0724498799', 'odhiamboaustin069@gmail.com', 'Austin Odhiambo', '0724498799', 'odhiamboaustine069@gmail.com', 'Business Man', 'Elizabeth Makori', '0714698251', NULL, 'Teacher', '', NULL, NULL, NULL, 'ryp0066@rayzonschools.com', '30605228', 1, 1, '2022-03-29 08:33:19', NULL, '2022-03-29 08:33:19', NULL, NULL),
(67, 'wkhlj-5cthp-ngcsh-8ainq-va8n6-zd4z-20220329113751', 'RYP0067', '0723997453', '0715125744', 'otienonancy460@gmail.com', 'Henry Ouma', '0715125744', NULL, 'Education Officer', 'Nancy Otieno', '0723997453', 'otienonancy460@gmail.com', 'Auditor', '', NULL, NULL, NULL, 'ryp0067@rayzonschools.com', '81103003', 1, 1, '2022-03-29 08:37:51', NULL, '2022-03-29 08:37:51', NULL, NULL),
(68, 'nsezu-8nk9m-snmcp-iordc-h3b2b-kfht-20220329114232', 'RYP0068', '0708270298', '0714089624', 'andesodoc@gmail.com', 'Emmanuel Situma', '0714089624', 'emmanuelsituma8@gmail.com', 'Project Manager', 'Dorcas Andeso', '0708270298', 'andesodoc@gmail.com', 'Clinical Officer', '', NULL, NULL, NULL, 'ryp0068@rayzonschools.com', '36983408', 1, 1, '2022-03-29 08:42:32', NULL, '2022-03-29 08:42:32', NULL, NULL),
(69, '47fux-4sw9p-ec0te-osd1n-epnxw-4qcc-20220329114743', 'RYP0069', '0724358406', '0712226970', 'emmahkimu@gmail.com', 'Vincent Achola', '0712226970', 'odhiambovinn@gmail.com', 'Lecturer', 'Emmah N. Kimungui', '0724358406', 'emmahkimu@gmail.com', 'Clinician', '', NULL, NULL, NULL, 'ryp0069@rayzonschools.com', '95801808', 1, 1, '2022-03-29 08:47:43', NULL, '2022-03-29 08:47:43', NULL, NULL),
(70, 'hdvvp-ju4ul-bfyrt-zrbnt-qv0vi-dcey-20220329120118', 'RYP0070', '0797547007', '0721438607', 'naomimbugua31@gmail.com', 'John Wanyonyi', '0721438607', 'waltwanyonyi@yahoo.com', 'Advocate', 'Naomi Mbugua', '0797547007', 'naomimbugua31@gmail.com', 'House Wife', '', NULL, NULL, NULL, 'ryp0070@rayzonschools.com', '47997414', 1, 1, '2022-03-29 09:01:18', NULL, '2022-03-29 09:01:18', NULL, NULL),
(71, 'mssel-ogtmp-jv4fo-j8luu-ozhpf-s0px-20220329121503', 'RYP0071', '0713429368', '0720576352', 'judykemo@gmail.com', 'Samuel Momanyi', '0720576352', NULL, 'Teacher', 'Judith Nyabera', '0713429368', 'judykemo@gmail.com', 'Nurse', '', NULL, NULL, NULL, 'ryp0071@rayzonschools.com', '96646997', 1, 1, '2022-03-29 09:15:03', NULL, '2022-03-29 09:15:03', NULL, NULL),
(72, 'gemwx-vrlfq-pt1d0-xv6dc-ww4lg-un9q-20220329122206', 'RYP0072', '0720016861', '0724684139', 'ndegwaalice@gmail.com', 'Zacharia Mwangi', '0724684139', 'zachndegwa4@gmail.com', 'Business Man', 'Alice Mumo', '0720016861', 'ndegwaalice@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0072@rayzonschools.com', '92756717', 1, 1, '2022-03-29 09:22:06', NULL, '2022-03-29 09:22:06', NULL, NULL),
(73, 'ofndp-8b9ns-dcl7r-rtt5f-tmj0y-h6qz-20220329122854', 'RYP0073', '0728355003', NULL, 'nabifwoserah2gmail.com', '', NULL, NULL, NULL, 'Serah Mafura', '0728355003', 'nabifwoserah@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0073@rayzonschools.com', '20609707', 1, 1, '2022-03-29 09:28:54', NULL, '2022-03-29 09:28:54', NULL, NULL),
(74, 'iai3v-terzp-9djeq-utvoh-2qdco-tcr4-20220329124434', 'RYP0074', '0726982693', NULL, NULL, '', NULL, NULL, NULL, 'Deborah Nayagate', '0726982693', 'debnyangate@gmail.com', 'Special Teacher', '', NULL, NULL, NULL, 'ryp0074@rayzonschools.com', '23079400', 1, 1, '2022-03-29 09:44:34', NULL, '2022-03-29 09:44:34', NULL, NULL),
(75, 'blqs2-l5awc-cvwhy-meku9-voflm-az2m-20220329124827', 'RYP0075', '0720382051', NULL, NULL, '', NULL, NULL, NULL, 'Lilian Moraa', '0720382051', 'moraalilianobare@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0075@rayzonschools.com', '17460211', 1, 1, '2022-03-29 09:48:27', NULL, '2022-03-29 09:48:27', NULL, NULL),
(76, 'pxhpg-2pcqa-5hjmk-iqd1w-rtg8x-8kbh-20220329125312', 'RYP0076', '0713122106', '0728424903', 'maureenlivoi@gmail.com', 'Stanislaus Likoko', '0728424903', 'likokostanny@gmail.com', 'Business Man', 'Maurine Livoi', '0713122106', 'maureenlivoi@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0076@rayzonschools.com', '37640713', 1, 1, '2022-03-29 09:53:12', NULL, '2022-03-29 09:53:12', NULL, NULL),
(77, '3kcxw-bd3eh-lr4q8-kw7pf-zh69q-ucep-20220329125704', 'RYP0077', '0722108146', '0723339669', 'mercyw400@gmail.com', 'Joel Momanyi', '0723339669', NULL, NULL, 'Mercy Wairimu', '0722108146', 'mercyw400@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0077@rayzonschools.com', '31453315', 1, 1, '2022-03-29 09:57:04', NULL, '2022-03-29 09:57:04', NULL, NULL),
(78, '85v93-f4xew-rya7u-5zryl-t2qjq-5wus-20220329130143', 'RYP0078', '0729813757', '0722916234', NULL, 'Mike Mengich', '0722916234', NULL, NULL, 'Faith Cherop', '0729813757', 'faithkipkut@gmail.com', NULL, '', NULL, NULL, NULL, 'ryp0078@rayzonschools.com', '91206598', 1, 1, '2022-03-29 10:01:43', NULL, '2022-03-29 10:01:43', NULL, NULL),
(79, 'rn5m4-hecxt-d8wh6-lpkbm-owsj8-eqkm-20220329135210', 'RYP0079', '0702364432', NULL, NULL, 'Erick Kibitok', NULL, 'erickseronet@gmail.com', 'Accountant', 'Nancy Chepketer', '0702364432', 'nanciekutuny@gmail.com', 'Nurse', '', NULL, NULL, NULL, 'ryp0079@rayzonschools.com', '58700836', 1, 1, '2022-03-29 10:52:10', NULL, '2022-03-29 10:52:10', NULL, NULL),
(80, 'nd2gc-ffpon-uvbog-h87ex-niusj-dbzw-20220329141103', 'RYP0080', '0713343179', '0726141056', 'eunywaweru48@gmail.com', 'Boaz Olando', '0726141056', 'boazolando@gmail.com', 'Agronomist', 'Eunice Wanjiru Waweru', '0713343179', 'eunywaweru48@gmail.com', 'Business Lady', '', NULL, NULL, NULL, 'ryp0080@rayzonschools.com', '79318412', 1, 1, '2022-03-29 11:11:03', NULL, '2022-03-29 11:11:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_profiles`
--

INSERT INTO `school_profiles` (`id`, `name`, `motto`, `postal`, `physical`, `contact1`, `contact2`, `contact3`, `contact4`, `email1`, `email2`, `email3`, `email4`, `website`, `logo`, `projectId`, `clientId`, `clientSecret`, `redirect`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Rayzon Schools', '\"Education Is The Key\"', 'MILIMANI, Kitale, 30200', 'Milimani, Kitale', '0721 639817', '0721 639817', NULL, NULL, 'info@rayzonschools.com', NULL, NULL, NULL, 'www.rayzonschools.com', 'storage/profile\\1466593301.jpg', 'q7mezb53opiwcicfhklmyo2fveryztyy', '057826703d114b9f849f9f924bebf2cd', '9ae02a2b8a35484eade36c25414ad581', 'https://app.schoolbest.co.ke/v1//bulk-sms-delivery-report', 1, '2022-03-25 17:36:04', 1, '2022-03-25 17:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `staff_departments`
--

CREATE TABLE `staff_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `emp_type` int(11) NOT NULL DEFAULT 1,
  `tsc_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nssf` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nhif` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_sections`
--

CREATE TABLE `staff_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_department_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expected` int(11) NOT NULL DEFAULT 0,
  `arrears` int(11) NOT NULL DEFAULT 0,
  `current` int(11) NOT NULL DEFAULT 0,
  `paid` int(11) NOT NULL DEFAULT 0,
  `balance` int(11) NOT NULL DEFAULT 0,
  `birth_cert` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nemis_upi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `dob` date NOT NULL,
  `doa` date NOT NULL,
  `yoc` year(4) DEFAULT NULL,
  `residence` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adm_type` int(11) NOT NULL DEFAULT 1,
  `on_transport` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NO',
  `transport_zone_id` bigint(20) DEFAULT NULL,
  `way` int(4) DEFAULT NULL,
  `transport_fleet_id` bigint(20) DEFAULT NULL,
  `discount_level_id` bigint(20) UNSIGNED NOT NULL,
  `send_to` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_session_id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `parent_detail_id`, `slug`, `admno`, `name`, `classroom_id`, `class_grade_id`, `class_stream_id`, `expected`, `arrears`, `current`, `paid`, `balance`, `birth_cert`, `nemis_upi`, `gender`, `dob`, `doa`, `yoc`, `residence`, `adm_type`, `on_transport`, `transport_zone_id`, `way`, `transport_fleet_id`, `discount_level_id`, `send_to`, `current_session_id`, `photo`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 1, 'qphcz-e4iuu-yomvt-dndys-o2gp1-unjb-20220326182930', 'RYZ1001', 'Giovanna Ngome', 8, 8, 1, 27200, 0, 27200, 0, 27200, '1441115090', '9QD5BY', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-26 15:29:31', 1, '2022-03-26 15:29:31', NULL, NULL),
(2, 1, 'jabxa-yfltg-rvrjp-zw6e2-dorsb-yyzm-20220328091559', 'RYZ1002', 'Carol Atieno', 8, 8, 1, 24900, 0, 24900, 0, 24900, '0371303286', '8CECJQ', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:18:41', 1, '2022-03-29 20:18:41', NULL, NULL),
(3, 1, 'e8cb4-ph5hw-vskh6-xetiw-mah1k-nz43-20220328091726', 'RYZ1003', 'Ryan Boaz', 8, 8, 1, 27200, 0, 27200, 0, 27200, '0391223424', 'S9B46W', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 06:17:27', 1, '2022-03-28 06:17:27', NULL, NULL),
(4, 1, 'qnjp7-33rvi-kijzq-6sin7-hqqxn-li8x-20220328091923', 'RYZ1004', 'Adele Gumo', 8, 8, 1, 27200, 0, 27200, 0, 27200, '1441213225', '5HVDF9', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 06:19:23', 1, '2022-03-28 06:19:23', NULL, NULL),
(5, 1, 'lh9s2-of6yu-gyyq9-nv87u-gsrlq-hor4-20220328092103', 'RYZ1005', 'Jane Betty Zonneveld', 8, 8, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 06:21:04', 1, '2022-03-28 06:21:04', NULL, NULL),
(6, 1, 'miqu2-75mic-uxhdn-trakk-warac-yajl-20220328092248', 'RYZ1006', 'Brian Mungora Mutembura', 8, 8, 1, 28300, 1100, 27200, 0, 28300, NULL, 'X78JGQ', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 14:55:26', 1, '2022-03-29 14:55:26', NULL, NULL),
(7, 2, 'jxfb6-h0olx-rlhf2-7plku-y0cey-kfbz-20220328092802', 'RYZ1007', 'Tandi Andia', 8, 8, 1, 27200, 0, 27200, 0, 27200, '0261263811', '2JVCB3', 1, '2012-02-04', '2021-12-05', NULL, 'Kibomet', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 06:28:02', 1, '2022-03-28 06:28:02', NULL, NULL),
(8, 3, 'a4pkt-w4cks-5crpc-gnox9-to9rl-kyyx-20220328093530', 'RYZ1008', 'Pascal Murauni', 8, 8, 1, 10200, 0, 10200, 0, 10200, '0031509859', '82TEED', 1, '2012-02-17', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 3, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 06:35:30', 1, '2022-03-28 06:35:30', NULL, NULL),
(9, 4, 'hlwmf-f1ny8-yy8q9-ncoby-zi75p-kwap-20220328094018', 'RYZ1009', 'Nard David Wegesa', 8, 8, 1, 18700, 1500, 17200, 0, 18700, '1301834980', '7URC5V', 1, '2011-06-25', '2021-07-28', NULL, 'Milimani', 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 14:52:51', 1, '2022-03-29 14:52:51', NULL, NULL),
(10, 5, '6qdfk-3guqy-bl6ly-mdzyp-fp9nr-dvzb-20220328094829', 'RYZ1010', 'Kyle Emmanuel Kibet', 8, 8, 1, 34000, 0, 34000, 0, 34000, '0041121245', '6KZXS2', 1, '2011-04-11', '2022-03-26', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 07:53:36', 1, '2022-03-28 07:53:36', NULL, NULL),
(11, 1, 'kgl84-wnch6-skxqv-cmtvr-xyftb-c2mh-20220328095050', 'RYZ1011', 'Adrian Kibet', 7, 7, 1, 27200, 0, 27200, 0, 27200, NULL, 'U9R8KT', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 06:50:50', 1, '2022-03-28 06:50:50', NULL, NULL),
(12, 1, 'y2bud-glxtw-plhjh-vqrnv-q5vuz-sktq-20220328095256', 'RYZ1012', 'John Kisiangani', 7, 7, 1, 24300, 0, 24300, 0, 24300, '0261269992', 'ACQNYR', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:20:11', 1, '2022-03-29 20:20:11', NULL, NULL),
(13, 1, 'k2ijw-1yfk2-dzcy0-fydvg-tq6f1-mpga-20220328095419', 'RYZ1013', 'Pius Gumo', 7, 7, 1, 27300, 100, 27200, 0, 27300, '1441405234', 'E3KL9T', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:03:17', 1, '2022-03-29 20:03:17', NULL, NULL),
(14, 1, 'si1sy-lxogr-fyztc-pciim-0p4lq-tfnp-20220328095605', 'RYZ1014', 'Atarah Wanjiku Hungi', 7, 7, 1, 27200, 0, 27200, 0, 27200, '0021234088', 'D8DE9H', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 06:56:05', 1, '2022-03-28 06:56:05', NULL, NULL),
(15, 1, 'hw9mq-o6kkr-jcd2u-ms5k2-nyjiy-dqej-20220328095940', 'RYZ1015', 'Kate Kakoi', 7, 7, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 06:59:40', 1, '2022-03-28 06:59:40', NULL, NULL),
(16, 1, 'uzpjv-tcnwt-rsteh-7q314-vll2b-hrwi-20220328100052', 'RYZ1016', 'Garvril Awori', 7, 7, 1, 27200, 0, 27200, 0, 27200, NULL, 'R3JFS7', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 07:00:52', 1, '2022-03-28 07:00:52', NULL, NULL),
(17, 1, '9wnhd-05s0f-ijxw6-k1tr9-o6sqh-32nq-20220328100351', 'RYZ1017', 'Hadassah Hawi', 7, 7, 1, 27200, 0, 27200, 0, 27200, '0371215367', 'V7YAWN', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 07:03:52', 1, '2022-03-28 07:03:52', NULL, NULL),
(18, 1, 'k65aq-7ylus-lbsed-rqwco-3exj9-1383-20220328100606', 'RYZ1018', 'Francis Wamukoya Murunga', 7, 7, 1, 42400, 15200, 27200, 0, 42400, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:22:27', 1, '2022-03-29 11:22:27', NULL, NULL),
(19, 1, 'fptuj-uywfa-ixogu-anlft-1sbix-kht2-20220328102117', 'RYZ1019', 'Shanelle Angaya', 7, 7, 1, 24700, 0, 24700, 0, 24700, '0371119218', 'GH4XXV', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:19:30', 1, '2022-03-29 20:19:30', NULL, NULL),
(20, 1, 'vdip1-vtzth-fuyul-rrklh-mzned-sgfk-20220328102257', 'RYZ1020', 'Paula Mudenyo', 7, 7, 1, 31900, 4700, 27200, 0, 31900, '0371221638', 'VWXG29', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:36:56', 1, '2022-03-29 11:36:56', NULL, NULL),
(21, 1, 'p5jta-vygly-i4zz2-2ljup-h1ilv-j2hv-20220328102430', 'RYZ1021', 'Omar Ndirangu Kariuki', 7, 7, 1, 27200, 0, 27200, 0, 27200, '0371832096', '42JVJU', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 07:24:30', 1, '2022-03-28 07:24:30', NULL, NULL),
(22, 6, 'btrbq-cyuuf-ouwnf-3p23b-fdep5-izrd-20220328102835', 'RYZ1022', 'Paul Tumaini Ochieng', 7, 7, 1, 27200, 0, 27200, 0, 27200, '0661605802', 'RHAMZ7', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 07:28:36', 1, '2022-03-28 07:28:36', NULL, NULL),
(23, 1, 'geyif-3ul68-byncs-dsen6-agnj5-lhkt-20220328103111', 'RYZ1023', 'Magdaline Atieno Otieno', 7, 7, 1, 27200, 0, 27200, 0, 27200, '0371204965', '7PNNUW', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 07:31:11', 1, '2022-03-28 07:31:11', NULL, NULL),
(24, 7, 'iueh2-1tidc-0xdgq-5miso-kvjm3-whqv-20220328103720', 'RYZ1024', 'Shawn Precious Matala', 7, 7, 1, 34000, 6800, 27200, 0, 34000, NULL, '', 1, '2013-07-02', '2021-10-05', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:29:03', 1, '2022-03-29 11:29:03', NULL, NULL),
(25, 1, 'rq6yz-z61ua-m5sta-gyegx-abh12-bppu-20220328103948', 'RYZ1025', 'Andrew Waliaula', 7, 7, 1, 27200, 0, 27200, 0, 27200, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 07:39:49', 1, '2022-03-28 07:39:49', NULL, NULL),
(26, 1, 'xqogn-5yuok-tquh8-kpngp-y4yvy-bb8i-20220328104157', 'RYZ1026', 'Chantel Eseli', 6, 6, 1, 27000, 0, 27000, 0, 27000, '1441317762', 'SZSWGE', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:04:17', 1, '2022-03-29 20:04:17', NULL, NULL),
(27, 8, 'e0rye-tv4dk-45asw-wqvuo-lp2da-lrzc-20220328104849', 'RYZ1027', 'Malcom Wamocha', 6, 6, 1, 35200, 200, 35000, 0, 35200, '1311321565', 'DCBZ5D', 1, '2013-10-30', '2018-09-01', NULL, NULL, 2, 'YES', 3, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:01:53', 1, '2022-03-29 20:01:53', NULL, NULL),
(28, 9, '0lp1m-owtjn-oemrx-oid38-zpvk3-siej-20220328105655', 'RYZ1028', 'Cadence Mich', 6, 6, 1, 34000, 0, 34000, 0, 34000, '0371404926', 'UYSZB2', 2, '2013-04-11', '2017-02-01', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 07:56:55', 1, '2022-03-28 07:56:55', NULL, NULL),
(29, 1, 'gsofv-das7t-gwrkn-scipb-ajh6g-wci0-20220328110220', 'RYZ1029', 'Sifa Nafula', 6, 6, 1, 35700, 8500, 27200, 0, 35700, '0371410248', 'VESJC9', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:27:53', 1, '2022-03-29 11:27:53', NULL, NULL),
(30, 10, 'ani8x-6ua1p-vbvdz-xploy-vk47n-pvkv-20220328110710', 'RYZ1030', 'Alpha Meydad Shamshudin', 6, 6, 1, 34900, 900, 34000, 0, 34900, '0371310251', 'MNC8KQ', 1, '2013-04-30', '2016-11-04', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:00:11', 1, '2022-03-29 20:00:11', NULL, NULL),
(31, 11, 'rigjq-o2aw7-vdsre-o7bpm-4wbng-xybj-20220328111151', 'RYZ1031', 'Ryanna Richards', 6, 6, 1, 27200, 0, 27200, 0, 27200, '0371402188', 'RY7CF6', 2, '2014-01-16', '2016-10-24', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 08:11:51', 1, '2022-03-28 08:11:51', NULL, NULL),
(32, 1, 'lmqdc-irdch-navpw-4bcg3-sooeg-bmj1-20220328111327', 'RYZ1032', 'Brandon Kiprotich', 6, 6, 1, 27200, 0, 27200, 0, 27200, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 08:13:28', 1, '2022-03-28 08:13:28', NULL, NULL),
(33, 12, 'mb2ks-j86ar-zkaop-ef9pr-wsfoq-9sz5-20220328111740', 'RYZ1033', 'Lameck Wasike', 6, 6, 1, 51400, 17400, 34000, 0, 51400, NULL, 'KGERRZ', 1, '2012-05-26', '2019-05-15', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:20:50', 1, '2022-03-29 11:20:50', NULL, NULL),
(34, 1, '4glcq-ecfmj-ctmbv-wugpk-2op1k-063t-20220328111923', 'RYZ1034', 'Rumaysa Abdulahi', 6, 6, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 08:19:23', 1, '2022-03-28 08:19:23', NULL, NULL),
(35, 1, 'qg5hg-oakkm-l4nrn-tf1di-chmie-5wrq-20220328112121', 'RYZ1035', 'Jansen Odari', 6, 6, 1, 47200, 20000, 27200, 0, 47200, '0371325320', '6X3XYT', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:19:29', 1, '2022-03-29 11:19:29', NULL, NULL),
(36, 13, 'xrqk9-2oo84-i8pg2-qzrme-tfhkn-qhji-20220328112507', 'RYZ1036', 'Jacob Mandela', 6, 6, 1, 37800, 10600, 27200, 0, 37800, NULL, '8JFCCW', 1, '2013-06-28', '2017-05-18', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:26:51', 1, '2022-03-29 11:26:51', NULL, NULL),
(37, 14, '4rnlo-vvxzc-wz8m8-ryrn3-dalvi-uqmw-20220328112945', 'RYZ1037', 'Japheth Simiyu', 6, 6, 1, 34000, 0, 34000, 0, 34000, NULL, '9KXU8U', 1, '2013-05-11', '2017-05-18', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 08:29:45', 1, '2022-03-28 08:29:45', NULL, NULL),
(38, 1, 'k6gdo-mehwt-pgkbc-abuz7-at6sc-tpsi-20220328161423', 'RYZ1038', 'Garlina Amani', 6, 6, 1, 52200, 25000, 27200, 0, 52200, NULL, '9686WQ', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:18:24', 1, '2022-03-29 11:18:24', NULL, NULL),
(39, 15, 'mxrwn-mmyjd-kg6jq-sqbvg-bc5ja-w21p-20220328162512', 'RYZ1039', 'Ligami Hashem Mwilitsa', 5, 5, 1, 34000, 0, 34000, 0, 34000, '03714109176', 'HVPRBR', 1, '2014-04-22', '2021-03-22', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 13:25:12', 1, '2022-03-28 13:25:12', NULL, NULL),
(40, 16, 'x8dxd-9swug-lnkcz-5oyt0-jrmpq-9o7d-20220328163420', 'RYZ1040', 'Emmanuel Kigen', 5, 5, 1, 26300, 0, 26300, 0, 26300, NULL, '', 1, '2015-07-09', '2021-06-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:09:26', 1, '2022-03-29 20:09:26', NULL, NULL),
(41, 17, 'vmbsp-gypti-dvn2b-riixu-gb2hj-gc7l-20220328164231', 'RYZ1041', 'Ronnie Kokwo Pkasa', 5, 5, 1, 27200, 0, 27200, 0, 27200, '1441419902', 'H6FCHP', 1, '2014-01-17', '2018-01-17', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 13:42:31', 1, '2022-03-28 13:42:31', NULL, NULL),
(42, 18, 'vy9vu-ur9zn-arf2r-gsnea-xrnls-ktxe-20220328164833', 'RYZ1042', 'Dean Lowel Ngome', 5, 5, 1, 33600, 0, 33600, 0, 33600, '1441414868', 'MVR2N3', 1, '2014-10-23', '2021-01-15', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:06:51', 1, '2022-03-29 20:06:51', NULL, NULL),
(43, 19, 'vgmma-oes74-1mhdw-1wjo5-1hopm-p3y2-20220328165247', 'RYZ1043', 'Kimberly Gumo', 5, 5, 1, 30600, 3400, 27200, 0, 30600, NULL, '', 2, '2014-06-20', '2016-08-03', NULL, 'Toll', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:39:43', 1, '2022-03-29 11:39:43', NULL, NULL),
(44, 20, 'eicgg-lhc2f-50als-d2mxf-dfp9u-bhvo-20220328165600', 'RYZ1044', 'Mambo Roman', 5, 5, 1, 35000, 0, 35000, 0, 35000, '1441421133', '', 1, '2014-11-29', '2017-05-06', NULL, 'Kiminini', 2, 'YES', 3, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 13:56:00', 1, '2022-03-28 13:56:00', NULL, NULL),
(45, 21, '4ytqd-udb0y-n7wzy-snsst-bwma9-myua-20220328171007', 'RYZ1045', 'Ira Rit Mich', 5, 5, 1, 27200, 0, 27200, 0, 27200, '0371426089', 'VY66A8', 1, '2014-10-10', '2018-02-05', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 14:10:07', 1, '2022-03-28 14:10:07', NULL, NULL),
(46, 22, 'iialy-zafso-krsb4-v2plw-0wabs-6rht-20220328171620', 'RYZ1046', 'Jerome Siya', 5, 5, 1, 27200, 0, 27200, 0, 27200, '0371506733', 'UP2RZB', 1, '2014-10-14', '2018-01-22', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 14:16:20', 1, '2022-03-28 14:16:20', NULL, NULL),
(47, 23, 'k3omp-ezmj4-65b7z-h6bc1-dx0jw-we6w-20220328172243', 'RYZ1047', 'Nyongesa Dorcus Nafula', 5, 5, 1, 35000, 0, 35000, 0, 35000, '0371406512', 'J3CHCJ', 2, '2013-03-23', '2017-07-12', NULL, NULL, 2, 'YES', 3, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 14:22:43', 1, '2022-03-28 14:22:43', NULL, NULL),
(48, 1, 'jbbip-p9x5z-iqp5p-wshhy-kfcsl-rdrg-20220328172533', 'RYZ1048', 'Amara Dorcas Nyamogo', 5, 5, 1, 27200, 0, 27200, 0, 27200, '2614143408', '8XKJAR', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 14:25:33', 1, '2022-03-28 14:25:33', NULL, NULL),
(49, 24, 'zpdtp-n66t6-aqytw-sngvl-gkywl-vfio-20220328174628', 'RYZ1049', 'Chemwili Keen', 5, 5, 1, 33000, 0, 33000, 0, 33000, '0371411252', 'NQEK9M', 1, '2014-05-26', '2017-03-05', NULL, NULL, 2, 'YES', 1, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 14:46:30', 1, '2022-03-28 14:46:30', NULL, NULL),
(50, 1, '8sufx-sfcfd-g60ls-v2xg1-aoeab-ewey-20220328174839', 'RYZ1050', 'Cynthia Kakoi', 5, 5, 1, 27200, 0, 27200, 0, 27200, '0371425180', 'CN7DJG', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 14:48:40', 1, '2022-03-28 14:48:40', NULL, NULL),
(51, 25, 'vwhpn-1fkwl-54vwm-dzsld-0o0yi-9zue-20220328175403', 'RYZ1051', 'Joygift Chepkwemoi', 5, 5, 1, 10200, 0, 10200, 0, 10200, '0371506974', 'Y65Z26', 2, '2014-12-31', '2021-06-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 3, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 14:54:05', 1, '2022-03-28 14:54:05', NULL, NULL),
(52, 26, '714zx-civh0-lgdtt-qj1yz-0caae-nmbg-20220328210850', 'RYZ1052', 'Ahman Arafat', 5, 5, 1, 27200, 0, 27200, 0, 27200, '2737246', '6C69DK', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 18:08:50', 1, '2022-03-28 18:08:50', NULL, NULL),
(53, 1, 'uoe3r-w9f7x-m3xxo-bbkuf-zq4f9-5zkp-20220328211027', 'RYZ1053', 'Jayden Macharia Mutai', 5, 5, 1, 27200, 0, 27200, 0, 27200, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 18:10:28', 1, '2022-03-28 18:10:28', NULL, NULL),
(54, 27, '8uvju-05ukg-jm80m-uqa7k-bcudu-fxwn-20220328211614', 'RYZ1054', 'Dylan Abuga', 5, 5, 1, 34000, 0, 34000, 0, 34000, '261489275', 'N2Q7XG', 1, '2014-08-26', '2020-06-01', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 18:16:14', 1, '2022-03-28 18:16:14', NULL, NULL),
(55, 1, 'tdv3c-cbbxd-e6yl5-6cj7i-tsbuz-bwfa-20220328212408', 'RYZ1055', 'Darryl Prince Awori', 5, 5, 1, 27200, 0, 27200, 0, 27200, '261472811', '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 18:24:09', 1, '2022-03-28 18:24:09', NULL, NULL),
(56, 28, 'pae2a-aqw34-wxv1k-a5uhi-hmqge-n0kq-20220328213049', 'RYZ1056', 'Giddel Gift', 5, 5, 1, 28650, 0, 28650, 0, 28650, '0371507359', 'MN5QVT', 1, '2015-05-01', '2018-04-01', NULL, NULL, 2, 'YES', 1, 1, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 18:30:50', 1, '2022-03-28 18:30:50', NULL, NULL),
(57, 29, '4mpie-1dk0d-bh8dz-01yyn-vncei-kxhk-20220328213840', 'RYZ1057', 'Aliciah Nyokabi Kazungu', 5, 5, 1, 25700, 0, 25700, 0, 25700, '0371519668', 'VRFGTM', 2, '2015-04-22', '2018-05-21', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:17:04', 1, '2022-03-29 20:17:04', NULL, NULL),
(58, 1, '2vg0q-ih7yz-ipqwg-oontp-ckcmf-hu6d-20220328214112', 'RYZ1058', 'Nehemiah Cheruiyot', 5, 5, 1, 33100, 5900, 27200, 0, 33100, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:30:59', 1, '2022-03-29 11:30:59', NULL, NULL),
(59, 30, 'tue1m-stqgy-6abvo-qu0yd-qwotv-nsei-20220328214857', 'RYZ1059', 'Amani Nicole Akinyi Omondi', 5, 5, 1, 32600, 0, 32600, 0, 32600, '0041423770', '4MCV6W', 2, '2014-08-29', '2019-05-13', NULL, NULL, 2, 'YES', 1, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:07:46', 1, '2022-03-29 20:07:46', NULL, NULL),
(60, 31, 'zmwog-or56j-e27zh-qtqrx-e66bl-ofl7-20220328215806', 'RYZ1060', 'Arthur Musyoka Mutua', 5, 5, 1, 27200, 0, 27200, 0, 27200, '0371425960', '', 1, '2014-06-19', '2021-11-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 18:58:06', 1, '2022-03-28 18:58:06', NULL, NULL),
(61, 32, 'uod83-w9tva-7rrjl-kitr3-khvhi-ku17-20220328220507', 'RYZ1061', 'Angel Marie Esmeralda', 5, 5, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2015-03-02', '2021-01-13', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 19:05:07', 1, '2022-03-28 19:05:07', NULL, NULL),
(62, 33, 's6knn-pso3t-hzddn-9utrb-xrmx4-gmqy-20220328222146', 'RYZ1062', 'Maison Kibet Koech', 5, 5, 1, 25800, 0, 25800, 0, 25800, '0291401752', 'SAHX9C', 1, '2014-03-13', '2021-07-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:13:33', 1, '2022-03-29 20:13:33', NULL, NULL),
(63, 34, 'hfdbv-e8jd8-fcsqc-0l4nw-blurp-oito-20220328222648', 'RYZ1063', 'Renitta Chemtai Ngetich', 5, 5, 1, 27200, 0, 27200, 0, 27200, '1441505069', 'GDSF8V', 2, '2015-06-01', '2021-06-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 19:26:48', 1, '2022-03-28 19:26:48', NULL, NULL),
(64, 35, '5sbp7-ruyss-cn7xc-okyoz-8rrlq-jhfg-20220328223524', 'RYZ1064', 'Precious Mary Otieno', 5, 5, 1, 27200, 0, 27200, 0, 27200, '0251513096', '5CH87A', 2, '2015-07-07', '2021-07-29', NULL, 'Kibomet', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 19:35:24', 1, '2022-03-28 19:35:24', NULL, NULL),
(65, 1, 'svnls-wob2y-mnm3i-b647s-wtx16-23br-20220328223903', 'RYZ1065', 'Adrian Kiptoo', 5, 5, 1, 27200, 0, 27200, 0, 27200, '0371406455', 'YPZKSB', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 19:39:03', 1, '2022-03-28 19:39:03', NULL, NULL),
(66, 36, 'sfv9q-p22y9-z8uzd-1wlx9-i73vs-njgi-20220328224616', 'RYZ1066', 'Phelda Khisa', 5, 5, 1, 23900, 0, 23900, 0, 23900, '380761', '8K5TE7', 2, '2013-06-26', '2021-06-28', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:21:37', 1, '2022-03-29 20:21:37', NULL, NULL),
(67, 37, 'lncr5-caz3o-r62gb-xwu29-xly2q-gdlf-20220328225139', 'RYZ1067', 'Carson Kiprop', 5, 5, 1, 34000, 0, 34000, 0, 34000, NULL, '', 1, '2013-07-31', '2021-06-07', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 19:51:39', 1, '2022-03-28 19:51:39', NULL, NULL),
(68, 1, 'bz3tu-x1mcp-qvcdp-bpl2e-h28ht-qkf0-20220328225558', 'RYZ1068', 'Hopesheryl Waliaula', 5, 5, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 19:55:59', 1, '2022-03-28 19:55:59', NULL, NULL),
(69, 1, 'nej5l-treeu-xjvc3-qiyzd-f3vn4-d5jq-20220328225908', 'RYZ1069', 'Gabrielle Ruby Amondi', 4, 4, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 19:59:08', 1, '2022-03-28 19:59:08', NULL, NULL),
(70, 1, 'p2hvo-iv0mv-6ei2f-fkmpe-d9oik-zfum-20220328230147', 'RYZ1070', 'Sammy Ombisa', 4, 4, 1, 27200, 0, 27200, 0, 27200, '0371526934', 'GB6WUF', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 20:01:47', 1, '2022-03-28 20:01:47', NULL, NULL),
(71, 38, 'kpyyj-ctbmq-9vssz-7vyjq-uhtel-kx5q-20220328230651', 'RYZ1071', 'Ranelle Favour Pkemoi', 4, 4, 1, 27200, 0, 27200, 0, 27200, NULL, 'GV688Q', 2, '2015-06-06', '2018-10-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 20:06:51', 1, '2022-03-28 20:06:51', NULL, NULL),
(72, 39, 'sn47e-5utdg-9akzd-xha4l-dlzca-gat7-20220328231413', 'RYZ1072', 'Rei Sakia', 4, 4, 1, 26800, 0, 26800, 0, 26800, '1441508200', 'U85S8S', 1, '2015-07-04', '2018-11-30', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:05:44', 1, '2022-03-29 20:05:44', NULL, NULL),
(73, 21, 'uyy8r-ppm9x-3thpk-ixct8-1j3vs-syhz-20220328231841', 'RYZ1073', 'Ilia Amaya Amor', 4, 4, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2016-02-13', '2019-09-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 20:18:41', 1, '2022-03-28 20:18:41', NULL, NULL),
(74, 40, 'vavlf-g0hlm-n3w2q-w3rfl-qxo2t-zdp2-20220328233457', 'RYZ1074', 'Layne Nyamoita Chweya', 4, 4, 1, 34000, 0, 34000, 0, 34000, '0371512685', 'BANTTV', 2, '2015-02-13', '2019-01-14', NULL, 'Section 19', 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 20:34:58', 1, '2022-03-28 20:34:58', NULL, NULL),
(75, 41, 'psbhe-mhs4x-3eolm-vbkyi-exafb-mzr9-20220328234032', 'RYZ1075', 'Priscillah Shujaa', 4, 4, 1, 31900, 0, 31900, 0, 31900, NULL, '', 2, '2015-10-20', '2019-04-22', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:17:53', 1, '2022-03-29 20:17:53', NULL, NULL),
(76, 42, 'k4hc3-oanba-orayo-3asu6-kn02q-foes-20220328234807', 'RYZ1076', 'Natalie Wanjiru Murugami', 4, 4, 1, 34000, 0, 34000, 0, 34000, '0391806199', 'QKG7S9', 2, '2016-01-21', '2019-04-09', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 20:48:07', 1, '2022-03-28 20:48:07', NULL, NULL),
(77, 43, 'yzpwo-3gzyi-nhbqg-mnz7t-xmjsx-qmgc-20220328235258', 'RYZ1077', 'Netania Nabalayo Makokha', 4, 4, 1, 27200, 0, 27200, 0, 27200, NULL, '', 2, '2015-05-31', '2022-05-31', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 20:52:58', 1, '2022-03-28 20:52:58', NULL, NULL),
(78, 1, '6dtba-dqbgb-yylda-1rqqa-2hlw7-ae7b-20220328235529', 'RYZ1078', 'Alpha Curu Chege', 4, 4, 1, 27200, 0, 27200, 0, 27200, '1441505093', '57F8E7', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 20:55:29', 1, '2022-03-28 20:55:29', NULL, NULL),
(79, 44, 'fla9x-zzrxf-ynuub-iu12w-z0zeb-j7d5-20220329000104', 'RYZ1079', 'Joyline Njoki', 4, 4, 1, 57500, 30300, 27200, 0, 57500, NULL, '79NS8V', 2, '2015-08-13', '2020-09-01', NULL, 'Milimani', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:14:09', 1, '2022-03-29 11:14:09', NULL, NULL),
(80, 45, 'anq64-yw79b-ub65k-esg6i-fc120-ahl5-20220329000713', 'RYZ1080', 'Jillian Vugutsa', 4, 4, 1, 27200, 0, 27200, 0, 27200, '0371601847', 'NA48AE', 2, '2016-01-30', '2021-12-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:07:13', 1, '2022-03-28 21:07:13', NULL, NULL),
(81, 46, 'bsbiq-u5oaa-txjla-zvjxi-43ezq-bwiw-20220329001325', 'RYZ1081', 'Ezra Muhanda', 4, 4, 1, 27200, 0, 27200, 0, 27200, '0371523179', 'V5U8JG', 1, '2015-08-17', '2019-08-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 21:13:26', 1, '2022-03-28 21:13:26', NULL, NULL),
(82, 6, 'mrbyk-junb9-jeutt-sn8ws-yewxm-3oaf-20220329001832', 'RYZ1082', 'Precious Zawadi Ochieng', 4, 4, 1, 27200, 0, 27200, 0, 27200, '0371523171', '2NJ7E5', 2, '2015-08-17', '2019-01-14', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:18:32', 1, '2022-03-28 21:18:32', NULL, NULL),
(83, 47, 'ni4a5-clwbx-vg5ib-ykj5h-8vj5i-o5pl-20220329002504', 'RYZ1083', 'Olive Kapten', 4, 4, 1, 35000, 0, 35000, 0, 35000, '1198F/2018', 'PBM5XY', 2, '2015-09-16', '2021-01-27', NULL, NULL, 2, 'YES', 3, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:25:04', 1, '2022-03-28 21:25:04', NULL, NULL),
(84, 48, 'bx62w-km4pa-rvc6h-0kvmf-cfvsf-6xte-20220329003000', 'RYZ1084', 'Tamara Arisah Ongaro', 4, 4, 1, 27200, 0, 27200, 0, 27200, '0371604006', 'BXY6Q9', 2, '2016-09-02', '2021-03-17', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:30:01', 1, '2022-03-28 21:30:01', NULL, NULL),
(85, 2, 'g0ynl-uiopy-hypbg-qwnbf-ib1kx-sti8-20220329003250', 'RYZ1085', 'Naya Omachi', 4, 4, 1, 27200, 0, 27200, 0, 27200, '2615117000', '6A2465', 2, '2015-10-14', '2021-05-12', NULL, 'Kibomet', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:36:24', 1, '2022-03-28 21:36:24', NULL, NULL),
(86, 4, 'emuv0-wbofu-ieflr-xci5t-yzq1w-hgyi-20220329003546', 'RYZ1086', 'Tyler Raphael Wegesa', 4, 4, 1, 39600, 12400, 27200, 0, 39600, NULL, '', 1, '2015-05-09', '2021-07-28', NULL, 'Milimani', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:24:20', 1, '2022-03-29 11:24:20', NULL, NULL),
(87, 35, 'pzhas-26igh-rurel-daaar-lzqrb-dydh-20220329003942', 'RYZ1087', 'Victorious Benevolence Otieno', 4, 4, 1, 26800, 0, 26800, 0, 26800, '0371700636', '6ZFV37', 2, '2016-12-11', '2021-07-29', NULL, 'Kibomet', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:06:16', 1, '2022-03-29 20:06:16', NULL, NULL),
(88, 49, 'eekyw-0v5qt-g3ir1-8iuhl-db1dz-rkre-20220329004715', 'RYZ1088', 'Kimberly Miriam', 4, 4, 1, 25000, 0, 25000, 0, 25000, '0371519663', '6X3XY', 2, '2015-08-05', '2022-03-26', NULL, 'Kiminini', 2, 'YES', 3, 2, NULL, 4, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:47:15', 1, '2022-03-28 21:47:15', NULL, NULL),
(89, 1, 'tiz15-rjqtp-lsw80-oltec-sao6v-htjg-20220329005028', 'RYZ1089', 'Chloe Wanjiru', 4, 4, 1, 17200, 0, 17200, 0, 17200, '0371603963', 'D2N2XF', 2, '2016-01-20', '2022-01-06', NULL, 'Kiminini', 2, 'NO', NULL, NULL, NULL, 4, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:50:28', 1, '2022-03-28 21:50:28', NULL, NULL),
(90, 1, 'qvprt-jdale-gnn50-2zvoj-wzyjk-4s7z-20220329005213', 'RYZ1090', 'Arafat Amadi', 4, 4, 1, 30200, 3000, 27200, 0, 30200, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 14:48:54', 1, '2022-03-29 14:48:54', NULL, NULL),
(91, 50, 'mwbu7-wpp1l-sooqn-idmb9-atwyj-8meu-20220329005754', 'RYZ1091', 'Deborah Pendo Oyugi', 3, 3, 1, 33500, 0, 33500, 0, 33500, '0371607424', '', 2, '2022-03-26', '2019-01-23', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 21:57:55', 1, '2022-03-28 21:57:55', NULL, NULL),
(92, 51, 'h82zg-6srxl-d5tsd-zbjzk-0vgba-mjuu-20220329010819', 'RYZ1092', 'Kelsey Nawire Masika', 3, 3, 1, 28400, 0, 28400, 0, 28400, '0371841907', 'EVV6BR', 2, '2017-02-06', '2021-04-01', NULL, NULL, 2, 'YES', 2, 1, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 22:11:46', 1, '2022-03-28 22:11:46', NULL, NULL),
(93, 36, 'y7io4-wibgy-rdaba-dq4zn-lsz2m-uzgj-20220329011614', 'RYZ1093', 'Peace Pendo Murunga', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371613524', '5GPRF6', 2, '2016-09-15', '2019-07-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 22:16:15', 1, '2022-03-28 22:16:15', NULL, NULL),
(94, 52, 'lmyur-nnrhl-ubhps-geswj-3wffl-siav-20220329012306', 'RYZ1094', 'Natasha Kerubo Makori', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371708061', '', 2, '2017-05-31', '2021-02-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 22:23:07', 1, '2022-03-28 22:23:07', NULL, NULL),
(95, 1, '2c0po-tlvox-aulvs-0hizw-3p1rn-muzs-20220329012633', 'RYZ1095', 'Adrian Otube', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 22:26:34', 1, '2022-03-28 22:26:34', NULL, NULL),
(96, 1, 'tsj6r-5k2sj-yb8p4-sqsj9-aeyz0-d6is-20220329013052', 'RYZ1096', 'Jollande Pendo Zonneveld', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371712703', 'TDKSJY', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 22:30:52', 1, '2022-03-28 22:30:52', NULL, NULL),
(97, 53, 'byh4d-qwayu-kyisn-ihyre-efbfp-jkuq-20220329013723', 'RYZ1097', 'Jayden Wanjala', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2016-07-05', '2021-06-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 22:37:23', 1, '2022-03-28 22:37:23', NULL, NULL),
(98, 25, 'ukjia-3pxko-zssxp-ytsqo-j574z-jfpi-20220329014110', 'RYZ1098', 'Ryan Rotich', 3, 3, 1, 11450, 1750, 9700, 0, 11450, '0501703916', 'NWZ5JB', 1, '2017-12-01', '2021-05-01', NULL, 'Sinendet', 2, 'NO', NULL, NULL, NULL, 3, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 14:50:44', 1, '2022-03-29 14:50:44', NULL, NULL),
(99, 54, 'ynz3x-yqhwh-cc2zu-svzaj-ilsyq-pzsc-20220329014553', 'RYZ1099', 'Una Mvula', 3, 3, 1, 14700, 0, 14700, 0, 14700, '0371712431', 'VKBCTN', 2, '2016-12-21', '2019-04-01', NULL, 'Milimani', 2, 'NO', NULL, NULL, NULL, 2, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 22:45:54', 1, '2022-03-28 22:45:54', NULL, NULL),
(100, 55, 't7zxg-r5qso-stc9p-ctdj0-6cgg8-7tsm-20220329015221', 'RYZ1100', 'Darnelle Williams Jepkorir', 3, 3, 1, 23200, 0, 23200, 0, 23200, '0371707037', 'U2PZ6P', 2, '2017-05-19', '2021-06-07', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:22:19', 1, '2022-03-29 20:22:19', NULL, NULL),
(101, 34, '3ftpa-0desz-9rgeu-9e6bn-ccow2-ugcj-20220329015829', 'RYZ1101', 'Emmanuel Kipchumba Ngetich', 3, 3, 1, 26700, 0, 26700, 0, 26700, '1441708660', 'RQ7QWC', 1, '2017-05-18', '2021-06-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 22:58:29', 1, '2022-03-28 22:58:29', NULL, NULL),
(102, 56, 'y7xqd-ccz0i-pkonx-8tigm-sk5g2-87rf-20220329020354', 'RYZ1102', 'Kirsty Nanyama Otube', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 2, '2018-02-22', '2021-07-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-28 23:03:54', 1, '2022-03-28 23:03:54', NULL, NULL),
(103, 57, 'lisga-hxhvo-7lavm-triet-rhlbd-tpzh-20220329021157', 'RYZ1103', 'Roy Kipkemboi', 3, 3, 1, 33500, 0, 33500, 0, 33500, '0371819343', '3TE2Z7', 1, '2018-02-25', '2021-07-01', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-28 23:11:58', 1, '2022-03-28 23:11:58', NULL, NULL),
(104, 30, 'rpmqs-qgwbi-vti7d-6fw0v-yxzko-d640-20220329021525', 'RYZ1104', 'Taraji Tiffany Atieno Omondi', 3, 3, 1, 32100, 0, 32100, 0, 32100, NULL, '', 2, '2016-06-19', '2020-01-13', NULL, NULL, 2, 'YES', 1, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:05:00', 1, '2022-03-29 20:05:00', NULL, NULL),
(105, 58, 'vaezk-gimyw-ixbat-6jiob-as2dv-igbg-20220329103634', 'RYZ1105', 'Imran Abdullahi', 3, 3, 1, 28150, 0, 28150, 0, 28150, NULL, '', 1, '2017-02-27', '2019-12-18', NULL, 'Sinendet', 2, 'YES', 1, 1, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 07:36:34', 1, '2022-03-29 07:36:34', NULL, NULL),
(106, 59, 'butzl-jti0c-vifl3-mqmoe-ctasj-ytmr-20220329104038', 'RYZ1106', 'Dylan Mutiso', 3, 3, 1, 44100, 11600, 32500, 0, 44100, '0371611419', 'SV34HN', 1, '2016-08-10', '2020-01-14', NULL, NULL, 2, 'YES', 1, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:25:28', 1, '2022-03-29 11:25:28', NULL, NULL),
(107, 60, 'ketth-s8tao-53837-jucg3-pxvir-dneo-20220329104951', 'RYZ1107', 'Ashlee Chepkorir Kiptoo', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371712562', '9J5TF4', 2, '2017-09-26', '2021-01-21', NULL, 'Sinendet', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 07:49:51', 1, '2022-03-29 07:49:51', NULL, NULL),
(108, 61, 'njswr-bpim7-oejlx-fqhui-lt6o7-tsmu-20220329105524', 'RYZ1108', 'Brian Enock Imbuye', 3, 3, 1, 11150, 0, 11150, 0, 11150, '0371615100', '7NN3SA', 1, '2016-05-10', '2021-11-01', NULL, NULL, 2, 'YES', 1, 1, NULL, 3, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 07:55:25', 1, '2022-03-29 07:55:25', NULL, NULL),
(109, 62, 'ohkcs-ssqwo-w2fiq-nusot-74jwo-96rh-20220329105906', 'RYZ1109', 'Shantel Njeri Kimtai', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0361715957', 'HW3GZ4', 2, '2017-10-21', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 07:59:06', 1, '2022-03-29 07:59:06', NULL, NULL),
(110, 63, '4vsmd-poogr-ntjbk-gjlvf-jt15v-mjw8-20220329110507', 'RYZ1110', 'Alexandra Malya', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371706594', 'YU2ZAA', 2, '2017-03-19', '2021-01-13', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 08:05:07', 1, '2022-03-29 08:05:07', NULL, NULL),
(111, 64, 'vuzda-0a38y-ieyq4-e2jzv-dad3m-xlvm-20220329110920', 'RYZ1111', 'Kayleen Hadassah', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371710964', '', 2, '2017-08-26', '2021-11-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 08:09:20', 1, '2022-03-29 08:09:20', NULL, NULL),
(112, 1, 'me4is-dlpen-spgcq-131ze-jwpyw-xkv4-20220329111902', 'RYZ1112', 'Eliana Murunga', 3, 3, 1, 39150, 12450, 26700, 0, 39150, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:23:22', 1, '2022-03-29 11:23:22', NULL, NULL),
(113, 65, 'bbmgp-lywne-nph6q-iidpx-sb4fj-sccs-20220329112417', 'RYZ1113', 'Agatha Ngina Katunge', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 2, '2017-07-07', '2021-12-01', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 08:24:17', 1, '2022-03-29 08:24:17', NULL, NULL),
(114, 1, 'feloz-dzbze-jcvai-0x6pv-lan27-kdw1-20220329112610', 'RYZ1114', 'Courtney Wandabwa', 3, 3, 1, 42500, 15800, 26700, 0, 42500, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:21:41', 1, '2022-03-29 11:21:41', NULL, NULL),
(115, 1, '9sz7p-bsdoh-r75bd-tt8jy-wxkjm-chfl-20220329112805', 'RYZ1115', 'Samuel Kigen', 3, 3, 1, 26700, 0, 26700, 0, 26700, '1441612554', 'N2MPSV', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 08:28:06', 1, '2022-03-29 08:28:06', NULL, NULL),
(116, 66, 'kndqu-4k6us-qxkqs-tvzlx-gvn5q-hoj2-20220329113319', 'RYZ1116', 'Ayla Knight Odhiambo', 3, 3, 1, 32200, 0, 32200, 0, 32200, NULL, '', 2, '2017-09-27', '2021-01-02', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:12:22', 1, '2022-03-29 20:12:22', NULL, NULL),
(117, 67, 'jona1-qqh9i-obf9n-qnbe6-dctoe-nfxj-20220329113751', 'RYZ1117', 'Walter Nyajong Ouma', 3, 3, 1, 33400, 0, 33400, 0, 33400, '0021808584', '', 1, '2017-12-17', '2021-05-17', NULL, NULL, 2, 'YES', 3, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:11:38', 1, '2022-03-29 20:11:38', NULL, NULL),
(118, 68, 'v0xth-vtwlp-lwe66-m9wne-nbsef-hny9-20220329114232', 'RYZ1118', 'Haven Imani', 3, 3, 1, 26700, 0, 26700, 0, 26700, '7032559', 'HZUFQB', 2, '2016-10-10', '2021-05-13', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 08:42:32', 1, '2022-03-29 08:42:32', NULL, NULL),
(119, 69, 'dwzsv-1vus1-sjqtt-clqqg-vo8m6-fgga-20220329114744', 'RYZ1119', 'Ellis Rieko Odhiambo', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371701791', '', 1, '2017-01-14', '2021-05-17', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 08:47:44', 1, '2022-03-29 08:47:44', NULL, NULL),
(120, 3, 'ljwss-ngdcq-k3fbl-9i7nh-z0qnc-fp2s-20220329115017', 'RYZ1120', 'Presley Kegode Ijimba', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371707936', 'UAYWPG', 1, '2017-04-21', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 08:50:18', 1, '2022-03-29 08:50:18', NULL, NULL),
(121, 70, '23lao-czpsr-xmady-krnyz-v5ftj-n5us-20220329120119', 'RYZ1121', 'Precious Favour Walter', 3, 3, 1, 26700, 0, 26700, 0, 26700, '2617141417', 'PMBBNS', 2, '2017-11-26', '2021-07-29', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 09:01:19', 1, '2022-03-29 09:01:19', NULL, NULL),
(122, 22, 'rxzpe-zqvvy-r6yc3-dkduy-48r0i-2lae-20220329120648', 'RYZ1122', 'Shanice Kakii Cheptoo', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371715768', 'JDHYFU', 2, '2017-10-15', '2021-08-02', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 09:06:48', 1, '2022-03-29 09:06:48', NULL, NULL),
(123, 71, 'g1u8s-yuahw-dcrzo-1j3om-nqy7r-n8rj-20220329121503', 'RYZ1123', 'Audrey Moraa Momanyi', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0731906659', 'SGXFPJ', 2, '2016-06-04', '2021-07-28', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 09:15:03', 1, '2022-03-29 09:15:03', NULL, NULL),
(124, 72, 'x1zwd-9rp4y-thlbn-jlj0j-sqwwg-isrf-20220329122206', 'RYZ1124', 'Victor Ndegwa', 3, 3, 1, 30500, 0, 30500, 0, 30500, NULL, '', 1, '2017-07-19', '2021-07-17', NULL, NULL, 2, 'YES', 2, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:20:47', 1, '2022-03-29 20:20:47', NULL, NULL),
(125, 73, '94zjx-q1or9-vlxmo-ml6ev-lemkc-4akc-20220329122854', 'RYZ1125', 'Christian Jabali', 3, 3, 1, 9800, 0, 9800, 0, 9800, '0891701118', 'D32NE5', 1, '2017-01-09', '2021-07-02', NULL, 'Milimani', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:23:06', 1, '2022-03-29 20:23:06', NULL, NULL),
(126, 1, 'pxriw-59mmn-3048y-e88sk-3t04m-awv1-20220329123144', 'RYZ1126', 'Azriel Nyakundi', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 09:31:44', 1, '2022-03-29 09:31:44', NULL, NULL),
(127, 1, 'kn3q8-olvvw-xbmaz-x0jjj-egvfw-2arh-20220329123329', 'RYZ1127', 'Ivan Jairus Ochieng', 3, 3, 1, 26700, 0, 26700, 0, 26700, '0371706627', '8FF76G', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 09:33:30', 1, '2022-03-29 09:33:30', NULL, NULL),
(128, 47, 'ozo51-9n4vt-spmet-gq0ca-t21lo-ue14-20220329123657', 'RYZ1128', 'Elsa Kapten', 3, 3, 1, 40900, 6400, 34500, 0, 40900, '0371708695', '', 2, '2017-03-10', '2021-08-16', NULL, NULL, 2, 'YES', 3, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 11:30:03', 1, '2022-03-29 11:30:03', NULL, NULL),
(129, 74, 'dl586-dsfto-ks5p2-mm8ty-byphh-ckdy-20220329124434', 'RYZ1129', 'George Nyangate', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2017-06-04', '2020-01-20', NULL, 'Kibomet', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 09:44:34', 1, '2022-03-29 09:44:34', NULL, NULL),
(130, 75, 'yrckk-qtcui-ryi9p-odiva-jdtsu-3crk-20220329124827', 'RYZ1130', 'Matthews Waititu', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2017-01-06', '2022-01-06', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 09:48:27', 1, '2022-03-29 09:48:27', NULL, NULL),
(131, 76, 'l9yzr-3qe2o-vvwag-lzcej-eitis-n2sn-20220329125312', 'RYZ1131', 'Alvin Wekesa Likoko', 3, 3, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2015-12-08', '2021-08-17', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 09:53:12', 1, '2022-03-29 09:53:12', NULL, NULL),
(132, 77, '9a62s-mzejg-vvxqp-ypbj7-7nwnn-xtzw-20220329125704', 'RYZ1132', 'Ryan Daniel Obare', 3, 3, 1, 31450, 4750, 26700, 0, 31450, NULL, '', 1, '2017-09-13', '2022-01-10', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:35:06', 1, '2022-03-29 11:35:06', NULL, NULL),
(133, 78, 'q1p6p-xgehv-rzxfe-a6vzt-g3cux-p6tc-20220329130143', 'RYZ1133', 'Tamara Cheptoyek', 2, 2, 1, 29200, 2500, 26700, 0, 29200, '1441818401', '', 2, '2018-02-01', '2021-07-27', NULL, 'Ngeywo', 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 14:49:33', 1, '2022-03-29 14:49:33', NULL, NULL),
(134, 1, '5ehuq-alqv1-nuhuo-olq26-kcuzq-6s95-20220329130630', 'RYZ1134', 'Naima Nathalie', 2, 2, 1, 26700, 0, 26700, 0, 26700, NULL, '', 2, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 10:09:11', 1, '2022-03-29 10:09:11', NULL, NULL),
(135, 9, 'z6pbv-6m5me-xmxlp-gm1q0-zpuuy-xr05-20220329131358', 'RYZ1135', 'Kendra Gweth', 2, 2, 1, 34500, 0, 34500, 0, 34500, NULL, '', 2, '2018-04-02', '2021-03-08', NULL, NULL, 2, 'YES', 3, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 10:13:58', 1, '2022-03-29 10:13:58', NULL, NULL),
(136, 38, 'fqyep-ihtcj-s9cos-kskx3-qrkae-vcu8-20220329131847', 'RYZ1136', 'Reana Megan', 2, 2, 1, 26700, 0, 26700, 0, 26700, NULL, '', 2, '2018-04-27', '2021-11-08', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 10:18:47', 1, '2022-03-29 10:18:47', NULL, NULL),
(137, 1, 'mby1i-exvmg-fzxjy-uukuq-9uhuy-c9x8-20220329132216', 'RYZ1137', 'Ethan Korir', 2, 2, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 10:22:17', 1, '2022-03-29 10:22:17', NULL, NULL),
(138, 1, 'mdpv3-ik1gh-4qard-jjv5i-5mv4g-4r7i-20220329132427', 'RYZ1138', 'Kylian Miheso Khisa', 2, 2, 1, 32000, 5300, 26700, 0, 32000, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 11:32:46', 1, '2022-03-29 11:32:46', NULL, NULL),
(139, 79, 't3ch1-3badx-wvzo1-b851s-4aqhv-vufv-20220329135210', 'RYZ1139', 'Jerome Louie', 2, 2, 1, 32500, 0, 32500, 0, 32500, '0371839420', '', 1, '2018-09-01', '2021-10-27', NULL, NULL, 2, 'YES', 1, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 10:55:16', 1, '2022-03-29 10:55:16', NULL, NULL),
(140, 1, 'llnm8-frsg2-ykfou-nliup-jhlsz-xey0-20220329135409', 'RYZ1140', 'Daniel Baraka Oyugi', 2, 2, 1, 26700, 0, 26700, 0, 26700, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 10:54:09', 1, '2022-03-29 10:54:09', NULL, NULL),
(141, 1, 'l3rnm-bvxwt-w6due-yk1gx-9sua7-ucob-20220329135645', 'RYZ1141', 'Ethan Kibet', 2, 2, 1, 26800, 100, 26700, 0, 26800, NULL, '', 1, '2022-03-26', '2022-03-26', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:02:32', 1, '2022-03-29 20:02:32', NULL, NULL),
(142, 29, 'meijm-qlfoe-arb8z-zulnf-z0ipb-9gnv-20220329140052', 'RYZ1142', 'Ethan Mwangi Kazungu', 2, 2, 1, 26120, 0, 26120, 0, 26120, '1441823482', '', 1, '2018-06-10', '2022-01-09', NULL, NULL, 2, 'NO', NULL, NULL, NULL, 1, 'primary_contact', 1, 'storage/students\\male.png', 1, 1, '2022-03-29 20:08:20', 1, '2022-03-29 20:08:20', NULL, NULL),
(143, 80, 'b1ecl-ras1l-vwom7-dvz0e-hzewk-efa3-20220329141104', 'RYZ1143', 'Hadassah Shialuma Wanekea', 2, 2, 1, 32900, 400, 32500, 0, 32900, NULL, '', 2, '2018-05-20', '2021-01-17', NULL, 'Norec', 2, 'YES', 1, 2, NULL, 1, 'primary_contact', 1, 'storage/students\\female.png', 1, 1, '2022-03-29 20:00:55', 1, '2022-03-29 20:00:55', NULL, NULL);

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
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_fees`
--

INSERT INTO `student_fees` (`id`, `student_id`, `current_session_id`, `fee_parameter_id`, `description`, `class_grade_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 1, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-26 15:29:31', NULL, NULL, NULL, NULL),
(2, 1, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-26 15:29:31', NULL, NULL, NULL, NULL),
(3, 1, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-26 15:29:31', NULL, NULL, NULL, NULL),
(4, 1, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-26 15:29:31', NULL, NULL, NULL, NULL),
(5, 1, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-26 15:29:31', NULL, NULL, NULL, NULL),
(6, 1, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-26 15:29:31', NULL, NULL, NULL, NULL),
(7, 2, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:15:59', NULL, NULL, NULL, NULL),
(8, 2, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:16:00', NULL, NULL, NULL, NULL),
(9, 2, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:16:00', NULL, NULL, NULL, NULL),
(10, 2, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:16:00', NULL, NULL, NULL, NULL),
(11, 2, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:16:00', NULL, NULL, NULL, NULL),
(12, 2, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:16:00', NULL, NULL, NULL, NULL),
(13, 3, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:17:26', NULL, NULL, NULL, NULL),
(14, 3, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:17:26', NULL, NULL, NULL, NULL),
(15, 3, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:17:26', NULL, NULL, NULL, NULL),
(16, 3, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:17:27', NULL, NULL, NULL, NULL),
(17, 3, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:17:27', NULL, NULL, NULL, NULL),
(18, 3, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:17:27', NULL, NULL, NULL, NULL),
(19, 4, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:19:23', NULL, NULL, NULL, NULL),
(20, 4, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:19:23', NULL, NULL, NULL, NULL),
(21, 4, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:19:23', NULL, NULL, NULL, NULL),
(22, 4, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:19:23', NULL, NULL, NULL, NULL),
(23, 4, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:19:23', NULL, NULL, NULL, NULL),
(24, 4, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:19:23', NULL, NULL, NULL, NULL),
(25, 5, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:21:04', NULL, NULL, NULL, NULL),
(26, 5, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:21:04', NULL, NULL, NULL, NULL),
(27, 5, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:21:04', NULL, NULL, NULL, NULL),
(28, 5, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:21:04', NULL, NULL, NULL, NULL),
(29, 5, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:21:04', NULL, NULL, NULL, NULL),
(30, 5, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:21:04', NULL, NULL, NULL, NULL),
(31, 6, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:22:48', NULL, NULL, NULL, NULL),
(32, 6, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:22:48', NULL, NULL, NULL, NULL),
(33, 6, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:22:48', NULL, NULL, NULL, NULL),
(34, 6, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:22:48', NULL, NULL, NULL, NULL),
(35, 6, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:22:48', NULL, NULL, NULL, NULL),
(36, 6, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:22:48', NULL, NULL, NULL, NULL),
(37, 7, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:28:02', NULL, NULL, NULL, NULL),
(38, 7, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:28:02', NULL, NULL, NULL, NULL),
(39, 7, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:28:02', NULL, NULL, NULL, NULL),
(40, 7, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:28:02', NULL, NULL, NULL, NULL),
(41, 7, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:28:02', NULL, NULL, NULL, NULL),
(42, 7, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:28:02', NULL, NULL, NULL, NULL),
(43, 8, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:35:30', NULL, NULL, NULL, NULL),
(44, 8, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:35:30', NULL, NULL, NULL, NULL),
(45, 8, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:35:30', NULL, NULL, NULL, NULL),
(46, 8, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:35:30', NULL, NULL, NULL, NULL),
(47, 8, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:35:30', NULL, NULL, NULL, NULL),
(48, 8, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:35:30', NULL, NULL, NULL, NULL),
(49, 9, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:40:18', NULL, NULL, NULL, NULL),
(50, 9, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:40:18', NULL, NULL, NULL, NULL),
(51, 9, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:40:18', NULL, NULL, NULL, NULL),
(52, 9, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:40:18', NULL, NULL, NULL, NULL),
(53, 9, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:40:18', NULL, NULL, NULL, NULL),
(54, 9, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:40:18', NULL, NULL, NULL, NULL),
(55, 10, 1, 1, 'General Fee', 8, 12500, 1, 1, '2022-03-28 06:48:29', NULL, NULL, NULL, NULL),
(56, 10, 1, 2, 'General Fee', 8, 1500, 1, 1, '2022-03-28 06:48:29', NULL, NULL, NULL, NULL),
(57, 10, 1, 3, 'General Fee', 8, 6000, 1, 1, '2022-03-28 06:48:29', NULL, NULL, NULL, NULL),
(58, 10, 1, 4, 'General Fee', 8, 2000, 1, 1, '2022-03-28 06:48:29', NULL, NULL, NULL, NULL),
(59, 10, 1, 8, 'General Fee', 8, 2500, 1, 1, '2022-03-28 06:48:29', NULL, NULL, NULL, NULL),
(60, 10, 1, 9, 'General Fee', 8, 2700, 1, 1, '2022-03-28 06:48:29', NULL, NULL, NULL, NULL),
(61, 11, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 06:50:50', NULL, NULL, NULL, NULL),
(62, 11, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 06:50:50', NULL, NULL, NULL, NULL),
(63, 11, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 06:50:50', NULL, NULL, NULL, NULL),
(64, 11, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 06:50:50', NULL, NULL, NULL, NULL),
(65, 11, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 06:50:50', NULL, NULL, NULL, NULL),
(66, 11, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 06:50:50', NULL, NULL, NULL, NULL),
(67, 12, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 06:52:56', NULL, NULL, NULL, NULL),
(68, 12, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 06:52:56', NULL, NULL, NULL, NULL),
(69, 12, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 06:52:56', NULL, NULL, NULL, NULL),
(70, 12, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 06:52:56', NULL, NULL, NULL, NULL),
(71, 12, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 06:52:56', NULL, NULL, NULL, NULL),
(72, 12, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 06:52:56', NULL, NULL, NULL, NULL),
(73, 13, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 06:54:19', NULL, NULL, NULL, NULL),
(74, 13, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 06:54:19', NULL, NULL, NULL, NULL),
(75, 13, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 06:54:19', NULL, NULL, NULL, NULL),
(76, 13, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 06:54:19', NULL, NULL, NULL, NULL),
(77, 13, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 06:54:19', NULL, NULL, NULL, NULL),
(78, 13, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 06:54:19', NULL, NULL, NULL, NULL),
(79, 14, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 06:56:05', NULL, NULL, NULL, NULL),
(80, 14, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 06:56:05', NULL, NULL, NULL, NULL),
(81, 14, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 06:56:05', NULL, NULL, NULL, NULL),
(82, 14, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 06:56:05', NULL, NULL, NULL, NULL),
(83, 14, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 06:56:05', NULL, NULL, NULL, NULL),
(84, 14, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 06:56:05', NULL, NULL, NULL, NULL),
(85, 15, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 06:59:40', NULL, NULL, NULL, NULL),
(86, 15, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 06:59:40', NULL, NULL, NULL, NULL),
(87, 15, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 06:59:40', NULL, NULL, NULL, NULL),
(88, 15, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 06:59:40', NULL, NULL, NULL, NULL),
(89, 15, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 06:59:40', NULL, NULL, NULL, NULL),
(90, 15, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 06:59:40', NULL, NULL, NULL, NULL),
(91, 16, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:00:52', NULL, NULL, NULL, NULL),
(92, 16, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:00:52', NULL, NULL, NULL, NULL),
(93, 16, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:00:52', NULL, NULL, NULL, NULL),
(94, 16, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:00:52', NULL, NULL, NULL, NULL),
(95, 16, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:00:52', NULL, NULL, NULL, NULL),
(96, 16, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:00:52', NULL, NULL, NULL, NULL),
(97, 17, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:03:51', NULL, NULL, NULL, NULL),
(98, 17, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:03:52', NULL, NULL, NULL, NULL),
(99, 17, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:03:52', NULL, NULL, NULL, NULL),
(100, 17, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:03:52', NULL, NULL, NULL, NULL),
(101, 17, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:03:52', NULL, NULL, NULL, NULL),
(102, 17, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:03:52', NULL, NULL, NULL, NULL),
(103, 18, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:06:06', NULL, NULL, NULL, NULL),
(104, 18, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:06:06', NULL, NULL, NULL, NULL),
(105, 18, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:06:06', NULL, NULL, NULL, NULL),
(106, 18, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:06:06', NULL, NULL, NULL, NULL),
(107, 18, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:06:06', NULL, NULL, NULL, NULL),
(108, 18, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:06:06', NULL, NULL, NULL, NULL),
(109, 19, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:21:17', NULL, NULL, NULL, NULL),
(110, 19, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:21:17', NULL, NULL, NULL, NULL),
(111, 19, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:21:17', NULL, NULL, NULL, NULL),
(112, 19, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:21:17', NULL, NULL, NULL, NULL),
(113, 19, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:21:17', NULL, NULL, NULL, NULL),
(114, 19, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:21:17', NULL, NULL, NULL, NULL),
(115, 20, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:22:57', NULL, NULL, NULL, NULL),
(116, 20, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:22:57', NULL, NULL, NULL, NULL),
(117, 20, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:22:57', NULL, NULL, NULL, NULL),
(118, 20, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:22:57', NULL, NULL, NULL, NULL),
(119, 20, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:22:58', NULL, NULL, NULL, NULL),
(120, 20, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:22:58', NULL, NULL, NULL, NULL),
(121, 21, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:24:30', NULL, NULL, NULL, NULL),
(122, 21, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:24:30', NULL, NULL, NULL, NULL),
(123, 21, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:24:30', NULL, NULL, NULL, NULL),
(124, 21, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:24:30', NULL, NULL, NULL, NULL),
(125, 21, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:24:30', NULL, NULL, NULL, NULL),
(126, 21, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:24:30', NULL, NULL, NULL, NULL),
(127, 22, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:28:35', NULL, NULL, NULL, NULL),
(128, 22, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:28:35', NULL, NULL, NULL, NULL),
(129, 22, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:28:36', NULL, NULL, NULL, NULL),
(130, 22, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:28:36', NULL, NULL, NULL, NULL),
(131, 22, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:28:36', NULL, NULL, NULL, NULL),
(132, 22, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:28:36', NULL, NULL, NULL, NULL),
(133, 23, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:31:11', NULL, NULL, NULL, NULL),
(134, 23, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:31:11', NULL, NULL, NULL, NULL),
(135, 23, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:31:11', NULL, NULL, NULL, NULL),
(136, 23, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:31:11', NULL, NULL, NULL, NULL),
(137, 23, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:31:11', NULL, NULL, NULL, NULL),
(138, 23, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:31:11', NULL, NULL, NULL, NULL),
(139, 24, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:37:20', NULL, NULL, NULL, NULL),
(140, 24, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:37:20', NULL, NULL, NULL, NULL),
(141, 24, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:37:20', NULL, NULL, NULL, NULL),
(142, 24, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:37:21', NULL, NULL, NULL, NULL),
(143, 24, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:37:21', NULL, NULL, NULL, NULL),
(144, 24, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:37:21', NULL, NULL, NULL, NULL),
(145, 25, 1, 1, 'General Fee', 7, 12500, 1, 1, '2022-03-28 07:39:48', NULL, NULL, NULL, NULL),
(146, 25, 1, 2, 'General Fee', 7, 1500, 1, 1, '2022-03-28 07:39:48', NULL, NULL, NULL, NULL),
(147, 25, 1, 3, 'General Fee', 7, 6000, 1, 1, '2022-03-28 07:39:48', NULL, NULL, NULL, NULL),
(148, 25, 1, 4, 'General Fee', 7, 2000, 1, 1, '2022-03-28 07:39:48', NULL, NULL, NULL, NULL),
(149, 25, 1, 8, 'General Fee', 7, 2500, 1, 1, '2022-03-28 07:39:48', NULL, NULL, NULL, NULL),
(150, 25, 1, 9, 'General Fee', 7, 2700, 1, 1, '2022-03-28 07:39:48', NULL, NULL, NULL, NULL),
(157, 26, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 07:43:14', NULL, '2022-03-28 07:43:14', NULL, NULL),
(158, 26, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 07:43:14', NULL, '2022-03-28 07:43:14', NULL, NULL),
(159, 26, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 07:43:14', NULL, '2022-03-28 07:43:14', NULL, NULL),
(160, 26, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 07:43:14', NULL, '2022-03-28 07:43:14', NULL, NULL),
(161, 26, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 07:43:14', NULL, '2022-03-28 07:43:14', NULL, NULL),
(162, 26, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 07:43:14', NULL, '2022-03-28 07:43:14', NULL, NULL),
(163, 27, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 07:48:49', NULL, NULL, NULL, NULL),
(164, 27, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 07:48:49', NULL, NULL, NULL, NULL),
(165, 27, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 07:48:49', NULL, NULL, NULL, NULL),
(166, 27, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 07:48:49', NULL, NULL, NULL, NULL),
(167, 27, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 07:48:49', NULL, NULL, NULL, NULL),
(168, 27, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 07:48:49', NULL, NULL, NULL, NULL),
(169, 28, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 07:56:55', NULL, NULL, NULL, NULL),
(170, 28, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 07:56:55', NULL, NULL, NULL, NULL),
(171, 28, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 07:56:55', NULL, NULL, NULL, NULL),
(172, 28, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 07:56:55', NULL, NULL, NULL, NULL),
(173, 28, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 07:56:55', NULL, NULL, NULL, NULL),
(174, 28, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 07:56:55', NULL, NULL, NULL, NULL),
(175, 29, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:02:20', NULL, NULL, NULL, NULL),
(176, 29, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:02:20', NULL, NULL, NULL, NULL),
(177, 29, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:02:20', NULL, NULL, NULL, NULL),
(178, 29, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:02:20', NULL, NULL, NULL, NULL),
(179, 29, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:02:20', NULL, NULL, NULL, NULL),
(180, 29, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:02:20', NULL, NULL, NULL, NULL),
(181, 30, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:07:10', NULL, NULL, NULL, NULL),
(182, 30, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:07:10', NULL, NULL, NULL, NULL),
(183, 30, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:07:10', NULL, NULL, NULL, NULL),
(184, 30, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:07:10', NULL, NULL, NULL, NULL),
(185, 30, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:07:10', NULL, NULL, NULL, NULL),
(186, 30, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:07:10', NULL, NULL, NULL, NULL),
(187, 31, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:11:51', NULL, NULL, NULL, NULL),
(188, 31, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:11:51', NULL, NULL, NULL, NULL),
(189, 31, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:11:51', NULL, NULL, NULL, NULL),
(190, 31, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:11:51', NULL, NULL, NULL, NULL),
(191, 31, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:11:51', NULL, NULL, NULL, NULL),
(192, 31, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:11:51', NULL, NULL, NULL, NULL),
(193, 32, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:13:27', NULL, NULL, NULL, NULL),
(194, 32, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:13:27', NULL, NULL, NULL, NULL),
(195, 32, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:13:27', NULL, NULL, NULL, NULL),
(196, 32, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:13:27', NULL, NULL, NULL, NULL),
(197, 32, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:13:27', NULL, NULL, NULL, NULL),
(198, 32, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:13:27', NULL, NULL, NULL, NULL),
(199, 33, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:17:40', NULL, NULL, NULL, NULL),
(200, 33, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:17:40', NULL, NULL, NULL, NULL),
(201, 33, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:17:40', NULL, NULL, NULL, NULL),
(202, 33, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:17:40', NULL, NULL, NULL, NULL),
(203, 33, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:17:40', NULL, NULL, NULL, NULL),
(204, 33, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:17:40', NULL, NULL, NULL, NULL),
(205, 34, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:19:23', NULL, NULL, NULL, NULL),
(206, 34, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:19:23', NULL, NULL, NULL, NULL),
(207, 34, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:19:23', NULL, NULL, NULL, NULL),
(208, 34, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:19:23', NULL, NULL, NULL, NULL),
(209, 34, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:19:23', NULL, NULL, NULL, NULL),
(210, 34, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:19:23', NULL, NULL, NULL, NULL),
(211, 35, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:21:21', NULL, NULL, NULL, NULL),
(212, 35, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:21:21', NULL, NULL, NULL, NULL),
(213, 35, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:21:21', NULL, NULL, NULL, NULL),
(214, 35, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:21:21', NULL, NULL, NULL, NULL),
(215, 35, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:21:21', NULL, NULL, NULL, NULL),
(216, 35, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:21:21', NULL, NULL, NULL, NULL),
(217, 36, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:25:07', NULL, NULL, NULL, NULL),
(218, 36, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:25:07', NULL, NULL, NULL, NULL),
(219, 36, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:25:07', NULL, NULL, NULL, NULL),
(220, 36, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:25:07', NULL, NULL, NULL, NULL),
(221, 36, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:25:07', NULL, NULL, NULL, NULL),
(222, 36, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:25:07', NULL, NULL, NULL, NULL),
(223, 37, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 08:29:45', NULL, NULL, NULL, NULL),
(224, 37, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 08:29:45', NULL, NULL, NULL, NULL),
(225, 37, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 08:29:45', NULL, NULL, NULL, NULL),
(226, 37, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 08:29:45', NULL, NULL, NULL, NULL),
(227, 37, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 08:29:45', NULL, NULL, NULL, NULL),
(228, 37, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 08:29:45', NULL, NULL, NULL, NULL),
(229, 38, 1, 1, 'General Fee', 6, 12500, 1, 1, '2022-03-28 13:14:23', NULL, NULL, NULL, NULL),
(230, 38, 1, 2, 'General Fee', 6, 1500, 1, 1, '2022-03-28 13:14:23', NULL, NULL, NULL, NULL),
(231, 38, 1, 3, 'General Fee', 6, 6000, 1, 1, '2022-03-28 13:14:23', NULL, NULL, NULL, NULL),
(232, 38, 1, 4, 'General Fee', 6, 2000, 1, 1, '2022-03-28 13:14:23', NULL, NULL, NULL, NULL),
(233, 38, 1, 8, 'General Fee', 6, 2500, 1, 1, '2022-03-28 13:14:23', NULL, NULL, NULL, NULL),
(234, 38, 1, 9, 'General Fee', 6, 2700, 1, 1, '2022-03-28 13:14:23', NULL, NULL, NULL, NULL),
(235, 39, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 13:25:12', NULL, NULL, NULL, NULL),
(236, 39, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 13:25:12', NULL, NULL, NULL, NULL),
(237, 39, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 13:25:12', NULL, NULL, NULL, NULL),
(238, 39, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 13:25:12', NULL, NULL, NULL, NULL),
(239, 39, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 13:25:12', NULL, NULL, NULL, NULL),
(240, 39, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 13:25:12', NULL, NULL, NULL, NULL),
(241, 40, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 13:34:20', NULL, NULL, NULL, NULL),
(242, 40, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 13:34:20', NULL, NULL, NULL, NULL),
(243, 40, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 13:34:20', NULL, NULL, NULL, NULL),
(244, 40, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 13:34:20', NULL, NULL, NULL, NULL),
(245, 40, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 13:34:20', NULL, NULL, NULL, NULL),
(246, 40, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 13:34:20', NULL, NULL, NULL, NULL),
(247, 41, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 13:42:31', NULL, NULL, NULL, NULL),
(248, 41, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 13:42:31', NULL, NULL, NULL, NULL),
(249, 41, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 13:42:31', NULL, NULL, NULL, NULL),
(250, 41, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 13:42:31', NULL, NULL, NULL, NULL),
(251, 41, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 13:42:31', NULL, NULL, NULL, NULL),
(252, 41, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 13:42:31', NULL, NULL, NULL, NULL),
(253, 42, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 13:48:33', NULL, NULL, NULL, NULL),
(254, 42, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 13:48:33', NULL, NULL, NULL, NULL),
(255, 42, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 13:48:33', NULL, NULL, NULL, NULL),
(256, 42, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 13:48:33', NULL, NULL, NULL, NULL),
(257, 42, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 13:48:33', NULL, NULL, NULL, NULL),
(258, 42, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 13:48:33', NULL, NULL, NULL, NULL),
(259, 43, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 13:52:47', NULL, NULL, NULL, NULL),
(260, 43, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 13:52:47', NULL, NULL, NULL, NULL),
(261, 43, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 13:52:47', NULL, NULL, NULL, NULL),
(262, 43, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 13:52:47', NULL, NULL, NULL, NULL),
(263, 43, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 13:52:47', NULL, NULL, NULL, NULL),
(264, 43, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 13:52:47', NULL, NULL, NULL, NULL),
(265, 44, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 13:56:00', NULL, NULL, NULL, NULL),
(266, 44, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 13:56:00', NULL, NULL, NULL, NULL),
(267, 44, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 13:56:00', NULL, NULL, NULL, NULL),
(268, 44, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 13:56:00', NULL, NULL, NULL, NULL),
(269, 44, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 13:56:00', NULL, NULL, NULL, NULL),
(270, 44, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 13:56:00', NULL, NULL, NULL, NULL),
(271, 45, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 14:10:07', NULL, NULL, NULL, NULL),
(272, 45, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 14:10:07', NULL, NULL, NULL, NULL),
(273, 45, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 14:10:07', NULL, NULL, NULL, NULL),
(274, 45, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 14:10:07', NULL, NULL, NULL, NULL),
(275, 45, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 14:10:07', NULL, NULL, NULL, NULL),
(276, 45, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 14:10:07', NULL, NULL, NULL, NULL),
(277, 46, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 14:16:20', NULL, NULL, NULL, NULL),
(278, 46, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 14:16:20', NULL, NULL, NULL, NULL),
(279, 46, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 14:16:20', NULL, NULL, NULL, NULL),
(280, 46, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 14:16:20', NULL, NULL, NULL, NULL),
(281, 46, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 14:16:20', NULL, NULL, NULL, NULL),
(282, 46, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 14:16:20', NULL, NULL, NULL, NULL),
(283, 47, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 14:22:43', NULL, NULL, NULL, NULL),
(284, 47, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 14:22:43', NULL, NULL, NULL, NULL),
(285, 47, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 14:22:43', NULL, NULL, NULL, NULL),
(286, 47, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 14:22:43', NULL, NULL, NULL, NULL),
(287, 47, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 14:22:43', NULL, NULL, NULL, NULL),
(288, 47, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 14:22:43', NULL, NULL, NULL, NULL),
(289, 48, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 14:25:33', NULL, NULL, NULL, NULL),
(290, 48, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 14:25:33', NULL, NULL, NULL, NULL),
(291, 48, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 14:25:33', NULL, NULL, NULL, NULL),
(292, 48, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 14:25:33', NULL, NULL, NULL, NULL),
(293, 48, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 14:25:33', NULL, NULL, NULL, NULL),
(294, 48, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 14:25:33', NULL, NULL, NULL, NULL),
(295, 49, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 14:46:29', NULL, NULL, NULL, NULL),
(296, 49, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 14:46:29', NULL, NULL, NULL, NULL),
(297, 49, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 14:46:29', NULL, NULL, NULL, NULL),
(298, 49, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 14:46:29', NULL, NULL, NULL, NULL),
(299, 49, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 14:46:29', NULL, NULL, NULL, NULL),
(300, 49, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 14:46:29', NULL, NULL, NULL, NULL),
(301, 50, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 14:48:40', NULL, NULL, NULL, NULL),
(302, 50, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 14:48:40', NULL, NULL, NULL, NULL),
(303, 50, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 14:48:40', NULL, NULL, NULL, NULL),
(304, 50, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 14:48:40', NULL, NULL, NULL, NULL),
(305, 50, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 14:48:40', NULL, NULL, NULL, NULL),
(306, 50, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 14:48:40', NULL, NULL, NULL, NULL),
(307, 51, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 14:54:03', NULL, NULL, NULL, NULL),
(308, 51, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 14:54:03', NULL, NULL, NULL, NULL),
(309, 51, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 14:54:03', NULL, NULL, NULL, NULL),
(310, 51, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 14:54:03', NULL, NULL, NULL, NULL),
(311, 51, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 14:54:04', NULL, NULL, NULL, NULL),
(312, 51, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 14:54:04', NULL, NULL, NULL, NULL),
(313, 52, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:08:50', NULL, NULL, NULL, NULL),
(314, 52, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:08:50', NULL, NULL, NULL, NULL),
(315, 52, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:08:50', NULL, NULL, NULL, NULL),
(316, 52, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:08:50', NULL, NULL, NULL, NULL),
(317, 52, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:08:50', NULL, NULL, NULL, NULL),
(318, 52, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:08:50', NULL, NULL, NULL, NULL),
(319, 53, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:10:27', NULL, NULL, NULL, NULL),
(320, 53, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:10:27', NULL, NULL, NULL, NULL),
(321, 53, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:10:27', NULL, NULL, NULL, NULL),
(322, 53, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:10:27', NULL, NULL, NULL, NULL),
(323, 53, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:10:28', NULL, NULL, NULL, NULL),
(324, 53, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:10:28', NULL, NULL, NULL, NULL),
(325, 54, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:16:14', NULL, NULL, NULL, NULL),
(326, 54, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:16:14', NULL, NULL, NULL, NULL),
(327, 54, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:16:14', NULL, NULL, NULL, NULL),
(328, 54, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:16:14', NULL, NULL, NULL, NULL),
(329, 54, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:16:14', NULL, NULL, NULL, NULL),
(330, 54, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:16:14', NULL, NULL, NULL, NULL),
(331, 55, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:24:09', NULL, NULL, NULL, NULL),
(332, 55, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:24:09', NULL, NULL, NULL, NULL),
(333, 55, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:24:09', NULL, NULL, NULL, NULL),
(334, 55, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:24:09', NULL, NULL, NULL, NULL),
(335, 55, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:24:09', NULL, NULL, NULL, NULL),
(336, 55, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:24:09', NULL, NULL, NULL, NULL),
(337, 56, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:30:49', NULL, NULL, NULL, NULL),
(338, 56, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:30:49', NULL, NULL, NULL, NULL),
(339, 56, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:30:49', NULL, NULL, NULL, NULL),
(340, 56, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:30:49', NULL, NULL, NULL, NULL),
(341, 56, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:30:49', NULL, NULL, NULL, NULL),
(342, 56, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:30:49', NULL, NULL, NULL, NULL),
(343, 57, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:38:40', NULL, NULL, NULL, NULL),
(344, 57, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:38:40', NULL, NULL, NULL, NULL),
(345, 57, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:38:40', NULL, NULL, NULL, NULL),
(346, 57, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:38:40', NULL, NULL, NULL, NULL),
(347, 57, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:38:40', NULL, NULL, NULL, NULL),
(348, 57, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:38:40', NULL, NULL, NULL, NULL),
(349, 58, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:41:12', NULL, NULL, NULL, NULL),
(350, 58, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:41:12', NULL, NULL, NULL, NULL),
(351, 58, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:41:12', NULL, NULL, NULL, NULL),
(352, 58, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:41:12', NULL, NULL, NULL, NULL),
(353, 58, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:41:12', NULL, NULL, NULL, NULL),
(354, 58, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:41:12', NULL, NULL, NULL, NULL),
(355, 59, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:48:57', NULL, NULL, NULL, NULL),
(356, 59, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:48:57', NULL, NULL, NULL, NULL),
(357, 59, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:48:57', NULL, NULL, NULL, NULL),
(358, 59, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:48:57', NULL, NULL, NULL, NULL),
(359, 59, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:48:57', NULL, NULL, NULL, NULL),
(360, 59, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:48:57', NULL, NULL, NULL, NULL),
(361, 60, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 18:58:06', NULL, NULL, NULL, NULL),
(362, 60, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 18:58:06', NULL, NULL, NULL, NULL),
(363, 60, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 18:58:06', NULL, NULL, NULL, NULL),
(364, 60, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 18:58:06', NULL, NULL, NULL, NULL),
(365, 60, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 18:58:06', NULL, NULL, NULL, NULL),
(366, 60, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 18:58:06', NULL, NULL, NULL, NULL),
(367, 61, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:05:07', NULL, NULL, NULL, NULL),
(368, 61, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:05:07', NULL, NULL, NULL, NULL),
(369, 61, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:05:07', NULL, NULL, NULL, NULL),
(370, 61, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:05:07', NULL, NULL, NULL, NULL),
(371, 61, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:05:07', NULL, NULL, NULL, NULL),
(372, 61, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:05:07', NULL, NULL, NULL, NULL),
(373, 62, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:21:46', NULL, NULL, NULL, NULL),
(374, 62, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:21:46', NULL, NULL, NULL, NULL),
(375, 62, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:21:46', NULL, NULL, NULL, NULL),
(376, 62, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:21:46', NULL, NULL, NULL, NULL),
(377, 62, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:21:46', NULL, NULL, NULL, NULL),
(378, 62, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:21:46', NULL, NULL, NULL, NULL),
(379, 63, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:26:48', NULL, NULL, NULL, NULL),
(380, 63, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:26:48', NULL, NULL, NULL, NULL),
(381, 63, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:26:48', NULL, NULL, NULL, NULL),
(382, 63, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:26:48', NULL, NULL, NULL, NULL),
(383, 63, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:26:48', NULL, NULL, NULL, NULL),
(384, 63, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:26:48', NULL, NULL, NULL, NULL),
(385, 64, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:35:24', NULL, NULL, NULL, NULL),
(386, 64, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:35:24', NULL, NULL, NULL, NULL),
(387, 64, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:35:24', NULL, NULL, NULL, NULL),
(388, 64, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:35:24', NULL, NULL, NULL, NULL),
(389, 64, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:35:24', NULL, NULL, NULL, NULL),
(390, 64, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:35:24', NULL, NULL, NULL, NULL),
(391, 65, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:39:03', NULL, NULL, NULL, NULL),
(392, 65, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:39:03', NULL, NULL, NULL, NULL),
(393, 65, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:39:03', NULL, NULL, NULL, NULL),
(394, 65, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:39:03', NULL, NULL, NULL, NULL),
(395, 65, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:39:03', NULL, NULL, NULL, NULL),
(396, 65, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:39:03', NULL, NULL, NULL, NULL),
(397, 66, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:46:16', NULL, NULL, NULL, NULL),
(398, 66, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:46:16', NULL, NULL, NULL, NULL),
(399, 66, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:46:16', NULL, NULL, NULL, NULL),
(400, 66, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:46:16', NULL, NULL, NULL, NULL),
(401, 66, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:46:16', NULL, NULL, NULL, NULL),
(402, 66, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:46:16', NULL, NULL, NULL, NULL),
(403, 67, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:51:39', NULL, NULL, NULL, NULL),
(404, 67, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:51:39', NULL, NULL, NULL, NULL),
(405, 67, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:51:39', NULL, NULL, NULL, NULL),
(406, 67, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:51:39', NULL, NULL, NULL, NULL),
(407, 67, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:51:39', NULL, NULL, NULL, NULL),
(408, 67, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:51:39', NULL, NULL, NULL, NULL),
(409, 68, 1, 1, 'General Fee', 5, 12500, 1, 1, '2022-03-28 19:55:59', NULL, NULL, NULL, NULL),
(410, 68, 1, 2, 'General Fee', 5, 1500, 1, 1, '2022-03-28 19:55:59', NULL, NULL, NULL, NULL),
(411, 68, 1, 3, 'General Fee', 5, 6000, 1, 1, '2022-03-28 19:55:59', NULL, NULL, NULL, NULL),
(412, 68, 1, 4, 'General Fee', 5, 2000, 1, 1, '2022-03-28 19:55:59', NULL, NULL, NULL, NULL),
(413, 68, 1, 8, 'General Fee', 5, 2500, 1, 1, '2022-03-28 19:55:59', NULL, NULL, NULL, NULL),
(414, 68, 1, 9, 'General Fee', 5, 2700, 1, 1, '2022-03-28 19:55:59', NULL, NULL, NULL, NULL),
(415, 69, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 19:59:08', NULL, NULL, NULL, NULL),
(416, 69, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 19:59:08', NULL, NULL, NULL, NULL),
(417, 69, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 19:59:08', NULL, NULL, NULL, NULL),
(418, 69, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 19:59:08', NULL, NULL, NULL, NULL),
(419, 69, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 19:59:08', NULL, NULL, NULL, NULL),
(420, 69, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 19:59:08', NULL, NULL, NULL, NULL),
(421, 70, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:01:47', NULL, NULL, NULL, NULL),
(422, 70, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:01:47', NULL, NULL, NULL, NULL),
(423, 70, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:01:47', NULL, NULL, NULL, NULL),
(424, 70, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:01:47', NULL, NULL, NULL, NULL),
(425, 70, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:01:47', NULL, NULL, NULL, NULL),
(426, 70, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:01:47', NULL, NULL, NULL, NULL),
(427, 71, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:06:51', NULL, NULL, NULL, NULL),
(428, 71, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:06:51', NULL, NULL, NULL, NULL),
(429, 71, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:06:51', NULL, NULL, NULL, NULL),
(430, 71, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:06:51', NULL, NULL, NULL, NULL),
(431, 71, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:06:51', NULL, NULL, NULL, NULL),
(432, 71, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:06:51', NULL, NULL, NULL, NULL),
(433, 72, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:14:13', NULL, NULL, NULL, NULL),
(434, 72, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:14:13', NULL, NULL, NULL, NULL),
(435, 72, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:14:13', NULL, NULL, NULL, NULL),
(436, 72, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:14:13', NULL, NULL, NULL, NULL),
(437, 72, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:14:13', NULL, NULL, NULL, NULL),
(438, 72, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:14:13', NULL, NULL, NULL, NULL),
(439, 73, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:18:41', NULL, NULL, NULL, NULL),
(440, 73, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:18:41', NULL, NULL, NULL, NULL),
(441, 73, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:18:41', NULL, NULL, NULL, NULL),
(442, 73, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:18:41', NULL, NULL, NULL, NULL),
(443, 73, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:18:41', NULL, NULL, NULL, NULL),
(444, 73, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:18:41', NULL, NULL, NULL, NULL),
(445, 74, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:34:58', NULL, NULL, NULL, NULL),
(446, 74, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:34:58', NULL, NULL, NULL, NULL),
(447, 74, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:34:58', NULL, NULL, NULL, NULL),
(448, 74, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:34:58', NULL, NULL, NULL, NULL),
(449, 74, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:34:58', NULL, NULL, NULL, NULL),
(450, 74, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:34:58', NULL, NULL, NULL, NULL),
(451, 75, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:40:32', NULL, NULL, NULL, NULL),
(452, 75, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:40:33', NULL, NULL, NULL, NULL),
(453, 75, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:40:33', NULL, NULL, NULL, NULL),
(454, 75, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:40:33', NULL, NULL, NULL, NULL),
(455, 75, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:40:33', NULL, NULL, NULL, NULL),
(456, 75, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:40:33', NULL, NULL, NULL, NULL),
(457, 76, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:48:07', NULL, NULL, NULL, NULL),
(458, 76, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:48:07', NULL, NULL, NULL, NULL),
(459, 76, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:48:07', NULL, NULL, NULL, NULL),
(460, 76, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:48:07', NULL, NULL, NULL, NULL),
(461, 76, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:48:07', NULL, NULL, NULL, NULL),
(462, 76, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:48:07', NULL, NULL, NULL, NULL),
(463, 77, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:52:58', NULL, NULL, NULL, NULL),
(464, 77, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:52:58', NULL, NULL, NULL, NULL),
(465, 77, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:52:58', NULL, NULL, NULL, NULL),
(466, 77, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:52:58', NULL, NULL, NULL, NULL),
(467, 77, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:52:58', NULL, NULL, NULL, NULL),
(468, 77, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:52:58', NULL, NULL, NULL, NULL),
(469, 78, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 20:55:29', NULL, NULL, NULL, NULL),
(470, 78, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 20:55:29', NULL, NULL, NULL, NULL),
(471, 78, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 20:55:29', NULL, NULL, NULL, NULL),
(472, 78, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 20:55:29', NULL, NULL, NULL, NULL),
(473, 78, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 20:55:29', NULL, NULL, NULL, NULL),
(474, 78, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 20:55:29', NULL, NULL, NULL, NULL),
(475, 79, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:01:04', NULL, NULL, NULL, NULL),
(476, 79, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:01:04', NULL, NULL, NULL, NULL),
(477, 79, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:01:04', NULL, NULL, NULL, NULL),
(478, 79, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:01:04', NULL, NULL, NULL, NULL),
(479, 79, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:01:04', NULL, NULL, NULL, NULL),
(480, 79, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:01:04', NULL, NULL, NULL, NULL),
(481, 80, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:07:13', NULL, NULL, NULL, NULL),
(482, 80, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:07:13', NULL, NULL, NULL, NULL),
(483, 80, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:07:13', NULL, NULL, NULL, NULL),
(484, 80, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:07:13', NULL, NULL, NULL, NULL),
(485, 80, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:07:13', NULL, NULL, NULL, NULL),
(486, 80, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:07:13', NULL, NULL, NULL, NULL),
(487, 81, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:13:25', NULL, NULL, NULL, NULL),
(488, 81, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:13:25', NULL, NULL, NULL, NULL),
(489, 81, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:13:26', NULL, NULL, NULL, NULL),
(490, 81, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:13:26', NULL, NULL, NULL, NULL),
(491, 81, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:13:26', NULL, NULL, NULL, NULL),
(492, 81, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:13:26', NULL, NULL, NULL, NULL),
(493, 82, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:18:32', NULL, NULL, NULL, NULL),
(494, 82, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:18:32', NULL, NULL, NULL, NULL),
(495, 82, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:18:32', NULL, NULL, NULL, NULL),
(496, 82, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:18:32', NULL, NULL, NULL, NULL),
(497, 82, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:18:32', NULL, NULL, NULL, NULL),
(498, 82, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:18:32', NULL, NULL, NULL, NULL),
(499, 83, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:25:04', NULL, NULL, NULL, NULL),
(500, 83, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:25:04', NULL, NULL, NULL, NULL),
(501, 83, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:25:04', NULL, NULL, NULL, NULL),
(502, 83, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:25:04', NULL, NULL, NULL, NULL),
(503, 83, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:25:04', NULL, NULL, NULL, NULL),
(504, 83, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:25:04', NULL, NULL, NULL, NULL),
(505, 84, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:30:00', NULL, NULL, NULL, NULL),
(506, 84, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:30:00', NULL, NULL, NULL, NULL),
(507, 84, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:30:00', NULL, NULL, NULL, NULL),
(508, 84, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:30:00', NULL, NULL, NULL, NULL),
(509, 84, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:30:00', NULL, NULL, NULL, NULL),
(510, 84, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:30:01', NULL, NULL, NULL, NULL),
(511, 85, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:32:50', NULL, NULL, NULL, NULL),
(512, 85, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:32:50', NULL, NULL, NULL, NULL),
(513, 85, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:32:50', NULL, NULL, NULL, NULL),
(514, 85, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:32:50', NULL, NULL, NULL, NULL),
(515, 85, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:32:50', NULL, NULL, NULL, NULL),
(516, 85, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:32:50', NULL, NULL, NULL, NULL),
(517, 86, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:35:46', NULL, NULL, NULL, NULL),
(518, 86, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:35:46', NULL, NULL, NULL, NULL),
(519, 86, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:35:46', NULL, NULL, NULL, NULL),
(520, 86, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:35:46', NULL, NULL, NULL, NULL),
(521, 86, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:35:46', NULL, NULL, NULL, NULL),
(522, 86, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:35:46', NULL, NULL, NULL, NULL),
(523, 87, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:39:42', NULL, NULL, NULL, NULL),
(524, 87, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:39:42', NULL, NULL, NULL, NULL),
(525, 87, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:39:42', NULL, NULL, NULL, NULL),
(526, 87, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:39:42', NULL, NULL, NULL, NULL),
(527, 87, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:39:42', NULL, NULL, NULL, NULL),
(528, 87, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:39:42', NULL, NULL, NULL, NULL),
(529, 88, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(530, 88, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(531, 88, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(532, 88, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(533, 88, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(534, 88, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(535, 89, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:50:28', NULL, NULL, NULL, NULL),
(536, 89, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:50:28', NULL, NULL, NULL, NULL),
(537, 89, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:50:28', NULL, NULL, NULL, NULL),
(538, 89, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:50:28', NULL, NULL, NULL, NULL),
(539, 89, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:50:28', NULL, NULL, NULL, NULL),
(540, 89, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:50:28', NULL, NULL, NULL, NULL),
(541, 90, 1, 1, 'General Fee', 4, 12500, 1, 1, '2022-03-28 21:52:13', NULL, NULL, NULL, NULL),
(542, 90, 1, 2, 'General Fee', 4, 1500, 1, 1, '2022-03-28 21:52:13', NULL, NULL, NULL, NULL),
(543, 90, 1, 3, 'General Fee', 4, 6000, 1, 1, '2022-03-28 21:52:13', NULL, NULL, NULL, NULL),
(544, 90, 1, 4, 'General Fee', 4, 2000, 1, 1, '2022-03-28 21:52:13', NULL, NULL, NULL, NULL),
(545, 90, 1, 8, 'General Fee', 4, 2500, 1, 1, '2022-03-28 21:52:13', NULL, NULL, NULL, NULL),
(546, 90, 1, 9, 'General Fee', 4, 2700, 1, 1, '2022-03-28 21:52:13', NULL, NULL, NULL, NULL);
INSERT INTO `student_fees` (`id`, `student_id`, `current_session_id`, `fee_parameter_id`, `description`, `class_grade_id`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(547, 91, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 21:57:54', NULL, NULL, NULL, NULL),
(548, 91, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 21:57:55', NULL, NULL, NULL, NULL),
(549, 91, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 21:57:55', NULL, NULL, NULL, NULL),
(550, 91, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 21:57:55', NULL, NULL, NULL, NULL),
(551, 91, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 21:57:55', NULL, NULL, NULL, NULL),
(552, 91, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 21:57:55', NULL, NULL, NULL, NULL),
(559, 92, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:11:46', NULL, '2022-03-28 22:11:46', NULL, NULL),
(560, 92, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:11:46', NULL, '2022-03-28 22:11:46', NULL, NULL),
(561, 92, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:11:46', NULL, '2022-03-28 22:11:46', NULL, NULL),
(562, 92, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:11:46', NULL, '2022-03-28 22:11:46', NULL, NULL),
(563, 92, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:11:46', NULL, '2022-03-28 22:11:46', NULL, NULL),
(564, 92, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:11:46', NULL, '2022-03-28 22:11:46', NULL, NULL),
(565, 93, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:16:14', NULL, NULL, NULL, NULL),
(566, 93, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:16:15', NULL, NULL, NULL, NULL),
(567, 93, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:16:15', NULL, NULL, NULL, NULL),
(568, 93, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:16:15', NULL, NULL, NULL, NULL),
(569, 93, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:16:15', NULL, NULL, NULL, NULL),
(570, 93, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:16:15', NULL, NULL, NULL, NULL),
(571, 94, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:23:06', NULL, NULL, NULL, NULL),
(572, 94, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:23:07', NULL, NULL, NULL, NULL),
(573, 94, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:23:07', NULL, NULL, NULL, NULL),
(574, 94, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:23:07', NULL, NULL, NULL, NULL),
(575, 94, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:23:07', NULL, NULL, NULL, NULL),
(576, 94, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:23:07', NULL, NULL, NULL, NULL),
(577, 95, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:26:33', NULL, NULL, NULL, NULL),
(578, 95, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:26:33', NULL, NULL, NULL, NULL),
(579, 95, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:26:33', NULL, NULL, NULL, NULL),
(580, 95, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:26:33', NULL, NULL, NULL, NULL),
(581, 95, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:26:33', NULL, NULL, NULL, NULL),
(582, 95, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:26:34', NULL, NULL, NULL, NULL),
(583, 96, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:30:52', NULL, NULL, NULL, NULL),
(584, 96, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:30:52', NULL, NULL, NULL, NULL),
(585, 96, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:30:52', NULL, NULL, NULL, NULL),
(586, 96, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:30:52', NULL, NULL, NULL, NULL),
(587, 96, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:30:52', NULL, NULL, NULL, NULL),
(588, 96, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:30:52', NULL, NULL, NULL, NULL),
(589, 97, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:37:23', NULL, NULL, NULL, NULL),
(590, 97, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:37:23', NULL, NULL, NULL, NULL),
(591, 97, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:37:23', NULL, NULL, NULL, NULL),
(592, 97, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:37:23', NULL, NULL, NULL, NULL),
(593, 97, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:37:23', NULL, NULL, NULL, NULL),
(594, 97, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:37:23', NULL, NULL, NULL, NULL),
(595, 98, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:41:10', NULL, NULL, NULL, NULL),
(596, 98, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:41:10', NULL, NULL, NULL, NULL),
(597, 98, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:41:10', NULL, NULL, NULL, NULL),
(598, 98, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:41:10', NULL, NULL, NULL, NULL),
(599, 98, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:41:10', NULL, NULL, NULL, NULL),
(600, 98, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:41:10', NULL, NULL, NULL, NULL),
(601, 99, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:45:53', NULL, NULL, NULL, NULL),
(602, 99, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:45:53', NULL, NULL, NULL, NULL),
(603, 99, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:45:53', NULL, NULL, NULL, NULL),
(604, 99, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:45:53', NULL, NULL, NULL, NULL),
(605, 99, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:45:53', NULL, NULL, NULL, NULL),
(606, 99, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:45:53', NULL, NULL, NULL, NULL),
(607, 100, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:52:21', NULL, NULL, NULL, NULL),
(608, 100, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:52:21', NULL, NULL, NULL, NULL),
(609, 100, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:52:21', NULL, NULL, NULL, NULL),
(610, 100, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:52:21', NULL, NULL, NULL, NULL),
(611, 100, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:52:21', NULL, NULL, NULL, NULL),
(612, 100, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:52:21', NULL, NULL, NULL, NULL),
(613, 101, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 22:58:29', NULL, NULL, NULL, NULL),
(614, 101, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:58:29', NULL, NULL, NULL, NULL),
(615, 101, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 22:58:29', NULL, NULL, NULL, NULL),
(616, 101, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 22:58:29', NULL, NULL, NULL, NULL),
(617, 101, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 22:58:29', NULL, NULL, NULL, NULL),
(618, 101, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 22:58:29', NULL, NULL, NULL, NULL),
(619, 102, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 23:03:54', NULL, NULL, NULL, NULL),
(620, 102, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 23:03:54', NULL, NULL, NULL, NULL),
(621, 102, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 23:03:54', NULL, NULL, NULL, NULL),
(622, 102, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 23:03:54', NULL, NULL, NULL, NULL),
(623, 102, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 23:03:54', NULL, NULL, NULL, NULL),
(624, 102, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 23:03:54', NULL, NULL, NULL, NULL),
(625, 103, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 23:11:57', NULL, NULL, NULL, NULL),
(626, 103, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 23:11:57', NULL, NULL, NULL, NULL),
(627, 103, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 23:11:57', NULL, NULL, NULL, NULL),
(628, 103, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 23:11:58', NULL, NULL, NULL, NULL),
(629, 103, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 23:11:58', NULL, NULL, NULL, NULL),
(630, 103, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 23:11:58', NULL, NULL, NULL, NULL),
(631, 104, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-28 23:15:25', NULL, NULL, NULL, NULL),
(632, 104, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-28 23:15:25', NULL, NULL, NULL, NULL),
(633, 104, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-28 23:15:25', NULL, NULL, NULL, NULL),
(634, 104, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-28 23:15:25', NULL, NULL, NULL, NULL),
(635, 104, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-28 23:15:25', NULL, NULL, NULL, NULL),
(636, 104, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-28 23:15:25', NULL, NULL, NULL, NULL),
(637, 105, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 07:36:34', NULL, NULL, NULL, NULL),
(638, 105, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:36:34', NULL, NULL, NULL, NULL),
(639, 105, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 07:36:34', NULL, NULL, NULL, NULL),
(640, 105, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:36:34', NULL, NULL, NULL, NULL),
(641, 105, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 07:36:34', NULL, NULL, NULL, NULL),
(642, 105, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 07:36:34', NULL, NULL, NULL, NULL),
(643, 106, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 07:40:38', NULL, NULL, NULL, NULL),
(644, 106, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:40:38', NULL, NULL, NULL, NULL),
(645, 106, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 07:40:38', NULL, NULL, NULL, NULL),
(646, 106, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:40:38', NULL, NULL, NULL, NULL),
(647, 106, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 07:40:38', NULL, NULL, NULL, NULL),
(648, 106, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 07:40:38', NULL, NULL, NULL, NULL),
(649, 107, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 07:49:51', NULL, NULL, NULL, NULL),
(650, 107, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:49:51', NULL, NULL, NULL, NULL),
(651, 107, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 07:49:51', NULL, NULL, NULL, NULL),
(652, 107, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:49:51', NULL, NULL, NULL, NULL),
(653, 107, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 07:49:51', NULL, NULL, NULL, NULL),
(654, 107, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 07:49:51', NULL, NULL, NULL, NULL),
(655, 108, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL),
(656, 108, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL),
(657, 108, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL),
(658, 108, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL),
(659, 108, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL),
(660, 108, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL),
(661, 109, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 07:59:06', NULL, NULL, NULL, NULL),
(662, 109, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:59:06', NULL, NULL, NULL, NULL),
(663, 109, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 07:59:06', NULL, NULL, NULL, NULL),
(664, 109, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 07:59:06', NULL, NULL, NULL, NULL),
(665, 109, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 07:59:06', NULL, NULL, NULL, NULL),
(666, 109, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 07:59:06', NULL, NULL, NULL, NULL),
(667, 110, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:05:07', NULL, NULL, NULL, NULL),
(668, 110, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:05:07', NULL, NULL, NULL, NULL),
(669, 110, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:05:07', NULL, NULL, NULL, NULL),
(670, 110, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:05:07', NULL, NULL, NULL, NULL),
(671, 110, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:05:07', NULL, NULL, NULL, NULL),
(672, 110, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:05:07', NULL, NULL, NULL, NULL),
(673, 111, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:09:20', NULL, NULL, NULL, NULL),
(674, 111, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:09:20', NULL, NULL, NULL, NULL),
(675, 111, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:09:20', NULL, NULL, NULL, NULL),
(676, 111, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:09:20', NULL, NULL, NULL, NULL),
(677, 111, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:09:20', NULL, NULL, NULL, NULL),
(678, 111, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:09:20', NULL, NULL, NULL, NULL),
(679, 112, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:19:02', NULL, NULL, NULL, NULL),
(680, 112, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:19:02', NULL, NULL, NULL, NULL),
(681, 112, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:19:02', NULL, NULL, NULL, NULL),
(682, 112, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:19:02', NULL, NULL, NULL, NULL),
(683, 112, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:19:02', NULL, NULL, NULL, NULL),
(684, 112, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:19:02', NULL, NULL, NULL, NULL),
(685, 113, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:24:17', NULL, NULL, NULL, NULL),
(686, 113, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:24:17', NULL, NULL, NULL, NULL),
(687, 113, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:24:17', NULL, NULL, NULL, NULL),
(688, 113, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:24:17', NULL, NULL, NULL, NULL),
(689, 113, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:24:17', NULL, NULL, NULL, NULL),
(690, 113, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:24:17', NULL, NULL, NULL, NULL),
(691, 114, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:26:10', NULL, NULL, NULL, NULL),
(692, 114, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:26:10', NULL, NULL, NULL, NULL),
(693, 114, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:26:10', NULL, NULL, NULL, NULL),
(694, 114, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:26:10', NULL, NULL, NULL, NULL),
(695, 114, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:26:10', NULL, NULL, NULL, NULL),
(696, 114, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:26:10', NULL, NULL, NULL, NULL),
(697, 115, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:28:05', NULL, NULL, NULL, NULL),
(698, 115, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:28:05', NULL, NULL, NULL, NULL),
(699, 115, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:28:05', NULL, NULL, NULL, NULL),
(700, 115, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:28:05', NULL, NULL, NULL, NULL),
(701, 115, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:28:05', NULL, NULL, NULL, NULL),
(702, 115, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:28:05', NULL, NULL, NULL, NULL),
(703, 116, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:33:19', NULL, NULL, NULL, NULL),
(704, 116, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:33:19', NULL, NULL, NULL, NULL),
(705, 116, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:33:19', NULL, NULL, NULL, NULL),
(706, 116, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:33:19', NULL, NULL, NULL, NULL),
(707, 116, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:33:19', NULL, NULL, NULL, NULL),
(708, 116, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:33:19', NULL, NULL, NULL, NULL),
(709, 117, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:37:51', NULL, NULL, NULL, NULL),
(710, 117, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:37:51', NULL, NULL, NULL, NULL),
(711, 117, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:37:51', NULL, NULL, NULL, NULL),
(712, 117, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:37:51', NULL, NULL, NULL, NULL),
(713, 117, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:37:51', NULL, NULL, NULL, NULL),
(714, 117, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:37:51', NULL, NULL, NULL, NULL),
(715, 118, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:42:32', NULL, NULL, NULL, NULL),
(716, 118, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:42:32', NULL, NULL, NULL, NULL),
(717, 118, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:42:32', NULL, NULL, NULL, NULL),
(718, 118, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:42:32', NULL, NULL, NULL, NULL),
(719, 118, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:42:32', NULL, NULL, NULL, NULL),
(720, 118, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:42:32', NULL, NULL, NULL, NULL),
(721, 119, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:47:44', NULL, NULL, NULL, NULL),
(722, 119, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:47:44', NULL, NULL, NULL, NULL),
(723, 119, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:47:44', NULL, NULL, NULL, NULL),
(724, 119, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:47:44', NULL, NULL, NULL, NULL),
(725, 119, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:47:44', NULL, NULL, NULL, NULL),
(726, 119, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:47:44', NULL, NULL, NULL, NULL),
(727, 120, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 08:50:17', NULL, NULL, NULL, NULL),
(728, 120, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:50:17', NULL, NULL, NULL, NULL),
(729, 120, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 08:50:17', NULL, NULL, NULL, NULL),
(730, 120, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 08:50:17', NULL, NULL, NULL, NULL),
(731, 120, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 08:50:18', NULL, NULL, NULL, NULL),
(732, 120, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 08:50:18', NULL, NULL, NULL, NULL),
(733, 121, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:01:19', NULL, NULL, NULL, NULL),
(734, 121, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:01:19', NULL, NULL, NULL, NULL),
(735, 121, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:01:19', NULL, NULL, NULL, NULL),
(736, 121, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:01:19', NULL, NULL, NULL, NULL),
(737, 121, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:01:19', NULL, NULL, NULL, NULL),
(738, 121, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:01:19', NULL, NULL, NULL, NULL),
(739, 122, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:06:48', NULL, NULL, NULL, NULL),
(740, 122, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:06:48', NULL, NULL, NULL, NULL),
(741, 122, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:06:48', NULL, NULL, NULL, NULL),
(742, 122, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:06:48', NULL, NULL, NULL, NULL),
(743, 122, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:06:48', NULL, NULL, NULL, NULL),
(744, 122, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:06:48', NULL, NULL, NULL, NULL),
(745, 123, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:15:03', NULL, NULL, NULL, NULL),
(746, 123, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:15:03', NULL, NULL, NULL, NULL),
(747, 123, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:15:03', NULL, NULL, NULL, NULL),
(748, 123, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:15:03', NULL, NULL, NULL, NULL),
(749, 123, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:15:03', NULL, NULL, NULL, NULL),
(750, 123, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:15:03', NULL, NULL, NULL, NULL),
(751, 124, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:22:06', NULL, NULL, NULL, NULL),
(752, 124, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:22:07', NULL, NULL, NULL, NULL),
(753, 124, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:22:07', NULL, NULL, NULL, NULL),
(754, 124, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:22:07', NULL, NULL, NULL, NULL),
(755, 124, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:22:07', NULL, NULL, NULL, NULL),
(756, 124, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:22:07', NULL, NULL, NULL, NULL),
(757, 125, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:28:54', NULL, NULL, NULL, NULL),
(758, 125, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:28:54', NULL, NULL, NULL, NULL),
(759, 125, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:28:54', NULL, NULL, NULL, NULL),
(760, 125, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:28:54', NULL, NULL, NULL, NULL),
(761, 125, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:28:54', NULL, NULL, NULL, NULL),
(762, 125, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:28:54', NULL, NULL, NULL, NULL),
(763, 126, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:31:44', NULL, NULL, NULL, NULL),
(764, 126, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:31:44', NULL, NULL, NULL, NULL),
(765, 126, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:31:44', NULL, NULL, NULL, NULL),
(766, 126, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:31:44', NULL, NULL, NULL, NULL),
(767, 126, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:31:44', NULL, NULL, NULL, NULL),
(768, 126, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:31:44', NULL, NULL, NULL, NULL),
(769, 127, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:33:29', NULL, NULL, NULL, NULL),
(770, 127, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:33:30', NULL, NULL, NULL, NULL),
(771, 127, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:33:30', NULL, NULL, NULL, NULL),
(772, 127, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:33:30', NULL, NULL, NULL, NULL),
(773, 127, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:33:30', NULL, NULL, NULL, NULL),
(774, 127, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:33:30', NULL, NULL, NULL, NULL),
(775, 128, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:36:57', NULL, NULL, NULL, NULL),
(776, 128, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:36:57', NULL, NULL, NULL, NULL),
(777, 128, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:36:57', NULL, NULL, NULL, NULL),
(778, 128, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:36:57', NULL, NULL, NULL, NULL),
(779, 128, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:36:57', NULL, NULL, NULL, NULL),
(780, 128, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:36:57', NULL, NULL, NULL, NULL),
(781, 129, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:44:34', NULL, NULL, NULL, NULL),
(782, 129, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:44:34', NULL, NULL, NULL, NULL),
(783, 129, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:44:34', NULL, NULL, NULL, NULL),
(784, 129, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:44:34', NULL, NULL, NULL, NULL),
(785, 129, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:44:34', NULL, NULL, NULL, NULL),
(786, 129, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:44:34', NULL, NULL, NULL, NULL),
(787, 130, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:48:27', NULL, NULL, NULL, NULL),
(788, 130, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:48:27', NULL, NULL, NULL, NULL),
(789, 130, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:48:27', NULL, NULL, NULL, NULL),
(790, 130, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:48:27', NULL, NULL, NULL, NULL),
(791, 130, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:48:27', NULL, NULL, NULL, NULL),
(792, 130, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:48:27', NULL, NULL, NULL, NULL),
(793, 131, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:53:12', NULL, NULL, NULL, NULL),
(794, 131, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:53:12', NULL, NULL, NULL, NULL),
(795, 131, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:53:12', NULL, NULL, NULL, NULL),
(796, 131, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:53:12', NULL, NULL, NULL, NULL),
(797, 131, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:53:12', NULL, NULL, NULL, NULL),
(798, 131, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:53:12', NULL, NULL, NULL, NULL),
(799, 132, 1, 1, 'General Fee', 3, 12500, 1, 1, '2022-03-29 09:57:04', NULL, NULL, NULL, NULL),
(800, 132, 1, 2, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:57:04', NULL, NULL, NULL, NULL),
(801, 132, 1, 3, 'General Fee', 3, 6000, 1, 1, '2022-03-29 09:57:05', NULL, NULL, NULL, NULL),
(802, 132, 1, 4, 'General Fee', 3, 1500, 1, 1, '2022-03-29 09:57:05', NULL, NULL, NULL, NULL),
(803, 132, 1, 8, 'General Fee', 3, 2500, 1, 1, '2022-03-29 09:57:05', NULL, NULL, NULL, NULL),
(804, 132, 1, 9, 'General Fee', 3, 2700, 1, 1, '2022-03-29 09:57:05', NULL, NULL, NULL, NULL),
(817, 133, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:08:06', NULL, '2022-03-29 10:08:06', NULL, NULL),
(818, 133, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:08:06', NULL, '2022-03-29 10:08:06', NULL, NULL),
(819, 133, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:08:06', NULL, '2022-03-29 10:08:06', NULL, NULL),
(820, 133, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:08:06', NULL, '2022-03-29 10:08:06', NULL, NULL),
(821, 133, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:08:06', NULL, '2022-03-29 10:08:06', NULL, NULL),
(822, 133, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:08:06', NULL, '2022-03-29 10:08:06', NULL, NULL),
(823, 134, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:09:11', NULL, '2022-03-29 10:09:11', NULL, NULL),
(824, 134, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:09:11', NULL, '2022-03-29 10:09:11', NULL, NULL),
(825, 134, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:09:11', NULL, '2022-03-29 10:09:11', NULL, NULL),
(826, 134, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:09:11', NULL, '2022-03-29 10:09:11', NULL, NULL),
(827, 134, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:09:11', NULL, '2022-03-29 10:09:11', NULL, NULL),
(828, 134, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:09:11', NULL, '2022-03-29 10:09:11', NULL, NULL),
(829, 135, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:13:58', NULL, NULL, NULL, NULL),
(830, 135, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:13:58', NULL, NULL, NULL, NULL),
(831, 135, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:13:58', NULL, NULL, NULL, NULL),
(832, 135, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:13:58', NULL, NULL, NULL, NULL),
(833, 135, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:13:58', NULL, NULL, NULL, NULL),
(834, 135, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:13:58', NULL, NULL, NULL, NULL),
(835, 136, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:18:47', NULL, NULL, NULL, NULL),
(836, 136, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:18:47', NULL, NULL, NULL, NULL),
(837, 136, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:18:47', NULL, NULL, NULL, NULL),
(838, 136, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:18:47', NULL, NULL, NULL, NULL),
(839, 136, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:18:47', NULL, NULL, NULL, NULL),
(840, 136, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:18:47', NULL, NULL, NULL, NULL),
(841, 137, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:22:16', NULL, NULL, NULL, NULL),
(842, 137, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:22:17', NULL, NULL, NULL, NULL),
(843, 137, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:22:17', NULL, NULL, NULL, NULL),
(844, 137, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:22:17', NULL, NULL, NULL, NULL),
(845, 137, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:22:17', NULL, NULL, NULL, NULL),
(846, 137, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:22:17', NULL, NULL, NULL, NULL),
(847, 138, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:24:27', NULL, NULL, NULL, NULL),
(848, 138, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:24:27', NULL, NULL, NULL, NULL),
(849, 138, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:24:27', NULL, NULL, NULL, NULL),
(850, 138, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:24:27', NULL, NULL, NULL, NULL),
(851, 138, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:24:27', NULL, NULL, NULL, NULL),
(852, 138, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:24:27', NULL, NULL, NULL, NULL),
(853, 139, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:52:10', NULL, NULL, NULL, NULL),
(854, 139, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:52:10', NULL, NULL, NULL, NULL),
(855, 139, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:52:10', NULL, NULL, NULL, NULL),
(856, 139, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:52:10', NULL, NULL, NULL, NULL),
(857, 139, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:52:10', NULL, NULL, NULL, NULL),
(858, 139, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:52:10', NULL, NULL, NULL, NULL),
(859, 140, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:54:09', NULL, NULL, NULL, NULL),
(860, 140, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:54:09', NULL, NULL, NULL, NULL),
(861, 140, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:54:09', NULL, NULL, NULL, NULL),
(862, 140, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:54:09', NULL, NULL, NULL, NULL),
(863, 140, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:54:09', NULL, NULL, NULL, NULL),
(864, 140, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:54:09', NULL, NULL, NULL, NULL),
(865, 141, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 10:56:45', NULL, NULL, NULL, NULL),
(866, 141, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:56:45', NULL, NULL, NULL, NULL),
(867, 141, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 10:56:45', NULL, NULL, NULL, NULL),
(868, 141, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 10:56:45', NULL, NULL, NULL, NULL),
(869, 141, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 10:56:45', NULL, NULL, NULL, NULL),
(870, 141, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 10:56:45', NULL, NULL, NULL, NULL),
(871, 142, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 11:00:52', NULL, NULL, NULL, NULL),
(872, 142, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 11:00:52', NULL, NULL, NULL, NULL),
(873, 142, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 11:00:52', NULL, NULL, NULL, NULL),
(874, 142, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 11:00:52', NULL, NULL, NULL, NULL),
(875, 142, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 11:00:53', NULL, NULL, NULL, NULL),
(876, 142, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 11:00:53', NULL, NULL, NULL, NULL),
(877, 143, 1, 1, 'General Fee', 2, 12500, 1, 1, '2022-03-29 11:11:04', NULL, NULL, NULL, NULL),
(878, 143, 1, 2, 'General Fee', 2, 1500, 1, 1, '2022-03-29 11:11:04', NULL, NULL, NULL, NULL),
(879, 143, 1, 3, 'General Fee', 2, 6000, 1, 1, '2022-03-29 11:11:04', NULL, NULL, NULL, NULL),
(880, 143, 1, 4, 'General Fee', 2, 1500, 1, 1, '2022-03-29 11:11:04', NULL, NULL, NULL, NULL),
(881, 143, 1, 8, 'General Fee', 2, 2500, 1, 1, '2022-03-29 11:11:04', NULL, NULL, NULL, NULL),
(882, 143, 1, 9, 'General Fee', 2, 2700, 1, 1, '2022-03-29 11:11:04', NULL, NULL, NULL, NULL),
(883, 79, 1, 18, 'BALANCE B/F', 4, 30300, 1, 1, '2022-03-29 11:14:09', NULL, '2022-03-29 11:14:09', NULL, NULL),
(884, 38, 1, 18, 'BALANCE B/F', 6, 25000, 1, 1, '2022-03-29 11:18:24', NULL, '2022-03-29 11:18:24', NULL, NULL),
(885, 35, 1, 18, 'BALANCE B/F', 6, 20000, 1, 1, '2022-03-29 11:19:29', NULL, '2022-03-29 11:19:29', NULL, NULL),
(886, 33, 1, 18, 'BALANCE B/F', 6, 17400, 1, 1, '2022-03-29 11:20:50', NULL, '2022-03-29 11:20:50', NULL, NULL),
(887, 114, 1, 18, 'BALANCE B/F', 3, 15800, 1, 1, '2022-03-29 11:21:41', NULL, '2022-03-29 11:21:41', NULL, NULL),
(888, 18, 1, 18, 'BALANCE B/F', 7, 15200, 1, 1, '2022-03-29 11:22:27', NULL, '2022-03-29 11:22:27', NULL, NULL),
(889, 112, 1, 18, 'BALANCE B/F', 3, 12450, 1, 1, '2022-03-29 11:23:22', NULL, '2022-03-29 11:23:22', NULL, NULL),
(890, 86, 1, 18, 'BALANCE B/F', 4, 12400, 1, 1, '2022-03-29 11:24:20', NULL, '2022-03-29 11:24:20', NULL, NULL),
(891, 106, 1, 18, 'BALANCE B/F', 3, 11600, 1, 1, '2022-03-29 11:25:28', NULL, '2022-03-29 11:25:28', NULL, NULL),
(892, 36, 1, 18, 'BALANCE B/F', 6, 10600, 1, 1, '2022-03-29 11:26:51', NULL, '2022-03-29 11:26:51', NULL, NULL),
(893, 29, 1, 18, 'BALANCE B/F', 6, 8500, 1, 1, '2022-03-29 11:27:53', NULL, '2022-03-29 11:27:53', NULL, NULL),
(894, 24, 1, 18, 'BALANCE B/F', 7, 6800, 1, 1, '2022-03-29 11:29:03', NULL, '2022-03-29 11:29:03', NULL, NULL),
(895, 128, 1, 18, 'BALANCE B/F', 3, 6400, 1, 1, '2022-03-29 11:30:03', NULL, '2022-03-29 11:30:03', NULL, NULL),
(896, 58, 1, 18, 'BALANCE B/F', 5, 5900, 1, 1, '2022-03-29 11:30:59', NULL, '2022-03-29 11:30:59', NULL, NULL),
(897, 138, 1, 18, 'BALANCE B/F', 2, 5300, 1, 1, '2022-03-29 11:32:46', NULL, '2022-03-29 11:32:46', NULL, NULL),
(898, 132, 1, 18, 'BALANCE B/F', 3, 4750, 1, 1, '2022-03-29 11:35:06', NULL, '2022-03-29 11:35:06', NULL, NULL),
(899, 20, 1, 18, 'BALANCE B/F', 7, 4700, 1, 1, '2022-03-29 11:36:56', NULL, '2022-03-29 11:36:56', NULL, NULL),
(900, 43, 1, 18, 'BALANCE B/F', 5, 3400, 1, 1, '2022-03-29 11:39:43', NULL, '2022-03-29 11:39:43', NULL, NULL),
(901, 90, 1, 18, 'BALANCE B/F', 4, 3000, 1, 1, '2022-03-29 14:48:54', NULL, '2022-03-29 14:48:54', NULL, NULL),
(902, 133, 1, 18, 'BALANCE B/F', 2, 2500, 1, 1, '2022-03-29 14:49:33', NULL, '2022-03-29 14:49:33', NULL, NULL),
(903, 98, 1, 18, 'BALANCE B/F', 3, 1750, 1, 1, '2022-03-29 14:50:44', NULL, '2022-03-29 14:50:44', NULL, NULL),
(904, 9, 1, 18, 'BALANCE B/F', 8, 1500, 1, 1, '2022-03-29 14:52:51', NULL, '2022-03-29 14:52:51', NULL, NULL),
(905, 6, 1, 18, 'BALANCE B/F', 8, 1100, 1, 1, '2022-03-29 14:55:26', NULL, '2022-03-29 14:55:26', NULL, NULL),
(906, 30, 1, 18, 'BALANCE B/F', 6, 900, 1, 1, '2022-03-29 20:00:11', NULL, '2022-03-29 20:00:11', NULL, NULL),
(907, 143, 1, 18, 'BALANCE B/F', 2, 400, 1, 1, '2022-03-29 20:00:55', NULL, '2022-03-29 20:00:55', NULL, NULL),
(908, 27, 1, 18, 'BALANCE B/F', 6, 200, 1, 1, '2022-03-29 20:01:53', NULL, '2022-03-29 20:01:53', NULL, NULL),
(909, 141, 1, 18, 'BALANCE B/F', 2, 100, 1, 1, '2022-03-29 20:02:32', NULL, '2022-03-29 20:02:32', NULL, NULL),
(910, 13, 1, 18, 'BALANCE B/F', 7, 100, 1, 1, '2022-03-29 20:03:17', NULL, '2022-03-29 20:03:17', NULL, NULL),
(911, 26, 1, 18, 'BALANCE B/F', 6, -200, 1, 1, '2022-03-29 20:04:17', NULL, '2022-03-29 20:04:17', NULL, NULL),
(912, 104, 1, 18, 'BALANCE B/F', 3, -400, 1, 1, '2022-03-29 20:05:00', NULL, '2022-03-29 20:05:00', NULL, NULL),
(913, 72, 1, 18, 'BALANCE B/F', 4, -400, 1, 1, '2022-03-29 20:05:44', NULL, '2022-03-29 20:05:44', NULL, NULL),
(914, 87, 1, 18, 'BALANCE B/F', 4, -400, 1, 1, '2022-03-29 20:06:16', NULL, '2022-03-29 20:06:16', NULL, NULL),
(915, 42, 1, 18, 'BALANCE B/F', 5, -400, 1, 1, '2022-03-29 20:06:51', NULL, '2022-03-29 20:06:51', NULL, NULL),
(916, 59, 1, 18, 'BALANCE B/F', 5, -400, 1, 1, '2022-03-29 20:07:46', NULL, '2022-03-29 20:07:46', NULL, NULL),
(917, 142, 1, 18, 'BALANCE B/F', 2, -580, 1, 1, '2022-03-29 20:08:20', NULL, '2022-03-29 20:08:20', NULL, NULL),
(918, 40, 1, 18, 'BALANCE B/F', 5, -900, 1, 1, '2022-03-29 20:09:26', NULL, '2022-03-29 20:09:26', NULL, NULL),
(919, 117, 1, 18, 'BALANCE B/F', 3, -1100, 1, 1, '2022-03-29 20:11:38', NULL, '2022-03-29 20:11:38', NULL, NULL),
(920, 116, 1, 18, 'BALANCE B/F', 3, -1300, 1, 1, '2022-03-29 20:12:22', NULL, '2022-03-29 20:12:22', NULL, NULL),
(921, 62, 1, 18, 'BALANCE B/F', 5, -1400, 1, 1, '2022-03-29 20:13:32', NULL, '2022-03-29 20:13:32', NULL, NULL),
(922, 57, 1, 18, 'BALANCE B/F', 5, -1500, 1, 1, '2022-03-29 20:17:04', NULL, '2022-03-29 20:17:04', NULL, NULL),
(923, 75, 1, 18, 'BALANCE B/F', 4, -2100, 1, 1, '2022-03-29 20:17:53', NULL, '2022-03-29 20:17:53', NULL, NULL),
(924, 2, 1, 18, 'BALANCE B/F', 8, -2300, 1, 1, '2022-03-29 20:18:41', NULL, '2022-03-29 20:18:41', NULL, NULL),
(925, 19, 1, 18, 'BALANCE B/F', 7, -2500, 1, 1, '2022-03-29 20:19:30', NULL, '2022-03-29 20:19:30', NULL, NULL),
(926, 12, 1, 18, 'BALANCE B/F', 7, -2900, 1, 1, '2022-03-29 20:20:11', NULL, '2022-03-29 20:20:11', NULL, NULL),
(927, 124, 1, 18, 'BALANCE B/F', 3, -3000, 1, 1, '2022-03-29 20:20:47', NULL, '2022-03-29 20:20:47', NULL, NULL),
(928, 66, 1, 18, 'BALANCE B/F', 5, -3300, 1, 1, '2022-03-29 20:21:37', NULL, '2022-03-29 20:21:37', NULL, NULL),
(929, 100, 1, 18, 'BALANCE B/F', 3, -3500, 1, 1, '2022-03-29 20:22:19', NULL, '2022-03-29 20:22:19', NULL, NULL),
(930, 125, 1, 18, 'BALANCE B/F', 3, -16900, 1, 1, '2022-03-29 20:23:06', NULL, '2022-03-29 20:23:06', NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_timelines`
--

INSERT INTO `student_timelines` (`id`, `student_id`, `current_session_id`, `class_grade_id`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-26 15:29:31', NULL),
(2, 2, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:16:00', NULL),
(3, 3, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:17:27', NULL),
(4, 4, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:19:23', NULL),
(5, 5, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:21:04', NULL),
(6, 6, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:22:48', NULL),
(7, 7, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:28:02', NULL),
(8, 8, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:35:30', NULL),
(9, 9, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:40:18', NULL),
(10, 10, 1, 8, 'Enrolled to GRADE FIVE', 1, '2022-03-28 06:48:29', NULL),
(11, 11, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 06:50:50', NULL),
(12, 12, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 06:52:56', NULL),
(13, 13, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 06:54:19', NULL),
(14, 14, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 06:56:05', NULL),
(15, 15, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 06:59:40', NULL),
(16, 16, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:00:52', NULL),
(17, 17, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:03:52', NULL),
(18, 18, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:06:06', NULL),
(19, 19, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:21:17', NULL),
(20, 20, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:22:58', NULL),
(21, 21, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:24:30', NULL),
(22, 22, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:28:36', NULL),
(23, 23, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:31:11', NULL),
(24, 24, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:37:21', NULL),
(25, 25, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:39:49', NULL),
(26, 26, 1, 7, 'Enrolled to GRADE FOUR', 1, '2022-03-28 07:41:57', NULL),
(27, 26, 1, 6, 'Switched from GRADE FOUR to GRADE THREE', 1, '2022-03-28 07:43:14', '2022-03-28 07:43:14'),
(28, 27, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 07:48:50', NULL),
(29, 28, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 07:56:55', NULL),
(30, 29, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:02:20', NULL),
(31, 30, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:07:10', NULL),
(32, 31, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:11:51', NULL),
(33, 32, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:13:28', NULL),
(34, 33, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:17:40', NULL),
(35, 34, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:19:23', NULL),
(36, 35, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:21:21', NULL),
(37, 36, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:25:07', NULL),
(38, 37, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 08:29:45', NULL),
(39, 38, 1, 6, 'Enrolled to GRADE THREE', 1, '2022-03-28 13:14:23', NULL),
(40, 39, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 13:25:12', NULL),
(41, 40, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 13:34:20', NULL),
(42, 41, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 13:42:31', NULL),
(43, 42, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 13:48:33', NULL),
(44, 43, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 13:52:47', NULL),
(45, 44, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 13:56:00', NULL),
(46, 45, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 14:10:07', NULL),
(47, 46, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 14:16:20', NULL),
(48, 47, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 14:22:43', NULL),
(49, 48, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 14:25:33', NULL),
(50, 49, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 14:46:30', NULL),
(51, 50, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 14:48:40', NULL),
(52, 51, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 14:54:05', NULL),
(53, 52, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:08:50', NULL),
(54, 53, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:10:28', NULL),
(55, 54, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:16:14', NULL),
(56, 55, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:24:09', NULL),
(57, 56, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:30:50', NULL),
(58, 57, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:38:40', NULL),
(59, 58, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:41:12', NULL),
(60, 59, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:48:58', NULL),
(61, 60, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 18:58:06', NULL),
(62, 61, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:05:07', NULL),
(63, 62, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:21:46', NULL),
(64, 63, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:26:48', NULL),
(65, 64, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:35:24', NULL),
(66, 65, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:39:03', NULL),
(67, 66, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:46:16', NULL),
(68, 67, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:51:40', NULL),
(69, 68, 1, 5, 'Enrolled to GRADE TWO', 1, '2022-03-28 19:55:59', NULL),
(70, 69, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 19:59:08', NULL),
(71, 70, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:01:47', NULL),
(72, 71, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:06:51', NULL),
(73, 72, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:14:13', NULL),
(74, 73, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:18:41', NULL),
(75, 74, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:34:58', NULL),
(76, 75, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:40:33', NULL),
(77, 76, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:48:07', NULL),
(78, 77, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:52:58', NULL),
(79, 78, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 20:55:29', NULL),
(80, 79, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:01:04', NULL),
(81, 80, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:07:13', NULL),
(82, 81, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:13:26', NULL),
(83, 82, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:18:32', NULL),
(84, 83, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:25:04', NULL),
(85, 84, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:30:01', NULL),
(86, 85, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:32:50', NULL),
(87, 86, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:35:46', NULL),
(88, 87, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:39:42', NULL),
(89, 88, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:47:15', NULL),
(90, 89, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:50:28', NULL),
(91, 90, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 21:52:14', NULL),
(92, 91, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 21:57:55', NULL),
(93, 92, 1, 4, 'Enrolled to GRADE ONE', 1, '2022-03-28 22:08:19', NULL),
(94, 92, 1, 3, 'Switched from GRADE ONE to PRE-PRIMARY TWO', 1, '2022-03-28 22:11:46', '2022-03-28 22:11:46'),
(95, 93, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:16:15', NULL),
(96, 94, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:23:07', NULL),
(97, 95, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:26:34', NULL),
(98, 96, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:30:52', NULL),
(99, 97, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:37:23', NULL),
(100, 98, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:41:10', NULL),
(101, 99, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:45:54', NULL),
(102, 100, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:52:21', NULL),
(103, 101, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 22:58:29', NULL),
(104, 102, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 23:03:54', NULL),
(105, 103, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 23:11:58', NULL),
(106, 104, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-28 23:15:25', NULL),
(107, 105, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 07:36:34', NULL),
(108, 106, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 07:40:38', NULL),
(109, 107, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 07:49:51', NULL),
(110, 108, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 07:55:25', NULL),
(111, 109, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 07:59:06', NULL),
(112, 110, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:05:07', NULL),
(113, 111, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:09:20', NULL),
(114, 112, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:19:02', NULL),
(115, 113, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:24:17', NULL),
(116, 114, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:26:10', NULL),
(117, 115, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:28:06', NULL),
(118, 116, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:33:19', NULL),
(119, 117, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:37:51', NULL),
(120, 118, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:42:32', NULL),
(121, 119, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:47:44', NULL),
(122, 120, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 08:50:18', NULL),
(123, 121, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:01:19', NULL),
(124, 122, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:06:48', NULL),
(125, 123, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:15:03', NULL),
(126, 124, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:22:07', NULL),
(127, 125, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:28:54', NULL),
(128, 126, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:31:44', NULL),
(129, 127, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:33:30', NULL),
(130, 128, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:36:58', NULL),
(131, 129, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:44:34', NULL),
(132, 130, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:48:27', NULL),
(133, 131, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:53:12', NULL),
(134, 132, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 09:57:05', NULL),
(135, 133, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 10:01:43', NULL),
(136, 134, 1, 3, 'Enrolled to PRE-PRIMARY TWO', 1, '2022-03-29 10:06:31', NULL),
(137, 133, 1, 2, 'Switched from PRE-PRIMARY TWO to PRE-PRIMARY ONE', 1, '2022-03-29 10:08:06', '2022-03-29 10:08:06'),
(138, 134, 1, 2, 'Switched from PRE-PRIMARY TWO to PRE-PRIMARY ONE', 1, '2022-03-29 10:09:11', '2022-03-29 10:09:11'),
(139, 135, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 10:13:58', NULL),
(140, 136, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 10:18:47', NULL),
(141, 137, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 10:22:17', NULL),
(142, 138, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 10:24:27', NULL),
(143, 139, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 10:52:10', NULL),
(144, 140, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 10:54:09', NULL),
(145, 141, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 10:56:45', NULL),
(146, 142, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 11:00:53', NULL),
(147, 143, 1, 2, 'Enrolled to PRE-PRIMARY ONE', 1, '2022-03-29 11:11:04', NULL);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_transports`
--

INSERT INTO `student_transports` (`id`, `student_id`, `current_session_id`, `class_grade_id`, `transport_zone_fee_id`, `way`, `amount`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 10, 1, 8, 2, 2, 6800, '1', 1, '2022-03-28 07:53:36', 1, '2022-03-28 07:53:36', NULL, NULL),
(2, 27, 1, 6, 3, 2, 7800, '1', 1, '2022-03-28 07:53:13', 1, '2022-03-28 07:53:13', NULL, NULL),
(3, 28, 1, 6, 2, 2, 6800, '1', 1, '2022-03-28 07:56:55', NULL, NULL, NULL, NULL),
(4, 30, 1, 6, 2, 2, 6800, '1', 1, '2022-03-28 08:07:10', NULL, NULL, NULL, NULL),
(5, 33, 1, 6, 2, 2, 6800, '1', 1, '2022-03-28 08:17:40', NULL, NULL, NULL, NULL),
(6, 37, 1, 6, 2, 2, 6800, '1', 1, '2022-03-28 08:29:45', NULL, NULL, NULL, NULL),
(7, 39, 1, 5, 2, 2, 6800, '1', 1, '2022-03-28 13:25:12', NULL, NULL, NULL, NULL),
(8, 42, 1, 5, 2, 2, 6800, '1', 1, '2022-03-28 13:48:33', NULL, NULL, NULL, NULL),
(9, 44, 1, 5, 3, 2, 7800, '1', 1, '2022-03-28 13:56:00', NULL, NULL, NULL, NULL),
(10, 47, 1, 5, 3, 2, 7800, '1', 1, '2022-03-28 14:22:43', NULL, NULL, NULL, NULL),
(11, 49, 1, 5, 1, 2, 5800, '1', 1, '2022-03-28 14:46:29', NULL, NULL, NULL, NULL),
(12, 54, 1, 5, 2, 2, 6800, '1', 1, '2022-03-28 18:16:14', NULL, NULL, NULL, NULL),
(13, 56, 1, 5, 1, 1, 1450, '1', 1, '2022-03-28 18:30:49', NULL, NULL, NULL, NULL),
(14, 59, 1, 5, 1, 2, 5800, '1', 1, '2022-03-28 18:48:57', NULL, NULL, NULL, NULL),
(15, 67, 1, 5, 2, 2, 6800, '1', 1, '2022-03-28 19:51:39', NULL, NULL, NULL, NULL),
(16, 74, 1, 4, 2, 2, 6800, '1', 1, '2022-03-28 20:34:58', NULL, NULL, NULL, NULL),
(17, 75, 1, 4, 2, 2, 6800, '1', 1, '2022-03-28 20:40:33', NULL, NULL, NULL, NULL),
(18, 76, 1, 4, 2, 2, 6800, '1', 1, '2022-03-28 20:48:07', NULL, NULL, NULL, NULL),
(19, 83, 1, 4, 3, 2, 7800, '1', 1, '2022-03-28 21:25:04', NULL, NULL, NULL, NULL),
(20, 88, 1, 4, 3, 2, 7800, '1', 1, '2022-03-28 21:47:15', NULL, NULL, NULL, NULL),
(21, 91, 1, 3, 2, 2, 6800, '1', 1, '2022-03-28 21:57:55', NULL, NULL, NULL, NULL),
(22, 92, 1, 3, 2, 1, 1700, '1', 1, '2022-03-28 22:11:46', 1, '2022-03-28 22:11:46', NULL, NULL),
(23, 103, 1, 3, 2, 2, 6800, '1', 1, '2022-03-28 23:11:58', NULL, NULL, NULL, NULL),
(24, 104, 1, 3, 1, 2, 5800, '1', 1, '2022-03-28 23:15:25', NULL, NULL, NULL, NULL),
(25, 105, 1, 3, 1, 1, 1450, '1', 1, '2022-03-29 07:36:34', NULL, NULL, NULL, NULL),
(26, 106, 1, 3, 1, 2, 5800, '1', 1, '2022-03-29 07:40:38', NULL, NULL, NULL, NULL),
(27, 108, 1, 3, 1, 1, 1450, '1', 1, '2022-03-29 07:55:25', NULL, NULL, NULL, NULL),
(28, 116, 1, 3, 2, 2, 6800, '1', 1, '2022-03-29 08:33:19', NULL, NULL, NULL, NULL),
(29, 117, 1, 3, 3, 2, 7800, '1', 1, '2022-03-29 08:37:51', NULL, NULL, NULL, NULL),
(30, 124, 1, 3, 2, 2, 6800, '1', 1, '2022-03-29 09:22:07', NULL, NULL, NULL, NULL),
(31, 128, 1, 3, 3, 2, 7800, '1', 1, '2022-03-29 09:36:58', NULL, NULL, NULL, NULL),
(32, 135, 1, 2, 3, 2, 7800, '1', 1, '2022-03-29 10:13:58', NULL, NULL, NULL, NULL),
(33, 139, 1, 2, 1, 2, 5800, '1', 1, '2022-03-29 10:55:16', NULL, '2022-03-29 10:55:16', NULL, NULL),
(34, 143, 1, 2, 1, 2, 5800, '1', 1, '2022-03-29 11:11:04', NULL, NULL, NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transport_zones`
--

CREATE TABLE `transport_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `areas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_zones`
--

INSERT INTO `transport_zones` (`id`, `name`, `long_name`, `slug`, `areas`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 'ZONE A', 'Zone One', 'zone-one', NULL, 1, 1, '2022-03-26 08:18:03', 1, '2022-03-26 08:18:03', NULL, NULL),
(2, 'ZONE B', 'Zone Two', 'zone-two', NULL, 1, 1, '2022-03-26 08:18:22', NULL, '2022-03-26 08:18:22', NULL, NULL),
(3, 'ZONE C', 'Zone Three', 'zone-three', NULL, 1, 1, '2022-03-26 08:18:37', NULL, '2022-03-26 08:18:37', NULL, NULL);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_zone_fees`
--

INSERT INTO `transport_zone_fees` (`id`, `slug`, `transport_zone_id`, `one_way`, `two_way`, `current_session_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'zone-a-term-1-2022', 1, 1450, 5800, 1, 1, '2022-03-28 07:51:55', 1, '2022-03-28 07:51:55'),
(2, 'zone-b-term-1-2022', 2, 1700, 6800, 1, 1, '2022-03-28 07:52:12', 1, '2022-03-28 07:52:12'),
(3, 'zone-c-term-1-2022', 3, 1950, 7800, 1, 1, '2022-03-28 07:52:36', 1, '2022-03-28 07:52:36');

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
  `parent_detail_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` bigint(20) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile`, `position`, `parent_detail_id`, `status`, `remember_token`, `last_login`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Super Admin', 'josnytechsolution@gmail.com', NULL, '$2y$10$Q5TBMNpmj3UPrC/i8iV7AeXTn3dYbME7ZbeBvMVfo7.uOo2X0qpRS', 1, 'Super Admin', 1, 1, NULL, NULL, 1, '2022-03-25 16:16:32', 1, '2022-03-25 17:11:13'),
(2, 'Dummy Father', 'sbp0001@schoolbest.co.ke', NULL, '$2y$10$DPGUNF68QrLMb7DqA9KCBu0YRMWXUYtDDCNNE.Q8oa8LEuVpwLFCG', 5, 'Parent', 1, 1, NULL, NULL, 1, '2022-03-26 15:01:06', NULL, '2022-03-26 15:01:06'),
(3, 'Humphrey Tabu', 'ryp0002@rayzonschools.com', NULL, '$2y$10$drf3H/pynM1IUW4IpFufGOZjQmR6z6A6wn0Krd1s04Ll.wvSl4HI6', 5, 'Parent', 2, 1, NULL, NULL, 1, '2022-03-28 06:28:02', NULL, NULL),
(4, 'Kenneth Ijimba Otiende', 'ryp0003@rayzonschools.com', NULL, '$2y$10$WZCJ.t1x.SWXH/fssxyb6eYm.xnj1ZkrNNUQD4ffXfoS6TBXWJdjW', 5, 'Parent', 3, 1, NULL, NULL, 1, '2022-03-28 06:35:30', NULL, NULL),
(5, 'Melody Wegesa', 'ryp0004@rayzonschools.com', NULL, '$2y$10$l989HE6NTQgiYQp2y96gGulUrCiYk7DB2KVgVjT2s5DH0ONqYNn9C', 5, 'Parent', 4, 1, NULL, NULL, 1, '2022-03-28 06:40:18', NULL, NULL),
(6, 'Donald Ocheing', 'ryp0005@rayzonschools.com', NULL, '$2y$10$XRlkWzfN7nPAjzsij4.42e.uGYJMIaYVRUgdJX7yeLFziD/X06.Cq', 5, 'Parent', 5, 1, NULL, NULL, 1, '2022-03-28 06:48:29', NULL, NULL),
(7, 'Joash Ochieng', 'ryp0006@rayzonschools.com', NULL, '$2y$10$ZRctDl./v0vru1DQ.sex9OZDCgIUQk5WoSIgzmQvVfQxhlmwf4uxW', 5, 'Parent', 6, 1, NULL, NULL, 1, '2022-03-28 07:28:35', NULL, NULL),
(8, 'George Matala', 'ryp0007@rayzonschools.com', NULL, '$2y$10$F2F717CopX3xGjFSMg6IpuSWHodulPoJkYRG1FGCzkFGWw0B8cJyu', 5, 'Parent', 7, 1, NULL, NULL, 1, '2022-03-28 07:37:20', NULL, NULL),
(9, 'Annegrette Mela', 'ryp0008@rayzonschools.com', NULL, '$2y$10$Gt8ZUGrICWr8k.vSF7T04.1xkY77woRte6UI2.M/ruleqVPlwsZK6', 5, 'Parent', 8, 1, NULL, NULL, 1, '2022-03-28 07:48:49', NULL, NULL),
(10, 'Kokeno Stephen Oloo', 'ryp0009@rayzonschools.com', NULL, '$2y$10$J6z/TvvjgVpf28Au39wQyONfbBk8O6VLq.ORpu00gMrbuMC4ip/ZC', 5, 'Parent', 9, 1, NULL, NULL, 1, '2022-03-28 07:56:55', NULL, NULL),
(11, 'Samst Amin', 'ryp0010@rayzonschools.com', NULL, '$2y$10$WUiv4TkIWNR6G4naFOYv0uLjElNWSLChi9ludVDmxBw0gtnt/udOy', 5, 'Parent', 10, 1, NULL, NULL, 1, '2022-03-28 08:07:10', NULL, NULL),
(12, 'Richard Kiptoo', 'ryp0011@rayzonschools.com', NULL, '$2y$10$09eZaQoLNHm2CuJIRJqGOeMgrIKf194BeBllkiyBnTmcghbsppLf6', 5, 'Parent', 11, 1, NULL, NULL, 1, '2022-03-28 08:11:51', NULL, NULL),
(13, 'Sylvia Nasimiyu', 'ryp0012@rayzonschools.com', NULL, '$2y$10$zpxe9rbZiniaVd.qjuz0QOWzzU7njS2uPQ85SHms4yOJRdNdSDRF6', 5, 'Parent', 12, 1, NULL, NULL, 1, '2022-03-28 08:17:40', NULL, NULL),
(14, 'Michael Lugalia', 'ryp0013@rayzonschools.com', NULL, '$2y$10$2nrT0SXpNs/oD0XY1Ygea.JDbBRTD.tZZjm9qTB0GITnEdygKPCvK', 5, 'Parent', 13, 1, NULL, NULL, 1, '2022-03-28 08:25:07', NULL, NULL),
(15, 'Peter Maloba Wamoto', 'ryp0014@rayzonschools.com', NULL, '$2y$10$lxHmkoHWCGiKAx1N6rMCLe5vnEHT9TBfsfGz7VQ.3Majr.ftvxxLq', 5, 'Parent', 14, 1, NULL, NULL, 1, '2022-03-28 08:29:45', NULL, NULL),
(16, 'Mercy Werunga', 'ryp0015@rayzonschools.com', NULL, '$2y$10$V8nNSq8YmsnJuusCeLPonu5M8SOPC4.uS7hwlyn2lZeEUE9zZzhyy', 5, 'Parent', 15, 1, NULL, NULL, 1, '2022-03-28 13:25:12', NULL, NULL),
(17, 'Bernard Langat', 'ryp0016@rayzonschools.com', NULL, '$2y$10$NPR6.ov2ZwLlr4oYPE3ZeOGAvMLSfRl2Ag4PID1a.CefpWHWwu3aq', 5, 'Parent', 16, 1, NULL, NULL, 1, '2022-03-28 13:34:20', NULL, NULL),
(18, 'Solomon Kokwo', 'ryp0017@rayzonschools.com', NULL, '$2y$10$4xCnRsrE2zqTnzsDXVCtMuA5UVR1tSj99M/L930uLnaJlAWE8Qo6q', 5, 'Parent', 17, 1, NULL, NULL, 1, '2022-03-28 13:42:31', NULL, NULL),
(19, 'Ferninard Ngome', 'ryp0018@rayzonschools.com', NULL, '$2y$10$cEZmqNC6CxxoGMQm2cz9J.LJXvNK94twxo89ZtWLGhZZZ3.OeKxbW', 5, 'Parent', 18, 1, NULL, NULL, 1, '2022-03-28 13:48:33', NULL, NULL),
(20, 'Kevin Gumo Magero', 'ryp0019@rayzonschools.com', NULL, '$2y$10$E.uoazWnP1.HeOLcCjJNGuP680ociHg4JQJpoqG6sXt82MDy/M.gq', 5, 'Parent', 19, 1, NULL, NULL, 1, '2022-03-28 13:52:47', NULL, NULL),
(21, 'Batan Khaemba', 'ryp0020@rayzonschools.com', NULL, '$2y$10$GQ9vHQWZd7wOYZiuUMU9vuSpXQzOnlUWaUtMjT68J7zkBBQAD0U5G', 5, 'Parent', 20, 1, NULL, NULL, 1, '2022-03-28 13:56:00', NULL, NULL),
(22, 'Thomas Odhiambo', 'ryp0021@rayzonschools.com', NULL, '$2y$10$nYdDPu224SISQM.LxsVTL.zJ1vggVlVIEmNQ.d4hmVlrq1souw2Sy', 5, 'Parent', 21, 1, NULL, NULL, 1, '2022-03-28 14:10:07', NULL, NULL),
(23, 'Samson Kibet', 'ryp0022@rayzonschools.com', NULL, '$2y$10$fn.AxV.F5He4qKEnYFKA0.vUDv37TyGP5CMx76R6Mfc0IWLNlJAE2', 5, 'Parent', 22, 1, NULL, NULL, 1, '2022-03-28 14:16:19', NULL, NULL),
(24, 'Eliud Nyogesa', 'ryp0023@rayzonschools.com', NULL, '$2y$10$07ADW.G6LydTgN/Urm.Z4OEZ1YHXCXsTedCyPZfGUdr1qUCAgvPjO', 5, 'Parent', 23, 1, NULL, NULL, 1, '2022-03-28 14:22:43', NULL, NULL),
(25, 'Douglas Lusaka', 'ryp0024@rayzonschools.com', NULL, '$2y$10$hfYxmzrc155uWAi3A0vtsOlL5xQJpjVwXs.faKF/TmlOIVD82GYdG', 5, 'Parent', 24, 1, NULL, NULL, 1, '2022-03-28 14:46:28', NULL, NULL),
(26, 'Martin Kiprop', 'ryp0025@rayzonschools.com', NULL, '$2y$10$xzlGrSSttVgVG7uqhepMdOdQhFg3MkWlmi635/khXrnXkFZIrvHIa', 5, 'Parent', 25, 1, NULL, NULL, 1, '2022-03-28 14:54:03', NULL, NULL),
(27, 'Arafat Mohsen', 'ryp0026@rayzonschools.com', NULL, '$2y$10$oVTmLYn2orlaooi0rFCPFuPiyZsiz6h/H3e3dcCWj.SBAqWJsD3fO', 5, 'Parent', 26, 1, NULL, NULL, 1, '2022-03-28 18:08:50', NULL, NULL),
(28, 'Justine Abuga', 'ryp0027@rayzonschools.com', NULL, '$2y$10$FyLIbX4zYBJCzmfJuUj3Ru75QFodRBdLwSpop.zFZGn2nTqjITp1W', 5, 'Parent', 27, 1, NULL, NULL, 1, '2022-03-28 18:16:14', NULL, NULL),
(29, 'Philip Simiyu', 'ryp0028@rayzonschools.com', NULL, '$2y$10$Te8ffp7bNRizScjYQb3Oi.0Wyi.KWWzJQNReB87yTehKCH5j5s9Uu', 5, 'Parent', 28, 1, NULL, NULL, 1, '2022-03-28 18:30:49', NULL, NULL),
(30, 'Kazungu Joseph', 'ryp0029@rayzonschools.com', NULL, '$2y$10$TGWFh2c7WUa81C//EUEp7eCPjh/5h/RI7iIXlMxXLgWWqABpC37FC', 5, 'Parent', 29, 1, NULL, NULL, 1, '2022-03-28 18:38:40', NULL, NULL),
(31, 'Fredrick Omondi', 'ryp0030@rayzonschools.com', NULL, '$2y$10$XEMBQT.UPsWTS/NnIx3G9enh/90dDwSJVcdhSqDpXCcF3gdHoUxx2', 5, 'Parent', 30, 1, NULL, NULL, 1, '2022-03-28 18:48:57', NULL, NULL),
(32, 'Boniface Musyoka', 'ryp0031@rayzonschools.com', NULL, '$2y$10$RCUybViqfAtMWI65E/Pj9urfufGo7EenaIggoHLuAN5dTt.indwo6', 5, 'Parent', 31, 1, NULL, NULL, 1, '2022-03-28 18:58:06', NULL, NULL),
(33, 'Lokalei Elizabeth', 'ryp0032@rayzonschools.com', NULL, '$2y$10$9L1./Hjy7pikHnahEoQYz.Z153eP07VKdJkvW/AvcHYknPA0/q61y', 5, 'Parent', 32, 1, NULL, NULL, 1, '2022-03-28 19:05:07', NULL, NULL),
(34, 'Bernard Koech', 'ryp0033@rayzonschools.com', NULL, '$2y$10$eV8K0kCzEUmL0sRL7WDD6u5nsHZEtgJGWD03aIK.q23wke4JXIQ1u', 5, 'Parent', 33, 1, NULL, NULL, 1, '2022-03-28 19:21:46', NULL, NULL),
(35, 'Richard Tormoi', 'ryp0034@rayzonschools.com', NULL, '$2y$10$yHe3Gt2ZLq94z04YFOfnWuuun.5GPnbzbqtSOzS3g49zSoT9AG8e2', 5, 'Parent', 34, 1, NULL, NULL, 1, '2022-03-28 19:26:48', NULL, NULL),
(36, 'Isaac Otieno Achiela', 'ryp0035@rayzonschools.com', NULL, '$2y$10$MMCJO7e4U2Jt08VuPjr7POHb2bczNXLo4p04ozGq0uDhE1wp.4TVG', 5, 'Parent', 35, 1, NULL, NULL, 1, '2022-03-28 19:35:24', NULL, NULL),
(37, 'Denis Panyako', 'ryp0036@rayzonschools.com', NULL, '$2y$10$Gyk2TKP.WnOhIuW0u.UPKuGTbUoLmHoT9wwhx52n7cKkmEjl2LMP6', 5, 'Parent', 36, 1, NULL, NULL, 1, '2022-03-28 19:46:16', NULL, NULL),
(38, 'June Kibor', 'ryp0037@rayzonschools.com', NULL, '$2y$10$TJPsj4iNfZRG3h2lv3wvJuyjvzNSahN4eKBfLjAVmTYg6UK4RGr2C', 5, 'Parent', 37, 1, NULL, NULL, 1, '2022-03-28 19:51:39', NULL, NULL),
(39, 'Raymond Pkemoi', 'ryp0038@rayzonschools.com', NULL, '$2y$10$5xqUIvmozBp82XykJLnmwur2chH2GAaLxPuKfk3yVmU.TFAk0SI8u', 5, 'Parent', 38, 1, NULL, NULL, 1, '2022-03-28 20:06:51', NULL, NULL),
(40, 'Leonard Ouma', 'ryp0039@rayzonschools.com', NULL, '$2y$10$GBXpeE9sPZbWx2Zc6JE5u.weM8HKjMDyX8HUTpLaarVpGMPDShuz.', 5, 'Parent', 39, 1, NULL, NULL, 1, '2022-03-28 20:14:13', NULL, NULL),
(41, 'Laban Chweya', 'ryp0040@rayzonschools.com', NULL, '$2y$10$jfb3f2Rak1a8ZLTsOz2vc.HTg2uiSE3eLNvqE4Cs10n0rMIUit/ky', 5, 'Parent', 40, 1, NULL, NULL, 1, '2022-03-28 20:34:57', NULL, NULL),
(42, 'Edward Wanyonyi', 'ryp0041@rayzonschools.com', NULL, '$2y$10$OWpQU6nQysEN6g1mUv6xKujAMOq6HdKVDf5kYwPT4fiR91aiNJCVi', 5, 'Parent', 41, 1, NULL, NULL, 1, '2022-03-28 20:40:32', NULL, NULL),
(43, 'Charles Murugami', 'ryp0042@rayzonschools.com', NULL, '$2y$10$F.8HHv.GN8V3VGYHEuM0JuO0w/7a5G/BHPYSh.VJcApBnYz3X1FSG', 5, 'Parent', 42, 1, NULL, NULL, 1, '2022-03-28 20:48:07', NULL, NULL),
(44, 'Nathan Makokha', 'ryp0043@rayzonschools.com', NULL, '$2y$10$9yhu3R0scYLgtcDAJ58TjO0UBp1LS7jMuW8EN2pP.YmcR.ro0qxgK', 5, 'Parent', 43, 1, NULL, NULL, 1, '2022-03-28 20:52:58', NULL, NULL),
(45, 'Juliet Mbarwa', 'ryp0044@rayzonschools.com', NULL, '$2y$10$qmYFmGqL/AovoAF8NvR8.ewB10TulK.Mc0EsNICr0OPzzK7Fy99nC', 5, 'Parent', 44, 1, NULL, NULL, 1, '2022-03-28 21:01:04', NULL, NULL),
(46, 'Bernard Odari', 'ryp0045@rayzonschools.com', NULL, '$2y$10$Vxq4dLtR.vbLUtTPlfMST.vITUsnYANoHlX9aoKA8yKy/AEiUr8vW', 5, 'Parent', 45, 1, NULL, NULL, 1, '2022-03-28 21:07:13', NULL, NULL),
(47, 'Michael Muhanda', 'ryp0046@rayzonschools.com', NULL, '$2y$10$VFD05moWcR01AfFjxcMCHOIwMKqQt57QWR8WnUYjcGEdzE/Aj1cv6', 5, 'Parent', 46, 1, NULL, NULL, 1, '2022-03-28 21:13:25', NULL, NULL),
(48, 'Philip Kapten', 'ryp0047@rayzonschools.com', NULL, '$2y$10$RpO.0G3Zbnj0dHTV860RduMwBugb6SJ6B8M4He7RxsaALBqSR.6nC', 5, 'Parent', 47, 1, NULL, NULL, 1, '2022-03-28 21:25:04', NULL, NULL),
(49, 'Conrald Ongaro', 'ryp0048@rayzonschools.com', NULL, '$2y$10$nWWDY3xNpLalCpMDnjdwq.gbkVjeKFAztpIUJV6Lu9RTF3DBfx5gu', 5, 'Parent', 48, 1, NULL, NULL, 1, '2022-03-28 21:30:00', NULL, NULL),
(50, 'Evans Muthama', 'ryp0049@rayzonschools.com', NULL, '$2y$10$eTHYKn3g/QcpQbAf/N2w3.5KiqAyrYHrDxZGUIpaidZw2y3wBj9Da', 5, 'Parent', 49, 1, NULL, NULL, 1, '2022-03-28 21:47:15', NULL, NULL),
(51, 'Isiah Oyugi', 'ryp0050@rayzonschools.com', NULL, '$2y$10$alXWElw1I8gzDztan1azX.6bVt0zsXShcpvTzGxNQ93JpAE7BdoeC', 5, 'Parent', 50, 1, NULL, NULL, 1, '2022-03-28 21:57:54', NULL, NULL),
(52, 'Benson Masika', 'ryp0051@rayzonschools.com', NULL, '$2y$10$U9kya.pNP8uJBl8QFRwQauMX41SW8aUMTTBI1bo6Sml1TUfd2w/u6', 5, 'Parent', 51, 1, NULL, NULL, 1, '2022-03-28 22:08:19', NULL, NULL),
(53, 'Stephen Gichana', 'ryp0052@rayzonschools.com', NULL, '$2y$10$UeZ2RizUKyKdYE2qdTUDFeJPubcfbXw.LruAs6WqKWCrHMooy3L.y', 5, 'Parent', 52, 1, NULL, NULL, 1, '2022-03-28 22:23:06', NULL, NULL),
(54, 'David Wanjala', 'ryp0053@rayzonschools.com', NULL, '$2y$10$fEgR9sO3sx.obqpEfyiwi.yjohzCYDAAYGFc.aYtoj1g1J5NYHeC.', 5, 'Parent', 53, 1, NULL, NULL, 1, '2022-03-28 22:37:23', NULL, NULL),
(55, 'Jedidah Mvula', 'ryp0054@rayzonschools.com', NULL, '$2y$10$fy8JOJ8Uj44XsGGtC..0Ce5w2VmOM77YJkm3XeEfH9CrFtr1.JPj2', 5, 'Parent', 54, 1, NULL, NULL, 1, '2022-03-28 22:45:53', NULL, NULL),
(56, 'William Yegon', 'ryp0055@rayzonschools.com', NULL, '$2y$10$.ZNIQ2VwCmFF4LIM92PARuw5vdsZ5MibrqkQcz3r7ru.lplCipRZC', 5, 'Parent', 55, 1, NULL, NULL, 1, '2022-03-28 22:52:20', NULL, NULL),
(57, 'Paul Otube Lukoriti', 'ryp0056@rayzonschools.com', NULL, '$2y$10$3mZPYQyp0yVjhbIBEyty.uj8cSgy0wUqWB4x4Aut//XdPURY.vJ7i', 5, 'Parent', 56, 1, NULL, NULL, 1, '2022-03-28 23:03:54', NULL, NULL),
(58, 'Jeffrey Kiptoo', 'ryp0057@rayzonschools.com', NULL, '$2y$10$vmvwPQz50VXQehCVDJqMV.A9TsS6l9lmfqVwBxe0dcxrJZvHJ33yy', 5, 'Parent', 57, 1, NULL, NULL, 1, '2022-03-28 23:11:57', NULL, NULL),
(59, 'Abdullahi Hassan', 'ryp0058@rayzonschools.com', NULL, '$2y$10$Aihq/EsTQvnzFRv.rqYJne41dmXwc0VfdqpBvzPCGBuTe.2HT2gUi', 5, 'Parent', 58, 1, NULL, NULL, 1, '2022-03-29 07:36:34', NULL, NULL),
(60, 'Gladys Cheruto', 'ryp0059@rayzonschools.com', NULL, '$2y$10$NW9Cm6vnJNOshgrYBP4AsOV5YRHB9.T34d3Nk1I1UNN7D/h.Arqua', 5, 'Parent', 59, 1, NULL, NULL, 1, '2022-03-29 07:40:38', NULL, NULL),
(61, 'Daniel Kiptoo', 'ryp0060@rayzonschools.com', NULL, '$2y$10$../8Iyo0Wn0CRY7YN/uHqu7eiBk855VPDNJ/QinEAJISdV.7z09nu', 5, 'Parent', 60, 1, NULL, NULL, 1, '2022-03-29 07:49:51', NULL, NULL),
(62, 'Bernard Imbuye', 'ryp0061@rayzonschools.com', NULL, '$2y$10$0etrKMrt0LOtnq6wY9MaWOazlAz.I7w24PElnYIFtxPmaGNT/p.ge', 5, 'Parent', 61, 1, NULL, NULL, 1, '2022-03-29 07:55:24', NULL, NULL),
(63, 'Michael Kimtai', 'ryp0062@rayzonschools.com', NULL, '$2y$10$KqqaGxXwb1vivnc2VfBupOpnNDQZ71OroUVxoi9pzZoGoPx/II1QO', 5, 'Parent', 62, 1, NULL, NULL, 1, '2022-03-29 07:59:06', NULL, NULL),
(64, 'Paul Opiyo', 'ryp0063@rayzonschools.com', NULL, '$2y$10$cqpgskrjQoOmcXVbwnkUY.4NtZ87MmKBD456J1kP9WVQyyzOOQF/C', 5, 'Parent', 63, 1, NULL, NULL, 1, '2022-03-29 08:05:07', NULL, NULL),
(65, 'Simon Otieno', 'ryp0064@rayzonschools.com', NULL, '$2y$10$XIWOrrjckn8JQMS8CiCIuO5KuqsGPUc3fxQlC3j3mPaGoyU8KzQqm', 5, 'Parent', 64, 1, NULL, NULL, 1, '2022-03-29 08:09:20', NULL, NULL),
(66, 'Paul Mutisya', 'ryp0065@rayzonschools.com', NULL, '$2y$10$lRq1bD1DM5OWWL1qSTrv.OuPygcVgK3Tt8BTKpEJsCqFW5n9Odbme', 5, 'Parent', 65, 1, NULL, NULL, 1, '2022-03-29 08:24:17', NULL, NULL),
(67, 'Austin Odhiambo', 'ryp0066@rayzonschools.com', NULL, '$2y$10$NUWkN5Q3tNkwgjK/qVoZYON5oGCSmYlS/b14xo3hLIPThL.2GdEvO', 5, 'Parent', 66, 1, NULL, NULL, 1, '2022-03-29 08:33:19', NULL, NULL),
(68, 'Henry Ouma', 'ryp0067@rayzonschools.com', NULL, '$2y$10$Oi3wj6nOIxPTsgTItm1we.zpg5.bK5RGtDHCLZWMl2T0cr0rnUL8.', 5, 'Parent', 67, 1, NULL, NULL, 1, '2022-03-29 08:37:51', NULL, NULL),
(69, 'Emmanuel Situma', 'ryp0068@rayzonschools.com', NULL, '$2y$10$DCMXD.gFWNtAzdFrO8.age5HEtXmuS1qIi.U9aV4p17uZyJFQABTe', 5, 'Parent', 68, 1, NULL, NULL, 1, '2022-03-29 08:42:32', NULL, NULL),
(70, 'Vincent Achola', 'ryp0069@rayzonschools.com', NULL, '$2y$10$/Iuv32umuSR2tpXnMQ5X4.JiiFs5w3TN8ubDNkH4XCGTxuD2xwgZy', 5, 'Parent', 69, 1, NULL, NULL, 1, '2022-03-29 08:47:44', NULL, NULL),
(71, 'John Wanyonyi', 'ryp0070@rayzonschools.com', NULL, '$2y$10$0HsvtZ78A8ahANKMtOBXwOqHO.BJlnjPp9MawQbWMl9yqeffAytOu', 5, 'Parent', 70, 1, NULL, NULL, 1, '2022-03-29 09:01:19', NULL, NULL),
(72, 'Samuel Momanyi', 'ryp0071@rayzonschools.com', NULL, '$2y$10$/o/7bOeonwvEwJdymwOCnekohq840mFezQykIONpBYpwCpMJGTfXm', 5, 'Parent', 71, 1, NULL, NULL, 1, '2022-03-29 09:15:03', NULL, NULL),
(73, 'Zacharia Mwangi', 'ryp0072@rayzonschools.com', NULL, '$2y$10$niiSORPFBVzKJFr3mrZnEOeBwT6NCtCkYi10dI5z0UY/E5t1euZGW', 5, 'Parent', 72, 1, NULL, NULL, 1, '2022-03-29 09:22:06', NULL, NULL),
(74, 'Serah Mafura', 'ryp0073@rayzonschools.com', NULL, '$2y$10$LiRyQWgErAPxCsrXG1UsP.l5Z8SHHHvprug2wQ60jtmm1NJ8hTQY2', 5, 'Parent', 73, 1, NULL, NULL, 1, '2022-03-29 09:28:54', NULL, NULL),
(75, 'Deborah Nayagate', 'ryp0074@rayzonschools.com', NULL, '$2y$10$elqL2xhfqT4oBtEZc.SKqemwXUCJ.7pW0HyXEpmPctLl6GWzWeTNq', 5, 'Parent', 74, 1, NULL, NULL, 1, '2022-03-29 09:44:34', NULL, NULL),
(76, 'Lilian Moraa', 'ryp0075@rayzonschools.com', NULL, '$2y$10$9hE4IKZdf0wTglZn2iUis.qUiZ1hqvZFTVdXKx.yJcRv4ywbjjOJu', 5, 'Parent', 75, 1, NULL, NULL, 1, '2022-03-29 09:48:27', NULL, NULL),
(77, 'Stanislaus Likoko', 'ryp0076@rayzonschools.com', NULL, '$2y$10$12NmEmeVEHWMt6Uj4tscT.s63DwsvVZirgkM6Si5L24s4MDv7Oz2q', 5, 'Parent', 76, 1, NULL, NULL, 1, '2022-03-29 09:53:12', NULL, NULL),
(78, 'Joel Momanyi', 'ryp0077@rayzonschools.com', NULL, '$2y$10$Kl4APzU0N294aOpELvS7bOJAnXaQXryCp6bZNo7nuRrpIFDkS9Yt6', 5, 'Parent', 77, 1, NULL, NULL, 1, '2022-03-29 09:57:04', NULL, NULL),
(79, 'Mike Mengich', 'ryp0078@rayzonschools.com', NULL, '$2y$10$asOC9afM6waH4p6YElNa4OA339JMczYiyzRsrJKrl/WP7y9wIromm', 5, 'Parent', 78, 1, NULL, NULL, 1, '2022-03-29 10:01:43', NULL, NULL),
(80, 'Erick Kibitok', 'ryp0079@rayzonschools.com', NULL, '$2y$10$R078f7IDg7vX2YhFsTNgbeDDS7fWNEsUQ4Z10T6p9.ik0QDHPl68i', 5, 'Parent', 79, 1, NULL, NULL, 1, '2022-03-29 10:52:10', NULL, NULL),
(81, 'Boaz Olando', 'ryp0080@rayzonschools.com', NULL, '$2y$10$k4iZq8k.DR5z8ukQiU/.Me6XOFnDcm4bKzeHFRTOXyjy6NSvTjUTa', 5, 'Parent', 80, 1, NULL, NULL, 1, '2022-03-29 11:11:04', NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `class_grades`
--
ALTER TABLE `class_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `class_managers`
--
ALTER TABLE `class_managers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_streams`
--
ALTER TABLE `class_streams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_connections`
--
ALTER TABLE `client_connections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coop_outboxes`
--
ALTER TABLE `coop_outboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coop_payments`
--
ALTER TABLE `coop_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `current_sessions`
--
ALTER TABLE `current_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount_levels`
--
ALTER TABLE `discount_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_departments`
--
ALTER TABLE `expense_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_sections`
--
ALTER TABLE `expense_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_discounts`
--
ALTER TABLE `fee_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fee_parameters`
--
ALTER TABLE `fee_parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `fee_payments`
--
ALTER TABLE `fee_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `mpesa_outboxes`
--
ALTER TABLE `mpesa_outboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mpesa_payments`
--
ALTER TABLE `mpesa_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `one_time_fees`
--
ALTER TABLE `one_time_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `optional_fees`
--
ALTER TABLE `optional_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `original_messages`
--
ALTER TABLE `original_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent_details`
--
ALTER TABLE `parent_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `payroll_parameters`
--
ALTER TABLE `payroll_parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_histories`
--
ALTER TABLE `promotion_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_profiles`
--
ALTER TABLE `school_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_departments`
--
ALTER TABLE `staff_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_members`
--
ALTER TABLE `staff_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_sections`
--
ALTER TABLE `staff_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `student_fees`
--
ALTER TABLE `student_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=931;

--
-- AUTO_INCREMENT for table `student_promotions`
--
ALTER TABLE `student_promotions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_timelines`
--
ALTER TABLE `student_timelines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `student_transports`
--
ALTER TABLE `student_transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_staff`
--
ALTER TABLE `temp_staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_students`
--
ALTER TABLE `temp_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_statuses`
--
ALTER TABLE `transaction_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_fleets`
--
ALTER TABLE `transport_fleets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_zones`
--
ALTER TABLE `transport_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transport_zone_fees`
--
ALTER TABLE `transport_zone_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

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
