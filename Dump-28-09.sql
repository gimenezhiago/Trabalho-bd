-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sapatos
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
  `percentualComissao` int unsigned NOT NULL COMMENT 'ex.: 10% = 0.1',
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
-- Table structure for table `comissao`
--

DROP TABLE IF EXISTS `comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comissao` (
  `idFuncionario` int unsigned NOT NULL,
  `idVenda` int unsigned NOT NULL,
  KEY `comissao_funcionario_FK` (`idFuncionario`),
  KEY `comissao_venda_FK` (`idVenda`),
  CONSTRAINT `comissao_funcionario_FK` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comissao_venda_FK` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comissao`
--

LOCK TABLES `comissao` WRITE;
/*!40000 ALTER TABLE `comissao` DISABLE KEYS */;
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
  `ultimaAtualizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
-- Table structure for table `historicomovimentacoes`
--

DROP TABLE IF EXISTS `historicomovimentacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicomovimentacoes` (
  `idProduto` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `tipoMovimentacao` enum('entrada','saida') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dataMovimentacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProduto`),
  KEY `fk_historico_movimentacoes_produto1_idx` (`idProduto`),
  CONSTRAINT `fk_historico_movimentacoes_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicomovimentacoes`
--

LOCK TABLES `historicomovimentacoes` WRITE;
/*!40000 ALTER TABLE `historicomovimentacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `historicomovimentacoes` ENABLE KEYS */;
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
  `idVenda` int unsigned NOT NULL,
  `idProduto` int unsigned NOT NULL,
  `quantidadeProduto` int unsigned NOT NULL,
  `idFormaPagamento` int unsigned NOT NULL,
  KEY `pagamento_venda_FK` (`idVenda`),
  KEY `pagamento_produto_FK` (`idProduto`),
  KEY `pagamento_formapagamento_FK` (`idFormaPagamento`),
  CONSTRAINT `pagamento_formapagamento_FK` FOREIGN KEY (`idFormaPagamento`) REFERENCES `formapagamento` (`idFormaPagamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pagamento_produto_FK` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pagamento_venda_FK` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `produtospromocoes`
--

DROP TABLE IF EXISTS `produtospromocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtospromocoes` (
  `idProdutoPromocoes` int NOT NULL AUTO_INCREMENT,
  `idProduto` int unsigned DEFAULT NULL,
  `idPromocoes` int DEFAULT NULL,
  PRIMARY KEY (`idProdutoPromocoes`),
  KEY `id_promocao` (`idPromocoes`),
  KEY `fk_produtos_promocoes_produto1_idx` (`idProduto`),
  CONSTRAINT `fk_produtos_promocoes_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `produtospromocoes_ibfk_1` FOREIGN KEY (`idPromocoes`) REFERENCES `promocoes` (`idPromocoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtospromocoes`
--

LOCK TABLES `produtospromocoes` WRITE;
/*!40000 ALTER TABLE `produtospromocoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtospromocoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocoes`
--

DROP TABLE IF EXISTS `promocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocoes` (
  `idPromocoes` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `percentualDesconto` decimal(5,2) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  `condicoes` text,
  PRIMARY KEY (`idPromocoes`)
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

-- Dump completed on 2024-09-28 16:47:11
