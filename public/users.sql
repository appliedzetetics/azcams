-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pccn_development
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `surname` varchar(255) NOT NULL,
  `forename` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'stephenallsopp@gmail.com','$2a$10$acIq0fqpib.gt0gloLDpvuQunHlzfJdAtwtGXQcmA6PHZllb6z/EO',NULL,NULL,'2012-07-14 09:54:49',12,'2012-07-14 09:54:49','2012-07-09 17:44:50','192.168.1.66','192.168.1.66','2012-06-23 18:53:16','2012-07-14 09:54:49','Allsopp','Stephen','Mr'),(8,'sue@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Owens','Sue','Mrs'),(9,'stephen@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Allsopp','Stephen','Mr'),(10,'noeleen@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Evans','Noeleen','Mrs'),(11,'tracey@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Dixon','Tracey','Mrs'),(12,'roger@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','James','Roger','Mr'),(13,'julie@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Rowlands','Julie','Mrs'),(15,'tempuscat@googlemail.com','$2a$10$FrxyVG1Qt3bVC65biGgY.Oim3xjqkA/KIfgSWAnXfQuctXb2U3x6m',NULL,NULL,NULL,2,'2012-07-08 22:17:00','2012-07-08 22:13:14','192.168.1.66','127.0.0.1','2012-07-08 22:12:41','2012-07-08 22:17:00','Allsopp','Imogen',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-14 11:07:01
