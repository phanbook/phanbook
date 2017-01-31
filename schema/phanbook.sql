-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: phanbook
-- ------------------------------------------------------
-- Server version	5.7.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `type` char(1) NOT NULL,
  `postsId` int(10) unsigned DEFAULT NULL,
  `createdAt` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`),
  KEY `usersId` (`usersId`),
  KEY `postsId` (`postsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activityNotifications`
--

DROP TABLE IF EXISTS `activityNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityNotifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `postsReplyId` int(10) unsigned DEFAULT NULL,
  `type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `usersOriginId` int(10) unsigned DEFAULT NULL,
  `createdAt` int(11) unsigned DEFAULT NULL,
  `wasRead` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `extra` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`,`wasRead`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `userId` mediumint(8) unsigned NOT NULL,
  `ipaddress` int(10) unsigned NOT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `modelName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditDetail`
--

DROP TABLE IF EXISTS `auditDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditDetail` (
  `id` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auditId` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oldValue` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `newValue` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `categories` (
    `id` int(10) unsigned NOT NULL,
    `name` varchar(72) NOT NULL,
    `description` text NOT NULL,
    `slug` varchar(32) DEFAULT NULL,
    `numberPosts` int(10) unsigned DEFAULT NULL,
    `noBounty` char(1) NOT NULL DEFAULT 'N',
    `noDigest` char(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (`id`),
    KEY `categoriesNumberPosts` (`numberPosts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NOT NULL,
  `objectId` int(11) unsigned NOT NULL,
  `object` varchar(32) NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `createdAt` int(11) NOT NULL,
  `modifiedAt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failedLogins`
--

DROP TABLE IF EXISTS `failedLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failedLogins` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `usersId` INT UNSIGNED DEFAULT NULL,
    `ipAddress` INT UNSIGNED NOT NULL,
    `attempted` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    KEY `failedLoginsAttempts` (`ipAddress`, `attempted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(72) NOT NULL,
  `type` int(11) NOT NULL,
  `createdAt` int(15) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mediaType`
--

DROP TABLE IF EXISTS `mediaType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediaType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(255) NOT NULL,
  `note` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  `postsReplyId` int(10) unsigned DEFAULT NULL,
  `type` char(1) NOT NULL,
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL,
  `messageId` char(60) DEFAULT NULL,
  `sent` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`),
  KEY `postsId` (`postsId`),
  KEY `sent` (`sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notificationsBounces`
--

DROP TABLE IF EXISTS `notificationsBounces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificationsBounces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `diagnostic` varchar(120) DEFAULT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `reported` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`,`reported`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `title` varchar(128) NOT NULL,
  `link` varchar(250) DEFAULT NULL,
  `slug` varchar(64) NOT NULL,
  `content` text,
  `excerpt` text,
  `thumbnail` varchar(200) DEFAULT NULL,
  `numberViews` int(5) unsigned NOT NULL,
  `numberReply` int(3) unsigned NOT NULL,
  `sticked` char(1) DEFAULT 'N',
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL,
  `editedAt` int(11) unsigned DEFAULT NULL,
  `status` char(30) DEFAULT NULL,
  `locked` char(1) DEFAULT 'N',
  `deleted` int(3) DEFAULT '0',
  `acceptedAnswer` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`),
  KEY `title` (`title`),
  KEY `modifiedAt` (`modifiedAt`),
  KEY `createdAt` (`createdAt`),
  KEY `sticked` (`sticked`,`createdAt`),
  KEY `deleted` (`deleted`),
  KEY `numberReply` (`numberReply`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsBounties`
--

DROP TABLE IF EXISTS `postsBounties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsBounties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `postsReplyId` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  `createdAt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`,`postsReplyId`),
  KEY `postsId` (`postsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsHistory`
--

DROP TABLE IF EXISTS `postsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsHistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `createdAt` int(11) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `postsId` (`postsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsNotifications`
--

DROP TABLE IF EXISTS `postsNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsNotifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `postsId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`,`postsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsReply`
--

DROP TABLE IF EXISTS `postsReply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsReply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `content` text,
  `createdAt` int(11) unsigned DEFAULT NULL,
  `modifiedAt` int(11) unsigned DEFAULT NULL,
  `editedAt` int(11) unsigned DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `accepted` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `postsId` (`postsId`),
  KEY `usersId` (`usersId`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsReplyHistory`
--

DROP TABLE IF EXISTS `postsReplyHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsReplyHistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postsReplyId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `createdAt` int(11) unsigned NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `postsReplyId` (`postsReplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsSubscribers`
--

DROP TABLE IF EXISTS `postsSubscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsSubscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postsId` int(10) unsigned NOT NULL,
  `usersId` int(10) unsigned NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `postsId` (`postsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsTags`
--

DROP TABLE IF EXISTS `postsTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsTags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postsId` int(11) NOT NULL,
  `tagsId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postsViews`
--

DROP TABLE IF EXISTS `postsViews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postsViews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postsId` int(10) unsigned NOT NULL,
  `ipaddress` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `postsId` (`postsId`,`ipaddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rememberTokens`
--

DROP TABLE IF EXISTS `rememberTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rememberTokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(11) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `userAgent` varchar(250) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(1000) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_setting_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortUrls`
--

DROP TABLE IF EXISTS `shortUrls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortUrls` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `longUrl` varchar(255) NOT NULL,
  `shortCode` varbinary(6) NOT NULL,
  `createdAt` int(11) unsigned NOT NULL,
  `counter` int(15) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `shortCode` (`shortCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `successLogins`
--

DROP TABLE IF EXISTS `successLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `successLogins` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `usersId` INT UNSIGNED NOT NULL,
    `ipAddress` INT UNSIGNED NOT NULL,
    `userAgent` VARCHAR(250) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `successLoginsUserId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(72) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(32) DEFAULT NULL,
  `numberPosts` int(10) unsigned DEFAULT NULL,
  `noBounty` char(1) NOT NULL DEFAULT 'N',
  `noDigest` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `numberPosts` (`numberPosts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `key` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topicTracking`
--

DROP TABLE IF EXISTS `topicTracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topicTracking` (
  `userId` int(11) NOT NULL,
  `topicId` text NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `key_name` varchar(48) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` BIGINT unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(72) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `tokenType` varchar(16) DEFAULT NULL,
  `tokenGithub` char(100) DEFAULT NULL,
  `tokenGoogle` char(100) DEFAULT NULL,
  `tokenFacebook` char(100) DEFAULT NULL,
  `uid` char(50) DEFAULT NULL,
  `uuidFacebook` varchar(100) DEFAULT NULL,
  `uuidGoogle` varchar(100) DEFAULT NULL,
  `uuidGithub` varchar(100) DEFAULT NULL,
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
  `gender` int(1) NOT NULL DEFAULT '9',
  `birthdate` date DEFAULT NULL,
  `passwd` varchar(60) NOT NULL,
  `registerHash` varchar(60) DEFAULT NULL,
  `passwdForgotHash` varchar(60) DEFAULT NULL,
  `lastPasswdReset` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '3',
  `theme` char(1) DEFAULT 'D',
  `bio` text,
  `twitter` varchar(100) DEFAULT NULL,
  `github` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accessToken` (`tokenGithub`),
  KEY `email` (`email`),
  KEY `karma` (`karma`),
  KEY `notifications` (`notifications`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `users` (`id`, `username`, `email`, `firstname`, `createdAt`, `passwd`, `status`) VALUES
    (1,'admin','admin@phanbook.com','Admin', 1427816610, '$2a$12$wCpQq8iqKlKhFdwh7SgKVeEmjkuriZYje20RKq5/lN3HuNKAvb.i2', 1);

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `description` TEXT,
    `type` VARCHAR(32) NOT NULL,
    `is_special` BOOLEAN DEFAULT FALSE,
    `is_default` BOOLEAN DEFAULT FALSE,
    PRIMARY KEY(`id`),
    UNIQUE KEY `role_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `roles` (`id`, `name`, `description`, `type`, `is_special`, `is_default`) VALUES
    (1, 'Admins', 'Administrative user, has access to everything.', 'admin', true, false),
    (2, 'Moderators', 'The regular members with moderation privileges.', 'moderator', true, false),
    (3, 'Users', 'Member privileges, granted after account confirmation.', 'user', true, true),
    (4, 'Anonymous', 'Guests can only view content. Anyone browsing the site who is not signed in is considered to be a "Guest".', 'guest', true, false);

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
    `users_id` BIGINT UNSIGNED NOT NULL,
    `roles_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`users_id`, `roles_id`),
    KEY `roles_users_users_id` (`users_id`),
    KEY `roles_users_roles_id` (`roles_id`),
    FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `roles_users` (`users_id`, `roles_id`) VALUES
    (1, 1),
    (1, 2),
    (1, 3);

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object` VARCHAR(64) NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `role_id` INT UNSIGNED NOT NULL,
    `value` VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `access` (`id`, `object`, `action`, `role_id`, `value`) VALUES
    (1, 'AdminArea', 'access', 1, 'allow'),
    (2, 'AdminArea', 'access', 2, 'deny'),
    (3, 'AdminArea', 'access', 3, 'deny');

--
-- Table structure for table `usersBadges`
--

DROP TABLE IF EXISTS `usersBadges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersBadges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `badge` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `type` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code1` int(10) unsigned DEFAULT NULL,
  `code2` int(10) unsigned DEFAULT NULL,
  `code3` int(1) DEFAULT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`,`badge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(11) unsigned NOT NULL,
  `objectId` int(11) unsigned NOT NULL,
  `object` varchar(32) NOT NULL DEFAULT '',
  `positive` int(11) NOT NULL DEFAULT '0',
  `negative` int(11) NOT NULL DEFAULT '0',
  `createdAt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objectId` (`objectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `mediaType` (`id`, `name`, `code`, `note`) VALUES
(1, 'Images', 'jpg,png,bmp,gif,sgv', ''),
(2, 'Videos', 'mp4,avi,mkv', ''),
(3, 'Audios', 'mp3,wav', ''),
(4, 'Documents', 'pdf,doc,tex', ''),
(5, 'Archives', 'zip,rar', '');


INSERT INTO `template` (`id`, `name`, `key`, `subject`, `content`) VALUES
(1, 'Registration', 'registration', 'Finishing your registration on Information', '{% extends \'layouts/layoutEmail.volt\' %}\r\n{% block subject %}{{ subject }}{% endblock %}\r\n{% block content %}\r\n    <p class=\"h5\">Down below you will find the link where you can setup your password</p>\r\n    <br />\r\n    <p class=\"h5\"><a href=\"{{ link }}\">Click here to setup your password</a></p>\r\n{% endblock %}'),
(2, 'Forgot Password', 'forgotpassword', 'Reset your password', '<h5>Hello {{ firstname }} {{ lastname }},</h5>\r\n<p>Below you will find the link that you have requested to reset your password</p>\r\n<h4><a href=\"{{ link }}\">Change my password</a></h4>'),
(6, 'Test', 'test', 'Phanbook TEST', 'This is a test email. \r\n\r\n© {{ date(\'Y\') }} Phanbook'),
(7, 'Right side theme default', 'rightside', 'Right sidebar', '<!-- begin right-sidebar -->\r\n<div id=\"right-sidebar\" class=\"sidebar\">\r\n    <div class=\"spacer\">\r\n        <form role=\"search\" id=\"search-right\" action=\"/search\">\r\n            <input type=\"text\" tabindex=\"20\" placeholder=\"{{t(\'search\')}}\" name=\"q\">\r\n            <input type=\"submit\" tabindex=\"22\" value=\"\">\r\n        </form>\r\n    </div>\r\n    <div class=\"spacer\">\r\n        <div class=\"sidebox submit submit-link\">\r\n            <div class=\"morelink\" data-descr=\"Please remember to read the rules. Thank you!\">\r\n                <a target=\"_top\" class=\"login-required\" href=\"/hackernew/submit\">{{t(\'Submit a new link\')}}</a>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    {% if post is defined and this.view.getActionName() == \'view\'%}\r\n        <div class=\"spacer\">\r\n            <div class=\"linkinfo\">\r\n                <div class=\"date\">\r\n                    <span>this post was submitted on</span>\r\n                    <time datetime=\"{{date(\'Y-M-D h:i\', post.getCreatedAt())}}\">{{ date(\'d M Y\', post.getCreatedAt())}}</time>\r\n                </div>\r\n                <div class=\"score\">\r\n                    <span class=\"number\">{{ post.getBounty()[\'value\'] ? post.getBounty()[\'value\'] : 0 }}</span>\r\n                    <span class=\"word\">points</span> (95% upvoted)\r\n                </div>\r\n                <div class=\"shortlink\">shortlink:\r\n                    <input type=\"text\" id=\"shortlink-text\" readonly=\"readonly\" value=\"http://phanbook.com\">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    {% endif %}\r\n    <div class=\"spacer\">\r\n        <div class=\"titlebox\">\r\n            <h1 class=\"hover redditname\">\r\n                <a class=\"hover\" href=\"p/PHP/\">PHP</a>\r\n            </h1>\r\n            <span data-sr_name=\"PHP\" class=\"fancy-toggle-button subscribe-button toggle\">\r\n                {% if 1 == 1 %}\r\n                    <a href=\"#\" class=\"add\" data-descr=\"Subscribe!\">subscribe</a>\r\n                {% else %}\r\n                    <a href=\"#\" class=\"remove\" data-descr=\"Unsubscribe!\">unsubscribe</a>\r\n                {% endif %}\r\n            </span>\r\n            <span class=\"subscribers\"><span class=\"number\">37,215</span> <span class=\"word\">readers</span></span>\r\n            <div class=\"usertext-body may-blank-within md-container \">\r\n                <div class=\"md\"><p><a href=\"/p/PHP/wiki/index\">Subphannook FAQ</a></p>\r\n\r\n                    <p>{{t(\'Releases\')}}: <a href=\"http://php.net/downloads.php\">Current Releases</a>, <a href=\"http://windows.php.net/download/\">Windows Releases</a>, <a href=\"http://museum.php.net/\">Old Releases</a></p>\r\n\r\n                    <p>Sources: <a href=\"https://svn.php.net/viewvc/\">Subversion</a>, <a href=\"https://git.php.net/\">Git</a>, <a href=\"http://lxr.php.net/\">Source Search</a></p>\r\n\r\n                    <p><a href=\"/\">Contribute to the PHP Documentation</a></p>\r\n\r\n                    <p>Related subreddits:\r\n                        <a href=\"/p/css\">CSS</a>, <a href=\"/p/javascript\">JavaScript</a>,\r\n                        <a href=\"/p/web-design\">Web Design</a>, <a href=\"/p/wordpress\">Wordpress</a>, <a href=\"/p/webdev\">WebDev</a>\r\n                    </p>\r\n\r\n                    <p>Join <a href=\"http://chat.phalcontip.com\">#phalcon</a> on Freenode!</p>\r\n\r\n                    <hr>\r\n\r\n                    <p><a href=\"/p/PHP\">/p/PHP</a> is not a support subphanbook. Please visit <a href=\"/p/phphelp\">/p/phphelp</a> for help, or connect to <a href=\"http://chat.phalcontip.com\">##php on Slack chat</a> (<a href=\"https://slack.com/faq.shtml#thien\">you registration required</a>)</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class=\"spacer\">\r\n        <a href=\"\">\r\n        {{image(\'images/sponsor.png\')}}\r\n        </a>\r\n    </div>\r\n    <div id=\"hot-network-questions\" class=\"spacer\">\r\n        <h4>\r\n            {{ link_to(\'posts/hot\', t(\'Hot Network Community\')) }}\r\n        </h4>\r\n        <ul class=\"widget\">\r\n                {% for hot in hotPosts %}\r\n                    <li>\r\n                        <p>\r\n                            <span class=\"number\"> {{ hot.getNumberReply() }}</span>\r\n                            <span class=\"text\">\r\n                            {{ link_to(hot.getType() ~ \'/\' ~ hot.getId() ~ \'/\' ~ hot.getSlug(), hot.getTitle())}}</span>\r\n                        </p>\r\n                    </li>\r\n                {% endfor %}\r\n        </ul>\r\n    </div><!-- hot-network-questions -->\r\n</div>\r\n'),
(8, 'SendSpool', 'sendspool', 'Send Spool', '{# The template use for send mail when have a reply or comment on post#}\r\n<h5>Hello {{ name }} </h5>\r\n{{ content }}\r\n<p style=\"font-size:small;-webkit-text-size-adjust:none;color:#717171;\">\r\n&mdash;<br>Reply to this email directly or view the complete thread on\r\n<a href=\"{{ link }}\">{{ this.config.application.name }}</a>\r\nChange your e-mail preferences <a href=\"{{this.config.application.publicUrl}}/settings\">here</a></p>\r\n</p>\r\n'),
(9, 'Send Digest', 'senddigest', 'Top stories', '{# The template use for send digest#}\r\n<html><head></head>\r\n<body>\r\n    <h5>Hello {{ username }} </h5>\r\n    <h3> A brief summary of {{this.config.application.name}} since your last visit on last week </h3>\r\n    {% for post in posts %}\r\n        <p><a class=\"title\" href=\"{{ post[\'link\'] }}\"> {{ post[\'title\'] }}</a></p>\r\n\r\n        <p> {{ post[\'content\']}} <a class=\"read-more\" href=\"{{ post[\'link\'] }}\">Read more</a></p>\r\n\r\n        <hr style=\"border: 1px solid #dadada\">\r\n    {% endfor %}\r\n    <p class=\"footer\">\r\n        &mdash;<br>Reply to this email directly or view the complete thread on\r\n        <a href=\"{{ post[\'link\'] }}\">{{ this.config.application.name }}</a>\r\n        Change your e-mail preferences <a href=\"{{this.config.application.publicUrl}}/settings\">here</a>\r\n    </p>\r\n\r\n</body></html>\r\n<style type=\"text/css\">\r\n    h1 {\r\n        font-size:22px;\r\n        color:#333;letter-spacing:-0.5px;\r\n        line-height:1.25;\r\n        font-weight:normal;\r\n        padding:16px 0;\r\n        border-bottom:1px solid #e2e2e2\r\n    }\r\n    a.title {\r\n        text-decoration:none;\r\n        display:block;font-size:20px;\r\n        color:#333;letter-spacing:-0.5px;\r\n        line-height:1.25;\r\n        font-weight:normal;\r\n        color:#155fad\r\n    }\r\n    p.footer {\r\n        font-size:small;\r\n        -webkit-text-size-adjust:none;\r\n        color:#717171;\r\n    }\r\n    a.read-more{\r\n        color:#155fad;\r\n    }\r\n\r\n</style>\r\n');


-- Dump completed on 2016-11-10 18:07:26
