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
-- Table structure for table `userInfo`
--

DROP TABLE IF EXISTS `userInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userInfo` (
  `idnewUser` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `SSN` int NOT NULL,
  PRIMARY KEY (`idnewUser`,`SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userInfo`
--

LOCK TABLES `userInfo` WRITE;
/*!40000 ALTER TABLE `userInfo` DISABLE KEYS */;
INSERT INTO `userInfo` VALUES (21,'John','Legend','John','John13','0 nowhere st','00010000','3781',1111),(22,'Jack','Mill','Jack','Mill1','01 somewhere st','00020000','4740',1112),(23,'Jose','Lente','Jose','Lente2','02 nowhere st','00030000','300',1113),(24,'Selena','Gomez','Selena','Selena1','03 nowhere st','00040000','4940',1114),(25,'Christine','Legend','John','John13','04 nowhere st','00050000','4520',1115),(26,'Lay','Man','Lay','Lay13','05 nowhere st','00060000','5142',1116),(27,'Sam','Theen','Sam','Sam2','06 nowhere st','00070000','4143',1117),(28,'Luis','Fernan','Luis','Luis2','07 nowhere st','00080000','4430',1118),(29,'Zyaq','More','Zyaq','Zyaq1','08 nowhere st','00090000','5100',1119),(30,'Rith','Hawa','Hawa','Hawa1','09 nowhere st','00011000','4370',1121),(31,'Pemo','Meq','Meq','Meq12','10 nowhere st','00012000','15680',1122),(32,'Meghan','Alegra','Alegra','Alegra1','11 nowhere st','00013000','592',1123),(33,'Soni','Lista','Lista','Lista2','12 nowhere st','00014000','2774',1124),(34,'Tumba','Pal','Pal','Pal12','13 nowhere st','00015000','2760',1125),(35,'Paula','Pema','Pema','Paula12','14 nowhere st','00016000','5740',1126),(36,'Fego','Extre','Extre','Extre1','15 nowhere st','00018000','3820',1127),(37,'Paola','Arita','Poala','paola3','16 nowhere st','00019000','6004',1128),(39,'Arrenn','Baral','arrennbaral','baral1','Nowherer Bld','408-000-0000','310',1234),(40,'Tom','Hank','tomhank','password','Somwhere St','499-999-9999','-90',2334),(41,'Tom','Cruise','tom','cruise','Nowhere CT','111-111-1111','200',3456),(42,'David','Chang','david','chang','There St','333-333-3333','5000',4567),(43,'Ashley','Vandene','ashley','vandene','This St','444-444-4444','700',6789),(45,'Dan','Hell','dan','hell','Where St','555-555-5555','1000',4444),(46,'Clare','Dan','clare','dan','No St','444-444-4444','10000',8888),(47,'Dan','Cliff','dan','cliff','There St','666-666-6666','500',9999),(48,'Pao','Ari','Pao','pao1','16 nowhere st','00019000','4000',9090),(49,'Paol','Ari','Pao','pao1','16 nowhere st','00019000','4000',9876),(50,'Paolaa','Ari','Pao','pao1','16 nowhere st','00044000','4000',9876),(52,'Paolaa','Ari','Pao','pao1','16 nowhere st','00044000','4000',8765),(53,'Paolaa','Ari','Pao','pao1','16 nowhere st','00044000','4000',8765),(54,'Paolaa','Ari','Pao','pao1','16 nowhere st','00041000','4000',5634),(57,'abc','def','abc','abc1','16 nowhere st','00033000','4000',2122),(58,'rrr','fff','aaa','bbb','123','333','200',5555),(59,'Mike','Wu','mike','wu12','123 Somewhere St','123-456-7890','20000',3232),(60,'Ryan','Man','ryan','man','11 nowhere st','33-33-333','2000',3434),(61,'bbb','ccc','bbb','ccc','somewhere',NULL,'200',4343),(62,'Ash','Girl','ash','girl','nowhere',NULL,'20000',4545);
/*!40000 ALTER TABLE `userInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-01 18:09:13
