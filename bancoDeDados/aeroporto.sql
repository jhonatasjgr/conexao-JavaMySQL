-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: aeroporto
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `abastecimento`
--

DROP TABLE IF EXISTS `abastecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abastecimento` (
  `centroabastecimento_idcentroabastecimento` int NOT NULL,
  `aeronave_idaeronave` int NOT NULL,
  `quantidade_de_litros` varchar(45) NOT NULL,
  PRIMARY KEY (`centroabastecimento_idcentroabastecimento`,`aeronave_idaeronave`),
  KEY `fk_centroabastecimento_has_aeronave_aeronave1_idx` (`aeronave_idaeronave`),
  KEY `fk_centroabastecimento_has_aeronave_centroabastecimento1_idx` (`centroabastecimento_idcentroabastecimento`),
  CONSTRAINT `fk_centroabastecimento_has_aeronave_aeronave1` FOREIGN KEY (`aeronave_idaeronave`) REFERENCES `aeronave` (`idaeronave`),
  CONSTRAINT `fk_centroabastecimento_has_aeronave_centroabastecimento1` FOREIGN KEY (`centroabastecimento_idcentroabastecimento`) REFERENCES `centroabastecimento` (`idcentroabastecimento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abastecimento`
--

LOCK TABLES `abastecimento` WRITE;
/*!40000 ALTER TABLE `abastecimento` DISABLE KEYS */;
INSERT INTO `abastecimento` VALUES (1,1,'12000'),(1,6,'13000'),(1,11,'12000'),(2,5,'16000'),(2,10,'15000'),(3,4,'17000'),(3,9,'13000'),(4,3,'20000'),(4,8,'14000'),(5,2,'18000'),(5,7,'20000');
/*!40000 ALTER TABLE `abastecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeronave`
--

DROP TABLE IF EXISTS `aeronave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeronave` (
  `idaeronave` int NOT NULL,
  `modeloaeronave` varchar(45) NOT NULL,
  `piloto_idpiloto` int NOT NULL,
  `empresaaerea_idempresaaerea` int NOT NULL,
  PRIMARY KEY (`idaeronave`,`piloto_idpiloto`,`empresaaerea_idempresaaerea`),
  KEY `fk_aeronave_piloto1_idx` (`piloto_idpiloto`),
  KEY `fk_aeronave_empresaaerea1_idx` (`empresaaerea_idempresaaerea`),
  CONSTRAINT `fk_aeronave_empresaaerea1` FOREIGN KEY (`empresaaerea_idempresaaerea`) REFERENCES `empresaaerea` (`idempresaaerea`),
  CONSTRAINT `fk_aeronave_piloto1` FOREIGN KEY (`piloto_idpiloto`) REFERENCES `piloto` (`idpiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeronave`
--

LOCK TABLES `aeronave` WRITE;
/*!40000 ALTER TABLE `aeronave` DISABLE KEYS */;
INSERT INTO `aeronave` VALUES (1,'737',11,1),(2,'a321',10,1),(3,'a320',9,2),(4,'a319',8,3),(5,'737',7,4),(6,'a318',6,5),(7,'a321',5,6),(8,'a320',4,7),(9,'a319',3,8),(10,'737',2,9),(11,'a318',1,10);
/*!40000 ALTER TABLE `aeronave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeroporto`
--

DROP TABLE IF EXISTS `aeroporto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeroporto` (
  `idaeroporto` int NOT NULL,
  `nomeaeroporto` varchar(45) NOT NULL,
  `enderecoaeroporto` varchar(45) NOT NULL,
  PRIMARY KEY (`idaeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeroporto`
--

LOCK TABLES `aeroporto` WRITE;
/*!40000 ALTER TABLE `aeroporto` DISABLE KEYS */;
INSERT INTO `aeroporto` VALUES (1,'municipal de bom jesus','avenida marcos parente'),(2,'internacional da serra da capivara','sao raimundo nonato'),(3,'internacional do delta do parnaiba','parnaiba'),(4,'municipal de teresina','avenida norte'),(5,'municipal de floriano','avenida 13'),(6,'internacional de fortaleza','avenida beira mar'),(7,'municipal de sobral','br 220'),(8,'aeroporto de guarulhos','rodovia 135'),(9,'aeroporto do galeao','avenida beira mar'),(10,'aeroporto de brasilia','avenida do planalto');
/*!40000 ALTER TABLE `aeroporto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeroporto_e_voo`
--

DROP TABLE IF EXISTS `aeroporto_e_voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeroporto_e_voo` (
  `aeroporto_idaeroporto` int NOT NULL,
  `voo_idvoo` int NOT NULL,
  `aeroporto_idaeroporto1destino` int NOT NULL,
  PRIMARY KEY (`aeroporto_idaeroporto`,`voo_idvoo`,`aeroporto_idaeroporto1destino`),
  KEY `fk_aeroporto_has_voo_voo1_idx` (`voo_idvoo`),
  KEY `fk_aeroporto_has_voo_aeroporto1_idx` (`aeroporto_idaeroporto`),
  KEY `fk_aeroporto_e_voo_aeroporto1_idx` (`aeroporto_idaeroporto1destino`),
  CONSTRAINT `fk_aeroporto_e_voo_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto1destino`) REFERENCES `aeroporto` (`idaeroporto`),
  CONSTRAINT `fk_aeroporto_has_voo_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto`) REFERENCES `aeroporto` (`idaeroporto`),
  CONSTRAINT `fk_aeroporto_has_voo_voo1` FOREIGN KEY (`voo_idvoo`) REFERENCES `voo` (`idvoo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeroporto_e_voo`
--

LOCK TABLES `aeroporto_e_voo` WRITE;
/*!40000 ALTER TABLE `aeroporto_e_voo` DISABLE KEYS */;
INSERT INTO `aeroporto_e_voo` VALUES (1,1,2),(1,2,3),(1,3,4),(1,4,5),(1,5,10),(1,6,6),(1,7,8),(1,8,9),(1,9,7),(1,10,10);
/*!40000 ALTER TABLE `aeroporto_e_voo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centroabastecimento`
--

DROP TABLE IF EXISTS `centroabastecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centroabastecimento` (
  `idcentroabastecimento` int NOT NULL,
  `setor_idsetor` int NOT NULL,
  `aeroporto_idaeroporto` int NOT NULL,
  PRIMARY KEY (`idcentroabastecimento`,`setor_idsetor`,`aeroporto_idaeroporto`),
  KEY `fk_centroabastecimento_setor1_idx` (`setor_idsetor`),
  KEY `fk_centroabastecimento_aeroporto1_idx` (`aeroporto_idaeroporto`),
  CONSTRAINT `fk_centroabastecimento_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto`) REFERENCES `aeroporto` (`idaeroporto`),
  CONSTRAINT `fk_centroabastecimento_setor1` FOREIGN KEY (`setor_idsetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centroabastecimento`
--

LOCK TABLES `centroabastecimento` WRITE;
/*!40000 ALTER TABLE `centroabastecimento` DISABLE KEYS */;
INSERT INTO `centroabastecimento` VALUES (1,4,1),(2,4,1),(3,4,1),(4,4,1),(5,4,1),(6,4,1),(7,4,1),(8,4,1),(9,4,1),(10,4,1);
/*!40000 ALTER TABLE `centroabastecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centromedico`
--

DROP TABLE IF EXISTS `centromedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centromedico` (
  `idcentromedico` int NOT NULL,
  `setor_idsetor` int NOT NULL,
  `aeroporto_idaeroporto` int NOT NULL,
  PRIMARY KEY (`idcentromedico`,`setor_idsetor`,`aeroporto_idaeroporto`),
  KEY `fk_centromedico_setor1_idx` (`setor_idsetor`),
  KEY `fk_centromedico_aeroporto1_idx` (`aeroporto_idaeroporto`),
  CONSTRAINT `fk_centromedico_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto`) REFERENCES `aeroporto` (`idaeroporto`),
  CONSTRAINT `fk_centromedico_setor1` FOREIGN KEY (`setor_idsetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centromedico`
--

LOCK TABLES `centromedico` WRITE;
/*!40000 ALTER TABLE `centromedico` DISABLE KEYS */;
INSERT INTO `centromedico` VALUES (1,2,1),(2,2,1),(3,2,1),(4,2,1),(5,2,1),(6,2,1),(7,2,1),(8,2,1),(9,2,1),(10,2,1);
/*!40000 ALTER TABLE `centromedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centropolicial`
--

DROP TABLE IF EXISTS `centropolicial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centropolicial` (
  `idcentropolicial` int NOT NULL,
  `setor_idsetor` int NOT NULL,
  `aeroporto_idaeroporto` int NOT NULL,
  PRIMARY KEY (`idcentropolicial`,`setor_idsetor`,`aeroporto_idaeroporto`),
  KEY `fk_centropolicial_setor1_idx` (`setor_idsetor`),
  KEY `fk_centropolicial_aeroporto1_idx` (`aeroporto_idaeroporto`),
  CONSTRAINT `fk_centropolicial_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto`) REFERENCES `aeroporto` (`idaeroporto`),
  CONSTRAINT `fk_centropolicial_setor1` FOREIGN KEY (`setor_idsetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centropolicial`
--

LOCK TABLES `centropolicial` WRITE;
/*!40000 ALTER TABLE `centropolicial` DISABLE KEYS */;
INSERT INTO `centropolicial` VALUES (1,3,1),(2,3,1),(3,3,1),(4,3,1),(5,3,1),(6,3,1),(7,3,1),(8,3,1),(9,3,1),(10,3,1);
/*!40000 ALTER TABLE `centropolicial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL,
  `nomecliente` varchar(45) NOT NULL,
  `enderecocliente` varchar(45) NOT NULL,
  `telefonecliente` varchar(45) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'maria','dr','6654'),(2,'jose','chapadinha 1','21234'),(3,'antonio','chapadinha 2','76245'),(4,'joao','consorcio das aguas 1','13455'),(5,'francisco','consorcio das aguas 2','7658'),(6,'ana','alto alegre','759'),(7,'beatriz','centro','9068'),(8,'luiza','coab','3251'),(9,'luiz','gilson coelho','15423'),(10,'paulo','miramar','4664');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_e_empresaaerea`
--

DROP TABLE IF EXISTS `cliente_e_empresaaerea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_e_empresaaerea` (
  `empresaaerea_idempresaaerea` int NOT NULL,
  `cliente_idcliente` int NOT NULL,
  PRIMARY KEY (`empresaaerea_idempresaaerea`,`cliente_idcliente`),
  KEY `fk_empresaaerea_has_cliente_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_empresaaerea_has_cliente_empresaaerea1_idx` (`empresaaerea_idempresaaerea`),
  CONSTRAINT `fk_empresaaerea_has_cliente_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_empresaaerea_has_cliente_empresaaerea1` FOREIGN KEY (`empresaaerea_idempresaaerea`) REFERENCES `empresaaerea` (`idempresaaerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_e_empresaaerea`
--

LOCK TABLES `cliente_e_empresaaerea` WRITE;
/*!40000 ALTER TABLE `cliente_e_empresaaerea` DISABLE KEYS */;
INSERT INTO `cliente_e_empresaaerea` VALUES (10,1),(9,2),(8,3),(7,4),(6,5),(5,6),(4,7),(3,8),(2,9),(1,10);
/*!40000 ALTER TABLE `cliente_e_empresaaerea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `idconsulta` int NOT NULL,
  `cliente_idcliente` int NOT NULL,
  `piloto_idpiloto` int NOT NULL,
  `funcionario_idfuncionario` int NOT NULL,
  `centromedico_idcentromedico` int NOT NULL,
  PRIMARY KEY (`idconsulta`,`centromedico_idcentromedico`),
  KEY `fk_consulta_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_consulta_piloto1_idx` (`piloto_idpiloto`),
  KEY `fk_consulta_funcionario1_idx` (`funcionario_idfuncionario`),
  KEY `fk_consulta_centromedico1_idx` (`centromedico_idcentromedico`),
  CONSTRAINT `fk_consulta_centromedico1` FOREIGN KEY (`centromedico_idcentromedico`) REFERENCES `centromedico` (`idcentromedico`),
  CONSTRAINT `fk_consulta_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_consulta_funcionario1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `fk_consulta_piloto1` FOREIGN KEY (`piloto_idpiloto`) REFERENCES `piloto` (`idpiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,10,1,10,1),(2,9,2,9,2),(3,8,3,8,3),(4,7,4,7,4),(5,6,5,6,5),(6,5,6,5,6),(7,4,7,4,7),(8,3,8,3,8),(9,2,9,2,9),(10,1,10,1,10);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentolimpeza`
--

DROP TABLE IF EXISTS `departamentolimpeza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentolimpeza` (
  `iddepartamentolimpeza` int NOT NULL,
  `setor_idsetor` int NOT NULL,
  `aeroporto_idaeroporto` int NOT NULL,
  PRIMARY KEY (`iddepartamentolimpeza`,`setor_idsetor`,`aeroporto_idaeroporto`),
  KEY `fk_departamentolimpeza_setor1_idx` (`setor_idsetor`),
  KEY `fk_departamentolimpeza_aeroporto1_idx` (`aeroporto_idaeroporto`),
  CONSTRAINT `fk_departamentolimpeza_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto`) REFERENCES `aeroporto` (`idaeroporto`),
  CONSTRAINT `fk_departamentolimpeza_setor1` FOREIGN KEY (`setor_idsetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentolimpeza`
--

LOCK TABLES `departamentolimpeza` WRITE;
/*!40000 ALTER TABLE `departamentolimpeza` DISABLE KEYS */;
INSERT INTO `departamentolimpeza` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1);
/*!40000 ALTER TABLE `departamentolimpeza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresaaerea`
--

DROP TABLE IF EXISTS `empresaaerea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresaaerea` (
  `idempresaaerea` int NOT NULL,
  `nomeempresaaerea` varchar(45) NOT NULL,
  `setor_idsetor` int NOT NULL,
  PRIMARY KEY (`idempresaaerea`,`setor_idsetor`),
  KEY `fk_empresaaerea_setor1_idx` (`setor_idsetor`),
  CONSTRAINT `fk_empresaaerea_setor1` FOREIGN KEY (`setor_idsetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresaaerea`
--

LOCK TABLES `empresaaerea` WRITE;
/*!40000 ALTER TABLE `empresaaerea` DISABLE KEYS */;
INSERT INTO `empresaaerea` VALUES (1,'gol',5),(2,'azul',5),(3,'tam',5),(4,'latam',5),(5,'american',5),(6,'avianca',5),(7,'passsaredo',5),(8,'japan',5),(9,'lufthtansa',5),(10,'qatar airways',5);
/*!40000 ALTER TABLE `empresaaerea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresaaerea_e_aeroporto`
--

DROP TABLE IF EXISTS `empresaaerea_e_aeroporto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresaaerea_e_aeroporto` (
  `empresaaerea_idempresaaerea` int NOT NULL,
  `aeroporto_idaeroporto` int NOT NULL,
  PRIMARY KEY (`empresaaerea_idempresaaerea`,`aeroporto_idaeroporto`),
  KEY `fk_empresaaerea_has_aeroporto_aeroporto1_idx` (`aeroporto_idaeroporto`),
  KEY `fk_empresaaerea_has_aeroporto_empresaaerea1_idx` (`empresaaerea_idempresaaerea`),
  CONSTRAINT `fk_empresaaerea_has_aeroporto_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto`) REFERENCES `aeroporto` (`idaeroporto`),
  CONSTRAINT `fk_empresaaerea_has_aeroporto_empresaaerea1` FOREIGN KEY (`empresaaerea_idempresaaerea`) REFERENCES `empresaaerea` (`idempresaaerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresaaerea_e_aeroporto`
--

LOCK TABLES `empresaaerea_e_aeroporto` WRITE;
/*!40000 ALTER TABLE `empresaaerea_e_aeroporto` DISABLE KEYS */;
INSERT INTO `empresaaerea_e_aeroporto` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,10);
/*!40000 ALTER TABLE `empresaaerea_e_aeroporto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idfuncionario` int NOT NULL,
  `nomefuncionario` varchar(45) NOT NULL,
  `enderecofuncionario` varchar(45) NOT NULL,
  `telefonefuncionario` varchar(45) NOT NULL,
  `setor_idsetor` int NOT NULL,
  PRIMARY KEY (`idfuncionario`,`setor_idsetor`),
  KEY `fk_funcionario_setor_idx` (`setor_idsetor`),
  CONSTRAINT `fk_funcionario_setor` FOREIGN KEY (`setor_idsetor`) REFERENCES `setor` (`idsetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'jessica','alto alegre','23465',3),(2,'adenilson','serra nova','32676',3),(3,'maria','chapadinha','7645',1),(4,'carlito','dr','32457',1),(5,'juliana ','sapolandia','56',2),(6,'eduarda','sapolandia','9876',2),(7,'josuilton','multirao','435',4),(8,'kelluane','multirao','768',4),(9,'leandro','rodoviaria','794',5),(10,'jailson','centro','2345',5);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracao`
--

DROP TABLE IF EXISTS `infracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `infracao` (
  `idinfracao` int NOT NULL,
  `cliente_idcliente` int NOT NULL,
  `piloto_idpiloto` int NOT NULL,
  `funcionario_idfuncionario` int NOT NULL,
  `centropolicial_idcentropolicial` int NOT NULL,
  PRIMARY KEY (`idinfracao`,`centropolicial_idcentropolicial`),
  KEY `fk_infracao_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_infracao_piloto1_idx` (`piloto_idpiloto`),
  KEY `fk_infracao_funcionario1_idx` (`funcionario_idfuncionario`),
  KEY `fk_infracao_centropolicial1_idx` (`centropolicial_idcentropolicial`),
  CONSTRAINT `fk_infracao_centropolicial1` FOREIGN KEY (`centropolicial_idcentropolicial`) REFERENCES `centropolicial` (`idcentropolicial`),
  CONSTRAINT `fk_infracao_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_infracao_funcionario1` FOREIGN KEY (`funcionario_idfuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `fk_infracao_piloto1` FOREIGN KEY (`piloto_idpiloto`) REFERENCES `piloto` (`idpiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracao`
--

LOCK TABLES `infracao` WRITE;
/*!40000 ALTER TABLE `infracao` DISABLE KEYS */;
INSERT INTO `infracao` VALUES (1,10,1,10,1),(2,9,2,9,2),(3,8,3,8,3),(4,7,4,7,4),(5,6,5,6,5),(6,5,6,5,6),(7,4,7,4,7),(8,3,8,3,8),(9,2,9,2,9),(10,1,10,1,10);
/*!40000 ALTER TABLE `infracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piloto` (
  `idpiloto` int NOT NULL,
  `nomepiloto` varchar(45) NOT NULL,
  `telefonepiloto` varchar(45) NOT NULL,
  `empresaaerea_idempresaaerea` int NOT NULL,
  PRIMARY KEY (`idpiloto`,`empresaaerea_idempresaaerea`),
  KEY `fk_piloto_empresaaerea1_idx` (`empresaaerea_idempresaaerea`),
  CONSTRAINT `fk_piloto_empresaaerea1` FOREIGN KEY (`empresaaerea_idempresaaerea`) REFERENCES `empresaaerea` (`idempresaaerea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES (1,'allan','543',10),(2,'carleandro','392',9),(3,'klendson','357',8),(4,'mauricio','3589',7),(5,'antonio henrique','7589',6),(6,'fernando','3794',5),(7,'tetuca','32792',4),(8,'alirio ','2674',3),(9,'felicio','5893',2),(10,'zaqueu','36835',1),(11,'rayssa','24679',1);
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor` (
  `idsetor` int NOT NULL,
  `nomesetor` varchar(45) NOT NULL,
  `aeroporto_idaeroporto` int NOT NULL,
  PRIMARY KEY (`idsetor`,`aeroporto_idaeroporto`),
  KEY `fk_setor_aeroporto1_idx` (`aeroporto_idaeroporto`),
  CONSTRAINT `fk_setor_aeroporto1` FOREIGN KEY (`aeroporto_idaeroporto`) REFERENCES `aeroporto` (`idaeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` VALUES (1,'limpeza',1),(2,'medico',1),(3,'policial',1),(4,'abastecimento',1),(5,'venda',1);
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voo` (
  `idvoo` int NOT NULL,
  `datavoo` varchar(45) NOT NULL,
  `horariovoo` varchar(45) NOT NULL,
  `piloto_idpiloto` int NOT NULL,
  `aeronave_idaeronave` int NOT NULL,
  PRIMARY KEY (`idvoo`,`piloto_idpiloto`,`aeronave_idaeronave`),
  KEY `fk_voo_piloto1_idx` (`piloto_idpiloto`),
  KEY `fk_voo_aeronave1_idx` (`aeronave_idaeronave`),
  CONSTRAINT `fk_voo_aeronave1` FOREIGN KEY (`aeronave_idaeronave`) REFERENCES `aeronave` (`idaeronave`),
  CONSTRAINT `fk_voo_piloto1` FOREIGN KEY (`piloto_idpiloto`) REFERENCES `piloto` (`idpiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
INSERT INTO `voo` VALUES (1,'11/10/2022','22:15',1,11),(2,'15/10/2022','10:15',2,10),(3,'05/10/2022','10:30',3,9),(4,'02/10/2022','10:25',4,8),(5,'10/10/2022','08:00',5,7),(6,'17/10/2022','13:30',6,6),(7,'19/10/2022','14:00',7,5),(8,'14/10/2022','16:00',8,4),(9,'13/10/2022','09:15',9,3),(10,'18/10/2022','18:00',10,2),(11,'13/10/2022','09:20',11,1);
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 14:08:29
