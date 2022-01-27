DROP SCHEMA IF EXISTS test;
CREATE SCHEMA test;
USE test;

-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `crimes`
--

DROP TABLE IF EXISTS `crimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crimes` (
  `id` char(10) NOT NULL,
  `type` enum('Felony','Misdemeanor','Infraction') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `isSolved` bit(1) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crimes`
--

LOCK TABLES `crimes` WRITE;
/*!40000 ALTER TABLE `crimes` DISABLE KEYS */;
INSERT INTO `crimes` VALUES ('a090032011','Misdemeanor','1999-05-16',NULL,'Greece','Thessaloniki','Stamatelou',_binary '',NULL),('a334499894','Felony','2021-05-13','13:00:00','Greece','Karditsa','Zafeiriou',_binary '',NULL),('e22222222','Felony','2018-11-11','22:00:00','Greece','Xanthi','Larisis',_binary '\0',NULL),('E455598990','Felony','2005-03-01','21:30:00','Greece','Athens','Filopapou',_binary '\0',NULL),('e99999999','Misdemeanor','2021-04-29','17:40:00','Greece','Athens','Berginas',_binary '',NULL),('i001111111','Misdemeanor','2021-11-30','00:00:00','Greece','Thessaloniki',NULL,_binary '',NULL),('j001222222','Felony','2010-01-24','15:00:00','New Zealand',NULL,NULL,_binary '',NULL),('L998455500','Misdemeanor','2017-11-28',NULL,'Greece','Thessaloniki',NULL,_binary '',NULL),('Q99999999','Felony','2017-05-01',NULL,'Greece','Larisa',NULL,_binary '',NULL),('R433339677','Infraction','2000-12-30','16:00:00','Greece','Patra',NULL,_binary '\0',NULL),('r444444444','Felony','2017-01-01',NULL,'Greece','Irakleio',NULL,_binary '',NULL),('r555555555','Misdemeanor','2019-03-06',NULL,'America','Texas',NULL,_binary '',NULL),('S334455712','Felony','2020-07-24',NULL,'Greece','Thessaloniki',NULL,_binary '',NULL),('t020000011','Misdemeanor','2021-03-11',NULL,'America','',NULL,_binary '\0',NULL),('w00000000','Infraction','2016-09-14','12:30:00','Greece','Larisa','Ipikourou',_binary '',NULL);
/*!40000 ALTER TABLE `crimes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crimes_BEFORE_INSERT` BEFORE INSERT ON `crimes` FOR EACH ROW BEGIN
    IF (NEW.date >= cast(CURDATE() as date)) THEN
		SIGNAL SQLSTATE '22100' SET MESSAGE_TEXT = 'Invalid crime date';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crimes_BEFORE_UPDATE` BEFORE UPDATE ON `crimes` FOR EACH ROW BEGIN
	 IF (NEW.date >= cast(CURDATE() as date)) THEN
		SIGNAL SQLSTATE '22100' SET MESSAGE_TEXT = 'Invalid crime date';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `crimes_investigators`
--

DROP TABLE IF EXISTS `crimes_investigators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crimes_investigators` (
  `investigatorId` char(10) NOT NULL,
  `crimeId` char(10) NOT NULL,
  PRIMARY KEY (`investigatorId`,`crimeId`),
  KEY `crimeId_idx` (`crimeId`),
  CONSTRAINT `investigatedCrimeId` FOREIGN KEY (`crimeId`) REFERENCES `crimes` (`id`),
  CONSTRAINT `investigatorId` FOREIGN KEY (`investigatorId`) REFERENCES `investigators` (`idCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crimes_investigators`
--

LOCK TABLES `crimes_investigators` WRITE;
/*!40000 ALTER TABLE `crimes_investigators` DISABLE KEYS */;
INSERT INTO `crimes_investigators` VALUES ('WW002321','a090032011'),('CN311009','a334499894'),('QA994400','a334499894'),('CN311009','e22222222'),('OI998344','e22222222'),('QA994400','e22222222'),('EE112233','E455598990'),('OI998344','E455598990'),('KK009942','e99999999'),('QA994400','e99999999'),('CF009112','j001222222'),('OI998344','R433339677'),('PO241122','S334455712'),('UQ009943','S334455712'),('CF009112','t020000011'),('KK009942','w00000000'),('QA994400','w00000000');
/*!40000 ALTER TABLE `crimes_investigators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crimes_offenders`
--

DROP TABLE IF EXISTS `crimes_offenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crimes_offenders` (
  `crimeId` char(10) NOT NULL,
  `offenderId` char(10) NOT NULL,
  PRIMARY KEY (`crimeId`,`offenderId`),
  KEY `offenderId_idx` (`offenderId`),
  CONSTRAINT `committedByOffenderId` FOREIGN KEY (`offenderId`) REFERENCES `offenders` (`idCardNumber`),
  CONSTRAINT `committedCrimeId` FOREIGN KEY (`crimeId`) REFERENCES `crimes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crimes_offenders`
--

LOCK TABLES `crimes_offenders` WRITE;
/*!40000 ALTER TABLE `crimes_offenders` DISABLE KEYS */;
INSERT INTO `crimes_offenders` VALUES ('Q99999999','AK558922'),('e99999999','EE777777'),('r444444444','EE777777'),('S334455712','EP044982'),('t020000011','EQ880022'),('i001111111','ER999999'),('S334455712','ER999999'),('a090032011','ET003445'),('a334499894','ET003445'),('E455598990','ET003445'),('L998455500','ET003445'),('w00000000','ET003445'),('a090032011','FL1339911'),('R433339677','FL1339911'),('R433339677','OO111111'),('a090032011','SD002234'),('e22222222','SD002234'),('j001222222','SD002234'),('Q99999999','SD002234'),('i001111111','ST333333'),('L998455500','TU122233'),('S334455712','TU122233');
/*!40000 ALTER TABLE `crimes_offenders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crimes_weapons`
--

DROP TABLE IF EXISTS `crimes_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crimes_weapons` (
  `crimeId` char(10) NOT NULL,
  `weaponSerialNumber` char(10) NOT NULL,
  PRIMARY KEY (`crimeId`,`weaponSerialNumber`),
  KEY `weaponSerialNumber_idx` (`weaponSerialNumber`),
  CONSTRAINT `usedInCrimeId` FOREIGN KEY (`crimeId`) REFERENCES `crimes` (`id`),
  CONSTRAINT `weaponSerialNumber` FOREIGN KEY (`weaponSerialNumber`) REFERENCES `weapons` (`serialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crimes_weapons`
--

LOCK TABLES `crimes_weapons` WRITE;
/*!40000 ALTER TABLE `crimes_weapons` DISABLE KEYS */;
INSERT INTO `crimes_weapons` VALUES ('e99999999','ee3333333'),('r444444444','ee3333333'),('Q99999999','er9999990'),('r555555555','lo0000000'),('e22222222','po1200999'),('E455598990','po1200999'),('S334455712','po1200999'),('i001111111','pp0000000'),('a090032011','qq1233444'),('S334455712','qq1233444'),('t020000011','qw1234567'),('E455598990','re3333333'),('j001222222','re3333333'),('Q99999999','re3333333'),('R433339677','ri9922111'),('a090032011','rt9912344'),('a334499894','rt9912344'),('L998455500','rt9912344'),('a090032011','sf1244332'),('R433339677','sf1244332'),('L998455500','we1455812'),('i001111111','ww1222344');
/*!40000 ALTER TABLE `crimes_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidence`
--

DROP TABLE IF EXISTS `evidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidence` (
  `classification` enum('Real','Testimonial','Documentary','Demonstrative') NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `crimeId` char(10) NOT NULL,
  PRIMARY KEY (`crimeId`,`type`),
  CONSTRAINT `foundInCrimeId` FOREIGN KEY (`crimeId`) REFERENCES `crimes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidence`
--

LOCK TABLES `evidence` WRITE;
/*!40000 ALTER TABLE `evidence` DISABLE KEYS */;
INSERT INTO `evidence` VALUES ('Documentary','post letter','','a090032011'),('Testimonial','witness','','a090032011'),('Documentary','finger print','','a334499894'),('Real','notes','','e22222222'),('Real','scence\'s photo','','e22222222'),('Real','DNA','','E455598990'),('Testimonial','witness','','e99999999'),('Real','DNA','','i001111111'),('Real','knife','','j001222222'),('Testimonial','anonymous witness','','L998455500'),('Real','shoe print','','Q99999999'),('Real','DNA','','r444444444');
/*!40000 ALTER TABLE `evidence` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Evidence_BEFORE_INSERT` BEFORE INSERT ON `evidence` FOR EACH ROW BEGIN
	IF (NEW.classification NOT IN ('Testimonial','Real','Documentary','Demonstrative')) THEN
		SIGNAL SQLSTATE '22004' SET MESSAGE_TEXT = 'Invalid evidence classification';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Evidence_BEFORE_UPDATE` BEFORE UPDATE ON `evidence` FOR EACH ROW BEGIN
	IF (NEW.classification NOT IN ('Testimonial','Real','Documentary','Demonstrative')) THEN
		SIGNAL SQLSTATE '22004' SET MESSAGE_TEXT = 'Invalid evidence classification';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `evidencewithoutdna`
--

DROP TABLE IF EXISTS `evidencewithoutdna`;
/*!50001 DROP VIEW IF EXISTS `evidencewithoutdna`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `evidencewithoutdna` AS SELECT 
 1 AS `classification`,
 1 AS `type`,
 1 AS `description`,
 1 AS `crimId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `investigators`
--

DROP TABLE IF EXISTS `investigators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investigators` (
  `idCardNumber` char(10) NOT NULL,
  `type` enum('Police','Forensics','Computer Crime') NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `credentials` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigators`
--

LOCK TABLES `investigators` WRITE;
/*!40000 ALTER TABLE `investigators` DISABLE KEYS */;
INSERT INTO `investigators` VALUES ('CF009112','Computer Crime','Marshal','Walker','American','Bachelor\'s Degree in Computer Science'),('CN311009','Forensics','Olliver','Smith','England','Bachelor\'s Degree in Biology'),('EE112233','Forensics','Maria','Spurou','Greek','Bachelor\'s Degree in Biology'),('KK009942','Police','Jason','Myers','American',NULL),('OI998344','Police','Andronikos','Petrou','Greek','NULL'),('PO241122','Forensics','Lin','Xiaojun','Chinese','Master\'s Degree in Chemistry'),('QA994400','Police','Kylian','Jackson','American ',''),('UQ009943','Forensics','Justin','Lee','Japanese','Master\'s Degree in Forensics Science'),('WW002321','Forensics','Spuridoula','Vlahou','Greek','Master\'s Degree in Forensics Science');
/*!40000 ALTER TABLE `investigators` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Investigators_BEFORE_INSERT` BEFORE INSERT ON `investigators` FOR EACH ROW BEGIN
	IF (NEW.type NOT IN ('Police','Forensics','Computer Crime')) THEN
		SIGNAL SQLSTATE '22005' SET MESSAGE_TEXT = 'Invalid investigator type';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Investigators_BEFORE_UPDATE` BEFORE UPDATE ON `investigators` FOR EACH ROW BEGIN
	IF (NEW.type NOT IN ('Police','Forensics','Computer Crime')) THEN
		SIGNAL SQLSTATE '22005' SET MESSAGE_TEXT = 'Invalid investigator type';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `involved_in_crimes`
--

DROP TABLE IF EXISTS `involved_in_crimes`;
/*!50001 DROP VIEW IF EXISTS `involved_in_crimes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `involved_in_crimes` AS SELECT 
 1 AS `crimeId`,
 1 AS `victimId`,
 1 AS `offenderId`,
 1 AS `investigatorId`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `offenders`
--

DROP TABLE IF EXISTS `offenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offenders` (
  `idCardNumber` char(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `height` float DEFAULT NULL,
  `age` int DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `isIdentified` bit(1) NOT NULL,
  `isCaught` bit(1) NOT NULL,
  PRIMARY KEY (`idCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offenders`
--

LOCK TABLES `offenders` WRITE;
/*!40000 ALTER TABLE `offenders` DISABLE KEYS */;
INSERT INTO `offenders` VALUES ('AK558922','Konstantinos','Papadopoulos',1.78,47,'Fisherman','Greek',_binary '',_binary ''),('EE777777','Larry','Peterson',2.03,41,'Seller','American',_binary '',_binary ''),('EP044982','Paulos','Paulou',1.69,55,'Delivery','Greek',_binary '',_binary ''),('EQ880022','Petros','Zivkovic',1.74,49,'Doctor','Serbian/Greek',_binary '',_binary '\0'),('ER999999','Marquines','Dickinson',NULL,31,'Computer Engineer','Spanish',_binary '',_binary '\0'),('ET003445','Igor','Dobromir',1.83,16,NULL,'Bulgarian',_binary '',_binary ''),('FL1339911','Marios','Zafeiris',1.87,17,NULL,'Greek',_binary '',_binary ''),('II232323','Shawn','Mercury',1.81,37,NULL,'English',_binary '',_binary ''),('OO111111','Marshal','Kostoglou',1.64,17,NULL,'Greek/American',_binary '',_binary ''),('SD002234','Dmitri','Smirnov',1.85,61,'Taxi Driver','Russian',_binary '',_binary ''),('ST333333','Rio','Cortez',NULL,28,'Computer Scientist','Spanish',_binary '',_binary ''),('TU122233','Eddy','Gjergji',1.91,34,NULL,'Albanian',_binary '',_binary '\0');
/*!40000 ALTER TABLE `offenders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Offenders_BEFORE_INSERT` BEFORE INSERT ON `offenders` FOR EACH ROW BEGIN
	IF (NEW.age > cast(CURDATE() as date)) THEN
		SIGNAL SQLSTATE '22006' SET MESSAGE_TEXT = 'Invalid offender age';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Offenders_BEFORE_INSERT_1` BEFORE INSERT ON `offenders` FOR EACH ROW BEGIN
	IF (NEW.height > 2.40) THEN
		SIGNAL SQLSTATE '22007' SET MESSAGE_TEXT = 'Invalid offender height';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Offenders_BEFORE_UPDATE` BEFORE UPDATE ON `offenders` FOR EACH ROW BEGIN
	IF (NEW.age > cast(CURDATE() as date)) THEN
		SIGNAL SQLSTATE '22006' SET MESSAGE_TEXT = 'Invalid offender age';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Offenders_BEFORE_UPDATE_1` BEFORE UPDATE ON `offenders` FOR EACH ROW BEGIN
	IF (NEW.height > 2.40) THEN
		SIGNAL SQLSTATE '22007' SET MESSAGE_TEXT = 'Invalid offender height';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sentences`
--

DROP TABLE IF EXISTS `sentences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sentences` (
  `classification` enum('Felony','Misdemeanor','Infraction') DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `penalty` varchar(200) NOT NULL,
  `offenderId` char(10) NOT NULL,
  PRIMARY KEY (`offenderId`,`type`),
  CONSTRAINT `sentencedOffenderId` FOREIGN KEY (`offenderId`) REFERENCES `offenders` (`idCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sentences`
--

LOCK TABLES `sentences` WRITE;
/*!40000 ALTER TABLE `sentences` DISABLE KEYS */;
INSERT INTO `sentences` VALUES ('Misdemeanor','robbery','1999-09-10','','EP044982'),('Misdemeanor','robbery','2000-12-30','','EQ880022'),('Misdemeanor','robbery','2010-02-10','','ER999999'),('Infraction','','2008-10-20','100 euros','ET003445'),('Misdemeanor','burglary','0000-00-00','','ET003445'),('Felony','kidnapping','2017-03-04','','FL1339911'),('Infraction','','1998-02-03','','OO111111'),('Infraction','','2005-03-02','','SD002234'),('Infraction','','2008-10-20','','ST333333');
/*!40000 ALTER TABLE `sentences` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Sentences_BEFORE_INSERT` BEFORE INSERT ON `sentences` FOR EACH ROW BEGIN
	IF (NEW.classification NOT IN ('Felony','Misdemeanor','Infraction')) THEN
		SIGNAL SQLSTATE '22008' SET MESSAGE_TEXT = 'Invalid sentence classification';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Sentences_BEFORE_INSERT_1` BEFORE INSERT ON `sentences` FOR EACH ROW BEGIN
	IF (NEW.date >= cast(CURDATE() as date)) THEN
		SIGNAL SQLSTATE '22009' SET MESSAGE_TEXT = 'Invalid sentence date';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Sentences_BEFORE_UPDATE` BEFORE UPDATE ON `sentences` FOR EACH ROW BEGIN
	IF (NEW.classification NOT IN ('Felony','Misdemeanor','Infraction')) THEN
		SIGNAL SQLSTATE '22008' SET MESSAGE_TEXT = 'Invalid sentence classification';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Sentences_BEFORE_UPDATE_1` BEFORE UPDATE ON `sentences` FOR EACH ROW BEGIN
	IF (NEW.date >= cast(CURDATE() as date)) THEN
		SIGNAL SQLSTATE '22009' SET MESSAGE_TEXT = 'Invalid sentence date';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `victims`
--

DROP TABLE IF EXISTS `victims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `victims` (
  `idCardNumber` char(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `age` int DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `injuries` varchar(200) DEFAULT NULL,
  `crimeId` char(10) NOT NULL,
  PRIMARY KEY (`idCardNumber`),
  KEY `crimeId_idx` (`crimeId`),
  CONSTRAINT `involvedInCrimeId` FOREIGN KEY (`crimeId`) REFERENCES `crimes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victims`
--

LOCK TABLES `victims` WRITE;
/*!40000 ALTER TABLE `victims` DISABLE KEYS */;
INSERT INTO `victims` VALUES ('DS348912','Vasiliki ','Pagkalou',19,NULL,'Greek',NULL,'a090032011'),('EE322119','Christin','Nalewanjy',71,NULL,'Japanese',NULL,'a334499894'),('FF431232','Elsa','Pruskova',23,NULL,'Russian',NULL,'E455598990'),('IO099919','Dimitra','Williams',25,NULL,'Greek/American',NULL,'L998455500'),('JJ451234','Giannis','Panagiotopoulos',54,NULL,'Greek',NULL,'S334455712'),('XC000000','Christos','Petrou',45,NULL,'Greek',NULL,'R433339677');
/*!40000 ALTER TABLE `victims` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Victims_BEFORE_INSERT` BEFORE INSERT ON `victims` FOR EACH ROW BEGIN
	IF (NEW.age > 110) THEN
		SIGNAL SQLSTATE '32008' SET MESSAGE_TEXT = 'Invalid victim age';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Victims_BEFORE_UPDATE` BEFORE UPDATE ON `victims` FOR EACH ROW BEGIN
	IF (NEW.age > 110) THEN
		SIGNAL SQLSTATE '32008' SET MESSAGE_TEXT = 'Invalid victim age';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `victims_per_city`
--

DROP TABLE IF EXISTS `victims_per_city`;
/*!50001 DROP VIEW IF EXISTS `victims_per_city`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `victims_per_city` AS SELECT 
 1 AS `city`,
 1 AS `victims`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapons` (
  `serialNumber` char(10) NOT NULL,
  `kind` enum('Artillery','Biological','Chemical','Combat','Explosives','Firearm') DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `manufacturer` varchar(20) DEFAULT NULL,
  `ammunition` varchar(20) DEFAULT NULL,
  `offenderId` char(10) DEFAULT NULL,
  PRIMARY KEY (`serialNumber`),
  KEY `offenderId_idx` (`offenderId`),
  CONSTRAINT `possessedByOffenderId` FOREIGN KEY (`offenderId`) REFERENCES `offenders` (`idCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES ('ee3333333','Combat','brick',NULL,NULL,'EE777777'),('er9999990','Firearm','AR15','Sig Sauer','7.62','AK558922'),('lo0000000','Combat','chain',NULL,NULL,'II232323'),('po1200999','Firearm','M416','Heckler/Koch','5.56','EP044982'),('pp0000000','Combat','pike',NULL,NULL,'ER999999'),('qq1233444','Combat','iron knucles',NULL,NULL,'TU122233'),('qw1234567','Combat','knife','SAAB AB',NULL,'EQ880022'),('re3333333','Firearm','S12','Heckler/Kock','12 gayge','SD002234'),('ri9922111','Combat','club',NULL,NULL,'OO111111'),('rt9912344','Firearm','P9','Sig Sauer','9mm','ET003445'),('sf1244332','Combat','baseball bat',NULL,NULL,'FL1339911'),('we1455812','Chemical','HCL',NULL,NULL,'TU122233'),('ww1222344','Chemical','acid',NULL,NULL,'ST333333');
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Weapons_BEFORE_INSERT` BEFORE INSERT ON `weapons` FOR EACH ROW BEGIN
	IF (NEW.kind NOT IN ('Artillery','Explosive','Biological','Chemical','Combat','Firearm')) THEN
		SIGNAL SQLSTATE '22011' SET MESSAGE_TEXT = 'Invalid weapon kind';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Weapons_BEFORE_UPDATE` BEFORE UPDATE ON `weapons` FOR EACH ROW BEGIN
	IF (NEW.kind NOT IN ('Artillery','Explosives','Biological','Chemical','Combat','Firearm')) THEN
		SIGNAL SQLSTATE '22011' SET MESSAGE_TEXT = 'Invalid weapon kind';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `evidencewithoutdna`
--

/*!50001 DROP VIEW IF EXISTS `evidencewithoutdna`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `evidencewithoutdna` AS select `evidence`.`classification` AS `classification`,`evidence`.`type` AS `type`,`evidence`.`description` AS `description`,`evidence`.`crimeId` AS `crimId` from `evidence` where (`evidence`.`type` <> 'DNA') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `involved_in_crimes`
--

/*!50001 DROP VIEW IF EXISTS `involved_in_crimes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `involved_in_crimes` AS select `crimes`.`id` AS `crimeId`,`victims`.`idCardNumber` AS `victimId`,`crimes_offenders`.`offenderId` AS `offenderId`,`crimes_investigators`.`investigatorId` AS `investigatorId`,`crimes`.`description` AS `description` from (((`crimes` join `victims` on((`crimes`.`id` = `victims`.`crimeId`))) join `crimes_offenders` on((`crimes`.`id` = `crimes_offenders`.`crimeId`))) join `crimes_investigators` on((`crimes`.`id` = `crimes_investigators`.`crimeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `victims_per_city`
--

/*!50001 DROP VIEW IF EXISTS `victims_per_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `victims_per_city` AS select `crimes`.`city` AS `city`,count(`victims`.`idCardNumber`) AS `victims` from (`crimes` join `victims` on((`crimes`.`id` = `victims`.`crimeId`))) group by `crimes`.`city` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-20 19:17:21
