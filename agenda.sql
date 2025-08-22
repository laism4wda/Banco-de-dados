-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: agenda
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `compromisso`
--

DROP TABLE IF EXISTS `compromisso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compromisso` (
  `idcompromisso` int NOT NULL AUTO_INCREMENT,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  `localizacao` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idcompromisso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisso`
--

LOCK TABLES `compromisso` WRITE;
/*!40000 ALTER TABLE `compromisso` DISABLE KEYS */;
/*!40000 ALTER TABLE `compromisso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `idcontato` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `cep` varchar(13) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`idcontato`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` VALUES (1,'Suellen Martinelli','Rua Ten. Alcindo Guanabara','219','E17','18214236','Paineiras','Itapetininga','SP'),(2,'Carlos Henrique','Avenida das Flores','150',NULL,'01001000','Centro','São Paulo','SP'),(3,'Ana Paula Silva','Rua das Palmeiras','48','Bloco B','30140071','Savassi','Belo Horizonte','MG'),(4,'Ricardo Oliveira','Rua Barão do Rio Branco','1020',NULL,'80010000','Centro Cívico','Curitiba','PR'),(5,'Juliana Mendes','Rua Almirante Tamandaré','90','Apto 302','69050000','Adrianópolis','Manaus','AM');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_compromisso`
--

DROP TABLE IF EXISTS `contato_compromisso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_compromisso` (
  `idContato` int NOT NULL,
  `idcompromisso` int NOT NULL,
  PRIMARY KEY (`idContato`,`idcompromisso`),
  KEY `idcompromisso` (`idcompromisso`),
  CONSTRAINT `contato_compromisso_ibfk_1` FOREIGN KEY (`idContato`) REFERENCES `contato` (`idcontato`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contato_compromisso_ibfk_2` FOREIGN KEY (`idcompromisso`) REFERENCES `compromisso` (`idcompromisso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_compromisso`
--

LOCK TABLES `contato_compromisso` WRITE;
/*!40000 ALTER TABLE `contato_compromisso` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_compromisso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `idtelefone` int NOT NULL AUTO_INCREMENT,
  `DDD` varchar(3) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `tipoFone` varchar(20) NOT NULL,
  `idContato` int NOT NULL,
  PRIMARY KEY (`idtelefone`),
  KEY `idContato` (`idContato`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`idContato`) REFERENCES `contato` (`idcontato`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'15','998075509','celular',2),(2,'11','985621234','residencial',1),(3,'21','998877665','comercial',4),(4,'31','987654321','celular',1),(5,'47','996633221','residencial',5);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-22 16:28:53
