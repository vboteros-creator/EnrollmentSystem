CREATE DATABASE  IF NOT EXISTS `enrollmentsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `enrollmentsystem`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: enrollmentsystem
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `assign`
--

DROP TABLE IF EXISTS `assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign` (
  `SubjID` int NOT NULL,
  `TID` int NOT NULL,
  UNIQUE KEY `SubjID` (`SubjID`),
  KEY `TID` (`TID`),
  CONSTRAINT `assign_ibfk_1` FOREIGN KEY (`SubjID`) REFERENCES `subjects` (`subjid`),
  CONSTRAINT `assign_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `teachers` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign`
--

LOCK TABLES `assign` WRITE;
/*!40000 ALTER TABLE `assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enroll`
--

DROP TABLE IF EXISTS `enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enroll` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `studid` int DEFAULT NULL,
  `subjid` int DEFAULT NULL,
  `evaluation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `studid` (`studid`,`subjid`),
  KEY `subjid` (`subjid`),
  CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`studid`) REFERENCES `students` (`studid`),
  CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`subjid`) REFERENCES `subjects` (`subjid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enroll`
--

LOCK TABLES `enroll` WRITE;
/*!40000 ALTER TABLE `enroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `gradeid` int NOT NULL AUTO_INCREMENT,
  `enroll_eid` int NOT NULL,
  `prelim` varchar(10) DEFAULT NULL,
  `midterm` varchar(10) DEFAULT NULL,
  `prefinal` varchar(10) DEFAULT NULL,
  `final` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`gradeid`),
  UNIQUE KEY `enroll_eid` (`enroll_eid`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`enroll_eid`) REFERENCES `enroll` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `studid` int NOT NULL,
  `studname` varchar(100) DEFAULT NULL,
  `studadd` varchar(255) DEFAULT NULL,
  `studcrs` varchar(100) DEFAULT NULL,
  `studgender` varchar(20) DEFAULT NULL,
  `yrlvl` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subjid` int NOT NULL,
  `subjcode` varchar(20) NOT NULL,
  `subjdesc` varchar(100) DEFAULT NULL,
  `subjunits` int DEFAULT NULL,
  `subjsched` varchar(50) DEFAULT NULL,
  `teacherid` int DEFAULT NULL,
  PRIMARY KEY (`subjid`),
  KEY `subjects_ibfk_1` (`teacherid`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`teacherid`) REFERENCES `teachers` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `tid` int NOT NULL,
  `tname` varchar(100) NOT NULL,
  `tdept` varchar(50) DEFAULT NULL,
  `tcontact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-15  9:24:40
