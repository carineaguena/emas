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
  `tipo_arquivo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_trabalho` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_arquivos_trabalho_trabalhos1_idx` (`id_trabalho`),
  CONSTRAINT `fk_arquivos_trabalho_trabalhos1` FOREIGN KEY (`id_trabalho`) REFERENCES `trabalhos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquivos_trabalho`
--

LOCK TABLES `arquivos_trabalho` WRITE;
/*!40000 ALTER TABLE `arquivos_trabalho` DISABLE KEYS */;
INSERT INTO `arquivos_trabalho` VALUES (3,'2015-07-24','04:07:34','981e7619f1da037f1c3c7238279de56c.doc','doc',1),(4,'2015-07-24','04:07:34','981e7619f1da037f1c3c7238279de56c.pdf','pdf',1),(5,'2015-07-24','04:07:23','718980c1cad436a714fb28345efa618a.doc','doc',2),(6,'2015-07-24','04:07:23','718980c1cad436a714fb28345efa618a.pdf','pdf',2),(7,'2015-07-27','11:07:33','f6ed1ee2397b99b640bbc92f560240bd.doc','doc',3),(8,'2015-07-27','11:07:33','f6ed1ee2397b99b640bbc92f560240bd.pdf','pdf',3),(9,'2015-07-27','01:07:23','2b38a7612f8ca5bf5ed258534da3db89.doc','doc',4),(10,'2015-07-27','01:07:23','2b38a7612f8ca5bf5ed258534da3db89.pdf','pdf',4),(11,'2015-07-28','02:07:31','3107a9f6ce5ea1c04d67a0ac1ce674ed.doc','doc',5),(12,'2015-07-28','02:07:31','3107a9f6ce5ea1c04d67a0ac1ce674ed.pdf','pdf',5),(13,'2015-07-28','04:07:20','38eb446804bed5c2597cd67157312c88.doc','doc',6),(14,'2015-07-28','04:07:20','38eb446804bed5c2597cd67157312c88.pdf','pdf',6),(15,'2015-07-28','10:07:23','86128ef5e2614fb37611a23af9935fc9.docx','doc',8),(16,'2015-07-28','10:07:23','86128ef5e2614fb37611a23af9935fc9.pdf','pdf',8),(17,'2015-07-29','12:07:23','d2e13e923a0f8e1b71c87eac79db6baf.docx','doc',9),(18,'2015-07-29','12:07:23','d2e13e923a0f8e1b71c87eac79db6baf.pdf','pdf',9),(19,'2015-07-29','11:07:32','41d064fbe826406c0812c36d47a211b6.doc','doc',10),(20,'2015-07-29','11:07:33','41d064fbe826406c0812c36d47a211b6.pdf','pdf',10),(21,'2015-07-29','12:07:09','43a4056b0b288dd4fd9d32bb832e6d23.docx','doc',11),(22,'2015-07-29','12:07:09','43a4056b0b288dd4fd9d32bb832e6d23.pdf','pdf',11),(23,'2015-07-29','01:07:14','c52fd8b9fc616d602d402d8da7536a20.doc','doc',12),(24,'2015-07-29','01:07:14','c52fd8b9fc616d602d402d8da7536a20.pdf','pdf',12),(25,'2015-07-29','02:07:03','e2cc533522415673b947cb7fc5a2edd5.doc','doc',13),(26,'2015-07-29','02:07:03','e2cc533522415673b947cb7fc5a2edd5.pdf','pdf',13),(27,'2015-07-29','03:07:00','f9bf3b3464277c83da2ea5e502008652.doc','doc',14),(28,'2015-07-29','03:07:00','f9bf3b3464277c83da2ea5e502008652.pdf','pdf',14),(29,'2015-07-29','04:07:15','0d32a6878e5a8b7fa046b2ce52854267.doc','doc',15),(30,'2015-07-29','04:07:15','0d32a6878e5a8b7fa046b2ce52854267.pdf','pdf',15),(31,'2015-07-29','04:07:22','5f9ba7935c2065189f61498e32972337.docx','doc',16),(32,'2015-07-29','04:07:22','5f9ba7935c2065189f61498e32972337.pdf','pdf',16),(33,'2015-07-29','05:07:45','26aeb7b609f8dd064bd23223bbe432c3.doc','doc',17),(34,'2015-07-29','05:07:45','26aeb7b609f8dd064bd23223bbe432c3.pdf','pdf',17),(35,'2015-07-29','09:07:48','268524ced0662e3a7964c531a15737c4.doc','doc',18),(36,'2015-07-29','09:07:48','268524ced0662e3a7964c531a15737c4.pdf','pdf',18),(37,'2015-07-29','09:07:00','80c8f90fec89967d44df4b32b10f0c12.doc','doc',19),(38,'2015-07-29','09:07:00','80c8f90fec89967d44df4b32b10f0c12.pdf','pdf',19),(39,'2015-07-29','09:07:18','fb3d95687d7bc900560a857d6d38ad4d.doc','doc',20),(40,'2015-07-29','09:07:18','fb3d95687d7bc900560a857d6d38ad4d.pdf','pdf',20),(41,'2015-07-29','09:07:05','02f3a6fc5c6590ebf5ff404e5d45662f.doc','doc',21),(42,'2015-07-29','09:07:05','02f3a6fc5c6590ebf5ff404e5d45662f.pdf','pdf',21),(43,'2015-07-30','10:07:51','0a728787571859bd3c633b3bb25e7fcc.doc','doc',22),(44,'2015-07-30','10:07:51','0a728787571859bd3c633b3bb25e7fcc.pdf','pdf',22),(45,'2015-07-30','12:07:27','572fb4e4126b3e8d0cc049a25513cf4d.doc','doc',23),(46,'2015-07-30','12:07:27','572fb4e4126b3e8d0cc049a25513cf4d.pdf','pdf',23),(47,'2015-07-30','01:07:29','299c6ca09070d4d57fc6e60456f0f4b6.doc','doc',24),(48,'2015-07-30','01:07:29','299c6ca09070d4d57fc6e60456f0f4b6.pdf','pdf',24),(49,'2015-07-30','01:07:22','5f9e75955401a43e21619382bcff5029.doc','doc',25),(50,'2015-07-30','01:07:22','5f9e75955401a43e21619382bcff5029.pdf','pdf',25),(51,'2015-07-30','01:07:14','4c38dd126d093886384afcf12ba76a39.doc','doc',26),(52,'2015-07-30','01:07:14','4c38dd126d093886384afcf12ba76a39.pdf','pdf',26),(53,'2015-07-30','01:07:49','0ccf12c01e6593c236c027890de66fa0.doc','doc',27),(54,'2015-07-30','01:07:49','0ccf12c01e6593c236c027890de66fa0.pdf','pdf',27),(55,'2015-07-30','02:07:11','382ea1118df6eaf0e56e72e6219500f4.doc','doc',28),(56,'2015-07-30','02:07:11','382ea1118df6eaf0e56e72e6219500f4.pdf','pdf',28),(57,'2015-07-30','02:07:30','fb5f76d406b78665d1bd6e41cc740e67.doc','doc',29),(58,'2015-07-30','02:07:30','fb5f76d406b78665d1bd6e41cc740e67.pdf','pdf',29),(59,'2015-07-30','02:07:23','ba74ed0a9941f5c1f38859eae2ee94d1.doc','doc',30),(60,'2015-07-30','02:07:23','ba74ed0a9941f5c1f38859eae2ee94d1.pdf','pdf',30),(61,'2015-07-30','03:07:21','f3e6639e45e4356b33fbafd9e102d86b.doc','doc',31),(62,'2015-07-30','03:07:21','f3e6639e45e4356b33fbafd9e102d86b.pdf','pdf',31),(64,'2015-07-30','03:07:31','ddcefa1f17dc8fc0079cf9cd7bd81411.odt','doc',29),(65,'2015-07-30','03:07:31','ddcefa1f17dc8fc0079cf9cd7bd81411.pdf','pdf',29),(66,'2015-07-30','03:07:07','560b1f95ffa6bc11da113051dd532355.doc','doc',32),(67,'2015-07-30','03:07:07','560b1f95ffa6bc11da113051dd532355.pdf','pdf',32),(68,'2015-07-30','03:07:16','0ff2801d33d2730fc8b9babe74ef3920.doc','doc',33),(69,'2015-07-30','03:07:16','0ff2801d33d2730fc8b9babe74ef3920.pdf','pdf',33),(70,'2015-07-30','03:07:02','e97be7d2dd40b801040b1dbc5c94b176.doc','doc',34),(71,'2015-07-30','03:07:02','e97be7d2dd40b801040b1dbc5c94b176.pdf','pdf',34);
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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (4,'Maria Eduarda Hannibal','maria.eduardah.14@hotmail.com',1,1),(5,'Giovanna Gobbo Agnoletto','gigobbo212@hotmail.com',1,1),(6,'Kelly Valcarenghi Nit','kelly_nitz@hotmail.com',1,1),(7,'Luciana Iavorski',' luzynha_my@hotmail.com',2,1),(8,'Andressa Graziele Brandt','andressa@ifc-camboriu.edu.br',2,1),(9,'Robinson Fernando Alves','robinho@ifc-camboriu.edu.br',2,1),(10,'André Fabiano de Moraes','afdmoraes@ifc-camboriu.edu.br ',3,1),(11,'Líbia Raquel Gomes','lrg3873@gmail.com',3,1),(12,'Higor Bechelli','hbechelli@gmail.com ',3,1),(13,'Letícia Santos da Silva','leticia17lele@gmail.com',4,1),(14,'Liliane Silva Galvão','lilianesilvagalvao@yahoo.com.br',4,1),(15,'Litielli Penning da Silva','litielli@outlook.com',4,1),(16,'André Fellipe Wollinger','andre_lipe_wlg@hotmail.com',5,1),(17,'Olimar Antonio Lopes Dias','oli_dias@hotmail.com',5,1),(18,'Gabriel Luiz Cividini','gabriel.cividini@hotmail.com',6,1),(19,'Vinícius Garibaldi Rigon','vinigrigon@gmail.com',6,1),(20,'Cristalina Yoshie Yoshimura','cristal@ifc-camboriu.edu.br',6,1),(21,'Maria Eduarda Pinheiro Carvalho','m.eduardacarvalho@yahoo.com.br',7,1),(22,'Alexandre Vanzuita','alexandre@ifc-camboriu.edu.br',7,1),(23,'Maria Eduarda Pinheiro Carvalho','m.eduardacarvalho@yahoo.com.br',8,1),(24,'Alexandre Vanzuita','alexandre@ifc-camboriu.edu.br',8,1),(25,'Tiago Torresani','_tiago_@live.com',9,1),(26,'Ana Elisa Schmidt','anaelisa@ifc-camboriu.edu.br',9,1),(27,'Miguel Airton Frantz','frantz.miguel@gmail.com',10,1),(28,'Angelo Augusto Frozza','frozza@ifc-camboriu.edu.br',10,1),(29,'Reginaldo Rubens da Silva','reginaldo@ifc-camboriu.edu.br',10,1),(30,'Larissa Maas','larissamaas@ifc-camboriu.edu.br',11,1),(31,'Flavia de Souza Fernandes','flavia@ifc-camboriu.edu.br',11,1),(32,'Michela Cancillier','michela@ifc-camboriu.edu.br',11,1),(33,'Maria Eduarda Engel dos Santos','ddudaengel@live.com',12,1),(34,'Isadora de Lima Prado','isadora.prado@outlook.com',12,1),(35,'Maria Vitoria Moraes Farias','vickmmoraes@icloud.com',12,1),(36,'Alessandra Hoffmeister Bronzatti','alessandra.bronzatti@gmail.com ',13,1),(37,'Larissa Rhenius de Souza','lari-rc@outlook.com',13,1),(38,'Lucas de Almeida Godoi','lucasa.godoi@hotmail.com',13,1),(39,'Rossano Linassi','rossano@ifc-camboriu.ediu.br',14,2),(40,'Natasha Daffini de Abreu ','natasha_av.9@hotmail.com',14,2),(41,'Andressa Andrade de Lima ','andressaandradelima@hotmail.com',14,2),(42,'Eduarda Madalena','duda092009@hotmail.com',15,1),(43,'Giovane Ferreira','giovaneescalonilla@gmail.com',15,1),(44,'Nathan Betim','nathan_bettim@outlook.com',15,1),(45,'Agata Rhenius','rhenius.agata@gmail.com',16,1),(46,'Melissa Meier','melissameier@gmail.com',16,1),(47,'Ester Rosa Rocha','teka712@gmail.com',17,1),(48,'Lucas Tagliapietra Teles','lucasttaglia@gmail.com',18,1),(49,'Angelo Augusto Frozza','frozza@ifc-camboriu.edu.br',18,1),(50,'Dafny Ribas Reichert','dafny.ribas@gmail.com',19,1),(51,'Angelo Augusto Frozza','frozza@ifc-camboriu.edu.br',19,1),(52,'Reginaldo Rubens da Silva','reginaldo@ifc-camboriu.edu.br',19,1),(53,'Roberta Raquel','roberta@ifc-camboriu.edu.br',20,2),(54,'Roberta Raquel','roberta@ifc-camboriu.edu.br',21,2),(55,'Larissa Regis Fernandes','larissa@ifc-camboriu.edu.br',22,1),(56,'Letícia Marieli Schmitz','leticiamschimitz@gmail.com',22,1),(57,'Maria Júlia Minella Antunes','mariajulia_m@live.com',22,1),(58,'Ariadne Pacheco de Borba','ariadneepacheco@gmail.com',23,1),(59,'Letícia Lenzi','leticialenzi@ifc-camboriu.edu.br',23,1),(60,'Natália Amaro','natalia.amaro99@hotmail.com',24,2),(61,'Nicoli Policarpo','nicoli.policarpo@hotmail.com',24,2),(62,'Cristalina Yoshie Yoshimura','cristal@ifc-camboriu.edu.br',24,2),(63,'Lorena Paula Schufer','lorenaschufer@hotmail.com',25,1),(64,' Tainã Cristiane Bilk','taibilk@hotmail.com',25,1),(65,'Talita Frida Machado','tali.tili@hotmail.com ',25,1),(66,'Paulo Henrique Antunes Pittarello','paulo.pittarello@hotmail.com',26,1),(67,'Marina Tété Vieira','marina@ifc-camboriu.edu.br',26,1),(68,'Eduardo Kilian Santos da Silva','duca_kilian@hotmail.com',27,1),(69,'Kleber Ersching','kleber@ifc-camboriu.edu.br',27,1),(70,'Gabriel Moura Brasil','brasil@msn.com',28,1),(71,'Sérgio Feldemann de Quadros','sergiofquadros@gmail.com',28,1),(72,'Reginaldo Rubens da Silva','reginaldo@ifc-camboriu.edu.br',29,1),(73,'Angelo Augusto Frozza','frozza@ifc-camboriu.edu.br',29,1),(74,'Cleonice Vieira','cleonicevieira13@gmail.com',30,1),(75,'Leisi Fernanda Moya','lasinha2@gmail.com',30,1),(76,'Daniel Sergio Cipriani','daniel_saojb@hotmail.com',31,1),(77,'Samara Campos Nascimento','samara.camposnascimento@hotmail.com',31,1),(78,'Maria Amélia Pellizzetti','map@ifc-camboriu.edu.br',32,1),(79,'Huillian Braga','huillianbraga@hotmail.com',33,1),(80,'Matheus de Oliveira Mussi','matheusmussi@hotmail.com',33,1),(81,'Andreas Lucas do Nascimento Gelhardt','andreas@gelhardt.com.br',34,1),(82,'Igor de Sousa Bittencourt','igorssousa1998@gmail',34,1);
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
  `sigla` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'VI FICE - Feira de Iniciação Científica e Extensão 2015','2015-09-02','2015-09-03','VI FICE');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instituicoes`
--

LOCK TABLES `instituicoes` WRITE;
/*!40000 ALTER TABLE `instituicoes` DISABLE KEYS */;
INSERT INTO `instituicoes` VALUES (1,'IFC-Camboriú'),(2,'IFC- CAM'),(3,'IFC - Campus Rio do Sul'),(4,'IFC câmpus Luzerna');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissores`
--

LOCK TABLES `submissores` WRITE;
/*!40000 ALTER TABLE `submissores` DISABLE KEYS */;
INSERT INTO `submissores` VALUES (1,'REGINALDO RUBENS DA SILVA','reginaldorubens@gmail.com','f5511a9d74eccecc4264d56020f69f2a','2015-07-22','2015-07-30 03:00:00',1,54),(2,'ANDRESSA GRAZIELE BRANDT','andressa@ifc-camboriu.edu.br','2f01b789d2a92221547aed86a85a3f38','2015-07-24','2015-07-28 03:00:00',1,54),(3,'ARIADNE PACHECO DE BORBA','ariadneepacheco@gmail.com','989994d6bccfab8f2c19a5c20fbab057','2015-07-27','2015-07-28 03:00:00',1,54),(4,'LÍBIA RAQUEL GOMES','lrg3873@gmail.com','19fc0ff32648106ea70209cb9bd04421','2015-07-27',NULL,1,54),(5,'Isadora Balsini Lucio','isadora@ifc-camboriu.edu.br','596d5166311c081c1abf2e9d770f638d','2015-07-27','2015-07-30 03:00:00',1,54),(6,'IVANNA SCHENKEL FORNARI GRECHI','ivanna@ifc-camboriu.edu.br','b3c20502f4e6d84cf5799192191b67a8','2015-07-28','2015-07-29 03:00:00',1,54),(7,'José Luiz Ungericht Júnior','ungericht@ifc-camboriu.edu.br','bf044fb9bab4a845a0ecb6f1d6fb3cce','2015-07-28','2015-07-30 03:00:00',1,54),(8,'Cristalina Yoshie Yoshimura','cristal@ifc-camboriu.edu.br','01678ec828090e517478e7b1dce3bc83','2015-07-28','2015-07-30 03:00:00',1,54),(9,'Larissa Maas','larissamaas@ifc-camboriu.edu.br','27f55e0e78f105318d5c5e3dc65f476e','2015-07-28','2015-07-29 03:00:00',1,54),(10,'Alexandre Vanzuita','alexandre@ifc-camboriu.edu.br','9b4c470336381f6dfb9cf1190fa8cfe2','2015-07-28','2015-07-28 03:00:00',1,54),(11,'Ana Elisa Schmidt','anaelisa@ifc-camboriu.edu.br','4ee152fa6464fdd89142d9e4a4952864','2015-07-29',NULL,1,54),(12,'ANGELO AUGUSTO FROZZA','frozza@ifc-camboriu.edu.br','82ffdc324752f9a1eebf7b052c31c3c3','2015-07-29','2015-07-29 03:00:00',1,54),(13,'andreia regina bazzo','andreia@ifc-camboriu.edu.br','dc483e80a7a0bd9ef71d8cf973673924','2015-07-29',NULL,1,54),(14,'Rossano Linassi','rossano@ifc-camboriu.edu.br','c12f69bd6ab31cb70df2e87435ed45e7','2015-07-29',NULL,1,54),(15,'Luana','LUANA@IFC-CAMBORIU.EDU.BR','66fdd807f2d0a6687041f27fd067e51d','2015-07-29','2015-07-29 03:00:00',1,54),(16,'Luciana Colussi','lucol@ifc-camboriu.edu.br','7d734d70bbb11a4fabce5ad2a2dd1ba1','2015-07-29',NULL,1,54),(17,'AGATA RHENIUS','rhenius.agata@gmail.com','fbe0229f7e30347916f182b76be65d69','2015-07-29',NULL,1,128),(18,'Flávia Walter','flaviabroto@ifc-camboriu.edu.br','8cc9f13dbe3f929d0229d53d6d44f74d','2015-07-29','2015-07-29 03:00:00',1,54),(19,'Gabriel Moura Brasil','gabriel.mb03@gmail.com','832f1292a215e7ee5657402188701fc7','2015-07-29','2015-07-30 03:00:00',1,54),(20,'Roberta Raquel','roberta@ifc-camboriu.edu.br','75413a2292343ceaa1cead19ff49748d','2015-07-29','2015-07-30 03:00:00',2,54),(21,'Milena Julia Chirolli','mily.chirolli@hotmail.com','7981109d9b798876486e79e51c9c5562','2015-07-30',NULL,3,218),(22,'Larissa Regis Fernandes','larissa@ifc-camboriu.edu.br','a2edb333833fe7496185f7f4ca3f50e0','2015-07-30','2015-07-30 03:00:00',1,54),(23,'Letícia Lenzi','leticialenzi@ifc-camboriu.edu.br','0220cebf7a514d7a7c95f977150c704a','2015-07-30',NULL,1,54),(24,'Marina Tété Vieira','marina@ifc-camboriu.edu.br','66cf4b1f42df932908b2178ca6ccdc89','2015-07-30',NULL,1,54),(25,'Eduardo Kilian Santos da Silva','duca_kilian@hotmail.com','8cbec5e91b9c9a0aacb85a8725ba8ef9','2015-07-30',NULL,1,54),(26,'Marcos Alexandre Heinig','marcos@ifc-camboriu.edu.br','7620a9e9628e55159954d6cd3dab8672','2015-07-30','2015-07-30 03:00:00',1,54),(27,'Fernando','deodato.95@gmail.com','c5cec9157d170140be56052a84ac4ab7','2015-07-30','2015-07-30 03:00:00',1,129),(28,'Marcos Vinicius Alves da Silva ','marcos.vinicius.04@hotmail.com','5e6d0abbb8a40fd5380a7a1f17d280f3','2015-07-30','2015-07-30 03:00:00',1,54),(29,'Alexandre Schweitzer','alexandresch@ifc-camboriu.edu.br','82ffdc324752f9a1eebf7b052c31c3c3','2015-07-30','2015-07-30 03:00:00',1,54),(30,'LEISI FERNANDA MOYA','lasinha2@gmail.com','0e810b8c1d15fe212a19b241a8d068e9','2015-07-30','2015-07-30 03:00:00',1,54),(31,'Renan Junior Balan','renanjrbalan@gmail.com','e0df5f3dfd2650ae5be9993434e2b2c0','2015-07-30','2015-07-30 03:00:00',4,153),(32,'Giane Lavarda Melo','giane@ifc-camboriu.edu.br','1a47f4e1568c799f7ed819a5f53553ef','2015-07-30','2015-07-30 03:00:00',1,54),(33,'Sabrina Zanella','sabrinazanella.ifc@gmail.com','199d3f788103026f7f3fff3de50f0eeb','2015-07-30','2015-07-30 03:00:00',4,153),(34,'MARIA AMÉLIA PELLIZZETTI','map@ifc-camboriu.edu.br','8cc946123dcf3c00c15de91c11db056f','2015-07-30','2015-07-30 03:00:00',1,54),(35,'Everson Deon','everson@ifc-camboriu.edu.br','d47b07bfebcfdab3653afeb785585052','2015-07-30','2015-07-30 03:00:00',1,54);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabalhos`
--

LOCK TABLES `trabalhos` WRITE;
/*!40000 ALTER TABLE `trabalhos` DISABLE KEYS */;
INSERT INTO `trabalhos` VALUES (1,'ACESSO E PERMANÊNCIA NA EDUCAÇÃO PROFISSIONAL TÉCNICA DE NÍVEL MÉDIO: UM ESTUDO DA TRAJETÓRIA DOS DISCENTES DO CURSO TÉCNICO EM AGROPECUÁRIA','A pesquisa em andamento tem como objetivo investigar e compreender como a trajetória de vida dos discentes influencia as condições de acesso e de permanência no curso técnico em agropecuária do IFC Câmpus Camboriú. Participaram dessa pesquisa três estudantes do curso técnico em agropecuária do IFC. O percurso metodológico de caráter qualitativo baseou‐se na pesquisa bibliográfica, em um mapeamento das produções nos eventos científicos do IFC como a FICE e a MICTI. Os resultados demonstraram que há carência de pesquisas aplicadas sobre a temática e que as trajetórias de vida exercem influência na permanência ou não no curso.','Andressa Graziele Brandt','andressa@ifc-camboriu.edu.br','','','','',2,NULL,1,11,2,2,2,1,1,NULL),(2,'CONTARTE: descobrindo a leitura através do lúdico no LATARTE','O projeto ContArte visa contribuir para a alfabetização e o letramento de crianças atendidas no LATARTE que vivem em situação de risco social na comunidade, com intuito de criar situações em que a literatura possa favorecer para a horizontalização do universo das crianças, visando a consequente formação como sujeitos leitores, capazes de compreender seus próprios sentimentos e impulsos, na medida em que se desenvolvem como cidadãos. A principal metodologia é a realização de oficinas de contação de histórias, realizadas com 40 crianças. Sendo assim, este projeto de extensão possibilita o envolvimento da comunidade acadêmica com os problemas locais e espaços não formais de educação.','Andressa Graziele Brandt','andressa@ifc-camboriu.edu.br','Robinson Fernando Alves','robinho@ifc-camboriu.edu.br','','',2,NULL,1,14,NULL,1,2,2,2,NULL),(3,'FRAMEWORK PARA INTEGRAÇÃO E SEGURANÇA DE WEB SERVICES GEOESPACIAIS','O objetivo deste trabalho é construir um Framework aberto que facilite a integração com\nvárias bibliotecas geoespaciais, a exemplo da API do Google Maps através da criação de\nalgorítimos específicos de criptografia destas informações, quando necessário e utilizando\nprincipalmente padrões open source.\nEste estudo de caso terá um ambiente colaborativo onde será possível a visualização do\nlocal a ser estudado em mapas 3D para se ter uma melhor visualização da área. Haverá\nespaço de anotações das estruturas locais, ou seja, tipo de solo, se é uma região propicia a\nenchente, se é uma área rural ou urbana, ou qualquer outra informação que seja útil para a\npopulação da região em específico. Além de importar dados úteis, como citado acima, de\nportais disponíveis para download.\nPara que este tipo de aplicação seja útil, serão observadas os critérios de usabilidade, e\nhaverá uma sincronia entre termo de busca no mapa com as informações cadastradas\nanteriormente por outro usuário, para a análise e a possibilidade edição do visitante.','André Fabiano de Moraes','afdmoraes@gmail.com','','','','',4,NULL,1,10,NULL,1,2,1,2,NULL),(4,'TURISMO CULTURAL: TRAÇOS DA IMIGRAÇÃO EM POMERODE, BLUMENAU E GASPAR.','Este projeto tem como objetivo identificar como os elementos culturais ainda permanecentes dos colonizadores (alemães, italianos e açorianos) influenciaram e influenciam no turismo cultural de Blumenau, Pomerode e Gaspar. Para isto usamos os métodos bibliográficos, de campo e entrevista. Após a revisão de literatura sobre o tema, aos turistas hospedados em hotéis dessas cidades, foram aplicados questionários, e aos descendentes de alemães, italianos e açorianos que moram nessas cidades foram realizadas entrevistas. Os resultados apontaram que os elementos que foram trazidos pelos colonizadores que ainda são visíveis aos turistas são a arquitetura, a culinária e as festas regionais.','Isadora Balsini Lucio','isadora@ifc-camboriu.edu.br','','','','',5,NULL,1,11,2,2,2,1,1,NULL),(5,'VALORIZAÇÃO DOS IMÓVEIS DE ALTO PADRÃO COMERCIALIZADOS NA PLANTA ATÉ A ENTREGA DAS CHAVES EM 2014, LOCALIZADOS NA AVENIDA ATLÂNTICA EM BALNEÁRIO CAMBORIÚ/SC.','       O trabalho é uma pesquisa científica direcionada ao mercado imobiliário de alto padrão na Avenida Atlântica na cidade de Balneário Camboriú -SC.  Serão coletados e analisados dados de três grandes construtoras conceituadas e de renome na cidade e região a citar: Embraed Empreendimentos, FG Empreendimentos e Procave Incorporadora. Os dados coletados serão a partir do lançamento do empreendimento até a entrega das chaves, ou seja, serão comparados os preços dos imóveis durante todo o histórico de vendas e período da obra e sempre que houver alteração de valores desses imóveis até a sua inauguração, descobrindo assim a valorização percentual dos empreendimentos pesquisados e mostrar que comprar um imóvel na planta pode ser um dos melhores investimentos hoje em dia, embora todo investimento envolva algum risco, o risco existe mais vale ressaltar que se trata de empresas de grande credibilidade e muito bem estruturadas no seu ramo de atuação. Esses dados serão pesquisados diretamente com as empresas, através de arquivos de vendas. \n\n','José Luiz Ungericht Júnior','ungericht@ifc-camboriu.edu.br','Luciane Grando Dorneles Ungericht','luciane@ifc-camboriu.edu.br','','',7,NULL,1,11,NULL,1,2,1,2,NULL),(6,'O USO DE TÉCNICAS DE NUCLEAÇÃO PARA A RESTAURAÇÃO ECOLÓGICA EM UMA ÁREA DEGRADADA','Durante o processo de evolução humana utilizou-se muito dos recursos naturais, e isto levou à necessidade de um maior aprofundamento nos conceitos de restauração ambiental e ecológica. Esses estudos começaram por volta dos anos 70, e seguiram evoluindo até os dias de hoje. Como atualmente sabe-se que a sucessão ecológica favorece a evolução natural de ambientes degradados, o presente trabalho tem como objetivo identificar a melhor configuração de plantio de mudas nativas em grupos em uma área a ser restaurada no Instituto Federal Catarinense – Câmpus Camboriú (IFC - CC). Para alcançar os objetivos serão selecionadas mudas produzidas no setor de Silvicultura do IFC - CC e algumas espécies doadas por outras instituições. Após a seleção das mudas será iniciado o plantio das mesmas no local a ser restaurado e posteriormente os dados obtidos durante o processo serão coletados semanal ou quinzenalmente. Além disso, as técnicas de transposição de galharias e poleiros secos serão avaliadas quanto a sua efetividade na restauração ambiental. Visto que o projeto está em andamento, não existem dados coletados, no entanto espera-se que até a data prevista para a apresentação na VI FICE os resultados preliminares estejam disponíveis. ','Cristalina Yoshie Yoshimura','cristal@ifc-camboriu.edu.br','','','','',8,NULL,1,11,2,2,2,1,1,NULL),(7,'TAEKWON-DO ITF NO IFC CÂMPUS CAMBORIÚ: uma abordagem inclusiva','Este projeto visa promover a prática do Taekwon-do no contexto escolar por meio de atividades contextualizadas como fundamento para as aprendizagens desta arte marcial. Essa abordagem possibilitará construir espaços de práticas voltadas a melhoria da performance corporal, assim como levar os alunos a desenvolverem os aspectos técnicos e táticos e por meio de encenações, simulações e vivências de lutas, formas, habilidades e defesa pessoal. Oferecer uma prática que supere a repetição por meio de metodologias ativas (crítico-emancipatória) está sendo o nosso desafio, buscando oportunizar a formação de sujeitos críticos e emancipados. Percebe-se que os alunos participantes do projeto já demonstram maior iniciativa e desenvoltura nas atividades práticas do Taekwon-do, bem como nas orientações problematizadoras.\n\nPalavras-chave: Artes marciais. Inclusão. Problematização.\n','Alexandre Vanzuita','alexandre@ifc-camboriu.edu.br','','','','',10,NULL,1,14,2,2,2,2,1,NULL),(8,'TAEKWON-DO ITF NO IFC CÂMPUS CAMBORIÚ: uma abordagem inclusiva','Este projeto visa promover a prática do Taekwon-do no contexto escolar por meio de atividades contextualizadas como fundamento para as aprendizagens desta arte marcial. Essa abordagem possibilitará construir espaços de práticas voltadas a melhoria da performance corporal, assim como levar os alunos a desenvolverem os aspectos técnicos e táticos e por meio de encenações, simulações e vivências de lutas, formas, habilidades e defesa pessoal. Oferecer uma prática que supere a repetição por meio de metodologias ativas (crítico-emancipatória) está sendo o nosso desafio, buscando oportunizar a formação de sujeitos críticos e emancipados. Percebe-se que os alunos participantes do projeto já demonstram maior iniciativa e desenvoltura nas atividades práticas do Taekwon-do, bem como nas orientações problematizadoras.\n\nPalavras-chave: Artes marciais. Inclusão. Problematização.\n','Alexandre Vanzuita','alexandre@ifc-camboriu.edu.br','','','','',10,NULL,1,14,2,2,2,2,1,NULL),(9,'ANÁLISE E INVESTIGAÇÃO FORENSE EM FOTOGRAFIAS DIGITAIS: Relato de pesquisa','Este artigo apresenta o estado de andamento do projeto de pesquisa que tem como objetivo estudar técnicas de Processamento Digital de Imagem e de Computação Forense que possam auxiliar a desvendar se uma determinada imagem digital foi alterada, e em caso de alteração o que foi alterado exatamente. Para isto, está sendo feita a pesquisa de bibliotecas de processamento de imagem, verificando suas funcionalidades e buscando dentre estas as que permitam implementar tais análises forense. Busca-se chegar ao final do projeto permitindo a identificação de alterações na imagem de fotografias digitais, podendo dizer se uma fotografia foi modificada digitalmente.','Ana Elisa Schimdt','anaelisa@ifc-camboriu.edu.br','','','','',11,NULL,1,10,NULL,1,2,1,2,NULL),(10,'CONHECIMENTO EM REDES SOCIAIS: Um estudo relacionado à recuperação de informação sobre textos publicados no Twitter ','Este trabalho tem como objetivo apresentar um protótipo capaz de realizar recuperação de informações em textos de mensagens postadas por um usuário do Twitter. Com o intuito de permitir fácil adaptação da ferramenta para trabalhar com textos de outras fontes de dados, a mesma foi desenvolvida em camadas. Dessa forma, a aplicação extrai palavras chave encontradas nas mensagens postadas de cada usuário. O resultado é apresentado em forma de uma nuvem de tags, atribuindo maior tamanho de fonte aos termos relevantes que aparecem com mais frequência. A nuvem de tags resultante representa, assim, os assuntos mais abordados pelo usuário.','ANGELO AUGUSTO FROZZA','frozza@ifc-camboriu.edu.br','','','','',12,NULL,1,10,NULL,1,1,1,2,NULL),(11,'CAPACITAÇÃO DA COMUNIDADE DA CIDADE DE CAMBORIÚ E COMUNIDADE INTERNA DO IFC CÂMPUS CAMBORIÚ SOBRE GERENCIAMENTO DOS RESÍDUOS SÓLIDOS DE SERVIÇOS DE SAÚDE','O gerenciamento dos resíduos é um dos assuntos mais relevantes para o desenvolvimento sustentável, pois objetiva minimizar sua produção, e a destiná-los adequadamente, protegendo o meio ambiente e saúde. Tendo a preocupação de gerenciar os resíduos sólidos de serviços de saúde gerados nos estabelecimentos de saúde do município de Camboriú – SC, o presente projeto tem o objetivo de oferecer oficinas de capacitação e informação sobre a manipulação, armazenamento e destino adequados dos resíduos aos funcionários destes estabelecimentos, estudantes, aos que prestam serviços de limpeza no Instituto Federal Catarinense – câmpus Camboriú, e a toda comunidade acadêmica e demais interessados.','Larissa Maas','larissamaas@ifc-camboriu.edu.br','Flávia de Souza Fernandes','flavia@ifc-camboriu.edu.br','Michela Cancillier','michela@ifc-camboriu.edu.br',9,NULL,1,17,2,2,2,2,1,NULL),(12,'SUSTENTABILIDADE NOS MEIOS DE HOSPEDAGEM: um estudo das práticas desenvolvidas no município de Balneário Camboriú','\"O turismo vem crescendo de uma forma rápida e desordenada. Nos últimos anos, surgiram várias preocupações com o meio ambiente, principalmente quando a atividade é realizada em ambientes naturais.\'\' (MEDEIROS; MORAES 2013, p. 199 - 200). Esta pesquisa tem como objetivo compreender as práticas sustentáveis desenvolvidas nos meios de hospedagem de Balneário Camboriú – SC. Os procedimentos metodológicos utilizados serão pesquisa bibliográfica e aplicação de questionários. Espera-se através da presente pesquisa conhecer as práticas sustentáveis desenvolvidas pelos hotéis de Balneário Camboriú a fim de proporcionar retorno aos gestores e a sociedade.','Ivanna Schenkel Fornari Grechi','ivanna@ifc-camboriu.edu.br','','','','',6,NULL,1,11,1,2,1,1,1,NULL),(13,'CIRANDA DA ARTE','Acredita-se que com o tempo e com o avanço da tecnologia, os livros serão banalizados. Entretanto não só eles, como também boa parte das manifestações culturais no Brasil, que têm dificuldade em valorizar e sofre com um processo de esquecimento e falta de divulgação das produções artísticas, culturais e de acesso a leitura. A intenção do projeto, Ciranda da Arte, é mostrar à comunidade de Itapema as diversas formas de manifestações artísticas locais com o intuito de levar cultura e arte. O projeto de extensão foi elaborado em disciplina de iniciação científica e conta com a colaboração do Colégio Atlântico. O processo foi à mostra cultural e artística com incentivo a leitura e troca de livros. Espera-se que a iniciativa possa mudar alguma coisa na vida e nos hábitos dos participantes ao relacionarem-se com a arte e a cultura local.','Andreia Bazzo','andreia@camboriu-ifc.edu.br','Vilde Pedro Andreazza','vilde@camboriu-ifc.edu.br','','',13,NULL,1,13,2,2,2,2,1,NULL),(14,'CONHEÇA O CAMPUS IFC-CAM  visitas guiadas ','O presente projeto de extensão visa atender as escolas das redes municipal, estadual, federal e particular de Camboriú e região, através da operacionalização de visitas guiadas aos setores do IFC-CAM, buscando apresentar as estruturas do Instituto à comunidade, suprir necessidades das escolas em relação à complementação do ensino tradicional realizado em sala de aula, buscando a indissociabilidade entre ensino-pesquisa-extensão, e ainda servir de espaço para divulgar e promover o IFC como opção de ensino médio/técnico e superior para futuros alunos.','Rossano Linassi','rossano@ifc-camboriu.edu.br','','','','',14,NULL,1,14,2,2,2,2,1,NULL),(15,'LAZER E RECREAÇÃO: na sua visão','A presente pesquisa tem como tema a importância das atividades de Lazer e Recreação nos meios de hospedagem. O objetivo principal é analisar o setor de Lazer e Recreação para comparar a percepção dos hóspedes e monitores em relação as atividades realizadas nos meios de hospedagem. A pesquisa será aplicada em dois meios de hospedagem: Infinity Blue Resort & Spa, localizado em Balneário Camboriú – SC e Plaza Itapema Resort & Spa, situado em Itapema - SC. Como principal resultado pretende-se demonstrar a importância do setor na escolha de um meio de hospedagem por parte do hóspede. ','Ivanna Schenkel Fornari Grechi','ivanna@ifc-camboriu.edu.br','','','','',6,NULL,1,11,2,2,2,1,1,NULL),(16,'A CONSTRUÇÃO DE ESPAÇOS E MATERIAIS DIGITAIS PARA A EDUCAÇÃO MATEMÁTICA: O USO DO SMARTPHONE NO ENSINO DA GEOMETRIA','O projeto tem como objetivo investigar e explorar a utilização de dispositivos móveis no ensino da matemática, mais especificamente, no ensino da geometria. Apresentamos que a junção da ideia de mobilidade e interatividade, e pelo impacto do uso de dispositivos móveis na educação, podem contribuir, enriquecer e aperfeiçoar o desenvolvimento da aprendizagem. Nosso foco é dar continuidade ao projeto que iniciou pelos editais 084/GDG/IFC-CAM/2013 e 144/2013 – PROEX / IF CATARINENSE, melhorando assim o aplicativo TRIDIMAT, desenvolvido pelos mesmos. Buscamos explorar novas alternativas dentro dele, dando relevância à contribuição educacional proporcionada por elas, como a interatividade touchscreen.','Melissa Meier','melissameier@gmail.com','','','','',17,NULL,1,18,NULL,1,2,2,2,NULL),(17,'O ESPAÇO DO LÚDICO E DO TEATRO NA ESCOLA, UMA PROPOSTA DE FORMAÇÃO CONTINUADA DE PROFESSORES.','A formação docente é debatida por vários autores ligados à educação, dentre esses, Nóvoa (1995, 1997); Gómez (1997); Pimenta (2000), Kuenzer (1998); Kullock (2000); Palma, A. (2001); entre outros. Entre esses autores existe uma consonância no que tange a necessidade de uma formação contínua entre os professores. Tendo em vista essa dinâmica, compreende-se a necessidade de uma formação docente continuada. No caso dos conhecimentos que envolvem as manifestações corporais e culturais, como teatro, jogos e brincadeiras, nem sempre os professores se sentem qualificados o suficiente, ou à vontade para trabalhar em sala em aula. Essa dificuldade tem comprometido o processo de ensino-aprendizagem nas escolas, sobre tudo as escolas que trabalham com a faixa etária do ensino fundamental, séries iniciais e educação infantil, visto que compromete também a presença do lúdico nas salas de aula. Muitos estudiosos comprovam, por meio de pesquisas e experimentos, que a criança aprende melhor e de modo mais prazeroso quando os professores utilizam atividades lúdicas no processo de ensino-aprendizagem. No intuito de contribuir com o processo de formação continuada dos professores de nossa região, propõe-se um curso de formação continuada interdisciplinar no qual professores de diferentes áreas de conhecimento contribuem com os saberes específicos de suas formações acadêmicas. Serão abordadas temáticas que possibilitarão um maior conhecimento acerca de estratégias didáticas que envolvam o jogo, o teatro e a brincadeira no processo de ensino-aprendizagem, o que poderá refletir em uma maior qualidade de ensino dos professores envolvidos na formação. \n\n\nPalavras-chave: Ensino-aprendizagem. Lúdico. Teatro.\n','Flávia Walter ','flaviabroto@ifc-camboriu.edu.br','Andréia Bazzo','andreia@ifc-camboriu.edu.br','Andréa Cristina Gomes Monteiro','andrea@ifc-camboriu.edu.br',18,NULL,1,14,NULL,1,2,2,2,NULL),(18,'APLICATIVO MOBILE PARA ENCAMINHAMENTO DO DESCARTE CORRETO DE RESÍDUOS RECICLÁVEIS EM POSTOS DESTINADOS À COLETA','Este artigo visa apresentar o projeto de desenvolvimento de um aplicativo mobile, cujo objetivo geral é trazer a atenção da comunidade para os locais de coleta de Resíduos Sólidos e a destinação de forma correta para a reciclagem. Com o aplicativo, o munícipe pode encontrar uma cooperativa próxima à sua localidade e obter informações de quais itens podem ser descartados e quais são os benefícios que os estabelecimentos ofertam nesta troca do lixo. Os gestores de centrais de coleta poderão cadastrar seu local e divulgar seu negócio.\n','ANGELO AUGUSTO FROZZA','frozza@ifc-camboriu.edu.br','','','','',12,NULL,1,10,NULL,1,2,1,2,NULL),(19,'PROPOSTA DO PORTAL DE EGRESSOS PARA O IFC-CAMBORIÚ','Armazenar informações sobre a vida profissional do egresso é importante para futuras reformas na grade curricular dos cursos, conhecer as perspectivas da região em que a instituição se encontra e comparar o compromisso de um curso com a necessidade real do mercado de trabalho. Um Sistema de Informação pode facilitar muito essa tarefa. Esse projeto tem como objetivo principal desenvolver um sistema informatizado para a coleta e armazenamento de dados sobre os egressos do IFC - Câmpus Camboriú. Tendo o projeto finalizado, espera-se obter o Portal do Egresso desenvolvido e que sua implantação resulte em informações satisfatórias para a instituição. \n','ANGELO AUGUSTO FROZZA','frozza@ifc-camboriu.edu.br','','','','',12,NULL,1,18,NULL,1,1,2,2,NULL),(20,'DIAGNÓSTICO DA CONEXÃO CICLÍSTICA ENTRE CAMBORIÚ E BALNEÁRIO CAMBORIÚ.','O uso da bicicleta vem crescendo como meio de transporte no Brasil, tanto pelos inúmeros benefícios que ela proporciona quanto pelos problemas relacionados a mobilidade urbana. Nas cidades de pequeno e médio porte seu uso é maior. Devido à conurbação entre as cidades de Balneário Camboriú e Camboriú o fluxo de bicicleta é ainda mais intenso. Entretanto, é evidente a falta de infraestrutura cicloviária entre as cidades e a ausência de pesquisas que avaliam a demanda social sobre o uso da bicicleta. Nesse sentido, o presente trabalho tem como principal objetivo realizar u um diagnóstico das condições de uso da bicicleta como meio de transporte nas principais vias de conexão entre as cidades de Camboriú e Balneário Camboriú. Dessa forma, a fim de alcançar o objetivo realizou-se uma contagem volumétrica dos meios de transporte em dois pontos de conexão entre as cidades, entrevistas com ciclistas para conhecer a opinião destes sobre as condições de uso da bicicleta e um levantamento técnico da infraestrutura viária existente. A pesquisa se mostrou de extrema importância, pois os dados e informações poderão subsidiar projetos e políticas públicas, voltadas a mobilidade, por parte dos gestores públicos das cidades envolvidas.','','','','','','',20,NULL,1,11,NULL,1,1,1,2,NULL),(21,'PRÓ CICLO – PROGRAMA DE APOIO AO DESENVOLVIMENTO CICLÍSTICO DO VALE DO RIO CAMBORIÚ','A mobilidade urbana é um importante atributo da cidade, é o resultado da relação entre o movimento das pessoas e de bens e a facilidade de acesso à cidade. E a bicicleta ocupa um papel significativo para a mobilidade, principalmente em percursos de curta e média distância. Apesar dos inúmeros benefícios do uso da bicicleta como meio transporte, tanto no âmbito coletivo quanto individual, esse veículo ainda carece de muita atenção, principalmente no que diz respeito à educação e cultura de trânsito. Nesse sentido, o projeto tem o intuito de promover o desenvolvimento de políticas públicas voltadas para a mobilidade ciclística, em parceria com a ACBC – Associação de Ciclismo de Balneário Camboriú e Camboriú, através de três ações: formação docente com os professores da Educação Básica, capacitação com a Comunidade Haitiana e a realização do Seminário de Cicloturismo. O Pró-Ciclo contribui para que o Instituto Federal Catarinense cumpra seu importante papel de promover o desenvolvimento social, econômico e ambiental através do diálogo com a sociedade.','','','','','','',20,NULL,1,14,NULL,1,2,2,2,NULL),(22,'ESTUDO DO PERFIL DOS EGRESSOS DOS CURSOS TÉCNICOS DO EIXO TECNOLÓGICO TURISMO, HOSPITALIDADE E LAZER DO IFCATARINENSE','O presente estudo tem por objetivo identificar o perfil e a atuação no mercado de trabalho dos egressos dos cursos técnicos do Eixo Tecnológico Turismo, Hospitalidade e Lazer do IFCatarinense, bem como suas opiniões sobre a qualidade do curso, de forma a subsidiar o Núcleo Docente Básico dos Cursos a manter os currículos atualizados. A abordagem do estudo foi qualitativa e seu caráter exploratório e descritivo. Foram utilizados questionários online, que atingiram apenas egressos dos cursos do Campus Camboriú, turmas 2008 a 2012. Como resultados, teve-se conhecimento da atuação profissional dos egressos, sendo que apesar de ainda não ser a maioria, cada vez mais estes estão atuando em sua área de formação técnica. Também foi possível identificar que avaliação dos egressos em relação aos cursos é positiva, o que permite refletir que há qualidade na matriz curricular e na formação proporcionada  pelos cursos em geral.','Larissa Regis Fernandes','','','','','',22,NULL,1,11,1,2,1,1,1,'2015-07-30'),(23,'Projeto de Conscientização Ambiental para alunos do Instituto Federal Catarinense- Campus Camboriú','O projeto consiste na aplicação de uma metodologia para a conscientização dos discentes do IFC – Câmpus Camboriú, em relação à problemática dos resíduos sólidos e do descarte inadequado dos mesmos. A proposta inclui inicialmente a realização de uma palestra expositiva e dialogada e em um segundo momento, uma visita ao Aterro Sanitário de Canhanduba (Itajaí-SC). Para verificar e discutir os resultados, realizaremos a qualificação dos resíduos sólidos descartados nas lixeiras de recicláveis das turmas incluídas no projeto. Através da comparação e da análise dos dados, espera-se obter um panorama geral da possível eficácia da metodologia aplicada aos discentes.\n\nPalavras-chave: Educação Ambiental; Resíduos sólidos; Segregação de resíduos. \n','Letícia Lenzi','leticialenzi@ifc-camboriu.edu.br','','','','',23,NULL,1,9,2,2,2,1,1,NULL),(24,'COMPARAÇÃO ENTRE DIFERENTES DISPOSIÇÕES DE PLANTIO DE MUDAS E DA TRANSPOSIÇÃO DE GALHARIA NA RECUPERAÇÃO AMBIENTAL DE UMA ÁREA DEGRADA NO IFC - CÂMPUS CAMBORIÚ','A Restauração Ambiental objetiva recuperar a estabilidade e a harmonia de ecossistemas degradados, levando-se em consideração os conceitos e processos da sucessão ecológica. Várias técnicas são utilizadas para restaurar ambientalmente as áreas degradadas e no presente projeto serão utilizadas o Plantio de mudas nativas, com o objetivo de comparar o desenvolvimento de mudas de espécies nativas, dispostas em duas configurações diferentes, e a Transposição de Galharias, em uma área submetida à restauração ambiental, a fim de possibilitar interações ecológicas entre a comunidade biológica do local. Serão utilizadas 40 mudas da espécie pioneira Tarumã (Vitex montevidensis), 40 mudas da espécie secundária Ipê-Amarelo (Tabebuia chrysotricha) e 10 mudas da espécie climácica Olho de Cabra (Ormosia arborea). Para a Transposição de Galharias, serão utilizados diversos galhos e gravetos coletados na área, formando aglomerados em pontos distintos, que serão comparados com pontos sem a Transposição de galharia na área a ser restaurada. Espera-se que o presente projeto possibilite observar o desenvolvimento e a sobrevivência das mudas plantadas na área degradada do IFC-Câmpus Camboriú, a comparação dos resultados da utilização da Configuração de Anderson e Configuração em Cruz e a hospedagem de animais na Técnica de Transposição de Galharias.','Cristalina Yoshie Yoshimura','cristal@ifc-camboriu.edu.br','','','','',8,NULL,1,11,2,2,2,1,1,NULL),(25,'EXPLORAÇÃO SEXUAL DE CRIANÇAS E ADOLESCENTES: Um estudo de caso nos meios de hospedagem de Balneário Camboriú/SC','A exploração sexual no turismo é uma realidade que segundo o MTUR5, até 2010, 2.960 casos foram registrados em meios de hospedagem na região sul. Este estudo apresenta grande relevância, pois, pelos seus resultados será possível saber se os hotéis de Balneário Camboriú conduzem suas gestões de acordo com as prerrogativas do Código de Conduta e a Leis6. O projeto tem como objetivo verificar se os meios de hospedagem da cidade conhecem e cumprem a Lei e orientações estabelecidas. Para o desenvolvimento da pesquisa foi realizado um estudo de caso e os resultados apresentados através da análise sistemática das informações.','Marina Tété Vieira','marina@ifc-camboriu.edu.br','','','','',24,NULL,1,11,1,2,1,1,1,NULL),(26,'PERFIL DO PROFISSIONAL DOS PARQUES ESTADUAIS DE SANTA CATARINA','Os Parques Estaduais de Santa Catarina possuem grande potencial para tornarem-se atrativos turísticos, desde que, entre outros fatores, ofereçam um atendimento de qualidade. Esta pesquisa apresenta como objetivo principal conhecer o perfil do profissional que atende aos visitantes dos Parques Estaduais de SC. Para o desenvolvimento do presente estudo foi realizada uma pesquisa exploratória, tendo como população amostra os funcionários designados pelos Parques como responsáveis pelo atendimento dos visitantes. Os instrumentos para a coleta de dados foram questionários e e-mails. Os dados coletados foram tratados por análise e percepção, e apresentados através de gráficos, tabelas e textos.\n','Marina Tété Vieira','marina@ifc-camboriu.edu.br','','','','',24,NULL,1,11,1,2,1,1,1,NULL),(27,'DESENVOLVIMENTO DE UM AQUECEDOR SOLAR PARABOLOIDE DE BAIXO CUSTO ','Por motivos de escassez de recursos naturais em nosso planeta, gradativamente mais países aderem a um comportamento voltado ao desenvolvimento sustentável. Dentro desse contexto, diversos esforços em relação aos projetos sustentáveis vêm sendo criados, principalmente relacionados à economia de energia. O trabalho apresentado descreve o desenvolvimento e a construção de um aquecedor solar paraboloide de baixo custo. Posteriormente será feita uma coleta de dados para, dessa forma, compararmos sua eficácia em relação à outros aquecedores solares que estão no mercado. Para minimizar custos materiais reaproveitados serão utilizados na construção do mesmo. ','Kleber Ersching','kleber@ifc-camboriu.edu.br','','','','',25,NULL,1,10,2,2,2,1,1,NULL),(28,'Acesso, permanência e (in) sucesso: um estudo dos estudantes dos cursos superiores do Instituto Federal de Educação Catarinense','Este texto é resultado de pesquisa do projeto “Acesso, permanência e (in) sucesso: um estudo dos estudantes dos cursos superiores do Instituto Federal de Educação Catarinense”, que visa conhecer as formas de acesso, da (não) permanência e do (não) sucesso dos estudantes do Ensino Superior do Instituto Federal Catarinense, com vista ao diagnóstico da situação, bem como propor medidas de intervenção para democratização do Ensino Superior. Este projeto encontra-se em andamento sendo neste primeiro momento, tratados os dados referentes ao campus Camboriú. Através de uma metodologia quanti-qualitativa, e os primeiros resultados da pesquisa, vimos que apesar da expansão do Ensino Superior nas últimas décadas, a democratização desta etapa está longe de ser efetivada, tornando necessário a revisão das políticas educativas, bem como das políticas de inclusão do próprio IF Catarinense. ','Sônia Regina de Souza Fernandes','sonia@ifc-camboriu.edu.br','','','','',19,NULL,1,11,NULL,1,2,1,2,NULL),(29,'TESTE TESTE TESTE TESTE TESTE TESTE TESTE','TESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTETESTE TESTE TESTE TESTE TESTE TESTE TESTE','Reginaldo Rubens da Silva','reginaldorubens@gmail.com','Angelo Augusto Frozza','frozza@ifc-camboriu.edu.br','','',1,NULL,1,10,NULL,1,2,1,2,NULL),(30,'A IMPORTÂNCIA DO MOVIMENTO CORPORAL NA EDUCAÇÃO INFANTIL: O diálogo entre uma pedagoga e autores sobre o tema','Esta pesquisa tem por objetivo destacar a importância do movimento corporal no desenvolvimento infantil e como o mesmo vem sendo trabalhado pelos professores desse nível de ensino. Acreditamos que a contribuição do movimento corporal, que pode ser vivenciado e aprendido por meio de diversas manifestações culturais. Entre esses conhecimentos e habilidades poderíamos citar: consciência corporal e das possibilidades de movimento do corpo, interação com o meio por meio do movimento e do corpo, compreensão sobre a importância das regras, respeito mútuo e tolerância, convivência, interação social, trabalho em equipe, cooperação, lidar com situações de perda e ganho, saber esperar a sua vez, ouvir os colegas e muitos outros que são necessários para o crescimento pessoal e a convivência com o outro. Para tanto, recorreremos às leituras de como isso vem sendo investigado e discutido por pesquisadores (as) interessados pela temática. Além disso, buscaremos averiguar o que as normativas e documentos legais, relacionados às políticas educacionais nos dizem a respeito da importância do movimento corporal na educação infantil, tais como: a Lei de Diretrizes e Bases da Educação Nacional, Diretrizes Nacionais da Educação Infantil, entre outros, nos dizem a respeito da importância do movimento corporal na educação infantil. Esta pesquisa, por tanto, se caracteriza como uma pesquisa bibliográfica, que se compreende como uma pesquisa que se desenvolve por meio de levantamento de dados, com leituras de livros, artigos científicos, periódicos e  documentos legais que norteiam o ensino infantil.','Leisi Fernanda Moya','lasinha2@gmail.com','Moya','','','',30,NULL,1,11,NULL,1,2,1,2,NULL),(31,'ÁREA FOLIAR E ALTURA DE PLANTAS DO TOMATEIRO (Solanum  lycopersicum var. cerasiforme) EM SISTEMA DE PLANTIO CONVENCIONAL COM E SEM UTILIZAÇÃO DE COBERTURA DO SOLO (MULCHING)','Diferentes sistemas de plantio apresentam distintas formas de manejo de sua superfície e também da manutenção de água no solo. O objetivo deste trabalho até o momento, foi comparar área foliar e altura de plantas do tomateiro tipo cereja, nos sistemas de plantio convencional com e sem utilização de cobertura do solo (mulching). O trabalho foi realizado no Setor de Olericultura do Instituto Federal Catarinense- Câmpus Camboriú, localizado na cidade de Camboriú/SC. Utilizou-se a variedade de tomate cereja Perinha de crescimento indeterminado. A área utilizada para o cultivo foi 96m², sendo constituída por 2 canteiros com sistema de plantio Convencional e 2 canteiros com sistema de plantio convencional com cobertura vegetal morta (mulching). Para a determinação da área foliar e altura de plantas foram marcadas 4 plantas por canteiro, sendo a determinação iniciada aos 38 dias após o transplante (DAT), e realizadas quinzenalmente.  A área foliar foi determinada pela razão: largura, comprimento da folha central e fator de correção 0,65 de todas as folhas da haste principal. A altura de plantas foi determinada medindo-se a distância vertical entre o primeiro e o último nó da haste principal das plantas. Em comparação aos dois sistemas, a área foliar e altura de plantas no sistema plantio convencional com mulching foi, em média, 66,20% e 78,13% (respectivamente) superior ao plantio convencional. Este trabalho está em andamento.','Giane Lavarda Melo','giane@ifc-camboriu.edu.br','Mateus de Souza','giane@ifc-camboriu.edu.br','','',32,NULL,1,7,2,2,2,1,1,NULL),(32,'GESTÃO DE RECURSOS HÍDRICOS NA BACIA HIDROGRÁFICA DO RIO CAMBORIÚ Resultados do projeto de extensão aplicado no ano de 2014. ','A gestão de recursos hídricos no Brasil foi estabelecida através da Política Nacional de Recursos Hídricos, no ano de 1997, definindo a bacia hidrográfica como unidade territorial de planejamento e gestão das águas em território brasileiro. A bacia hidrográfica é uma área da superfície terrestre que drena água, sedimentos e materiais dissolvidos para uma saída comum, compreendendo toda a área delimitada pelos divisores topográficos. A bacia hidrográfica do rio Camboriú é a principal área de drenagem e captação de água para os municípios de Balneário Camboriú e de Camboriú, apresentando uma série de conflitos em função do crescimento populacional e dos espaços urbanos, necessitando de planejamento para garantir os diversos usos da água previstos em lei. Esse planejamento deve ser feito de maneira democrática e participativa, envolvendo inúmeros agentes sociais e políticos da bacia. O Comitê Camboriú foi criado através do Decreto Estadual No 2.444/1997 e a cada ano amplia sua rede de ação, discussão e planejamento. Para que ações integradas e efetivas de conservação de água e de solo possam ocorrer dentro de uma bacia hidrográfica existe a necessidade da geração de informações específicas, que permitam o planejamento, a realização e o monitoramento das atividades relacionadas ao uso dos recursos hídricos. Desde 2008, o IFC Camboriú auxilia no desenvolvimento das ações do Comitê Camboriú, buscando maior envolvimento da comunidade interna e externa na gestão dos recursos hídricos e na resolução de conflitos ambientais, através de ações de pesquisa, ensino e extensão, atingindo uma rede de atores cada vez maior.','MARIA AMÉLIA PELLIZZETTI','map@ifc-camboriu.edu.br','','','','',34,NULL,1,16,NULL,1,1,2,2,NULL),(33,'IMPACTO SÓCIO-ECONÔMICO DO TURISMO RELIGIOSO EM NOVA TRENTO-SC','O turismo religioso se baseia em uma viagem para a vivencia de sua fé. Quando planejado, por si só, proporciona vários tipos de benefícios, tanto físico ou psicológico. Mas, para que ocorra esse tipo de segmento, o atrativo deve ter uma marca permanente na mente das pessoas. Geralmente, esses locais que recebem um grande fluxo turístico, existe o chamado “roteiro turístico” relacionado a fé. Quem peregrina, procura elevar a alma para o seu Deus, esquecendo o estresse do dia-a-dia, maus pensamentos, egoísmo, entre outras coisas. A motivação vem de ordem cultural e social, e é um grande trade turístico no mundo. O trabalho aqui apresentado busca compreender os aspectos sobre o impacto sócio-econômico pelo turismo religioso em Nova Trento, SC. Espera-se que por meio de um questionário a ser aos moradores e comerciantes da cidade, possa identificar as medidas adotadas em função da criação do santuário e o que foi benéfico e o que foi prejudicial para a cidade.','Everson Deon','everson@ifc-camboriu.edu.br','','','','',35,NULL,1,11,2,2,2,1,1,NULL),(34,'PROJETOS INOVADORES: uma análise quali-quantitativa da influência da iniciação científica sobre os projetos de pesquisa premiados do nível médio/técnico em mostra de iniciação científica','Todos os anos, discentes do ensino técnico de todo o mundo realizam e apresentam em feiras científicas seus respectivos projetos de pesquisa. O objetivo do presente trabalho é analisar como surgiram as ideias dos projetos de pesquisa do nível técnico premiados na VI e VII MICTI, enfatizando a influência da iniciação científica no ensino médio para a elaboração destes projetos. Para realização desta pesquisa foram aplicados questionários aos alunos cujos trabalhos foram premiados na VI e VII MICTI. Foram abordadas questões relacionadas aos cursos dos alunos, às disciplinas que proporcionaram auxílio ao desenvolvimento do projeto, motivações e aspectos que dizem respeito ao desenvolvimento dos projetos de pesquisa. Pode-se observar que a integração entre o ensino e a pesquisa dá-se principalmente pelo ensino da disciplina de Iniciação Científica, a qual demonstrou-se ser de suma importância para auxiliar os alunos na elaboração dos projetos e que, o que leva os alunos a desenvolverem seus projetos é o interesse pela área e problemas presentes em sua sociedade, reforçando o aprendizado do ensino técnico e a relação das instituições de ensino com seu entorno.','Isadora Balsini Lucio','isadora@ifc-camboriu.edu.br','Marcio Aparecido Lucio','marcio@ifc-camboriu.edu.br','','',5,NULL,1,11,1,2,1,1,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Reginaldo Rubens da Silva','reginaldo','f5511a9d74eccecc4264d56020f69f2a','reginaldorubens@gmail.com','2015-07-28','2015-07-30 03:00:00','A'),(2,'Isadora Balsini Lucio','isadora','a0d237bda3fb262807901d7fad8317d0','isadora@ifc-camboriu.edu.br','2015-07-29','2015-07-30 03:00:00','A'),(3,'Sirlei de Fátima Albino','sirlei','488d505c21d532783750c9e88d989091','sirleialbino@ifc-camboriu.edu.br','2015-07-29','2015-07-30 00:41:59','A');
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

-- Dump completed on 2015-07-30 16:09:51
