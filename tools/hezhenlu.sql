SET NAMES utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(32) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `phone` int(32) NOT NULL DEFAULT 0,
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `uid` int(32) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`,`start_time`),
  KEY `index_uid_deleted` (`uid`, `deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(32) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `shortcontent` varchar(1000),
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `cover` varchar(1000),
  `script` varchar(1000),
  `newssource` varchar(1000),
  `type` varchar(1000),
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`aid`),
  UNIQUE KEY (`title`),
  KEY `aid` (`aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(32) NOT NULL AUTO_INCREMENT,
  `parent_cid` int(32) DEFAULT 0,
  `aid` int(32) NOT NULL,
  `uid` int(32) NOT NULL,
  `parent_uid` int(32) DEFAULT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`),
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `star`;
CREATE TABLE `star` (
  `sid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `aid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sid`),
  KEY `index_uid_aid` (`uid`, `aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `cid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `aid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`),
  KEY `index_uid_aid` (`uid`, `aid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `kid` int(32) NOT NULL AUTO_INCREMENT,
  `aid` int(32) NOT NULL,
  `kvalue` varchar(100) NOT NULL,
  PRIMARY KEY (`kid`),
  KEY `index_aid_kvalue` (`aid`, `kvalue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `donate`;
CREATE TABLE `donate` (
  `did` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `amount` double NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`did`),
  KEY `index_uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(32) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `cover` varchar(1000),
  `videourl` varchar(1000),
  `coursesource` varchar(1000),
  `type` varchar(1000),
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  UNIQUE KEY (`title`),
  KEY `cid` (`cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursecomment`;
CREATE TABLE `coursecomment` (
  `ccid` int(32) NOT NULL AUTO_INCREMENT,
  `parent_ccid` int(32) DEFAULT 0,
  `cid` int(32) NOT NULL,
  `uid` int(32) NOT NULL,
  `parent_uid` int(32) DEFAULT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `top` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ccid`),
  KEY `ccid` (`ccid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursestar`;
CREATE TABLE `coursestar` (
  `sid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `cid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sid`),
  KEY `index_uid_cid` (`uid`, `cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursecollect`;
CREATE TABLE `coursecollect` (
  `ccid` int(32) NOT NULL AUTO_INCREMENT,
  `uid` int(32) NOT NULL,
  `cid` int(32) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ccid`),
  KEY `index_uid_cid` (`uid`, `cid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `coursekeyword`;
CREATE TABLE `coursekeyword` (
  `kid` int(32) NOT NULL AUTO_INCREMENT,
  `cid` int(32) NOT NULL,
  `kvalue` varchar(100) NOT NULL,
  PRIMARY KEY (`kid`),
  KEY `index_cid_kvalue` (`cid`, `kvalue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
