-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: gestionale_ps
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `animali`
--

DROP TABLE IF EXISTS `animali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animali` (
  `Matricola` int NOT NULL AUTO_INCREMENT,
  `nome_animale` varchar(255) NOT NULL,
  `data_acquisto` date DEFAULT NULL,
  `prezzo` decimal(10,2) NOT NULL,
  `tipo_animale` varchar(255) NOT NULL,
  `idCliente` int DEFAULT NULL,
  PRIMARY KEY (`Matricola`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `animali_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clienti` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animali`
--

LOCK TABLES `animali` WRITE;
/*!40000 ALTER TABLE `animali` DISABLE KEYS */;
INSERT INTO `animali` VALUES (1,'gino','2023-12-12',12.00,'gatto',1),(2,'giammario','2023-10-30',155.00,'gatto',1),(3,'Dino Sauro',NULL,10.00,'criceto',NULL);
/*!40000 ALTER TABLE `animali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienti` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `citta` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'alessandro','marangoni','via giacomini 12','gatteo','3883814275'),(2,'petro','mauri','via lini 1','rimini','3335678165');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psutenti`
--

DROP TABLE IF EXISTS `psutenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psutenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `datadinascita` date NOT NULL,
  `cellulare` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `ruolo` enum('M','G') NOT NULL DEFAULT 'G',
  `stato` enum('D','A') NOT NULL DEFAULT 'A',
  `tentativi_accesso` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psutenti`
--

LOCK TABLES `psutenti` WRITE;
/*!40000 ALTER TABLE `psutenti` DISABLE KEYS */;
INSERT INTO `psutenti` VALUES (1,'alessandro','marangoni','prova update','peovsa1133@gmail.com','2023-12-19','3883814555','ggggggggggg','M','A',1),(3,'alessandro','marangoni','alma1998','prova0@gmail.com','1998-12-12','3883814555','ggggggggg','M','A',0),(4,'andrea','giammarchi','angi2023','andrea0@gmail.com','2023-12-19','3883814555','ciao','G','A',0),(5,'alessandro','marangoni','alma2023_2','alessandrongoni980@gmail.com','2023-12-19','3883814555','ciao','G','A',0),(7,'alessandro','marangoni','alma2023_3','romarangoni980@gmail.com','2023-12-19','3883814555','ciao','G','A',0),(8,'alessandro','marangoni','alma2023_4','alessandr0@gmail.com','2023-12-19','3883814555','ciao','M','A',0),(11,'alessandro','marangoni','alma2023_5','alessandromarai980@gmail.com','2023-12-19','3883814555','ciao','G','A',0),(12,'alessandro','marangoni','alma2023_6','alesngoni980@gmail.com','2023-12-19','3883814555','ciao','G','A',0),(13,'alessandro','marangoni','alma2023_7','al@gmail.com','2023-12-19','3883814555','ciao','G','A',0),(14,'alessandro','marangoni','alma2023_8','alessandromarang0@gmail.com','2023-12-19','3883814555','ciao','G','A',0),(15,'daniele','rossi','daro1990','daniele@gmail.com','1990-12-12','3883814555','ciao','G','A',0);
/*!40000 ALTER TABLE `psutenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gestionale_ps'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-10 15:18:15
