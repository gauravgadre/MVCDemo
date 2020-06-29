-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: isp_project
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
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `speed` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `nname` varchar(45) NOT NULL,
  `image` longblob NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pid_UNIQUE` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (2,'ghjk','2month',400,'10mbps','dfghhj','gold',_binary 'jaguru.txt'),(3,'wifi','2month',400,'30mbps','wrftgbhnjmjhgedrtfgh','silver',_binary 'jagu.jpg.jpg');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-22 18:05:49
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: isp_project
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
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `ename` varchar(45) NOT NULL,
  `mname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mobile` bigint NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(45) NOT NULL,
  `image` longblob NOT NULL,
  `uname` varchar(45) NOT NULL,
  `address` text,
  `idproof` longblob,
  `addproof` longblob,
  `jdate` date NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (17,'jaguuuu','yyu','bnm','bnnn@gmail.com','Hitesh@123',9595676878,'2020-03-14','female',_binary 'jaguru.txt','bnm','mmm',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-07'),(19,'bnm','ppyy','chaudhari','hjj@gmail.com','vbb',9595676878,'2020-03-13','male',_binary 'jagu.jpg.jpg','a123','pune',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-06'),(20,'jagu','dharma','chaudhari','o@gmail.com','123',9421216160,'2020-03-06','male',_binary 'jagu.jpg.jpg','oo','nashik',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-25'),(22,'jagruti','dharma','chaudhari','122','123',9595676878,'2020-03-10','male',_binary 'jagu.jpg.jpg','admin','nashik',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-24'),(24,'jagruti','dharma','chaudhari','12','123',1234567890,'2020-03-06','male',_binary 'jagu.jpg.jpg','jagu','ghjkl',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-02'),(25,'jaguuu','vbnm,','hjkl','oo@gmail.com','1233',9595676878,'2020-03-06','female','','jagu','pune',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-18'),(26,'vbnm','vbnm,','hjkl','oo@gmail.com','1233',9595676878,'2020-03-06','male',_binary 'jagu.jpg.jpg','jagu','pune',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-18'),(27,'jagruti','dharma','bnmbnmvbn','suchetashinde911@gmail.com','pass@224095',9421216160,'2020-03-06','female','','nm,','pune',_binary 'jaguru.txt',_binary 'reumejagu.txt','2020-03-18'),(28,'jagrutiiii','ghjk','bnddd','q@gmail.com','123',9897957897,'2020-03-03','female','','ass','delhi',_binary 'jagu.jpg.jpg',_binary 'jaguru.txt','2020-03-19');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-22 18:05:49
