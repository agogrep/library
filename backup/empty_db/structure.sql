-- MySQL dump 10.13  Distrib 5.5.62, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

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
-- Table structure for table `acts`
--

DROP TABLE IF EXISTS `acts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acts` (
  `acid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `exid` smallint(5) NOT NULL,
  `rid` smallint(5) NOT NULL,
  `state` smallint(3) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `descr` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agog`
--

DROP TABLE IF EXISTS `agog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agog` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `main` varchar(20) DEFAULT NULL,
  `field` varchar(20) DEFAULT NULL,
  `relation` varchar(20) NOT NULL,
  `used` varchar(20) NOT NULL,
  `enumeration` varchar(40) NOT NULL,
  `showprimary` smallint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aid_bid`
--

DROP TABLE IF EXISTS `aid_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aid_bid` (
  `abid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `aid` smallint(5) DEFAULT NULL,
  `bid` smallint(5) DEFAULT NULL,
  `def` tinyint(4) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`abid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `aid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `aname` varchar(40) DEFAULT '',
  `fullname` varchar(255) DEFAULT '',
  `about` text,
  `descr` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `bid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `bname` varchar(255) DEFAULT '',
  `edition` varchar(255) DEFAULT '',
  `sdate` date NOT NULL,
  `summary` text,
  `descr` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `enid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `enumname` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `value` varchar(40) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`enid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `edate` datetime NOT NULL,
  `relclass` varchar(100) DEFAULT NULL,
  `relid` smallint(6) NOT NULL,
  `priority` tinyint(2) NOT NULL DEFAULT '0',
  `done` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`eid`),
  KEY `edate_range` (`edate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examples`
--

DROP TABLE IF EXISTS `examples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examples` (
  `exid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `bid` smallint(5) NOT NULL,
  `descr` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`exid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `gnid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gname` varchar(100) DEFAULT '',
  `descr` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gnid_bid`
--

DROP TABLE IF EXISTS `gnid_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gnid_bid` (
  `gbid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gnid` smallint(5) DEFAULT NULL,
  `bid` smallint(5) DEFAULT NULL,
  `def` tinyint(4) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gname` varchar(20) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `mid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mdate` datetime NOT NULL,
  `msource` varchar(40) NOT NULL,
  `mdest` varchar(40) NOT NULL,
  `type` varchar(40) NOT NULL,
  `mess` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passport_db`
--

DROP TABLE IF EXISTS `passport_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passport_db` (
  `pdid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pdate` datetime NOT NULL,
  `developer` varchar(40) NOT NULL,
  `svcode` varchar(40) NOT NULL,
  `version` varchar(40) NOT NULL,
  PRIMARY KEY (`pdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presets`
--

DROP TABLE IF EXISTS `presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presets` (
  `prid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(40) NOT NULL,
  `gname` varchar(40) NOT NULL COMMENT 'group name',
  `login` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `data` text NOT NULL COMMENT 'script',
  PRIMARY KEY (`prid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readers` (
  `rid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rname` varchar(40) DEFAULT '',
  `fullname` varchar(255) DEFAULT '',
  `contacts` text,
  `descr` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportperiods`
--

DROP TABLE IF EXISTS `reportperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportperiods` (
  `rpid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `rpdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportscripts`
--

DROP TABLE IF EXISTS `reportscripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportscripts` (
  `rsid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sysname` varchar(40) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_cookie`
--

DROP TABLE IF EXISTS `temp_cookie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_cookie` (
  `cookie` varchar(40) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_formlock`
--

DROP TABLE IF EXISTS `temp_formlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_formlock` (
  `tflid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` varchar(100) DEFAULT NULL,
  `uid` smallint(5) DEFAULT NULL,
  `lcode` varchar(100) DEFAULT NULL,
  `tlock` datetime NOT NULL,
  PRIMARY KEY (`tflid`),
  KEY `href_range` (`href`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT '',
  `password` varchar(20) DEFAULT '',
  `fullname` varchar(255) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `descr` varchar(255) DEFAULT '',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
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

-- Dump completed on 2019-09-10  0:00:02
