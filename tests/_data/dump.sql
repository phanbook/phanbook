/* Replace this file with actual dump of your database */
-- phpMyAdmin SQL Dump
-- version 4.5.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2015 at 10:55 AM
-- Server version: 5.5.41-MariaDB
-- PHP Version: 5.4.16

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
(0, 0, '14.169.15.36', 1438512078);

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
(3, 'about', 'About us', '<p>\r\n                   Phanbook is an open source project and depends on volunteer efforts.\r\n                    If you want to improve this forum please submit a\r\n                   <a href="https://help.github.com/articles/creating-a-pull-request">pull request</a>\r\n                 to its <a href="https://github.com/phanbook/phanbook">repository</a>.\r\n               </p>', 1437719274, 1437719299),
(4, 'markdown', 'Markdown', '<p>\r\n                    This forum allows you to use Markdown as markup language when creating posts or adding comments. Markdown\r\n                   is also used by Github so it''s probably familiar to you. The following guide explain its basic syntax:\r\n             </p>\r\n\r\n                <p>\r\n                 <h3>Bold and Italics</h3>\r\n               </p>\r\n\r\n            <p>\r\n                 <pre>\r\n            *single asterisks*\r\n\r\n            _single underscores_\r\n\r\n            **double asterisks**\r\n\r\n            __double underscores__\r\n            </pre>\r\n            </p>\r\n\r\n\r\n             <p>\r\n                 <h3>Headings</h3>\r\n                   H1 is underlined using equal signs, and H2 is underlined using dashes.\r\n              </p>\r\n                <p>\r\n                 <pre>\r\n            Header 1\r\n            ========\r\n\r\n            Header 2</pre>\r\n             </p>\r\n\r\n                <p>\r\n                 <h3>Headings</h3>\r\n                   Atx-style headers use 1-6 hash characters at the start of the line.\r\n             </p>\r\n                <p>\r\n                 <pre>\r\n            # Header 1\r\n            ## Header 2\r\n            ### Header 3\r\n            #### Header 4\r\n            ##### Header 5\r\n            ###### Header 6\r\n            </pre>\r\n              </p>\r\n\r\n                <p>\r\n                 <h3>Paragraphs</h3>\r\n                 A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines.\r\n              </p>\r\n\r\n            <p>\r\n            <pre>\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla neque nisl, fringilla sed blandit non, pretium eu odio.\r\n\r\n            Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n            Nulla neque nisl, fringilla sed blandit non, pretium eu odio.\r\n            </pre>\r\n            </p>\r\n\r\n               <p>\r\n                 <h3>Unordered Lists</h3>\r\n                    Start each line with hyphens, asterisks or pluses.\r\n              </p>\r\n\r\n            <p>\r\n            <pre>\r\n            * one\r\n            * two\r\n            * three\r\n            </pre>\r\n            </p>\r\n\r\n             <p>\r\n                 <h3>Ordered Lists Core</h3>\r\n                 Start each line with number and a period.\r\n               </p>\r\n\r\n            <p>\r\n            <pre>\r\n            1. one\r\n            2. two\r\n            3. three\r\n            </pre>\r\n            </p>\r\n\r\n              <p>\r\n                 <h3>Code Blocks</h3>\r\n                </p>\r\n\r\n            **Preferred method**\r\n            <p>\r\n            <pre>\r\n            ```php\r\n            &lt;?php\r\n\r\n            require __DIR__ . ''/vendor/autoload.php'';\r\n            ```\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            ```\r\n            $ cd cphalcon/build\r\n            $ sudo ./install\r\n            ```\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            Lorem ipsum dolor sit amet\r\n\r\n                consectetur adipiscing elit.\r\n                Nulla neque nisl, fringilla sed blandit non, pretium eu odio.\r\n            </pre>\r\n            </p>\r\n\r\n\r\n\r\n\r\n            <p>\r\n               <h3>Inline Code</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            Don''t forget to add `echo $foo;`.\r\n\r\n            Please replace `&lt;b&gt;` to `&lt;strong&gt;`.\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n              <h3>Horizontal Rules</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            * * *\r\n\r\n            *******\r\n\r\n            - - - -\r\n\r\n            --------\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n               <h3>Inline Links</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            This is an [inline link](http://example.com).\r\n\r\n            This [link](http://example.com "example website") has title attribute.\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            This is an [reference style link][id1].\r\n\r\n            This [link][id2] has title attribute.\r\n\r\n            [id1]: http://example.com/\r\n            [id2]: http://example.com/ "example website"\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n               <h3>Inline Images</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            ![Alt text](/path/to/image.png)\r\n\r\n            ![Alt text](/path/to/image.png "Title")\r\n            </pre>\r\n            </p>\r\n\r\n            <p>\r\n               <h3>Tables</h3>\r\n            </p>\r\n\r\n            <p>\r\n            <pre>\r\n            | head | head |\r\n            |------|------|\r\n            | body | body |\r\n            </pre>\r\n            </p>\r\n\r\n            </div>', 1437806442, 1437806442),
(5, 'moderation', 'Moderation', '<p>\r\n                    Moderators have special authority, they are community facilitators, they can edit or delete your posts or comments.\r\n                 In order to maintain our community, moderators reserve the right to remove any content and any user account for any reason at any time.\r\n             </p>\r\n\r\n                <p>\r\n                 Most of the time, moderation will be limited to correcting small details in posts or comments, improve grammar,\r\n                 fix occasional details in the code, fix links, etc.\r\n             </p>\r\n\r\n                <p>\r\n                 A moderator is not required to answer questions or make decisions.\r\n              </p>', 1437806487, 1437806487),
(6, 'vote', 'Vote', '<p>\r\n                    Posts and comments can be voted up or down. Voting enable the community to\r\n                  collectively identify the best (and worst) contributions. However, votes aren''t unlimited.\r\n                 Every time you win 50 points of karma the forum assing you a vote.\r\n                  You can only vote once every post or comment. You can spend\r\n                 your votes by voting positively or negatively posts and comments in the forum.\r\n              </p>\r\n\r\n                <p>\r\n                 When your posts or comments have been voted your karma is increased or decreased depending on the karma of who you get the vote.\r\n                    When you receive votes from the original poster you get an extra number of points on your karma.\r\n                </p>\r\n\r\n                <p>\r\n                 You can see how many votes you have on your  <a href =''http://phanbook.com''> settings</a> page.\r\n               </p>', 1437806743, 1437806743);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `usersId`, `type`, `title`, `link`, `slug`, `content`, `numberViews`, `numberReply`, `sticked`, `createdAt`, `modifiedAt`, `editedAt`, `status`, `locked`, `deleted`, `acceptedAnswer`) VALUES
(1, 1, 'tips', 'Welcome to Phanbook', NULL, 'welcome-to-phanbook', 'Hi, welcome to the Phanbook official . We plan to help  answers your questions,  share articles, tutorials and tips from the community and the anybody developers. All this interesting content will be available soon. We think you’re going to love it. Also we have features implemented:\r\n\r\n##Weekly Digest\r\n\r\nA weekly digest is now sent to all users registered in the forum. This email summarizes the most important posts in the last week. A great resource if you want to learn more about the framework. If you don''t want to receive this weekly e-mail you can update your e-mail preferences.\r\n\r\n##Badges\r\n\r\nBadges are awards that reward users for their contributions, collaboration and participation in the forum. Badges enable the community to collectively identify the best contributors. Check the available badges here.\r\n\r\n##Notifications\r\n\r\nAll activity that occurs in the posts where you have been participated is now centralized in the notifications. You can see them anytime here. Improved search system\r\n\r\n##Subscription to Posts\r\n\r\nNow you can subscribe to a post, by doing this you''ll receive e-mail notifications on topics you''re waiting answers without having to participate/comment.\r\n\r\n##Light Theme\r\n\r\nNow you can change the standard Dark theme used for code highlighting to a Lighter theme similar to the one used by Github here.\r\n\r\nWe hope you enjoy all these new features. If you want to implement new features or improve something, remember that the forum source code is published on Github.\r\n\r\nThanks!', 0, 0, 'Y', 1438511582, 1438511582, NULL, 'A', 'N', 0, 'N');

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

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
(44, 1, '14.169.15.36', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:39.0) Gecko/20100101 Firefox/39.0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `key`, `subject`, `content`) VALUES
(1, 'Registration', 'registration', 'Finishing your registration on Information', '{% extends ''layouts/layoutEmail.volt'' %}\r\n{% block subject %}{{ subject }}{% endblock %}\r\n{% block content %}\r\n    <p class="h5">Down below you will find the link where you can setup your password</p>\r\n    <br />\r\n    <p class="h5"><a href="{{ link }}">Click here to setup your password</a></p>\r\n{% endblock %}'),
(2, 'Forgot Password', 'forgotpassword', 'Reset your password', '<h5>Hello {{ firstname }} {{ lastname }},</h5>\r\n<p>Below you will find the link that you have requested to reset your password</p>\r\n<h4><a href="{{ link }}">Change my password</a></h4>'),
(6, 'Test', 'test', 'Phanbook TEST', 'This is a test email. \r\n\r\n© {{ date(''Y'') }} Phanbook'),
(7, 'Right side theme default', 'rightside', 'Right sidebar', '<!-- begin right-sidebar -->\r\n<div id="right-sidebar" class="sidebar">\r\n    <div class="spacer">\r\n        <form role="search" id="search-right" action="/search">\r\n            <input type="text" tabindex="20" placeholder="{{t(''search'')}}" name="q">\r\n            <input type="submit" tabindex="22" value="">\r\n        </form>\r\n    </div>\r\n    <div class="spacer">\r\n        <div class="sidebox submit submit-link">\r\n            <div class="morelink" data-descr="Please remember to read the rules. Thank you!">\r\n                <a target="_top" class="login-required" href="/hackernew/submit">{{t(''Submit a new link'')}}</a>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    {% if post is defined and this.view.getActionName() == ''view''%}\r\n        <div class="spacer">\r\n            <div class="linkinfo">\r\n                <div class="date">\r\n                    <span>this post was submitted on</span>\r\n                    <time datetime="{{date(''Y-M-D h:i'', post.getCreatedAt())}}">{{ date(''d M Y'', post.getCreatedAt())}}</time>\r\n                </div>\r\n                <div class="score">\r\n                    <span class="number">{{ post.getBounty()[''value''] ? post.getBounty()[''value''] : 0 }}</span>\r\n                    <span class="word">points</span> (95% upvoted)\r\n                </div>\r\n                <div class="shortlink">shortlink:\r\n                    <input type="text" id="shortlink-text" readonly="readonly" value="http://phanbook.com">\r\n                </div>\r\n            </div>\r\n        </div>\r\n    {% endif %}\r\n    <div class="spacer">\r\n        <div class="titlebox">\r\n            <h1 class="hover redditname">\r\n                <a class="hover" href="p/PHP/">PHP</a>\r\n            </h1>\r\n            <span data-sr_name="PHP" class="fancy-toggle-button subscribe-button toggle">\r\n                {% if 1 == 1 %}\r\n                    <a href="#" class="add" data-descr="Subscribe!">subscribe</a>\r\n                {% else %}\r\n                    <a href="#" class="remove" data-descr="Unsubscribe!">unsubscribe</a>\r\n                {% endif %}\r\n            </span>\r\n            <span class="subscribers"><span class="number">37,215</span> <span class="word">readers</span></span>\r\n            <div class="usertext-body may-blank-within md-container ">\r\n                <div class="md"><p><a href="/p/PHP/wiki/index">Subphannook FAQ</a></p>\r\n\r\n                    <p>{{t(''Releases'')}}: <a href="http://php.net/downloads.php">Current Releases</a>, <a href="http://windows.php.net/download/">Windows Releases</a>, <a href="http://museum.php.net/">Old Releases</a></p>\r\n\r\n                    <p>Sources: <a href="https://svn.php.net/viewvc/">Subversion</a>, <a href="https://git.php.net/">Git</a>, <a href="http://lxr.php.net/">Source Search</a></p>\r\n\r\n                    <p><a href="/">Contribute to the PHP Documentation</a></p>\r\n\r\n                    <p>Related subreddits:\r\n                        <a href="/p/css">CSS</a>, <a href="/p/javascript">JavaScript</a>,\r\n                        <a href="/p/web-design">Web Design</a>, <a href="/p/wordpress">Wordpress</a>, <a href="/p/webdev">WebDev</a>\r\n                    </p>\r\n\r\n                    <p>Join <a href="http://chat.phalcontip.com">#phalcon</a> on Freenode!</p>\r\n\r\n                    <hr>\r\n\r\n                    <p><a href="/p/PHP">/p/PHP</a> is not a support subphanbook. Please visit <a href="/p/phphelp">/p/phphelp</a> for help, or connect to <a href="http://chat.phalcontip.com">##php on Slack chat</a> (<a href="https://slack.com/faq.shtml#thien">you registration required</a>)</p>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <div class="spacer">\r\n        <a href="">\r\n        {{image(''images/sponsor.png'')}}\r\n        </a>\r\n    </div>\r\n    <div id="hot-network-questions" class="spacer">\r\n        <h4>\r\n            {{ link_to(''posts/hot'', t(''Hot Network Community'')) }}\r\n        </h4>\r\n        <ul class="widget">\r\n                {% for hot in hotPosts %}\r\n                    <li>\r\n                        <p>\r\n                            <span class="number"> {{ hot.getNumberReply() }}</span>\r\n                            <span class="text">\r\n                            {{ link_to(hot.getType() ~ ''/'' ~ hot.getId() ~ ''/'' ~ hot.getSlug(), hot.getTitle())}}</span>\r\n                        </p>\r\n                    </li>\r\n                {% endfor %}\r\n        </ul>\r\n    </div><!-- hot-network-questions -->\r\n</div>\r\n'),
(8, 'SendSpool', 'sendspool', 'Send Spool', '{# The template use for send mail when have a reply or comment on post#}\r\n<h5>Hello {{ name }} </h5>\r\n{{ content }}\r\n<p style="font-size:small;-webkit-text-size-adjust:none;color:#717171;">\r\n&mdash;<br>Reply to this email directly or view the complete thread on\r\n<a href="{{ link }}">{{ this.config.application.name }}</a>\r\nChange your e-mail preferences <a href="{{this.config.application.publicUrl}}/settings">here</a></p>\r\n</p>\r\n');

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
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
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
