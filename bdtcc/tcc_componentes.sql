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
-- Table structure for table `componentes`
--

DROP TABLE IF EXISTS `componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componentes` (
  `id_componentes` int NOT NULL AUTO_INCREMENT,
  `nome_componente` varchar(80) NOT NULL,
  `codigo_componente` int NOT NULL,
  `quantidade` int NOT NULL,
  `cirurgia_utilizada` enum('Artroscopia','Substituição de Articulação','manguito rotador','tendão de aquiles','lca','lcp','lcl','menisco') NOT NULL,
  `local_corpo` enum('joelho','quadril','ombro','tornozelo') NOT NULL,
  PRIMARY KEY (`id_componentes`),
  UNIQUE KEY `nome_componente_UNIQUE` (`nome_componente`),
  UNIQUE KEY `codigo_componente_UNIQUE` (`codigo_componente`),
  KEY `quantidade` (`quantidade`),
  KEY `idx_quantidade` (`quantidade`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componentes`
--

LOCK TABLES `componentes` WRITE;
/*!40000 ALTER TABLE `componentes` DISABLE KEYS */;
INSERT INTO `componentes` VALUES (34,'protese femoral joelho tam. C direito',12345,9,'Substituição de Articulação','joelho'),(36,'protese femoral joelho tam. E direito',12347,17,'Substituição de Articulação','joelho'),(37,'protese femoral joelho tam. F direito',12348,15,'Substituição de Articulação','joelho'),(38,'protese femoral joelho tam. G direito',12349,14,'Substituição de Articulação','joelho'),(39,'protese femoral joelho tam. C esquerdo',12350,9,'Substituição de Articulação','joelho'),(40,'protese femoral joelho tam. D esquerdo',12351,21,'Substituição de Articulação','joelho'),(41,'protese femoral joelho tam. E esquerdo',12352,15,'Substituição de Articulação','joelho'),(42,'protese femoral joelho tam. F esquerdo',12353,9,'Substituição de Articulação','joelho'),(43,'protese femoral joelho tam. G esquerdo',12354,4,'Substituição de Articulação','joelho'),(44,'protese inserto articular joelho tam. C/D 3/4 10 MM',12355,19,'Substituição de Articulação','joelho'),(45,'protese inserto articular joelho tam. C/D 3/4 12 MM',123456,15,'Substituição de Articulação','joelho'),(46,'protese inserto articular joelho tam. C/D 3/4 14 MM',12357,11,'Substituição de Articulação','joelho'),(47,'protese inserto articular joelho tam. C/D 3/4 17 MM',12358,8,'Substituição de Articulação','joelho'),(48,'protese inserto articular joelho tam. C/D 3/4 20 MM',12359,4,'Substituição de Articulação','joelho'),(49,'protese inserto articular joelho tam. E/F 5/6 10 MM',12360,18,'Substituição de Articulação','joelho'),(50,'protese inserto articular joelho tam. E/F 5/6 12 MM',12361,10,'Substituição de Articulação','joelho'),(51,'protese inserto articular joelho tam. E/F 5/6 14 MM',12362,3,'Substituição de Articulação','joelho'),(52,'protese inserto articular joelho tam. E/F 5/6 17 MM',12363,8,'Substituição de Articulação','joelho'),(53,'protese inserto articular joelho tam. E/F 5/6 20 MM',12364,4,'Substituição de Articulação','joelho'),(54,'protese inserto articular joelho tam. G/H 7/10 10',12365,10,'Substituição de Articulação','joelho'),(55,'protese inserto articular joelho tam. G/H 7/10 12',12366,30,'Substituição de Articulação','joelho'),(56,'protese inserto articular joelho tam. G/H 7/10 14',12367,10,'Substituição de Articulação','joelho'),(57,'protese inserto articular joelho tam. G/H 7/10 17',12368,5,'Substituição de Articulação','joelho'),(58,'protese inserto articular joelho tam. G/H 7/10 20',12369,2,'Substituição de Articulação','joelho'),(59,'protese tibial joelho tam. 3',12370,12,'Substituição de Articulação','joelho'),(60,'protese tibial joelho tam. 4',12371,22,'Substituição de Articulação','joelho'),(61,'protese tibial joelho tam. 5',12372,7,'Substituição de Articulação','joelho'),(62,'protese tibial joelho tam. 6',12373,5,'Substituição de Articulação','joelho'),(63,'protese tibial joelho tam. 7',12374,10,'Substituição de Articulação','joelho'),(75,'teste',111111,0,'Artroscopia','joelho');
/*!40000 ALTER TABLE `componentes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08  7:44:12
