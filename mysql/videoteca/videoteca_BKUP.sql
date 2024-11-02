-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: videoteca
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `ID_Acquisto` int NOT NULL AUTO_INCREMENT,
  `ID_Film` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  PRIMARY KEY (`ID_Acquisto`),
  KEY `ID_Film` (`ID_Film`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID_Film`),
  CONSTRAINT `acquisto_ibfk_2` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID_Categoria` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Commedia'),(2,'Avventura'),(3,'Drammatico');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Mario','Rossi'),(2,'Giorgio','Bianchi'),(3,'Luigi','Verdi');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fattura` (
  `ID_Fattura` int NOT NULL AUTO_INCREMENT,
  `Data_Pagamento` date NOT NULL,
  `Prezzo` float NOT NULL,
  `ID_Acquisto` int NOT NULL,
  PRIMARY KEY (`ID_Fattura`),
  KEY `ID_Acquisto` (`ID_Acquisto`),
  CONSTRAINT `fattura_ibfk_1` FOREIGN KEY (`ID_Acquisto`) REFERENCES `acquisto` (`ID_Acquisto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
INSERT INTO `fattura` VALUES (1,'2022-01-01',100,1),(2,'2022-02-15',150,2),(3,'2022-03-30',200,3);
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `ID_Film` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(100) NOT NULL,
  `Durata` time DEFAULT NULL,
  `Anno_Uscita` year NOT NULL,
  `ID_Regista` int NOT NULL,
  `ID_Produttore` int NOT NULL,
  `ID_Categoria` int NOT NULL,
  PRIMARY KEY (`ID_Film`),
  KEY `ID_Regista` (`ID_Regista`),
  KEY `ID_Produttore` (`ID_Produttore`),
  KEY `ID_Categoria` (`ID_Categoria`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`ID_Regista`) REFERENCES `regista` (`ID_Regista`),
  CONSTRAINT `film_ibfk_2` FOREIGN KEY (`ID_Produttore`) REFERENCES `produttore` (`ID_Produttore`),
  CONSTRAINT `film_ibfk_3` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Il Mare di Capri','01:35:00',1993,1,1,1),(2,'Il Ritorno del Re','02:15:00',1985,2,2,2),(3,'Il Pianista','02:10:00',1973,3,3,3);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premi_vinti`
--

DROP TABLE IF EXISTS `premi_vinti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premi_vinti` (
  `ID_Premio_Vinto` int NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(100) NOT NULL,
  `Anno_Premio` year NOT NULL,
  `ID_Film` int NOT NULL,
  `ID_Premio` int NOT NULL,
  PRIMARY KEY (`ID_Premio_Vinto`),
  KEY `ID_Film` (`ID_Film`),
  KEY `ID_Premio` (`ID_Premio`),
  CONSTRAINT `premi_vinti_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID_Film`),
  CONSTRAINT `premi_vinti_ibfk_2` FOREIGN KEY (`ID_Premio`) REFERENCES `premio` (`ID_Premio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premi_vinti`
--

LOCK TABLES `premi_vinti` WRITE;
/*!40000 ALTER TABLE `premi_vinti` DISABLE KEYS */;
INSERT INTO `premi_vinti` VALUES (1,'Il Mare di Capri',1993,1,1),(2,'Il Ritorno del Re',1985,2,2),(3,'Il Pianista',1973,3,3);
/*!40000 ALTER TABLE `premi_vinti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio`
--

DROP TABLE IF EXISTS `premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premio` (
  `ID_Premio` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Ente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Premio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
INSERT INTO `premio` VALUES (1,'Oscar','American Film Institute'),(2,'Prime','British Film Institute'),(3,'Oscar','Academy of Motion Picture Arts and Sciences');
/*!40000 ALTER TABLE `premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produttore`
--

DROP TABLE IF EXISTS `produttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produttore` (
  `ID_Produttore` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Produttore`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produttore`
--

LOCK TABLES `produttore` WRITE;
/*!40000 ALTER TABLE `produttore` DISABLE KEYS */;
INSERT INTO `produttore` VALUES (1,'Maria Stella'),(2,'Antonio Russo'),(3,'Andrea Borghese');
/*!40000 ALTER TABLE `produttore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regista`
--

DROP TABLE IF EXISTS `regista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regista` (
  `ID_Regista` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Regista`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regista`
--

LOCK TABLES `regista` WRITE;
/*!40000 ALTER TABLE `regista` DISABLE KEYS */;
INSERT INTO `regista` VALUES (1,'Giuseppe','Boccaccio'),(2,'Guido','Borgogno'),(3,'Enrico','Bellini');
/*!40000 ALTER TABLE `regista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-02 12:05:58
