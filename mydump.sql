-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: PAS_development
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint NOT NULL,
  `blob_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (2,'image','Task',3,2,'2021-03-04 12:41:14'),(3,'image','Task',6,3,'2021-03-04 12:52:20');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `byte_size` bigint NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (1,'hRSqTonGEwgY56MGPLct82Ve','test.png','image/png','{\"identified\":true,\"analyzed\":true}',51687,'sqz7ZrzCMnrl5bTeFbpIrA==','2021-03-04 12:28:55'),(2,'sZ8sRDzE3Ff87S7cfth7uS31','test.png','image/png','{\"identified\":true,\"analyzed\":true}',51687,'sqz7ZrzCMnrl5bTeFbpIrA==','2021-03-04 12:41:14'),(3,'JxHJkevi1JDJwo6JskZQuztN','klipartz.com.png','image/png','{\"identified\":true,\"analyzed\":true}',10401,'YI5pepD2vd+EBh11CcKWHw==','2021-03-04 12:52:20');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2021-02-01 11:15:14','2021-02-01 11:15:14');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` bigint DEFAULT NULL,
  `commentable_type` varchar(255) DEFAULT NULL,
  `commentable_id` bigint DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`),
  KEY `index_comments_on_commentable_type_and_commentable_id` (`commentable_type`,`commentable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'test post on 7 project',2,'Project',7,'2021-02-18 15:20:03','2021-02-18 15:20:03'),(2,'test post on 7 project type 2',2,'Project',7,'2021-02-18 15:20:03','2021-02-18 15:20:03'),(3,'test task komment with id3 task',2,'Task',3,'2021-02-19 08:16:12','2021-02-19 08:16:12'),(4,'test task komment with id3 task 2',2,'Task',3,'2021-02-19 08:16:12','2021-02-19 08:16:12'),(5,'test comment',2,'Project',7,'2021-02-19 17:25:33','2021-02-19 17:25:33'),(6,'test comment from form!',2,'Project',7,'2021-02-19 17:27:20','2021-02-19 17:27:20'),(7,'test comment from formaaa',2,'Project',7,'2021-02-19 17:31:32','2021-02-19 17:31:32'),(8,'test comment from formaaa',2,'Project',7,'2021-02-19 17:31:53','2021-02-19 17:31:53'),(9,'test comment forma project with new form',2,'Project',7,'2021-02-22 12:14:59','2021-02-22 12:14:59'),(10,'test comment forma project with new form',2,'Project',7,'2021-02-22 12:15:18','2021-02-22 12:15:18'),(11,'test comment task from form with new form',2,'Task',3,'2021-02-22 12:19:26','2021-02-22 12:19:26'),(12,'test comment task from form with new form 2',2,'Task',3,'2021-02-22 12:25:03','2021-02-22 12:25:03'),(13,'test new task',2,'Task',3,'2021-02-23 10:53:29','2021-02-23 10:53:29'),(14,'last comment',2,'Task',3,'2021-02-23 10:54:05','2021-02-23 10:54:05'),(15,'reopgrekpregopl',2,'Project',7,'2021-02-23 10:54:28','2021-02-23 10:54:28'),(16,'comment for comment',2,'Comment',1,'2021-02-23 11:14:55','2021-02-23 11:14:55'),(17,'reply\r\n',2,'Comment',16,'2021-02-23 11:19:07','2021-02-23 11:19:07'),(18,'reply reply',2,'Comment',17,'2021-02-23 18:08:01','2021-02-23 18:08:01'),(19,'reply reply reply',2,'Comment',18,'2021-02-23 18:48:52','2021-02-23 18:48:52'),(20,'reply x2\r\n',2,'Comment',17,'2021-02-23 18:49:27','2021-02-23 18:49:27'),(21,'testproject2 test comment',2,'Project',8,'2021-02-24 14:48:27','2021-02-24 14:48:27'),(22,'test comment ',1,'Project',10,'2021-02-24 20:18:48','2021-02-24 20:18:48');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (4,'Testproject3','Take with site','2021-02-11 00:00:00','2021-03-03 00:00:00','2021-02-11 12:10:13','2021-02-16 07:14:00',2),(7,'Testproject1','Take with site','2021-02-11 00:00:00','2021-03-03 00:00:00','2021-02-11 16:59:32','2021-02-11 16:59:32',2),(8,'Testproject2','Take with site','2021-02-11 00:00:00','2021-03-03 00:00:00','2021-02-11 16:59:46','2021-02-11 16:59:46',2),(9,'testproject 4','testsummary4','2021-02-16 00:00:00','2021-03-03 00:00:00','2021-02-16 12:14:16','2021-02-16 12:14:16',2),(10,'Testproject1 no admin','Testproject1 no admin summary','2021-02-24 00:00:00','2021-03-03 00:00:00','2021-02-24 14:49:34','2021-02-24 14:49:34',1),(11,'Testproject1 no admin 2','Testproject1 no admin summary 2','2021-02-24 00:00:00','2021-03-03 00:00:00','2021-02-24 14:54:00','2021-02-24 14:54:00',1),(12,'Testproject3','Take with site','2021-02-11 00:00:00','2021-03-03 00:00:00','2021-03-15 10:40:01','2021-03-15 10:40:01',2);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20210201111938'),('20210201124439'),('20210205092540'),('20210206095011'),('20210206144757'),('20210206153508'),('20210208134507'),('20210209121541'),('20210209152214'),('20210211105843'),('20210217125823'),('20210302172925'),('20210304094510');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `estimation` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tasks_on_title_and_project_id` (`title`,`project_id`),
  KEY `index_tasks_on_project_id` (`project_id`),
  KEY `index_tasks_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (3,'testtitletask','testcontent',0,'2021-02-11 00:00:00','2021-02-12 00:00:00',10,'2021-02-12 10:12:39','2021-03-04 15:05:14',7,2),(4,'testtitletask2','testcontent2',0,'2021-02-12 00:00:00','2021-02-13 00:00:00',10,'2021-02-12 10:36:00','2021-03-04 10:24:55',7,2),(5,'title task 4','content task 4',1,'2021-02-16 00:00:00','2021-03-03 00:00:00',10,'2021-02-16 13:55:41','2021-03-04 10:25:24',7,2),(6,'title task 6','content task 6',2,'2021-02-16 00:00:00','2021-03-03 00:00:00',10,'2021-02-16 13:57:44','2021-03-04 12:52:20',7,2),(7,'test task noadmin','test content noadmin',0,'2021-02-24 00:00:00','2021-03-02 00:00:00',10,'2021-02-24 20:15:53','2021-03-04 10:25:50',10,1);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (3,'Testo_team','2021-02-08 08:42:49','2021-02-08 08:42:49'),(7,'test team','2021-02-26 13:49:51','2021-02-26 13:49:51');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_team_id` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'NotAdmin','NotAdmin2',0,'admin@test.com','$2a$12$R512LIBNaONXIXZKTnC0G.nSjnfGj77sLxPHVrKQpaK6RfACLL7Dy',NULL,NULL,NULL,'iEWsnYezro57yCuzhrDV','2021-02-05 11:28:30','2021-02-05 11:28:25',NULL,NULL),(2,'Admin','Admin',1,'admin1@test.com','$2a$12$3Y2cWn8HiiiDo4h2O4flJeNEGXy1kH50GQj8sPUbA3HyaWN7/e1LC',NULL,NULL,NULL,'GRGEGozKAqtxQqtA-C2r','2021-02-05 17:49:54','2021-02-05 17:49:49',NULL,3);
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

-- Dump completed on 2021-03-15 18:58:12
