-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: tcc
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `agendamentos_cirurgias`
--

DROP TABLE IF EXISTS `agendamentos_cirurgias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamentos_cirurgias` (
  `idagendamentos_cirurgias` int NOT NULL AUTO_INCREMENT,
  `local_corpo` enum('joelho','quadril','ombro','tornozelo') NOT NULL,
  `tipo_cirurgia` enum('Artroscopia','Substituição de Articulação','manguito rotador','tendão de aquiles','lca','lcp','lcl','menisco') NOT NULL,
  `status` enum('Pré Agendada','Agendada') NOT NULL,
  `data_hora` datetime NOT NULL,
  `fk_paciente` int NOT NULL,
  `fk_hospital` int NOT NULL,
  `fk_medico` int NOT NULL,
  PRIMARY KEY (`idagendamentos_cirurgias`),
  KEY `fk_paciente_idx` (`fk_paciente`),
  KEY `fk_medico_idx` (`fk_medico`),
  KEY `fk_hospital_idx` (`fk_hospital`),
  CONSTRAINT `fk_hospital` FOREIGN KEY (`fk_hospital`) REFERENCES `hospital` (`id_hospital`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_medico` FOREIGN KEY (`fk_medico`) REFERENCES `medico` (`id_medico`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_paciente` FOREIGN KEY (`fk_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamentos_cirurgias`
--

LOCK TABLES `agendamentos_cirurgias` WRITE;
/*!40000 ALTER TABLE `agendamentos_cirurgias` DISABLE KEYS */;
INSERT INTO `agendamentos_cirurgias` VALUES (108,'joelho','Artroscopia','Pré Agendada','2023-12-07 01:01:00',16,28,13),(110,'joelho','Artroscopia','Pré Agendada','2023-12-28 01:03:00',16,28,13);
/*!40000 ALTER TABLE `agendamentos_cirurgias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08  7:44:11
