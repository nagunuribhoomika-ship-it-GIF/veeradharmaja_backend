-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2026 at 01:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veera_dharmaja_events`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2b$10$ZT7Zii2PxtQAXWHEiFjiIemsO/KEJJYSxN37XKux1IbU22fPWskHS', '2026-02-03 05:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `occasion` varchar(100) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `name`, `phone`, `occasion`, `event_date`, `message`, `created_at`) VALUES
(1, 'nagunuri bhoomika', '111111', 'wedding', '2026-02-15', 'for booking event', '2026-02-13 11:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `cover_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `description`, `slug`, `created_at`, `status`, `cover_image`) VALUES
(1, 'Wedding Event', 'Wedding celebration', 'wedding', '2026-02-03 05:50:41', 1, NULL),
(2, 'Haldi', NULL, 'haldi', '2026-02-03 09:37:15', 1, NULL),
(3, 'Birthday', NULL, 'birthday', '2026-02-03 09:42:01', 1, NULL),
(4, 'Sangeeth', NULL, 'sangeeth', '2026-02-03 09:50:36', 1, NULL),
(5, 'Engagement', NULL, 'engagement', '2026-02-03 11:13:58', 1, NULL),
(6, 'program', NULL, 'program', '2026-02-03 11:36:29', 0, NULL),
(7, 'programmes', NULL, 'programmes', '2026-02-03 11:38:33', 0, NULL),
(8, 'party', NULL, 'party', '2026-02-05 05:48:14', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `type` enum('image','video') NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','deleted') DEFAULT 'active',
  `is_cover` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `event_id`, `type`, `file_path`, `created_at`, `status`, `is_cover`) VALUES
(1, 1, 'image', '/uploads/images/1770098993811-896231928.png', '2026-02-03 06:09:53', 'deleted', 0),
(2, 1, 'image', '/uploads/images/1770109290752-891619724.png', '2026-02-03 09:01:30', 'deleted', 0),
(3, 1, 'video', '/uploads/videos/1770110204865-712236189.mp4', '2026-02-03 09:16:44', 'deleted', 0),
(4, 1, 'video', '/uploads/videos/1770110233681-591975433.mp4', '2026-02-03 09:17:13', 'deleted', 0),
(5, 1, 'video', '/uploads/videos/1770110261633-281435897.mp4', '2026-02-03 09:17:41', 'deleted', 0),
(6, 1, 'image', '/uploads/images/1770115448654-957823786.png', '2026-02-03 10:44:08', 'deleted', 0),
(7, 1, 'image', '/uploads/images/1770115484030-376698086.png', '2026-02-03 10:44:44', 'deleted', 0),
(8, 5, 'image', '/uploads/images/1770117313744-693495529.png', '2026-02-03 11:15:13', 'deleted', 0),
(9, 6, 'image', '/uploads/images/1770118597017-672345339.png', '2026-02-03 11:36:37', 'active', 0),
(10, 6, 'image', '/uploads/images/1770118608441-373138339.png', '2026-02-03 11:36:48', 'active', 0),
(11, 8, 'image', '/uploads/images/1770270494622-135807279.jpg', '2026-02-05 05:48:14', 'active', 0),
(12, 8, 'image', '/uploads/images/1770270881949-727014727.jpg', '2026-02-05 05:54:41', 'active', 0),
(13, 8, 'image', '/uploads/images/1770270891467-251268368.jpg', '2026-02-05 05:54:51', 'active', 0),
(14, 8, 'image', '/uploads/images/1770270968091-16403568.jpg', '2026-02-05 05:56:08', 'active', 1),
(15, 1, 'image', '/uploads/images/1770270980975-117937758.jpg', '2026-02-05 05:56:20', 'deleted', 0),
(16, 5, 'image', '/uploads/images/1770276067600-74767117.jpg', '2026-02-05 07:21:07', 'deleted', 0),
(17, 5, 'image', '/uploads/images/1770806136386-804115321.jpg', '2026-02-11 10:35:36', 'deleted', 0),
(18, 4, 'image', '/uploads/images/1770806516682-920034850.jpg', '2026-02-11 10:41:56', 'active', 0),
(19, 2, 'image', '/uploads/images/1770806954359-907915331.jpg', '2026-02-11 10:49:14', 'active', 1),
(20, 3, 'image', '/uploads/images/1770807019909-61521059.jpg', '2026-02-11 10:50:19', 'active', 0),
(21, 3, 'image', '/uploads/images/1770807150355-792505405.jpg', '2026-02-11 10:52:30', 'active', 0),
(22, 3, 'image', '/uploads/images/1770807218556-922362108.png', '2026-02-11 10:53:38', 'active', 1),
(23, 1, 'image', '/uploads/images/1770887264009-133633791.webp', '2026-02-12 09:07:44', 'active', 1),
(24, 5, 'image', '/uploads/images/1770887416628-968441570.jpg', '2026-02-12 09:10:16', 'active', 0),
(25, 5, 'image', '/uploads/images/1770887510005-876426364.jpg', '2026-02-12 09:11:50', 'active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `description`, `created_at`, `image`) VALUES
(1, 'Event Venue Suggestions', 'Recommending suitable venues based on event type, guest count, theme, and budget.', '2026-02-12 09:34:54', 'images/venue.jpg'),
(2, 'Event Decoration Services', 'Beautiful decoration themes including floral setup, stage design, lighting, and customized themes.', '2026-02-12 09:34:54', 'images/decoration.jpg'),
(3, 'Food Catering Services', 'Premium catering services with buffet, live counters, desserts, and custom menu options.', '2026-02-12 09:34:54', 'images/catering.jpg'),
(4, 'Photography & Videography', 'Professional photography and videography services for capturing special moments.', '2026-02-12 09:34:54', 'images/photography.jpg'),
(5, 'Entertainment Services', 'Music, DJ, dance shows, and live entertainment arrangements for events.', '2026-02-12 09:34:54', 'images/entertainment.jpg'),
(6, 'Event Planning & Coordination', 'Complete end-to-end event planning, coordination, and execution support.', '2026-02-12 09:34:54', 'images/event_organization.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `service_features`
--

CREATE TABLE `service_features` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `feature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_features`
--

INSERT INTO `service_features` (`id`, `service_id`, `feature`) VALUES
(1, 1, 'Banquet Halls'),
(2, 1, 'Farm Houses'),
(3, 1, 'Resorts'),
(4, 1, 'Community Halls'),
(5, 1, 'Hotels'),
(6, 1, 'Open Lawns / Gardens'),
(7, 1, 'Heritage Properties / Palaces'),
(8, 1, 'Convention Centres'),
(9, 1, 'Auditoriums'),
(10, 2, 'Floral Decoration'),
(11, 2, 'Stage Setup'),
(12, 2, 'Lighting Arrangement'),
(13, 2, 'Theme Decoration'),
(14, 2, 'Mandap Decoration'),
(15, 2, 'Entrance Decoration'),
(16, 3, 'Buffet Service'),
(17, 3, 'Live Counters'),
(18, 3, 'Desserts & Sweets'),
(19, 3, 'Custom Menu Planning'),
(20, 3, 'Traditional & Multi-Cuisine'),
(21, 4, 'Wedding Photography'),
(22, 4, 'Candid Photography'),
(23, 4, 'Event Videography'),
(24, 4, 'Drone Photography'),
(25, 4, 'Photo Albums'),
(26, 5, 'DJ & Music'),
(27, 5, 'Live Bands'),
(28, 5, 'Dance Performances'),
(29, 5, 'Anchors / Hosts'),
(30, 5, 'Celebrity Management'),
(31, 6, 'Event Planning'),
(32, 6, 'Guest Management'),
(33, 6, 'Vendor Coordination'),
(34, 6, 'Timeline Management'),
(35, 6, 'On-site Event Support');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_features`
--
ALTER TABLE `service_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_features`
--
ALTER TABLE `service_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_features`
--
ALTER TABLE `service_features`
  ADD CONSTRAINT `service_features_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
