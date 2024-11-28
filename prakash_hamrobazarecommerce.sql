-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hamrobazarecommerce
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `managerId` int DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  KEY `fk_manager_idx` (`managerId`),
  CONSTRAINT `fk_manager` FOREIGN KEY (`managerId`) REFERENCES `admin` (`adminId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Johnny Bravo','johnny','password123',NULL),(2,'Sponge Bob','spongebob','password456',1),(3,'Ninja Hattori','ninjah','password789',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `category_revenue`
--

DROP TABLE IF EXISTS `category_revenue`;
/*!50001 DROP VIEW IF EXISTS `category_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `category_revenue` AS SELECT 
 1 AS `category`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Doe','Smith','1985-01-01','johndoe','password123'),(2,'Jane','Doe','Taylor','1990-03-15','janedoe','secret123'),(3,'Bob','Johnson','Lee','1982-06-23','boblee','mypassword'),(4,'Bruce','','Wayne','1972-09-12','batman','darknightrises');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `customerId` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `fk_customer_idx` (`customerId`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2023-04-28',219.97,'Pending'),(2,2,'2023-04-28',299.96,'Delivered'),(3,3,'2023-04-28',379.97,'Pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!50001 DROP VIEW IF EXISTS `order_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_details` AS SELECT 
 1 AS `orderId`,
 1 AS `customerId`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `productId`,
 1 AS `product_name`,
 1 AS `quantity`,
 1 AS `price`,
 1 AS `total_amount`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_itemId` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`order_itemId`),
  KEY `fk_orderid_idx` (`orderId`),
  KEY `fk_prod_id_idx` (`productId`),
  CONSTRAINT `fk_orderid` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prod_id` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (4,2,2,1,59.99),(5,2,5,2,69.99),(6,2,9,1,99.99),(7,3,3,1,129.99),(8,3,6,1,149.99),(10,3,9,1,99.99),(11,1,1,2,89.99),(12,1,7,1,39.99);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `product_categoryId` int DEFAULT NULL,
  `adminId` int DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `fk_admin_idx` (`adminId`),
  KEY `fk_prod_category_idx` (`product_categoryId`),
  CONSTRAINT `fk_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_prod_category` FOREIGN KEY (`product_categoryId`) REFERENCES `product_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Running Shoes','High-performance shoes designed for runners',89.99,1,1),(2,'Sneakers','Comfortable and stylish shoes suitable for everyday wear',59.99,1,2),(3,'Boots','Sturdy and durable boots perfect for outdoor activities',129.99,1,3),(4,'T-Shirts','Basic, comfortable t-shirts for men and women',19.99,2,1),(5,'Jeans','Classic denim jeans available in various colors and sizes',69.99,2,2),(6,'Dresses','Elegant dresses for formal occasions and parties',149.99,2,3),(7,'Belts','Stylish and functional belts made from high-quality materials',39.99,3,1),(8,'Scarves','Soft and warm scarves perfect for cold weather',29.99,3,2),(9,'Jewelry Set','Elegant and eye-catching jewelry sets for women',99.99,3,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'Shoes'),(2,'Clothing'),(3,'Accessories');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recent_customers`
--

DROP TABLE IF EXISTS `recent_customers`;
/*!50001 DROP VIEW IF EXISTS `recent_customers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recent_customers` AS SELECT 
 1 AS `customerId`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `order_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `category_revenue`
--

/*!50001 DROP VIEW IF EXISTS `category_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `category_revenue` AS select `pc`.`name` AS `category`,sum((`oi`.`price` * `oi`.`quantity`)) AS `total_revenue` from ((`order_item` `oi` join `product` `p` on((`oi`.`productId` = `p`.`productId`))) join `product_category` `pc` on((`p`.`product_categoryId` = `pc`.`id`))) group by `pc`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_details`
--

/*!50001 DROP VIEW IF EXISTS `order_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_details` AS select `o`.`orderId` AS `orderId`,`o`.`customerId` AS `customerId`,`c`.`firstname` AS `firstname`,`c`.`lastname` AS `lastname`,`oi`.`productId` AS `productId`,`p`.`product_name` AS `product_name`,`oi`.`quantity` AS `quantity`,`oi`.`price` AS `price`,`o`.`total_amount` AS `total_amount`,`o`.`status` AS `status` from (((`order` `o` join `customer` `c` on((`o`.`customerId` = `c`.`customerId`))) join `order_item` `oi` on((`o`.`orderId` = `oi`.`orderId`))) join `product` `p` on((`oi`.`productId` = `p`.`productId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recent_customers`
--

/*!50001 DROP VIEW IF EXISTS `recent_customers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recent_customers` AS select distinct `c`.`customerId` AS `customerId`,`c`.`firstname` AS `firstname`,`c`.`lastname` AS `lastname`,`o`.`order_date` AS `order_date` from (`customer` `c` join `order` `o` on((`c`.`customerId` = `o`.`customerId`))) where (`o`.`order_date` >= (now() - interval 30 day)) order by `o`.`order_date` desc */;
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

-- Dump completed on 2024-01-09 23:39:46
