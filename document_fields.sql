-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pccn_development
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

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
-- Table structure for table `document_fields`
--

DROP TABLE IF EXISTS `document_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentfield` varchar(255) DEFAULT NULL,
  `railsvariable` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_document_fields_on_documentfield` (`documentfield`),
  KEY `index_document_fields_on_railsvariable` (`railsvariable`),
  KEY `index_document_fields_on_class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_fields`
--

LOCK TABLES `document_fields` WRITE;
/*!40000 ALTER TABLE `document_fields` DISABLE KEYS */;
INSERT INTO `document_fields` VALUES (18,'file_no','episode.file_no','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(19,'assessment_by','practitioner.initials','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(20,'client_name','episode.client.fullname','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(21,'client_address','episode.client.address','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(22,'postcode','episode.client.postcode','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(23,'home_phone','episode.client.telephone_home','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(24,'mobile_phone','episode.client.telephone_mobile','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(25,'referral_date_dd','episode.referral_date.mday','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(26,'referral_date_mm','episode.referral_date.month','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(27,'referral_date_yy','episode.referral_date.year','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(28,'referred_by','episode.referred_by','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(29,'email','episode.client.email','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation'),(30,'referral_date','appointment_date','0000-00-00 00:00:00','0000-00-00 00:00:00','Appointment'),(31,'client_dob','episode.client.dob','0000-00-00 00:00:00','0000-00-00 00:00:00','Allocation');
/*!40000 ALTER TABLE `document_fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-20 17:53:51
