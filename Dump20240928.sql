CREATE DATABASE  IF NOT EXISTS `sapatos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sapatos`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: sapatos
-- ------------------------------------------------------
-- Server version	8.4.0

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
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque_produtos`
--

DROP TABLE IF EXISTS `estoque_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque_produtos` (
  `produto_idProduto` int unsigned NOT NULL,
  `quantidade_em_estoque` int NOT NULL,
  `nivel_minimo` int NOT NULL,
  `ultima_atualizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produto_idProduto`),
  KEY `fk_estoque_produtos_produto1_idx` (`produto_idProduto`),
  CONSTRAINT `fk_estoque_produtos_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque_produtos`
--

LOCK TABLES `estoque_produtos` WRITE;
/*!40000 ALTER TABLE `estoque_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque_produtos` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_movimentacoes`
--

DROP TABLE IF EXISTS `historico_movimentacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_movimentacoes` (
  `produto_idProduto` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `tipo_movimentacao` enum('entrada','saida') NOT NULL,
  `data_movimentacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`produto_idProduto`),
  KEY `fk_historico_movimentacoes_produto1_idx` (`produto_idProduto`),
  CONSTRAINT `fk_historico_movimentacoes_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_movimentacoes`
--

LOCK TABLES `historico_movimentacoes` WRITE;
/*!40000 ALTER TABLE `historico_movimentacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_movimentacoes` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `metodoentrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `venda_idVenda` int unsigned NOT NULL,
  `produto_idProduto` int unsigned NOT NULL,
  `quantidade produto` int NOT NULL,
  `total` int NOT NULL,
  `formapagamento_idFormaPagamento` int unsigned NOT NULL,
  PRIMARY KEY (`venda_idVenda`,`produto_idProduto`),
  KEY `fk_venda_has_produto1_produto1_idx` (`produto_idProduto`),
  KEY `fk_venda_has_produto1_venda1_idx` (`venda_idVenda`),
  KEY `fk_pagamento_formapagamento1_idx` (`formapagamento_idFormaPagamento`),
  CONSTRAINT `fk_pagamento_formapagamento1` FOREIGN KEY (`formapagamento_idFormaPagamento`) REFERENCES `formapagamento` (`idFormaPagamento`),
  CONSTRAINT `fk_venda_has_produto1_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_venda_has_produto1_venda1` FOREIGN KEY (`venda_idVenda`) REFERENCES `venda` (`idVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `usuario` varchar(100) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `idCliente` int unsigned NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `perfil_cliente_FK` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpfPessoa` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_promocoes`
--

DROP TABLE IF EXISTS `produtos_promocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_promocoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produto_idProduto` int unsigned DEFAULT NULL,
  `id_promocao` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_promocao` (`id_promocao`),
  KEY `fk_produtos_promocoes_produto1_idx` (`produto_idProduto`),
  CONSTRAINT `fk_produtos_promocoes_produto1` FOREIGN KEY (`produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `produtos_promocoes_ibfk_1` FOREIGN KEY (`id_promocao`) REFERENCES `promocoes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_promocoes`
--

LOCK TABLES `produtos_promocoes` WRITE;
/*!40000 ALTER TABLE `produtos_promocoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_promocoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocoes`
--

DROP TABLE IF EXISTS `promocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `percentual_desconto` decimal(5,2) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `condicoes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocoes`
--

LOCK TABLES `promocoes` WRITE;
/*!40000 ALTER TABLE `promocoes` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 18:52:13
