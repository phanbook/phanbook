-- phpMyAdmin SQL Dump
-- version 4.5.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2015 at 02:45 PM
-- Server version: 5.5.41-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phanbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `type` char(1) NOT NULL,
  `postsId` int(10) unsigned DEFAULT NULL,
  `createdAt` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `usersId`, `type`, `postsId`, `createdAt`) VALUES
(1, 23, 'U', NULL, NULL),
(2, 24, 'U', NULL, 1431165028),
(3, 25, 'U', NULL, 1431166358),
(4, 26, 'U', NULL, 1431167883),
(5, 27, 'U', NULL, 1431168990),
(6, 28, 'U', NULL, 1431190884),
(7, 29, 'U', NULL, 1431191240),
(8, 30, 'U', NULL, 1431192016),
(9, 31, 'U', NULL, 1431192194),
(10, 32, 'U', NULL, 1431193106),
(11, 33, 'U', NULL, 1431193773),
(12, 34, 'U', NULL, 1431193879),
(13, 35, 'U', NULL, 1431193945),
(14, 36, 'U', NULL, 1431193959),
(15, 37, 'U', NULL, 1431194000),
(16, 38, 'U', NULL, 1431194066),
(17, 39, 'U', NULL, 1431194125),
(18, 40, 'U', NULL, 1431194851),
(19, 41, 'U', NULL, 1431195134),
(20, 42, 'U', NULL, 1431195330),
(21, 43, 'U', NULL, 1431308713),
(22, 44, 'U', NULL, 1431308972),
(23, 45, 'U', NULL, 1431309032),
(24, 46, 'U', NULL, 1431698227),
(25, 47, 'U', NULL, 1431843555),
(26, 48, 'U', NULL, 1432956258),
(27, 49, 'U', NULL, 1433501295),
(28, 50, 'U', NULL, 1433522311),
(29, 51, 'U', NULL, 1433522781),
(30, 52, 'U', NULL, 1433522864),
(31, 53, 'U', NULL, 1433522956),
(32, 54, 'U', NULL, 1433537418),
(33, 55, 'U', NULL, 1433596909),
(34, 56, 'U', NULL, 1433663836),
(35, 57, 'U', NULL, 1434202351),
(36, 58, 'U', NULL, 1434421892),
(37, 59, 'U', NULL, 1434551252),
(38, 60, 'U', NULL, 1435210795),
(39, 61, 'U', NULL, 1435210956),
(40, 62, 'U', NULL, 1435398269),
(41, 63, 'U', NULL, 1435556491),
(42, 64, 'U', NULL, 1435557180),
(43, 65, 'U', NULL, 1435557801),
(44, 66, 'U', NULL, 1435558508),
(45, 67, 'U', NULL, 1435559933),
(46, 68, 'U', NULL, 1435563012),
(47, 69, 'U', NULL, 1435563557),
(48, 70, 'U', NULL, 1435563783),
(49, 71, 'U', NULL, 1435563802),
(50, 72, 'U', NULL, 1435563922),
(51, 73, 'U', NULL, 1435565836),
(52, 74, 'U', NULL, 1435678770),
(53, 75, 'U', NULL, 1435678971),
(54, 76, 'U', NULL, 1435679912),
(55, 77, 'U', NULL, 1435888853),
(56, 78, 'U', NULL, 1436190190),
(57, 79, 'U', NULL, 1436934805),
(58, 80, 'U', NULL, 1437273168),
(59, 78, 'C', 71, 1438181036),
(60, 78, 'C', 71, 1438181079),
(61, 78, 'C', 71, 1438181096),
(62, 78, 'C', 71, 1438181141),
(63, 78, 'C', 71, 1438181272),
(64, 78, 'C', 71, 1438181322),
(65, 78, 'C', 71, 1438181455),
(66, 78, 'C', 71, 1438181529),
(67, 78, 'C', 71, 1438181553),
(68, 78, 'C', 71, 1438181951),
(69, 78, 'C', 71, 1438181978),
(70, 78, 'C', 71, 1438182044),
(71, 78, 'C', 71, 1438182059),
(72, 78, 'C', 71, 1438182159),
(73, 78, 'C', 68, 1438182505),
(74, 78, 'C', 68, 1438182533),
(75, 78, 'C', 68, 1438182549),
(76, 78, 'C', 68, 1438182607),
(77, 78, 'C', 68, 1438182668),
(78, 78, 'C', 68, 1438183460),
(79, 78, 'C', 68, 1438183551),
(80, 78, 'C', 68, 1438183626),
(81, 78, 'C', 68, 1438183741),
(82, 78, 'C', 68, 1438183793),
(83, 78, 'C', 68, 1438183851),
(84, 78, 'C', 68, 1438183924),
(85, 78, 'C', 68, 1438184385),
(86, 78, 'C', 68, 1438184415),
(87, 78, 'C', 68, 1438184443),
(88, 78, 'C', 68, 1438184483),
(89, 78, 'C', 68, 1438184755),
(90, 78, 'C', 68, 1438184759),
(91, 78, 'C', 68, 1438184783),
(92, 78, 'C', 68, 1438185511),
(93, 78, 'C', 68, 1438185514),
(94, 78, 'C', 70, 1438185859),
(95, 78, 'C', 70, 1438185891),
(96, 78, 'C', 70, 1438186051),
(97, 59, 'C', 71, 1438223343),
(98, 59, 'C', 68, 1438224055),
(99, 59, 'P', NULL, 1438225705),
(100, 59, 'P', 73, 1438225781),
(101, 59, 'P', 74, 1438225810),
(102, 59, 'P', 75, 1438226079),
(103, 59, 'P', 76, 1438226275),
(104, 59, 'P', 77, 1438226363),
(105, 59, 'R', 76, 1438265705),
(106, 59, 'R', 77, 1438316965),
(107, 59, 'R', 77, 1438317345),
(108, 59, 'R', 49, 1438317457),
(109, 59, 'R', 49, 1438317570),
(110, 59, 'R', 49, 1438317704),
(111, 59, 'R', 49, 1438317870),
(112, 59, 'R', 49, 1438318088),
(113, 59, 'R', 49, 1438318136),
(114, 78, 'P', 78, 1438327237),
(115, 78, 'P', 79, 1438327342),
(116, 78, 'P', 80, 1438327369),
(117, 78, 'P', 81, 1438333233),
(118, 59, 'R', 80, 1438334858),
(119, 59, 'R', 66, 1438497292);

-- --------------------------------------------------------

--
-- Table structure for table `activityNotifications`
--

CREATE TABLE IF NOT EXISTS `activityNotifications` (
  `id` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL COMMENT 'this is user display in notification',
  `postsId` int(10) unsigned NOT NULL,
  `postsReplyId` int(10) unsigned DEFAULT NULL,
  `type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `usersOriginId` int(10) unsigned DEFAULT NULL COMMENT 'This is field of user recive notification',
  `createdAt` int(11) unsigned DEFAULT NULL,
  `wasRead` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `extra` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activityNotifications`
--

INSERT INTO `activityNotifications` (`id`, `usersId`, `postsId`, `postsReplyId`, `type`, `usersOriginId`, `createdAt`, `wasRead`, `extra`) VALUES
(1, 1, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(2, 2, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(3, 3, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(4, 4, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(5, 21, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(6, 33, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(7, 37, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(8, 38, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(9, 39, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(10, 45, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(11, 46, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(12, 47, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(13, 48, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(14, 49, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(15, 50, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(16, 53, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(17, 54, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(18, 55, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(19, 56, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(20, 57, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(21, 58, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(22, 60, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(23, 61, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(24, 62, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(25, 73, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(26, 75, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(27, 76, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(28, 77, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(29, 78, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(30, 79, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(31, 80, 68, 158, 'R', 59, 1438224055, 'N', NULL),
(32, 59, 68, 158, 'R', 59, 1438224055, 'Y', NULL),
(33, 1, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(34, 2, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(35, 3, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(36, 4, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(37, 21, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(38, 33, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(39, 37, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(40, 38, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(41, 39, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(42, 45, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(43, 46, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(44, 47, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(45, 48, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(46, 49, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(47, 50, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(48, 53, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(49, 54, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(50, 55, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(51, 56, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(52, 57, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(53, 58, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(54, 60, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(55, 61, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(56, 62, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(57, 73, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(58, 75, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(59, 76, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(60, 77, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(61, 78, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(62, 79, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(63, 80, 76, 159, 'R', 59, 1438265705, 'N', NULL),
(64, 1, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(65, 2, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(66, 3, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(67, 4, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(68, 21, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(69, 33, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(70, 37, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(71, 38, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(72, 39, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(73, 45, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(74, 46, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(75, 47, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(76, 48, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(77, 49, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(78, 50, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(79, 53, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(80, 54, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(81, 55, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(82, 56, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(83, 57, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(84, 58, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(85, 60, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(86, 61, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(87, 62, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(88, 73, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(89, 75, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(90, 76, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(91, 77, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(92, 78, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(93, 79, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(94, 80, 77, 160, 'R', 59, 1438316965, 'N', NULL),
(95, 78, 77, 161, 'R', 59, 1438317345, 'N', NULL),
(96, 78, 49, 162, 'R', 59, 1438317457, 'N', NULL),
(97, 78, 49, 163, 'R', 59, 1438317570, 'N', NULL),
(98, 78, 49, 164, 'R', 59, 1438317704, 'N', NULL),
(99, 78, 49, 165, 'R', 59, 1438317870, 'N', NULL),
(100, 78, 49, 166, 'R', 59, 1438318088, 'N', NULL),
(101, 78, 49, 167, 'R', 59, 1438318136, 'N', NULL),
(102, 78, 80, 168, 'R', 59, 1438334858, 'N', NULL),
(103, 1, 1, 1, 'B', 1, 1438416414, 'N', 'Commentator'),
(104, 3, 1, 1, 'B', 3, 1438416414, 'N', 'Commentator'),
(105, 59, 1, 1, 'B', 59, 1438416414, 'Y', 'Commentator'),
(106, 78, 1, 1, 'B', 78, 1438416414, 'N', 'Commentator'),
(107, 78, 79, NULL, 'P', 59, 1438417324, 'N', NULL),
(108, 78, 79, NULL, 'P', 59, 1438417336, 'N', NULL),
(109, 78, 79, NULL, 'P', 59, 1438417456, 'N', NULL),
(110, 78, 79, NULL, 'P', 59, 1438417461, 'N', NULL),
(111, 1, 1, 1, 'B', 1, 1438417666, 'N', 'Critic'),
(112, 2, 1, 1, 'B', 2, 1438417666, 'N', 'Critic'),
(113, 3, 1, 1, 'B', 3, 1438417666, 'N', 'Critic'),
(114, 45, 1, 1, 'B', 45, 1438417666, 'N', 'Commentator'),
(115, 45, 1, 1, 'B', 45, 1438417666, 'N', 'Critic'),
(116, 47, 1, 1, 'B', 47, 1438417666, 'N', 'Commentator'),
(117, 47, 1, 1, 'B', 47, 1438417666, 'N', 'Critic'),
(118, 48, 1, 1, 'B', 48, 1438417666, 'N', 'Critic'),
(119, 57, 1, 1, 'B', 57, 1438417666, 'N', 'Critic'),
(120, 59, 1, 1, 'B', 59, 1438417666, 'Y', 'Critic'),
(121, 78, 1, 1, 'B', 78, 1438417666, 'N', 'Critic'),
(122, 2, 1, 1, 'B', 2, 1438418487, 'N', 'Moderator'),
(123, 3, 1, 1, 'B', 3, 1438418487, 'N', 'Moderator'),
(124, 45, 1, 1, 'B', 45, 1438418487, 'N', 'Moderator'),
(125, 59, 1, 1, 'B', 59, 1438418487, 'Y', 'Moderator'),
(126, 78, 1, 1, 'B', 78, 1438418606, 'N', 'Pundit'),
(127, 1, 1, 1, 'B', 1, 1438418629, 'N', 'Scholar'),
(128, 45, 1, 1, 'B', 45, 1438418629, 'N', 'Scholar'),
(129, 47, 1, 1, 'B', 47, 1438418629, 'N', 'Scholar'),
(130, 59, 1, 1, 'B', 59, 1438418629, 'Y', 'Scholar'),
(131, 77, 1, 1, 'B', 77, 1438418629, 'N', 'Scholar'),
(132, 78, 1, 1, 'B', 78, 1438418629, 'N', 'Scholar'),
(133, 1, 1, 1, 'B', 1, 1438418766, 'N', 'Supporter'),
(134, 3, 1, 1, 'B', 3, 1438418766, 'N', 'Supporter'),
(135, 45, 1, 1, 'B', 45, 1438418766, 'N', 'Supporter'),
(136, 47, 1, 1, 'B', 47, 1438418766, 'N', 'Supporter'),
(137, 48, 1, 1, 'B', 48, 1438418766, 'N', 'Supporter'),
(138, 58, 1, 1, 'B', 58, 1438418766, 'N', 'Supporter'),
(139, 59, 1, 1, 'B', 59, 1438418766, 'Y', 'Supporter'),
(140, 77, 1, 1, 'B', 77, 1438418766, 'N', 'Supporter'),
(141, 78, 1, 1, 'B', 78, 1438418766, 'N', 'Supporter'),
(142, 1, 1, 1, 'B', 1, 1438418780, 'N', 'Teacher'),
(143, 45, 1, 1, 'B', 45, 1438418780, 'N', 'Teacher'),
(144, 59, 1, 1, 'B', 59, 1438418780, 'Y', 'Teacher'),
(145, 77, 1, 1, 'B', 77, 1438418780, 'N', 'Teacher'),
(146, 1, 1, 1, 'B', 1, 1438427414, 'N', 'Scholar'),
(147, 1, 1, 1, 'B', 1, 1438427414, 'N', 'Teacher'),
(148, 1, 1, 1, 'B', 1, 1438427414, 'N', 'Commentator'),
(149, 1, 1, 1, 'B', 1, 1438427414, 'N', 'Supporter'),
(150, 1, 1, 1, 'B', 1, 1438427414, 'N', 'Critic'),
(151, 2, 1, 1, 'B', 2, 1438427414, 'N', 'Moderator'),
(152, 2, 1, 1, 'B', 2, 1438427414, 'N', 'Critic'),
(153, 3, 1, 1, 'B', 3, 1438427414, 'N', 'Moderator'),
(154, 3, 1, 1, 'B', 3, 1438427414, 'N', 'Commentator'),
(155, 3, 1, 1, 'B', 3, 1438427414, 'N', 'Supporter'),
(156, 3, 1, 1, 'B', 3, 1438427414, 'N', 'Critic'),
(157, 45, 1, 1, 'B', 45, 1438427414, 'N', 'Scholar'),
(158, 45, 1, 1, 'B', 45, 1438427414, 'N', 'Teacher'),
(159, 45, 1, 1, 'B', 45, 1438427414, 'N', 'Moderator'),
(160, 45, 1, 1, 'B', 45, 1438427414, 'N', 'Supporter'),
(161, 45, 1, 1, 'B', 45, 1438427414, 'N', 'Critic'),
(162, 47, 1, 1, 'B', 47, 1438427414, 'N', 'Scholar'),
(163, 47, 1, 1, 'B', 47, 1438427414, 'N', 'Supporter'),
(164, 47, 1, 1, 'B', 47, 1438427414, 'N', 'Critic'),
(165, 48, 1, 1, 'B', 48, 1438427414, 'N', 'Supporter'),
(166, 48, 1, 1, 'B', 48, 1438427414, 'N', 'Critic'),
(167, 57, 1, 1, 'B', 57, 1438427414, 'N', 'Critic'),
(168, 58, 1, 1, 'B', 58, 1438427414, 'N', 'Supporter'),
(169, 59, 1, 1, 'B', 59, 1438427414, 'N', 'Scholar'),
(170, 59, 1, 1, 'B', 59, 1438427414, 'N', 'Teacher'),
(171, 59, 1, 1, 'B', 59, 1438427414, 'N', 'Moderator'),
(172, 59, 1, 1, 'B', 59, 1438427414, 'N', 'Commentator'),
(173, 59, 1, 1, 'B', 59, 1438427414, 'N', 'Supporter'),
(174, 59, 1, 1, 'B', 59, 1438427414, 'N', 'Critic'),
(175, 77, 1, 1, 'B', 77, 1438427414, 'N', 'Scholar'),
(176, 77, 1, 1, 'B', 77, 1438427414, 'N', 'Teacher'),
(177, 77, 1, 1, 'B', 77, 1438427415, 'N', 'Supporter'),
(178, 78, 1, 1, 'B', 78, 1438427415, 'N', 'Scholar'),
(179, 78, 1, 1, 'B', 78, 1438427415, 'N', 'Pundit'),
(180, 78, 1, 1, 'B', 78, 1438427415, 'N', 'Commentator'),
(181, 78, 1, 1, 'B', 78, 1438427415, 'N', 'Supporter'),
(182, 78, 1, 1, 'B', 78, 1438427415, 'N', 'Critic'),
(183, 78, 66, NULL, 'P', 59, 1438494510, 'N', NULL),
(184, 78, 66, NULL, 'P', 59, 1438494513, 'N', NULL),
(185, 78, 66, 169, 'R', 59, 1438497292, 'N', NULL),
(186, 78, 66, NULL, 'P', 59, 1438503008, 'N', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(72) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(32) DEFAULT NULL,
  `numberPosts` int(10) unsigned DEFAULT NULL,
  `noBounty` char(1) NOT NULL DEFAULT 'N',
  `noDigest` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `slug`, `numberPosts`, `noBounty`, `noDigest`) VALUES
(1, 'First Category', 'Description Category', 'first', 1, 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) unsigned NOT NULL,
  `userId` int(11) unsigned NOT NULL,
  `objectId` int(11) unsigned NOT NULL,
  `object` varchar(32) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `createdAt` int(11) NOT NULL,
  `modifiedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `userId`, `objectId`, `object`, `content`, `createdAt`, `modifiedAt`) VALUES
(1, 1, 38, 'posts', 'blah blah blah. this is my first comment on hovercrowd :) There are many technology topics we can cover. It''s important to ', 1428218680, NULL),
(2, 2, 38, 'posts', 'Why Thank so much but', 1428218680, NULL),
(3, 1, 2, 'posts', ' Why Thank so much. You are wellcome on phanbook ', 2147483647, NULL),
(4, 2, 1, 'postsReply', 'Hi. I''ve created dispatcher for this. Inspired by Laravel5 this thread and this on', 1428218680, NULL),
(5, 1, 5, 'postsReply', 'A builder is available to create PHQL queries without the need to write PHQL statements, also providing IDE facilities:', 1428218680, NULL),
(6, 2, 1, 'task', 'nice comment', 1428218680, NULL),
(7, 3, 1, 'task', 'kio', 2147483647, NULL),
(8, 2, 6, 'task', 'nice', 2147483647, NULL),
(9, 2, 7, 'task', 'nice', 2147483647, NULL),
(10, 2, 7, 'task', 'll', 2147483647, NULL),
(11, 2, 5, 'submission', 'ok', 2147483647, NULL),
(12, 1, 5, 'postsReply', 'A builder is available to create PHQL queries without the need to write PHQL statements, also providing IDE facilities:', 1428218680, NULL),
(13, 45, 48, 'posts', 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. ', 1433538700, NULL),
(14, 45, 48, 'posts', 'pics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug rela', 1433538726, NULL),
(15, 45, 49, 'posts', 'pics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug rela', 1433538780, NULL),
(16, 45, 46, 'posts', '\r\n\r\nChanging coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.\r\n', 1433539082, NULL),
(17, 45, 50, 'posts', 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have', 1433772252, NULL),
(18, 47, 52, 'posts', 'Obtain a packet capture with an MS-CHAPv2 network handshake in it (PPTP VPN or WPA2 Enterprise handshake, for instance).', 1434254686, NULL),
(19, 47, 52, 'posts', 'Obtain a packet capture with an MS-CHAPv2 network handshake in it', 1434254730, NULL),
(20, 47, 67, 'posts', 'In summary I would say the significance of reionisation is twofold. First it offers an opportunity to probe and test our ideas about the formation of stars and galaxies in the otherwise very hard to observe early universe. Second, the end of the "dark ages", marks the point where baryonic matter takes a very active role in shaping the formation of stars and galaxies. The radiation from the first stars exerts a strong negative feedback the collapsing ionised gas around it and can drive galactic winds and outflows. Prior to this, dark matter was the dominant influence, but reionisation couples the radiation and baryonic matter together again on galaxy-sized scales.', 1434255149, NULL),
(21, 45, 1, 'posts', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)..We recommend powering off your droplet through the command line, as this action is the same as hard resetting the server and may cause data corruption.', 1434521189, NULL),
(22, 47, 50, 'posts', 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controlle', 1434522742, NULL),
(23, 47, 76, 'posts', 'All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented: Weekly Digest\r\n', 1434961681, NULL),
(24, 47, 51, 'posts', 'Comment All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented: Weekly Digest\r\n', 1434961701, NULL),
(25, 47, 76, 'posts', 'Yep How are you today ?', 1434961721, NULL),
(26, 47, 49, 'posts', '\r\npics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems', 1434961771, NULL),
(27, 47, 66, 'posts', '\r\npics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug rela–  Eva-Thien 16d ago  \r\n', 1434961785, NULL),
(28, 47, 62, 'posts', '\r\npics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug rela–  Eva-Thien 16d ago  \r\n', 1434961822, NULL),
(29, 47, 62, 'postsReply', '\r\npics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug rela–  Eva-Thien 16d ago  \r\n', 1434961990, NULL),
(30, 47, 62, 'postsReply', 'Fix comment post reply', 1434962093, NULL),
(31, 47, 53, 'posts', 'This is first my tip, any comment wellcome', 1434964517, NULL),
(32, 78, 62, 'posts', 'test notification :)', 1436190385, NULL),
(33, 59, 67, 'posts', 'The CSS background-image property allows us to apply one or more background images to any HTML element. In this video I will explain how to use the property, including how to write URL values correctly, and how to write local and absolute paths to images.', 1437017202, NULL),
(34, 59, 57, 'posts', '. If internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resending the email, as opposed to building that intelligence into your sending application', 1437107700, NULL),
(35, 59, 57, 'posts', 'If internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resending the email, as opposed to building that intelligence into your sending application', 1437107977, NULL),
(36, 78, 57, 'posts', 'It’s an integer < 2**32. Jobs with smaller priority values will be scheduled before jobs with larger priorities. The most urgent priority is 0; the least urgent priority is 4,294,967,295.', 1437108044, NULL),
(37, 59, 57, 'posts', '<?php\r\n\r\n//Connect to the queue\r\n$queue = new Phalcon\\Queue\\Beanstalk(array(\r\n    ''host'' => ''192.168.0.21''\r\n));\r\n\r\n//Insert the job in the queue\r\n$queue->put(array(''processVideo'' => 4871));', 1437108062, NULL),
(38, 78, 57, 'posts', 'Works, but had you read the upgrade guide, you would''ve found out you need to use your Registrar''s method in app\\Services\\ and copy them to your AuthController. ', 1437108096, NULL),
(39, 59, 57, 'posts', '```public function store(Request $request)\r\n{\r\n\r\n    if(Auth::guest())\r\n    {\r\n        // Validate user''s details\r\n        $validator = Validator::make($request->all(), [\r\n            ''email'' => ''required|email'',\r\n            ''password'' => ''required|min:5'',\r\n        ]);\r\n\r\n        // If validation fails redirect back to the sign up page\r\n        if ($validator->fails()) {\r\n            return redirect(''subscription/signup'')\r\n                ->withErrors($validator)\r\n                ->withInput();\r\n        }```', 1437108114, NULL),
(40, 59, 67, 'posts', 'The CSS background-image property allows us to apply one or more background images to any HTML element. In this video I will explain how to use the property, including how to write URL values correctly, and how to write local and absolute paths to images.', 1437196766, NULL),
(41, 78, 67, 'posts', 'We just launched this Big New Internet Thing, so we''d love some Big New Internet Feedback. What''s cool? What''s uncool? (The video? yeah, I agree!) Comment below and we can interface about increasing stakeholder satisfaction in a meaningful and organic manner.\r\n\r\nPhanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.\r\n', 1437196787, NULL),
(42, 59, 69, 'posts', 'In this tutorial, we covered the basics of provisioning via shell and installed Phalcon (and joe) with a booting VM. Coming soon is a followup article from Matthew Setter which will deal with further customizations of the downloaded provision settings from PuPHPet.', 1437198306, NULL),
(43, 59, 60, 'posts', 'mber the human. When you communicate online, all you see is a computer screen. When talking to someone you might want to ask yourself "Would I say it to the person''s face?" or "Would I get jumped if I said this to a buddy?"', 1437199214, NULL),
(44, 59, 60, 'posts', 'mber the human. When you communicate online, all you see is a computer screen. When talking to someone you might want to ask yourself "Would I say it to the person''s face?" or "Would I get jumped if I said this to a buddy?"', 1437199221, NULL),
(45, 59, 68, 'postsReply', 'Prior to this, dark matter was the dominant influence, but reionisation couples the radiation and baryonic matter together again on galaxy-sized scales.', 1437200465, NULL),
(46, 78, 70, 'posts', 'Gg', 1437494189, NULL),
(47, 59, 70, 'posts', 'Have you ever been contacted for some job related with Phalcon?', 1437831251, NULL),
(48, 59, 69, 'posts', 'Have you ever been contacted for some job related with Phalcon?', 1437831296, NULL),
(49, 59, 77, 'posts', 'Phalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.', 1438429222, NULL),
(50, 59, 66, 'posts', 'are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assi', 1438429752, NULL),
(51, 59, 66, 'posts', 'good question', 1438493513, NULL),
(52, 59, 108, 'postsReply', 'We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.\r\nshare', 1438493587, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `id` int(11) unsigned NOT NULL,
  `idOrganization` int(11) unsigned NOT NULL DEFAULT '0',
  `key` varchar(64) NOT NULL,
  `type` enum('bool','string','int','array') NOT NULL DEFAULT 'string',
  `value` text,
  `caption` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `idOrganization`, `key`, `type`, `value`, `caption`) VALUES
(1, 0, 'ITEMS_PER_PAGE', 'array', '10;20;50;100;150;200', 'Number of rows displayed on a listing page. ; it''s the separating values'),
(2, 0, 'PASSWORD_RESET_INTERVAL', 'int', '10', 'Password reset interval '),
(3, 3, 'TASK', 'string', 'Task', 'Label for "task"'),
(4, 1, 'TASK', 'string', 'Item', 'Label for "task"');

-- --------------------------------------------------------

--
-- Table structure for table `failedLogins`
--

CREATE TABLE IF NOT EXISTS `failedLogins` (
  `id` int(15) NOT NULL DEFAULT '0',
  `usersId` int(15) NOT NULL,
  `ipAddress` varchar(100) NOT NULL,
  `attempted` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `failedLogins`
--

INSERT INTO `failedLogins` (`id`, `usersId`, `ipAddress`, `attempted`) VALUES
(0, 0, '14.169.34.124', 1437844923),
(0, 0, '14.169.34.124', 1437844938);

-- --------------------------------------------------------

--
-- Table structure for table `irclog`
--

CREATE TABLE IF NOT EXISTS `irclog` (
  `id` int(10) unsigned NOT NULL,
  `who` varchar(64) NOT NULL,
  `content` text,
  `datelog` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `postsReplyId` int(10) unsigned DEFAULT NULL,
  `type` char(1) NOT NULL,
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL,
  `messageId` char(60) DEFAULT NULL,
  `sent` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `usersId`, `postsId`, `postsReplyId`, `type`, `createdAt`, `modifiedAt`, `messageId`, `sent`) VALUES
(7, 78, 80, 168, 'R', 1438334858, NULL, NULL, 'N'),
(8, 78, 66, 169, 'R', 1438497292, NULL, NULL, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `notificationsBounces`
--

CREATE TABLE IF NOT EXISTS `notificationsBounces` (
  `id` int(10) unsigned NOT NULL,
  `email` varchar(120) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `diagnostic` varchar(120) DEFAULT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `reported` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(12) NOT NULL,
  `key` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createdAt` int(11) DEFAULT NULL,
  `editedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `key`, `title`, `content`, `createdAt`, `editedAt`) VALUES
(1, 'help', 'Helper  of Phanbook', '<div>\r\n        <p class="info">\r\n            Phanbook is a pretty open platform and free speech place, but there are a few rules:\r\n        </p>\r\n            <ol class="rule-list">\r\n                <li class="first-rule" id="spam">\r\n                    <div class="help-category-box help-category-big-box">\r\n                        <h3>Asking</h3>\r\n                        <ul>\r\n                                <li><a href="/help/on-topic">\r\n                                            <span class="help-post-pin"></span>\r\n                                        What topics can I ask about here?\r\n                                    </a></li>\r\n                                <li><a href="/help/dont-ask">\r\n                                            <span class="help-post-pin"></span>\r\n                                        What types of questions should I avoid asking?\r\n                                    </a></li>\r\n                                <li><a href="/help/closed-questions">\r\n                                            <span class="help-post-pin"></span>\r\n                                        What does it mean if a question is "closed" or "on hold"?\r\n                                    </a></li>\r\n                                <li><a href="/help/asking-rate-limited">\r\n                                        Why is the system asking me to wait a day or more before asking another question?\r\n                                    </a></li>\r\n                                <li><a href="/help/how-to-ask">\r\n                                        How do I ask a good question?\r\n                                    </a></li>\r\n                        </ul>\r\n                    </div>\r\n                </li>\r\n                <li>\r\n                    <div class="help-category-box help-category-big-box">\r\n                        <h3>Our model</h3>\r\n                        <ul>\r\n                                <li><a href="/help/be-nice">\r\n                                            <span class="help-post-pin"></span>\r\n                                        Be nice.\r\n                                    </a></li>\r\n                                <li><a href="/help/behavior">\r\n                                            <span class="help-post-pin"></span>\r\n                                        What kind of behavior is expected of users?\r\n                                    </a></li>\r\n                                <li><a href="/help/interesting-topics">\r\n                                            <span class="help-post-pin"></span>\r\n                                        How do I find topics I''m interested in?\r\n                                    </a></li>\r\n                                <li><a href="/help/searching">\r\n                                        How do I search?\r\n                                    </a></li>\r\n                                <li><a href="/help/whats-beta">\r\n                                        What does "beta" mean?\r\n                                    </a></li>\r\n                        </ul>\r\n                    </div>\r\n                </li>\r\n                <li>\r\n                    <div class="help-category-box help-category-big-box">\r\n                        <h3>Reputation & Moderation</h3>\r\n                        <ul>\r\n                                <li><a href="/help/site-moderators">\r\n                                            <span class="help-post-pin"></span>\r\n                                        Who are the site moderators, and what is their role here?\r\n                                    </a></li>\r\n                                <li><a href="/help/why-vote">\r\n                                            <span class="help-post-pin"></span>\r\n                                        Why is voting important?\r\n                                    </a></li>\r\n                                <li><a href="/help/whats-reputation">\r\n                                            <span class="help-post-pin"></span>\r\n                                        What is reputation? How do I earn (and lose) it?\r\n                                    </a></li>\r\n                                <li><a href="/help/serial-voting-reversed">\r\n                                        Why do I have a reputation change on my reputation page that says "voting corrected"?\r\n                                    </a></li>\r\n                                <li><a href="/help/user-was-removed">\r\n                                        Why do I have a reputation change on my reputation page that says ''User was removed''?\r\n                                    </a></li>\r\n                        </ul>\r\n                    </div>\r\n                </li>\r\n                <li>\r\n                    <div class="help-category-box help-category-big-box">\r\n                                <h3>Answering</h3>\r\n                                <ul>\r\n                                        <li><a href="/help/accepted-answer">\r\n                                                    <span class="help-post-pin"></span>\r\n                                                What does it mean when an answer is "accepted"?\r\n                                            </a></li>\r\n                                        <li><a href="/help/deleted-answers">\r\n                                                Why and how are some answers deleted?\r\n                                            </a></li>\r\n                                        <li><a href="/help/how-to-answer">\r\n                                                How do I write a good answer?\r\n                                            </a></li>\r\n                                        <li><a href="/help/self-answer">\r\n                                                Can I answer my own question?\r\n                                            </a></li>\r\n                                        <li><a href="/help/referencing">\r\n                                                How to reference material written by others\r\n                                            </a></li>\r\n                                </ul>\r\n                    </div>\r\n                </li>\r\n                <li>\r\n                    <div class="help-category-box">\r\n                        <h3>Badges && Privileges</h3>\r\n                        <ul>\r\n                            <li><a href="/help/badges">View a full list of badges you can earn</a></li>\r\n\r\n                            <li><a href="/help/privileges">View a full list of privileges you can earn</a></li>\r\n                        </ul>\r\n                    </div>\r\n                </li>\r\n                <li>\r\n                    <div class="help-category-box help-category-big-box">\r\n                        <h3>My Account</h3>\r\n                        <ul>\r\n                                <li><a href="/help/merging-accounts">\r\n                                            <span class="help-post-pin"></span>\r\n                                        I accidentally created two accounts; how do I merge them?\r\n                                    </a></li>\r\n                                <li><a href="/help/edit-credentials">\r\n                                            <span class="help-post-pin"></span>\r\n                                        How do I add or remove login credentials from my account?\r\n                                    </a></li>\r\n                                <li><a href="/help/reset-password">\r\n                                            <span class="help-post-pin"></span>\r\n                                        I lost my password; how do I reset it?\r\n                                    </a></li>\r\n                                <li><a href="/help/deleting-account">\r\n                                            <span class="help-post-pin"></span>\r\n                                        How do I delete my account?\r\n                                    </a></li>\r\n                                <li><a href="/help/question-limited">\r\n                                        Why have I been limited to one question per week?\r\n                                    </a></li>\r\n                        </ul>\r\n                    </div>\r\n                </li>\r\n                </div>\r\n            </ol>\r\n        </div>', 1437716250, 1437717686),
(2, 'rule', 'Rules of Phanbook', '<div class="sub-title">\r\n                <p class="info">Phanbook  is a pretty open platform and free speech place, but there are a few rules:</p>\r\n                <ol class="rule-list">\r\n                    <li class="first-rule" id="spam">\r\n                        <p>Don''t <a href="http://phanbook.com/wiki/faq#wiki_what_constitutes_spam.3F">spam</a>.</p>\r\n                        <div class="examples">\r\n                            <p class="expander"><em class="toggle">[+]</em> What is spam?</p>\r\n                            <div style="display:none;" class="rule-examples">\r\n                                <ul>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Submitting only links to your blog or personal website.</li>\r\n                                    <li class="example good-example"><em>OK:</em> Submitting links from a variety of sites and sources.</li>\r\n                                    <li class="example good-example"><em>OK:</em> Submitting links from your own site, talking with redditors in the comments, and also submitting cool stuff from other sites.</li>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Posting the same comment repeatedly in multiple subreddits.</li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>\r\n                    </li>\r\n                    <li id="votecheating">\r\n                        <p>Don''t ask for votes or engage in <a href="http://phanbook.com/wiki/faq#wiki_what_constitutes_vote_cheating_and_vote_manipulation.3F">vote manipulation</a>.</p>\r\n                        <div class="examples">\r\n                            <p class="expander"><em class="toggle">[+]</em> What does vote manipulation look like?</p>\r\n                            <div style="display:none" class="rule-examples">\r\n                                <ul>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Buying votes or using services to vote.</li>\r\n                                    <li class="example good-example"><em>OK:</em> Sharing reddit links with your friends.</li>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Sharing links with your friends or coworkers and asking them to vote.</li>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Creating submissions such as "For every upvote I will ..." or "... please upvote this!", regardless of the cause.</li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>\r\n                    </li>\r\n                    <li id="personalinfo">\r\n                        <p>Don''t post <a href="">personal information</a>.</p>\r\n                        <div class="examples">\r\n                            <p class="expander"><em class="toggle">[+]</em> What might be personal information?</p>\r\n                            <div style="display:none" class="rule-examples">\r\n                                <ul>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Posting a link to your friend''s facebook profile.</li>\r\n                                    <li class="example good-example"><em>OK:</em> Posting your senator''s publicly available contact information</li>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Posting the full name, employer, or other real-life details of another redditor</li>\r\n                                    <li class="example good-example"><em>OK:</em> Posting a link to a public page maintained by a celebrity.</li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>\r\n                    </li>\r\n                    <li id="minors">\r\n                        <p>No <a rel="nofollow" href="http://www.missingkids.com/Exploitation/FAQ">child pornography</a> or <a rel="nofollow" href="http://phanbook.com/r/blog/comments/pmj7f/a_necessary_change_in_policy/">sexually suggestive content featuring minors</a>.</p>\r\n                    </li>\r\n                    <li id="breakthesite">\r\n                        <p>Don''t break the site or do anything that interferes with normal use of the site.</p>\r\n                        <div class="examples">\r\n                            <p class="expander"><em class="toggle">[+]</em> Tell me more.</p>\r\n                            <div style="display:none" class="rule-examples">\r\n                                <ul>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Creating programs that request information more than once every 2 seconds or violate any of our other<a href="https://github.com/reddit/reddit/wiki/API"> API rules</a>.</li>\r\n                                    <li class="example good-example"><em>AWESOME:</em> Responsibly<a href="/wiki/whitehat"> reporting security </a>issues to us.</li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>\r\n                    </li>\r\n                    <!-- Also, ''reddit'' is STRICTLY lowercase -->\r\n                    <li id="ask">\r\n                        <p>Get answers to practical, detailed questions</p>\r\n                        <div class="examples">\r\n                            <p class="expander"><em class="toggle">[+]</em> What is spam?</p>\r\n                            <div style="display: none;" class="rule-examples">\r\n                                <ul>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Questions you haven''t tried to find an answer for (show your work!)</li>\r\n                                    <li class="example good-example"><em>OK:</em> Specific programming problems</li>\r\n                                    <li class="example good-example"><em>OK:</em> Software algorithms</li>\r\n                                    <li class="example bad-example"><em>NOT OK:</em> Product or service recommendations or comparisons</li>\r\n                                    <li class="example good-example"><em>NOT OK:</em> Software development tools</li>\r\n                                </ul>\r\n                            </div>\r\n                        </div>\r\n                    </li>\r\n                </ol>\r\n            </div>\r\n            <div class="info" id="followreddiquette">\r\n                <p>You should also be mindful of<a href="/wiki/reddiquette"> reddiquette</a>, an <em>informal</em> expression of {{this.config.application.name}} is community values as written by the community itself. Please abide by it the best you can.</p>\r\n            </div>\r\n            <div class="info">\r\n                <img src="/images/dog.jpg" alt="this dog has no semantic value" title="here at reddit, we inscribe our rules on a dog. screw tablets." class="bottom" id="dog">\r\n            </div>', 1437716733, 1437806769),
(3, 'about', 'About us', '<p>\r\n            		Phanbook is an open source project and depends on volunteer efforts.\r\n            		If you want to improve this forum please submit a\r\n            		<a href="https://help.github.com/articles/creating-a-pull-request">pull request</a>\r\n            		to its <a href="https://github.com/phanbook/phanbook">repository</a>.\r\n            	</p>', 1437719274, 1437719299),
(4, 'markdown', 'Markdown', '<p>\r\n            		This forum allows you to use Markdown as markup language when creating posts or adding comments. Markdown\r\n            		is also used by Github so it''s probably familiar to you. The following guide explain its basic syntax:\r\n            	</p>\r\n\r\n            	<p>\r\n            		<h3>Bold and Italics</h3>\r\n            	</p>\r\n\r\n            <p>\r\n            		<pre>\r\n            *single asterisks*\r\n\r\n            _single underscores_\r\n\r\n            **double asterisks**\r\n\r\n            __double underscores__\r\n            </pre>\r\n            </p>\r\n\r\n\r\n            	<p>\r\n            		<h3>Headings</h3>\r\n            		H1 is underlined using equal signs, and H2 is underlined using dashes.\r\n            	</p>\r\n            	<p>\r\n            		<pre>\r\n            Header 1\r\n            ========\r\n\r\n            Header 2</pre>\r\n            	</p>\r\n\r\n            	<p>\r\n            		<h3>Headings</h3>\r\n            		Atx-style headers use 1-6 hash characters at the start of the line.\r\n            	</p>\r\n            	<p>\r\n            		<pre>\r\n            # Header 1\r\n            ## Header 2\r\n            ### Header 3\r\n            #### Header 4\r\n            ##### Header 5\r\n            ###### Header 6\r\n            </pre>\r\n            	</p>\r\n\r\n            	<p>\r\n            		<h3>Paragraphs</h3>\r\n            		A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines.\r\n            	</p>\r\n\r\n            <p>\r\n            <pre>\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla neque nisl, fringilla sed blandit non, pretium eu odio.\r\n\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n            Nulla neque nisl, fringilla sed blandit non, pretium eu odio.\r\n            </pre>\r\n            </p>\r\n\r\n            	<p>\r\n            		<h3>Unordered Lists</h3>\r\n            		Start each line with hyphens, asterisks or pluses.\r\n            	</p>\r\n\r\n            <p>\r\n            <pre>\r\n            * one\r\n            * two\r\n            * three\r\n            </pre>\r\n            </p>\r\n\r\n            	<p>\r\n            		<h3>Ordered Lists Core</h3>\r\n            		Start each line with number and a period.\r\n            	</p>\r\n\r\n            <p>\r\n            <pre>\r\n            1. one\r\n            2. two\r\n            3. three\r\n            </pre>\r\n            </p>\r\n\r\n            	<p>\r\n            		<h3>Code Blocks</h3>\r\n            	</p>\r\n\r\n            **Preferred method**\r\n            <p>\r\n            <pre>\r\n            ```php\r\n            &lt;?php\r\n\r\n            require __DIR__ . ''/vendor/autoload.php'';\r\n            ```\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            ```\r\n            $ cd cphalcon/build\r\n            $ sudo ./install\r\n            ```\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            Lorem ipsum dolor sit amet\r\n\r\n                consectetur adipiscing elit.\r\n                Nulla neque nisl, fringilla sed blandit non, pretium eu odio.\r\n            </pre>\r\n            </p>\r\n\r\n\r\n\r\n\r\n            <p>\r\n            	<h3>Inline Code</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            Don''t forget to add `echo $foo;`.\r\n\r\n            Please replace `&lt;b&gt;` to `&lt;strong&gt;`.\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            	<h3>Horizontal Rules</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            * * *\r\n\r\n            *******\r\n\r\n            - - - -\r\n\r\n            --------\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            	<h3>Inline Links</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            This is an [inline link](http://example.com).\r\n\r\n            This [link](http://example.com "example website") has title attribute.\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            This is an [reference style link][id1].\r\n\r\n            This [link][id2] has title attribute.\r\n\r\n            [id1]: http://example.com/\r\n            [id2]: http://example.com/ "example website"\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            	<h3>Inline Images</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            ![Alt text](/path/to/image.png)\r\n\r\n            ![Alt text](/path/to/image.png "Title")\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            	<h3>Tables</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            | head | head |\r\n            |------|------|\r\n            | body | body |\r\n            </pre>\r\n            </p>\r\n\r\n            </div>', 1437806442, 1437806442),
(5, 'moderation', 'Moderation', '<p>\r\n            		Moderators have special authority, they are community facilitators, they can edit or delete your posts or comments.\r\n            		In order to maintain our community, moderators reserve the right to remove any content and any user account for any reason at any time.\r\n            	</p>\r\n\r\n            	<p>\r\n            		Most of the time, moderation will be limited to correcting small details in posts or comments, improve grammar,\r\n            		fix occasional details in the code, fix links, etc.\r\n            	</p>\r\n\r\n            	<p>\r\n            		A moderator is not required to answer questions or make decisions.\r\n            	</p>', 1437806487, 1437806487),
(6, 'vote', 'Vote', '<p>\r\n            		Posts and comments can be voted up or down. Voting enable the community to\r\n            		collectively identify the best (and worst) contributions. However, votes aren''t unlimited.\r\n            		Every time you win 50 points of karma the forum assing you a vote.\r\n            		You can only vote once every post or comment. You can spend\r\n            		your votes by voting positively or negatively posts and comments in the forum.\r\n            	</p>\r\n\r\n            	<p>\r\n            		When your posts or comments have been voted your karma is increased or decreased depending on the karma of who you get the vote.\r\n            		When you receive votes from the original poster you get an extra number of points on your karma.\r\n            	</p>\r\n\r\n            	<p>\r\n            		You can see how many votes you have on your  <a href =''http://phanbook.com''> settings</a> page.\r\n            	</p>', 1437806743, 1437806743);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'such as questions, tips',
  `title` varchar(128) NOT NULL,
  `link` varchar(250) DEFAULT NULL COMMENT 'Add url website hackernew',
  `slug` varchar(64) NOT NULL,
  `content` text,
  `numberViews` int(5) unsigned NOT NULL,
  `numberReply` int(3) unsigned NOT NULL,
  `sticked` char(1) DEFAULT 'N',
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL COMMENT 'This is update time when user owner post',
  `editedAt` int(11) unsigned DEFAULT NULL COMMENT 'This is update time when modarator or admin edit post',
  `status` char(1) DEFAULT 'A',
  `locked` char(1) DEFAULT 'N',
  `deleted` int(3) DEFAULT '0',
  `acceptedAnswer` char(1) DEFAULT 'N'
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `usersId`, `type`, `title`, `link`, `slug`, `content`, `numberViews`, `numberReply`, `sticked`, `createdAt`, `modifiedAt`, `editedAt`, `status`, `locked`, `deleted`, `acceptedAnswer`) VALUES
(1, 1, 'questions', 'Install multiple version Phalcon', NULL, 'css-fill-all-with', 'In this particular post, we intend to offer a solution to install multiple versions of Phalcon, PHP and run them on a single web server. The PHP 5.5.x and 5.6.x will be used in here, but you can replace it with other versions. Any servers that support PHP-FPM should be enough but we recommend using the Nginx for the web server. The environment using in this tutorial is Fedora OS - a Linux system.\r\n\r\n### Preliminary Note\r\n\r\nThis tutorial will cover the installation of PHP 5.5.x correspoding Phalcon 1.3.x and PHP 5.6.x correspoding Phalcon 2.0.0. We also configuration some Nginx\r\n### Installing Nginx\r\n\r\nNginx is an available package in Fedora OS which we can install as follow:\r\n\r\n```\r\n  sudo yum install nginx\r\n\r\n```\r\nThen we create the system startup links for Nginx and start it\r\n\r\n```\r\n  sudo chkconfig nginx on\r\n  sudo service nginx start\r\n\r\n```\r\n### Building PHP\r\n\r\nBefore starting with PHP, we need to install the prerequisites for building PHP5:\r\n\r\n- gcc or some other compiler suite.\r\n- libc-dev, provides the C standard library, including headers.\r\n- make, which is the build-management tool PHP uses.\r\n- autoconf (2.59 or higher) for generating the configure script.\r\n- automake (1.4 or higher), generates Makefile.in files.\r\n- libtool, helps us manage shared libraries.\r\n- bison (2.4 or higher), for generating the PHP parser.\r\n- (optional) re2c, which is used to generate the PHP lexer. As the git repository already contains a generated lexer you will only need re2c if you wish to make changes to it.\r\n\r\nAlso you can references to full information [here](https://github.com/php/php-src/blob/master/INSTALL)\r\n\r\nOn Centos/Fedora you can install all these with the following command:\r\n\r\n```\r\n  sudo yum install gcc libxml2-devel libXpm-devel gmp-devel libicu-devel t1lib-devel aspell-devel openssl-devel bzip2-devel libcurl-devel libjpeg-devel libvpx-devel libpng-devel freetype-devel readline-devel libtidy-devel libxslt-devel libmcrypt-devel pcre-devel curl-devel mysql-devel ncurses-devel gettext-devel net-snmp-devel libevent-devel libtool-ltdl-devel libc-client-devel postgresql-devel bison gcc make\r\n\r\n```\r\nThen we need to get its source code. There are two ways to do this: You can either download an archive from [PHP’s download page](http://php.net/downloads.php) or clone the git repository from [Github](https://github.com/php/php-src).\r\n\r\nWe recommend to checkout out the source code from git, because it provides you an easy way to keep your installation up-to-date and to try your code with different versions. A git checkout is also required if you want to submit patches or pull requests for PHP.\r\n\r\nTo clone the repository, run the following commands in your terminal:\r\n\r\n```\r\n  sudo mkdir /opt/source && cd /opt/source\r\n  git clone git@github.com:php/php-src.git && cd php-src\r\n\r\n```\r\nBy default you will be on the master branch, so if you want to move on a development version, you need to check out the stable branch. For example.\r\n\r\n```\r\n  PHP 5.3:  git checkout PHP-5.3\r\n  PHP 5.4:  git checkout PHP-5.4\r\n  PHP 5.6:  git checkout PHP-5.6\r\n  PHP HEAD: git checkout master \r\n\r\n```\r\nBefore going to the individual build steps do, we must execute some "little" commands for a “default” PHP build. This is only necessary for who builds from git\r\n\r\n```\r\nsudo ./buildconf\r\n\r\n```\r\nThe "./buildconf" generates the configuration script. This may take several minutes. \r\n\r\nWe need to make a directory. In my opinion, I think storing the whole web server in a single directory is the best, so I use /opt here. Open the terminal and type the following command.\r\n\r\n```\r\n  sudo mkdir -p /opt/php-5.6\r\n  sudo mkdir -p /opt/php-5.5\r\n\r\n```\r\nOnce the ./configure script is generated you can use it to customize your PHP build. You can list all supported options using --help:\r\n\r\n```\r\n  ./configure --help\r\n\r\n```\r\n\r\nThe command line above will help list various generic options, which are supported by all autoconf-based configuration scripts. In our example below we''ll do a simple configure with PHP-FPM, --prefix is /opt/php-5.6, etc.\r\n\r\nHere are some useful settings:\r\n\r\n```\r\n  [...]\r\n\r\n  Usage: ./configure [OPTION]... [VAR=VALUE]...\r\n\r\n  To assign environment variables (e.g., CC, CFLAGS...), specify them as\r\n  VAR=VALUE.  See below for descriptions of some of the useful variables.\r\n\r\n  Defaults for the options are specified in brackets.\r\n\r\n  Configuration:\r\n    -h, --help              display this help and exit\r\n        --help=short        display options specific to this package\r\n        --help=recursive    display the short help of all the included packages\r\n    -V, --version           display version information and exit\r\n    -q, --quiet, --silent   do not print `checking ...'' messages\r\n        --cache-file=FILE   cache test results in FILE [disabled]\r\n    -C, --config-cache      alias for `--cache-file=config.cache''\r\n    -n, --no-create         do not create output files\r\n        --srcdir=DIR        find the sources in DIR [configure dir or `..'']\r\n\r\n  Installation directories:\r\n    --prefix=PREFIX         install architecture-independent files in PREFIX\r\n                            [/usr/local]\r\n    --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX\r\n                            [PREFIX]\r\n\r\n  By default, `make install'' will install all the files in\r\n  `/usr/local/bin'', `/usr/local/lib'' etc.  You can specify\r\n  an installation prefix other than `/usr/local'' using `--prefix'',\r\n  for instance `--prefix=$HOME''.\r\n\r\n  For better control, use the options below.\r\n\r\n  Fine tuning of the installation directories:\r\n    --bindir=DIR            user executables [EPREFIX/bin]\r\n    --sbindir=DIR           system admin executables [EPREFIX/sbin]\r\n    --libexecdir=DIR        program executables [EPREFIX/libexec]\r\n    --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]\r\n    --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]\r\n    --localstatedir=DIR     modifiable single-machine data [PREFIX/var]\r\n    --libdir=DIR            object code libraries [EPREFIX/lib]\r\n    --includedir=DIR        C header files [PREFIX/include]\r\n    --oldincludedir=DIR     C header files for non-gcc [/usr/include]\r\n    --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]\r\n    --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]\r\n    --infodir=DIR           info documentation [DATAROOTDIR/info]\r\n    --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]\r\n    --mandir=DIR            man documentation [DATAROOTDIR/man]\r\n    --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]\r\n    --htmldir=DIR           html documentation [DOCDIR]\r\n    --dvidir=DIR            dvi documentation [DOCDIR]\r\n    --pdfdir=DIR            pdf documentation [DOCDIR]\r\n    --psdir=DIR             ps documentation [DOCDIR]\r\n \r\n  [...]\r\n\r\n```\r\nAfter finishing the preparation we install the PHP version 5.6, run the following commands in your shell\r\n\r\n```\r\n\r\n./configure \\\r\n--prefix=/opt/php-5.6 \\\r\n--with-pdo-pgsql \\\r\n--with-zlib-dir \\\r\n--with-freetype-dir \\\r\n--enable-mbstring \\\r\n--with-libxml-dir=/usr \\\r\n--enable-soap \\\r\n--enable-calendar \\\r\n--with-curl \\\r\n--with-mcrypt \\\r\n--with-zlib \\\r\n--with-gd \\\r\n--with-pgsql \\\r\n--disable-rpath \\\r\n--enable-inline-optimization \\\r\n--with-bz2 \\\r\n--with-zlib \\\r\n--enable-sockets \\\r\n--enable-sysvsem \\\r\n--enable-sysvshm \\\r\n--enable-pcntl \\\r\n--enable-mbregex \\\r\n--with-mhash \\\r\n--enable-zip \\\r\n--with-pcre-regex \\\r\n--with-mysql \\\r\n--with-pdo-mysql \\\r\n--with-mysqli \\\r\n--with-png-dir=/usr \\\r\n--enable-gd-native-ttf \\\r\n--with-openssl \\\r\n--with-fpm-user=nginx \\\r\n--with-fpm-group=nginx \\\r\n--with-libdir=lib64 \\\r\n--enable-ftp \\\r\n--with-imap \\\r\n--with-imap-ssl \\\r\n--with-kerberos \\\r\n--with-gettext \\\r\n--with-gd \\\r\n--with-jpeg-dir=/usr/lib/ \\\r\n--enable-fpm\r\n```\r\nThe last switch (--enable-fpm) makes this PHP version work with PHP-FPM. If you want to use this PHP-FPM version with Apache, please use --with-fpm-user=apache and --with-fpm-group=apache. On the other hand, if you want to use this PHP-FPM version with nginx, please use --with-fpm-user=nginx and --with-fpm-group=nginx.\r\n\r\nIf everything goes fine. The successful message will be outputted in the terminal like\r\n\r\n```\r\n[...]\r\n\r\ncreating libtool\r\nappending configuration tag "CXX" to libtool\r\n\r\nGenerating files\r\nconfigure: creating ./config.status\r\ncreating main/internal_functions.c\r\ncreating main/internal_functions_cli.c\r\n+--------------------------------------------------------------------+\r\n| License:                                                           |\r\n| This software is subject to the PHP License, available in this     |\r\n| distribution in the file LICENSE.  By continuing this installation |\r\n| process, you are bound by the terms of this license agreement.     |\r\n| If you do not agree with the terms of this license, you must abort |\r\n| the installation process at this point.                            |\r\n+--------------------------------------------------------------------+\r\n\r\nThank you for using PHP.\r\n\r\nconfig.status: creating php5.spec\r\nconfig.status: creating main/build-defs.h\r\nconfig.status: creating scripts/phpize\r\nconfig.status: creating scripts/man1/phpize.1\r\nconfig.status: creating scripts/php-config\r\nconfig.status: creating scripts/man1/php-config.1\r\nconfig.status: creating sapi/cli/php.1\r\nconfig.status: creating sapi/fpm/php-fpm.conf\r\nconfig.status: creating sapi/fpm/init.d.php-fpm\r\nconfig.status: creating sapi/fpm/php-fpm.service\r\nconfig.status: creating sapi/fpm/php-fpm.8\r\nconfig.status: creating sapi/fpm/status.html\r\nconfig.status: creating sapi/cgi/php-cgi.1\r\nconfig.status: creating ext/phar/phar.1\r\nconfig.status: creating ext/phar/phar.phar.1\r\nconfig.status: creating main/php_config.h\r\nconfig.status: executing default commands\r\n\r\n```\r\n\r\nNow, you can use make to perform the actual compilation:\r\n  \r\n```\r\n  make\r\n\r\n```\r\nThe main result of this operation will be PHP binaries for the enabled SAPIs (by default sapi/cli/php and sapi/cgi/php-cgi), as well as shared extensions in the modules/ directory.\r\n\r\nNow you can run "make install" to install PHP into /usr/local (default) or another directories by using the --prefix configuration. In this case is /opt/php-5.6\r\n\r\n```\r\n  sudo make install\r\n\r\n```\r\nPlease note that the "make install" will not create an ini file.\r\n\r\n``` \r\n/opt/php-5.6/bin/php --ini\r\nConfiguration File (php.ini) Path: /opt/php-5.6/lib\r\nLoaded Configuration File:         (none)\r\nScan for additional .ini files in: (none)\r\nAdditional .ini files parsed:      (none)\r\n\r\n```\r\nCopy php.ini and php-fpm.conf to the correct directory:\r\n\r\n```\r\nsudo cp /opt/source/php-src/php-fpm.conf.default /opt/php-5.6/etc/php-fpm.conf\r\nsudo cp /opt/source/php-src/php.ini-production /opt/php-5.6/lib/php.ini\r\n\r\n```\r\nWe verify and checking the php version one more time.\r\n\r\n```\r\n  /opt/php-5.6/bin/php --ini\r\n  Configuration File (php.ini) Path: /opt/php-5.6/lib\r\n  Loaded Configuration File:         /opt/php-5.6/lib/php.ini\r\n  Scan for additional .ini files in: (none)\r\n  Additional .ini files parsed:      (none)\r\n\r\n  ### Checking php\r\n  /opt/php-5.6/bin/php --version\r\n  PHP 5.6.2-dev (cli) (built: Oct  2 2014 17:20:23) \r\n  Copyright (c) 1997-2014 The PHP Group\r\n  Zend Engine v2.6.0, Copyright (c) 1998-2014 Zend Technologies\r\n```\r\nOpen /opt/php-5.6/etc/php-fpm.conf and adjust the settings in the listen line. You must change to an unused port (e.g. 9001; the port 9000 might be in use by Fedora)\r\n\r\n```\r\n  vi /opt/php-5.6/etc/php-fpm.conf\r\n\r\n```\r\n\r\n```\r\n  [...]\r\n  pid = run/php-fpm.pid\r\n  [...]\r\n  user = nginx\r\n  group = nginx\r\n  [...]\r\n  listen = 127.0.0.1:9001\r\n  [...]\r\n  #include=/opt/php-5.6/etc/pool.d/*.conf\r\n\r\n```\r\n###Init script setup\r\n\r\nYou will probably want to create an init script for your new php-fpm. Luckily, the PHP 5.3+ already provides it for you, simply copy the init script to your directory and change permissions:\r\n\r\n```\r\n  sudo cp /opt/source/php-src/sapi/fpm/init.d.php-fpm /etc/init.d/php5.6-fpm\r\n  sudo chmod 755 /etc/init.d/php5.6-fpm\r\n```\r\n\r\nYour init script is ready. Now, you are able to start, stop and reload php-fpm:\r\n\r\n```\r\n  sudo /etc/init.d/php5.6-fpm start\r\n  sudo /etc/init.d/php5.6-fpm stop\r\n  sudo /etc/init.d/php5.6-fpm reload\r\n\r\n```\r\n\r\n###Building the second PHP (5.5.x)\r\n\r\nWe open up the terminal and type the following command.\r\n\r\n```\r\ngit checkout PHP-5.5\r\nsudo ./buildconf \r\n./configure \\\r\n--prefix=/opt/php-5.5 \\\r\n--with-pdo-pgsql \\\r\n--with-zlib-dir \\\r\n--with-freetype-dir \\\r\n--enable-mbstring \\\r\n--with-libxml-dir=/usr \\\r\n--enable-soap \\\r\n--enable-calendar \\\r\n--with-curl \\\r\n--with-mcrypt \\\r\n--with-zlib \\\r\n--with-gd \\\r\n--with-pgsql \\\r\n--disable-rpath \\\r\n--enable-inline-optimization \\\r\n--with-bz2 \\\r\n--with-zlib \\\r\n--enable-sockets \\\r\n--enable-sysvsem \\\r\n--enable-sysvshm \\\r\n--enable-pcntl \\\r\n--enable-mbregex \\\r\n--with-mhash \\\r\n--enable-zip \\\r\n--with-pcre-regex \\\r\n--with-mysql \\\r\n--with-pdo-mysql \\\r\n--with-mysqli \\\r\n--with-png-dir=/usr \\\r\n--enable-gd-native-ttf \\\r\n--with-openssl \\\r\n--with-fpm-user=nginx \\\r\n--with-fpm-group=nginx \\\r\n--with-libdir=lib64 \\\r\n--enable-ftp \\\r\n--with-imap \\\r\n--with-imap-ssl \\\r\n--with-kerberos \\\r\n--with-gettext \\\r\n--with-gd \\\r\n--with-jpeg-dir=/usr/lib/ \\\r\n--enable-fpm\r\n\r\nmake && sudo make install\r\n\r\n```\r\n###Building PHP Phalcon extensions\r\n\r\nTo install multiple versions of Phalcon include Phalcon 2.0, we need to install Zephir\r\n\r\n```\r\n  git clone https://github.com/json-c/json-c.git\r\n  cd json-c\r\n  sh autogen.sh\r\n  ./configure\r\n  make && sudo make install\r\n   \r\n  git clone https://github.com/phalcon/zephir\r\n  cd zephir\r\n  sudo ./install -c\r\n\r\n```\r\nThere are many ways to install PHP extensions. We will use phpize build it, so what is phpize ?\r\n\r\nphpize plays a similar role as the ./buildconf script used for PHP builds: First it will import the PHP build system into your extension by copying files from $PREFIX/lib/php/build. Among these files are acinclude.m4 (PHP’s M4 macros), phpize.m4 (which will be renamed to configure.in in your extension and contains the main build instructions) and run-tests.php.\r\n\r\nThen phpize will invoke autoconf to generate a ./configure file, which can be used to customize the extension build. Note that it is not necessary to pass --enable-apcu to it, as this is implicitly assumed. Instead you should use --with-php-config to specify the path to your php-config script:\r\n\r\nRemember!!!. You must specify the --with-php-config option when build the extensions (unless you have only a single, global installation of PHP). Otherwise the ./configure will not be able to determine correctly the PHP version and flags. Moreover, the php-config script also ensures that "make install" command will move the generated .so file (which can be found in the modules/ directory) to the right extension directory.\r\n\r\n###Building the first PHP Phalcon (2.0)\r\n\r\n```\r\n  git clone http://github.com/phalcon/cphalcon\r\n  cd cphalcon && git checkout 2.0.0\r\n  zephir compile\r\n  cd ext && /opt/php-5.6/bin/phpize\r\n  ./configure --with-php-config=/opt/php-5.6/bin/php-config\r\n  make && sudo make install\r\n  Installing shared extensions:     /opt/php-5.6/lib/php/extensions/no-debug-non-zts-20131226/\r\n\r\n```\r\nPlease check whether or not it is successful\r\n\r\n```\r\n  ls /opt/php-5.6/lib/php/extensions/no-debug-non-zts-20131226/\r\n\r\n```\r\nAfter the extension is installed. You still need to activate it by including it in php.ini file.  \r\n\r\n```\r\n  sudo su\r\n  echo "extension=phalcon.so" >> /opt/php-5.6/lib/php.ini\r\n  exit\r\n\r\n```\r\n###Building the second PHP Phalcon (1.3.x)\r\n```\r\n  git clone http://github.com/phalcon/cphalcon\r\n  cd cphalcon && git checkout master\r\n  cd ext && /opt/php-5.5/bin/phpize\r\n  ./configure --with-php-config=/opt/php-5.5/bin/php-config\r\n  make && sudo make install\r\n  Installing shared extensions:     /opt/php-5.5/lib/php/extensions/no-debug-non-zts-20121212/\r\n\r\n```\r\nWe check again to make sure the installation is successful\r\n\r\n```\r\n  ls /opt/php-5.6/lib/php/extensions/no-debug-non-zts-20131226/\r\n  sudo su\r\n  echo "extension=phalcon.so" >> /opt/php-5.5/lib/php.ini\r\n  exit\r\n\r\n```\r\n###Configuring Nginx\r\n\r\n```\r\n  sudo vi /etc/nginx/nginx.conf\r\n\r\n```\r\nThe following configuration will create two servers: the phalcon-prd.localhost runs on PHP 5.5.x and phalcon-dev.localhost works with PHP 5.6.x. This is a example, you can customize anything you want, [see Nginx documentation](http://wiki.nginx.org/Main)\r\n\r\n```\r\n[...]\r\nhttp {\r\n  include       mime.types;\r\n  default_type  application/octet-stream;\r\n  sendfile        on;\r\n  keepalive_timeout  65;\r\n  #gzip  on;\r\n  include /etc/nginx/conf.d/*.conf;\r\n\r\n  index index.php index.html index.htm;\r\n\r\n  #Prodution environment Phalcon\r\n  server {\r\n    listen       80;\r\n    server_name  phalcon-prd.localhost;\r\n\r\n    root   /usr/share/nginx/html/phalcon-prd;\r\n\r\n    location / {\r\n      index  index.php;\r\n    }\r\n\r\n    location ~ \\.php$ {\r\n      fastcgi_pass   127.0.0.1:9001;\r\n      fastcgi_index  index.php;\r\n      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;\r\n      include        fastcgi_params;\r\n    }\r\n  }\r\n  #Development environment Phalcon\r\n  server {\r\n    listen       80;\r\n    server_name  phalcon-dev.localhost;\r\n\r\n    root   /usr/share/nginx/html/phalcon-prd;\r\n\r\n    location / {\r\n      index  index.php;\r\n    }\r\n\r\n    location ~ \\.php$ {\r\n      fastcgi_pass   127.0.0.1:9002;\r\n      fastcgi_index  index.php;\r\n      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;\r\n      include        fastcgi_params;\r\n    }\r\n  }\r\n}\r\n[...]\r\n```\r\n###Set Up Local Hosts File\r\nIf you are using a Linux system, you can edit the host file:\r\n\r\n```\r\n  sudo vi /etc/hosts\r\n```\r\n\r\nThe new host file will look like.\r\n\r\n```\r\n[...]\r\n127.0.0 localhost phalcon-dev.localhost phalcon-prd.localhost\r\n::1   localhost6.localdomain6 localhost6\r\n[...]\r\n```\r\nThis one intercepts all requests for phalcon-dev.localhost and phalcon-prd.localhost then send them to your server.\r\n\r\n###Testing it\r\n\r\nFor testing, we create a new file called test.php and put it into folder corresponding to the above configuration of Nginx. In each files, we add the following command.\r\n\r\n```\r\n  <?php phpinfo(); ?>\r\n\r\n```\r\nNow running the test.php file in each server, we see a Phalcon 1.3.x phpinfo() at http://phancon-prd.localhost/test.php while at http://phancon-dev.localhost/test.php should be phpinfo() of Phalcon 2.0.x\r\n\r\n![](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/10/1413540042Selection_021.png)\r\n### In conclusion\r\n\r\nSo we’ve been taken to have a overview about install multiple versions of Phalcon and PHP. With this way you are able to run as many as versions  of Phalcon as well as PHP.\r\n\r\nLeave your feedback in the comments below and, as always, please share this article if you liked it!', 3615, 15, 'Y', NULL, 1438235736, 1434707984, 'A', 'N', 0, 'Y'),
(2, 1, 'questions', 'Eigenstate vs collapsed wave function', NULL, 'challenging-developer-openings', 'Have a Nikon D5100 (58mm thread) and want to find a telephoto adapter that go with my 55-300mm lens. Most I see are 52mm, why is that? What should I be looking for to FIT my 300mm lens. We recommend powering off your droplet through the command line, as this action is the same as hard resetting the server and may cause data corruption.', 10, 8, 'N', 1425055278, 1438235736, 1434358231, 'A', 'N', 0, 'N'),
(3, 2, 'questions', 'How do you show that the normal derivative of the magnetic vector ?', NULL, 'challenging-developer-openings', '**strong text**Bootstrap is downloadable in two forms, within which you''ll find the following directories and files, logically grouping common resources and providing both compiled and minified variations.\r\n\r\n> logically grouping common resources and providing both compiled and\r\n> minified variations.', 17, 2, 'N', 1425055786, 1438235737, 1432706279, 'A', 'N', 0, 'N'),
(26, 2, 'questions', 'What was the significance of the ionization caused by the Population III stars?', NULL, 'css-fill-all-with', '**strong text**How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 17, 1, 'N', NULL, 1437843526, NULL, 'A', 'N', 0, 'N'),
(27, 2, 'questions', 'What was the significance of the ionization caused by the Population III stars?', NULL, 'css-fill-all-with', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 13, 3, 'N', NULL, 1437489619, NULL, 'A', 'N', 0, 'N'),
(28, 1, 'questions', 'What was the significance of the ionization caused by the Population III stars?', NULL, 'css-fill-all-with', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 53, 0, 'N', NULL, 1437159567, NULL, 'A', 'N', 0, 'N'),
(29, 1, 'questions', 'How to render html in volt', NULL, 'css-fill-all-with', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 51, 0, 'N', NULL, 1437835606, NULL, 'A', 'N', 0, 'N'),
(30, 1, 'questions', 'What was the significance of the ionization caused by the Population III stars. What was the significance of ', NULL, 'css-fill-all-with', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 59, 0, 'N', NULL, 1438236259, NULL, 'A', 'N', 0, 'N'),
(31, 1, 'tips', 'Permutation operator and second quantization', NULL, 'css-fill-all-with', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 3221, 1, 'N', NULL, 1437489428, NULL, 'A', 'N', 0, 'N'),
(32, 1, 'questions', 'What was the significance of the ionization caused by the Population III stars?', NULL, 'What-was-the-significance of the ionization-caused-by-the', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 670, 0, 'N', NULL, 1437219805, NULL, 'A', 'N', 0, 'N'),
(34, 1, 'questions', 'Triangular barrier in infinite potential well', NULL, 'What-was-the-significance of the ionization-caused-by-the', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 92, 432, 'N', NULL, 1437898863, NULL, 'A', 'N', 0, 'N'),
(35, 1, 'questions', 'Solving for the density operator in the quantum Brownian motion master equation', NULL, 'What-was-the-significance of the ionization-caused-by-the', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 42, 888, 'N', NULL, 1437891418, NULL, 'A', 'N', 0, 'N'),
(36, 1, 'questions', 'Hartree Fock equations', NULL, 'What-was-the-significance of the ionization-caused-by-the', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 103, 6, 'N', NULL, 1437522938, NULL, 'A', 'N', 0, 'Y'),
(37, 1, 'questions', 'A reference frame is any coordinate system or just a set of cartesian axes?', NULL, 'What-was-the-significance of the ionization-caused-by-the', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1205, 7, 'N', NULL, 1438235737, NULL, 'A', 'N', 0, 'N'),
(38, 1, 'questions', 'What was the significance of the ionization caused by the Population III stars?', NULL, 'what-was-the-significance-of-the-ionization-caused-by-the-popula', 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)\r\n\r\nAtlassian takes security seriously and publishes security advisories and patches when security threats become known. Compared to Bugzilla, JIRA security risks are somewhat higher due to the larger overall complexity, a lot of client-side JavaScript code, and additional functionality provided by 3rd-party plugins. ', 27, 2, 'N', 1425651774, 1438235737, 1432624352, 'A', 'N', 0, 'Y'),
(42, 45, 'questions', 'Xin hỏi các tiền làm thế nào để website có thể load nhẹ mà đảm bảo được trải nghiệm người dùng', NULL, 'an-lp-problem-from-david-g-luenbergers-linear-and-nonlinear-prog', 'Em đang học tập và nghiên cưu phát triển những dự án mạng xã hội nhưng em vẫn còn yếu về cách load database hàng triệu record, hoặc người dùng truy cập quá nhiều. Xin các tiền bối chỉ giáo và cho em xin các giải quyết nhe! Xin chân thành cảm ơn!\r\n\r\n\r\n    owned: function(){\r\n        this.url = this.options.url.owned;\r\n        this.parse = function(users){\r\n            return users.map(function(user){\r\n                return user;\r\n            });\r\n        };\r\n        this.fetch({\r\n            data: {\r\n                screen_name : login\r\n            }\r\n        });\r\n    }\r\n\r\n## Abc ', 22, 8, 'N', 1429189090, 1437225062, 1432973390, 'A', 'N', 0, 'Y'),
(43, 3, 'tips', 'This is test tip create', NULL, 'this-is-test-tip-create', 'Each route that is added to the router is stored internally as an object Phalcon\\Mvc\\Router\\Route. That class encapsulates all the details of each route. For instance, we can give a name to a path to identify it uniquely in our application. This is especially useful if you want to create URLs from it.', 0, 0, 'N', 1430991290, 1431070000, NULL, 'A', 'N', 1111, 'N'),
(44, 46, 'questions', 'Làm sao để dọc hướng dẫn đăng bài?', NULL, 'lam-sao-de-doc-huong-dan-dang-bai', 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được. ình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?', 19, 1, 'N', 1431698479, 1437510663, 1436974746, 'A', 'N', 0, 'N'),
(45, 47, 'questions', 'More Effective PHP Logging with Loggly', NULL, 'create-a-new-posts', ' Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues. \r\n\r\n Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues. ', 14, 3, 'N', 1431845349, 1434800527, 1434416391, 'A', 'N', 0, 'Y'),
(46, 47, 'questions', 'Getting Started with eZ Platform on Vagrant', NULL, 'create-a-new-posts', ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.', 14, 1, 'N', 1431845492, 1435370806, 1433663406, 'A', 'N', 0, 'N'),
(47, 45, 'questions', 'jj', NULL, 'jj', 'jjjj', 2, 0, 'N', 1433144850, 1433648255, 1433145068, 'A', 'N', 1433648255, 'N'),
(48, 45, 'questions', 'Creating a new Post', NULL, 'creating-a-new-post', 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. \r\n\r\n\r\nSocial Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. ', 5, 1, 'N', 1433216547, 1438235737, 1433537845, 'A', 'N', 1433648820, 'Y'),
(49, 56, 'questions', ' Phalcon Conference 2015', NULL, 'phalcon-conference-2015', '**Hello hello,**\r\n\r\nA couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers.\r\n\r\nTake a look at this survey and let us know!\r\n\r\nIf there''s something not mentioned in the survey, respond to this thread with whatever you want to share. As long as it''s relevant to the survey and or conference.\r\n\r\nThanks!\r\n\r\nupdated per 2014-11-25, The survey is Amsterdam specific now.', 10, 6, 'N', 1433663963, 1438318137, NULL, 'A', 'N', 0, 'N'),
(50, 56, 'questions', ' Community contributed Extensions/Plugins/Adapters/VM', NULL, 'community-contributed-extensionspluginsadaptersvm', 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have to modify a few things. Just look for "specific to your application" comments in the code. https://gist.github.com/SneakyBobito/6909234\r\n\r\nIt is based on PHPoAuthLib : https://github.com/Lusitanian/PHPoAuthLib then you have to add it to you autoloader Then you may add any service available in the lib (but i only tested with google and github). When you want to add a service : you have to generate an api key/secret key on the specific service and then put them into your config as with the examples of google and GitHub. Finaly add the action that has the same name of the oAuth service (github : GitHubAction google : GoogleAction)\r\n\r\nAll the examples of how to exploit the oAuth api are here : https://github.com/Lusitanian/PHPoAuthLib\r\n\r\n\r\n    $di[''mail''] = function () use ($cf) {\r\n    $mail = new PHPMailer;\r\n\r\n    $mail->isSMTP();\r\n    $mail->isHTML(true);\r\n\r\n    $mail->CharSet      = $cf->mail->charset;                                \r\n    $mail->Host         = $cf->mail->host;\r\n    $mail->SMTPAuth     = true;                               \r\n    $mail->Username     = $cf->mail->username;               \r\n    $mail->Password     = $cf->mail->password;                           \r\n    $mail->SMTPSecure   = $cf->mail->security;    \r\n    $mail->Port         = $cf->mail->port;\r\n\r\n    $mail->addAddress($cf->mail->email, $cf->mail->name);\r\n\r\n    return $mail;\r\n    };', 20, 2, 'N', 1433664088, 1438235737, 1433822699, 'A', 'N', 0, 'N'),
(51, 45, 'tips', ' Setting up PHPMailer', NULL, 'setting-up-phpmailer', 'Hi, welcome to the Phalcon official tips. We plan to share articles, tutorials and tips from the community and the Phalcon developers. All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented:\r\nWeekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.\r\nBadges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here.\r\nNotifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system\r\nSubscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.', 16, 1, 'N', 1433773306, 1437577448, 1433773506, 'A', 'N', 0, 'Y'),
(52, 47, 'questions', 'A tool for parsing', NULL, 'a-tool-for-parsing', 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.', 17, 2, 'Y', 1433775269, 1438332887, 1438332887, 'A', 'N', 0, 'Y'),
(53, 47, 'tips', 'Horizontal Scaling of PHP Apps', NULL, 'horizontalscalingofphpapps', 'In part 1, we discussed the horizontal scaling of the application layer – scaling out servers to handle the PHP code concurrently via load balancers and other means. We covered sharing of local data, touched on potential optimization, and explained the basics of load balancers.\r\n\r\nThe application layer, however, isn’t the only thing that needs scaling. With a bigger demand for our app, the demand for higher read/write operations on the database also surfaces. In this part, we’ll look at scaling the database, explain replication, and cover some common pitfalls you might want to avoid.\r\n\r\n#Optimization\r\n\r\nAs in Part 1, we need to mention optimization first. Indexing your database properly, making sure the tables consist of the least amount of important data and keeping the secondary information in others (users_basic + users_additional + users_alt_contacts, etc – known as database sharding – a complex topic warranting its own article for sure), doing small, atomic queries as opposed to large on-the-fly calculations – all those methods can help you speed up your databases and avoid bottlenecks. There’s one aspect that can help even more, though – query cache.\r\n\r\nDatabase servers typically cache results and compiled SELECT queries that were last executed. This allows a client (our app) to receive the data from cache instead of having to wait for execution again. Such an approach saves CPU cycles, produces results faster, and frees the servers from doing unnecessary calculations. But the query cache is limited in size, and some data sets change more often than others. Using the cache on all of our data would be ludicrous, especially if some information changes faster than some other information. While the cache can be fine tuned, depending on the database vendor, there’s an approach that lends itself quite nicely to the query cache solution – contextual grouping of servers.', 2, 1, 'N', 1434962514, 1435470999, NULL, 'A', 'N', 0, 'N'),
(54, 47, 'hackernews', 'Laracast Best video', 'https://laracasts.com', 'laracastbestvideo', 'The best PHP screencasts on the web. Buy me lunch once a month, and I''ll teach you everything about modern PHP workflow. ', 2, 0, 'N', 1434982459, 1435471320, NULL, 'A', 'N', 0, 'N'),
(55, 47, 'hackernews', 'Best link startup', 'http://codeblog.jonskeet.uk/2010/08/29/writing-the-perfect-question/', 'bestlinkstartup', 'oughly, the number of upvotes on their stories and comments, minus the number of downvotes. The numbers won''t exactly match up, because some votes aren''t counted to prevent various types of abuse. ', 4, 0, 'N', 1434982746, 1435471092, NULL, 'A', 'N', 0, 'N'),
(56, 47, 'hackernews', 'The best question and answers', NULL, 'thebestquestionandanswers', 'Have you thoroughly searched for an answer before asking your question? Sharing your research helps everyone. Tell us what you found (on this site or elsewhere) and why it didn’t meet your needs. This demonstrates that you’ve taken the time to try to help yourself, it saves us from reiterating obvious answers, and above all, it helps you get a more specific and relevant answer!', 4, 0, 'N', 1434982831, 1435468545, NULL, 'A', 'N', 0, 'N'),
(57, 59, 'hackernews', 'Best website community questions and answer', 'http://ama.phanbook.com', 'bestwebsitecommunityquestionsandanswer', 'A local mail server, such as Postfix, is the most robust way to send email through SendGrid when configured to queue all email from your application and then relay the messages through SendGrid as a smart host. This has the least latency from your application’s perspective with the added benefit of handing your email off to a fault tolerant server. If internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resending the email, as opposed to building that intelligence into your sending application.', 9, 6, 'N', 1435215496, 1438235737, NULL, 'A', 'N', 0, 'N'),
(58, 59, 'questions', ' Optimal mullps/addps instructions order for 3 SSE units for Intel Core 2 Duo and How to install Phalcon on android', NULL, 'optimalmullpsaddpsinstructionsorderfor3sseunitsforintelcore2duo', 'It''s known that Intel Core 2 Duo has 3 SSE units. These 3 units allows 3 SSE instructions to be run paralelly (1), for example:\r\n\r\nIt''s known also, that each SSE unit consists of 2 modules: one for addition (substraction), and one for multiplication (division). The latter allows to run mullps-addps instruction sequences parallelly (2), for example:\r\n\r\nWhich way of instruction ordering should I prefer, A or B?\r\n\r\nMore specifically:\r\n\r\n- Is it possible to distribute 3 mulps to 3 SSE multiplication units (1), and at the same time (2) to distribute addps to their respective SSE addition units, resulting in total 6 instructions per schedule cycle?\r\n\r\n- If I run N mullps first, and N addps then - which N is optimal?\r\n\r\nRemarks\r\n\r\n    by ''scheduled'' I mean throughput rate.\r\n', 15, 9, 'N', 1435216990, 1438235737, 1436666390, 'A', 'N', 0, 'Y'),
(59, 59, 'questions', 'SSE instructions in a buffer', NULL, 'sseinstructionsinabuffer', 'If I have an instruction buffer for x86 is there an easy way to check if an instruction is an SSE instruction without having to check if the opcode is within the ranges for the SSE instructions? By this I mean is there a common instruction prefix or processor state (such as a register) that can be checked?', 10, 1, 'N', 1435219372, 1437848185, NULL, 'A', 'N', 0, 'N'),
(60, 47, 'hackernews', 'Github', 'https://github.com/eva-thien', 'github', ' Remember the human. When you communicate online, all you see is a computer screen. When talking to someone you might want to ask yourself "Would I say it to the person''s face?" or "Would I get jumped if I said this to a buddy?". ', 2, 0, 'N', 1435476872, 1435552596, NULL, 'A', 'N', 0, 'N'),
(61, 77, 'questions', 'Functions in View', NULL, 'functionsinview', 'So in my project i need to count how many comments each articles has , is there any way that i can run a function on my view ? Or a diffrent method ?\r\n\r\n```\r\n    <?php foreach( $articles as $id => $article ): ?>\r\n    <div class="day"><?=(new DateTime($article->date))->format("d")?></div>\r\n    <a class="comments pull-right" href="#"> 0 Comments </a>\r\n    <?php endforeach; ?>\r\n```', 6, 1, 'N', 1435889323, 1438235737, 1437929152, 'A', 'N', 0, 'Y'),
(62, 59, 'questions', 'how to tell if an attribute exists', NULL, 'howtotellifanattributeexists', 'Hi,\r\n\r\nI''m using $attribValue = $this->readAttribute(AppModel::FIELD); to get the value of this model/attribute.\r\n\r\nIf the field not exists, I have value is $attribValue = null, but the field, if exists, can contain null values too.\r\n\r\nso ... how do I know if the field/attribute exists and what its value?\r\n\r\nsorry for my english', 10, 2, 'N', 1435890003, 1438235737, NULL, 'A', 'N', 0, 'Y'),
(63, 77, 'questions', 'Count total records with limit', NULL, 'counttotalrecordswithlimit', 'Hi, I''m trying to implement a rest server and some of my request have a lot of data.\r\n\r\nAs I''m using ionic to consume this api, I''m avoiding returning all the dataset on the first fetch, so I implemented a "infinite scroll" that request new data evertyime the page reachs the bottom, basically a pagination.\r\n\r\nI need to inform in the app how many records I have in total and array.length in javascript will not help me (since I get the data by pieces).\r\n\r\nAlso, on Phalcon, when I call count on a ResultSet it return the count of the results on the ResultSet, so, if I apply a limit 0, 50 and count it will return 50.\r\n\r\nThere''s any way to get the total number of records as if I haven''t used limit instead of creating 2 queries (1 with the limit the fetch right and another without the limit to do the count)?\r\n\r\nThanks and sorry about the bad english', 9, 1, 'N', 1435891064, 1437494554, NULL, 'A', 'N', 0, 'Y'),
(64, 77, 'questions', 'Introducing Built with Phalcon', NULL, 'introducingbuiltwithphalcon', 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.\r\n\r\nIntroducing builtwith.phalconphp.com\r\n\r\nTaking the example from our friends at AngularJS we have cloned their repository and we have Phalcon-ized it. Special thanks to the AngularJS team as well as Ole Aass who is leading the project.\r\n\r\nThe new site has a very easy interface that users can navigate to and even search for projects with tags. You can add your own project by simply cloning our repository and adding your project as well as a logo and screenshots and then issue a pull request for it to appear in the live site.\r\n\r\nLooking forward to seeing your projects listed up there!\r\n\r\n<3 The Phalcon Team', 11, 1, 'N', 1435892143, 1437922555, NULL, 'A', 'N', 0, 'N'),
(65, 77, 'tips', 'Phalcon Conference 2015', NULL, 'phalconconference2015', 'Hello hello,\r\n\r\nA couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers.\r\n\r\nTake a look at this survey and let us know!\r\n\r\nIf there''s something not mentioned in the survey, respond to this thread with whatever you want to share. As long as it''s relevant to the survey and or conference.\r\n\r\n***Thanks!***\r\n\r\nupdated per 2014-11-25, The survey is Amsterdam specific now.', 16, 2, 'N', 1435892590, 1437749892, 1435992124, 'A', 'N', 0, 'N'),
(66, 78, 'questions', 'Phalcon/Zephir Funding Campaign', NULL, 'phalcon-zephir-funding-campaign', 'Hey Community,\r\n# Header {.sth}\r\n\r\n# Header {.sth}\r\n\r\n\r\nSince 3 years we have been working on Phalcon trying to improve it and move forward with the resources we have. Most of the work has been done in our spare time and with the great help of the community.\r\n\r\nIn the last year, due to our jobs and other responsibilities, progress in Phalcon has been a little bit slower, we would like this to change next year.\r\n\r\nWe are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n\r\nFollowing is the summary of the campaign:\r\n\r\nWe are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.\r\n\r\nHow will we use this money?\r\n\r\n\r\nPhalcon/Zephir goals\r\n\r\nAllow us to pay 1-2 fully-dedicated core developers for a year\r\nDevelop the most popular requests from the community on Github in a short and realistic time frame\r\nProvide high-quality answers and support in forums and StackOverflow\r\nRelease new versions constantly\r\nProvide a LTS (Long Term Support) version focused on the enterprise\r\nPhalcon specific goals\r\n\r\nImprove documentation covering a larger number of subjects in depth\r\nCreate more tutorials and examples focused on a novice, intermediate and advanced audience\r\nExtend test-suite achieving greater coverage and increasing framework quality\r\nZephir specific goals\r\n\r\nFinish the implementation of a JIT compiler for Zephir to facilitate testing and debugging of software created in this language\r\nCreate a debugger that facilitates the development of extensions in this language\r\nIncrease the number of backends that currently Zephir supports\r\nSupport future versions of PHP and maintain backwards compatibility with already released PHP versions\r\nExtend and improve the test-suite to verify what has been built also works.\r\nYou can donate here: https://pledgie.com/campaigns/27405\r\n\r\nIf you have any questions, feel free to ask.\r\n\r\nThanks!\r\n\r\n```\r\nvagrant && vagrant up\r\n```\r\n\r\n    <?php\r\n      echo "Aaaa"\r\n    ?>', 19, 4, 'Y', 1436285728, 1438503008, 1438497497, 'A', 'N', 0, 'Y');
INSERT INTO `posts` (`id`, `usersId`, `type`, `title`, `link`, `slug`, `content`, `numberViews`, `numberReply`, `sticked`, `createdAt`, `modifiedAt`, `editedAt`, `status`, `locked`, `deleted`, `acceptedAnswer`) VALUES
(67, 59, 'tips', 'Versioning is in beta(!), what do you think?', NULL, 'versioningisinbetawhatdoyouthink', 'We just launched this Big New Internet Thing, so we''d love some Big New Internet Feedback. What''s cool? What''s uncool? (The video? yeah, I agree!) Comment below and we can interface about increasing stakeholder satisfaction in a meaningful and organic manner.\r\n\r\n\r\n\r\nPhanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues. \r\n\r\n## Installing\r\n\r\nTo install Phalcon PHP you need to install php development, to get that just adding command below\r\n\r\n```\r\nsudo apt-get install\r\n```\r\n\r\nThe CSS background-image property allows us to apply one or more background images to any HTML element. In this video I will explain how to use the property, including how to write URL values correctly, and how to write local and absolute paths to images.\r\n\r\nThis is one lesson from my Getting Started with CSS course on Learnable. If you enjoyed the video, check out the course. See you there!\r\n\r\n## Conculsion\r\n\r\nThe CSS background-image property allows us to apply one or more background images to any HTML element. In this video I will explain how to use the property, including how to write URL values correctly, and how to write local and absolute paths to images.\r\n\r\nThis is one lesson from my Getting Started with CSS course on Learnable. If you enjoyed the video, check out the course. See you there!', 7, 1, 'N', 1436695505, 1438225639, 1437016838, 'A', 'N', 0, 'N'),
(68, 59, 'questions', ' Introducing Built with Phalcon', NULL, 'introducingbuiltwithphalcon', 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.\r\n\r\nIntroducing builtwith.phalconphp.com\r\n\r\nTaking the example from our friends at AngularJS we have cloned their repository and we have Phalcon-ized it. Special thanks to the AngularJS team as well as Ole Aass who is leading the project.\r\n\r\nThe new site has a very easy interface that users can navigate to and even search for projects with tags. You can add your own project by simply cloning our repository and adding your project as well as a logo and screenshots and then issue a pull request for it to appear in the live site.\r\n\r\nLooking forward to seeing your projects listed up there!\r\n\r\n<3 The Phalcon Team', 6, 21, 'N', 1436774335, 1438223821, NULL, 'A', 'N', 0, 'N'),
(69, 59, 'tips', 'Provisioning Phalcon (and other tools) with Vagrant', NULL, 'provisioningphalconandothertoolswithvagrant', 'Matthew Setter''s last article on PuPHPet covered the easy GUI-backed creation of Vagrant VMs. PuPHPet is an absolutely awesome tool in getting up and running with a development environment really fast, and offers some very neat default options.\r\n\r\nBut what if we want to step outside the defaults? What if we''d, for example, like to install a PHP extension that isn''t part of the default distribution and doesn''t exist in package managers?\r\n\r\nIn this tutorial, we''ll make sure the Phalcon framework is installed by default when we run vagrant up. Pre-installing software on a Vagrant VM is called provisioning.\r\n\r\n\r\n## Getting ready\r\n\r\nPlease walk through Matthew''s article before moving along with this one. Simply make sure you download a ready PHP-enabled VM.\r\n\r\nIn this particular case I used PHP 5.4 with Ubuntu (5.5 won''t work with it just yet via PuPHPet), but if you''ve got your own configuration you''re used to, please feel free to use it – just make sure you can get to a good phpinfo screen before continuing. Make certain your PHP configuration works and you can access the VM through the browser and execute a PHP script like\r\n\r\n## The basics of Provisioning\r\n\r\nVagrant offers several ways to provision software into your Virtual Machines. There''s Puppet (what PuPHPet is based on), Chef, Docker, and more. What we''ll be using is pure good old shell commands – Vagrant can execute a shell file we write if we pass it to its provisioning settings.\r\n\r\nSo, let''s say you need to install the text editor joe and want to do it through shell. In your PuPHPet folder''s shell subfolder, you would create a joe.sh file with the following contents:\r\n\r\n\r\n    #!/bin/bash\r\n    sudo su\r\n    apt-get install joe\r\n\r\n\r\n```\r\n\r\nThis shell script first identifies itself as executable by bash (optional), requests superuser permissions, and then it installs joe through the regular channels. To actually have this executed, we modify the Vagrantfile in the PuPHPet folder by adding the line\r\n\r\n```\r\nconfig.vm.provision :shell, :path => "shell/joe.sh"```\r\n\r\n## Installing Phalcon\r\n\r\nAs per Phalcon''s online installation instructions, the compilation process is straightforward:\r\n\r\n    git clone git://github.com/phalcon/cphalcon.git\r\n    cd cphalcon/build\r\n    sudo ./install\r\n\r\nHowever, we also need to enter phalcon.so into the PHP configuration, restart the server, and make sure all the prerequisites are installed (they are, PuPHPet took care of that for us). Let''s do this step by step.\r\n\r\nIn the shell subfolder again, create the file install_phalcon.sh. Give it the following content:\r\n\r\nNow if you re-run vagrant up after running vagrant destroy, you can see the phalcon.so extension in the PHP extensions folder:\r\n\r\n\r\nFirst, we create a phalcon.ini file in the /etc/php5/mods-available directory. We could echo it directly into php.ini, but this is just cleaner. Then, we symlink that newly created file to all the locations from where PHP can be run: Apache, command line and FPM. That way, all our potential PHP runtimes have Phalcon available. Finally, we restart Apache.\r\n\r\nIf you try running vagrant up now (after running vagrant destroy), you''ll notice the phpinfo screen displaying Phalcon as loaded after you re-visit the VM''s IP in your browser.\r\n\r\nBut what if the server process is named differently? For example, if it''s "httpd", or just "apache", and not "apache2"? Furthermore, what if we''ve got a different distro? On CentOS phalcon.ini should go to /etc/php.d/, and on other distros into other locations. Finally, what if we only do a vagrant halt and then run vagrant up but force a re-provision with the --provision flag? Wouldn''t it be better to simply ignore the Phalcon installation if it''s already installed?\r\n\r\nLuckily, slogsdon took all this into account for us. He built an excellent Phalcon installation shell script, ripe with IF clauses and more, and even created a phalcon-tools installation script.\r\n\r\nTo install Phalcon with all the above taken into account, place install_phalcon.sh into the shell folder of your PuPHPet download, and add it to the provisioner like we did for joe before. If you''d like to install Phalcon tools, do the same with install_phalcon-devtools.sh. That''s all you need to do – the script accounts for different servers and setups so all you need to do is have it run.\r\n\r\nNow you too can have an out-of-the-box ready Phalcon installation ready for development at the snap of your fingers. Naturally, you''ll need to do some additional tweaks to get URL rewriting to work on Nginx (just follow the Phalcon docs), but once the extension is installed and loaded by PHP, the hard part is over. What''s best, you can use this approach to install Phalcon on any of the PuPHPet supported environments as well – Digital Ocean, Rackspace or AWS. Just plug slogsdon''s shell into the provision settings, and you''re ready to go!\r\n\r\n##Conclusion\r\n\r\nIn this tutorial, we covered the basics of provisioning via shell and installed Phalcon (and joe) with a booting VM. Coming soon is a followup article from Matthew Setter which will deal with further customizations of the downloaded provision settings from PuPHPet.\r\n\r\nTo get familiar with the full workflow of Vagrant and Puppet, please do keep following this series as it''s about to get a whole lot more interesting!\r\n\r\nIf you have any comments, uncertainties, problems or just general feedback, please leave it in the comments below and I''ll do my best to address it as soon as possible! If you''ve got your own setup you''d like to share with the rest of us, do get in touch with me via +BrunoSkvorc and we''ll talk', 4, 0, 'N', 1437029974, 1437831289, NULL, 'A', 'N', 0, 'N'),
(70, 59, 'hackernews', ' Have you ever got hired for working with Phalcon?', 'abc.com', 'haveyouevergothiredforworkingwithphalcon', 'Phalcon, throught the last years, has grown to a full grown up framework that clashes any other big player in the market. With many advantages, the biggest still being performance for me, Phalcon slowly put the distrust of "that C framework" in the past to become a tool that seduce more and more PHP devs.\r\n\r\nAnd by dragging more attention, the community grew. Grew to the point there are probably some places actively relying into Phalcon as their main framework. So, with a bigger community, and jobs related to Phalcon starting to appear, here goes my questions.\r\n\r\nHave you ever been contacted for some job related with Phalcon?\r\n\r\nHave you already experiencied freelance offers or consulting requests?\r\n\r\nDo you have some business/startup that is using Phalcon and are seeking for devs?\r\n\r\nIf so, please share your experiences here. :)', 7, 3, 'N', 1437280485, 1438223215, NULL, 'A', 'N', 0, 'N'),
(71, 59, 'tips', 'Developer devops', NULL, 'developerdevops', 'The following instructions will automatically download and provision a virtual machine for you to begin hacking\r\non Phanbook with:\r\n\r\n### Getting Started\r\n\r\n1. Install Git: http://git-scm.com/downloads (or [GitHub for Windows](http://windows.github.com/) if you want a GUI). Recommend use github for Windows\r\n2. Install VirtualBox: https://www.virtualbox.org/wiki/Downloads\r\n3. Install Vagrant: http://www.vagrantup.com/ (We require Vagrant 1.7.2 or later)\r\n4. Open a terminal\r\n5. Clone the project: `git clone https://github.com/Phanbook/phanbook.git`\r\n6. Enter the project directory: `cd Phanbook` (Recommendation Create your workspace directory and clone project there. C:/workspace/phanbook/)\r\n\r\n### Using Vagrant\r\n\r\nWhen you''re ready to start working, boot the VM:\r\n\r\n    chmod +x phanbook.sh && ./phanbook.sh up\r\n\r\nOr you can runninng via command below\r\n\r\n```\r\ncd opsfiles && vagrant up\r\n```\r\n\r\nVagrant will prompt you for your admin password. This is so it can mount your local files inside the VM for an easy workflow.\r\n\r\n(The first time you do this, it will take a while as it downloads the VM image and installs it. Go grab a coffee.)\r\n\r\n**Note to Linux users**: Your Phanbook directory cannot be on an ecryptfs mount or you will receive an error: `exportfs: /home/your/path/to/Phanbook does not support NFS export`\r\n\r\n**Note to OSX/Linux users**: Vagrant will mount your local files via an NFS share. Therefore, make sure that NFS is installed or else you''ll receive the error message:\r\n\r\n```\r\nMounting NFS shared folders failed. This is most often caused by the NFS\r\nclient software not being installed on the guest machine. Please verify\r\nthat the NFS client software is properly installed, and consult any resources\r\nspecific to the linux distro you''re using for more information on how to\r\ndo this.\r\n```\r\n\r\nFor example, on Ubuntu, you can install NFS support by installing nfs-kernel-server with `apt-get install`.\r\n\r\nOnce the machine has booted up, you can shell into it by typing:\r\n\r\n```\r\n./phanbook.sh ssh\r\n```\r\nOr\r\n\r\n```\r\ncd opsfiles && vagrant ssh\r\n```\r\n\r\nThe Phanbook code is found in the /usr/share/nginx/html/www directory in the image.\r\n\r\n**Note to Windows users**: You cannot run ```vagrant ssh``` from a cmd prompt; you''ll receive the error message:\r\n\r\n```\r\n`vagrant ssh` isn''t available on the Windows platform. You are still able\r\nto SSH into the virtual machine if you get a Windows SSH client (such as\r\nPuTTY). The authentication information is shown below:\r\n\r\nHost: 192.168.33.33\r\nPort: 2222\r\nUsername: vagrant\r\nPrivate key: C:/Users/Your Name/.vagrant.d/insecure_private_key\r\n```\r\n\r\nAt this point, you will want to get an SSH client, and use it to connect to your Vagrant VM instead. We recommend\r\nPuTTY:\r\n\r\n**[PuTTY Download Link](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)**\r\n\r\nYou may use this client to connect to the VM by using ```vagrant/vagrant``` as your username/password, or by [using\r\nPuTTYGen to import the insecure_private_key file](http://jason.sharonandjason.com/key_based_putty_logins_mini_how_to.htm)\r\n(mentioned above) into a PuTTY profile to quickly access your VM.\r\n\r\n### Let''s contribution for phanbook.\r\n1. checkout your new branch (feature/your-name-branch)\r\n\r\n```\r\n$ ## creating new branch\r\n$ git checkout -b feature/{your-new-branch-name}\r\n```\r\n2. commit your files and let''s push\r\n\r\n```\r\ngit push origin feature/{your-new-branch-name}\r\n```\r\n\r\n### Shutting down the VM\r\n\r\nWhen you''re done working on Phanbook, you can shut down Vagrant with:\r\n\r\n```\r\ncd opsfiles && vagrant halt\r\n```\r\n\r\nor you can running \r\n\r\n```\r\n./phanbook.sh halt\r\n```\r\n', 3, 15, 'N', 1438149466, 1438222292, 1438149551, 'A', 'N', 0, 'N'),
(72, 59, 'tips', ' Phalcon vs Laravel', NULL, 'phalconvslaravel', 'I''m currently in a debate with some co-workers about which framework to use for our next mid sized buisness application.\r\nI''m trying to evangelize Phalcon and he favors Laravel. One point of contention is the ORM.\r\n\r\nHe basically says that Larvel:Eleoquent is better than Phalcon:ORM because it can more easily save related records. Here is an excerpt from Laravel...\r\n\r\n> you will often need to insert new related models. For example, you may\r\n> wish to insert a new comment for a post. Instead of manually setting\r\n> the post_id foreign key on the model, you may insert the new comment\r\n> from its parent Post model directly:', 0, 0, 'N', 1438225705, 1438225705, NULL, 'A', 'N', 0, 'N'),
(73, 59, 'tips', ' Phalcon vs Laravel', NULL, 'phalconvslaravel', 'I''m currently in a debate with some co-workers about which framework to use for our next mid sized buisness application.\r\nI''m trying to evangelize Phalcon and he favors Laravel. One point of contention is the ORM.\r\n\r\nHe basically says that Larvel:Eleoquent is better than Phalcon:ORM because it can more easily save related records. Here is an excerpt from Laravel...\r\n\r\n> you will often need to insert new related models. For example, you may\r\n> wish to insert a new comment for a post. Instead of manually setting\r\n> the post_id foreign key on the model, you may insert the new comment\r\n> from its parent Post model directly:', 0, 0, 'N', 1438225781, 1438315497, NULL, 'A', 'N', 1438315497, 'N'),
(74, 59, 'tips', ' Phalcon vs Laravel', NULL, 'phalconvslaravel', 'I''m currently in a debate with some co-workers about which framework to use for our next mid sized buisness application.\r\nI''m trying to evangelize Phalcon and he favors Laravel. One point of contention is the ORM.\r\n\r\nHe basically says that Larvel:Eleoquent is better than Phalcon:ORM because it can more easily save related records. Here is an excerpt from Laravel...\r\n\r\n> you will often need to insert new related models. For example, you may\r\n> wish to insert a new comment for a post. Instead of manually setting\r\n> the post_id foreign key on the model, you may insert the new comment\r\n> from its parent Post model directly:', 1, 0, 'N', 1438225810, 1438225849, NULL, 'A', 'N', 0, 'N'),
(75, 59, 'tips', 'WordPress as a Framework', NULL, 'wordpressasaframework', 'WordPress is one of the most popular CMS (Content Management Systems) as far as the user base and ease of access is concerned. Many famous content rich websites use WordPress as their back-end – including SitePoint itself. Regular updates, a larger community, great support forum, rich documentation and many other factors have put WP way ahead of its competitors.\r\n\r\nThe first thing that comes to most people’s minds when thinking of WordPress is Blog or Content Management Platform, but there is another angle to it. Have you considered that it can act as a full framework for developing web applications as well?\r\n\r\nThere are various aspects which are taken into consideration before choosing a framework for web development. In this piece, we are going to look into features that WP provides if we treat it as a web development framework.', 1, 0, 'N', 1438226079, 1438235738, NULL, 'A', 'N', 0, 'N'),
(76, 59, 'tips', 'About us', NULL, 'about-us', 'Phalconjobs  provides cutting-edge content for web professionals — developers, designers, programmers, freelancers and site owners.\r\n\r\nFounded by Thien; our mission is to deliver new ideas, emerging concepts, and teach state-of-the-art technology to our readers. Whether it’s via our practical tutorials, books, articles, courses, if it’s got anything to do with building the web - we''ve got you covered.', 1, 0, 'N', 1438226275, 1438327058, 1438327058, 'A', 'N', 0, 'N'),
(77, 59, 'tips', 'Working with Models', NULL, 'working-with-models', 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.', 0, 0, 'N', 1438226363, 1438327214, 1438327213, 'A', 'N', 0, 'N'),
(78, 78, 'questions', 'test nuumber tag', NULL, 'test-nuumber-tag', 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.', 0, 0, 'N', 1438327237, 1438525097, NULL, 'A', 'N', 1438525097, 'N'),
(79, 78, 'questions', 'test nuumber tag', NULL, 'test-nuumber-tag', 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.', 0, 0, 'N', 1438327342, 1438525090, NULL, 'A', 'N', 1438525090, 'N'),
(80, 78, 'questions', 'test nuumber tag', NULL, 'test-nuumber-tag', 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.', 0, 1, 'N', 1438327369, 1438525085, 1438333194, 'A', 'N', 1438525085, 'N'),
(81, 78, 'questions', 'TEST tAG', NULL, 'test-tag', 'Phalcon\\Mvc\\ModelPhalcon\\Mvc\\ModelPhanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.\r\n', 0, 0, 'N', 1438333233, 1438333233, NULL, 'A', 'N', 0, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `postsBounties`
--

CREATE TABLE IF NOT EXISTS `postsBounties` (
  `id` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `postsReplyId` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  `createdAt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `postsHistory`
--

CREATE TABLE IF NOT EXISTS `postsHistory` (
  `id` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `createdAt` int(11) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `postsHistory`
--

INSERT INTO `postsHistory` (`id`, `postsId`, `usersId`, `createdAt`, `content`) VALUES
(1, 38, 3, 1425055778, 'Test post editor by admin or modator'),
(2, 42, 1, 1425055778, 'Test post editor by admin or modator'),
(3, 2, 45, 1431592201, ' have a Nikon D5100 (58mm thread) and want to find a telephoto adapter that go with my 55-300mm lens. Most I see are 52mm, why is that? What should I be looking for to FIT my 300mm lens'),
(4, 44, 45, 1431767201, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(5, 44, 45, 1431767347, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(6, 44, 45, 1431767355, '**strong text**Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(7, 44, 45, 1431767363, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(8, 44, 45, 1431767378, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(9, 44, 45, 1431767403, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(10, 44, 45, 1431767436, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(11, 44, 45, 1431767510, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(12, 44, 45, 1431767520, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(13, 44, 45, 1431767535, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(14, 44, 45, 1431767540, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(15, 44, 45, 1431767567, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(16, 44, 45, 1431767589, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(17, 44, 45, 1431767597, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(18, 44, 45, 1431767601, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(19, 42, 45, 1432188116, 'Em đang học tập và nghiên cưu phát triển những dự án mạng xã hội nhưng em vẫn còn yếu về cách load database hàng triệu record, hoặc người dùng truy cập quá nhiều. Xin các tiền bối chỉ giáo và cho em xin các giải quyết nhe! Xin chân thành cảm ơn!'),
(20, 3, 45, 1432622932, '**strong text**Bootstrap is downloadable in two forms, within which you''ll find the following directories and files, logically grouping common resources and providing both compiled and minified variations.\r\n\r\n> logically grouping common resources and providing both compiled and\r\n> minified variations.'),
(21, 38, 45, 1432624352, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)\r\n\r\nAtlassian takes security seriously and publishes security advisories and patches when security threats become known. Compared to Bugzilla, JIRA security risks are somewhat higher due to the larger overall complexity, a lot of client-side JavaScript code, and additional functionality provided by 3rd-party plugins. '),
(22, 46, 45, 1432633462, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở '),
(23, 45, 45, 1432633488, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở '),
(24, 45, 45, 1432633572, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở.\r\n\r\n Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở '),
(25, 3, 45, 1432706279, '**strong text**Bootstrap is downloadable in two forms, within which you''ll find the following directories and files, logically grouping common resources and providing both compiled and minified variations.\r\n\r\n> logically grouping common resources and providing both compiled and\r\n> minified variations.'),
(26, 46, 45, 1432723368, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n> địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử\r\n> hay đơn giãn chỉ lạ nơi bạn đang ở'),
(27, 46, 45, 1432889430, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(28, 42, 45, 1432973103, 'Em đang học tập và nghiên cưu phát triển những dự án mạng xã hội nhưng em vẫn còn yếu về cách load database hàng triệu record, hoặc người dùng truy cập quá nhiều. Xin các tiền bối chỉ giáo và cho em xin các giải quyết nhe! Xin chân thành cảm ơn!\r\n\r\n\r\n    owned: function(){\r\n        this.url = this.options.url.owned;\r\n        this.parse = function(users){\r\n            return users.map(function(user){\r\n                return user;\r\n            });\r\n        };\r\n        this.fetch({\r\n            data: {\r\n                screen_name : login\r\n            }\r\n        });\r\n    }'),
(29, 42, 45, 1432973222, '> Em đang học tập và nghiên cưu phát triển những dự án mạng xã hội nhưng\r\n> em vẫn còn yếu về cách load database hàng triệu record, hoặc người\r\n> dùng truy cập quá nhiều. Xin các tiền bối chỉ giáo và cho em xin các\r\n> giải quyết nhe! Xin chân thành cảm ơn!\r\n\r\n\r\n    owned: function(){\r\n        this.url = this.options.url.owned;\r\n        this.parse = function(users){\r\n            return users.map(function(user){\r\n                return user;\r\n            });\r\n        };\r\n        this.fetch({\r\n            data: {\r\n                screen_name : login\r\n            }\r\n        });\r\n    }\r\n\r\n## Abc '),
(30, 42, 45, 1432973297, '> Em đang học tập và nghiên cưu phát triển những dự án mạng xã hội nhưng\r\n> em vẫn còn yếu về cách load database hàng triệu record, hoặc người\r\n> dùng truy cập quá nhiều. Xin các tiền bối chỉ giáo và cho em xin các\r\n> giải quyết nhe! Xin chân thành cảm ơn!\r\n\r\n\r\n    owned: function(){\r\n        this.url = this.options.url.owned;\r\n        this.parse = function(users){\r\n            return users.map(function(user){\r\n                return user;\r\n            });\r\n        };\r\n        this.fetch({\r\n            data: {\r\n                screen_name : login\r\n            }\r\n        });\r\n    }\r\n\r\n## Abc '),
(31, 42, 45, 1432973390, 'Em đang học tập và nghiên cưu phát triển những dự án mạng xã hội nhưng em vẫn còn yếu về cách load database hàng triệu record, hoặc người dùng truy cập quá nhiều. Xin các tiền bối chỉ giáo và cho em xin các giải quyết nhe! Xin chân thành cảm ơn!\r\n\r\n\r\n    owned: function(){\r\n        this.url = this.options.url.owned;\r\n        this.parse = function(users){\r\n            return users.map(function(user){\r\n                return user;\r\n            });\r\n        };\r\n        this.fetch({\r\n            data: {\r\n                screen_name : login\r\n            }\r\n        });\r\n    }\r\n\r\n## Abc '),
(32, 46, 45, 1432976190, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(33, 46, 45, 1432976197, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(34, 46, 45, 1432976204, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(35, 47, 45, 1433145068, 'jjjj'),
(36, 46, 45, 1433172941, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(37, 46, 45, 1433172990, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(38, 48, 45, 1433222740, 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. \r\n\r\n\r\n> Social Questions is an open source project and a volunteer effort.\r\n\r\n Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. '),
(39, 48, 45, 1433222747, 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. \r\n\r\n\r\nSocial Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. '),
(40, 48, 45, 1433222754, 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. \r\n\r\n\r\nSocial Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. '),
(41, 46, 45, 1433537784, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(42, 46, 45, 1433537814, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(43, 48, 45, 1433537845, 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. \r\n\r\n\r\nSocial Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues. '),
(44, 46, 45, 1433663406, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở  Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những \r\n\r\n\r\n    <?php\r\n\r\n         // Imports all of the files we need\r\n         require_once ''path_to_stackphp/api.php'';\r\n\r\n         // Create a Site object for Stack Apps and get the questions tagged ''app''\r\n         $stackapps = API::Site(''stackapps'');\r\n         $apps      = $stackapps->Questions()->Tagged(''app'')->Exec();\r\n\r\n        // Notice that we are fetching ALL apps across ALL pages here\r\n          while($app = $apps->Fetch())\r\n               echo "{$app[''title'']}\\n";\r\n\r\n          ?>\r\n\r\nThis book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.'),
(45, 50, 45, 1433772184, 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have to modify a few things. Just look for "specific to your application" comments in the code. https://gist.github.com/SneakyBobito/6909234\r\n\r\nIt is based on PHPoAuthLib : https://github.com/Lusitanian/PHPoAuthLib then you have to add it to you autoloader Then you may add any service available in the lib (but i only tested with google and github). When you want to add a service : you have to generate an api key/secret key on the specific service and then put them into your config as with the examples of google and GitHub. Finaly add the action that has the same name of the oAuth service (github : GitHubAction google : GoogleAction)\r\n\r\nAll the examples of how to exploit the oAuth api are here : https://github.com/Lusitanian/PHPoAuthLib\r\n\r\n    $di[''mail''] = function () use ($cf) {\r\n    $mail = new PHPMailer;\r\n\r\n    $mail->isSMTP();\r\n    $mail->isHTML(true);\r\n\r\n    $mail->CharSet      = $cf->mail->charset;                                \r\n    $mail->Host         = $cf->mail->host;\r\n    $mail->SMTPAuth     = true;                               \r\n    $mail->Username     = $cf->mail->username;               \r\n    $mail->Password     = $cf->mail->password;                           \r\n    $mail->SMTPSecure   = $cf->mail->security;    \r\n    $mail->Port         = $cf->mail->port;\r\n\r\n    $mail->addAddress($cf->mail->email, $cf->mail->name);\r\n\r\n    return $mail;\r\n    };'),
(46, 50, 45, 1433772212, 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have to modify a few things. Just look for "specific to your application" comments in the code. https://gist.github.com/SneakyBobito/6909234\r\n\r\nIt is based on PHPoAuthLib : https://github.com/Lusitanian/PHPoAuthLib then you have to add it to you autoloader Then you may add any service available in the lib (but i only tested with google and github). When you want to add a service : you have to generate an api key/secret key on the specific service and then put them into your config as with the examples of google and GitHub. Finaly add the action that has the same name of the oAuth service (github : GitHubAction google : GoogleAction)\r\n\r\nAll the examples of how to exploit the oAuth api are here : https://github.com/Lusitanian/PHPoAuthLib\r\n\r\n\r\n    $di[''mail''] = function () use ($cf) {\r\n    $mail = new PHPMailer;\r\n\r\n    $mail->isSMTP();\r\n    $mail->isHTML(true);\r\n\r\n    $mail->CharSet      = $cf->mail->charset;                                \r\n    $mail->Host         = $cf->mail->host;\r\n    $mail->SMTPAuth     = true;                               \r\n    $mail->Username     = $cf->mail->username;               \r\n    $mail->Password     = $cf->mail->password;                           \r\n    $mail->SMTPSecure   = $cf->mail->security;    \r\n    $mail->Port         = $cf->mail->port;\r\n\r\n    $mail->addAddress($cf->mail->email, $cf->mail->name);\r\n\r\n    return $mail;\r\n    };'),
(47, 51, 45, 1433773397, 'Hi, welcome to the Phalcon official tips. We plan to share articles, tutorials and tips from the community and the Phalcon developers. All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented:\r\nWeekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.\r\nBadges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here.\r\nNotifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system\r\nSubscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.'),
(48, 51, 45, 1433773434, 'Hi, welcome to the Phalcon official tips. We plan to share articles, tutorials and tips from the community and the Phalcon developers. All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented:\r\nWeekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.\r\nBadges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here.\r\nNotifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system\r\nSubscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.'),
(49, 51, 45, 1433773469, 'Hi, welcome to the Phalcon official tips. We plan to share articles, tutorials and tips from the community and the Phalcon developers. All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented:\r\nWeekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.\r\nBadges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here.\r\nNotifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system\r\nSubscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.'),
(50, 51, 45, 1433773506, 'Hi, welcome to the Phalcon official tips. We plan to share articles, tutorials and tips from the community and the Phalcon developers. All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented:\r\nWeekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.\r\nBadges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here.\r\nNotifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system\r\nSubscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.'),
(51, 52, 45, 1433820437, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(52, 52, 45, 1433820569, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(53, 52, 45, 1433821612, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(54, 50, 45, 1433822699, 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have to modify a few things. Just look for "specific to your application" comments in the code. https://gist.github.com/SneakyBobito/6909234\r\n\r\nIt is based on PHPoAuthLib : https://github.com/Lusitanian/PHPoAuthLib then you have to add it to you autoloader Then you may add any service available in the lib (but i only tested with google and github). When you want to add a service : you have to generate an api key/secret key on the specific service and then put them into your config as with the examples of google and GitHub. Finaly add the action that has the same name of the oAuth service (github : GitHubAction google : GoogleAction)\r\n\r\nAll the examples of how to exploit the oAuth api are here : https://github.com/Lusitanian/PHPoAuthLib\r\n\r\n\r\n    $di[''mail''] = function () use ($cf) {\r\n    $mail = new PHPMailer;\r\n\r\n    $mail->isSMTP();\r\n    $mail->isHTML(true);\r\n\r\n    $mail->CharSet      = $cf->mail->charset;                                \r\n    $mail->Host         = $cf->mail->host;\r\n    $mail->SMTPAuth     = true;                               \r\n    $mail->Username     = $cf->mail->username;               \r\n    $mail->Password     = $cf->mail->password;                           \r\n    $mail->SMTPSecure   = $cf->mail->security;    \r\n    $mail->Port         = $cf->mail->port;\r\n\r\n    $mail->addAddress($cf->mail->email, $cf->mail->name);\r\n\r\n    return $mail;\r\n    };'),
(55, 45, 45, 1434029634, ' Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở.\r\n\r\n Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở \r\n\r\n> Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong\r\n> muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du\r\n> lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở.'),
(56, 2, 45, 1434358231, 'Have a Nikon D5100 (58mm thread) and want to find a telephoto adapter that go with my 55-300mm lens. Most I see are 52mm, why is that? What should I be looking for to FIT my 300mm lens. We recommend powering off your droplet through the command line, as this action is the same as hard resetting the server and may cause data corruption.'),
(57, 1, 45, 1434358243, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)..\r\n\r\nWe recommend powering off your droplet through the command line, as this action is the same as hard resetting the server and may cause data corruption.'),
(58, 45, 45, 1434416391, ' Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues. \r\n\r\n Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues. '),
(59, 1, 45, 1434416414, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)..We recommend powering off your droplet through the command line, as this action is the same as hard resetting the server and may cause data corruption.\r\n\r\nPhanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues');
INSERT INTO `postsHistory` (`id`, `postsId`, `usersId`, `createdAt`, `content`) VALUES
(60, 1, 59, 1434707984, 'In this particular post, we intend to offer a solution to install multiple versions of Phalcon, PHP and run them on a single web server. The PHP 5.5.x and 5.6.x will be used in here, but you can replace it with other versions. Any servers that support PHP-FPM should be enough but we recommend using the Nginx for the web server. The environment using in this tutorial is Fedora OS - a Linux system.\r\n\r\n### Preliminary Note\r\n\r\nThis tutorial will cover the installation of PHP 5.5.x correspoding Phalcon 1.3.x and PHP 5.6.x correspoding Phalcon 2.0.0. We also configuration some Nginx\r\n### Installing Nginx\r\n\r\nNginx is an available package in Fedora OS which we can install as follow:\r\n\r\n```\r\n  sudo yum install nginx\r\n\r\n```\r\nThen we create the system startup links for Nginx and start it\r\n\r\n```\r\n  sudo chkconfig nginx on\r\n  sudo service nginx start\r\n\r\n```\r\n### Building PHP\r\n\r\nBefore starting with PHP, we need to install the prerequisites for building PHP5:\r\n\r\n- gcc or some other compiler suite.\r\n- libc-dev, provides the C standard library, including headers.\r\n- make, which is the build-management tool PHP uses.\r\n- autoconf (2.59 or higher) for generating the configure script.\r\n- automake (1.4 or higher), generates Makefile.in files.\r\n- libtool, helps us manage shared libraries.\r\n- bison (2.4 or higher), for generating the PHP parser.\r\n- (optional) re2c, which is used to generate the PHP lexer. As the git repository already contains a generated lexer you will only need re2c if you wish to make changes to it.\r\n\r\nAlso you can references to full information [here](https://github.com/php/php-src/blob/master/INSTALL)\r\n\r\nOn Centos/Fedora you can install all these with the following command:\r\n\r\n```\r\n  sudo yum install gcc libxml2-devel libXpm-devel gmp-devel libicu-devel t1lib-devel aspell-devel openssl-devel bzip2-devel libcurl-devel libjpeg-devel libvpx-devel libpng-devel freetype-devel readline-devel libtidy-devel libxslt-devel libmcrypt-devel pcre-devel curl-devel mysql-devel ncurses-devel gettext-devel net-snmp-devel libevent-devel libtool-ltdl-devel libc-client-devel postgresql-devel bison gcc make\r\n\r\n```\r\nThen we need to get its source code. There are two ways to do this: You can either download an archive from [PHP’s download page](http://php.net/downloads.php) or clone the git repository from [Github](https://github.com/php/php-src).\r\n\r\nWe recommend to checkout out the source code from git, because it provides you an easy way to keep your installation up-to-date and to try your code with different versions. A git checkout is also required if you want to submit patches or pull requests for PHP.\r\n\r\nTo clone the repository, run the following commands in your terminal:\r\n\r\n```\r\n  sudo mkdir /opt/source && cd /opt/source\r\n  git clone git@github.com:php/php-src.git && cd php-src\r\n\r\n```\r\nBy default you will be on the master branch, so if you want to move on a development version, you need to check out the stable branch. For example.\r\n\r\n```\r\n  PHP 5.3:  git checkout PHP-5.3\r\n  PHP 5.4:  git checkout PHP-5.4\r\n  PHP 5.6:  git checkout PHP-5.6\r\n  PHP HEAD: git checkout master \r\n\r\n```\r\nBefore going to the individual build steps do, we must execute some "little" commands for a “default” PHP build. This is only necessary for who builds from git\r\n\r\n```\r\nsudo ./buildconf\r\n\r\n```\r\nThe "./buildconf" generates the configuration script. This may take several minutes. \r\n\r\nWe need to make a directory. In my opinion, I think storing the whole web server in a single directory is the best, so I use /opt here. Open the terminal and type the following command.\r\n\r\n```\r\n  sudo mkdir -p /opt/php-5.6\r\n  sudo mkdir -p /opt/php-5.5\r\n\r\n```\r\nOnce the ./configure script is generated you can use it to customize your PHP build. You can list all supported options using --help:\r\n\r\n```\r\n  ./configure --help\r\n\r\n```\r\n\r\nThe command line above will help list various generic options, which are supported by all autoconf-based configuration scripts. In our example below we''ll do a simple configure with PHP-FPM, --prefix is /opt/php-5.6, etc.\r\n\r\nHere are some useful settings:\r\n\r\n```\r\n  [...]\r\n\r\n  Usage: ./configure [OPTION]... [VAR=VALUE]...\r\n\r\n  To assign environment variables (e.g., CC, CFLAGS...), specify them as\r\n  VAR=VALUE.  See below for descriptions of some of the useful variables.\r\n\r\n  Defaults for the options are specified in brackets.\r\n\r\n  Configuration:\r\n    -h, --help              display this help and exit\r\n        --help=short        display options specific to this package\r\n        --help=recursive    display the short help of all the included packages\r\n    -V, --version           display version information and exit\r\n    -q, --quiet, --silent   do not print `checking ...'' messages\r\n        --cache-file=FILE   cache test results in FILE [disabled]\r\n    -C, --config-cache      alias for `--cache-file=config.cache''\r\n    -n, --no-create         do not create output files\r\n        --srcdir=DIR        find the sources in DIR [configure dir or `..'']\r\n\r\n  Installation directories:\r\n    --prefix=PREFIX         install architecture-independent files in PREFIX\r\n                            [/usr/local]\r\n    --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX\r\n                            [PREFIX]\r\n\r\n  By default, `make install'' will install all the files in\r\n  `/usr/local/bin'', `/usr/local/lib'' etc.  You can specify\r\n  an installation prefix other than `/usr/local'' using `--prefix'',\r\n  for instance `--prefix=$HOME''.\r\n\r\n  For better control, use the options below.\r\n\r\n  Fine tuning of the installation directories:\r\n    --bindir=DIR            user executables [EPREFIX/bin]\r\n    --sbindir=DIR           system admin executables [EPREFIX/sbin]\r\n    --libexecdir=DIR        program executables [EPREFIX/libexec]\r\n    --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]\r\n    --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]\r\n    --localstatedir=DIR     modifiable single-machine data [PREFIX/var]\r\n    --libdir=DIR            object code libraries [EPREFIX/lib]\r\n    --includedir=DIR        C header files [PREFIX/include]\r\n    --oldincludedir=DIR     C header files for non-gcc [/usr/include]\r\n    --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]\r\n    --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]\r\n    --infodir=DIR           info documentation [DATAROOTDIR/info]\r\n    --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]\r\n    --mandir=DIR            man documentation [DATAROOTDIR/man]\r\n    --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]\r\n    --htmldir=DIR           html documentation [DOCDIR]\r\n    --dvidir=DIR            dvi documentation [DOCDIR]\r\n    --pdfdir=DIR            pdf documentation [DOCDIR]\r\n    --psdir=DIR             ps documentation [DOCDIR]\r\n \r\n  [...]\r\n\r\n```\r\nAfter finishing the preparation we install the PHP version 5.6, run the following commands in your shell\r\n\r\n```\r\n\r\n./configure \\\r\n--prefix=/opt/php-5.6 \\\r\n--with-pdo-pgsql \\\r\n--with-zlib-dir \\\r\n--with-freetype-dir \\\r\n--enable-mbstring \\\r\n--with-libxml-dir=/usr \\\r\n--enable-soap \\\r\n--enable-calendar \\\r\n--with-curl \\\r\n--with-mcrypt \\\r\n--with-zlib \\\r\n--with-gd \\\r\n--with-pgsql \\\r\n--disable-rpath \\\r\n--enable-inline-optimization \\\r\n--with-bz2 \\\r\n--with-zlib \\\r\n--enable-sockets \\\r\n--enable-sysvsem \\\r\n--enable-sysvshm \\\r\n--enable-pcntl \\\r\n--enable-mbregex \\\r\n--with-mhash \\\r\n--enable-zip \\\r\n--with-pcre-regex \\\r\n--with-mysql \\\r\n--with-pdo-mysql \\\r\n--with-mysqli \\\r\n--with-png-dir=/usr \\\r\n--enable-gd-native-ttf \\\r\n--with-openssl \\\r\n--with-fpm-user=nginx \\\r\n--with-fpm-group=nginx \\\r\n--with-libdir=lib64 \\\r\n--enable-ftp \\\r\n--with-imap \\\r\n--with-imap-ssl \\\r\n--with-kerberos \\\r\n--with-gettext \\\r\n--with-gd \\\r\n--with-jpeg-dir=/usr/lib/ \\\r\n--enable-fpm\r\n```\r\nThe last switch (--enable-fpm) makes this PHP version work with PHP-FPM. If you want to use this PHP-FPM version with Apache, please use --with-fpm-user=apache and --with-fpm-group=apache. On the other hand, if you want to use this PHP-FPM version with nginx, please use --with-fpm-user=nginx and --with-fpm-group=nginx.\r\n\r\nIf everything goes fine. The successful message will be outputted in the terminal like\r\n\r\n```\r\n[...]\r\n\r\ncreating libtool\r\nappending configuration tag "CXX" to libtool\r\n\r\nGenerating files\r\nconfigure: creating ./config.status\r\ncreating main/internal_functions.c\r\ncreating main/internal_functions_cli.c\r\n+--------------------------------------------------------------------+\r\n| License:                                                           |\r\n| This software is subject to the PHP License, available in this     |\r\n| distribution in the file LICENSE.  By continuing this installation |\r\n| process, you are bound by the terms of this license agreement.     |\r\n| If you do not agree with the terms of this license, you must abort |\r\n| the installation process at this point.                            |\r\n+--------------------------------------------------------------------+\r\n\r\nThank you for using PHP.\r\n\r\nconfig.status: creating php5.spec\r\nconfig.status: creating main/build-defs.h\r\nconfig.status: creating scripts/phpize\r\nconfig.status: creating scripts/man1/phpize.1\r\nconfig.status: creating scripts/php-config\r\nconfig.status: creating scripts/man1/php-config.1\r\nconfig.status: creating sapi/cli/php.1\r\nconfig.status: creating sapi/fpm/php-fpm.conf\r\nconfig.status: creating sapi/fpm/init.d.php-fpm\r\nconfig.status: creating sapi/fpm/php-fpm.service\r\nconfig.status: creating sapi/fpm/php-fpm.8\r\nconfig.status: creating sapi/fpm/status.html\r\nconfig.status: creating sapi/cgi/php-cgi.1\r\nconfig.status: creating ext/phar/phar.1\r\nconfig.status: creating ext/phar/phar.phar.1\r\nconfig.status: creating main/php_config.h\r\nconfig.status: executing default commands\r\n\r\n```\r\n\r\nNow, you can use make to perform the actual compilation:\r\n  \r\n```\r\n  make\r\n\r\n```\r\nThe main result of this operation will be PHP binaries for the enabled SAPIs (by default sapi/cli/php and sapi/cgi/php-cgi), as well as shared extensions in the modules/ directory.\r\n\r\nNow you can run "make install" to install PHP into /usr/local (default) or another directories by using the --prefix configuration. In this case is /opt/php-5.6\r\n\r\n```\r\n  sudo make install\r\n\r\n```\r\nPlease note that the "make install" will not create an ini file.\r\n\r\n``` \r\n/opt/php-5.6/bin/php --ini\r\nConfiguration File (php.ini) Path: /opt/php-5.6/lib\r\nLoaded Configuration File:         (none)\r\nScan for additional .ini files in: (none)\r\nAdditional .ini files parsed:      (none)\r\n\r\n```\r\nCopy php.ini and php-fpm.conf to the correct directory:\r\n\r\n```\r\nsudo cp /opt/source/php-src/php-fpm.conf.default /opt/php-5.6/etc/php-fpm.conf\r\nsudo cp /opt/source/php-src/php.ini-production /opt/php-5.6/lib/php.ini\r\n\r\n```\r\nWe verify and checking the php version one more time.\r\n\r\n```\r\n  /opt/php-5.6/bin/php --ini\r\n  Configuration File (php.ini) Path: /opt/php-5.6/lib\r\n  Loaded Configuration File:         /opt/php-5.6/lib/php.ini\r\n  Scan for additional .ini files in: (none)\r\n  Additional .ini files parsed:      (none)\r\n\r\n  ### Checking php\r\n  /opt/php-5.6/bin/php --version\r\n  PHP 5.6.2-dev (cli) (built: Oct  2 2014 17:20:23) \r\n  Copyright (c) 1997-2014 The PHP Group\r\n  Zend Engine v2.6.0, Copyright (c) 1998-2014 Zend Technologies\r\n```\r\nOpen /opt/php-5.6/etc/php-fpm.conf and adjust the settings in the listen line. You must change to an unused port (e.g. 9001; the port 9000 might be in use by Fedora)\r\n\r\n```\r\n  vi /opt/php-5.6/etc/php-fpm.conf\r\n\r\n```\r\n\r\n```\r\n  [...]\r\n  pid = run/php-fpm.pid\r\n  [...]\r\n  user = nginx\r\n  group = nginx\r\n  [...]\r\n  listen = 127.0.0.1:9001\r\n  [...]\r\n  #include=/opt/php-5.6/etc/pool.d/*.conf\r\n\r\n```\r\n###Init script setup\r\n\r\nYou will probably want to create an init script for your new php-fpm. Luckily, the PHP 5.3+ already provides it for you, simply copy the init script to your directory and change permissions:\r\n\r\n```\r\n  sudo cp /opt/source/php-src/sapi/fpm/init.d.php-fpm /etc/init.d/php5.6-fpm\r\n  sudo chmod 755 /etc/init.d/php5.6-fpm\r\n```\r\n\r\nYour init script is ready. Now, you are able to start, stop and reload php-fpm:\r\n\r\n```\r\n  sudo /etc/init.d/php5.6-fpm start\r\n  sudo /etc/init.d/php5.6-fpm stop\r\n  sudo /etc/init.d/php5.6-fpm reload\r\n\r\n```\r\n\r\n###Building the second PHP (5.5.x)\r\n\r\nWe open up the terminal and type the following command.\r\n\r\n```\r\ngit checkout PHP-5.5\r\nsudo ./buildconf \r\n./configure \\\r\n--prefix=/opt/php-5.5 \\\r\n--with-pdo-pgsql \\\r\n--with-zlib-dir \\\r\n--with-freetype-dir \\\r\n--enable-mbstring \\\r\n--with-libxml-dir=/usr \\\r\n--enable-soap \\\r\n--enable-calendar \\\r\n--with-curl \\\r\n--with-mcrypt \\\r\n--with-zlib \\\r\n--with-gd \\\r\n--with-pgsql \\\r\n--disable-rpath \\\r\n--enable-inline-optimization \\\r\n--with-bz2 \\\r\n--with-zlib \\\r\n--enable-sockets \\\r\n--enable-sysvsem \\\r\n--enable-sysvshm \\\r\n--enable-pcntl \\\r\n--enable-mbregex \\\r\n--with-mhash \\\r\n--enable-zip \\\r\n--with-pcre-regex \\\r\n--with-mysql \\\r\n--with-pdo-mysql \\\r\n--with-mysqli \\\r\n--with-png-dir=/usr \\\r\n--enable-gd-native-ttf \\\r\n--with-openssl \\\r\n--with-fpm-user=nginx \\\r\n--with-fpm-group=nginx \\\r\n--with-libdir=lib64 \\\r\n--enable-ftp \\\r\n--with-imap \\\r\n--with-imap-ssl \\\r\n--with-kerberos \\\r\n--with-gettext \\\r\n--with-gd \\\r\n--with-jpeg-dir=/usr/lib/ \\\r\n--enable-fpm\r\n\r\nmake && sudo make install\r\n\r\n```\r\n###Building PHP Phalcon extensions\r\n\r\nTo install multiple versions of Phalcon include Phalcon 2.0, we need to install Zephir\r\n\r\n```\r\n  git clone https://github.com/json-c/json-c.git\r\n  cd json-c\r\n  sh autogen.sh\r\n  ./configure\r\n  make && sudo make install\r\n   \r\n  git clone https://github.com/phalcon/zephir\r\n  cd zephir\r\n  sudo ./install -c\r\n\r\n```\r\nThere are many ways to install PHP extensions. We will use phpize build it, so what is phpize ?\r\n\r\nphpize plays a similar role as the ./buildconf script used for PHP builds: First it will import the PHP build system into your extension by copying files from $PREFIX/lib/php/build. Among these files are acinclude.m4 (PHP’s M4 macros), phpize.m4 (which will be renamed to configure.in in your extension and contains the main build instructions) and run-tests.php.\r\n\r\nThen phpize will invoke autoconf to generate a ./configure file, which can be used to customize the extension build. Note that it is not necessary to pass --enable-apcu to it, as this is implicitly assumed. Instead you should use --with-php-config to specify the path to your php-config script:\r\n\r\nRemember!!!. You must specify the --with-php-config option when build the extensions (unless you have only a single, global installation of PHP). Otherwise the ./configure will not be able to determine correctly the PHP version and flags. Moreover, the php-config script also ensures that "make install" command will move the generated .so file (which can be found in the modules/ directory) to the right extension directory.\r\n\r\n###Building the first PHP Phalcon (2.0)\r\n\r\n```\r\n  git clone http://github.com/phalcon/cphalcon\r\n  cd cphalcon && git checkout 2.0.0\r\n  zephir compile\r\n  cd ext && /opt/php-5.6/bin/phpize\r\n  ./configure --with-php-config=/opt/php-5.6/bin/php-config\r\n  make && sudo make install\r\n  Installing shared extensions:     /opt/php-5.6/lib/php/extensions/no-debug-non-zts-20131226/\r\n\r\n```\r\nPlease check whether or not it is successful\r\n\r\n```\r\n  ls /opt/php-5.6/lib/php/extensions/no-debug-non-zts-20131226/\r\n\r\n```\r\nAfter the extension is installed. You still need to activate it by including it in php.ini file.  \r\n\r\n```\r\n  sudo su\r\n  echo "extension=phalcon.so" >> /opt/php-5.6/lib/php.ini\r\n  exit\r\n\r\n```\r\n###Building the second PHP Phalcon (1.3.x)\r\n```\r\n  git clone http://github.com/phalcon/cphalcon\r\n  cd cphalcon && git checkout master\r\n  cd ext && /opt/php-5.5/bin/phpize\r\n  ./configure --with-php-config=/opt/php-5.5/bin/php-config\r\n  make && sudo make install\r\n  Installing shared extensions:     /opt/php-5.5/lib/php/extensions/no-debug-non-zts-20121212/\r\n\r\n```\r\nWe check again to make sure the installation is successful\r\n\r\n```\r\n  ls /opt/php-5.6/lib/php/extensions/no-debug-non-zts-20131226/\r\n  sudo su\r\n  echo "extension=phalcon.so" >> /opt/php-5.5/lib/php.ini\r\n  exit\r\n\r\n```\r\n###Configuring Nginx\r\n\r\n```\r\n  sudo vi /etc/nginx/nginx.conf\r\n\r\n```\r\nThe following configuration will create two servers: the phalcon-prd.localhost runs on PHP 5.5.x and phalcon-dev.localhost works with PHP 5.6.x. This is a example, you can customize anything you want, [see Nginx documentation](http://wiki.nginx.org/Main)\r\n\r\n```\r\n[...]\r\nhttp {\r\n  include       mime.types;\r\n  default_type  application/octet-stream;\r\n  sendfile        on;\r\n  keepalive_timeout  65;\r\n  #gzip  on;\r\n  include /etc/nginx/conf.d/*.conf;\r\n\r\n  index index.php index.html index.htm;\r\n\r\n  #Prodution environment Phalcon\r\n  server {\r\n    listen       80;\r\n    server_name  phalcon-prd.localhost;\r\n\r\n    root   /usr/share/nginx/html/phalcon-prd;\r\n\r\n    location / {\r\n      index  index.php;\r\n    }\r\n\r\n    location ~ \\.php$ {\r\n      fastcgi_pass   127.0.0.1:9001;\r\n      fastcgi_index  index.php;\r\n      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;\r\n      include        fastcgi_params;\r\n    }\r\n  }\r\n  #Development environment Phalcon\r\n  server {\r\n    listen       80;\r\n    server_name  phalcon-dev.localhost;\r\n\r\n    root   /usr/share/nginx/html/phalcon-prd;\r\n\r\n    location / {\r\n      index  index.php;\r\n    }\r\n\r\n    location ~ \\.php$ {\r\n      fastcgi_pass   127.0.0.1:9002;\r\n      fastcgi_index  index.php;\r\n      fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;\r\n      include        fastcgi_params;\r\n    }\r\n  }\r\n}\r\n[...]\r\n```\r\n###Set Up Local Hosts File\r\nIf you are using a Linux system, you can edit the host file:\r\n\r\n```\r\n  sudo vi /etc/hosts\r\n```\r\n\r\nThe new host file will look like.\r\n\r\n```\r\n[...]\r\n127.0.0 localhost phalcon-dev.localhost phalcon-prd.localhost\r\n::1   localhost6.localdomain6 localhost6\r\n[...]\r\n```\r\nThis one intercepts all requests for phalcon-dev.localhost and phalcon-prd.localhost then send them to your server.\r\n\r\n###Testing it\r\n\r\nFor testing, we create a new file called test.php and put it into folder corresponding to the above configuration of Nginx. In each files, we add the following command.\r\n\r\n```\r\n  <?php phpinfo(); ?>\r\n\r\n```\r\nNow running the test.php file in each server, we see a Phalcon 1.3.x phpinfo() at http://phancon-prd.localhost/test.php while at http://phancon-dev.localhost/test.php should be phpinfo() of Phalcon 2.0.x\r\n\r\n![](http://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2014/10/1413540042Selection_021.png)\r\n### In conclusion\r\n\r\nSo we’ve been taken to have a overview about install multiple versions of Phalcon and PHP. With this way you are able to run as many as versions  of Phalcon as well as PHP.\r\n\r\nLeave your feedback in the comments below and, as always, please share this article if you liked it!'),
(61, 65, 59, 1435992124, 'Hello hello,\r\n\r\nA couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers.\r\n\r\nTake a look at this survey and let us know!\r\n\r\nIf there''s something not mentioned in the survey, respond to this thread with whatever you want to share. As long as it''s relevant to the survey and or conference.\r\n\r\n***Thanks!***\r\n\r\nupdated per 2014-11-25, The survey is Amsterdam specific now.'),
(62, 66, 59, 1436442162, 'Hey Community,\r\n\r\nSince 3 years we have been working on Phalcon trying to improve it and move forward with the resources we have. Most of the work has been done in our spare time and with the great help of the community.\r\n\r\nIn the last year, due to our jobs and other responsibilities, progress in Phalcon has been a little bit slower, we would like this to change next year.\r\n\r\nWe are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n\r\nFollowing is the summary of the campaign:\r\n\r\nWe are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.\r\n\r\nHow will we use this money?\r\n\r\n\r\nPhalcon/Zephir goals\r\n\r\nAllow us to pay 1-2 fully-dedicated core developers for a year\r\nDevelop the most popular requests from the community on Github in a short and realistic time frame\r\nProvide high-quality answers and support in forums and StackOverflow\r\nRelease new versions constantly\r\nProvide a LTS (Long Term Support) version focused on the enterprise\r\nPhalcon specific goals\r\n\r\nImprove documentation covering a larger number of subjects in depth\r\nCreate more tutorials and examples focused on a novice, intermediate and advanced audience\r\nExtend test-suite achieving greater coverage and increasing framework quality\r\nZephir specific goals\r\n\r\nFinish the implementation of a JIT compiler for Zephir to facilitate testing and debugging of software created in this language\r\nCreate a debugger that facilitates the development of extensions in this language\r\nIncrease the number of backends that currently Zephir supports\r\nSupport future versions of PHP and maintain backwards compatibility with already released PHP versions\r\nExtend and improve the test-suite to verify what has been built also works.\r\nYou can donate here: https://pledgie.com/campaigns/27405\r\n\r\nIf you have any questions, feel free to ask.\r\n\r\nThanks!'),
(63, 52, 59, 1436607510, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(64, 58, 59, 1436666390, 'It''s known that Intel Core 2 Duo has 3 SSE units. These 3 units allows 3 SSE instructions to be run paralelly (1), for example:\r\n\r\nIt''s known also, that each SSE unit consists of 2 modules: one for addition (substraction), and one for multiplication (division). The latter allows to run mullps-addps instruction sequences parallelly (2), for example:\r\n\r\nWhich way of instruction ordering should I prefer, A or B?\r\n\r\nMore specifically:\r\n\r\n- Is it possible to distribute 3 mulps to 3 SSE multiplication units (1), and at the same time (2) to distribute addps to their respective SSE addition units, resulting in total 6 instructions per schedule cycle?\r\n\r\n- If I run N mullps first, and N addps then - which N is optimal?\r\n\r\nRemarks\r\n\r\n    by ''scheduled'' I mean throughput rate.\r\n'),
(65, 44, 59, 1436974746, 'Mình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được. ình muốn sử dụng Markdown để đăng bài, nhưng không biết cách. Đành gõ lụi thế này thì được.\r\n\r\n    int foo()\r\n    {\r\n        // bar \r\n    }\r\n\r\nNhưng hình như zphalcon có chưa làm hướng dẫn?'),
(66, 67, 59, 1437016776, 'We just launched this Big New Internet Thing, so we''d love some Big New Internet Feedback. What''s cool? What''s uncool? (The video? yeah, I agree!) Comment below and we can interface about increasing stakeholder satisfaction in a meaningful and organic manner.\r\n\r\n\r\n\r\nPhanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues. \r\n\r\n## Installing\r\n\r\nTo install Phalcon PHP you need to install php development, to get that just adding command below\r\n\r\n```\r\nsudo apt-get install\r\n```'),
(67, 67, 59, 1437016838, 'We just launched this Big New Internet Thing, so we''d love some Big New Internet Feedback. What''s cool? What''s uncool? (The video? yeah, I agree!) Comment below and we can interface about increasing stakeholder satisfaction in a meaningful and organic manner.\r\n\r\n\r\n\r\nPhanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues. \r\n\r\n## Installing\r\n\r\nTo install Phalcon PHP you need to install php development, to get that just adding command below\r\n\r\n```\r\nsudo apt-get install\r\n```\r\n\r\nThe CSS background-image property allows us to apply one or more background images to any HTML element. In this video I will explain how to use the property, including how to write URL values correctly, and how to write local and absolute paths to images.\r\n\r\nThis is one lesson from my Getting Started with CSS course on Learnable. If you enjoyed the video, check out the course. See you there!\r\n\r\n## Conculsion\r\n\r\nThe CSS background-image property allows us to apply one or more background images to any HTML element. In this video I will explain how to use the property, including how to write URL values correctly, and how to write local and absolute paths to images.\r\n\r\nThis is one lesson from my Getting Started with CSS course on Learnable. If you enjoyed the video, check out the course. See you there!'),
(68, 61, 59, 1437929102, 'So in my project i need to count how many comments each articles has , is there any way that i can run a function on my view ? Or a diffrent method ?\r\n\r\n\r\n    <?php foreach( $articles as $id => $article ): ?>\r\n    <div class="day"><?=(new DateTime($article->date))->format("d")?></div>\r\n    <a class="comments pull-right" href="#"> 0 Comments </a>\r\n    <?php endforeach; ?>'),
(69, 61, 59, 1437929152, 'So in my project i need to count how many comments each articles has , is there any way that i can run a function on my view ? Or a diffrent method ?\r\n\r\n```\r\n    <?php foreach( $articles as $id => $article ): ?>\r\n    <div class="day"><?=(new DateTime($article->date))->format("d")?></div>\r\n    <a class="comments pull-right" href="#"> 0 Comments </a>\r\n    <?php endforeach; ?>\r\n```'),
(70, 71, 59, 1438149527, 'The following instructions will automatically download and provision a virtual machine for you to begin hacking\r\non Phanbook with:\r\n\r\n### Getting Started\r\n\r\n1. Install Git: http://git-scm.com/downloads (or [GitHub for Windows](http://windows.github.com/) if you want a GUI). Recommend use github for Windows\r\n2. Install VirtualBox: https://www.virtualbox.org/wiki/Downloads\r\n3. Install Vagrant: http://www.vagrantup.com/ (We require Vagrant 1.7.2 or later)\r\n4. Open a terminal\r\n5. Clone the project: `git clone https://github.com/Phanbook/phanbook.git`\r\n6. Enter the project directory: `cd Phanbook` (Recommendation Create your workspace directory and clone project there. C:/workspace/phanbook/)\r\n\r\n### Using Vagrant\r\n\r\nWhen you''re ready to start working, boot the VM:\r\n\r\n```\r\nchmod +x phanbook.sh && ./phanbook.sh up\r\n```\r\nOr you can runninng via command below\r\n\r\n```\r\ncd opsfiles && vagrant up\r\n```\r\n\r\nVagrant will prompt you for your admin password. This is so it can mount your local files inside the VM for an easy workflow.\r\n\r\n(The first time you do this, it will take a while as it downloads the VM image and installs it. Go grab a coffee.)\r\n\r\n**Note to Linux users**: Your Phanbook directory cannot be on an ecryptfs mount or you will receive an error: `exportfs: /home/your/path/to/Phanbook does not support NFS export`\r\n\r\n**Note to OSX/Linux users**: Vagrant will mount your local files via an NFS share. Therefore, make sure that NFS is installed or else you''ll receive the error message:\r\n\r\n```\r\nMounting NFS shared folders failed. This is most often caused by the NFS\r\nclient software not being installed on the guest machine. Please verify\r\nthat the NFS client software is properly installed, and consult any resources\r\nspecific to the linux distro you''re using for more information on how to\r\ndo this.\r\n```\r\n\r\nFor example, on Ubuntu, you can install NFS support by installing nfs-kernel-server with `apt-get install`.\r\n\r\nOnce the machine has booted up, you can shell into it by typing:\r\n\r\n```\r\n./phanbook.sh ssh\r\n```\r\nOr\r\n\r\n```\r\ncd opsfiles && vagrant ssh\r\n```\r\n\r\nThe Phanbook code is found in the /usr/share/nginx/html/www directory in the image.\r\n\r\n**Note to Windows users**: You cannot run ```vagrant ssh``` from a cmd prompt; you''ll receive the error message:\r\n\r\n```\r\n`vagrant ssh` isn''t available on the Windows platform. You are still able\r\nto SSH into the virtual machine if you get a Windows SSH client (such as\r\nPuTTY). The authentication information is shown below:\r\n\r\nHost: 192.168.33.33\r\nPort: 2222\r\nUsername: vagrant\r\nPrivate key: C:/Users/Your Name/.vagrant.d/insecure_private_key\r\n```\r\n\r\nAt this point, you will want to get an SSH client, and use it to connect to your Vagrant VM instead. We recommend\r\nPuTTY:\r\n\r\n**[PuTTY Download Link](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)**\r\n\r\nYou may use this client to connect to the VM by using ```vagrant/vagrant``` as your username/password, or by [using\r\nPuTTYGen to import the insecure_private_key file](http://jason.sharonandjason.com/key_based_putty_logins_mini_how_to.htm)\r\n(mentioned above) into a PuTTY profile to quickly access your VM.\r\n\r\n### Let''s contribution for phanbook.\r\n1. checkout your new branch (feature/your-name-branch)\r\n\r\n```\r\n$ ## creating new branch\r\n$ git checkout -b feature/{your-new-branch-name}\r\n```\r\n2. commit your files and let''s push\r\n\r\n```\r\ngit push origin feature/{your-new-branch-name}\r\n```\r\n\r\n### Shutting down the VM\r\n\r\nWhen you''re done working on Phanbook, you can shut down Vagrant with:\r\n\r\n```\r\ncd opsfiles && vagrant halt\r\n```\r\n\r\nor you can running \r\n\r\n```\r\n./phanbook.sh halt\r\n```\r\n'),
(71, 71, 59, 1438149551, 'The following instructions will automatically download and provision a virtual machine for you to begin hacking\r\non Phanbook with:\r\n\r\n### Getting Started\r\n\r\n1. Install Git: http://git-scm.com/downloads (or [GitHub for Windows](http://windows.github.com/) if you want a GUI). Recommend use github for Windows\r\n2. Install VirtualBox: https://www.virtualbox.org/wiki/Downloads\r\n3. Install Vagrant: http://www.vagrantup.com/ (We require Vagrant 1.7.2 or later)\r\n4. Open a terminal\r\n5. Clone the project: `git clone https://github.com/Phanbook/phanbook.git`\r\n6. Enter the project directory: `cd Phanbook` (Recommendation Create your workspace directory and clone project there. C:/workspace/phanbook/)\r\n\r\n### Using Vagrant\r\n\r\nWhen you''re ready to start working, boot the VM:\r\n\r\n    chmod +x phanbook.sh && ./phanbook.sh up\r\n\r\nOr you can runninng via command below\r\n\r\n```\r\ncd opsfiles && vagrant up\r\n```\r\n\r\nVagrant will prompt you for your admin password. This is so it can mount your local files inside the VM for an easy workflow.\r\n\r\n(The first time you do this, it will take a while as it downloads the VM image and installs it. Go grab a coffee.)\r\n\r\n**Note to Linux users**: Your Phanbook directory cannot be on an ecryptfs mount or you will receive an error: `exportfs: /home/your/path/to/Phanbook does not support NFS export`\r\n\r\n**Note to OSX/Linux users**: Vagrant will mount your local files via an NFS share. Therefore, make sure that NFS is installed or else you''ll receive the error message:\r\n\r\n```\r\nMounting NFS shared folders failed. This is most often caused by the NFS\r\nclient software not being installed on the guest machine. Please verify\r\nthat the NFS client software is properly installed, and consult any resources\r\nspecific to the linux distro you''re using for more information on how to\r\ndo this.\r\n```\r\n\r\nFor example, on Ubuntu, you can install NFS support by installing nfs-kernel-server with `apt-get install`.\r\n\r\nOnce the machine has booted up, you can shell into it by typing:\r\n\r\n```\r\n./phanbook.sh ssh\r\n```\r\nOr\r\n\r\n```\r\ncd opsfiles && vagrant ssh\r\n```\r\n\r\nThe Phanbook code is found in the /usr/share/nginx/html/www directory in the image.\r\n\r\n**Note to Windows users**: You cannot run ```vagrant ssh``` from a cmd prompt; you''ll receive the error message:\r\n\r\n```\r\n`vagrant ssh` isn''t available on the Windows platform. You are still able\r\nto SSH into the virtual machine if you get a Windows SSH client (such as\r\nPuTTY). The authentication information is shown below:\r\n\r\nHost: 192.168.33.33\r\nPort: 2222\r\nUsername: vagrant\r\nPrivate key: C:/Users/Your Name/.vagrant.d/insecure_private_key\r\n```\r\n\r\nAt this point, you will want to get an SSH client, and use it to connect to your Vagrant VM instead. We recommend\r\nPuTTY:\r\n\r\n**[PuTTY Download Link](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)**\r\n\r\nYou may use this client to connect to the VM by using ```vagrant/vagrant``` as your username/password, or by [using\r\nPuTTYGen to import the insecure_private_key file](http://jason.sharonandjason.com/key_based_putty_logins_mini_how_to.htm)\r\n(mentioned above) into a PuTTY profile to quickly access your VM.\r\n\r\n### Let''s contribution for phanbook.\r\n1. checkout your new branch (feature/your-name-branch)\r\n\r\n```\r\n$ ## creating new branch\r\n$ git checkout -b feature/{your-new-branch-name}\r\n```\r\n2. commit your files and let''s push\r\n\r\n```\r\ngit push origin feature/{your-new-branch-name}\r\n```\r\n\r\n### Shutting down the VM\r\n\r\nWhen you''re done working on Phanbook, you can shut down Vagrant with:\r\n\r\n```\r\ncd opsfiles && vagrant halt\r\n```\r\n\r\nor you can running \r\n\r\n```\r\n./phanbook.sh halt\r\n```\r\n'),
(72, 66, 59, 1438149888, 'Hey Community,\r\n\r\nSince 3 years we have been working on Phalcon trying to improve it and move forward with the resources we have. Most of the work has been done in our spare time and with the great help of the community.\r\n\r\nIn the last year, due to our jobs and other responsibilities, progress in Phalcon has been a little bit slower, we would like this to change next year.\r\n\r\nWe are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n\r\nFollowing is the summary of the campaign:\r\n\r\nWe are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.\r\n\r\nHow will we use this money?\r\n\r\n\r\nPhalcon/Zephir goals\r\n\r\nAllow us to pay 1-2 fully-dedicated core developers for a year\r\nDevelop the most popular requests from the community on Github in a short and realistic time frame\r\nProvide high-quality answers and support in forums and StackOverflow\r\nRelease new versions constantly\r\nProvide a LTS (Long Term Support) version focused on the enterprise\r\nPhalcon specific goals\r\n\r\nImprove documentation covering a larger number of subjects in depth\r\nCreate more tutorials and examples focused on a novice, intermediate and advanced audience\r\nExtend test-suite achieving greater coverage and increasing framework quality\r\nZephir specific goals\r\n\r\nFinish the implementation of a JIT compiler for Zephir to facilitate testing and debugging of software created in this language\r\nCreate a debugger that facilitates the development of extensions in this language\r\nIncrease the number of backends that currently Zephir supports\r\nSupport future versions of PHP and maintain backwards compatibility with already released PHP versions\r\nExtend and improve the test-suite to verify what has been built also works.\r\nYou can donate here: https://pledgie.com/campaigns/27405\r\n\r\nIf you have any questions, feel free to ask.\r\n\r\nThanks!\r\n\r\n```\r\nvagrant && vagrant up\r\n```'),
(73, 66, 59, 1438150286, 'Hey Community,\r\n# Header {.sth}\r\nSince 3 years we have been working on Phalcon trying to improve it and move forward with the resources we have. Most of the work has been done in our spare time and with the great help of the community.\r\n\r\nIn the last year, due to our jobs and other responsibilities, progress in Phalcon has been a little bit slower, we would like this to change next year.\r\n\r\nWe are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n\r\nFollowing is the summary of the campaign:\r\n\r\nWe are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.\r\n\r\nHow will we use this money?\r\n\r\n\r\nPhalcon/Zephir goals\r\n\r\nAllow us to pay 1-2 fully-dedicated core developers for a year\r\nDevelop the most popular requests from the community on Github in a short and realistic time frame\r\nProvide high-quality answers and support in forums and StackOverflow\r\nRelease new versions constantly\r\nProvide a LTS (Long Term Support) version focused on the enterprise\r\nPhalcon specific goals\r\n\r\nImprove documentation covering a larger number of subjects in depth\r\nCreate more tutorials and examples focused on a novice, intermediate and advanced audience\r\nExtend test-suite achieving greater coverage and increasing framework quality\r\nZephir specific goals\r\n\r\nFinish the implementation of a JIT compiler for Zephir to facilitate testing and debugging of software created in this language\r\nCreate a debugger that facilitates the development of extensions in this language\r\nIncrease the number of backends that currently Zephir supports\r\nSupport future versions of PHP and maintain backwards compatibility with already released PHP versions\r\nExtend and improve the test-suite to verify what has been built also works.\r\nYou can donate here: https://pledgie.com/campaigns/27405\r\n\r\nIf you have any questions, feel free to ask.\r\n\r\nThanks!\r\n\r\n```\r\nvagrant && vagrant up\r\n```'),
(74, 66, 59, 1438150345, 'Hey Community,\r\n# Header {.sth}\r\nSince 3 years we have been working on Phalcon trying to improve it and move forward with the resources we have. Most of the work has been done in our spare time and with the great help of the community.\r\n\r\nIn the last year, due to our jobs and other responsibilities, progress in Phalcon has been a little bit slower, we would like this to change next year.\r\n\r\nWe are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n\r\nFollowing is the summary of the campaign:\r\n\r\nWe are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.\r\n\r\nHow will we use this money?\r\n\r\n\r\nPhalcon/Zephir goals\r\n\r\nAllow us to pay 1-2 fully-dedicated core developers for a year\r\nDevelop the most popular requests from the community on Github in a short and realistic time frame\r\nProvide high-quality answers and support in forums and StackOverflow\r\nRelease new versions constantly\r\nProvide a LTS (Long Term Support) version focused on the enterprise\r\nPhalcon specific goals\r\n\r\nImprove documentation covering a larger number of subjects in depth\r\nCreate more tutorials and examples focused on a novice, intermediate and advanced audience\r\nExtend test-suite achieving greater coverage and increasing framework quality\r\nZephir specific goals\r\n\r\nFinish the implementation of a JIT compiler for Zephir to facilitate testing and debugging of software created in this language\r\nCreate a debugger that facilitates the development of extensions in this language\r\nIncrease the number of backends that currently Zephir supports\r\nSupport future versions of PHP and maintain backwards compatibility with already released PHP versions\r\nExtend and improve the test-suite to verify what has been built also works.\r\nYou can donate here: https://pledgie.com/campaigns/27405\r\n\r\nIf you have any questions, feel free to ask.\r\n\r\nThanks!\r\n\r\n```\r\nvagrant && vagrant up\r\n```\r\n\r\n    <?php\r\n      echo "Aaaa"\r\n    ?>'),
(75, 52, 59, 1438227076, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(76, 52, 59, 1438227134, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(77, 52, 59, 1438228316, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(78, 52, 59, 1438228657, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(79, 77, 59, 1438228671, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to the respective database engine operations.'),
(80, 52, 78, 1438325252, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(81, 52, 78, 1438325267, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(82, 52, 78, 1438325325, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(83, 52, 78, 1438325410, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(84, 52, 78, 1438325452, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(85, 77, 78, 1438325863, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to the respective database engine operations.');
INSERT INTO `postsHistory` (`id`, `postsId`, `usersId`, `createdAt`, `content`) VALUES
(86, 52, 78, 1438325994, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(87, 77, 78, 1438326029, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to the respective database engine operations.'),
(88, 77, 78, 1438326052, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to the respective database engine operations.'),
(89, 52, 78, 1438326077, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(90, 52, 78, 1438326114, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(91, 76, 78, 1438326301, 'Phalconjobs  provides cutting-edge content for web professionals — developers, designers, programmers, freelancers and site owners.\r\n\r\nFounded by Thien; our mission is to deliver new ideas, emerging concepts, and teach state-of-the-art technology to our readers. Whether it’s via our practical tutorials, books, articles, courses, if it’s got anything to do with building the web - we''ve got you covered.'),
(92, 76, 78, 1438326326, 'Phalconjobs  provides cutting-edge content for web professionals — developers, designers, programmers, freelancers and site owners.\r\n\r\nFounded by Thien; our mission is to deliver new ideas, emerging concepts, and teach state-of-the-art technology to our readers. Whether it’s via our practical tutorials, books, articles, courses, if it’s got anything to do with building the web - we''ve got you covered.'),
(93, 77, 78, 1438326596, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(94, 77, 78, 1438326668, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(95, 76, 78, 1438326779, 'Phalconjobs  provides cutting-edge content for web professionals — developers, designers, programmers, freelancers and site owners.\r\n\r\nFounded by Thien; our mission is to deliver new ideas, emerging concepts, and teach state-of-the-art technology to our readers. Whether it’s via our practical tutorials, books, articles, courses, if it’s got anything to do with building the web - we''ve got you covered.'),
(96, 77, 78, 1438326906, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(97, 77, 78, 1438326955, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(98, 77, 78, 1438326977, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(99, 77, 78, 1438327048, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(100, 76, 78, 1438327058, 'Phalconjobs  provides cutting-edge content for web professionals — developers, designers, programmers, freelancers and site owners.\r\n\r\nFounded by Thien; our mission is to deliver new ideas, emerging concepts, and teach state-of-the-art technology to our readers. Whether it’s via our practical tutorials, books, articles, courses, if it’s got anything to do with building the web - we''ve got you covered.'),
(101, 77, 78, 1438327130, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(102, 77, 78, 1438327213, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.\r\n\r\nPhalcon\\Mvc\\Model is the base for all models in a Phalcon application. It provides database independence, basic CRUD functionality, advanced finding capabilities, and the ability to relate models to one another, among other services. Phalcon\\Mvc\\Model avoids the need of having to use SQL statements because it translates methods dynamically to se engine operations.'),
(103, 80, 78, 1438327838, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(104, 80, 78, 1438327853, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(105, 80, 78, 1438329556, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(106, 80, 78, 1438329634, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(107, 80, 78, 1438329670, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(108, 52, 78, 1438329985, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(109, 52, 78, 1438329997, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(110, 52, 78, 1438330049, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(111, 52, 78, 1438330124, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(112, 52, 78, 1438330142, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(113, 52, 78, 1438330171, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(114, 52, 78, 1438330516, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(115, 52, 78, 1438330541, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(116, 52, 78, 1438330590, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(117, 52, 78, 1438330678, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(118, 52, 78, 1438330769, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(119, 52, 78, 1438330786, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(120, 52, 78, 1438330843, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(121, 52, 78, 1438330877, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(122, 52, 78, 1438330909, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(123, 52, 78, 1438330992, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(124, 52, 78, 1438331061, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(125, 52, 78, 1438331101, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(126, 52, 78, 1438331116, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(127, 52, 78, 1438331133, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(128, 52, 78, 1438331208, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(129, 52, 78, 1438331362, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(130, 80, 78, 1438331400, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(131, 80, 78, 1438331546, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(132, 80, 78, 1438331611, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(133, 80, 78, 1438331685, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(134, 80, 78, 1438331735, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(135, 80, 78, 1438331883, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(136, 80, 78, 1438331955, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(137, 80, 78, 1438332010, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(138, 80, 78, 1438332052, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(139, 80, 78, 1438332144, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(140, 52, 78, 1438332350, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(141, 52, 78, 1438332357, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(142, 52, 78, 1438332390, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(143, 52, 78, 1438332399, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(144, 52, 78, 1438332469, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(145, 52, 78, 1438332533, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(146, 52, 78, 1438332564, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(147, 52, 78, 1438332887, 'The first thing you''ll need to do is obtain the network traffic for the MS-CHAPv2 handshake you''d like to crack.\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\nNext you''ll use chapcrack in order to parse and extract the MS-CHAPv2 handshake from your packet capture or FreeRADIUS interception.'),
(148, 80, 78, 1438332904, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(149, 80, 78, 1438332931, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(150, 80, 78, 1438333118, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(151, 80, 78, 1438333148, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(152, 80, 78, 1438333160, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(153, 80, 78, 1438333194, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.'),
(154, 66, 59, 1438497497, 'Hey Community,\r\n# Header {.sth}\r\n\r\n# Header {.sth}\r\n\r\n\r\nSince 3 years we have been working on Phalcon trying to improve it and move forward with the resources we have. Most of the work has been done in our spare time and with the great help of the community.\r\n\r\nIn the last year, due to our jobs and other responsibilities, progress in Phalcon has been a little bit slower, we would like this to change next year.\r\n\r\nWe are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n\r\nFollowing is the summary of the campaign:\r\n\r\nWe are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.\r\n\r\nHow will we use this money?\r\n\r\n\r\nPhalcon/Zephir goals\r\n\r\nAllow us to pay 1-2 fully-dedicated core developers for a year\r\nDevelop the most popular requests from the community on Github in a short and realistic time frame\r\nProvide high-quality answers and support in forums and StackOverflow\r\nRelease new versions constantly\r\nProvide a LTS (Long Term Support) version focused on the enterprise\r\nPhalcon specific goals\r\n\r\nImprove documentation covering a larger number of subjects in depth\r\nCreate more tutorials and examples focused on a novice, intermediate and advanced audience\r\nExtend test-suite achieving greater coverage and increasing framework quality\r\nZephir specific goals\r\n\r\nFinish the implementation of a JIT compiler for Zephir to facilitate testing and debugging of software created in this language\r\nCreate a debugger that facilitates the development of extensions in this language\r\nIncrease the number of backends that currently Zephir supports\r\nSupport future versions of PHP and maintain backwards compatibility with already released PHP versions\r\nExtend and improve the test-suite to verify what has been built also works.\r\nYou can donate here: https://pledgie.com/campaigns/27405\r\n\r\nIf you have any questions, feel free to ask.\r\n\r\nThanks!\r\n\r\n```\r\nvagrant && vagrant up\r\n```\r\n\r\n    <?php\r\n      echo "Aaaa"\r\n    ?>');

-- --------------------------------------------------------

--
-- Table structure for table `postsNotifications`
--

CREATE TABLE IF NOT EXISTS `postsNotifications` (
  `id` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postsNotifications`
--

INSERT INTO `postsNotifications` (`id`, `usersId`, `postsId`) VALUES
(9, 59, 49),
(15, 59, 66),
(6, 59, 75),
(7, 59, 76),
(8, 59, 77),
(14, 59, 80),
(10, 78, 78),
(11, 78, 79),
(12, 78, 80),
(13, 78, 81);

-- --------------------------------------------------------

--
-- Table structure for table `postsReply`
--

CREATE TABLE IF NOT EXISTS `postsReply` (
  `id` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `content` text,
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL,
  `editedAt` int(11) unsigned DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `accepted` char(1) DEFAULT 'N'
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postsReply`
--

INSERT INTO `postsReply` (`id`, `postsId`, `usersId`, `content`, `createdAt`, `modifiedAt`, `editedAt`, `deleted`, `accepted`) VALUES
(1, 38, 3, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1427623976, 1434170963, 1427623976, 0, NULL),
(2, 4, 1, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1427624801, 1427624801, NULL, 0, NULL),
(4, 3, 2, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1427624845, 1427624845, NULL, 0, NULL),
(5, 38, 2, 'There are many technology topics we can cover. It''s important to target topics that interest you. If anything specific interests you please fill out short form below.', 1427905353, 1427905353, 1427905353, 0, NULL),
(6, 1, 2, 'Chrome runs on tablets, smartphones, and other devices. Make your content ready for the multi-device web!', 1428151856, 1437031773, NULL, 0, NULL),
(21, 38, 3, 'As usage surges, people discover that not only is the network a great way to communicate with family and friends, but all of the things that they used to do on the web, they can do faster and easier as part of this network.\r\n\r\nReading news? The network has ', 1428647214, 1437466516, NULL, 0, NULL),
(22, 42, 3, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.\r\n\r\nChanging coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.', 1429189135, NULL, NULL, 0, 'N'),
(23, 42, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.\r\n\r\nChanging coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.', 1429189158, NULL, NULL, 0, 'N'),
(24, 42, 3, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429190961, NULL, NULL, 0, 'N'),
(25, 38, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429196285, NULL, NULL, 0, 'N'),
(26, 42, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429200608, NULL, NULL, 0, 'N'),
(30, 42, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429201557, NULL, NULL, 0, 'N'),
(31, 42, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429201593, NULL, NULL, 0, 'N'),
(32, 42, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429201694, NULL, NULL, 0, 'N'),
(33, 42, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429201799, 1433216408, NULL, 0, 'N'),
(34, 42, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429202236, NULL, NULL, 0, 'N'),
(38, 38, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429202569, NULL, NULL, 0, 'N'),
(39, 3, 1, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429248150, 1434447268, NULL, 0, 'N'),
(40, 42, 3, 'The problem is the coordinate singularity in the Schwarzschild metric when it is expressed in ''Schwarzschild coordinates''. This is nice a coordinate system for trajectories outside a black hole, because they remind us of spherical coordinates. Unfortunately, they break at r=2M, the event horizon.', 1429251298, NULL, NULL, 0, 'N'),
(42, 3, 1, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1429344691, 1437406164, NULL, 0, 'N'),
(43, 27, 1, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1429345074, 1434447240, NULL, 0, 'N'),
(44, 27, 1, '$this->modifiedAt = time();', 1429345325, 1434447234, NULL, 0, 'N'),
(45, 26, 1, 'Top questions and answers\r\n    Important announcements\r\n    Unanswered questions', 1429345490, 1434447461, NULL, 0, 'N'),
(46, 38, 3, 'How to automatically change the space between the letters.I want the text to take up the', 1429500615, 1437466478, NULL, 0, 'N'),
(47, 42, 3, 'The problem is the coordinate singularity in the Schwarzschild metric when it i', 1429501206, NULL, NULL, 0, 'N'),
(48, 42, 3, 'The problem is the coordinate singularity in the Schwarzschild metric when it', 1429501274, 1429521023, NULL, 0, 'N'),
(49, 42, 3, 'The problem is the coordinate singularity in the Schwarzschild metric when it iThe problem is the coordinate singularity in the Schwarzschild metric when it i', 1429501439, NULL, NULL, 0, 'N'),
(50, 42, 1, 'Changing coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.', 1429502284, 1435214860, NULL, 0, 'N'),
(51, 42, 1, 'Changing coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.', 1429502338, 1431076605, NULL, 0, 'N'),
(52, 42, 1, 'Changing coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.', 1429502409, 1435214721, NULL, 0, 'N'),
(53, 42, 1, 'Changing coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.', 1429502485, 1434962560, NULL, 0, 'Y'),
(54, 29, 1, 'take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1429941132, 1434520747, NULL, 0, 'N'),
(55, 31, 3, 'To begin, install vagrant for your platform. https://www.vagrantup.com/downloads.html If you are on linux, odds are you can just use your package manager to install vagrant', 1430973010, NULL, NULL, 0, 'N'),
(56, 27, 45, 'How to automatically change the space between the letters.I want the text to take up the entire width of the div. Text is not static. (Always changing text, can be 123" or "text text"...)', 1431314599, 1435215277, NULL, 0, 'N'),
(57, 45, 45, 'Coud you upload code? I will help you\r\n\r\n    <?php\r\n## ok\r\n\r\n 1. List item\r\n\r\n----------\r\n\r\n\r\n ##', 1432975587, 1435215547, NULL, 0, 'Y'),
(58, 48, 45, 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues.', 1433216574, 1433216836, NULL, 0, 'Y'),
(59, 46, 45, 'This book is not directly about information architecture—although you will find information architecture principles alluded to throughout. This book is also not directly about visual design—although you will find that the backdrop of good visual design is assumed throughout. This book is about interaction design: specifically, interaction design on the Web. And even more specifically, about rich interaction design on the Web.', 1433530725, 1435220310, NULL, 0, 'N'),
(60, 48, 54, 'Social Questions is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Social Questions or suggest a new feature, please post it on Github issues.', 1433537618, 1433537618, NULL, 0, 'N'),
(61, 42, 45, 'Changing coordinates to Eddington-Finkelstein or Kruskal–Szekeres coordinates (or others) will eliminate the coordinate singularity at the horizon. Particles fall in just fine.', 1433538838, 1433538838, NULL, 0, 'N'),
(62, 50, 45, 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have to modify a few things. Just look for "specific to your application" comments in the code. https://gist.github.com/SneakyBobito/6909234', 1433772235, 1435892113, NULL, 0, 'N'),
(63, 51, 45, 'All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented: Weekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences. Badges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here. Notifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system Subscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.', 1433773568, 1433773576, NULL, 0, 'Y'),
(64, 52, 45, 'For PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.\r\n\r\n\r\nFor PPTP VPN connections, simply use a tool such as tcpdump or wireshark in order to obtain a network capture. For WPA2 Enterprise wireless handshakes, simply use a tool like FreeRADIUS-WPE in order to obtain ''challenge'' and ''response'' parameters.', 1433775309, 1437278483, NULL, 0, 'Y'),
(65, 45, 45, 'Weekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.', 1433775585, 1434446766, NULL, 0, 'N'),
(66, 50, 47, 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have to modify a few things. Just look for "specific to your application" comments in the code.', 1433775644, 1435215241, NULL, 0, 'N'),
(67, 1, 47, 'After (re)combination (I never understand why the "re" is used) and the formation of the CMB, the universe was transparent and the only light in it was from the rapidly cooling CMB. The baryonic universe was composed almost entirely of neutral hydrogen and helium.\r\n\r\nAfter perhaps 100 million years, the first galaxies and stars (assisted by dark matter) were able to form and then over the next few hundred millions of years most of the hydrogen was reionised by the radiation emitted by these objects. You can imagine bubbles of ionised gas forming around regions of intense star formation.\r\n\r\nThis process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1434254975, 1434446158, NULL, 0, 'N'),
(68, 1, 47, 'In summary I would say the significance of reionisation is twofold. First it offers an opportunity to probe and test our ideas about the formation of stars and galaxies in the otherwise very hard to observe early universe. Second, the end of the "dark ages", marks the point where baryonic matter takes a very active role in shaping the formation of stars and galaxies. The radiation from the first stars exerts a strong negative feedback the collapsing ionised gas around it and can drive galactic winds and outflows. Prior to this, dark matter was the dominant influence, but reionisation couples the radiation and baryonic matter together again on galaxy-sized scales.', 1434255124, 1434446230, NULL, 0, 'N'),
(69, 1, 47, 'This process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1434255174, 1434446147, NULL, 0, 'N'),
(73, 1, 57, 'This process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.\r\n\r\n\r\n\r\n    owned: function(){\r\n        this.url = this.options.url.owned;\r\n        this.parse = function(users){\r\n            return users.map(function(user){\r\n                return user;\r\n            });\r\n        };\r\n        this.fetch({\r\n            data: {\r\n                screen_name : login\r\n            }\r\n        });\r\n    }', 1434272512, 1435214674, NULL, 0, 'N'),
(74, 1, 58, 'After (re)combination (I never understand why the "re" is used) and the formation of the CMB, the universe was transparent and the only light in it was from the rapidly cooling CMB. The baryonic universe was composed almost entirely of neutral hydrogen and helium.', 1434421912, 1434446143, NULL, 0, 'N'),
(75, 52, 59, 'The site says it''s focus is on Ruby and I couldn''t find any php engines. Is this related to php at all?\r\n\r\nThe site says it''s focus is on Ruby and I couldn''t find any php engines. Is this related to php at all?', 1434807774, 1437278379, NULL, 0, 'N'),
(76, 51, 59, 'Now you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.', 1434808278, 1434808278, NULL, 0, 'N'),
(77, 44, 47, 'There are a lot of decisions to make when creating new tables and data warehouses. Some that seem inconsequential at the time end up causing you and your users pain for the life of the database.\r\n\r\nWe''ve worked with thousands of people and their databases and, after countless hours of reading and writing queries, we''ve seen almost everything. Here are our top 10 rules for creating pain-free schemas.', 1434967132, 1434967132, NULL, 0, 'N'),
(78, 57, 47, 'ation and then relay the messages through SendGrid as a smart host. This has the least latency from your application’s perspective with the added benefit of handing your email off to a fault tolerant server. If internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resendi', 1435368613, 1437466653, NULL, 0, 'N'),
(79, 59, 59, 'Today, in celebration of the 10th anniversary of Firefox, we are launchingMozVR.com to help foster the emerging virtual reality Web. “A VR website about VR websites”, MozVR is where we will share experimental VR Web experiences, provide resources, and showcase work from developers in the growing VR web community', 1435369728, 1435369837, NULL, 0, 'N'),
(80, 59, 59, 'Ooday, in celebration of the 10th anniversary of Firefox, we are launchingMozVR.com to help foster the emerging virtual reality Web. “A VR website about VR websites', 1435369824, 1435369824, NULL, 0, 'N'),
(81, 58, 59, 'Which way of instruction ordering should I prefer, A or B?\r\n\r\nMore specifically:', 1435370443, 1436189873, NULL, 0, 'Y'),
(82, 53, 59, 'nnecessary calculations. But the query cache is limited in size, and some data sets change more often than others. Using the cache on all of our data', 1435470999, 1435470999, NULL, 0, 'N'),
(83, 55, 47, 'oughly, the number of upvotes on their stories and comments, minus the number of downvotes. The numbers won''t exactly match up, because some votes aren''t counted to prevent various types of abuse.', 1435471109, 1435471109, NULL, 0, 'N'),
(84, 59, 47, 'Ooday, in celebration of the 10th anniversary of Firefox, we are launchingMozVR.com to help foster the emerging virtual reality Web. “A VR website about VR websites', 1435471239, 1435471239, NULL, 0, 'N'),
(85, 61, 59, 'In this particular post, we intend to offer a solution to install multiple versions of Phalcon, PHP and run them on a single web server. The PHP 5.5.x and 5.6.x will be used in here, but you can replace it with other versions. Any servers that support PHP-FPM should be enough but we recommend using the Nginx for the web server. The environment using in this tutorial is Fedora OS - a Linux system.\r\n\r\nPreliminary Note', 1435889352, 1435889916, NULL, 0, 'Y'),
(86, 62, 77, 'You can try override readAttribute($attribute) function in your model\r\n\r\nFor example:\r\n\r\n    public function readAttribute($attribute)\r\n    {\r\n        if(!isset($this->{$attribute})) {\r\n            return false; // or throw new \\Exception("lore ipsum");\r\n        }\r\n        return parent::readAttribute($attribute);\r\n    }', 1435890031, 1435890987, NULL, 0, 'Y'),
(87, 63, 59, 'You can use the Query Builder paginator to solve that problem: https://docs.phalconphp.com/en/latest/reference/pagination.html#data-adapters', 1435891088, 1435891096, NULL, 0, 'Y'),
(88, 64, 77, 'I think there is one very important matter of the conference and this matter is not pointed in the survey.\r\n\r\nThis matter is location, I mean here the continent where the conference is going to take place. The question about a fee is in euro, so is the conference is going to take place in Europe?\r\n\r\nThen, the issue is what country and city.', 1435892254, 1435892545, NULL, 0, 'N'),
(89, 64, 77, 'Models allow you to implement events that will be thrown when performing an insert/update/delete. They help define business rules for a certain model. The following are the events supported by Phalcon\\Mvc\\Model and their order of execution:', 1435892555, 1435892562, NULL, 0, 'N'),
(90, 58, 78, 'Is it possible to distribute 3 mulps to 3 SSE multiplication units (1), and at the same time (2) to distribute addps to their respective SSE addition units, resulting in total 6 instructions per schedule cycle?', 1436191229, 1436191229, NULL, 0, 'N'),
(91, 57, 78, 'If internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resendi', 1436280624, 1436280624, NULL, 0, 'N'),
(92, 57, 78, 'If internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resending the email, as opposed to building that inte', 1436280892, 1436280892, NULL, 0, 'N'),
(93, 57, 78, 'urs drops, a local mail server gracefully handles queuing and resending the email, as opposed to building that intelligence into your sending application.', 1436281110, 1436281110, NULL, 0, 'N'),
(94, 57, 78, 'ation and then relay the messages through SendGrid as a smart host. This has the least latency from your application’s perspective with the added benefit of handing your email off to a fault tolerant server. If internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resendi', 1436281264, 1436281264, NULL, 0, 'N'),
(95, 57, 78, 'internet connectivity between your servers and ours drops, a local mail server gracefully handles queuing and resending the email, as opposed to building that intelligence i', 1436281661, 1436281661, NULL, 0, 'N'),
(96, 58, 59, 'It''s known also, that each SSE unit consists of 2 modules: one for addition (substraction), and one for multiplication (division). The latter allows to run mullps-addps instruction sequences parallelly (2), for example:', 1436283395, 1436283395, NULL, 0, 'N'),
(97, 58, 78, 'It''s known also, that each SSE unit consists of 2 modules: one for addition (substraction), and one for multiplication (division). The latter allows to run mullps-addps instruction sequences parallelly (2), for example:', 1436283415, 1436283415, NULL, 0, 'N'),
(98, 58, 78, 'Which way of instruction ordering should I prefer, A or B?', 1436284171, 1436284171, NULL, 0, 'N'),
(99, 58, 78, 'Which way of instruction ordering should I prefer, A or B?', 1436284375, 1436284375, NULL, 0, 'N'),
(100, 58, 78, 'Which way of instruction ordering should I prefer, A or B?', 1436284422, 1436284422, NULL, 0, 'N'),
(101, 58, 78, 'Which way of instruction ordering should I prefer, A or B?', 1436284435, 1436284435, NULL, 0, 'N'),
(102, 58, 78, 'Which way of instruction ordering should I prefer, A or B?', 1436284468, 1436284468, NULL, 0, 'N'),
(103, 58, 78, 'It''s known also, that each SSE unit consists of 2 modules: one for addition (substraction), and one for multiplication (division). The latter allows to run mullps-addps instruction sequences parallelly (2), for example:', 1436284556, 1436284556, NULL, 0, 'N'),
(104, 58, 78, 'Which way of instruction ordering should I prefer, A or B?', 1436284608, 1436284608, NULL, 0, 'N'),
(105, 62, 78, 'Just to mention it: both method_exists() and is_callable() return true for inherited methods:', 1436284987, 1436284987, NULL, 0, 'N'),
(106, 66, 59, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n\r\n', 1436285750, 1437880075, 1437880075, 0, 'Y'),
(107, 66, 59, 'We are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n', 1436287074, 1437968977, 1437968977, 0, 'N'),
(108, 66, 59, 'We are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.', 1436287303, 1437882165, 1437882165, 0, 'N'),
(109, 65, 59, 'If there''s something not mentioned in the survey, respond to this thread with whatever you want to share. As long as it''s relevant to the survey and or conference.', 1436681211, 1436681211, NULL, 0, 'N'),
(110, 64, 59, 'If there''s something not mentioned in the survey, respond to this thread with whatever you want to share. As long as it''s relevant to the survey and or conference.', 1436681228, 1436681228, NULL, 0, 'N'),
(111, 65, 59, 'A couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers.', 1436695254, 1436695254, NULL, 0, 'N'),
(112, 67, 78, 'In summary I would say the significance of reionisation is twofold. First it offers an opportunity to probe and test our ideas about the formation of stars and galaxies in the otherwise very hard to observe early universe. Second, the end of the "dark ages", marks the point where baryonic matter takes a very active role in shaping the formation of stars and galaxies. The radiation from the first stars exerts a strong negative feedback the collapsing ionised gas around it and can\r\n\r\n\r\nIn summary I would say the significance of reionisation is twofold. First it offers an opportunity to probe and test our ideas about the formation of stars and galaxies in the otherwise very hard to observe early universe. Second, the end of the "dark ages", marks the point where baryonic matter takes a very active role in shaping the formation of stars and galaxies. The radiation from the first stars exerts a strong negative feedback the collapsing ionised gas around it and can', 1436771476, 1436771476, NULL, 0, 'N'),
(113, 70, 59, 'Phalcon, throught the last years, has grown to a full grown up framework that clashes any other big player in the market. With many advantages, the biggest still being performance for me, Phalcon slowly put the distrust of "that C framework" in the past to become a tool that seduce more and more PHP devs.', 1437280702, 1437280702, NULL, 0, 'N'),
(114, 66, 78, 'I take myself as an example, the last few months have been very very busy (see my github contributions are minimal to none). Before that I did have time to work on the project. It is the way it goes I''m aftraid with open source projects', 1437847563, 1437847563, NULL, 0, 'N'),
(119, 71, 78, 'his process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1438181036, NULL, NULL, 0, 'N'),
(120, 71, 78, 'his process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1438181079, NULL, NULL, 0, 'N'),
(121, 71, 78, 'his process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1438181096, NULL, NULL, 0, 'N'),
(122, 71, 78, 'his process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1438181141, NULL, NULL, 0, 'N'),
(123, 71, 78, 'his process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1438181272, NULL, NULL, 0, 'N'),
(124, 71, 78, 'his process is not entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first stars (thought to be much more massive, hot and luminous than stars today) in relatively small dwarf galaxies, but it is not possible to see these directly. Conversely, high redshifts qusars may have played some role, either in direct reionisation or more likely in regulation star formation.', 1438181322, NULL, NULL, 0, 'N'),
(125, 71, 78, 'ot entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s', 1438181455, 1438222604, NULL, 1438222604, 'N'),
(126, 71, 78, 'ot entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s', 1438181529, NULL, NULL, 0, 'N'),
(127, 71, 78, 'ot entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s', 1438181553, NULL, NULL, 0, 'N'),
(128, 71, 78, 'ot entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s', 1438181951, NULL, NULL, 0, 'N'),
(129, 71, 78, 'Entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the firs\r\n\r\njects were primarily responsible. The thing is that it was probably the firs', 1438181978, 1438223329, NULL, 0, 'N'),
(130, 71, 78, 'ot entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s', 1438182044, 1438222597, NULL, 1438222596, 'N'),
(131, 71, 78, 'ot entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s', 1438182059, 1438222567, NULL, 1438222567, 'N'),
(132, 71, 78, 'The following instructions will automatically download and provision a virtual machine for you to begin hacking on Phanbook with:', 1438182159, 1438222428, NULL, 1438222428, 'N'),
(133, 68, 78, 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438182505, NULL, NULL, 0, 'N'),
(134, 68, 78, 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438182533, NULL, NULL, 0, 'N'),
(135, 68, 78, 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438182549, NULL, NULL, 0, 'N'),
(136, 68, 78, 'Taking the example from our friends at AngularJS we have cloned their repository and we have Phalcon-ized it. Special thanks to the AngularJS team as well as Ole Aass who is leading the project.', 1438182607, NULL, NULL, 0, 'N'),
(137, 68, 78, 'king the example from our friends at AngularJS we have cloned their repository and we have Phalcon-ized it. Special thanks to the AngularJS team as well as Ole Aass who is leading the project.', 1438182668, NULL, NULL, 0, 'N'),
(138, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438183460, NULL, NULL, 0, 'N'),
(139, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438183551, NULL, NULL, 0, 'N'),
(140, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438183626, NULL, NULL, 0, 'N'),
(141, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438183741, NULL, NULL, 0, 'N'),
(142, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438183793, NULL, NULL, 0, 'N'),
(143, 68, 78, 'hing a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects o', 1438183851, NULL, NULL, 0, 'N'),
(144, 68, 78, 'hing a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects o', 1438183924, NULL, NULL, 0, 'N'),
(145, 68, 78, 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438184385, NULL, NULL, 0, 'N'),
(146, 68, 78, 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438184415, 1438234898, NULL, 1438234898, 'N'),
(147, 68, 78, 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438184443, NULL, NULL, 0, 'N'),
(148, 68, 78, 'Today we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438184483, NULL, NULL, 0, 'N'),
(149, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438184755, NULL, NULL, 0, 'N'),
(150, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438184759, NULL, NULL, 0, 'N'),
(151, 68, 78, 'y we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or', 1438184783, 1438234910, NULL, 1438234910, 'N'),
(152, 68, 78, 'hing a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects o', 1438185511, NULL, NULL, 0, 'N'),
(153, 68, 78, 'hing a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects o', 1438185514, 1438234916, NULL, 1438234916, 'N'),
(154, 70, 78, 'lcon, throught the last years, has grown to a full grown up framework that clashes any other big player in the market. With many advantages, the biggest still being performance for me, Phalcon slowly put the distrust of "that C framework" in the past to become a tool that seduce more and more PHP devs.', 1438185859, NULL, NULL, 0, 'N'),
(155, 70, 78, 'lcon, throught the last years, has grown to a full grown up framework that clashes any other big player in the market. With many advantages, the biggest still being performance for me, Phalcon slowly put the distrust of "that C framework" in the past to become a tool that seduce more and more PHP devs.', 1438185891, NULL, NULL, 0, 'N'),
(156, 70, 78, 'Amework. So, with a bigger community, and jobs related to Phalcon starting to appear, here goes my questions.', 1438186051, 1438223227, NULL, 0, 'N'),
(157, 71, 59, 'ot entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s', 1438223343, NULL, NULL, 0, 'N'),
(158, 68, 59, 'http://www.sitepoint.com/welcoming-new-authors-20132014/ \r\n\r\nToday we are launching a new site that would help us spread the word about Phalcon and show where Phalcon is used, whether this is production applications, hobby projects or tutorials.', 1438224055, NULL, NULL, 0, 'N'),
(159, 76, 59, 'Founded by Thien; our mission is to deliver new ideas, emerging concepts, and teach state-of-the-art technology to our readers. Whether it’s via our practical tutorials, books, articles, courses, if it’s got anything to do with building the web - we''ve got you covered.', 1438265705, 1438266744, NULL, 0, 'N'),
(160, 77, 59, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.', 1438316965, 1438316972, NULL, 0, 'N'),
(161, 77, 59, 'A model represents the information (data) of the application and the rules to manipulate that data. Models are primarily used for managing the rules of interaction with a corresponding database table. In most cases, each table in your database will correspond to one model in your application. The bulk of your application’s business logic will be concentrated in the models.', 1438317345, 1438317347, NULL, 0, 'N'),
(162, 49, 59, 'A couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers', 1438317457, 1438317964, NULL, 0, 'N'),
(163, 49, 59, 'A couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers', 1438317570, 1438318067, NULL, 0, 'N'),
(164, 49, 59, 'A couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers', 1438317704, 1438317706, NULL, 0, 'N'),
(165, 49, 59, 'If there''s something not mentioned in the survey, respond to this thread with whatever you want to share. As long as it''s relevant to the survey and or conference.', 1438317870, 1438317871, NULL, 0, 'N'),
(166, 49, 59, 'SendSpool \r\n\r\nA couple of us are looking into the options of having a Phalcon Conference in 2015. We''d like to get some input from you guys as well, see how you feel about it and what we can expect in rough numbers', 1438318088, 1438318096, NULL, 0, 'N'),
(167, 49, 59, 'If there''s something not mentioned in the survey, respond to this thread with whatever you want to share. As long as it''s relevant to the survey and or conference.', 1438318136, 1438318137, NULL, 0, 'N'),
(168, 80, 59, 'Phanbook is an open source project and a volunteer effort. Help us make this a great place for discussion and collaboration. Please spend some time browsing the topics here before replying or starting your own, and you''ll have a better chance of meeting others who share your interests or have had similar problems. If you want to report any bug related to Phanbook or suggest a new feature, please post it on Github issues.', 1438334858, NULL, NULL, 0, 'N'),
(169, 66, 59, '@duythien\r\nNo this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.', 1438497292, 1438500843, NULL, 0, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `postsReplyHistory`
--

CREATE TABLE IF NOT EXISTS `postsReplyHistory` (
  `id` int(10) unsigned NOT NULL,
  `postsReplyId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `createdAt` int(11) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `postsReplyHistory`
--

INSERT INTO `postsReplyHistory` (`id`, `postsReplyId`, `usersId`, `createdAt`, `content`) VALUES
(1, 1, 2, 1427623976, 'test post reply history'),
(2, 5, 3, 1427623976, 'test post reply history'),
(3, 106, 59, 1437876926, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n'),
(4, 106, 78, 1437876983, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n\r\nNo this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n'),
(5, 106, 59, 1437877705, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n\r\nNo this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n'),
(6, 106, 59, 1437877727, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n\r\n'),
(7, 106, 59, 1437877921, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n\r\n'),
(8, 107, 78, 1437879527, 'We are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n'),
(9, 106, 78, 1437879581, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n\r\n'),
(10, 106, 78, 1437880075, 'No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.\r\n\r\n\r\n'),
(11, 108, 59, 1437882165, 'We are asking for 30,000 USD (~2,500 USD/month) that will be employed during the following year, at this ti some donations were already made, thanks to the donors for their assistance and support!. If you want to help, please support this project by donating to it. Donations of any size are gratefully accepted. We hope to soon reach 35% (10,500.00 USD) of the goal to create a non-profit organization and hire developers.'),
(12, 107, 59, 1437968977, 'We are launching a campaign in Pledgie to promote the development of the framework and its sub-projects in order to bring Phalcon where we all want.\r\n'),
(13, 129, 59, 1438223174, 'Entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the first s'),
(14, 129, 59, 1438223194, 'Entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the firs'),
(15, 129, 59, 1438223204, 'Entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the firs'),
(16, 156, 59, 1438223227, 'Amework. So, with a bigger community, and jobs related to Phalcon starting to appear, here goes my questions.'),
(17, 129, 59, 1438223329, 'Entirely understood in terms of when it happened, how quickly it happened and what objects were primarily responsible. The thing is that it was probably the firs\r\n\r\njects were primarily responsible. The thing is that it was probably the firs'),
(18, 169, 59, 1438500321, '@duythien No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.'),
(19, 169, 59, 1438500616, '@duythien \r\n\r\nNo this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.'),
(20, 169, 59, 1438500730, '@duythien No this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.'),
(21, 169, 59, 1438500843, '@duythien\r\nNo this is not an all or nothing campaign. If we reach the goal set in Pledgie, that means that two developers will be solely working on Phalcon and thus the development will be much faster.');

-- --------------------------------------------------------

--
-- Table structure for table `postsSubscribers`
--

CREATE TABLE IF NOT EXISTS `postsSubscribers` (
  `id` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `createdAt` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `postsSubscribers`
--

INSERT INTO `postsSubscribers` (`id`, `postsId`, `usersId`, `createdAt`) VALUES
(52, 68, 59, 1438182598),
(55, 61, 59, 1438434834);

-- --------------------------------------------------------

--
-- Table structure for table `postsTags`
--

CREATE TABLE IF NOT EXISTS `postsTags` (
  `id` int(11) NOT NULL,
  `postsId` int(11) NOT NULL,
  `tagsId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postsTags`
--

INSERT INTO `postsTags` (`id`, `postsId`, `tagsId`) VALUES
(32, 28, 3),
(33, 28, 5),
(34, 30, 1),
(35, 36, 3),
(36, 27, 6),
(37, 27, 1),
(40, 26, 4),
(41, 29, 5),
(42, 29, 3),
(43, 29, 1),
(44, 31, 1),
(45, 32, 3),
(46, 35, 1),
(47, 34, 5),
(48, 34, 3),
(49, 34, 1),
(50, 37, 1),
(99, 40, 3),
(100, 40, 5),
(101, 40, 1),
(102, 41, 5),
(162, 43, 1),
(200, 38, 5),
(201, 38, 3),
(202, 38, 1),
(206, 3, 1),
(207, 3, 5),
(219, 42, 8),
(220, 42, 5),
(221, 42, 1),
(224, 47, 1),
(225, 47, 5),
(226, 47, 1),
(229, 48, 1),
(230, 46, 1),
(231, 46, 1),
(232, 46, 5),
(233, 49, 5),
(244, 51, 1),
(245, 51, 5),
(256, 50, 6),
(257, 50, 10),
(259, 2, 4),
(260, 2, 3),
(261, 2, 7),
(264, 45, 4),
(267, 1, 1),
(268, 1, 2),
(269, 53, 5),
(270, 53, 13),
(273, 59, 14),
(274, 59, 3),
(276, 62, 5),
(277, 63, 5),
(278, 64, 5),
(281, 65, 5),
(282, 65, 1),
(286, 58, 13),
(287, 58, 1),
(289, 68, 1),
(290, 68, 5),
(291, 44, 7),
(293, 67, 1),
(294, 69, 5),
(296, 61, 5),
(299, 71, 13),
(339, 76, 1),
(341, 77, 1),
(371, 52, 1),
(377, 80, 1),
(378, 81, 1),
(379, 66, 5);

-- --------------------------------------------------------

--
-- Table structure for table `postsViews`
--

CREATE TABLE IF NOT EXISTS `postsViews` (
  `id` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `ipaddress` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postsViews`
--

INSERT INTO `postsViews` (`id`, `postsId`, `ipaddress`) VALUES
(40, 1, '14.169.15.36'),
(57, 1, '66.249.67.99'),
(46, 2, '66.249.67.93'),
(37, 30, '66.249.67.99'),
(29, 31, '66.249.67.87'),
(35, 34, '66.249.67.99'),
(45, 35, '66.249.67.99'),
(36, 37, '66.249.67.99'),
(43, 44, '66.249.67.87'),
(52, 46, '66.249.67.87'),
(34, 46, '66.249.67.99'),
(16, 49, '125.234.96.138'),
(9, 52, '125.234.96.138'),
(22, 52, '14.169.15.36'),
(50, 53, '14.169.15.36'),
(47, 53, '66.249.67.93'),
(55, 55, '14.169.15.36'),
(53, 56, '14.169.15.36'),
(59, 57, '14.169.15.36'),
(38, 58, '14.169.15.36'),
(14, 58, '180.76.15.148'),
(33, 59, '66.249.67.87'),
(48, 61, '14.169.15.36'),
(31, 61, '66.249.67.87'),
(54, 61, '66.249.67.93'),
(58, 62, '66.249.67.93'),
(26, 63, '14.169.15.36'),
(30, 63, '66.249.67.87'),
(56, 63, '66.249.67.99'),
(44, 64, '66.249.67.87'),
(32, 65, '66.249.67.87'),
(11, 66, '125.234.96.138'),
(21, 66, '14.169.15.36'),
(12, 68, '125.234.96.138'),
(39, 68, '14.169.15.36'),
(42, 69, '14.169.15.36'),
(24, 70, '14.169.15.36'),
(61, 71, '14.169.15.36'),
(60, 72, '14.169.15.36'),
(15, 73, '125.234.96.138'),
(41, 74, '14.169.15.36'),
(27, 75, '14.169.15.36'),
(17, 76, '125.234.96.138'),
(13, 76, '14.169.15.36'),
(18, 76, '66.249.67.93'),
(10, 77, '125.234.96.138'),
(23, 77, '14.169.15.36'),
(25, 78, '14.169.15.36'),
(28, 79, '14.169.15.36'),
(19, 80, '125.234.96.138'),
(51, 80, '14.169.15.36'),
(20, 81, '125.234.96.138'),
(49, 81, '14.169.15.36');

-- --------------------------------------------------------

--
-- Table structure for table `rememberTokens`
--

CREATE TABLE IF NOT EXISTS `rememberTokens` (
  `id` int(11) unsigned NOT NULL,
  `usersId` int(11) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rememberTokens`
--

INSERT INTO `rememberTokens` (`id`, `usersId`, `token`, `userAgent`, `createdAt`) VALUES
(12, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1437157166),
(13, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1437848210),
(14, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1437848268),
(15, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1437848417),
(16, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1437848581),
(17, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1437157166),
(18, 78, 'bde10c4c2be13b908f2449fe83fe344e', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+', 1437850987),
(19, 78, 'c80d892b8a5252ca466fcc09226bf352', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.3', 1437879313),
(20, 78, 'c80d892b8a5252ca466fcc09226bf352', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.3', 1437879350),
(21, 78, 'c80d892b8a5252ca466fcc09226bf352', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.3', 1437879470),
(22, 78, 'c80d892b8a5252ca466fcc09226bf352', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.3', 1437879512),
(23, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1437890059),
(24, 78, 'bde10c4c2be13b908f2449fe83fe344e', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+', 1437901391),
(25, 59, 'fd4b1e87151ab241c184fa503a74cbe3', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0', 1437962855),
(26, 59, 'fd4b1e87151ab241c184fa503a74cbe3', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0', 1437967491),
(27, 59, 'fd4b1e87151ab241c184fa503a74cbe3', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0', 1437982626),
(28, 59, 'fd4b1e87151ab241c184fa503a74cbe3', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0', 1438067733),
(29, 59, 'fd4b1e87151ab241c184fa503a74cbe3', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0', 1438135068),
(30, 78, 'e5fae465c2f647d18372a86a1f9b0e46', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1438236209),
(31, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438265538),
(32, 78, 'e5fae465c2f647d18372a86a1f9b0e46', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1438325186),
(33, 59, 'fd4b1e87151ab241c184fa503a74cbe3', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0', 1438334643),
(34, 59, 'fd4b1e87151ab241c184fa503a74cbe3', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0', 1438334825),
(35, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438417317),
(36, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438492044),
(37, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438493151),
(38, 59, 'a4fd43e3b95ffa7dd90199cb0eb8c277', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438493441),
(39, 75, '76452ee1712ebbe53084cc21f961bb96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438511042),
(40, 2, '0c24b1d1cf07f8af74b502e82215be89', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438525372);

-- --------------------------------------------------------

--
-- Table structure for table `shortUrls`
--

CREATE TABLE IF NOT EXISTS `shortUrls` (
  `id` int(15) unsigned NOT NULL,
  `longUrl` varchar(255) NOT NULL,
  `shortCode` varbinary(6) NOT NULL,
  `createdAt` int(11) unsigned NOT NULL,
  `counter` int(15) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(11) unsigned NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscribe`
--

INSERT INTO `subscribe` (`id`, `email`, `status`) VALUES
(1, 'thientd@evolabable.vn', 'Y'),
(2, 'thientd@evolableasia.vn', 'Y'),
(3, 'thientd@evolableasia.vn', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `successLogins`
--

CREATE TABLE IF NOT EXISTS `successLogins` (
  `id` int(15) NOT NULL,
  `usersId` int(15) NOT NULL,
  `ipAddress` varchar(100) NOT NULL,
  `userAgent` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1555 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `successLogins`
--

INSERT INTO `successLogins` (`id`, `usersId`, `ipAddress`, `userAgent`) VALUES
(1, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(2, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(3, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(4, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(5, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(6, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(7, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(8, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(9, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(10, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(11, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(12, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(13, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(14, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(15, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(16, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(17, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(18, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(19, 47, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(20, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(21, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(22, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(23, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(24, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(25, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(26, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(27, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(28, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(29, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(30, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(31, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(32, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(33, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(34, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(35, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(36, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(37, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(38, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(39, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(40, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(41, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(42, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(43, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(44, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(45, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(46, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(47, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(48, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(49, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(50, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(51, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(52, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(53, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(54, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(55, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(56, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(57, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(58, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(59, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(60, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(61, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(62, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(63, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(64, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(65, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(66, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(67, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(68, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(69, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(70, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(71, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(72, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(73, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(74, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(75, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(76, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(77, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(78, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(79, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(80, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(81, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(82, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(83, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(84, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(85, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(86, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(87, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(88, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(89, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(90, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(91, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(92, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(93, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(94, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(95, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(96, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(97, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(98, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(99, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(100, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(101, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(102, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(103, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(104, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(105, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(106, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(107, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(108, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(109, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(110, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(111, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(112, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(113, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(114, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(115, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(116, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(117, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(118, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(119, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(120, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(121, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(122, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(123, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(124, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(125, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(126, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(127, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(128, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(129, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(130, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(131, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(132, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(133, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(134, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(135, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(136, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(137, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(138, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(139, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(140, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(141, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(142, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(143, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(144, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(145, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(146, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(147, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(148, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(149, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(150, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(151, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(152, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(153, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(154, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(155, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(156, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(157, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(158, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(159, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(160, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(161, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(162, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(163, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(164, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(165, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(166, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(167, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(168, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(169, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(170, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(171, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(172, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(173, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(174, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(175, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(176, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(177, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(178, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(179, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(180, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(181, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(182, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(183, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(184, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(185, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(186, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(187, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(188, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(189, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(190, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(191, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(192, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(193, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(194, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(195, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(196, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(197, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(198, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(199, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(200, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(201, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(202, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(203, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(204, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(205, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(206, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(207, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(208, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(209, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(210, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(211, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(212, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(213, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(214, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(215, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(216, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(217, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(218, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(219, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(220, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(221, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(222, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(223, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(224, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(225, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(226, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(227, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(228, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(229, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(230, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(231, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(232, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(233, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(234, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(235, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(236, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(237, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(238, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(239, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(240, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(241, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(242, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(243, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(244, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(245, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(246, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(247, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(248, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(249, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(250, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(251, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(252, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(253, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(254, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(255, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(256, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(257, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(258, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(259, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(260, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(261, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(262, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(263, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(264, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(265, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(266, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(267, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(268, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(269, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(270, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(271, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(272, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(273, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(274, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(275, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(276, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(277, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(278, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(279, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(280, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(281, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(282, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(283, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(284, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(285, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(286, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(287, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(288, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(289, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(290, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(291, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(292, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(293, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(294, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(295, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(296, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(297, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(298, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(299, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(300, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(301, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(302, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(303, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(304, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(305, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(306, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(307, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(308, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(309, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(310, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(311, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(312, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(313, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(314, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(315, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(316, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(317, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(318, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(319, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(320, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(321, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(322, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(323, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(324, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(325, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(326, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(327, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(328, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(329, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(330, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(331, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(332, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(333, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(334, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(335, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(336, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(337, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(338, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(339, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(340, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(341, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(342, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(343, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(344, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(345, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(346, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(347, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(348, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(349, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(350, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(351, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(352, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(353, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(354, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(355, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(356, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(357, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(358, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(359, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(360, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(361, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(362, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(363, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(364, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(365, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(366, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(367, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(368, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(369, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(370, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(371, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(372, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(373, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(374, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(375, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(376, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(377, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(378, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(379, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(380, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(381, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(382, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(383, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(384, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(385, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(386, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(387, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(388, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(389, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(390, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(391, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(392, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(393, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(394, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(395, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(396, 78, '14.169.34.124', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(397, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(398, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(399, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(400, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(401, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(402, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(403, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(404, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(405, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(406, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(407, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(408, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(409, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(410, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(411, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(412, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(413, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(414, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(415, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(416, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(417, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(418, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(419, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(420, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(421, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0');
INSERT INTO `successLogins` (`id`, `usersId`, `ipAddress`, `userAgent`) VALUES
(422, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(423, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(424, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(425, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(426, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(427, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(428, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(429, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(430, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(431, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(432, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(433, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(434, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(435, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(436, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(437, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(438, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(439, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(440, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(441, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(442, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(443, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(444, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(445, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(446, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(447, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(448, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(449, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(450, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(451, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(452, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(453, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(454, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(455, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(456, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(457, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(458, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(459, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(460, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(461, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(462, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(463, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(464, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(465, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(466, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(467, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(468, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(469, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(470, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(471, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(472, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(473, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(474, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(475, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(476, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(477, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(478, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(479, 78, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(480, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(481, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(482, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(483, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(484, 59, '14.169.34.124', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(485, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(486, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(487, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(488, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(489, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(490, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(491, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(492, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(493, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(494, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(495, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(496, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(497, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(498, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(499, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(500, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(501, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(502, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(503, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(504, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(505, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(506, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(507, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(508, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(509, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(510, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(511, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(512, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(513, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(514, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(515, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(516, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(517, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(518, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(519, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(520, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(521, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(522, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(523, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(524, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(525, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(526, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(527, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(528, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(529, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(530, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(531, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(532, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(533, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(534, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(535, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(536, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(537, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(538, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(539, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(540, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(541, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(542, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(543, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(544, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(545, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(546, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(547, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(548, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(549, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(550, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(551, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(552, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(553, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(554, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(555, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(556, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(557, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(558, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(559, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(560, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(561, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(562, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(563, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(564, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(565, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(566, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(567, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(568, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(569, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(570, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(571, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(572, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(573, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(574, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(575, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(576, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(577, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(578, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(579, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(580, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(581, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(582, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(583, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(584, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(585, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(586, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(587, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(588, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(589, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(590, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(591, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(592, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(593, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(594, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(595, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(596, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(597, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(598, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(599, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(600, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(601, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(602, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(603, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(604, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(605, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(606, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(607, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(608, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(609, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(610, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(611, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(612, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(613, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(614, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(615, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(616, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(617, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(618, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(619, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(620, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(621, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(622, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(623, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(624, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(625, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(626, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(627, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(628, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(629, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(630, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(631, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(632, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(633, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(634, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(635, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(636, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(637, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(638, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(639, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(640, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(641, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(642, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(643, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(644, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(645, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(646, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(647, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(648, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(649, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(650, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(651, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(652, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(653, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(654, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(655, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(656, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(657, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(658, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(659, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(660, 78, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36'),
(661, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(662, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(663, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(664, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(665, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(666, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(667, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(668, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(669, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(670, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(671, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(672, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(673, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(674, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(675, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(676, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(677, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(678, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(679, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(680, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(681, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(682, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(683, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(684, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(685, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(686, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(687, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(688, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(689, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(690, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(691, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(692, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(693, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(694, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(695, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(696, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(697, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(698, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(699, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(700, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(701, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(702, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(703, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(704, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(705, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(706, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(707, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(708, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(709, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(710, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(711, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(712, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(713, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(714, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(715, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(716, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(717, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(718, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(719, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(720, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(721, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(722, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(723, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(724, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(725, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(726, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(727, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(728, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(729, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(730, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(731, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(732, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(733, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(734, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(735, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(736, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(737, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(738, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(739, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(740, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(741, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(742, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(743, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(744, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(745, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(746, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(747, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(748, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(749, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(750, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(751, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(752, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(753, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(754, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(755, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(756, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(757, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(758, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(759, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(760, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(761, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(762, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(763, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(764, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(765, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(766, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(767, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(768, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(769, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(770, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(771, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(772, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(773, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(774, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(775, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(776, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(777, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(778, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(779, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(780, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(781, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(782, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(783, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(784, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(785, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(786, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(787, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(788, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(789, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(790, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(791, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(792, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(793, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(794, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(795, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(796, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(797, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(798, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(799, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(800, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(801, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(802, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(803, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(804, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(805, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(806, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(807, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(808, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(809, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(810, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(811, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(812, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(813, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(814, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(815, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(816, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(817, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(818, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(819, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(820, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(821, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(822, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(823, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(824, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(825, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(826, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(827, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(828, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(829, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(830, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(831, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(832, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(833, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(834, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(835, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(836, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0');
INSERT INTO `successLogins` (`id`, `usersId`, `ipAddress`, `userAgent`) VALUES
(837, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(838, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(839, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(840, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(841, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(842, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(843, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(844, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(845, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(846, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(847, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(848, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(849, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(850, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(851, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(852, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(853, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(854, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(855, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(856, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(857, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(858, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(859, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(860, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(861, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(862, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(863, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(864, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(865, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(866, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(867, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(868, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(869, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(870, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(871, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(872, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(873, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(874, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(875, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(876, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(877, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(878, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(879, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(880, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(881, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(882, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(883, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(884, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(885, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(886, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(887, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(888, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(889, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(890, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(891, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(892, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(893, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(894, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(895, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(896, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(897, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(898, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(899, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(900, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(901, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(902, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(903, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(904, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(905, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(906, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(907, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(908, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(909, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(910, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(911, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(912, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(913, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(914, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(915, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(916, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(917, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(918, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(919, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(920, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(921, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(922, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(923, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(924, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(925, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(926, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(927, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(928, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(929, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(930, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(931, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(932, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(933, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(934, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(935, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(936, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(937, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(938, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(939, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(940, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(941, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(942, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(943, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(944, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(945, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(946, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(947, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(948, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(949, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(950, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(951, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(952, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(953, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(954, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(955, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(956, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(957, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(958, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(959, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(960, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(961, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(962, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(963, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(964, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(965, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(966, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(967, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(968, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(969, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(970, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(971, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(972, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(973, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(974, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(975, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(976, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(977, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(978, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(979, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(980, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(981, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(982, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(983, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(984, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(985, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(986, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(987, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(988, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(989, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(990, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(991, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(992, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(993, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(994, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(995, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(996, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(997, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(998, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(999, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1000, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1001, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1002, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1003, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1004, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1005, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1006, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1007, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1008, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1009, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1010, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1011, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1012, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1013, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1014, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1015, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1016, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1017, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1018, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1019, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1020, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1021, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1022, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1023, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1024, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1025, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1026, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1027, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1028, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1029, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1030, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1031, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1032, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1033, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1034, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1035, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1036, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1037, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1038, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1039, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1040, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1041, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1042, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1043, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1044, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1045, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1046, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1047, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1048, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1049, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1050, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1051, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1052, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1053, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1054, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1055, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1056, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1057, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1058, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1059, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1060, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1061, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1062, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1063, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1064, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1065, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1066, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1067, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1068, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1069, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1070, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1071, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1072, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1073, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1074, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1075, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1076, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1077, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1078, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1079, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1080, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1081, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1082, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1083, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1084, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1085, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1086, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1087, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1088, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1089, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1090, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1091, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1092, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1093, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1094, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1095, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1096, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1097, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1098, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1099, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1100, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1101, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1102, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1103, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1104, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1105, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1106, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1107, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1108, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1109, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1110, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1111, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1112, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1113, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1114, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1115, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1116, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1117, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1118, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1119, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1120, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1121, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1122, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1123, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1124, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1125, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1126, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1127, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1128, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1129, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1130, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1131, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1132, 78, '125.234.96.138', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36'),
(1133, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1134, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1135, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1136, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1137, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1138, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1139, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1140, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1141, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1142, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1143, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1144, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1145, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1146, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1147, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1148, 59, '125.234.96.138', 'Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:37.0) Gecko/20100101 Firefox/37.0'),
(1149, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1150, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1151, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1152, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1153, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1154, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1155, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1156, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1157, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1158, 78, '14.169.15.36', 'Mozilla/5.0 (BB10; Kbd) AppleWebKit/537.35+ (KHTML, like Gecko) Version/10.3.1.2576 Mobile Safari/537.35+'),
(1159, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1160, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1161, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1162, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1163, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1164, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1165, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1166, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1167, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1168, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1169, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1170, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1171, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1172, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1173, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1174, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1175, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1176, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1177, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1178, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1179, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1180, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1181, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1182, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1183, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1184, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1185, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1186, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1187, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1188, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1189, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1190, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1191, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1192, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1193, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1194, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1195, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1196, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1197, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1198, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1199, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1200, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1201, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1202, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1203, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1204, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1205, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1206, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1207, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1208, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1209, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1210, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1211, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1212, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1213, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1214, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1215, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1216, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1217, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0');
INSERT INTO `successLogins` (`id`, `usersId`, `ipAddress`, `userAgent`) VALUES
(1218, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1219, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1220, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1221, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1222, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1223, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1224, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1225, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1226, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1227, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1228, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1229, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1230, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1231, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1232, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1233, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1234, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1235, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1236, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1237, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1238, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1239, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1240, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1241, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1242, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1243, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1244, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1245, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1246, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1247, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1248, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1249, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1250, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1251, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1252, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1253, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1254, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1255, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1256, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1257, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1258, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1259, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1260, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1261, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1262, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1263, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1264, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1265, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1266, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1267, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1268, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1269, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1270, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1271, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1272, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1273, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1274, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1275, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1276, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1277, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1278, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1279, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1280, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1281, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1282, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1283, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1284, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1285, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1286, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1287, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1288, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1289, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1290, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1291, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1292, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1293, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1294, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1295, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1296, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1297, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1298, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1299, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1300, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1301, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1302, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1303, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1304, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1305, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1306, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1307, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1308, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1309, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1310, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1311, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1312, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1313, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1314, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1315, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1316, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1317, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1318, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1319, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1320, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1321, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1322, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1323, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1324, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1325, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1326, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1327, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1328, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1329, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1330, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1331, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1332, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1333, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1334, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1335, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1336, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1337, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1338, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1339, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1340, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1341, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1342, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1343, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1344, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1345, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1346, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1347, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1348, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1349, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1350, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1351, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1352, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1353, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1354, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1355, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1356, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1357, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1358, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1359, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1360, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1361, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1362, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1363, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1364, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1365, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1366, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1367, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1368, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1369, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1370, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1371, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1372, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1373, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1374, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1375, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1376, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1377, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1378, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1379, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1380, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1381, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1382, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1383, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1384, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1385, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1386, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1387, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1388, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1389, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1390, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1391, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1392, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1393, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1394, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1395, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1396, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1397, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1398, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1399, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1400, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1401, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1402, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1403, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1404, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1405, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1406, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1407, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1408, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1409, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1410, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1411, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1412, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1413, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1414, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1415, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1416, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1417, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1418, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1419, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1420, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1421, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1422, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1423, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1424, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1425, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1426, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1427, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1428, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1429, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1430, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1431, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1432, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1433, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1434, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1435, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1436, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1437, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1438, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1439, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1440, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1441, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1442, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1443, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1444, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1445, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1446, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1447, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1448, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1449, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1450, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1451, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1452, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1453, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1454, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1455, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1456, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1457, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1458, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1459, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1460, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1461, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1462, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1463, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1464, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1465, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1466, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1467, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1468, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1469, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1470, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1471, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1472, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1473, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1474, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1475, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1476, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1477, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1478, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1479, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1480, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1481, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1482, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1483, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1484, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1485, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1486, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1487, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1488, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1489, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1490, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1491, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1492, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1493, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1494, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1495, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1496, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1497, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1498, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1499, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1500, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1501, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1502, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1503, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1504, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1505, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1506, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1507, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1508, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1509, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1510, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1511, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1512, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1513, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1514, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1515, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1516, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1517, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1518, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1519, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1520, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1521, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1522, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1523, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1524, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1525, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1526, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1527, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1528, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1529, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1530, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1531, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1532, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1533, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1534, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1535, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1536, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1537, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1538, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1539, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1540, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1541, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1542, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1543, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1544, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1545, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1546, 59, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1547, 75, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1548, 75, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1549, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1550, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1551, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1552, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1553, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(1554, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(72) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(32) DEFAULT NULL,
  `numberPosts` int(10) unsigned DEFAULT NULL,
  `noBounty` char(1) NOT NULL DEFAULT 'N',
  `noDigest` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `description`, `slug`, `numberPosts`, `noBounty`, `noDigest`) VALUES
(1, 'PHP', 'A popular general-purpose scripting language that is especially suited to web development. PHP is a server scripting', 'php', 12, 'N', 'N'),
(2, 'Python', ' Python is a dynamic and strongly typed programming language that is designed to emphasize usability. Two similar but incompatible versions of Python are in widespread use (2 and 3). Please consider mentioning the version and implementation that you are using when asking a question about Python. ', 'python', 1, 'N', 'N'),
(3, 'Java', 'A general-purpose programming language designed to be used in conjunction with the Java Virtual Machine (JVM). "Java ', 'java', 1, 'N', 'N'),
(4, 'Ruby', 'A multi-platform open-source dynamic object-oriented interpreted language created by Yukihiro Matsumoto (Matz) in ', 'ruby', 1, 'N', 'N'),
(5, 'PhalconPHP', 'PhalconPHP is a web framework delivered as a C extension providing high performance and lower resource consumption. ', 'phalcon-php', 1, 'N', 'N'),
(6, 'Nodejs', 'An event-based, non-blocking, asynchronous I/O framework that uses Google''s V8 JavaScript engine. It is used', 'node-js', 1, 'N', 'N'),
(7, 'Linux', 'An open source operating system. Use this tag only if your question relates to using Linux APIs or Linux-specific behavior.', 'linux', 1, 'N', 'N'),
(8, 'Drupal', 'An open source CMS framework written in PHP. Rather than using this tag, consider posting your question directly on ', 'drupal', 1, 'N', 'N'),
(9, 'Wordpress', 'An open source content management system running on PHP and MySQL, and often used as a blog engine. WordPress questions about programming and administration are best asked on', 'wordpress', 1, 'N', 'N'),
(10, 'Joomla', 'A free and open source Content Management System (CMS) for publishing content on the World Wide Web and intranets and a model–view–controller (MVC) Web application framework that can also b…', 'joomla', 1, 'N', 'N'),
(11, 'Shell', 'The term ''shell'' refers to a general class of text-based command interpreters most often associated with the Unix & Linux operating systems. ', 'shell', 1, 'N', 'N'),
(12, 'Mysql', 'A freely available open source Relational Database Management System (RDBMS) that uses Structured Query Language ', 'mysql', 1, 'N', 'N'),
(13, 'Cakephp', 'A rapid development framework for PHP that provides an extensible architecture for developing, maintaining, and deploying', 'cakephp', 4, 'N', 'N'),
(14, 'JavaScript', 'JavaScript (not to be confused with Java) is a dynamic, weakly-typed language typically used for client-side scripting. Use this tag for questions regarding ECMAScript and its various dialects/implementations (excluding ActionScript). Unless a tag for a framework/library is also included, a pure JavaScript answer is expected. ', 'javascript', 1, 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `key` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(255) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `key`, `subject`, `content`) VALUES
(1, 'Registration', 'registration', 'Finishing your registration on Information', '{% extends ''layouts/layoutEmail.volt'' %}\r\n{% block subject %}{{ subject }}{% endblock %}\r\n{% block content %}\r\n    <p class="h5">Down below you will find the link where you can setup your password</p>\r\n    <br />\r\n    <p class="h5"><a href="{{ link }}">Click here to setup your password</a></p>\r\n{% endblock %}'),
(2, 'Forgot Password', 'forgotpassword', 'Reset your password', '<h5>Hello {{ firstname }} {{ lastname }},</h5>\r\n<p>Below you will find the link that you have requested to reset your password</p>\r\n<h4><a href="{{ link }}">Change my password</a></h4>'),
(6, 'Test', 'test', 'Phanbook TEST', 'This is a test email. \r\n\r\n© {{ date(''Y'') }} Phanbook'),
(7, 'Right side theme default', 'rightside', 'Right sidebar', '<!-- begin right-sidebar -->\r\n<div id="right-sidebar" class="sidebar">\r\n    <div class="spacer">\r\n        <form role="search" id="search-right" action="/search">\r\n            <input type="text" tabindex="20" placeholder="{{t(''search'')}}" name="q">\r\n            <input type="submit" tabindex="22" value="">\r\n        </form>\r\n    </div>\r\n    <div class="spacer">\r\n        <div class="sidebox submit submit-link">\r\n            <div class="morelink" data-descr="Please remember to read the rules. Thank you!">\r\n                <a target="_top" class="login-required" href="/hackernew/submit">{{t(''Submit a new link'')}}</a>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    {% if post is defined and this.view.getActionName() == ''view''%}\r\n        <div class="spacer">\r\n            <div class="linkinfo">\r\n                <div class="date">\r\n                    <span>this post was submitted on</span>\r\n                    <time datetime="{{date(''Y-M-D h:i'', post.getCreatedAt())}}">{{ date(''d M Y'', post.getCreatedAt())}}</time>\r\n                </div>\r\n                <div class="score">\r\n                    <span class="number">{{ post.getBounty()[''value''] ? post.getBounty()[''value''] : 0 }}</span>\r\n                    <span class="word">points</span> (95% upvoted)\r\n                </div>\r\n                <div class="shortlink">shortlink:\r\n                    <input type="text" id="shortlink-text" readonly="readonly" value="http://phanbook.com">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    {% endif %}\r\n    <div class="spacer">\r\n        <div class="titlebox">\r\n            <h1 class="hover redditname">\r\n                <a class="hover" href="p/PHP/">PHP</a>\r\n            </h1>\r\n            <span data-sr_name="PHP" class="fancy-toggle-button subscribe-button toggle">\r\n                {% if 1 == 1 %}\r\n                    <a href="#" class="add" data-descr="Subscribe!">subscribe</a>\r\n                {% else %}\r\n                    <a href="#" class="remove" data-descr="Unsubscribe!">unsubscribe</a>\r\n                {% endif %}\r\n            </span>\r\n            <span class="subscribers"><span class="number">37,215</span> <span class="word">readers</span></span>\r\n            <div class="usertext-body may-blank-within md-container ">\r\n                <div class="md"><p><a href="/p/PHP/wiki/index">Subphannook FAQ</a></p>\r\n\r\n                    <p>{{t(''Releases'')}}: <a href="http://php.net/downloads.php">Current Releases</a>, <a href="http://windows.php.net/download/">Windows Releases</a>, <a href="http://museum.php.net/">Old Releases</a></p>\r\n\r\n                    <p>Sources: <a href="https://svn.php.net/viewvc/">Subversion</a>, <a href="https://git.php.net/">Git</a>, <a href="http://lxr.php.net/">Source Search</a></p>\r\n\r\n                    <p><a href="/">Contribute to the PHP Documentation</a></p>\r\n\r\n                    <p>Related subreddits:\r\n                        <a href="/p/css">CSS</a>, <a href="/p/javascript">JavaScript</a>,\r\n                        <a href="/p/web-design">Web Design</a>, <a href="/p/wordpress">Wordpress</a>, <a href="/p/webdev">WebDev</a>\r\n                    </p>\r\n\r\n                    <p>Join <a href="http://chat.phalcontip.com">#phalcon</a> on Freenode!</p>\r\n\r\n                    <hr>\r\n\r\n                    <p><a href="/p/PHP">/p/PHP</a> is not a support subphanbook. Please visit <a href="/p/phphelp">/p/phphelp</a> for help, or connect to <a href="http://chat.phalcontip.com">##php on Slack chat</a> (<a href="https://slack.com/faq.shtml#thien">you registration required</a>)</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class="spacer">\r\n        <a href="">\r\n        {{image(''images/sponsor.png'')}}\r\n        </a>\r\n    </div>\r\n    <div id="hot-network-questions" class="spacer">\r\n        <h4>\r\n            {{ link_to(''posts/hot'', t(''Hot Network Community'')) }}\r\n        </h4>\r\n        <ul class="widget">\r\n                {% for hot in hotPosts %}\r\n                    <li>\r\n                        <p>\r\n                            <span class="number"> {{ hot.getNumberReply() }}</span>\r\n                            <span class="text">\r\n                            {{ link_to(hot.getType() ~ ''/'' ~ hot.getId() ~ ''/'' ~ hot.getSlug(), hot.getTitle())}}</span>\r\n                        </p>\r\n                    </li>\r\n                {% endfor %}\r\n        </ul>\r\n    </div><!-- hot-network-questions -->\r\n</div>\r\n'),
(8, '', 'sendspool', 'Send Spool', 'Nice'),
(9, '', 'senddigest', 'Send Digest', 'Nice');


-- --------------------------------------------------------

--
-- Table structure for table `topicTracking`
--

CREATE TABLE IF NOT EXISTS `topicTracking` (
  `userId` int(11) NOT NULL,
  `topicId` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(11) NOT NULL,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `key_name` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `language`, `key_name`, `value`) VALUES
(1, 'en', 'first_post', ' You''re about to create your first post in the forum. Please take a few minutes to read <a href="/help/create-post">some recommendations</a> to help others understand your problem and increase your chances of getting good answers that help you solve it more effectively. '),
(2, 'vn', 'first_post', 'Đây là lần đầu tiên bạn tạo bài viết trên Website này, xin hãy  dành vài phút đọc <a href="/help/create-post" >hướng dẫn</a> để có thể đăng bài với chất lượng  tốt nhất'),
(3, 'vn', 'about_brief', 'Mục đích lập ra ra trang web này của chúng tôi chỉ đơn giản là mong muốn bạn chia sẽ những địa danh ở địa phưong bạn, chẳn hạn như khu du lịch , di tích lịch sử hay đơn giãn chỉ lạ nơi bạn đang ở\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(72) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `tokenType` varchar(16) DEFAULT NULL,
  `tokenGithub` char(100) DEFAULT NULL,
  `tokenGoogle` char(100) DEFAULT NULL,
  `tokenFacebook` char(100) DEFAULT NULL,
  `uid` char(50) DEFAULT NULL,
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL,
  `notifications` char(1) DEFAULT 'N',
  `digest` char(1) DEFAULT 'Y',
  `timezone` varchar(48) DEFAULT NULL,
  `moderator` char(1) DEFAULT 'N',
  `admin` char(1) NOT NULL DEFAULT 'N',
  `karma` int(11) DEFAULT NULL,
  `vote` int(10) unsigned DEFAULT NULL,
  `votePoint` int(11) DEFAULT NULL,
  `gender` int(1) NOT NULL DEFAULT '9' COMMENT 'unknow-9, male-1,2-female',
  `birthdate` date DEFAULT NULL,
  `passwd` varchar(60) NOT NULL,
  `registerHash` varchar(60) DEFAULT NULL,
  `passwdForgotHash` varchar(60) DEFAULT NULL,
  `lastPasswdReset` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1-active,2-disable,3-pending',
  `theme` char(1) DEFAULT 'D',
  `bio` text,
  `twitter` varchar(100) DEFAULT NULL,
  `github` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `firstname`, `lastname`, `tokenType`, `tokenGithub`, `tokenGoogle`, `tokenFacebook`, `uid`, `createdAt`, `modifiedAt`, `notifications`, `digest`, `timezone`, `moderator`, `admin`, `karma`, `vote`, `votePoint`, `gender`, `birthdate`, `passwd`, `registerHash`, `passwdForgotHash`, `lastPasswdReset`, `status`, `theme`, `bio`, `twitter`, `github`) VALUES
(1, 'duythien', 'fcduythien@gmail.ok.com', 'Thien', NULL, 'bearer', '06992c0abe0826193afe06be891b8843e7068a68', NULL, NULL, NULL, 1427579406, 1438316970, 'N', 'N', 'UTC', 'N', 'Y', 356, 4, 32, 9, NULL, '$2a$12$vZ85jPwlOMIdCxxo07nSgeo51/fcLpfE6spLfi6ybrs5dK0AY.UzK', NULL, NULL, 2015, 1, 'D', 'I''m a professional web developer from Vietnam with B.S Physics and Engineering. I''m a Phalcon enthusiast as Opensource. In free time, I was support on forum Phalcon also my forum and contribution core Phalcon.\r\n\r\nOn occasion, I write up snippets of nifty tricks or techniques in my [phalcontip](http://phalcontip.com) little blog.', NULL, NULL),
(2, 'admin', 'cobe_muadong_2520dd00@yahoo.com', 'Beackham', 'David', 'bearer', 'a02f76441cf096accd3343b7774dc0118227769b', NULL, NULL, NULL, 1427816610, 1438526546, 'Y', 'Y', 'UTC', 'Y', 'Y', 52, 1, 2, 1, '0000-00-00', '$2a$12$wCpQq8iqKlKhFdwh7SgKVeEmjkuriZYje20RKq5/lN3HuNKAvb.i2', NULL, NULL, NULL, 1, 'D', 'Some bio', '', ''),
(3, 'moderator', 'abc@gmail.com', NULL, NULL, 'bearer', 'a81ad83e073c1ff69ca97362e209f5ad720a0c32', NULL, NULL, NULL, 1427856306, 1438316970, 'N', 'N', 'UTC', 'Y', 'N', 105, 2, -38, 9, NULL, '$2a$12$dGwen09hjuTmtl7xnZ/pP.Tw9kh5Ot8fzkgpYP/DZqUyy2dVS06Jy', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(4, 'users2', '1065106@student.hcmus.edu.vn', NULL, NULL, NULL, '17b822f918c2f2093e1809fc275b58a4f0abbb65', NULL, NULL, NULL, 1426406847, 1438316970, 'N', 'N', 'UTC', 'N', 'N', 344, NULL, NULL, 9, NULL, '$2a$12$/Ocnx00XJfv0THpktM819OU6Nxcgzr56j1Xt.XtfBaYGtvL2ILj/W', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(21, 'users5', 'phongvu.811@gmail.com', NULL, NULL, 'bearer', '1bd8fb6e2001a2c798333b8b7c95f55a4aa8a9c9', NULL, NULL, NULL, 1428289000, 1438316970, 'N', 'N', 'UTC', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$rJ2IFmvsljcVO9wlEsgxKevS5B9jN89wmuMilh.Ify2vk5nXuG7um', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(33, 'users6', 'users6+@phalconbook.com', NULL, NULL, 'bearer', NULL, NULL, NULL, NULL, 1431193773, 1438316970, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$LM03vplRhwV40eLWrJhdLuwT59sG4q3YKHy1U37gH26J2eBXYkcRO', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(37, 'users7', 'users7+@phalconbook.com', NULL, NULL, 'bearer', NULL, NULL, NULL, NULL, 1431194000, 1438316970, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$fxfXDPglwKbUtFLpV5kox.yCBsUxoSdePvXB20U3mbfdlE.6fvA/G', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(38, 'users8', 'users8+@phalconbook.com', NULL, NULL, 'bearer', NULL, NULL, NULL, NULL, 1431194066, 1438316970, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$KXPH0z01xL3zsBXUprQiMe7OpewpylqbwZQ5VOfZI/etGB7/NIEvW', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(39, 'users9', 'users9+@phalconbook.com', NULL, NULL, 'bearer', NULL, NULL, NULL, NULL, 1431194125, 1438316970, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$chDhRi02GPFZD1p99hBmgebuC5d6PlUXX9T8CttJw.mE.ZItI4a4.', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(45, 'users10', 'users10+@phalconbook.com', 'Eva-Thien', 'Tran', 'bearer', '2bf4f857145045750df84667e4d9626d036d7afd', NULL, NULL, NULL, 1431309032, 1438316970, 'N', 'N', 'Europe/London', 'Y', 'N', 579, 15, 23, 1, '1999-09-23', '$2a$12$asS80hHJeJhPVm0tWKW8WeggmHCkiOmKD35l62ctIO1/GHPn935py', NULL, NULL, NULL, 1, 'D', 'Bruno is a coder from Croatia with Master’s Degrees in Computer Science and English Language and Literature. He’s the editor of SitePoint’s PHP channel \r\n\r\n> and a developer evangelist\r\n\r\n for Diffbot.com. He avoids legacy code like the plague and when picking projects makes sure they’re as cutting edge as possible. He’s a treadmill desk enthusiast and active (board)gamer who sometimes blogs.', NULL, NULL),
(46, 'users11', 'tratnh@phalconbook.com', NULL, NULL, 'bearer', '14ef58715bf6d9d72d4be143a52fe95844183047', NULL, NULL, NULL, 1431698227, 1438316970, 'N', 'N', 'Europe/London', 'N', 'N', 84, 15, 24, 9, NULL, '$2a$12$icaIPc9DD4YjDTI6P3Dp3ux5A2mIVAijViPbswjwRvebScUz8p9ri', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(47, 'users12', 'fcduythien@phalconbook.com', NULL, NULL, 'bearer', '2fd35f7bfd40f63dd8989d5031d373fe5714bf13', NULL, NULL, NULL, 1431843555, 1435552596, 'N', 'N', 'Europe/London', 'N', 'N', 375, 9, 36, 9, NULL, '$2a$12$SjUIsMC6FaOhAzr6XN2QCeZTK5wumzCUK7a7U66.tjualhH1JbXkO', NULL, NULL, 2015, 1, 'D', NULL, NULL, NULL),
(48, 'users13', 'levanlinh1995@phalconbook.com', 'Lê Văn', NULL, 'bearer', NULL, 'ya29.gwEtWV7JsExXPIkkkDNMHIqvBaS6Tql4pF7', NULL, NULL, 1432956258, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$6dVJSnHCt9BvkzZhOldqx.LiyQabSsxsURvHCPzP4SMgVIpnLsOSi', NULL, NULL, 2015, 1, 'D', NULL, NULL, NULL),
(49, 'users14', 'trankhanh.tk.kt@phalconbook.com', 'Khanh', NULL, 'bearer', NULL, 'ya29.iQHpqmL0sLnwMzZr7aFkFPLKRjFOS4LylqB', NULL, NULL, 1433501295, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$ZW3vTifvtyjMIj4aU61yrOVLjkmL8XhHlYbb.nAaIbwcZpQgUeWgi', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(50, 'ssss', 'cobe_muadong_252000@yahoo.com', 'sfsf', NULL, NULL, NULL, NULL, NULL, NULL, 1433522311, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 45, 0, 45, 9, NULL, '$2a$12$rxiu4rCprI8O5aNtWQ8sbOEBoxs9DhnyxIQFoGuM3d7o86DCU818O', '4079be3dfb777cd22b411a68547c4add', NULL, NULL, 3, 'D', NULL, NULL, NULL),
(53, 'ynhi', 'fcynhitran@gmail.com', 'Nhi', NULL, NULL, NULL, NULL, NULL, NULL, 1433522956, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 45, 0, 45, 9, NULL, '$2a$12$FZPf3Jb1lhsLOuXyndHzY.hiZrWzufCYC3zGdD/5bw8XDkEXdtTxi', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(54, 'users17', 'ngancauhoivisao@gmail.com', 'Nhi', NULL, 'bearer', NULL, 'ya29.iQGg4vhxxHjpTRMUfd6U03kjf8cLYp-3u7l', NULL, NULL, 1433537418, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 60, 1, 0, 9, NULL, '$2a$12$ET4IUTCO9j9hwW17kJGoR.5AAKBFHBcUyHPYJNVbsUl.JCobi6Ppe', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(55, 'users18', 'duythien@gmail.com', 'Duy', 'Tran', 'bearer', NULL, NULL, 'CAAFVzwBbVU4BAEUi8sEsRGVNDGZCYck6U0ucKvL', NULL, 1433596909, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 1, '1990-02-12', '$2a$12$9ycMWVBk6ubIBNVOwXDxJuJG/f2voh7J29dH9VJgnKFLaq1ywDje.', NULL, NULL, NULL, 1, 'D', 'You will be notified if someone mentions your @name or replies to your post.', NULL, NULL),
(56, 'utdang', 'dangthiutcva@gmail.com', 'Danng', 'Ut', 'bearer', NULL, 'ya29.iwGSuf7v5WnBHrNNYlQkgEyZ0ovDcugfN3q', NULL, NULL, 1433663836, 1438318136, 'N', 'N', 'Europe/London', 'N', 'N', 138, 2, 25, 1, '0000-00-00', '$2a$12$AxuzOKplsy296DbW7p5av.IuAisP6P/QYvVcrmP7g6FwaWVIMOqSu', NULL, NULL, NULL, 1, 'D', 'I had to built some oAuth with Phalcon. Then I share a simplified version of what i have done (i just put all the code in protected method of the controller, feel free to update the structure). You will have to modify a few things. Just look for "specific to your application" comments in the code. https://gist.github.com/SneakyBobito/6909234\r\n\r\nIt is based on PHPoAuthLib : https://github.com/Lusitanian/PHPoAuthLib then you have to add it to you autoloader Then you may add any service available in the lib (but i only tested with google and github). When you want to add a service : you have to generate an api key/secret key on the specific service and then put them into your config as with the examples of google and GitHub. Finaly add the action that has the same name of the oAuth service (github : GitHubAction google : GoogleAction)\r\n\r\nAll the examples of how to exploit the oAuth api are here : https://github.com/Lusitanian/PHPoAuthLib', NULL, NULL),
(57, 'users20', 'ynhitran1992@gmail.com', 'Nhi', NULL, 'bearer', NULL, 'ya29.kQHOsqY2o0xywoNwdGQjoe66FA_KF0Kymi5', NULL, NULL, 1434202351, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 98, 0, 46, 9, NULL, '$2a$12$RpsciIGFnOzKguHSSRRsFOQThrfaVksW6En61sWElo9tfgDTofr1K', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(58, 'users21', 'huynhbathanh@gmail.com', NULL, NULL, 'bearer', 'dd670c99d128ec16b95c585806e9553d9c5b5b6d', NULL, NULL, NULL, 1434421892, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 81, 0, 21, 9, NULL, '$2a$12$j3bY2qC8fDQUguR1d4jVcu4XZoHCDbDVn.5iu7A2i97XT5PwJm4H2', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(59, 'duythien001', 'users22+@phalconbook.com', 'Thien', 'Tran', 'bearer', '2277f8e7c76dc9537b5e4fa5218314ccf10604f0', NULL, NULL, NULL, 1434551252, 1438503008, 'N', 'N', 'Europe/London', 'Y', 'Y', 1999, 105, 20, 1, '1990-02-11', '$2a$12$CLC1eLqzb6a54SzB4RdcmOhv1dy5t13N/QdPm4RlUMiaNsZSOy9Ie', NULL, NULL, NULL, 1, 'D', 'I''m creating a website that provides a service to people that allows them to access their documents and desktops remotely, and obviously, they should be the only ones that can access their information, but how do I go about doing that?', '', ''),
(60, 'ggg', 'abc@gmail.com.uk', 'Nhi', NULL, NULL, NULL, NULL, NULL, NULL, 1435210795, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 45, 0, 45, 9, NULL, '$2a$12$4KbQXc8WzVfjgxooGJxF4Oazs7y2XWNt45BMGe8eqUnWNWvzEHizi', '447e14187fd13b10c3945c765d5d0262', NULL, NULL, 3, 'D', NULL, NULL, NULL),
(61, 'gggvvv', 'h.suzuki+mynavi@mbrownie.com', 'Nhi', NULL, NULL, NULL, NULL, NULL, NULL, 1435210956, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 45, 0, 45, 9, NULL, '$2a$12$se6c2ePc2rW25qcAePkY3OSvSF7uZfAFvW5JpsGA2WHlfyJRCU4KG', '8d5b9a4beaf7c747c81604daa5e65e7c', NULL, NULL, 3, 'D', NULL, NULL, NULL),
(62, 'Adrews', 'donations@zphalcon.com', 'Thien', NULL, NULL, NULL, NULL, NULL, NULL, 1435398269, 1438316971, 'N', 'N', 'Europe/London', 'N', 'N', 45, 0, 45, 9, NULL, '$2a$12$PhPFctryhEqzDY3m50FiYe8oHYweP44xA31UWQh.uVn6ozdwajFva', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(73, 'users285', 'fcduythien@gmail.com.vn', 'Duy', NULL, 'bearer', NULL, NULL, 'CAAYGZACMAGkgBANnQZBOZARROZAk3X0HlCQ6EpGJi1pZARwH5E8o2g4LHgxJFUWEWFq2izKmYe240aE9hNGQSiasPoIzo6W8149', NULL, 1435565836, 1435567385, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$OBAWsSk0hssL007QirMVdOENQXN44FFZkfflpIpeGHRrPqR9kmGAy', NULL, '0c3e124c3e677fe526af890d79597540eb53d264', 2015, 1, 'D', NULL, NULL, NULL),
(75, 'users27', 'eva.thientd@gmail.com', 'Thien', NULL, 'bearer', NULL, 'ya29.ogEXQBm0P-txsFoiWRhuqEzTfxNYlBQUlyrWdSQyL4tu_jh00ZkhrLxxwyvTzxhLxX0amLQJH1RfyQ', NULL, '118025682879390728094', 1435678971, 1438511031, 'N', 'N', 'Europe/London', 'N', 'N', 50, 1, 0, 9, NULL, '$2a$12$xzjOhBxzc2QTUExVodMIZuh5dPNP2tHha2jl1BhxQ2Uj51zAfGesK', NULL, NULL, 2015, 1, 'D', NULL, NULL, NULL),
(76, 'users28', 'fcduythien@gmail.com.uk', 'Duy', NULL, 'bearer', NULL, NULL, 'CAAYGZACMAGkgBAD8dQyb0qkxAtwFlp9aoctQY164ldMw7F0V1dMS03szmjMvaZADVdkZCny6ZCC8idse6UWtKLCrIwtzzB7IJZB', '554811177990987', 1435679912, 1438316972, 'N', 'N', 'Europe/London', 'N', 'N', 52, 1, 2, 9, NULL, '$2a$12$9Ktnfugwbc2BqIcsVwooxud8KWmevrkktWsI21A3TKVqk.iXI3BQa', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(77, 'users29', 'fcbacktrack@gmail.com.vn', 'Tran', NULL, 'bearer', NULL, 'ya29.pQGORhvCKZ48hXS01hnh-11fDFApXJToAd4Ux3c3TMJVrMWZZvVCZsrAgNfg1ezAzLj1x9rHRo8gZg', NULL, '116122421858277409448', 1435888853, 1438316972, 'N', 'N', 'Europe/London', 'N', 'N', 480, 7, 41, 9, NULL, '$2a$12$vmKtMOhKHmSw5zosGvgHiOCXDfCXbqGGwZetz6w8pZCzWMxf6y9vu', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(78, 'users30', 'fcduythien@gmail.com', NULL, NULL, 'bearer', '72bb203d978a2a05357dee9d1036283eb25debf6', NULL, NULL, '1762691', 1436190190, 1438503008, 'Y', 'N', 'Europe/London', 'N', 'Y', 837, 31, 5, 9, NULL, '$2a$12$Nae2pQkhPalo9XP03LpTye2ZQUc8ZmyvLc92gmIwUGt0YDIqa.vRq', NULL, 'c7847eb9a317ef2df9cd21362e3f7ca5eb5eee4c', 2015, 1, 'D', NULL, NULL, NULL),
(79, 'ubuntu-nice', 'fcbacktrack@gmail.com', 'Beter', NULL, NULL, NULL, NULL, NULL, NULL, 1436934805, 1438316972, 'N', 'N', 'Europe/London', 'N', 'N', 45, 0, 45, 9, NULL, '$2a$12$2gRZCObm6TRFjDYtJNkWB.Im5qtWf8b37lo13Lvld2.pdUqWWV/NK', '0c985ab2ba444d32f1e4b6f7e3da180a', NULL, NULL, 3, 'D', NULL, NULL, NULL),
(80, 'cscscsc', 'cbcb@gmail.com', 'abc', NULL, NULL, NULL, NULL, NULL, NULL, 1437273168, 1438316972, 'N', 'N', 'Europe/London', 'N', 'N', 45, 0, 45, 9, NULL, '$2a$12$vekaV9LLvFb0UXR9ZcTEf.ySC.HcoBn50ii1aCwzTYo2fptnMUOP.', 'ada8e83d85e4855d03112ef405eba4ec', NULL, NULL, 3, 'D', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usersBadges`
--

CREATE TABLE IF NOT EXISTS `usersBadges` (
  `id` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `badge` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code1` int(10) unsigned DEFAULT NULL,
  `code2` int(10) unsigned DEFAULT NULL,
  `code3` int(1) DEFAULT NULL,
  `createdAt` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usersBadges`
--

INSERT INTO `usersBadges` (`id`, `usersId`, `badge`, `type`, `code1`, `code2`, `code3`, `createdAt`) VALUES
(1, 1, 'Scholar', NULL, NULL, NULL, 3, 1438427414),
(2, 1, 'Teacher', NULL, NULL, NULL, 3, 1438427414),
(3, 1, 'Commentator', NULL, NULL, NULL, 3, 1438427414),
(4, 1, 'Supporter', NULL, NULL, NULL, 3, 1438427414),
(5, 1, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(6, 2, 'Moderator', NULL, NULL, NULL, 3, 1438427414),
(7, 2, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(8, 3, 'Moderator', NULL, NULL, NULL, 3, 1438427414),
(9, 3, 'Commentator', NULL, NULL, NULL, 3, 1438427414),
(10, 3, 'Supporter', NULL, NULL, NULL, 3, 1438427414),
(11, 3, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(12, 45, 'Scholar', NULL, NULL, NULL, 3, 1438427414),
(13, 45, 'Teacher', NULL, NULL, NULL, 3, 1438427414),
(14, 45, 'Moderator', NULL, NULL, NULL, 3, 1438427414),
(15, 45, 'Supporter', NULL, NULL, NULL, 3, 1438427414),
(16, 45, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(17, 47, 'Scholar', NULL, NULL, NULL, 3, 1438427414),
(18, 47, 'Supporter', NULL, NULL, NULL, 3, 1438427414),
(19, 47, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(20, 48, 'Supporter', NULL, NULL, NULL, 3, 1438427414),
(21, 48, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(22, 57, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(23, 58, 'Supporter', NULL, NULL, NULL, 3, 1438427414),
(24, 59, 'Scholar', NULL, NULL, NULL, 3, 1438427414),
(25, 59, 'Teacher', NULL, NULL, NULL, 3, 1438427414),
(26, 59, 'Moderator', NULL, NULL, NULL, 3, 1438427414),
(27, 59, 'Commentator', NULL, NULL, NULL, 3, 1438427414),
(28, 59, 'Supporter', NULL, NULL, NULL, 3, 1438427414),
(29, 59, 'Critic', NULL, NULL, NULL, 3, 1438427414),
(30, 77, 'Scholar', NULL, NULL, NULL, 3, 1438427414),
(31, 77, 'Teacher', NULL, NULL, NULL, 3, 1438427414),
(32, 77, 'Supporter', NULL, NULL, NULL, 3, 1438427415),
(33, 78, 'Scholar', NULL, NULL, NULL, 1, 1438427415),
(34, 78, 'Pundit', NULL, NULL, NULL, 1, 1438427415),
(35, 78, 'Commentator', NULL, NULL, 1, 1, 1438427415),
(36, 78, 'Supporter', NULL, NULL, NULL, 1, 1438427415),
(37, 78, 'Critic', NULL, NULL, 1, 1, 1438427415);

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE IF NOT EXISTS `vote` (
  `id` int(11) unsigned NOT NULL,
  `usersId` int(11) unsigned NOT NULL,
  `objectId` int(11) unsigned NOT NULL COMMENT 'The id of object with was voted. It can be submission, comment, task etc.',
  `object` varchar(32) NOT NULL DEFAULT '' COMMENT 'The type of the object which was voted. Submission, task, comment etc.',
  `positive` int(11) NOT NULL DEFAULT '0',
  `negative` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`id`, `usersId`, `objectId`, `object`, `positive`, `negative`, `createdAt`) VALUES
(32, 20, 5, 'postsReply', 0, 1, 1428048814),
(33, 20, 1, 'postsReply', 0, 1, 1428048596),
(35, 18, 5, 'postsReply', 1, 0, 1428282097),
(36, 18, 1, 'postsReply', 1, 0, 1428282417),
(37, 1, 38, 'posts', 1, 0, 1428656834),
(38, 18, 4, 'postsReply', 1, 0, 1428049505),
(39, 18, 3, 'postsReply', 0, 1, 1428049523),
(40, 1, 3, 'posts', 0, 1, 1428158125),
(41, 1, 26, 'posts', 1, 0, 1428158132),
(42, 1, 1, 'postsReply', 0, 1, 1428857336),
(43, 18, 38, 'posts', 1, 0, 1428282100),
(44, 2, 38, 'posts', 0, 1, 1428288154),
(45, 3, 38, 'posts', 0, 1, 1428290713),
(46, 3, 41, 'posts', 1, 0, 1428643423),
(47, 3, 5, 'postsReply', 0, 1, 1428648072),
(48, 3, 1, 'postsReply', 0, 1, 1428649991),
(49, 3, 20, 'postsReply', 1, 0, 1428650248),
(50, 1, 30, 'posts', 1, 0, 1428673241),
(51, 3, 3, 'postsReply', 0, 1, 1429231319),
(52, 3, 34, 'postsReply', 1, 0, 1429251973),
(53, 3, 42, 'posts', 0, 1, 1429600102),
(54, 3, 41, 'postsReply', 0, 1, 1429263399),
(55, 1, 53, 'postsReply', 0, 1, 1429598346),
(56, 1, 49, 'postsReply', 1, 0, 1429518373),
(58, 3, 52, 'postsReply', 0, 1, 1431073926),
(59, 3, 48, 'postsReply', 1, 0, 1429521023),
(60, 1, 52, 'postsReply', 0, 1, 1429598375),
(61, 1, 39, 'postsReply', 1, 0, 1429606926),
(62, 3, 42, 'postsReply', 1, 0, 1430982481),
(63, 3, 13, 'postsReply', 0, 1, 1430982596),
(64, 3, 39, 'postsReply', 0, 1, 1430982370),
(65, 3, 12, 'postsReply', 0, 1, 1430982381),
(66, 3, 50, 'postsReply', 1, 0, 1431073937),
(67, 3, 53, 'postsReply', 0, 1, 1431076585),
(68, 3, 51, 'postsReply', 1, 0, 1431076605),
(69, 25, 27, 'posts', 0, 1, 1431166429),
(70, 27, 43, 'posts', 0, 1, 1431179252),
(71, 27, 3, 'postsReply', 1, 0, 1431183866),
(72, 27, 42, 'posts', 0, 1, 1431184935),
(73, 28, 26, 'posts', 0, 1, 1431191015),
(74, 45, 52, 'postsReply', 0, 1, 1431317639),
(75, 45, 47, 'postsReply', 1, 0, 1431424997),
(76, 45, 53, 'postsReply', 0, 1, 1431685014),
(77, 45, 44, 'posts', 0, 1, 1431712831),
(78, 47, 46, 'posts', 0, 1, 1431847616),
(79, 45, 38, 'posts', 0, 1, 1432114041),
(80, 45, 1, 'postsReply', 1, 0, 1432114047),
(81, 48, 46, 'posts', 0, 1, 1432956271),
(82, 48, 42, 'posts', 1, 0, 1432957267),
(83, 45, 46, 'posts', 1, 0, 1432974158),
(84, 45, 51, 'postsReply', 0, 1, 1432994757),
(85, 45, 33, 'postsReply', 0, 1, 1433216408),
(86, 45, 34, 'postsReply', 0, 1, 1433216414),
(87, 47, 34, 'postsReply', 0, 1, 1433226124),
(88, 47, 38, 'posts', 0, 1, 1433305977),
(89, 45, 59, 'postsReply', 1, 0, 1433649983),
(90, 45, 45, 'posts', 0, 1, 1433733969),
(91, 45, 50, 'posts', 0, 1, 1434170829),
(92, 45, 1, 'posts', 1, 0, 1434170963),
(93, 45, 52, 'posts', 1, 0, 1434170975),
(94, 57, 50, 'postsReply', 0, 1, 1434273089),
(95, 47, 71, 'postsReply', 0, 1, 1434274170),
(96, 47, 70, 'postsReply', 0, 1, 1434274188),
(97, 47, 69, 'postsReply', 0, 1, 1434274208),
(98, 45, 31, 'posts', 0, 1, 1434356897),
(99, 45, 64, 'postsReply', 0, 1, 1434421845),
(100, 58, 74, 'postsReply', 1, 0, 1434421930),
(101, 45, 74, 'postsReply', 1, 0, 1434446143),
(102, 45, 69, 'postsReply', 1, 0, 1434446147),
(103, 45, 67, 'postsReply', 1, 0, 1434446158),
(104, 45, 68, 'postsReply', 0, 1, 1434446230),
(105, 45, 6, 'postsReply', 0, 1, 1434446350),
(106, 45, 65, 'postsReply', 1, 0, 1434446766),
(107, 45, 57, 'postsReply', 1, 0, 1434446770),
(108, 45, 56, 'postsReply', 1, 0, 1434447232),
(109, 45, 44, 'postsReply', 1, 0, 1434447234),
(110, 45, 43, 'postsReply', 1, 0, 1434447240),
(111, 45, 42, 'postsReply', 1, 0, 1434447266),
(112, 45, 39, 'postsReply', 1, 0, 1434447268),
(113, 45, 73, 'postsReply', 1, 0, 1434447431),
(114, 45, 45, 'postsReply', 1, 0, 1434447461),
(115, 45, 14, 'postsReply', 1, 0, 1434447465),
(116, 45, 29, 'posts', 1, 0, 1434520731),
(117, 45, 54, 'postsReply', 1, 0, 1434520747),
(118, 59, 64, 'postsReply', 0, 1, 1434552076),
(119, 59, 1, 'posts', 0, 1, 1434802109),
(120, 47, 52, 'posts', 1, 0, 1434820357),
(121, 47, 53, 'posts', 1, 0, 1434962560),
(122, 59, 55, 'posts', 1, 0, 1435214471),
(123, 59, 73, 'postsReply', 1, 0, 1435214674),
(124, 59, 52, 'posts', 1, 0, 1435214721),
(125, 59, 75, 'postsReply', 1, 0, 1435214731),
(126, 59, 50, 'posts', 1, 0, 1435214860),
(127, 59, 66, 'postsReply', 1, 0, 1435215241),
(128, 59, 56, 'posts', 1, 0, 1435215277),
(129, 59, 57, 'posts', 1, 0, 1435215547),
(130, 59, 58, 'posts', 1, 0, 1435217007),
(131, 59, 59, 'posts', 1, 0, 1435219381),
(132, 47, 59, 'posts', 1, 0, 1435219470),
(133, 59, 62, 'postsReply', 1, 0, 1435219548),
(134, 47, 59, 'postsReply', 1, 0, 1435220289),
(135, 59, 59, 'postsReply', 1, 0, 1435220305),
(136, 47, 1, 'posts', 0, 1, 1435477112),
(137, 59, 51, 'posts', 1, 0, 1435891874),
(138, 77, 63, 'posts', 1, 0, 1435892073),
(139, 59, 64, 'posts', 1, 0, 1435892157),
(140, 59, 88, 'postsReply', 1, 0, 1435892275),
(141, 59, 89, 'postsReply', 1, 0, 1435892562),
(142, 59, 65, 'posts', 1, 0, 1435892603),
(143, 59, 81, 'postsReply', 1, 0, 1436189873),
(144, 59, 2, 'posts', 1, 0, 1436681695),
(145, 59, 66, 'posts', 1, 0, 1436681777),
(146, 59, 29, 'posts', 1, 0, 1436682088),
(147, 59, 62, 'posts', 0, 1, 1436694611),
(148, 59, 107, 'postsReply', 1, 0, 1436949607),
(149, 78, 53, 'posts', 1, 0, 1436953534),
(150, 78, 66, 'posts', 0, 1, 1437028900),
(151, 59, 67, 'postsReply', 0, 1, 1437031770),
(152, 59, 6, 'postsReply', 1, 0, 1437031773),
(153, 59, 68, 'postsReply', 1, 0, 1437031775),
(154, 59, 69, 'postsReply', 1, 0, 1437031779),
(155, 59, 60, 'posts', 1, 0, 1437031899),
(156, 78, 60, 'posts', 1, 0, 1437117625),
(157, 78, 67, 'posts', 1, 0, 1437901441),
(158, 59, 79, 'posts', 1, 0, 1438417456);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdAt` (`createdAt`),
  ADD KEY `usersId` (`usersId`),
  ADD KEY `postsId` (`postsId`);

--
-- Indexes for table `activityNotifications`
--
ALTER TABLE `activityNotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersId` (`usersId`,`wasRead`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numberPosts` (`numberPosts`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`userId`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idOrganization` (`idOrganization`,`key`);

--
-- Indexes for table `irclog`
--
ALTER TABLE `irclog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `datelog` (`datelog`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersId` (`usersId`),
  ADD KEY `postsId` (`postsId`),
  ADD KEY `sent` (`sent`);

--
-- Indexes for table `notificationsBounces`
--
ALTER TABLE `notificationsBounces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`,`reported`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersId` (`usersId`),
  ADD KEY `title` (`title`),
  ADD KEY `modifiedAt` (`modifiedAt`),
  ADD KEY `createdAt` (`createdAt`),
  ADD KEY `sticked` (`sticked`,`createdAt`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `numberReply` (`numberReply`);

--
-- Indexes for table `postsBounties`
--
ALTER TABLE `postsBounties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersId` (`usersId`,`postsReplyId`),
  ADD KEY `postsId` (`postsId`);

--
-- Indexes for table `postsHistory`
--
ALTER TABLE `postsHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postsId` (`postsId`);

--
-- Indexes for table `postsNotifications`
--
ALTER TABLE `postsNotifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersId` (`usersId`,`postsId`);

--
-- Indexes for table `postsReply`
--
ALTER TABLE `postsReply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postsId` (`postsId`),
  ADD KEY `usersId` (`usersId`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `postsReplyHistory`
--
ALTER TABLE `postsReplyHistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postsReplyId` (`postsReplyId`);

--
-- Indexes for table `postsSubscribers`
--
ALTER TABLE `postsSubscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postsId` (`postsId`);

--
-- Indexes for table `postsTags`
--
ALTER TABLE `postsTags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postsViews`
--
ALTER TABLE `postsViews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postsId` (`postsId`,`ipaddress`);

--
-- Indexes for table `rememberTokens`
--
ALTER TABLE `rememberTokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shortUrls`
--
ALTER TABLE `shortUrls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shortCode` (`shortCode`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `successLogins`
--
ALTER TABLE `successLogins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numberPosts` (`numberPosts`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `topicTracking`
--
ALTER TABLE `topicTracking`
  ADD PRIMARY KEY (`userId`);

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
  ADD KEY `accesToken` (`tokenGithub`),
  ADD KEY `email` (`email`),
  ADD KEY `karma` (`karma`),
  ADD KEY `notifications` (`notifications`);

--
-- Indexes for table `usersBadges`
--
ALTER TABLE `usersBadges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersId` (`usersId`,`badge`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `objectId` (`objectId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `activityNotifications`
--
ALTER TABLE `activityNotifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `irclog`
--
ALTER TABLE `irclog`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `notificationsBounces`
--
ALTER TABLE `notificationsBounces`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `postsBounties`
--
ALTER TABLE `postsBounties`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postsHistory`
--
ALTER TABLE `postsHistory`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT for table `postsNotifications`
--
ALTER TABLE `postsNotifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `postsReply`
--
ALTER TABLE `postsReply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `postsReplyHistory`
--
ALTER TABLE `postsReplyHistory`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `postsSubscribers`
--
ALTER TABLE `postsSubscribers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `postsTags`
--
ALTER TABLE `postsTags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=380;
--
-- AUTO_INCREMENT for table `postsViews`
--
ALTER TABLE `postsViews`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `rememberTokens`
--
ALTER TABLE `rememberTokens`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `shortUrls`
--
ALTER TABLE `shortUrls`
  MODIFY `id` int(15) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `successLogins`
--
ALTER TABLE `successLogins`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1555;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `usersBadges`
--
ALTER TABLE `usersBadges`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=159;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
