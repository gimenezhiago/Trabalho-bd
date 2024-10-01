CREATE DATABASE  IF NOT EXISTS `sapatariaFangs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sapatariaFangs`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sapatos2
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idCargo` int unsigned NOT NULL,
  `nomeCargo` varchar(100) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Vendedor'),(2,'Caixa'),(3,'Gerente de Loja'),(4,'Estoquista'),(5,'Atendente'),(6,'Auxiliar de Limpeza'),(7,'Supervisor de Vendas');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int unsigned NOT NULL,
  `nomeCategoria` varchar(100) NOT NULL,
  `descricaoCategoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Tênis','Calçado esportivo e casual'),(2,'Sapato Social','Sapato formal para ocasiões especiais ou trabalho'),(3,'Sandália','Calçado aberto, ideal para o verão'),(4,'Bota','Calçado resistente, ideal para frio ou terrenos difíceis'),(5,'Chinelo','Calçado confortável e aberto para o dia a dia'),(6,'Mocassim','Sapato leve e flexível, geralmente sem cadarço'),(7,'Sapatilha','Calçado feminino, leve e confortável'),(8,'Oxford','Sapato fechado com cadarço, tradicional e formal'),(9,'Camisa de time',NULL),(10,'Coturno','Bota robusta, geralmente de cano alto e resistente');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cpfPessoa` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `idStatusCliente` int unsigned NOT NULL,
  `idCliente` int unsigned NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `cliente_unique` (`cpfPessoa`),
  KEY `cliente_statuscliente_FK` (`idStatusCliente`),
  CONSTRAINT `cliente_pessoa_FK` FOREIGN KEY (`cpfPessoa`) REFERENCES `pessoa` (`cpfPessoa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cliente_statuscliente_FK` FOREIGN KEY (`idStatusCliente`) REFERENCES `statuscliente` (`idStatusCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('98765432109',1,1),('88899900011',2,2),('66677788899',1,3),('44455566677',2,4),('99900011122',1,5);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comissao`
--

DROP TABLE IF EXISTS `comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comissao` (
  `idComissao` int unsigned NOT NULL AUTO_INCREMENT,
  `taxaComissao` decimal(5,2) NOT NULL,
  `idFuncionario` int unsigned NOT NULL,
  PRIMARY KEY (`idComissao`),
  KEY `comissao_funcionario_FK` (`idFuncionario`),
  CONSTRAINT `comissao_funcionario_FK` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao`
--

LOCK TABLES `comissao` WRITE;
/*!40000 ALTER TABLE `comissao` DISABLE KEYS */;
INSERT INTO `comissao` VALUES (1,0.10,1),(2,0.02,2),(3,0.50,3),(4,0.07,4),(5,0.50,5);
/*!40000 ALTER TABLE `comissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoqueprodutos`
--

DROP TABLE IF EXISTS `estoqueprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoqueprodutos` (
  `idProduto` int unsigned NOT NULL,
  `quantidadeEstoque` int NOT NULL,
  `nivelMinimo` int NOT NULL,
  `ultimaAtualizacao` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProduto`),
  KEY `fk_estoque_produtos_produto1_idx` (`idProduto`),
  CONSTRAINT `fk_estoque_produtos_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoqueprodutos`
--

LOCK TABLES `estoqueprodutos` WRITE;
/*!40000 ALTER TABLE `estoqueprodutos` DISABLE KEYS */;
INSERT INTO `estoqueprodutos` VALUES (1,50,10,'2024-09-01 09:00:00'),(2,30,5,'2024-09-02 09:30:00'),(3,20,5,'2024-09-03 10:00:00'),(4,15,2,'2024-09-04 10:30:00'),(5,40,10,'2024-09-05 11:00:00'),(6,25,5,'2024-09-06 11:30:00'),(7,60,10,'2024-09-07 12:00:00'),(8,5,2,'2024-09-08 12:30:00'),(9,100,20,'2024-09-09 13:00:00'),(10,10,5,'2024-09-10 14:00:00');
/*!40000 ALTER TABLE `estoqueprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagamento`
--

DROP TABLE IF EXISTS `formapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamento` (
  `idFormaPagamento` int unsigned NOT NULL,
  `nomeFormaPagamento` varchar(100) NOT NULL,
  PRIMARY KEY (`idFormaPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (1,'Dinheiro'),(2,'Cartão de Crédito'),(3,'Cartão de Débito'),(4,'Transferência Bancária'),(5,'Boleto Bancário'),(6,'PayPal'),(7,'PIX'),(8,'Vale Presente');
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `formapagamentoprocura`
--

DROP TABLE IF EXISTS `formapagamentoprocura`;
/*!50001 DROP VIEW IF EXISTS `formapagamentoprocura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `formapagamentoprocura` AS SELECT 
 1 AS `idVenda`,
 1 AS `nomeProduto`,
 1 AS `quantidadeProduto`,
 1 AS `idFormaPagamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `idFornecedores` varchar(100) NOT NULL,
  `nomeFornecedor` varchar(100) NOT NULL,
  `produtoFornecidos` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`idFornecedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES ('1','Fornecedora A','Couro, Solados, Têxtil','(41) 99999-0001'),('2','Fornecedora B','Ferramentas, Acessórios','(41) 98888-0002'),('3','Fornecedora C','Materiais de Embalagem','(41) 97777-0003'),('4','Fornecedora D','Componentes Eletrônicos','(41) 96666-0004'),('5','Fornecedora E','Produtos Químicos, Adesivos','(41) 95555-0005');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `cpfPessoa` varchar(11) NOT NULL,
  `idCargo` int unsigned NOT NULL,
  `dataContratacao` date NOT NULL,
  `salario` int unsigned NOT NULL,
  `idStatusFuncionario` int unsigned NOT NULL,
  `idFuncionario` int unsigned NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `funcionario_unique` (`cpfPessoa`),
  KEY `funcionario_cargo_FK` (`idCargo`),
  KEY `funcionario_statusfuncionario_FK` (`idStatusFuncionario`),
  CONSTRAINT `funcionario_cargo_FK` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funcionario_pessoa_FK` FOREIGN KEY (`cpfPessoa`) REFERENCES `pessoa` (`cpfPessoa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `funcionario_statusfuncionario_FK` FOREIGN KEY (`idStatusFuncionario`) REFERENCES `statusfuncionario` (`idStatusFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('00011122233',1,'2022-01-10',2500,1,1),('11122233344',2,'2022-02-15',3000,1,2),('12345678901',1,'2022-03-20',2200,2,3),('44455566677',3,'2022-04-05',2800,1,4),('88899900011',2,'2022-05-30',3500,3,5);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `historicovenda`
--

DROP TABLE IF EXISTS `historicovenda`;
/*!50001 DROP VIEW IF EXISTS `historicovenda`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `historicovenda` AS SELECT 
 1 AS `idVenda`,
 1 AS `idFuncionario`,
 1 AS `idCliente`,
 1 AS `nomeProduto`,
 1 AS `quantidadeProduto`,
 1 AS `dataVenda`,
 1 AS `nomeMetodoEntrega`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maiordesconto`
--

DROP TABLE IF EXISTS `maiordesconto`;
/*!50001 DROP VIEW IF EXISTS `maiordesconto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maiordesconto` AS SELECT 
 1 AS `idPromocao`,
 1 AS `nomePromocao`,
 1 AS `percentualDesconto`,
 1 AS `dataInicio`,
 1 AS `dataFim`,
 1 AS `condicoes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `metodoentrega`
--

DROP TABLE IF EXISTS `metodoentrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodoentrega` (
  `idMetodoEntrega` int unsigned NOT NULL,
  `nomeMetodoEntrega` varchar(100) NOT NULL,
  PRIMARY KEY (`idMetodoEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodoentrega`
--

LOCK TABLES `metodoentrega` WRITE;
/*!40000 ALTER TABLE `metodoentrega` DISABLE KEYS */;
INSERT INTO `metodoentrega` VALUES (1,'Entrega Padrão'),(2,'Retirada na Loja'),(3,'Entrega Programada');
/*!40000 ALTER TABLE `metodoentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idVenda` int unsigned NOT NULL,
  `idProduto` int unsigned NOT NULL,
  `quantidadeProduto` int NOT NULL,
  `idFormaPagamento` int unsigned NOT NULL,
  PRIMARY KEY (`idVenda`,`idProduto`),
  KEY `fk_venda_has_produto1_produto1_idx` (`idProduto`),
  KEY `fk_venda_has_produto1_venda1_idx` (`idVenda`),
  KEY `fk_pagamento_formapagamento1_idx` (`idFormaPagamento`),
  CONSTRAINT `fk_pagamento_formapagamento1` FOREIGN KEY (`idFormaPagamento`) REFERENCES `formapagamento` (`idFormaPagamento`),
  CONSTRAINT `fk_venda_has_produto1_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_venda_has_produto1_venda1` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,2,1),(2,2,1,2),(3,3,3,1),(4,4,2,3),(5,5,1,2),(6,6,4,1),(7,7,5,3),(8,8,1,2),(9,9,2,1),(10,10,3,2);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpfPessoa` varchar(11) NOT NULL,
  `nomePessoa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `logradouro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `numerologradouro` varchar(100) NOT NULL,
  PRIMARY KEY (`cpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('00011122233','Juliana Ramos','juliana.ramos@email.com','(85) 98877-6655','Av. das Nações','777'),('11122233344','Carlos Souza','carlos.souza@email.com','(31) 91234-5678','Rua da Liberdade','789'),('12345678901','João Silva','joao.silva@email.com','(11) 98765-4321','Rua das Flores','123'),('44455566677','Ana Costa','ana.costa@email.com','(41) 99999-8888','Rua XV de Novembro','101'),('55566677788','Pedro Almeida','pedro.almeida@email.com','(51) 91111-2222','Rua dos Andradas','202'),('66677788899','Beatriz Mendes','beatriz.mendes@email.com','(61) 91234-5566','Rua das Palmeiras','333'),('77788899900','Rafael Lima','rafael.lima@email.com','(71) 99876-5432','Rua das Orquídeas','444'),('88899900011','Fernanda Santos','fernanda.santos@email.com','(81) 98765-4321','Av. Brasil','555'),('98765432109','Maria Oliveira','maria.oliveira@email.com','(21) 99988-7766','Av. Paulista','456'),('99900011122','Lucas Pereira','lucas.pereira@email.com','(91) 99999-0000','Rua das Acácias','666');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `precototal`
--

DROP TABLE IF EXISTS `precototal`;
/*!50001 DROP VIEW IF EXISTS `precototal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `precototal` AS SELECT 
 1 AS `idVenda`,
 1 AS `nomeProduto`,
 1 AS `quantidadeProduto`,
 1 AS `idFormaPagamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int unsigned NOT NULL,
  `nomeProduto` varchar(100) NOT NULL,
  `precoUnitario` int unsigned NOT NULL,
  `idFornecedores` varchar(100) NOT NULL,
  `idCategoria` int unsigned NOT NULL,
  `idStatusProduto` int unsigned NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `produto_fornecedores_FK` (`idFornecedores`),
  KEY `produto_categoria_FK` (`idCategoria`),
  KEY `produto_statusproduto_FK` (`idStatusProduto`),
  CONSTRAINT `produto_categoria_FK` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produto_fornecedores_FK` FOREIGN KEY (`idFornecedores`) REFERENCES `fornecedores` (`idFornecedores`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produto_statusproduto_FK` FOREIGN KEY (`idStatusProduto`) REFERENCES `statusproduto` (`idStatusProduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Sapato Casual',150,'1',1,1),(2,'Tênis Esportivo',200,'2',1,1),(3,'Sandália de Couro',130,'1',2,1),(4,'Botas de Inverno',300,'3',1,1),(5,'Chinelo',40,'2',2,1),(6,'Sapato Social',200,'1',1,1),(7,'Tênis Casual',160,'2',1,1),(8,'Sapatilha',90,'1',2,1),(9,'Bota de Montanha',350,'3',1,1),(10,'Sandália de Plástico',50,'2',2,1),(11,'Tênis Infantil',130,'1',1,1),(12,'Sapato de Festa',250,'1',1,1),(13,'Chinelo de Dedo',30,'2',2,1),(14,'Bota de Couro',300,'3',1,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `produtocompromocao`
--

DROP TABLE IF EXISTS `produtocompromocao`;
/*!50001 DROP VIEW IF EXISTS `produtocompromocao`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `produtocompromocao` AS SELECT 
 1 AS `idProduto`,
 1 AS `idPromocao`,
 1 AS `nomeProduto`,
 1 AS `nomePromocao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produtopromocoes`
--

DROP TABLE IF EXISTS `produtopromocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtopromocoes` (
  `idProduto` int unsigned NOT NULL,
  `idPromocao` int unsigned NOT NULL,
  KEY `produtopormocoes_produto_fk` (`idProduto`),
  KEY `produtopormocoes_promocoes_fk` (`idPromocao`),
  CONSTRAINT `produtopormocoes_produto_fk` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produtopormocoes_promocoes_fk` FOREIGN KEY (`idPromocao`) REFERENCES `promocoes` (`idPromocao`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtopromocoes`
--

LOCK TABLES `produtopromocoes` WRITE;
/*!40000 ALTER TABLE `produtopromocoes` DISABLE KEYS */;
INSERT INTO `produtopromocoes` VALUES (1,4),(3,3),(2,3),(10,2),(6,1),(7,6);
/*!40000 ALTER TABLE `produtopromocoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `promocaointervalo`
--

DROP TABLE IF EXISTS `promocaointervalo`;
/*!50001 DROP VIEW IF EXISTS `promocaointervalo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `promocaointervalo` AS SELECT 
 1 AS `nomePromocao`,
 1 AS `percentualDesconto`,
 1 AS `dataInicio`,
 1 AS `dataFim`,
 1 AS `idProduto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `promocoes`
--

DROP TABLE IF EXISTS `promocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocoes` (
  `idPromocao` int unsigned NOT NULL AUTO_INCREMENT,
  `nomePromocao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `percentualDesconto` decimal(5,2) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  `condicoes` text,
  PRIMARY KEY (`idPromocao`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocoes`
--

LOCK TABLES `promocoes` WRITE;
/*!40000 ALTER TABLE `promocoes` DISABLE KEYS */;
INSERT INTO `promocoes` VALUES (1,'Promoção de Verão',0.20,'2024-12-01','2025-02-28','Desconto válido para produtos selecionados.'),(2,'Black Friday',0.30,'2024-11-01','2024-11-30','Válido apenas para compras online.'),(3,'Promoção de Natal',0.25,'2024-12-15','2024-12-25','Aplicável em todas as categorias.'),(4,'Liquidação de Inverno',0.15,'2024-06-01','2024-08-31','Desconto em produtos de inverno.'),(5,'Promoção de Aniversário',0.10,'2024-03-01','2024-03-31','Válido para clientes cadastrados.'),(6,'Desconto na Primeira Compra',0.20,'2024-01-01','2024-12-31','Para novos clientes apenas.'),(7,'Promoção de Feriado',0.15,'2024-04-01','2024-04-30','Desconto em toda a loja.'),(8,'Queima de Estoque',0.40,'2024-05-01','2024-05-31','Válido para produtos de estoque antigo.'),(9,'Promoção de Dia dos Pais',0.20,'2024-08-01','2024-08-15','Desconto em produtos selecionados.'),(10,'Semana do Consumidor',0.15,'2024-03-10','2024-03-17','Desconto em toda a loja.'),(11,'Promoção de Dia das Mães',0.20,'2024-05-01','2024-05-15','Apenas para produtos selecionados.'),(12,'Super Desconto de Outono',0.25,'2024-09-01','2024-11-30','Desconto em produtos de outono.'),(13,'Promoção de Saldão',0.35,'2024-10-01','2024-10-31','Apenas para produtos da linha anterior.'),(14,'Promoção de Volta às Aulas',0.15,'2024-01-10','2024-02-10','Aplicável em produtos infantis.');
/*!40000 ALTER TABLE `promocoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuscliente`
--

DROP TABLE IF EXISTS `statuscliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuscliente` (
  `idStatusCliente` int unsigned NOT NULL,
  `nomeStatusCliente` varchar(100) NOT NULL,
  PRIMARY KEY (`idStatusCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuscliente`
--

LOCK TABLES `statuscliente` WRITE;
/*!40000 ALTER TABLE `statuscliente` DISABLE KEYS */;
INSERT INTO `statuscliente` VALUES (1,'Ativo'),(2,'Inativo'),(3,'Bloqueado'),(4,'Preferencial');
/*!40000 ALTER TABLE `statuscliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusfuncionario`
--

DROP TABLE IF EXISTS `statusfuncionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusfuncionario` (
  `idStatusFuncionario` int unsigned NOT NULL,
  `nomeStatusFuncionario` varchar(100) NOT NULL,
  PRIMARY KEY (`idStatusFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusfuncionario`
--

LOCK TABLES `statusfuncionario` WRITE;
/*!40000 ALTER TABLE `statusfuncionario` DISABLE KEYS */;
INSERT INTO `statusfuncionario` VALUES (1,'Ativo'),(2,'Em treinamento'),(3,'De férias'),(4,'Afastado por doença'),(5,'Demitido'),(6,'Licença maternidade/paternidade'),(7,'Suspenso');
/*!40000 ALTER TABLE `statusfuncionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusproduto`
--

DROP TABLE IF EXISTS `statusproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusproduto` (
  `idStatusProduto` int unsigned NOT NULL,
  `nomeStatusProduto` varchar(100) NOT NULL,
  PRIMARY KEY (`idStatusProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusproduto`
--

LOCK TABLES `statusproduto` WRITE;
/*!40000 ALTER TABLE `statusproduto` DISABLE KEYS */;
INSERT INTO `statusproduto` VALUES (1,'Disponível'),(2,'Indisponível'),(3,'Em Pedido');
/*!40000 ALTER TABLE `statusproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `idVenda` int unsigned NOT NULL,
  `idProduto` int unsigned NOT NULL,
  `idFuncionario` int unsigned NOT NULL,
  `idCliente` int unsigned NOT NULL,
  `dataVenda` datetime NOT NULL,
  `idMetodoEntrega` int unsigned NOT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `venda_produto_FK` (`idProduto`),
  KEY `venda_cliente_FK` (`idCliente`),
  KEY `venda_funcionario_FK` (`idFuncionario`),
  KEY `venda_metodoentrega_FK` (`idMetodoEntrega`),
  CONSTRAINT `venda_cliente_FK` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venda_funcionario_FK` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venda_metodoentrega_FK` FOREIGN KEY (`idMetodoEntrega`) REFERENCES `metodoentrega` (`idMetodoEntrega`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venda_produto_FK` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,1,1,1,'2024-09-01 10:00:00',1),(2,2,2,2,'2024-09-02 14:30:00',2),(3,3,3,3,'2024-09-03 09:15:00',3),(4,4,1,4,'2024-09-04 11:45:00',1),(5,5,2,5,'2024-09-05 13:20:00',1),(6,6,3,2,'2024-09-06 15:10:00',2),(7,7,1,4,'2024-09-07 16:50:00',3),(8,8,2,5,'2024-09-08 12:30:00',2),(9,9,3,1,'2024-09-09 10:05:00',1),(10,10,1,1,'2024-09-10 18:00:00',2);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vendaentrega`
--

DROP TABLE IF EXISTS `vendaentrega`;
/*!50001 DROP VIEW IF EXISTS `vendaentrega`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vendaentrega` AS SELECT 
 1 AS `idVenda`,
 1 AS `nomeProduto`,
 1 AS `idFuncionario`,
 1 AS `idCliente`,
 1 AS `dataVenda`,
 1 AS `nomeMetodoEntrega`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vendafuncionario`
--

DROP TABLE IF EXISTS `vendafuncionario`;
/*!50001 DROP VIEW IF EXISTS `vendafuncionario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vendafuncionario` AS SELECT 
 1 AS `cpfPessoa`,
 1 AS `nomePessoa`,
 1 AS `nomeCargo`,
 1 AS `idVenda`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `formapagamentoprocura`
--

/*!50001 DROP VIEW IF EXISTS `formapagamentoprocura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `formapagamentoprocura` AS select `p`.`idVenda` AS `idVenda`,`p2`.`nomeProduto` AS `nomeProduto`,`p`.`quantidadeProduto` AS `quantidadeProduto`,`f`.`idFormaPagamento` AS `idFormaPagamento` from ((`pagamento` `p` join `formapagamento` `f`) join `produto` `p2`) where ((`p`.`idProduto` = `p2`.`idProduto`) and (`p`.`idFormaPagamento` = `f`.`idFormaPagamento`) and (`f`.`nomeFormaPagamento` like '%Crédito')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `historicovenda`
--

/*!50001 DROP VIEW IF EXISTS `historicovenda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `historicovenda` AS select `v`.`idVenda` AS `idVenda`,`v`.`idFuncionario` AS `idFuncionario`,`c`.`idCliente` AS `idCliente`,`p`.`nomeProduto` AS `nomeProduto`,`p3`.`quantidadeProduto` AS `quantidadeProduto`,`v`.`dataVenda` AS `dataVenda`,`m`.`nomeMetodoEntrega` AS `nomeMetodoEntrega` from (((((`funcionario` `f` join `cliente` `c`) join `produto` `p`) join `venda` `v`) join `metodoentrega` `m`) join `pagamento` `p3`) where ((`v`.`idProduto` = `p3`.`idProduto`) and (`v`.`idVenda` = `p3`.`idVenda`) and (`v`.`idMetodoEntrega` = `m`.`idMetodoEntrega`) and (`v`.`idProduto` = `p`.`idProduto`) and (`v`.`idFuncionario` = `f`.`idFuncionario`) and (`v`.`idCliente` = `c`.`idCliente`)) order by `v`.`idVenda` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maiordesconto`
--

/*!50001 DROP VIEW IF EXISTS `maiordesconto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maiordesconto` AS select `p`.`idPromocao` AS `idPromocao`,`p`.`nomePromocao` AS `nomePromocao`,`p`.`percentualDesconto` AS `percentualDesconto`,`p`.`dataInicio` AS `dataInicio`,`p`.`dataFim` AS `dataFim`,`p`.`condicoes` AS `condicoes` from `promocoes` `p` where (`p`.`percentualDesconto` = (select max(`p`.`percentualDesconto`) from `promocoes` `p`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `precototal`
--

/*!50001 DROP VIEW IF EXISTS `precototal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `precototal` AS select `p`.`idVenda` AS `idVenda`,`p2`.`nomeProduto` AS `nomeProduto`,`p`.`quantidadeProduto` AS `quantidadeProduto`,`f`.`idFormaPagamento` AS `idFormaPagamento` from ((`pagamento` `p` join `formapagamento` `f`) join `produto` `p2`) where ((`p`.`idProduto` = `p2`.`idProduto`) and (`p`.`idFormaPagamento` = `f`.`idFormaPagamento`) and (`f`.`nomeFormaPagamento` like '%Crédito')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `produtocompromocao`
--

/*!50001 DROP VIEW IF EXISTS `produtocompromocao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `produtocompromocao` AS select `pp`.`idProduto` AS `idProduto`,`pp`.`idPromocao` AS `idPromocao`,`p2`.`nomeProduto` AS `nomeProduto`,`p`.`nomePromocao` AS `nomePromocao` from ((`produtopromocoes` `pp` join `promocoes` `p`) join `produto` `p2`) where ((`pp`.`idProduto` = `p2`.`idProduto`) and (`pp`.`idPromocao` = `p`.`idPromocao`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `promocaointervalo`
--

/*!50001 DROP VIEW IF EXISTS `promocaointervalo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `promocaointervalo` AS select `p`.`nomePromocao` AS `nomePromocao`,`p`.`percentualDesconto` AS `percentualDesconto`,`p`.`dataInicio` AS `dataInicio`,`p`.`dataFim` AS `dataFim`,`p2`.`idProduto` AS `idProduto` from ((`promocoes` `p` join `produtopromocoes` `p2`) join `produto` `p3`) where ((`p`.`idPromocao` = `p2`.`idPromocao`) and (`p2`.`idProduto` = `p3`.`idProduto`) and (`p`.`idPromocao` = `p2`.`idPromocao`) and (`p`.`dataInicio` = '2024-01-01')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendaentrega`
--

/*!50001 DROP VIEW IF EXISTS `vendaentrega`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendaentrega` AS select `v`.`idVenda` AS `idVenda`,`p`.`nomeProduto` AS `nomeProduto`,`v`.`idFuncionario` AS `idFuncionario`,`v`.`idCliente` AS `idCliente`,`v`.`dataVenda` AS `dataVenda`,`m`.`nomeMetodoEntrega` AS `nomeMetodoEntrega` from ((`venda` `v` join `produto` `p`) join `metodoentrega` `m`) where ((`v`.`idProduto` = `p`.`idProduto`) and (`m`.`idMetodoEntrega` = `v`.`idMetodoEntrega`) and (`v`.`idMetodoEntrega` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vendafuncionario`
--

/*!50001 DROP VIEW IF EXISTS `vendafuncionario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vendafuncionario` AS select `f`.`cpfPessoa` AS `cpfPessoa`,`p`.`nomePessoa` AS `nomePessoa`,`c`.`nomeCargo` AS `nomeCargo`,`v`.`idVenda` AS `idVenda` from (((`funcionario` `f` join `venda` `v`) join `pessoa` `p`) join `cargo` `c`) where ((`p`.`cpfPessoa` = `f`.`cpfPessoa`) and (`f`.`idCargo` = `c`.`idCargo`) and (`v`.`idFuncionario` = `f`.`idFuncionario`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-30 21:27:37
