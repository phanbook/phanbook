-- phpMyAdmin SQL Dump
-- version 4.5.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2016 at 05:16 AM
-- Server version: 5.5.44-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phanbook_prd`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `usersId`, `type`, `postsId`, `createdAt`) VALUES
(1, 1, 'U', NULL, 1438506426),
(2, 2, 'U', NULL, 1438511085),
(3, 2, 'P', 1, 1438511582),
(4, 3, 'U', NULL, 1438511719);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE IF NOT EXISTS `audit` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userId` mediumint(8) unsigned NOT NULL,
  `ipaddress` int(10) unsigned NOT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `modelName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auditDetail`
--

CREATE TABLE IF NOT EXISTS `auditDetail` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auditId` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oldValue` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `newValue` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(0, 0, '14.169.15.36', 1438512078);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL,
  `username` varchar(72) NOT NULL,
  `type` int(11) NOT NULL,
  `createdAt` int(15) NOT NULL,
  `filename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mediaType`
--

CREATE TABLE IF NOT EXISTS `mediaType` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(255) NOT NULL,
  `note` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mediaType`
--

INSERT INTO `mediaType` (`id`, `name`, `code`, `note`) VALUES
(1, 'Images', 'jpg,png,bmp,gif,sgv', ''),
(2, 'Videos', 'mp4,avi,mkv', ''),
(3, 'Audios', 'mp3,wav', ''),
(4, 'Documents', 'pdf,doc,tex', ''),
(5, 'Archives', 'zip,rar', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `usersId`, `postsId`, `postsReplyId`, `type`, `createdAt`, `modifiedAt`, `messageId`, `sent`) VALUES
(1, 1, 1, NULL, 'P', 1438511582, NULL, NULL, 'N');

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
  `excerpt` text,
  `thumbnail` varchar(200) DEFAULT NULL,
  `numberViews` int(5) unsigned NOT NULL,
  `numberReply` int(3) unsigned NOT NULL,
  `sticked` char(1) DEFAULT 'N',
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL COMMENT 'This is update time when user owner post',
  `editedAt` int(11) unsigned DEFAULT NULL COMMENT 'This is update time when modarator or admin edit post',
  `status` char(30) DEFAULT NULL,
  `locked` char(1) DEFAULT 'N',
  `deleted` int(3) DEFAULT '0',
  `acceptedAnswer` char(1) DEFAULT 'N'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `usersId`, `type`, `title`, `link`, `slug`, `content`, `excerpt`, `thumbnail`, `numberViews`, `numberReply`, `sticked`, `createdAt`, `modifiedAt`, `editedAt`, `status`, `locked`, `deleted`, `acceptedAnswer`) VALUES
(1, 1, 'blog', 'Welcome to Phanbook', NULL, 'welcome-to-phanbook', 'Hi, welcome to the Phanbook official . We plan to help  answers your questions,  share articles, tutorials and tips from the community and the anybody developers. All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented:\r\n\r\n##Weekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.\r\n\r\n##Badges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here.\r\n\r\n##Notifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system\r\n\r\n##Subscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.\r\n\r\n##Light Theme\r\n\r\nNow you can change the standard Dark theme used for code highlighting to a Lighter theme similar to the one used by Github here.\r\n\r\nWe hope you enjoy all these new features. If you want to implement new features or improve something, remember that the forum source code is published on Github.\r\n\r\nThanks!', NULL, NULL, 0, 0, 'Y', 1438511582, 1438511582, NULL, 'publish', 'N', 0, 'N');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postsNotifications`
--

CREATE TABLE IF NOT EXISTS `postsNotifications` (
  `id` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postsNotifications`
--

INSERT INTO `postsNotifications` (`id`, `usersId`, `postsId`) VALUES
(16, 2, 1),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postsSubscribers`
--

CREATE TABLE IF NOT EXISTS `postsSubscribers` (
  `id` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `createdAt` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postsTags`
--

CREATE TABLE IF NOT EXISTS `postsTags` (
  `id` int(11) NOT NULL,
  `postsId` int(11) NOT NULL,
  `tagsId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postsTags`
--

INSERT INTO `postsTags` (`id`, `postsId`, `tagsId`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `postsViews`
--

CREATE TABLE IF NOT EXISTS `postsViews` (
  `id` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `ipaddress` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postsViews`
--

INSERT INTO `postsViews` (`id`, `postsId`, `ipaddress`) VALUES
(1, 1, '14.169.15.36'),
(2, 1, '66.249.67.87');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rememberTokens`
--

INSERT INTO `rememberTokens` (`id`, `usersId`, `token`, `userAgent`, `createdAt`) VALUES
(1, 1, '16632f08d3ca7a14f33d8fbb6e967a75', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438506426),
(2, 2, 'b501da7408befba88d12911586e7081a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438511180),
(3, 3, 'be0d02e23c9a865580540b38586d80a6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438511719),
(4, 1, 'b501da7408befba88d12911586e7081a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438511745),
(5, 3, '376959a80b22a340f7cf64c725d61110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438511864),
(6, 1, '8df47c2c39e5da06abef09e839a27d2c', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0', 1438512127);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `note`) VALUES
(1, 'googleAnalyticAccessToken', '{"access_token":"ya29.FQKKnvAkiWAw4V2eOz2ObjbacSArkED6J7AIvdpDSVLy2p3rW5uRs2RQP5hyfw-494rkwA","token_type":"Bearer","expires_in":3600,"refresh_token":"1\\/9GIaQln-tIrVg08hrC72znC-LREX5P_Oon_yW1TBIn5IgOrJDtdun6zK6XiATCKT","created":1445574098}', ''),
(3, 'googleAnalyticRefreshToken', '1/9GIaQln-tIrVg08hrC72znC-LREX5P_Oon_yW1TBIn5IgOrJDtdun6zK6XiATCKT', ''),
(4, 'googleAnalyticProfileId', '104463261', ''),
(5, 'googleAnalyticAccountId', '47328645', ''),
(6, 'googleAnalyticTopActivities', '[{"code":"pageviews","name":"Total Page Views","default":1},{"code":"visits","name":"Total Visits","default":1},{"code":"timeOnPage","name":"Total Time On Page","default":1},{"code":"bounceRate","name":"Bounce Rate","default":1}]', ''),
(7, 'googleAnalyticTrackingId', 'UA-47328645-4', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `successLogins`
--

CREATE TABLE IF NOT EXISTS `successLogins` (
  `id` int(15) NOT NULL,
  `usersId` int(15) NOT NULL,
  `ipAddress` varchar(100) NOT NULL,
  `userAgent` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `successLogins`
--

INSERT INTO `successLogins` (`id`, `usersId`, `ipAddress`, `userAgent`) VALUES
(1, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(2, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(3, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(4, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(5, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(6, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(7, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(8, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(9, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(10, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(11, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(12, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(13, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(14, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(15, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(16, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(17, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(18, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(19, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(20, 2, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(21, 3, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(22, 3, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(23, 3, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(24, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(25, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(26, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(27, 3, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(28, 3, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(29, 3, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(30, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(31, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(32, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(33, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(34, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(35, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(36, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(37, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(38, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(39, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(40, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(41, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(42, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(43, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(44, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(45, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0'),
(46, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `description`, `slug`, `numberPosts`, `noBounty`, `noDigest`) VALUES
(1, 'Meta', 'Meta tags is general discussion about the site itself', 'meta', 2, 'N', 'N'),
(2, 'Phanbook', 'The best forum build on Phalcon', 'phanbook', NULL, 'N', 'N');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `key`, `subject`, `content`) VALUES
(1, 'Registration', 'registration', 'Finishing your registration on Information', '{% extends ''layouts/layoutEmail.volt'' %}\r\n{% block subject %}{{ subject }}{% endblock %}\r\n{% block content %}\r\n    <p class="h5">Down below you will find the link where you can setup your password</p>\r\n    <br />\r\n    <p class="h5"><a href="{{ link }}">Click here to setup your password</a></p>\r\n{% endblock %}'),
(2, 'Forgot Password', 'forgotpassword', 'Reset your password', '<h5>Hello {{ firstname }} {{ lastname }},</h5>\r\n<p>Below you will find the link that you have requested to reset your password</p>\r\n<h4><a href="{{ link }}">Change my password</a></h4>'),
(6, 'Test', 'test', 'Phanbook TEST', 'This is a test email. \r\n\r\n© {{ date(''Y'') }} Phanbook'),
(7, 'Right side theme default', 'rightside', 'Right sidebar', '<!-- begin right-sidebar -->\r\n<div id="right-sidebar" class="sidebar">\r\n    <div class="spacer">\r\n        <form role="search" id="search-right" action="/search">\r\n            <input type="text" tabindex="20" placeholder="{{t(''search'')}}" name="q">\r\n            <input type="submit" tabindex="22" value="">\r\n        </form>\r\n    </div>\r\n    <div class="spacer">\r\n        <div class="sidebox submit submit-link">\r\n            <div class="morelink" data-descr="Please remember to read the rules. Thank you!">\r\n                <a target="_top" class="login-required" href="/hackernew/submit">{{t(''Submit a new link'')}}</a>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    {% if post is defined and this.view.getActionName() == ''view''%}\r\n        <div class="spacer">\r\n            <div class="linkinfo">\r\n                <div class="date">\r\n                    <span>this post was submitted on</span>\r\n                    <time datetime="{{date(''Y-M-D h:i'', post.getCreatedAt())}}">{{ date(''d M Y'', post.getCreatedAt())}}</time>\r\n                </div>\r\n                <div class="score">\r\n                    <span class="number">{{ post.getBounty()[''value''] ? post.getBounty()[''value''] : 0 }}</span>\r\n                    <span class="word">points</span> (95% upvoted)\r\n                </div>\r\n                <div class="shortlink">shortlink:\r\n                    <input type="text" id="shortlink-text" readonly="readonly" value="http://phanbook.com">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    {% endif %}\r\n    <div class="spacer">\r\n        <div class="titlebox">\r\n            <h1 class="hover redditname">\r\n                <a class="hover" href="p/PHP/">PHP</a>\r\n            </h1>\r\n            <span data-sr_name="PHP" class="fancy-toggle-button subscribe-button toggle">\r\n                {% if 1 == 1 %}\r\n                    <a href="#" class="add" data-descr="Subscribe!">subscribe</a>\r\n                {% else %}\r\n                    <a href="#" class="remove" data-descr="Unsubscribe!">unsubscribe</a>\r\n                {% endif %}\r\n            </span>\r\n            <span class="subscribers"><span class="number">37,215</span> <span class="word">readers</span></span>\r\n            <div class="usertext-body may-blank-within md-container ">\r\n                <div class="md"><p><a href="/p/PHP/wiki/index">Subphannook FAQ</a></p>\r\n\r\n                    <p>{{t(''Releases'')}}: <a href="http://php.net/downloads.php">Current Releases</a>, <a href="http://windows.php.net/download/">Windows Releases</a>, <a href="http://museum.php.net/">Old Releases</a></p>\r\n\r\n                    <p>Sources: <a href="https://svn.php.net/viewvc/">Subversion</a>, <a href="https://git.php.net/">Git</a>, <a href="http://lxr.php.net/">Source Search</a></p>\r\n\r\n                    <p><a href="/">Contribute to the PHP Documentation</a></p>\r\n\r\n                    <p>Related subreddits:\r\n                        <a href="/p/css">CSS</a>, <a href="/p/javascript">JavaScript</a>,\r\n                        <a href="/p/web-design">Web Design</a>, <a href="/p/wordpress">Wordpress</a>, <a href="/p/webdev">WebDev</a>\r\n                    </p>\r\n\r\n                    <p>Join <a href="http://chat.phalcontip.com">#phalcon</a> on Freenode!</p>\r\n\r\n                    <hr>\r\n\r\n                    <p><a href="/p/PHP">/p/PHP</a> is not a support subphanbook. Please visit <a href="/p/phphelp">/p/phphelp</a> for help, or connect to <a href="http://chat.phalcontip.com">##php on Slack chat</a> (<a href="https://slack.com/faq.shtml#thien">you registration required</a>)</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class="spacer">\r\n        <a href="">\r\n        {{image(''images/sponsor.png'')}}\r\n        </a>\r\n    </div>\r\n    <div id="hot-network-questions" class="spacer">\r\n        <h4>\r\n            {{ link_to(''posts/hot'', t(''Hot Network Community'')) }}\r\n        </h4>\r\n        <ul class="widget">\r\n                {% for hot in hotPosts %}\r\n                    <li>\r\n                        <p>\r\n                            <span class="number"> {{ hot.getNumberReply() }}</span>\r\n                            <span class="text">\r\n                            {{ link_to(hot.getType() ~ ''/'' ~ hot.getId() ~ ''/'' ~ hot.getSlug(), hot.getTitle())}}</span>\r\n                        </p>\r\n                    </li>\r\n                {% endfor %}\r\n        </ul>\r\n    </div><!-- hot-network-questions -->\r\n</div>\r\n'),
(8, 'SendSpool', 'sendspool', 'Send Spool', '{# The template use for send mail when have a reply or comment on post#}\r\n<h5>Hello {{ name }} </h5>\r\n{{ content }}\r\n<p style="font-size:small;-webkit-text-size-adjust:none;color:#717171;">\r\n&mdash;<br>Reply to this email directly or view the complete thread on\r\n<a href="{{ link }}">{{ this.config.application.name }}</a>\r\nChange your e-mail preferences <a href="{{this.config.application.publicUrl}}/settings">here</a></p>\r\n</p>\r\n'),
(9, 'Send Digest', 'senddigest', 'Top stories', '{# The template use for send digest#}\r\n<html><head></head>\r\n<body>\r\n    <h5>Hello {{ username }} </h5>\r\n    <h3> A brief summary of {{this.config.application.name}} since your last visit on last week </h3>\r\n    {% for post in posts %}\r\n        <p><a class="title" href="{{ post[''link''] }}"> {{ post[''title''] }}</a></p>\r\n\r\n        <p> {{ post[''content'']}} <a class="read-more" href="{{ post[''link''] }}">Read more</a></p>\r\n\r\n        <hr style="border: 1px solid #dadada">\r\n    {% endfor %}\r\n    <p class="footer">\r\n        &mdash;<br>Reply to this email directly or view the complete thread on\r\n        <a href="{{ post[''link''] }}">{{ this.config.application.name }}</a>\r\n        Change your e-mail preferences <a href="{{this.config.application.publicUrl}}/settings">here</a>\r\n    </p>\r\n\r\n</body></html>\r\n<style type="text/css">\r\n    h1 {\r\n        font-size:22px;\r\n        color:#333;letter-spacing:-0.5px;\r\n        line-height:1.25;\r\n        font-weight:normal;\r\n        padding:16px 0;\r\n        border-bottom:1px solid #e2e2e2\r\n    }\r\n    a.title {\r\n        text-decoration:none;\r\n        display:block;font-size:20px;\r\n        color:#333;letter-spacing:-0.5px;\r\n        line-height:1.25;\r\n        font-weight:normal;\r\n        color:#155fad\r\n    }\r\n    p.footer {\r\n        font-size:small;\r\n        -webkit-text-size-adjust:none;\r\n        color:#717171;\r\n    }\r\n    a.read-more{\r\n        color:#155fad;\r\n    }\r\n\r\n</style>\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `firstname`, `lastname`, `tokenType`, `tokenGithub`, `tokenGoogle`, `tokenFacebook`, `uid`, `createdAt`, `modifiedAt`, `notifications`, `digest`, `timezone`, `moderator`, `admin`, `karma`, `vote`, `votePoint`, `gender`, `birthdate`, `passwd`, `registerHash`, `passwdForgotHash`, `lastPasswdReset`, `status`, `theme`, `bio`, `twitter`, `github`) VALUES
(1, 'admin', 'hello@phanbook.com', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, 1438511085, 1438511582, 'Y', 'Y', 'Europe/London', 'Y', 'Y', 55, 1, 0, 9, NULL, '$2a$12$wCpQq8iqKlKhFdwh7SgKVeEmjkuriZYje20RKq5/lN3HuNKAvb.i2', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL),
(3, 'moderator', 'moderator@phanbook.com', 'Moderator', NULL, 'bearer', NULL, NULL, NULL, '11265355', 1438511719, 1438511719, 'Y', 'Y', 'Europe/London', 'Y', 'N', 50, 0, 50, 9, NULL, '$2a$12$wCpQq8iqKlKhFdwh7SgKVeEmjkuriZYje20RKq5/lN3HuNKAvb.i2', NULL, NULL, NULL, 1, 'D', NULL, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditDetail`
--
ALTER TABLE `auditDetail`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mediaType`
--
ALTER TABLE `mediaType`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `activityNotifications`
--
ALTER TABLE `activityNotifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mediaType`
--
ALTER TABLE `mediaType`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `notificationsBounces`
--
ALTER TABLE `notificationsBounces`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `postsBounties`
--
ALTER TABLE `postsBounties`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postsHistory`
--
ALTER TABLE `postsHistory`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postsNotifications`
--
ALTER TABLE `postsNotifications`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `postsReply`
--
ALTER TABLE `postsReply`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postsReplyHistory`
--
ALTER TABLE `postsReplyHistory`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postsSubscribers`
--
ALTER TABLE `postsSubscribers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `postsTags`
--
ALTER TABLE `postsTags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `postsViews`
--
ALTER TABLE `postsViews`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rememberTokens`
--
ALTER TABLE `rememberTokens`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `shortUrls`
--
ALTER TABLE `shortUrls`
  MODIFY `id` int(15) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `successLogins`
--
ALTER TABLE `successLogins`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `usersBadges`
--
ALTER TABLE `usersBadges`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER TABLE `users` ADD `uuidGithub` VARCHAR(100) NULL AFTER `uid`;
ALTER TABLE `users` ADD `uuidGoogle` VARCHAR(100) NULL AFTER `uid`;
ALTER TABLE `users` ADD `uuidFacebook` VARCHAR(100) NULL AFTER `uid`;
