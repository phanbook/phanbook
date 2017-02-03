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
  `userId` int(11) NOT NULL,
  `metaFile` longtext NOT NULL,
  `createdAt` int(15) NOT NULL,
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
-- Dump completed on 2016-11-10 18:07:26
