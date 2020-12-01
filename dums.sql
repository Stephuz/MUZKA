-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dbmuzka
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idGenero` int NOT NULL AUTO_INCREMENT,
  `descricaoGenero` varchar(30) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idGenero`),
  UNIQUE KEY `descricaoGenero` (`descricaoGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Rap',1),(2,'Pop',1),(3,'Rock',1),(4,'Forró',1),(5,'Sertanejo',1),(6,'Funk',1),(7,'Reggaeton',1),(8,'Trap',1),(9,'Nacional',1),(10,'Internacional',1),(11,'Moda de Viola',1),(12,'Pagode',1),(13,'Indie',1);
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generomusica`
--

DROP TABLE IF EXISTS `generomusica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generomusica` (
  `idGenero` int NOT NULL,
  `idMusica` int NOT NULL,
  PRIMARY KEY (`idGenero`,`idMusica`),
  KEY `FK_Musica` (`idMusica`),
  CONSTRAINT `FK_Genero` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`),
  CONSTRAINT `FK_Musica` FOREIGN KEY (`idMusica`) REFERENCES `musica` (`idMusica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generomusica`
--

LOCK TABLES `generomusica` WRITE;
/*!40000 ALTER TABLE `generomusica` DISABLE KEYS */;
INSERT INTO `generomusica` VALUES (1,1),(10,1),(1,2),(10,2),(1,3),(10,3),(1,4),(8,4),(10,4),(1,5),(10,5),(2,6),(10,6),(2,7),(10,7),(2,8),(10,8),(2,9),(10,9),(2,10),(10,10),(3,11),(10,11),(3,12),(10,12),(3,13),(10,13),(2,14),(3,14),(10,14),(3,15),(9,15),(4,16),(9,16),(4,17),(9,17),(4,18),(9,18),(4,19),(9,19),(4,20),(9,20),(5,21),(9,21),(5,22),(9,22),(5,23),(9,23),(5,24),(9,24),(5,25),(9,25),(6,26),(9,26),(6,27),(9,27),(6,28),(9,28),(6,29),(9,29),(6,30),(9,30),(7,31),(10,31),(7,32),(10,32),(7,33),(10,33),(7,34),(10,34),(7,35),(10,35),(8,36),(9,36),(8,37),(9,37),(8,38),(9,38),(8,39),(9,39),(8,40),(9,40),(1,41),(9,41),(1,42),(9,42),(1,43),(9,43),(1,44),(9,44),(1,45),(9,45),(5,46),(9,46),(5,47),(9,47),(11,47),(5,48),(9,48),(11,48),(5,49),(9,49),(11,49),(5,50),(9,50),(11,50),(5,51),(9,51),(11,51),(9,52),(12,52),(9,53),(12,53),(9,54),(12,54),(9,55),(12,55),(9,56),(12,56),(10,57),(13,57),(10,58),(13,58),(10,59),(13,59),(10,60),(13,60),(9,61),(13,61);
/*!40000 ALTER TABLE `generomusica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `idMusica` int NOT NULL AUTO_INCREMENT,
  `tituloMusica` varchar(100) NOT NULL,
  `postoMusica` double NOT NULL DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idMusica`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
INSERT INTO `musica` VALUES (1,'Ultralight Beam - Kanye West',1,1),(2,'Gold Digger - Kanye West',0,1),(3,'Day and Nite - Kid Cudi',0,1),(4,'Sicko Mode - Travis Scott',0,1),(5,'Monster - Rihanna ft. Eminem',0,1),(6,'Diamonds - Rihanna',4,1),(7,'Future Nostalgia - Dua Lipa',0,1),(8,'Into You - Ariana Grande',0,1),(9,'Bad Romance - Lady Gaga',4.5,1),(10,'Froot - MARINA',0,1),(11,'Enter Sandman - Metallica',0,1),(12,'Misery Business - Paramore',0,1),(13,'American Idiot - Green Day',3,1),(14,'All the small things - Blink 182',5,1),(15,'Teto de vidro - Pitty',0,1),(16,'Rita - Tierry',0,1),(17,'Quem é seu favorito - Barões da Pisadinha',0,1),(18,'HB20 - Tierry',0,1),(19,'Recairei - Barões da Pisadinha',0,1),(20,'Investe em mim - Jonas Esticado',1,1),(21,'Nem doeu - Matheus e Kauan',0,1),(22,'Alô Ambev - Zé Neto e Cristiano',2,1),(23,'Galopeira - Chitãozinho e Chororó',0,1),(24,'Amoreco - Simone e Simaria',0,1),(25,'Nem Tchum - Maiara e Maraisa',0,1),(26,'Ritmo Mexicano - MC GW',0,1),(27,'Raba Safada - MC 7 Belo',0,1),(28,'Pock Pock - MC PR',3,1),(29,'Cabaré - MC Pierre, DJ Guuga',0,1),(30,'Baile de Favela - MC João',5,1),(31,'Se preparó - Ozuna',3,1),(32,'Mayores - Becky G',0,1),(33,'Barro Cassette - Maluma',0,1),(34,'Bonita - J Balvin',0,1),(35,'Despacito - Luis Fonsi',0,1),(36,'Máquina do Tempo - Matuê',0,1),(37,'777 666 - Matuê',3,1),(38,'Telepatia - Akuna',0,1),(39,'Glockada - Ngc Daddy',0,1),(40,'Nem me sinto mal mais - Sidoka',0,1),(41,'Nego Drama - Racionais MCs',0,1),(42,'Estilo Cachorro - Racionais MCs',0,1),(43,'Ilusão - Filipe Ret',0,1),(44,'Poesia Acústica 7 - Pineapple Stormtv',0,1),(45,'Leal - Djonga',0,1),(46,'Segunda Taça - João Bosco & Vinicius',4,1),(47,'Faca que não corta - Goiano e Pardinho',4,1),(48,'Nove e nove - Tião Carreiro e Pardinho',0,1),(49,'Bombardeio - Zé Carreiro e Carreirinho',2,1),(50,'Boiadeiro errante - Liu e Léu',0,1),(51,'O menino da porteira - Ségio Reis',0,1),(52,'Misturados - Dilsinho',0,1),(53,'Tristinha - Ferrugem',0,1),(54,'A fila anda - Thiaguinho',1,1),(55,'Sinal vital - Sorriso Maroto',0,1),(56,'É o que mereço - Belo',0,1),(57,'Dark necessities - Red Hot Chili Pappers',0,1),(58,'Otherside - Red Hot Chili Pappers',5,1),(59,'Like a Stone - Audioslave',0,1),(60,'Revelations - Audioslave',5,1),(61,'Catastrópicos - Bemti, Jaloo',0,1);
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notausuariomusica`
--

DROP TABLE IF EXISTS `notausuariomusica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notausuariomusica` (
  `idUsuario` int NOT NULL,
  `idMusica` int NOT NULL,
  `notaMusica` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUsuario`,`idMusica`),
  KEY `FK_MusicaNota` (`idMusica`),
  CONSTRAINT `FK_MusicaNota` FOREIGN KEY (`idMusica`) REFERENCES `musica` (`idMusica`),
  CONSTRAINT `FK_UsuarioNota` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notausuariomusica`
--

LOCK TABLES `notausuariomusica` WRITE;
/*!40000 ALTER TABLE `notausuariomusica` DISABLE KEYS */;
INSERT INTO `notausuariomusica` VALUES (4,9,4),(4,13,3),(4,14,5),(4,22,2),(4,30,5),(4,37,3),(4,54,1),(5,1,1),(5,28,3),(5,31,3),(5,46,4),(5,58,5),(5,60,5),(6,6,4),(6,9,5),(6,13,3),(6,20,1),(6,28,3),(6,49,2),(7,47,4);
/*!40000 ALTER TABLE `notausuariomusica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin',1),(2,'jldurigan','1234admin',1),(3,'satcher','4321admin',1),(4,'gabriel','123456',1),(5,'stephanie','123456',1),(6,'joao','123456',1),(7,'milton','123456',1),(8,'teste','teste',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariogeneropreferido`
--

DROP TABLE IF EXISTS `usuariogeneropreferido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariogeneropreferido` (
  `idUsuario` int NOT NULL,
  `idGenero` int NOT NULL,
  `dataInsercao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuario`,`idGenero`),
  KEY `FK_GeneroPreferido` (`idGenero`),
  CONSTRAINT `FK_GeneroPreferido` FOREIGN KEY (`idGenero`) REFERENCES `genero` (`idGenero`),
  CONSTRAINT `FK_UsuarioPreferido` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariogeneropreferido`
--

LOCK TABLES `usuariogeneropreferido` WRITE;
/*!40000 ALTER TABLE `usuariogeneropreferido` DISABLE KEYS */;
INSERT INTO `usuariogeneropreferido` VALUES (4,2,'2020-11-30 21:03:47'),(4,3,'2020-11-30 21:03:57'),(4,7,'2020-11-30 21:03:51'),(5,1,'2020-12-01 10:37:33'),(5,2,'2020-12-01 10:39:55'),(5,3,'2020-12-01 10:37:37'),(7,11,'2020-12-01 14:30:00'),(8,1,'2020-12-01 15:04:46'),(8,8,'2020-12-01 15:28:22');
/*!40000 ALTER TABLE `usuariogeneropreferido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbmuzka'
--

--
-- Dumping routines for database 'dbmuzka'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-01 16:16:38
