-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: device
-- ------------------------------------------------------
-- Server version	5.7.40

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
-- Table structure for table `componente`
--

DROP TABLE IF EXISTS `componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componente` (
  `id_componente` int(11) NOT NULL AUTO_INCREMENT,
  `total_componente` decimal(10,2) DEFAULT NULL,
  `modelo` varchar(90) DEFAULT NULL,
  `fktotem` int(11) DEFAULT NULL,
  `fktipocomponente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_componente`),
  KEY `fktotem` (`fktotem`),
  KEY `fktipocomponente` (`fktipocomponente`),
  CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`fktotem`) REFERENCES `totem` (`id_totem`),
  CONSTRAINT `componente_ibfk_2` FOREIGN KEY (`fktipocomponente`) REFERENCES `tipo_componente` (`id_tipo_componente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente`
--

LOCK TABLES `componente` WRITE;
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leitura`
--

DROP TABLE IF EXISTS `leitura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leitura` (
  `id_leitura` int(11) NOT NULL AUTO_INCREMENT,
  `fkcomponente` int(11) NOT NULL,
  `consumo` decimal(4,1) DEFAULT NULL,
  `consumo_qtd` decimal(10,2) DEFAULT NULL,
  `data_hora_atual` datetime DEFAULT NULL,
  PRIMARY KEY (`id_leitura`,`fkcomponente`),
  KEY `fkcomponente` (`fkcomponente`),
  CONSTRAINT `leitura_ibfk_1` FOREIGN KEY (`fkcomponente`) REFERENCES `componente` (`id_componente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leitura`
--

LOCK TABLES `leitura` WRITE;
/*!40000 ALTER TABLE `leitura` DISABLE KEYS */;
/*!40000 ALTER TABLE `leitura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_componente`
--

DROP TABLE IF EXISTS `tipo_componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_componente` (
  `id_tipo_componente` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(5) DEFAULT NULL,
  `medida` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_componente`
--

LOCK TABLES `tipo_componente` WRITE;
/*!40000 ALTER TABLE `tipo_componente` DISABLE KEYS */;
INSERT INTO `tipo_componente` VALUES (1,'CPU','Nucleos Fisicos'),(2,'RAM','GB'),(3,'Disco','GB');
/*!40000 ALTER TABLE `tipo_componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `totem`
--

DROP TABLE IF EXISTS `totem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totem` (
  `id_totem` int(11) NOT NULL AUTO_INCREMENT,
  `identificador_unico` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id_totem`),
  UNIQUE KEY `identificador_unico` (`identificador_unico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totem`
--

LOCK TABLES `totem` WRITE;
/*!40000 ALTER TABLE `totem` DISABLE KEYS */;
/*!40000 ALTER TABLE `totem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-16  0:00:55
