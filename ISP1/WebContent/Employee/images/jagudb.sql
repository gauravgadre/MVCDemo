-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: isp_project
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `empreport`
--

DROP TABLE IF EXISTS `empreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empreport` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `ename` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `jdate` date DEFAULT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empreport`
--

LOCK TABLES `empreport` WRITE;
/*!40000 ALTER TABLE `empreport` DISABLE KEYS */;
INSERT INTO `empreport` VALUES (1,'jagu','dharma','chaudhari',9421216160,'j@gmail.com','nashik','2020-01-07'),(2,'puru','jagdish','battise',9834469523,'p@gmail.com','nashik','2020-03-23'),(3,'darsh','dharma','chaudhari',7588410109,'d@gmail.com','pune','2020-02-22'),(4,'puju','vijay','pawar',7888410098,'pp@gmail.com','jalgaon','2019-09-08'),(5,'gaurav','tyy','gadre',9898979695,'g@gmail.com','pune','2019-09-06'),(6,'hitesh','vishu','angre',9595656403,'h@gmail.com','nashik','2020-04-02');
/*!40000 ALTER TABLE `empreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentreport`
--

DROP TABLE IF EXISTS `paymentreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentreport` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `tranid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(30) NOT NULL,
  `package` varchar(45) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `tranid_UNIQUE` (`tranid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentreport`
--

LOCK TABLES `paymentreport` WRITE;
/*!40000 ALTER TABLE `paymentreport` DISABLE KEYS */;
INSERT INTO `paymentreport` VALUES (1,'VADE0B248932','jagu',9421216160,500,'2020-03-03','12 pm','rotuer'),(2,'VADE0B248939','suvarna',7588410096,1000,'2020-04-07','1 pm','wifi'),(3,'VADE0B248935','hitesh',9595656403,500,'2019-09-08','3pm','router'),(4,'VADE0B248933','jagruti',9595676898,2000,'2020-03-23','2 pm','router');
/*!40000 ALTER TABLE `paymentreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techreport`
--

DROP TABLE IF EXISTS `techreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techreport` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `tname` varchar(45) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `jdate` date DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techreport`
--

LOCK TABLES `techreport` WRITE;
/*!40000 ALTER TABLE `techreport` DISABLE KEYS */;
INSERT INTO `techreport` VALUES (1,'akash',9898979799,'a@gmail.com','pune','2020-03-09'),(2,'hitesh',9595656403,'h@gmail.com','nashik','2020-04-07'),(3,'jagruti',9421216160,'j@gmail.com','nashik','2019-09-08'),(4,'pooja',7588410109,'p@gmail.com','jalgaon','2020-04-03');
/*!40000 ALTER TABLE `techreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userreport`
--

DROP TABLE IF EXISTS `userreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userreport` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(45) NOT NULL,
  `mobile` bigint DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `jdate` date DEFAULT NULL,
  `package` varchar(45) NOT NULL,
  `activationdate` date DEFAULT NULL,
  `renewvaldate` date DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userreport`
--

LOCK TABLES `userreport` WRITE;
/*!40000 ALTER TABLE `userreport` DISABLE KEYS */;
INSERT INTO `userreport` VALUES (1,'pooja',9897969594,'p@gmail.com','satana','2020-01-01','router','2020-02-03','2020-01-04'),(2,'hitesh',9595656403,'h@gmail.com','nashik','2020-04-07','router','2020-04-07','2020-04-07'),(3,'jagu',9421216160,'j@gmail.com','nashik','2019-07-08','wifi','2020-09-08','2019-09-09'),(4,'rutu',7879707676,'r@gmail.com','mumbai','2020-03-06','wifi','2020-03-07','2020-03-07');
/*!40000 ALTER TABLE `userreport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-23 16:38:54
