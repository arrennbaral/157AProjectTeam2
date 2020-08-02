-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: ABCbank
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Statements`
--

DROP TABLE IF EXISTS `Statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Statements` (
  `account_id` int DEFAULT NULL,
  `orderDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Statements`
--

LOCK TABLES `Statements` WRITE;
/*!40000 ALTER TABLE `Statements` DISABLE KEYS */;
INSERT INTO `Statements` VALUES (21,'2020-07-29'),(21,'2020-07-29'),(23,'2020-07-29'),(36,'2020-07-29'),(24,'2020-07-29'),(23,'2020-07-29'),(33,'2020-07-29'),(31,'2020-07-29'),(31,'2020-07-29'),(36,'2020-07-29'),(27,'2020-07-29'),(26,'2020-07-29'),(22,'2020-07-29'),(29,'2020-07-29'),(30,'2020-07-29'),(30,'2020-07-29'),(40,'2020-07-30'),(45,'2020-07-30'),(46,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(NULL,'2020-07-30'),(NULL,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(47,'2020-07-30'),(NULL,'2020-07-30'),(NULL,'2020-07-30'),(47,'2020-07-30'),(31,'2020-07-30'),(31,'2020-07-30'),(57,'2020-07-30'),(58,'2020-07-30'),(59,'2020-07-30'),(60,'2020-07-31'),(59,'2020-07-31');
/*!40000 ALTER TABLE `Statements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-01 18:09:12