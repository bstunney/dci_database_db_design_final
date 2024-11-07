CREATE DATABASE  IF NOT EXISTS `dci` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dci`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: dci
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `dcishow`
--

DROP TABLE IF EXISTS `dcishow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcishow` (
  `name` varchar(64) DEFAULT 'UNKNOWN',
  `date` date NOT NULL,
  `weather` varchar(200) DEFAULT 'UNKNOWN',
  `attendance` int DEFAULT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`date`,`sid`),
  KEY `sid` (`sid`),
  CONSTRAINT `dcishow_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `showsite` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcishow`
--

LOCK TABLES `dcishow` WRITE;
/*!40000 ALTER TABLE `dcishow` DISABLE KEYS */;
INSERT INTO `dcishow` VALUES ('Drums on Parade','2017-07-11','Cloudy',430,3),('Innovation in Brass: Woodridge','2017-07-22','Calm',300,4),('DCI Open Class Prelims','2017-08-04',' ',1500,2),('DCI Open Class Semifinals','2017-08-05',' ',1700,2),('DCI Open Class Finals','2017-08-06',' ',1900,2),('DCI World Class Prelims','2017-08-07',' ',2500,2),('DCI World Class Semifinals','2017-08-08',' ',2900,2),('DCI World Class Finals','2017-08-09',' ',3300,2);
/*!40000 ALTER TABLE `dcishow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drumcorps`
--

DROP TABLE IF EXISTS `drumcorps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drumcorps` (
  `name` varchar(64) NOT NULL,
  `program_name` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  `year` int NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `program_name` (`program_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drumcorps`
--

LOCK TABLES `drumcorps` WRITE;
/*!40000 ALTER TABLE `drumcorps` DISABLE KEYS */;
INSERT INTO `drumcorps` VALUES ('Blue Coats','Jagged Line',2017),('Blue Devils','Metamorph',2017),('Blue Knights','i',2017),('Boston Crusaders','Wicked Games',2017),('Carolina Crown','It Is',2017),('Cavaliers','Men are from Mars',2017),('Crossmen','Enigma',2017),('Phantom Regiment','Phantasm',2017),('Santa Clara Vanguard','Ouroboros',2017);
/*!40000 ALTER TABLE `drumcorps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `eid` int NOT NULL,
  `eq_name` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  `brand` varchar(64) DEFAULT 'UNKNOWN',
  `member_name` varchar(64) DEFAULT 'UNKNOWN',
  `corps` varchar(64) NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `corps` (`corps`),
  KEY `member_name` (`member_name`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`corps`) REFERENCES `drumcorps` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `equipment_ibfk_2` FOREIGN KEY (`member_name`) REFERENCES `member` (`member_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (0,'Rifle','King','Robert Jordan','Blue Devils'),(1,'Rifle','King-Kong','Brian Coon','Blue Devils'),(2,'Rifle','Style-Plus','Keely Garcia','Blue Devils'),(3,'Flag','Style-Plus','Damon Durrah','Blue Devils'),(4,'Flag','Guard-Stock','David Guzman-Kern','Blue Devils'),(5,'Flag','Guard-Stock','Fernando Lobato','Blue Devils'),(6,'Microphone','Sony','Tony Taps','Blue Devils');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_name` varchar(64) NOT NULL,
  `dob` date NOT NULL,
  `section` varchar(64) DEFAULT 'UNKNOWN',
  `years_experience` int DEFAULT NULL,
  `corps` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  PRIMARY KEY (`member_name`,`dob`),
  KEY `corps` (`corps`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`corps`) REFERENCES `drumcorps` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('Brian Coon','1997-01-01','Guard',4,'Blue Devils'),('Damon Durrah','2000-08-08','Mellophone',4,'Blue Devils'),('David Guzman-Kern','1999-06-06','Contra',4,'Blue Devils'),('Fernando Lobato','1998-07-07','Euphonium',4,'Blue Devils'),('John Marr','1999-03-03','Guard',4,'Blue Devils'),('Keely Garcia','2002-04-04','Guard',4,'Blue Devils'),('Robert Jordan','1997-02-02','Guard',4,'Blue Devils'),('Rock Irving','2001-05-05','Guard',4,'Blue Devils'),('Tony Taps','2000-06-06','Trumpet',4,'Blue Devils');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_piece`
--

DROP TABLE IF EXISTS `music_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music_piece` (
  `mus_name` varchar(64) NOT NULL,
  `composer` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  `copyrightdate` date DEFAULT NULL,
  `corps` varchar(64) NOT NULL,
  PRIMARY KEY (`mus_name`,`composer`),
  KEY `corps` (`corps`),
  CONSTRAINT `music_piece_ibfk_1` FOREIGN KEY (`corps`) REFERENCES `drumcorps` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_piece`
--

LOCK TABLES `music_piece` WRITE;
/*!40000 ALTER TABLE `music_piece` DISABLE KEYS */;
INSERT INTO `music_piece` VALUES ('Crystal','Simon Dobson','2005-03-03','Blue Devils'),('Diamonds','Rihanna','2010-02-02','Blue Devils'),('Flight of the Bumblebee','Korsakov','1900-01-01','Blue Devils'),('Fugue','Bach','1800-06-06','Carolina Crown'),('Moonlight Sonata','Beethoven','1823-05-05','Boston Crusaders'),('My Way','Frank Sinatra','1954-04-04','Cavaliers'),('The Triumph of Time','Peter Graham','1969-07-07','Santa Clara Vanguard');
/*!40000 ALTER TABLE `music_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performancedata`
--

DROP TABLE IF EXISTS `performancedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performancedata` (
  `placement` int NOT NULL,
  `musicscore` float DEFAULT NULL,
  `visualscore` float DEFAULT NULL,
  `totalscore` float NOT NULL,
  `corps` varchar(64) NOT NULL,
  `sid` int NOT NULL,
  `date` date NOT NULL,
  KEY `corps` (`corps`),
  KEY `sid` (`sid`),
  KEY `date` (`date`),
  CONSTRAINT `performancedata_ibfk_1` FOREIGN KEY (`corps`) REFERENCES `drumcorps` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `performancedata_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `showsite` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `performancedata_ibfk_3` FOREIGN KEY (`date`) REFERENCES `dcishow` (`date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performancedata`
--

LOCK TABLES `performancedata` WRITE;
/*!40000 ALTER TABLE `performancedata` DISABLE KEYS */;
INSERT INTO `performancedata` VALUES (1,99.5,99.5,99.5,'Blue Devils',2,'2017-08-09'),(2,97,99,98,'Santa Clara Vanguard',2,'2017-08-09'),(3,95,97,96,'Carolina Crown',2,'2017-08-09'),(4,91,95,93,'Blue Coats',2,'2017-08-09'),(5,90,92,91,'Cavaliers',2,'2017-08-09'),(6,93.5,89.5,91.5,'Boston Crusaders',2,'2017-08-09'),(7,86,90,88,'Blue Knights',2,'2017-08-09'),(8,88,86,87,'Phantom Regiment',2,'2017-08-09'),(9,86,86,86,'Crossmen',2,'2017-08-09');
/*!40000 ALTER TABLE `performancedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performs`
--

DROP TABLE IF EXISTS `performs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performs` (
  `corps` varchar(64) DEFAULT NULL,
  `mus_name` varchar(64) DEFAULT NULL,
  `member_name` varchar(64) DEFAULT NULL,
  KEY `corps` (`corps`),
  KEY `mus_name` (`mus_name`),
  KEY `member_name` (`member_name`),
  CONSTRAINT `performs_ibfk_1` FOREIGN KEY (`corps`) REFERENCES `drumcorps` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `performs_ibfk_2` FOREIGN KEY (`mus_name`) REFERENCES `music_piece` (`mus_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `performs_ibfk_3` FOREIGN KEY (`member_name`) REFERENCES `member` (`member_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performs`
--

LOCK TABLES `performs` WRITE;
/*!40000 ALTER TABLE `performs` DISABLE KEYS */;
INSERT INTO `performs` VALUES ('Blue Devils','Diamonds','Tony Taps'),('Blue Devils','Flight of the Bumblebee','Tony Taps'),('Blue Devils','Crystal','Tony Taps'),('Blue Devils','Diamonds','John Marr'),('Blue Devils','Diamonds','Keely Garcia'),('Blue Devils','Diamonds','Robert Jordan');
/*!40000 ALTER TABLE `performs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prop`
--

DROP TABLE IF EXISTS `prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prop` (
  `PropID` int NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT 'UNKNOWN',
  `corps` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  `corps_program` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  PRIMARY KEY (`PropID`),
  KEY `corps` (`corps`),
  KEY `corps_program` (`corps_program`),
  CONSTRAINT `prop_ibfk_1` FOREIGN KEY (`corps`) REFERENCES `drumcorps` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `prop_ibfk_2` FOREIGN KEY (`corps_program`) REFERENCES `drumcorps` (`program_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prop`
--

LOCK TABLES `prop` WRITE;
/*!40000 ALTER TABLE `prop` DISABLE KEYS */;
INSERT INTO `prop` VALUES (0,'Large stairs','Blue Devils','Metamorph'),(1,'Fake Diamond Gemstone ','Blue Devils','Metamorph'),(2,'Jagged platform 1','Blue Coats','Jagged Line'),(3,'Jagged platform 2','Blue Coats','Jagged Line'),(4,'Jagged platform 3','Blue Coats','Jagged Line'),(5,'Jagged platform 4','Blue Coats','Jagged Line'),(6,'Fake Noose','Boston Crusaders','Wicked Games'),(7,'Fence/Jail-cell','Crossmen','Enigma'),(8,'Bird wings','Blue Devils','Metamorph'),(9,'Donut shaped platform #1','Cavaliers','Men are from Mars'),(10,'Donut shaped platform #2','Cavaliers','Men are from Mars'),(11,'Red Circle Platform','Santa Clara Vanguard','Ouroboros');
/*!40000 ALTER TABLE `prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showsite`
--

DROP TABLE IF EXISTS `showsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showsite` (
  `sid` int NOT NULL,
  `street` varchar(64) DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `state` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  `city` varchar(64) NOT NULL DEFAULT 'UNKNOWN',
  `spectator_capacity` int DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showsite`
--

LOCK TABLES `showsite` WRITE;
/*!40000 ALTER TABLE `showsite` DISABLE KEYS */;
INSERT INTO `showsite` VALUES (0,'Brookbank',60516,'IL','Downers Grove',5),(1,'Hemenway Ave.',2115,'Massachusetts','Boston',1430),(2,'Main Street',40764,'Indiana','Indianapolis',3400),(3,'Carpenter Road',60515,'Illinois','Darien',430),(4,'Ogden Ave.',60515,'Illinois','Woodridge',360);
/*!40000 ALTER TABLE `showsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dci'
--

--
-- Dumping routines for database 'dci'
--
/*!50003 DROP PROCEDURE IF EXISTS `createCorps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createCorps`(name VARCHAR(64), program_name VARCHAR(64), year INT)
BEGIN
	INSERT INTO 
		drumcorps(name, program_name, year)
	VALUES 
		(name, program_name, year);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createDcishow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createDcishow`(name VARCHAR(64), date DATE , weather VARCHAR(200),
attendance INT, sid INT ,  streetname VARCHAR(64) , show_city VARCHAR(64), show_state VARCHAR(64))
BEGIN 
    DECLARE n_sid INT;
    
    IF sid = NULL
    THEN
		SET n_sid = (SELECT MAX(sid) + 1 FROM dcishow);
	END IF;
    
    IF NOT EXISTS (SELECT * FROM showsite WHERE showsite.street = streetname AND showsite.city = show_city)
    THEN
    INSERT INTO showsite(sid, street,zipcode ,state, city, spectator_capacity)
    VALUES (sid, streetname, NULL , show_state, show_city, NULL)
    ;
    ELSE (SELECT sid INTO n_sid FROM showsite
    WHERE showsite.street = streetname AND showsite.city = show_city)
    ;
    END IF;
    
    SELECT n_sid;
	INSERT INTO dcishow
		(name, date, weather, attendance, sid )
	VALUES 
		(name, date, weather, attendance, n_sid);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createEquipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createEquipment`(eid INT, eq_name VARCHAR(64), brand VARCHAR(64),
member_name VARCHAR(64), corps VARCHAR(64), corps_program VARCHAR(64), corps_year INT, 
        member_dob DATE, member_yrs INT)
BEGIN
	DECLARE corps_name, m_name VARCHAR(64); 

    IF NOT EXISTS (SELECT * FROM drumcorps WHERE drumcorps.program_name = corps_program
					AND drumcorps.year = corps_year)
    THEN
    INSERT INTO drumcorps(name, program_name, year)
    VALUES (NULL, corps_program, corps_year)
    ;
    ELSE (SELECT name INTO corps_name FROM drumcorps
    WHERE drumcorps.program_name = corps_program AND drumcorps.year = corps_year)
    ;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM member WHERE member.dob = member_dob
					AND member.years_experience = member_yrs AND member.corps = corps_name)
    THEN
    INSERT INTO member(member_name, dob, section, years_experience, corps)
    VALUES (NULL, member_dob, NULL, member_yrs, corps_name)
    ;
    ELSE (SELECT member_name INTO m_name FROM member
    WHERE member.dob = member_dob
		AND member.years_experience = member_yrs AND member.corps = corps_name)
    ;
    END IF;
    
	INSERT INTO equipment
		(eid , eq_name, brand , member_name , corps )
	VALUES 
		(eid, eq_name, brand, m_name, corps_name);

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createMember`(member_name VARCHAR(64), dob date, section VARCHAR(64),
years_experience INT, corps VARCHAR(64), corps_program VARCHAR(64), corps_year INT)
BEGIN
	DECLARE corps_name VARCHAR(64); 

    IF NOT EXISTS (SELECT * FROM drumcorps WHERE drumcorps.program_name = corps_program
					AND drumcorps.year = corps_year)
    THEN
    INSERT INTO drumcorps(name, program_name, year)
    VALUES (NULL, corps_program, corps_year)
    ;
    ELSE (SELECT name INTO corps_name FROM drumcorps
    WHERE drumcorps.program_name = corps_program AND drumcorps.year = corps_year)
    ;
    END IF;
    
	INSERT INTO member
		(member_name, dob, section, years_experience, corps)
	VALUES 
		(member_name, dob, section, years_experience, corps_name);

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createMusic_piece` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createMusic_piece`(mus_name VARCHAR(64), composer VARCHAR(64), copyrightdate DATE,
corps VARCHAR(64), corps_program VARCHAR(64), corps_year INT)
BEGIN
	DECLARE corps_name VARCHAR(64); 

    IF NOT EXISTS (SELECT * FROM drumcorps WHERE drumcorps.program_name = corps_program
					AND drumcorps.year = corps_year)
    THEN
    INSERT INTO drumcorps(name, program_name, year)
    VALUES (NULL, corps_program, corps_year)
    ;
    ELSE (SELECT name INTO corps_name FROM drumcorps
    WHERE drumcorps.program_name = corps_program AND drumcorps.year = corps_year)
    ;
    END IF;
    
	INSERT INTO music_piece
		(mus_name, composer, copyrightdate, corps)
	VALUES 
		(mus_name, composer, copyrightdate, corps_name);

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createPerformancedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPerformancedata`(placement INT, musicscore FLOAT, visualscore FLOAT,
totalscore FLOAT, corps VARCHAR(64), sid INT, perf_date DATE, corps_program VARCHAR(64),
corps_year INT, streetname VARCHAR(64), show_city VARCHAR(64))
BEGIN
	DECLARE corps_name VARCHAR(64); 
    DECLARE show_date DATE;
    DECLARE show_id INT;
    
    IF NOT EXISTS (SELECT * FROM drumcorps WHERE drumcorps.program_name = corps_program
					AND drumcorps.year = corps_year)
    THEN
    INSERT INTO drumcorps(name, program_name, year)
    VALUES (NULL, corps_program, corps_year)
    ;
    ELSE (SELECT name INTO corps_name FROM drumcorps
    WHERE drumcorps.program_name = corps_program AND drumcorps.year = corps_year)
    ;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM showsite WHERE showsite.street = streetname AND showsite.city = show_city)
    THEN
    INSERT INTO showsite(sid, street,zipcode ,state, city, spectator_capacity)
    VALUES (sid, streetname, NULL , NULL, show_city, NULL)
    ;
    ELSE (SELECT sid INTO show_id FROM showsite
    WHERE showsite.street = streetname AND showsite.city = show_city)
    ;
    END IF;
    
    
    SELECT date INTO show_date FROM dcishow
    WHERE dcishow.name = corps;
    
	INSERT INTO performanceData
		(placement, musicscore, visualscore, totalscore, corps, sid, date)
	VALUES 
		(placement, musicscore, visualscore, totalscore, corps_name, show_id, perf_date);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createPerforms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createPerforms`(corps VARCHAR(64), mus_name VARCHAR(64), member_name VARCHAR(64), 
		corps_program VARCHAR(64), corps_year INT, mus_composer VARCHAR(64), mus_copyrightdate DATE,
        member_dob DATE, member_yrs INT)
BEGIN
	DECLARE corps_name, corps_music, m_name VARCHAR(64); 

    IF NOT EXISTS (SELECT * FROM drumcorps WHERE drumcorps.program_name = corps_program
					AND drumcorps.year = corps_year)
    THEN
    INSERT INTO drumcorps(name, program_name, year)
    VALUES (NULL, corps_program, corps_year)
    ;
    ELSE (SELECT name INTO corps_name FROM drumcorps
    WHERE drumcorps.program_name = corps_program AND drumcorps.year = corps_year)
    ;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM music_piece WHERE music_piece.composer = mus_composer
					AND music_piece.copyrightdate = mus_copyrightdate)
    THEN
    INSERT INTO music_piece(mus_name, composer, copyrightdate, corps)
    VALUES (NULL, mus_composer, mus_copyrightdate, corps_name)
    ;
    ELSE (SELECT mus_name INTO corps_music FROM music_piece
    WHERE music_piece.composer = mus_composer
					AND music_piece.copyrightdate = mus_copyrightdate)
    ;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM member WHERE member.dob = member_dob
					AND member.years_experience = member_yrs AND member.corps = corps_name)
    THEN
    INSERT INTO member(member_name, dob, section, years_experience, corps)
    VALUES (NULL, member_dob, NULL, member_yrs, corps_name)
    ;
    ELSE (SELECT member_name INTO m_name FROM member
    WHERE member.dob = member_dob
		AND member.years_experience = member_yrs AND member.corps = corps_name)
    ;
    END IF;
    
	INSERT INTO performs
		(corps , mus_name , member_name )
	VALUES 
		(corps_name, corps_music, m_name);

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createProp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createProp`(PropID INT, description VARCHAR(256), corps VARCHAR(64), 
	drumcorps_program VARCHAR(64), corps_year INT)
BEGIN
	DECLARE corps_name VARCHAR(64);
    DECLARE dc_program VARCHAR(64); 
    
    IF NOT EXISTS (SELECT * FROM drumcorps WHERE drumcorps.program_name = drumcorps_program
					AND drumcorps.year = corps_year)
    THEN
    INSERT INTO drumcorps(name, program_name, year)
    VALUES (NULL, drumcorps_program, corps_year)
    ;
    ELSE (SELECT name INTO corps_name FROM drumcorps
    WHERE drumcorps.program_name = drumcorps_program AND drumcorps.year = corps_year)
    ;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM drumcorps WHERE drumcorps.name = corps
					AND drumcorps.year = corps_year)
    THEN
    INSERT INTO drumcorps(name, program_name, year)
    VALUES (corps, NULL, corps_year)
    ;
    ELSE (SELECT drumcorps_program INTO dc_program FROM drumcorps
    WHERE drumcorps.name = corps AND drumcorps.year = corps_year)
    ;
    END IF;
    
	INSERT INTO prop
		(PropID, description, corps, corps_program)
	VALUES 
		(PropID, description, corps_name, dc_program);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createShowsite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createShowsite`(sid INT , street VARCHAR(64) ,zipcode INT,state VARCHAR(64),
city VARCHAR(64) , spectator_capacity INT)
BEGIN

	INSERT INTO showsite
		(sid, street,zipcode ,state, city, spectator_capacity)
	VALUES 
		(sid, street,zipcode ,state, city, spectator_capacity);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteDcishow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDcishow`(d_sid INT )
BEGIN
	DELETE FROM dcishow
    WHERE sid = d_sid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteDrumcorps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDrumcorps`(d_name VARCHAR(64) )
BEGIN
	DELETE FROM drumcorps
    WHERE name = d_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteMember`(d_name VARCHAR(64), d_dob DATE )
BEGIN
	DELETE FROM member
    WHERE member_name = d_name AND dob = d_dob;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteMusicpiece` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteMusicpiece`(d_music VARCHAR(64), d_composer VARCHAR(64 ))
BEGIN
	DELETE FROM music_piece
    WHERE mus_name = d_music AND composer = d_composer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteProp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProp`(d_pid VARCHAR(64))
BEGIN
	DELETE FROM prop
    WHERE PropID = d_pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteShowsite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteShowsite`(d_sid VARCHAR(64))
BEGIN
	DELETE FROM showsite
    WHERE sid = d_sid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readCorpsmembers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readCorpsmembers`(s_corps VARCHAR(64), s_section VARCHAR(64))
BEGIN
	SELECT * FROM member 
		WHERE corps = s_corps AND section = s_section;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readCorpsprop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readCorpsprop`(s_corps VARCHAR(64))
BEGIN
	SELECT * from prop
	WHERE corps = s_corps;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readcorpsseason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readcorpsseason`(s_name VARCHAR(64), s_year INT)
BEGIN
	WITH c AS(
	WITH b AS(
	SELECT name, date, dcishow.sid, state, city FROM dcishow JOIN showsite
			ON dcishow.sid = showsite.sid)
			SELECT corps, placement, totalscore, b.* FROM performancedata JOIN b
				ON performancedata.sid = b.sid)
					SELECT * FROM c
						WHERE corps = s_name AND YEAR(date) = s_year;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readDcishow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readDcishow`()
BEGIN
    SELECT * FROM dcishow;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readDrumcorps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readDrumcorps`()
BEGIN
    SELECT * FROM drumcorps;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readEligible` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readEligible`()
BEGIN
	SELECT * FROM member WHERE YEAR(SYSDATE()) <= (YEAR(dob) + 21);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readEquipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readEquipment`()
BEGIN
    SELECT * FROM equipment;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readMember`()
BEGIN
    SELECT * FROM member;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readMusicbycomposer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readMusicbycomposer`(s_composer VARCHAR(64))
BEGIN
	SELECT * from music_piece
	WHERE composer = s_composer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readMusic_piece` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readMusic_piece`()
BEGIN
    SELECT * FROM music_piece;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readPerformancedata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readPerformancedata`()
BEGIN
    SELECT * FROM performancedata;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readPerforms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readPerforms`()
BEGIN
    SELECT * FROM performs;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readProp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readProp`()
BEGIN
    SELECT * FROM prop;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readSeason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readSeason`(s_year INT, s_state VARCHAR(64))
BEGIN
	WITH b AS(
	SELECT name, date, dcishow.sid, state, city FROM dcishow JOIN showsite
			ON dcishow.sid = showsite.sid)
					SELECT * FROM b
						WHERE YEAR(date) = s_year AND state = s_state
                        ORDER BY date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readShowcities` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readShowcities`(s_year INT)
BEGIN
	WITH b AS(
	SELECT name, city, date FROM dcishow JOIN showsite
			ON dcishow.sid = showsite.sid)
					SELECT * FROM b
						WHERE YEAR(date) = s_year 
                        ORDER BY city;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readShowsite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readShowsite`()
BEGIN
    SELECT * FROM showsite;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateAttendance`(
new_attendance INT, n_sid INT)
BEGIN
	UPDATE dcishow
	SET
	-- name = new_name, date = new_date, weather = new_weather, 
    attendance = new_attendance WHERE sid = n_sid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateCorpsprogram` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCorpsprogram`(new_progname VARCHAR(64), n_name VARCHAR(64), n_year INT)
BEGIN
	UPDATE drumcorps
	SET
      program_name = new_progname WHERE name = n_name AND year = n_year;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateMemberSection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMemberSection`(new_section VARCHAR(64), n_name VARCHAR(64), n_dob DATE)
BEGIN
	UPDATE member
	SET
	-- name = new_name, date = new_date, weather = new_weather, 
    section = new_section WHERE dob = n_dob AND member_name = n_name;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateMemberYears` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateMemberYears`(new_years VARCHAR(64), n_name VARCHAR(64), n_dob DATE)
BEGIN
	UPDATE member
	SET
	-- name = new_name, date = new_date, weather = new_weather, 
     years_experience = new_years WHERE dob = n_dob AND member_name = n_name;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateProp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateProp`(n_desc VARCHAR(64), n_corps VARCHAR(64), n_program VARCHAR(64))
BEGIN
	UPDATE prop
	SET
		description = n_desc WHERE corps = n_corps AND corps_program = n_program;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateScores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateScores`(n_placement INT, n_musicscore FLOAT, n_visualscore FLOAT, 
	n_totalscore FLOAT, n_sid INT, n_corps VARCHAR(64))
BEGIN
	UPDATE performancedata
	SET
		placement = n_placement WHERE sid = n_sid AND corps = n_corps;
        
	UPDATE performancedata
	SET 
		musicscore = n_musicscore WHERE sid = n_sid AND corps = n_corps;
	UPDATE performancedata
	SET 
		visualscore = n_visualscore WHERE sid = n_sid AND corps = n_corps;
	UPDATE performancedata
	SET 
		totalscore = n_totalscore WHERE sid = n_sid AND corps = n_corps;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateShowcapacity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShowcapacity`(n_spectator_capacity INT, n_sid INT)
BEGIN
	UPDATE showsite
	SET
		spectator_capacity = n_spectator_capacity WHERE sid = n_sid;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateShowloc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateShowloc`(n_street VARCHAR(64), n_zipcode INT, n_state VARCHAR(64),
	n_city VARCHAR(64), n_sid INT)
BEGIN
	UPDATE showsite
	SET
		street = n_street WHERE sid = n_sid;
        
	UPDATE showsite
	SET 
		zipcode = n_zipcode WHERE sid = n_sid;
        
	UPDATE showsite
	SET 
		state = n_state WHERE sid = n_sid;
        
	UPDATE showsite
	SET 
		city = n_city WHERE sid = n_sid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateWeather` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateWeather`(
new_weather VARCHAR(64), n_sid INT)
BEGIN
	UPDATE dcishow
	SET
	-- name = new_name, date = new_date, weather = new_weather, 
    weather = new_weather WHERE sid = n_sid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-28  0:18:54
