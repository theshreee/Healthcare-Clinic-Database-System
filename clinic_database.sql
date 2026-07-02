CREATE DATABASE  IF NOT EXISTS `clinic_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinic_db`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clinic_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `ApptID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `Appt_date` date DEFAULT NULL,
  `Appt_time` time DEFAULT NULL,
  `Status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`ApptID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON DELETE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (201,1,1,'2026-07-01','09:00:00','Completed'),(202,2,2,'2026-07-04','10:00:00','Pending'),(203,3,4,'2026-07-05','11:00:00','Cancelled'),(204,4,1,'2026-07-07','12:00:00','Pending'),(205,5,3,'2026-07-09','13:00:00','Completed'),(206,6,4,'2026-07-11','14:00:00','Completed'),(207,7,2,'2026-07-13','15:00:00','Cancelled'),(208,8,1,'2026-07-16','16:00:00','Cancelled'),(209,9,5,'2026-07-16','17:00:00','Pending'),(210,10,5,'2026-07-20','18:00:00','Pending'),(211,11,5,'2026-07-25','19:00:00','Completed');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clinic_dashboard`
--

DROP TABLE IF EXISTS `clinic_dashboard`;
/*!50001 DROP VIEW IF EXISTS `clinic_dashboard`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clinic_dashboard` AS SELECT 
 1 AS `First_name`,
 1 AS `Last_name`,
 1 AS `Doctor`,
 1 AS `Appt_date`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Specialization` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Farhan Khan','Cardiologist','9687458596','farhan@clinic.com'),(2,'Sheetal','Surgen','6895696848','sheetal@clinic.com'),(3,'Rohit Sharma','Dentist','9485232142','rohit@clinic.com'),(4,'Rupinder Kaur','Dermologist','9874563219','rupinder@clinic.com'),(5,'Shashi Bala','Surgen','9812123212','shashibala@clinic.com');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Age` int NOT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Phone` varchar(15) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Blood_group` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Amandeep','Singh',29,'Male','945689236','amandeepsingh324@gmail.com','A+'),(2,'Dapinder','Kaur',20,'Female','6236984756','dapinderkaur@gmail.com','B+'),(3,'Pardeep','Kaur',19,'Female','6258749636','pardeepkaur@gamil.com','A+'),(4,'Manjot','Kaur',20,'Female','7502639856','manjotkaur@gmail.com','A+'),(5,'Jasdeep','Singh',32,'Male','9874562584','jasdeepsingh@gmsil.com','O+'),(6,'Harmandeep','Singh',26,'Male','9874562543','harmandeepsingh@gmsil.com','B+'),(7,'Tushar','Bali',22,'Male','6239852165','tushar@gmail.com','O+'),(8,'Tanish','Kumar',45,'Male','7596369586','tanishkumar56@gmail.com','AB+'),(9,'Gurpreet','Singh',31,'Male','9485968475','gurpreetsingh@gmail.com','B+'),(10,'Rauni','Pabla',30,'Male','6574859651','raunipabla@gmail.com','O+'),(11,'Taranveer','Kaur',38,'Female','8745968596','taranveerkaur@gmail.com','O+');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `PrescriptionID` int NOT NULL AUTO_INCREMENT,
  `ApptID` int DEFAULT NULL,
  `Medicine_Name` varchar(100) NOT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `ApptID` (`ApptID`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`ApptID`) REFERENCES `appointments` (`ApptID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (11,201,'Aspirin','1 tablet after dinner','30 Days'),(12,201,'Atorvastatin','1 tablet morning','30 Days'),(13,202,'Ibuprofen','1 tablet twice a day','5 Days'),(14,203,'Paracetamol','1 tablet when fever','3 Days'),(15,203,'Cough Syrup','2 spoons night','5 Days'),(16,204,'Aspirin','1 tablet after dinner','30 Days'),(17,204,'Atorvastatin','1 tablet morning','30 Days'),(18,205,'Ibuprofen','1 tablet twice a day','5 Days'),(19,206,'Paracetamol','1 tablet when fever','3 Days'),(20,206,'Cough Syrup','2 spoons night','5 Days'),(21,207,'Aspirin','1 tablet after dinner','30 Days'),(22,207,'Atorvastatin','1 tablet morning','30 Days'),(23,208,'Ibuprofen','1 tablet twice a day','5 Days'),(24,209,'Paracetamol','1 tablet when fever','3 Days'),(25,209,'Cough Syrup','2 spoons night','5 Days'),(26,210,'Ibuprofen','1 tablet twice a day','5 Days'),(27,210,'Paracetamol','1 tablet when fever','3 Days'),(28,211,'Cough Syrup','2 spoons night','5 Days');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `clinic_dashboard`
--

/*!50001 DROP VIEW IF EXISTS `clinic_dashboard`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clinic_dashboard` AS select `patients`.`First_name` AS `First_name`,`patients`.`Last_name` AS `Last_name`,`doctors`.`Name` AS `Doctor`,`appointments`.`Appt_date` AS `Appt_date`,`appointments`.`Status` AS `Status` from ((`appointments` join `patients` on((`appointments`.`PatientID` = `patients`.`PatientID`))) join `doctors` on((`appointments`.`DoctorID` = `doctors`.`DoctorID`))) */;
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

-- Dump completed on 2026-07-02 23:31:10
