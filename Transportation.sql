-- MySQL dump 10.13  Distrib 9.0.1, for macos14.4 (arm64)
--
-- Host: localhost    Database: Transportation
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `Bus`
--

DROP TABLE IF EXISTS `Bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bus` (
  `BusNo` varchar(10) NOT NULL,
  `Source` varchar(50) DEFAULT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `CoachType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BusNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bus`
--

LOCK TABLES `Bus` WRITE;
/*!40000 ALTER TABLE `Bus` DISABLE KEYS */;
INSERT INTO `Bus` VALUES ('BUS123','Delhi','Mumbai','AC'),('BUS321','Chennai','Mumbai','Non-AC'),('BUS456','Kolkata','Pune','Non-AC'),('BUS654','Delhi','Kolkata','AC'),('BUS789','Bangalore','Hyderabad','AC');
/*!40000 ALTER TABLE `Bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `canceltickets`
--

DROP TABLE IF EXISTS `canceltickets`;
/*!50001 DROP VIEW IF EXISTS `canceltickets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `canceltickets` AS SELECT 
 1 AS `TicketNo`,
 1 AS `PNRNo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `PassengerID` varchar(10) NOT NULL,
  `TicketNo` varchar(15) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `ContactNo` varchar(15) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`),
  KEY `TicketNo` (`TicketNo`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`TicketNo`) REFERENCES `Ticket` (`TicketNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES ('PASS001','TICK001','Amit Sharma','9876543210',30,'M','123 Delhi'),('PASS002','TICK002','Rajesh Kumar','8765432109',25,'M','456 Kolkata'),('PASS003','TICK003','Priya Singh','7654321098',28,'F','789 Bangalore'),('PASS004','TICK004','Sana Khan','6543210987',12,'F','321 Chennai'),('PASS005','TICK005','Rahul Mehta','5432109876',40,'M','654 Delhi');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `PNRNo` varchar(20) NOT NULL,
  `DOJ` date DEFAULT NULL,
  `NoofSeats` int DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ContactNo` varchar(15) DEFAULT NULL,
  `BusNo` varchar(10) DEFAULT NULL,
  `SeatNo` int DEFAULT NULL,
  PRIMARY KEY (`PNRNo`),
  KEY `BusNo` (`BusNo`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`BusNo`) REFERENCES `Bus` (`BusNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES ('PNR001','2022-10-10',1,'123 Delhi','9876543210','BUS123',1),('PNR002','2022-10-10',2,'456 Kolkata','8765432109','BUS456',2),('PNR003','2022-10-09',1,'789 Bangalore','7654321098','BUS789',3),('PNR004','2022-10-10',3,'321 Chennai','6543210987','BUS321',4),('PNR005','2022-10-11',1,'654 Delhi','5432109876','BUS654',5);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `TicketNo` varchar(15) NOT NULL,
  `DOJ` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ContactNo` varchar(15) DEFAULT NULL,
  `BusNo` varchar(10) DEFAULT NULL,
  `SeatNo` int DEFAULT NULL,
  `Source` varchar(50) DEFAULT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `Status` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`TicketNo`),
  KEY `BusNo` (`BusNo`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`BusNo`) REFERENCES `Bus` (`BusNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES ('TICK001','2022-10-10','123 Delhi','9876543210','BUS123',1,'Delhi','Mumbai','Confirmed'),('TICK002','2022-10-10','456 Kolkata','8765432109','BUS456',2,'Kolkata','Pune','Confirmed'),('TICK003','2022-10-09','789 Bangalore','7654321098','BUS789',3,'Bangalore','Hyderabad','Confirmed'),('TICK004','2022-10-10','321 Chennai','6543210987','BUS321',4,'Chennai','Mumbai','Cancelled'),('TICK005','2022-10-11','654 Delhi','5432109876','BUS654',5,'Delhi','Kolkata','Cancelled');
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `canceltickets`
--

/*!50001 DROP VIEW IF EXISTS `canceltickets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `canceltickets` AS select `T`.`TicketNo` AS `TicketNo`,`R`.`PNRNo` AS `PNRNo` from (`ticket` `T` join `reservation` `R` on((`T`.`BusNo` = `R`.`BusNo`))) where (`T`.`Status` = 'Cancelled') */;
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

-- Dump completed on 2024-09-30  6:52:08
