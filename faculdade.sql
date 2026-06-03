-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: zephyr.proxy.rlwy.net    Database: railway
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `nome_fornecedor` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `inscricao_estadual` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'12345678000195','Distribuidora Alpha LTDA','Rua das Flores, 120','81999998888','123456789012','contato@alpha.com','Sala 01'),(2,'98765432000110','Comercial Beta ME','Av. Central, 450','81988887777','987654321098','vendas@beta.com','Bloco B'),(3,'45678912000133','Fornecedor Gama SA','Rua do Sol, 890','81977776666','456123789456','financeiro@gama.com','Galpão 3'),(4,'74185296000155','Mercantil Delta LTDA','Av. Recife, 1020','81966665555','741852963214','suporte@delta.com','Próximo ao mercado'),(5,'15935748000177','Atacadão Épsilon','Rua da Aurora, 77','81955554444','159357486321','contato@epsilon.com','2º andar');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_venda` (`id_venda`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `vendas` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` VALUES (1,1,1,2,8.90),(2,1,4,2,6.80),(3,2,7,2,4.99),(4,2,8,1,2.99),(5,3,3,3,4.25),(6,3,5,4,5.40),(7,4,6,1,14.90),(8,4,9,1,12.75),(9,5,10,6,9.50);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `codigo_de_barras` varchar(13) NOT NULL,
  `nome_do_produto` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `id_fornecedor` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'789100000001','Arroz Integral 1Kg',8.90,1,120,'Alimentos'),(2,'789100000002','Feijão Carioca 1Kg',7.50,2,90,'Alimentos'),(3,'789100000003','Macarrão Espaguete 500g',4.25,3,200,'Massas'),(4,'789100000004','Óleo de Soja 900ml',6.80,1,75,'Alimentos'),(5,'789100000005','Açúcar Refinado 1Kg',5.40,4,140,'Alimentos'),(6,'789100000006','Café Torrado 500g',14.90,5,60,'Bebidas'),(7,'789100000007','Leite Integral 1L',4.99,2,180,'Laticínios'),(8,'789100000008','Detergente Líquido 500ml',2.99,3,110,'Limpeza'),(9,'789100000009','Sabão em Pó 1Kg',12.75,4,95,'Limpeza'),(10,'789100000010','Refrigerante Cola 2L',9.50,5,130,'Bebidas');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `data_venda` datetime DEFAULT NULL,
  `forma_pagamento` varchar(25) NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,'2026-05-20 10:15:00','Dinheiro',28.90),(2,'2026-05-20 14:30:00','Cartão de Débito',15.80),(3,'2026-05-21 09:10:00','PIX',42.50),(4,'2026-05-21 16:45:00','Cartão de Crédito',19.99),(5,'2026-05-22 11:00:00','PIX',60.00);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_estoque_baixo`
--

DROP TABLE IF EXISTS `vw_estoque_baixo`;
/*!50001 DROP VIEW IF EXISTS `vw_estoque_baixo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estoque_baixo` AS SELECT 
 1 AS `id_produto`,
 1 AS `nome_do_produto`,
 1 AS `quantidade`,
 1 AS `categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_itens_venda_detalhado`
--

DROP TABLE IF EXISTS `vw_itens_venda_detalhado`;
/*!50001 DROP VIEW IF EXISTS `vw_itens_venda_detalhado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_itens_venda_detalhado` AS SELECT 
 1 AS `id_item`,
 1 AS `id_venda`,
 1 AS `data_venda`,
 1 AS `forma_pagamento`,
 1 AS `nome_do_produto`,
 1 AS `quantidade`,
 1 AS `preco_unitario`,
 1 AS `subtotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_quantidade_de_vendas`
--

DROP TABLE IF EXISTS `vw_quantidade_de_vendas`;
/*!50001 DROP VIEW IF EXISTS `vw_quantidade_de_vendas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_quantidade_de_vendas` AS SELECT 
 1 AS `id_produto`,
 1 AS `nome_do_produto`,
 1 AS `total_vendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_estoque_baixo`
--

/*!50001 DROP VIEW IF EXISTS `vw_estoque_baixo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estoque_baixo` AS select `produto`.`id_produto` AS `id_produto`,`produto`.`nome_do_produto` AS `nome_do_produto`,`produto`.`quantidade` AS `quantidade`,`produto`.`categoria` AS `categoria` from `produto` where (`produto`.`quantidade` <= 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_itens_venda_detalhado`
--

/*!50001 DROP VIEW IF EXISTS `vw_itens_venda_detalhado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_itens_venda_detalhado` AS select `iv`.`id_item` AS `id_item`,`v`.`id_venda` AS `id_venda`,`v`.`data_venda` AS `data_venda`,`v`.`forma_pagamento` AS `forma_pagamento`,`p`.`nome_do_produto` AS `nome_do_produto`,`iv`.`quantidade` AS `quantidade`,`iv`.`preco_unitario` AS `preco_unitario`,(`iv`.`quantidade` * `iv`.`preco_unitario`) AS `subtotal` from ((`item_venda` `iv` join `vendas` `v` on((`iv`.`id_venda` = `v`.`id_venda`))) join `produto` `p` on((`iv`.`id_produto` = `p`.`id_produto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_quantidade_de_vendas`
--

/*!50001 DROP VIEW IF EXISTS `vw_quantidade_de_vendas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_quantidade_de_vendas` AS select `p`.`id_produto` AS `id_produto`,`p`.`nome_do_produto` AS `nome_do_produto`,sum(`iv`.`quantidade`) AS `total_vendido` from (`item_venda` `iv` join `produto` `p` on((`iv`.`id_produto` = `p`.`id_produto`))) group by `p`.`id_produto`,`p`.`nome_do_produto` order by `total_vendido` desc */;
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

-- Dump completed on 2026-06-02 20:22:25
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: zephyr.proxy.rlwy.net    Database: mercado
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `nome_fornecedor` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) NOT NULL,
  `telefone` varchar(13) NOT NULL,
  `inscricao_estadual` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_venda`
--

DROP TABLE IF EXISTS `item_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_venda` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_venda` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_venda` (`id_venda`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `vendas` (`id_venda`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_venda_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_venda`
--

LOCK TABLES `item_venda` WRITE;
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `codigo_de_barras` int NOT NULL,
  `nome_do_produto` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `id_fornecedor` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON UPDATE CASCADE
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
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `data_venda` datetime DEFAULT NULL,
  `forma_pagamento` varchar(25) NOT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-02 20:22:35
