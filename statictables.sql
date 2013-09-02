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
  `account_id` int(11) NOT NULL DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `male` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `users` VALUES (1,'stephenallsopp@gmail.com','$2a$10$4DKCaCreddp.dvmCnKB.7.44VyCpAmBYKaLvOc9oCaq547SWRQsA2',NULL,NULL,'2013-07-01 10:26:29',51,'2013-07-08 07:47:43','2013-07-06 21:13:22','192.168.1.66','192.168.1.66','2012-06-23 18:53:16','2013-07-08 07:47:43','Allsopp','Stephen','Mr',1,1,1),(8,'sue@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','2012-08-27 15:38:45','Owens','Sue','Mrs',1,0,0),(9,'stephen@pccn.org.uk','$2a$10$/85kzqq8OJe2mUMokjzmVOtJJNirc3x9UywUcs3AS7v.p7IWOQEkW',NULL,NULL,NULL,3,'2012-08-27 21:10:28','2012-08-27 17:05:17','192.168.1.66','192.168.1.66','0000-00-00 00:00:00','2012-08-27 21:10:28','Smithers','Stephen','Mr',1,0,1),(10,'noeleen@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Evans','Noeleen','Mrs',1,0,0),(11,'tracey@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Dixon','Tracey','Mrs',1,0,0),(12,'roger@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','James','Roger','Mr',1,0,1),(13,'julie@pccn.org.uk','',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','Rowlands','Julie','Mrs',1,0,0),(15,'tempuscat@googlemail.com','$2a$10$FrxyVG1Qt3bVC65biGgY.Oim3xjqkA/KIfgSWAnXfQuctXb2U3x6m',NULL,NULL,NULL,2,'2012-07-08 22:17:00','2012-07-08 22:13:14','192.168.1.66','127.0.0.1','2012-07-08 22:12:41','2012-07-08 22:17:00','Allsopp','Imogen',NULL,2,0,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practitioner_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `practitioner_types` VALUES (1,'Counsellor','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'Eating Disorders Nurse','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'EMDR Practitioner','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `is_email` tinyint(1) NOT NULL DEFAULT '0',
  `is_printable` tinyint(1) NOT NULL DEFAULT '0',
  `is_phone` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `message_types` VALUES (1,'Email',1,0,0,'2012-07-22 20:02:09','2012-07-22 20:02:09'),(2,'Letter',0,1,0,'2012-07-22 20:02:09','2012-07-22 20:02:09'),(3,'Phone call',0,0,1,'2012-07-22 20:02:09','2012-07-22 20:02:09');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allocation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `is_assessment` tinyint(1) NOT NULL DEFAULT '0',
  `is_treatment` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `default_appointment_count` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `allocation_types` VALUES (1,'IA',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',1,1),(2,'Therapy',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',6,1),(3,'Eating disorders service',0,1,'2012-09-11 12:06:13','2012-09-11 12:06:13',1,1),(4,'Therapy (single session)',0,1,'2012-09-11 12:07:00','2012-09-11 12:07:00',1,1),(5,'Opt-in letter',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `is_dna` tinyint(1) NOT NULL,
  `is_cancellation` tinyint(1) NOT NULL,
  `is_attended` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `appointment_statuses` VALUES (1,'Attended',0,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(2,'DNA',1,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(3,'Cancelled (client)',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',1),(4,'Cancelled (practitioner)',0,1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',1);
