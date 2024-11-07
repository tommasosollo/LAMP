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
-- Table structure for table `Attori`
--

DROP TABLE IF EXISTS `Attori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attori` (
  `ID_Attore` int NOT NULL,
  `ID_Film` int NOT NULL,
  KEY `ID_Film` (`ID_Film`),
  KEY `ID_Attore` (`ID_Attore`),
  CONSTRAINT `Attori_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID_Film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Attori_ibfk_2` FOREIGN KEY (`ID_Attore`) REFERENCES `attore` (`ID_Attore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attori`
--

LOCK TABLES `Attori` WRITE;
/*!40000 ALTER TABLE `Attori` DISABLE KEYS */;
INSERT INTO `Attori` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);
/*!40000 ALTER TABLE `Attori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `ID_Acquisto` int NOT NULL AUTO_INCREMENT,
  `Data_Pagamento` date NOT NULL,
  `Prezzo` float NOT NULL,
  `ID_Film` int NOT NULL,
  `ID_Cliente` int NOT NULL,
  PRIMARY KEY (`ID_Acquisto`),
  KEY `ID_Film` (`ID_Film`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `acquisto_ibfk_1` FOREIGN KEY (`ID_Film`) REFERENCES `film` (`ID_Film`) ON UPDATE CASCADE,
  CONSTRAINT `acquisto_ibfk_2` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES (1,'2024-05-27',100,1,1),(2,'2024-05-28',150,2,2),(3,'2024-05-28',200,3,3);
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attore`
--

DROP TABLE IF EXISTS `attore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attore` (
  `ID_Attore` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Attore`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attore`
--

LOCK TABLES `attore` WRITE;
/*!40000 ALTER TABLE `attore` DISABLE KEYS */;
INSERT INTO `attore` VALUES (1,'Zoe','Saldana'),(2,'Sam','Worthington'),(3,'Kate','Winslet'),(4,'Leonardo','DiCaprio'),(5,'Robert','Downey Jr.'),(6,'Ben','Kingsley');
/*!40000 ALTER TABLE `attore` ENABLE KEYS */;
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
INSERT INTO `categoria` VALUES (1,'Fantascienza'),(2,'Azione'),(3,'Drammatico');
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
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`ID_Regista`) REFERENCES `regista` (`ID_Regista`) ON UPDATE CASCADE,
  CONSTRAINT `film_ibfk_2` FOREIGN KEY (`ID_Produttore`) REFERENCES `produttore` (`ID_Produttore`) ON UPDATE CASCADE,
  CONSTRAINT `film_ibfk_3` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria` (`ID_Categoria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Avatar','02:42:00',2009,1,1,1),(2,'Titanic','03:15:00',1997,1,2,3),(3,'Ironman 3','02:10:00',2013,2,3,2);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
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
  `Cognome` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_Produttore`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produttore`
--

LOCK TABLES `produttore` WRITE;
/*!40000 ALTER TABLE `produttore` DISABLE KEYS */;
INSERT INTO `produttore` VALUES (1,'James','Cameron'),(2,'Jon','Landau'),(3,'Stan','Lee');
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
INSERT INTO `regista` VALUES (1,'James','Cameron'),(2,'Shane','Black'),(3,'Enrico','Bellini');
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

-- Dump completed on 2024-11-07  8:41:27
