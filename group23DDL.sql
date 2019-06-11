-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Linux (x86_64)
--
-- Host: classmysql.engr.oregonstate.edu    Database: cs340_maling
-- ------------------------------------------------------
-- Server version	10.3.13-MariaDB-log

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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment_type` int(11) DEFAULT NULL,
  `enrollment_qtr` varchar(255) NOT NULL,
  `enrollment_year` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `enrollment_type` (`enrollment_type`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`enrollment_type`) REFERENCES `enrollment_type` (`enrollment_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2,NULL,'fall',2017,'William','Adama'),(3,35,'winter',2018,'Lee','Adama'),(4,36,'spring',2018,'Laura','Roslin'),(6,NULL,'summer',2016,'Gaius','Baltar'),(7,35,'spring',2019,'Saul','Tigh'),(8,NULL,'x',2,'x','c'),(9,NULL,'',0,'',''),(10,NULL,'fall',1432,'xx','yy');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment_type`
--

DROP TABLE IF EXISTS `enrollment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment_type` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`enrollment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment_type`
--

LOCK TABLES `enrollment_type` WRITE;
/*!40000 ALTER TABLE `enrollment_type` DISABLE KEYS */;
INSERT INTO `enrollment_type` VALUES (35,'part time (2)'),(36,'full time (3)'),(44,'full time (4)');
/*!40000 ALTER TABLE `enrollment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_class`
--

DROP TABLE IF EXISTS `student_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_class` (
  `student_id` int(11) NOT NULL DEFAULT 0,
  `class_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`student_id`,`class_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_class`
--

LOCK TABLES `student_class` WRITE;
/*!40000 ALTER TABLE `student_class` DISABLE KEYS */;
INSERT INTO `student_class` VALUES (2,1),(2,2),(2,3),(2,7),(4,1);
/*!40000 ALTER TABLE `student_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_degree`
--

DROP TABLE IF EXISTS `student_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_degree` (
  `student_id` int(11) NOT NULL DEFAULT 0,
  `degree_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`student_id`,`degree_id`),
  KEY `degree_id` (`degree_id`),
  CONSTRAINT `student_degree_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_degree_ibfk_2` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`degree_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_degree`
--

LOCK TABLES `student_degree` WRITE;
/*!40000 ALTER TABLE `student_degree` DISABLE KEYS */;
INSERT INTO `student_degree` VALUES (2,1),(6,3),(7,1),(7,2);
/*!40000 ALTER TABLE `student_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree` (
  `degree_id` int(11) NOT NULL AUTO_INCREMENT,
  `degree_type` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  PRIMARY KEY (`degree_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (1,'associates','accounting'),(2,'bachelor','english'),(3,'bachelor','business management'),(4,'bachelor','chemitry');
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `prerequisite` varchar(255) DEFAULT NULL,
  `qtr_offered` varchar(255) NOT NULL,
  `instructor` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `instructor` (`instructor`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`instructor`) REFERENCES `instructor` (`instructor_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'CS161',NULL,'all',1),(2,'CS162','CS161','all',2),(3,'CS165',NULL,'fall, winter, spring',3),(4,'CS225',NULL,'all',3),(5,'CS261','CS162 or CS165 & CS225','all',3),(6,'CS271','CS161 or CS165','all',4),(7,'CS290','CS162 or CS165','all',4),(8,'CS325','CS225 & CS261','all',5),(9,'CS340','CS290','all',1),(10,'CS344','CS261 & CS271','all',6),(11,'CS361','CS261','all',6),(12,'CS362','CS261','all',6),(13,'CS372','CS261 & CS271','all',7),(14,'CS352','CS161 or CS165','all',7),(15,'CS373','CS340, CS344 & CS372','winter',7),(16,'CS464','CS261','fall, spring',8),(17,'CS475','CS261','spring',9),(18,'CS492','CS290, CS340, CS344, and/or CS372','spring',9),(19,'CS493','CS290, CS340, and CS372','all',9),(20,'CS467','CS344, CS361, and CS362','all',9);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `instructor_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `academic_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`instructor_id`),
  KEY `academic_rank` (`academic_rank`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`academic_rank`) REFERENCES `academic_rank` (`rank_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Albus','Dumbledore',1),(2,'Severus','Snape',3),(3,'Quirinus','Quirrell',1),(4,'Septima','Vector',3),(5,'Dolores','Umbridge',2),(6,'Minerva','McGonagall',1),(7,'Remus','Lupin',2),(8,'Rubeus','Hagrid',4),(9,'Barry','Crouch',2),(13,'xx','yy',NULL);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_rank`
--

DROP TABLE IF EXISTS `academic_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_rank` (
  `rank_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_rank`
--

LOCK TABLES `academic_rank` WRITE;
/*!40000 ALTER TABLE `academic_rank` DISABLE KEYS */;
INSERT INTO `academic_rank` VALUES (1,'distinguished professor'),(2,' professor'),(3,'associate professor'),(4,'assistant professor');
/*!40000 ALTER TABLE `academic_rank` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 16:11:45
