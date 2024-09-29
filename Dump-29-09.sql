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
-- Table structure for table `historicomovimentacoes`
--

DROP TABLE IF EXISTS `historicomovimentacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicomovimentacoes` (
  `idProduto` int unsigned NOT NULL,
  `quantidadeMovimentacoes` int NOT NULL,
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
INSERT INTO `historicomovimentacoes` VALUES (1,20,'entrada','2024-09-01 12:00:00'),(2,5,'saida','2024-09-02 13:30:00'),(3,10,'entrada','2024-09-03 14:00:00'),(4,3,'saida','2024-09-04 15:00:00'),(5,15,'entrada','2024-09-05 16:00:00'),(6,2,'saida','2024-09-06 17:30:00'),(7,25,'entrada','2024-09-07 18:00:00'),(8,1,'saida','2024-09-08 19:00:00'),(9,50,'entrada','2024-09-09 20:00:00'),(10,8,'saida','2024-09-10 21:00:00');
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
  `total` int DEFAULT NULL,
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
INSERT INTO `pagamento` VALUES (1,1,2,NULL,1),(2,2,1,NULL,2),(3,3,3,NULL,1),(4,4,2,NULL,3),(5,5,1,NULL,2),(6,6,4,NULL,1),(7,7,5,NULL,3),(8,8,1,NULL,2),(9,9,2,NULL,1),(10,10,3,NULL,2);
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
-- Table structure for table `produtospromocoes`
--

DROP TABLE IF EXISTS `produtospromocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtospromocoes` (
  `idProdutoPromocao` int NOT NULL AUTO_INCREMENT,
  `idProduto` int unsigned DEFAULT NULL,
  `idPromocao` int DEFAULT NULL,
  PRIMARY KEY (`idProdutoPromocao`),
  KEY `id_promocao` (`idPromocao`),
  KEY `fk_produtos_promocoes_produto1_idx` (`idProduto`),
  CONSTRAINT `fk_produtos_promocoes_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `produtospromocoes_ibfk_1` FOREIGN KEY (`idPromocao`) REFERENCES `promocoes` (`idPromocao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtospromocoes`
--

LOCK TABLES `produtospromocoes` WRITE;
/*!40000 ALTER TABLE `produtospromocoes` DISABLE KEYS */;
INSERT INTO `produtospromocoes` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2),(5,5,3),(6,6,3),(7,7,4),(8,8,4),(9,9,5),(10,10,5);
/*!40000 ALTER TABLE `produtospromocoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocoes`
--

DROP TABLE IF EXISTS `promocoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocoes` (
  `idPromocao` int NOT NULL AUTO_INCREMENT,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-29 10:12:39
