CREATE DATABASE  IF NOT EXISTS `system_bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `system_bank`;
-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: system_bank
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `202400008_bankaccount_deposit`
--

DROP TABLE IF EXISTS `202400008_bankaccount_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `202400008_bankaccount_deposit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(11) DEFAULT NULL,
  `accountDeposited` float DEFAULT NULL,
  `dateDeposited` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `202400008_bankaccount_deposit`
--

LOCK TABLES `202400008_bankaccount_deposit` WRITE;
/*!40000 ALTER TABLE `202400008_bankaccount_deposit` DISABLE KEYS */;
INSERT INTO `202400008_bankaccount_deposit` VALUES (1,202400008,5000,'2024-10-11 08:27:49.664768'),(2,202400008,300,'2024-10-11 08:30:35.305145'),(3,202400008,500,'2024-10-11 18:01:32.661160'),(4,202400008,500,'2024-10-11 19:02:15.938190'),(5,202400008,500,'2024-10-11 19:02:22.733511'),(6,202400008,560,'2024-10-11 19:03:24.580962'),(7,202400008,569.6,'2024-10-11 19:05:01.033543'),(8,202400008,600,'2024-10-11 19:07:07.511910'),(9,202400008,500,'2024-10-11 19:10:17.623865'),(10,202400008,560,'2024-10-11 19:12:52.416226'),(11,202400008,500,'2024-10-11 19:13:58.374789'),(12,202400008,500,'2024-10-11 19:22:37.323970');
/*!40000 ALTER TABLE `202400008_bankaccount_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `202400008_bankaccount_withdraw`
--

DROP TABLE IF EXISTS `202400008_bankaccount_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `202400008_bankaccount_withdraw` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(11) DEFAULT NULL,
  `accountWithdrawn` float DEFAULT NULL,
  `dateWithdrawn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `202400008_bankaccount_withdraw`
--

LOCK TABLES `202400008_bankaccount_withdraw` WRITE;
/*!40000 ALTER TABLE `202400008_bankaccount_withdraw` DISABLE KEYS */;
INSERT INTO `202400008_bankaccount_withdraw` VALUES (1,202400008,300,'2024-10-11 08:40:50.716203'),(2,202400008,500,'2024-10-11 17:49:11.242398'),(3,202400008,500,'2024-10-11 17:59:26.653281'),(4,202400008,500,'2024-10-11 18:26:02.987158'),(5,202400008,500,'2024-10-11 18:27:38.295004'),(6,202400008,500,'2024-10-11 18:31:17.968629'),(7,202400008,500,'2024-10-11 18:33:15.943870'),(8,202400008,500,'2024-10-11 18:35:23.601450'),(9,202400008,500,'2024-10-11 19:03:02.038638'),(10,202400008,500,'2024-10-11 19:14:52.791568');
/*!40000 ALTER TABLE `202400008_bankaccount_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `202400009_bankaccount_deposit`
--

DROP TABLE IF EXISTS `202400009_bankaccount_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `202400009_bankaccount_deposit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(11) DEFAULT NULL,
  `accountDeposited` float DEFAULT NULL,
  `dateDeposited` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `202400009_bankaccount_deposit`
--

LOCK TABLES `202400009_bankaccount_deposit` WRITE;
/*!40000 ALTER TABLE `202400009_bankaccount_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `202400009_bankaccount_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `202400009_bankaccount_withdraw`
--

DROP TABLE IF EXISTS `202400009_bankaccount_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `202400009_bankaccount_withdraw` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AccountNumber` int(11) DEFAULT NULL,
  `accountWithdrawn` float DEFAULT NULL,
  `dateWithdrawn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `202400009_bankaccount_withdraw`
--

LOCK TABLES `202400009_bankaccount_withdraw` WRITE;
/*!40000 ALTER TABLE `202400009_bankaccount_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `202400009_bankaccount_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_bank`
--

DROP TABLE IF EXISTS `users_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_bank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `accountNumber` int(11) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `PIN` varchar(6) DEFAULT NULL,
  `amountValue` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_bank`
--

LOCK TABLES `users_bank` WRITE;
/*!40000 ALTER TABLE `users_bank` DISABLE KEYS */;
INSERT INTO `users_bank` VALUES (9,202400001,'Tamad','Juan','123456',NULL),(10,202400002,'Tamad','Juan','123456',NULL),(11,202400003,'Tamad','Juan','123456',NULL),(12,202400004,'Tamad','Juan','123456',NULL),(13,202400005,'Tamad','Juan','123456',3840.69),(14,202400006,'Santos','Mark','123456',NULL),(15,202400007,'Santos','Juan','123456',1000),(16,202400008,'Ignacio','Juan','232608',5789.6),(17,202400009,'Mark','Juan','123456',NULL);
/*!40000 ALTER TABLE `users_bank` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 19:52:41
