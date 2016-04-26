-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: emas
-- ------------------------------------------------------
-- Server version	5.5.38-0+wheezy1

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
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_areas_eventos1_idx` (`id_evento`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `fk_areas_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (7,'Ciências Agrárias - Fitotecnia',1,1),(8,'Ciências Agrárias - Zootecnia',1,1),(9,'Ciências Biológicas; Ciências da Saúde',1,1),(10,'Ciências Exatas e da Terra; Engenharias',1,1),(11,'Ciências Humanas; Ciências Sociais Aplicadas; Linguística, Letras e Artes; Multidisciplinar',1,1),(12,'Comunicação',1,2),(13,'Cultura',1,2),(14,'Educação',1,2),(15,'Direitos Humanos',1,2),(16,'Meio Ambiente',1,2),(17,'Saúde',1,2),(18,'Tecnologia',1,2),(19,'Trabalho',1,2);
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arquivos_trabalho`
--

DROP TABLE IF EXISTS `arquivos_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquivos_trabalho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_submissao` date DEFAULT NULL,
  `hora_submissao` time DEFAULT NULL,
  `nome_arquivo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_trabalho` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_arquivos_trabalho_trabalhos1_idx` (`id_trabalho`),
  CONSTRAINT `fk_arquivos_trabalho_trabalhos1` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalhos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivos_trabalho`
--

LOCK TABLES `arquivos_trabalho` WRITE;
/*!40000 ALTER TABLE `arquivos_trabalho` DISABLE KEYS */;
INSERT INTO `arquivos_trabalho` VALUES (3,'2015-07-24','04:07:34','981e7619f1da037f1c3c7238279de56c.doc',1),(4,'2015-07-24','04:07:34','981e7619f1da037f1c3c7238279de56c.pdf',1),(5,'2015-07-24','04:07:23','718980c1cad436a714fb28345efa618a.doc',2),(6,'2015-07-24','04:07:23','718980c1cad436a714fb28345efa618a.pdf',2);
/*!40000 ALTER TABLE `arquivos_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_trabalho` int(11) NOT NULL,
  `id_instituicao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_autores_trabalhos1_idx` (`id_trabalho`),
  KEY `fk_autores_instituicoes1_idx` (`id_instituicao`),
  CONSTRAINT `fk_autores_instituicoes1` FOREIGN KEY (`id_instituicao`) REFERENCES `instituicoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_autores_trabalhos1` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalhos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (4,'Maria Eduarda Hannibal','maria.eduardah.14@hotmail.com',1,1),(5,'Giovanna Gobbo Agnoletto','gigobbo212@hotmail.com',1,1),(6,'Kelly Valcarenghi Nit','kelly_nitz@hotmail.com',1,1),(7,'Luciana Iavorski',' luzynha_my@hotmail.com',2,1),(8,'Andressa Graziele Brandt','andressa@ifc-camboriu.edu.br',2,1),(9,'Robinson Fernando Alves','robinho@ifc-camboriu.edu.br',2,1);
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categorias_eventos1_idx` (`id_evento`),
  CONSTRAINT `fk_categorias_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Pesquisa',1),(2,'Extensão',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'VI FICE - Feira de Iniciação Científica e Extensão 2015','2015-09-02','2015-09-03');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatos`
--

DROP TABLE IF EXISTS `formatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_formatos_eventos1_idx` (`id_evento`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `fk_formatos_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `formatos_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `niveis` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos`
--

LOCK TABLES `formatos` WRITE;
/*!40000 ALTER TABLE `formatos` DISABLE KEYS */;
INSERT INTO `formatos` VALUES (1,'Estande',1,1,1),(2,'Painel',1,1,2);
/*!40000 ALTER TABLE `formatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instituicoes`
--

DROP TABLE IF EXISTS `instituicoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instituicoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituicoes`
--

LOCK TABLES `instituicoes` WRITE;
/*!40000 ALTER TABLE `instituicoes` DISABLE KEYS */;
INSERT INTO `instituicoes` VALUES (1,'IFC-Camboriú');
/*!40000 ALTER TABLE `instituicoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades`
--

DROP TABLE IF EXISTS `modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modalidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_nivel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `modalidades_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `niveis` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades`
--

LOCK TABLES `modalidades` WRITE;
/*!40000 ALTER TABLE `modalidades` DISABLE KEYS */;
INSERT INTO `modalidades` VALUES (1,'Apresentação Oral',2),(2,'Pôster',1);
/*!40000 ALTER TABLE `modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES (1,'Abdon Batista\n','SC'),(2,'Abelardo Luz\n','SC'),(3,'Agrolândia\n','SC'),(4,'Agronômica\n','SC'),(5,'Água Doce\n','SC'),(6,'Águas de Chapecó\n','SC'),(7,'Águas Frias\n','SC'),(8,'Águas Mornas\n','SC'),(9,'Alfredo Wagner\n','SC'),(10,'Alto Bela Vista\n','SC'),(11,'Anchieta\n','SC'),(12,'Angelina\n','SC'),(13,'Anita Garibaldi\n','SC'),(14,'Anitápolis\n','SC'),(15,'Antônio Carlos\n','SC'),(16,'Apiúna\n','SC'),(17,'Arabutã\n','SC'),(18,'Araquari\n','SC'),(19,'Araranguá\n','SC'),(20,'Armazém\n','SC'),(21,'Arroio Trinta\n','SC'),(22,'Arvoredo\n','SC'),(23,'Ascurra\n','SC'),(24,'Atalanta\n','SC'),(25,'Aurora\n','SC'),(26,'Balneário Arroio do Silva\n','SC'),(27,'Balneário Barra do Sul\n','SC'),(28,'Balneário Camboriú\n','SC'),(29,'Balneário Gaivota\n','SC'),(30,'Balneário Piçarras\n','SC'),(31,'Balneário Rincão\n','SC'),(32,'Bandeirante\n','SC'),(33,'Barra Bonita\n','SC'),(34,'Barra Velha\n','SC'),(35,'Bela Vista do Toldo\n','SC'),(36,'Belmonte\n','SC'),(37,'Benedito Novo\n','SC'),(38,'Biguaçu\n','SC'),(39,'Blumenau\n','SC'),(40,'Bocaina do Sul\n','SC'),(41,'Bom Jardim da Serra\n','SC'),(42,'Bom Jesus\n','SC'),(43,'Bom Jesus do Oeste\n','SC'),(44,'Bom Retiro\n','SC'),(45,'Bombinhas\n','SC'),(46,'Botuverá\n','SC'),(47,'Braço do Norte\n','SC'),(48,'Braço do Trombudo\n','SC'),(49,'Brunópolis\n','SC'),(50,'Brusque\n','SC'),(51,'Caçador\n','SC'),(52,'Caibi\n','SC'),(53,'Calmon\n','SC'),(54,'Camboriú\n','SC'),(55,'Campo Alegre\n','SC'),(56,'Campo Belo do Sul\n','SC'),(57,'Campo Erê\n','SC'),(58,'Campos Novos\n','SC'),(59,'Canelinha\n','SC'),(60,'Canoinhas\n','SC'),(61,'Capão Alto\n','SC'),(62,'Capinzal\n','SC'),(63,'Capivari de Baixo\n','SC'),(64,'Catanduvas\n','SC'),(65,'Caxambu do Sul\n','SC'),(66,'Celso Ramos\n','SC'),(67,'Cerro Negro\n','SC'),(68,'Chapadão do Lageado\n','SC'),(69,'Chapecó\n','SC'),(70,'Cocal do Sul\n','SC'),(71,'Concórdia\n','SC'),(72,'Cordilheira Alta\n','SC'),(73,'Coronel Freitas\n','SC'),(74,'Coronel Martins\n','SC'),(75,'Correia Pinto\n','SC'),(76,'Corupá\n','SC'),(77,'Criciúma\n','SC'),(78,'Cunha Porã\n','SC'),(79,'Cunhataí\n','SC'),(80,'Curitibanos\n','SC'),(81,'Descanso\n','SC'),(82,'Dionísio Cerqueira\n','SC'),(83,'Dona Emma\n','SC'),(84,'Doutor Pedrinho\n','SC'),(85,'Entre Rios\n','SC'),(86,'Ermo\n','SC'),(87,'Erval Velho\n','SC'),(88,'Faxinal dos Guedes\n','SC'),(89,'Flor do Sertão\n','SC'),(90,'Florianópolis\n','SC'),(91,'Formosa do Sul\n','SC'),(92,'Forquilhinha\n','SC'),(93,'Fraiburgo\n','SC'),(94,'Frei Rogério\n','SC'),(95,'Galvão\n','SC'),(96,'Garopaba\n','SC'),(97,'Garuva\n','SC'),(98,'Gaspar\n','SC'),(99,'Governador Celso Ramos\n','SC'),(100,'Grão Pará\n','SC'),(101,'Gravatal\n','SC'),(102,'Guabiruba\n','SC'),(103,'Guaraciaba\n','SC'),(104,'Guaramirim\n','SC'),(105,'Guarujá do Sul\n','SC'),(106,'Guatambú\n','SC'),(107,'Herval d`Oeste\n','SC'),(108,'Ibiam\n','SC'),(109,'Ibicaré\n','SC'),(110,'Ibirama\n','SC'),(111,'Içara\n','SC'),(112,'Ilhota\n','SC'),(113,'Imaruí\n','SC'),(114,'Imbituba\n','SC'),(115,'Imbuia\n','SC'),(116,'Indaial\n','SC'),(117,'Iomerê\n','SC'),(118,'Ipira\n','SC'),(119,'Iporã do Oeste\n','SC'),(120,'Ipuaçu\n','SC'),(121,'Ipumirim\n','SC'),(122,'Iraceminha\n','SC'),(123,'Irani\n','SC'),(124,'Irati\n','SC'),(125,'Irineópolis\n','SC'),(126,'Itá\n','SC'),(127,'Itaiópolis\n','SC'),(128,'Itajaí\n','SC'),(129,'Itapema\n','SC'),(130,'Itapiranga\n','SC'),(131,'Itapoá\n','SC'),(132,'Ituporanga\n','SC'),(133,'Jaborá\n','SC'),(134,'Jacinto Machado\n','SC'),(135,'Jaguaruna\n','SC'),(136,'Jaraguá do Sul\n','SC'),(137,'Jardinópolis\n','SC'),(138,'Joaçaba\n','SC'),(139,'Joinville\n','SC'),(140,'José Boiteux\n','SC'),(141,'Jupiá\n','SC'),(142,'Lacerdópolis\n','SC'),(143,'Lages\n','SC'),(144,'Laguna\n','SC'),(145,'Lajeado Grande\n','SC'),(146,'Laurentino\n','SC'),(147,'Lauro Muller\n','SC'),(148,'Lebon Régis\n','SC'),(149,'Leoberto Leal\n','SC'),(150,'Lindóia do Sul\n','SC'),(151,'Lontras\n','SC'),(152,'Luiz Alves\n','SC'),(153,'Luzerna\n','SC'),(154,'Macieira\n','SC'),(155,'Mafra\n','SC'),(156,'Major Gercino\n','SC'),(157,'Major Vieira\n','SC'),(158,'Maracajá\n','SC'),(159,'Maravilha\n','SC'),(160,'Marema\n','SC'),(161,'Massaranduba\n','SC'),(162,'Matos Costa\n','SC'),(163,'Meleiro\n','SC'),(164,'Mirim Doce\n','SC'),(165,'Modelo\n','SC'),(166,'Mondaí\n','SC'),(167,'Monte Carlo\n','SC'),(168,'Monte Castelo\n','SC'),(169,'Morro da Fumaça\n','SC'),(170,'Morro Grande\n','SC'),(171,'Navegantes\n','SC'),(172,'Nova Erechim\n','SC'),(173,'Nova Itaberaba\n','SC'),(174,'Nova Trento\n','SC'),(175,'Nova Veneza\n','SC'),(176,'Novo Horizonte\n','SC'),(177,'Orleans\n','SC'),(178,'Otacílio Costa\n','SC'),(179,'Ouro\n','SC'),(180,'Ouro Verde\n','SC'),(181,'Paial\n','SC'),(182,'Painel\n','SC'),(183,'Palhoça\n','SC'),(184,'Palma Sola\n','SC'),(185,'Palmeira\n','SC'),(186,'Palmitos\n','SC'),(187,'Papanduva\n','SC'),(188,'Paraíso\n','SC'),(189,'Passo de Torres\n','SC'),(190,'Passos Maia\n','SC'),(191,'Paulo Lopes\n','SC'),(192,'Pedras Grandes\n','SC'),(193,'Penha\n','SC'),(194,'Peritiba\n','SC'),(195,'Pescaria Brava\n','SC'),(196,'Petrolândia\n','SC'),(197,'Pinhalzinho\n','SC'),(198,'Pinheiro Preto\n','SC'),(199,'Piratuba\n','SC'),(200,'Planalto Alegre\n','SC'),(201,'Pomerode\n','SC'),(202,'Ponte Alta\n','SC'),(203,'Ponte Alta do Norte\n','SC'),(204,'Ponte Serrada\n','SC'),(205,'Porto Belo\n','SC'),(206,'Porto União\n','SC'),(207,'Pouso Redondo\n','SC'),(208,'Praia Grande\n','SC'),(209,'Presidente Castello Branco\n','SC'),(210,'Presidente Getúlio\n','SC'),(211,'Presidente Nereu\n','SC'),(212,'Princesa\n','SC'),(213,'Quilombo\n','SC'),(214,'Rancho Queimado\n','SC'),(215,'Rio das Antas\n','SC'),(216,'Rio do Campo\n','SC'),(217,'Rio do Oeste\n','SC'),(218,'Rio do Sul\n','SC'),(219,'Rio dos Cedros\n','SC'),(220,'Rio Fortuna\n','SC'),(221,'Rio Negrinho\n','SC'),(222,'Rio Rufino\n','SC'),(223,'Riqueza\n','SC'),(224,'Rodeio\n','SC'),(225,'Romelândia\n','SC'),(226,'Salete\n','SC'),(227,'Saltinho\n','SC'),(228,'Salto Veloso\n','SC'),(229,'Sangão\n','SC'),(230,'Santa Cecília\n','SC'),(231,'Santa Helena\n','SC'),(232,'Santa Rosa de Lima\n','SC'),(233,'Santa Rosa do Sul\n','SC'),(234,'Santa Terezinha\n','SC'),(235,'Santa Terezinha do Progresso\n','SC'),(236,'Santiago do Sul\n','SC'),(237,'Santo Amaro da Imperatriz\n','SC'),(238,'São Bento do Sul\n','SC'),(239,'São Bernardino\n','SC'),(240,'São Bonifácio\n','SC'),(241,'São Carlos\n','SC'),(242,'São Cristovão do Sul\n','SC'),(243,'São Domingos\n','SC'),(244,'São Francisco do Sul\n','SC'),(245,'São João Batista\n','SC'),(246,'São João do Itaperiú\n','SC'),(247,'São João do Oeste\n','SC'),(248,'São João do Sul\n','SC'),(249,'São Joaquim\n','SC'),(250,'São José\n','SC'),(251,'São José do Cedro\n','SC'),(252,'São José do Cerrito\n','SC'),(253,'São Lourenço do Oeste\n','SC'),(254,'São Ludgero\n','SC'),(255,'São Martinho\n','SC'),(256,'São Miguel da Boa Vista\n','SC'),(257,'São Miguel do Oeste\n','SC'),(258,'São Pedro de Alcântara\n','SC'),(259,'Saudades\n','SC'),(260,'Schroeder\n','SC'),(261,'Seara\n','SC'),(262,'Serra Alta\n','SC'),(263,'Siderópolis\n','SC'),(264,'Sombrio\n','SC'),(265,'Sul Brasil\n','SC'),(266,'Taió\n','SC'),(267,'Tangará\n','SC'),(268,'Tigrinhos\n','SC'),(269,'Tijucas\n','SC'),(270,'Timbé do Sul\n','SC'),(271,'Timbó\n','SC'),(272,'Timbó Grande\n','SC'),(273,'Três Barras\n','SC'),(274,'Treviso\n','SC'),(275,'Treze de Maio\n','SC'),(276,'Treze Tílias\n','SC'),(277,'Trombudo Central\n','SC'),(278,'Tubarão\n','SC'),(279,'Tunápolis\n','SC'),(280,'Turvo\n','SC'),(281,'União do Oeste\n','SC'),(282,'Urubici\n','SC'),(283,'Urupema\n','SC'),(284,'Urussanga\n','SC'),(285,'Vargeão\n','SC'),(286,'Vargem\n','SC'),(287,'Vargem Bonita\n','SC'),(288,'Vidal Ramos\n','SC'),(289,'Videira\n','SC'),(290,'Vitor Meireles\n','SC'),(291,'Witmarsum\n','SC'),(292,'Xanxerê\n','SC'),(293,'Xavantina\n','SC'),(294,'Xaxim\n','SC'),(295,'Zortéa\n','SC');
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveis`
--

DROP TABLE IF EXISTS `niveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `niveis_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveis`
--

LOCK TABLES `niveis` WRITE;
/*!40000 ALTER TABLE `niveis` DISABLE KEYS */;
INSERT INTO `niveis` VALUES (1,'Técnico/Médio',1),(2,'Superior',1);
/*!40000 ALTER TABLE `niveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissores`
--

DROP TABLE IF EXISTS `submissores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `senha` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `ultimo_acesso` timestamp NULL DEFAULT NULL,
  `id_instituicao` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_submissores_instituicoes_idx` (`id_instituicao`),
  KEY `fk_submissores_municipios1_idx` (`id_municipio`),
  CONSTRAINT `fk_submissores_instituicoes` FOREIGN KEY (`id_instituicao`) REFERENCES `instituicoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_submissores_municipios1` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissores`
--

LOCK TABLES `submissores` WRITE;
/*!40000 ALTER TABLE `submissores` DISABLE KEYS */;
INSERT INTO `submissores` VALUES (1,'REGINALDO RUBENS DA SILVA','reginaldorubens@gmail.com','f5511a9d74eccecc4264d56020f69f2a','2015-07-22','2015-07-22 03:00:00',1,54),(2,'ANDRESSA GRAZIELE BRANDT','andressa@ifc-camboriu.edu.br','2f01b789d2a92221547aed86a85a3f38','2015-07-24','2015-07-24 03:00:00',1,54);
/*!40000 ALTER TABLE `submissores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_trabalho`
--

DROP TABLE IF EXISTS `tipos_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_trabalho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipos_trabalho_eventos1_idx` (`id_evento`),
  CONSTRAINT `fk_tipos_trabalho_eventos1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_trabalho`
--

LOCK TABLES `tipos_trabalho` WRITE;
/*!40000 ALTER TABLE `tipos_trabalho` DISABLE KEYS */;
INSERT INTO `tipos_trabalho` VALUES (1,'Trabalho completo',1),(2,'Trabalho em andamento',1);
/*!40000 ALTER TABLE `tipos_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabalhos`
--

DROP TABLE IF EXISTS `trabalhos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabalhos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resumo` text COLLATE utf8_unicode_ci,
  `nome_orientador` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_orientador` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_coorientador1` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_coorientador1` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_coorientador2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_coorientador2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_submissor` int(11) NOT NULL,
  `selecionado` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_evento` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `id_formato` int(11) DEFAULT NULL,
  `id_modalidade` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `data_ultima_alteracao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trabalhos_submissores1_idx` (`id_submissor`),
  KEY `fk_trabalhos_eventos1_idx` (`id_evento`),
  KEY `fk_trabalhos_areas1_idx` (`id_area`),
  KEY `fk_trabalhos_formatos1_idx` (`id_formato`),
  KEY `fk_trabalhos_modalidades1_idx` (`id_modalidade`),
  KEY `fk_trabalhos_tipos_trabalho1_idx` (`id_tipo`),
  KEY `fk_trabalhos_categorias1_idx` (`id_categoria`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `trabalhos_ibfk_1` FOREIGN KEY (`id_submissor`) REFERENCES `submissores` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `trabalhos_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `trabalhos_ibfk_3` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `trabalhos_ibfk_4` FOREIGN KEY (`id_formato`) REFERENCES `formatos` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `trabalhos_ibfk_5` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `trabalhos_ibfk_6` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_trabalho` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `trabalhos_ibfk_7` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `trabalhos_ibfk_8` FOREIGN KEY (`id_nivel`) REFERENCES `niveis` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalhos`
--

LOCK TABLES `trabalhos` WRITE;
/*!40000 ALTER TABLE `trabalhos` DISABLE KEYS */;
INSERT INTO `trabalhos` VALUES (1,'ACESSO E PERMANÊNCIA NA EDUCAÇÃO PROFISSIONAL TÉCNICA DE NÍVEL MÉDIO: UM ESTUDO DA TRAJETÓRIA DOS DISCENTES DO CURSO TÉCNICO EM AGROPECUÁRIA','A pesquisa em andamento tem como objetivo investigar e compreender como a trajetória de vida dos discentes influencia as condições de acesso e de permanência no curso técnico em agropecuária do IFC Câmpus Camboriú. Participaram dessa pesquisa três estudantes do curso técnico em agropecuária do IFC. O percurso metodológico de caráter qualitativo baseou‐se na pesquisa bibliográfica, em um mapeamento das produções nos eventos científicos do IFC como a FICE e a MICTI. Os resultados demonstraram que há carência de pesquisas aplicadas sobre a temática e que as trajetórias de vida exercem influência na permanência ou não no curso.','Andressa Graziele Brandt','andressa@ifc-camboriu.edu.br','','','','',2,NULL,1,11,2,2,2,1,1,NULL),(2,'CONTARTE: descobrindo a leitura através do lúdico no LATARTE','O projeto ContArte visa contribuir para a alfabetização e o letramento de crianças atendidas no LATARTE que vivem em situação de risco social na comunidade, com intuito de criar situações em que a literatura possa favorecer para a horizontalização do universo das crianças, visando a consequente formação como sujeitos leitores, capazes de compreender seus próprios sentimentos e impulsos, na medida em que se desenvolvem como cidadãos. A principal metodologia é a realização de oficinas de contação de histórias, realizadas com 40 crianças. Sendo assim, este projeto de extensão possibilita o envolvimento da comunidade acadêmica com os problemas locais e espaços não formais de educação.','Andressa Graziele Brandt','andressa@ifc-camboriu.edu.br','Robinson Fernando Alves','robinho@ifc-camboriu.edu.br','','',2,NULL,1,14,NULL,1,2,2,2,NULL);
/*!40000 ALTER TABLE `trabalhos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `ultimo_acesso` timestamp NULL DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-24 21:50:48
