-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
-- 
-- Host: localhost    Database: myDb
-- ------------------------------------------------------
-- Server version8.0.33

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
-- Table structure for table `JOIN_category_product`
-- 

DROP TABLE IF EXISTS `JOIN_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOIN_category_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_JOIN_category_product_1_idx` (`product_id`),
  KEY `fk_JOIN_category_product_2_idx` (`category_id`),
  CONSTRAINT `fk_JOIN_category_product_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_JOIN_category_product_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `JOIN_category_product`
-- 

LOCK TABLES `JOIN_category_product` WRITE;
/*!40000 ALTER TABLE `JOIN_category_product` DISABLE KEYS */;
INSERT INTO `JOIN_category_product` VALUES (1,1,3),(10,3,5),(11,2,5),(12,1,5),(13,4,5);
/*!40000 ALTER TABLE `JOIN_category_product` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `JOIN_orders_products`
-- 

DROP TABLE IF EXISTS `JOIN_orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOIN_orders_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_JOIN_orders_products_1_idx` (`customer_order_id`),
  KEY `fk_JOIN_orders_products_2_idx` (`product_id`),
  CONSTRAINT `fk_JOIN_orders_products_1` FOREIGN KEY (`customer_order_id`) REFERENCES `cusromer_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_JOIN_orders_products_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `JOIN_orders_products`
-- 

LOCK TABLES `JOIN_orders_products` WRITE;
/*!40000 ALTER TABLE `JOIN_orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `JOIN_orders_products` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `branch`
-- 

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `company_id` int NOT NULL,
  `credit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_branch_1_idx` (`company_id`),
  CONSTRAINT `fk_branch_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `branch`
-- 

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Yucaipa',1,NULL),(2,'Arlington',1,NULL),(3,'Kilgore',1,10000.00),(4,'New York',2,NULL),(5,'No Branch Selected',3,NULL),(6,'Bobs house',4,NULL),(7,'marks house',4,1500.50);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `category`
-- 

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `category`
-- 

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'displays'),(2,'not stocked'),(1,'stocked Items'),(4,'wireless');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `company`
-- 

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dealer_pricing_level_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_1_idx` (`dealer_pricing_level_id`),
  CONSTRAINT `fk_company_1` FOREIGN KEY (`dealer_pricing_level_id`) REFERENCES `dealer_pricing_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `company`
-- 

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'System Scale',1),(2,'Kanawah Scale',2),(3,'No Company Selected',1),(4,'Scales north west',1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `cusromer_order`
-- 

DROP TABLE IF EXISTS `cusromer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cusromer_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shipping_address` varchar(255) DEFAULT NULL,
  `ship_date` date DEFAULT NULL,
  `po_number` varchar(45) DEFAULT NULL,
  `branch_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `billing_address` int NOT NULL,
  `company_id` int NOT NULL DEFAULT '3',
  `time_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `order_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_1_idx` (`user_id`),
  KEY `fk_order_2_idx` (`branch_id`),
  KEY `fk_cusromer_order_1_idx` (`company_id`),
  KEY `fk_cusromer_order_1_idx1` (`payment_type_id`),
  KEY `fk_cusromer_order_2_idx` (`order_status_id`),
  CONSTRAINT `fk_cusromer_order_1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`),
  CONSTRAINT `fk_cusromer_order_2` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `fk_order_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_order_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `cusromer_order`
-- 

LOCK TABLES `cusromer_order` WRITE;
/*!40000 ALTER TABLE `cusromer_order` DISABLE KEYS */;
INSERT INTO `cusromer_order` VALUES (1,'this is an address','2023-07-20','12345',1,1,7,1234556,0,'2023-07-20 00:00:00',1),(2,'test','2023-07-18','test',3,1,7,123,0,'2023-07-20 00:00:00',1),(3,'test','2023-07-19','test',6,1,7,123,0,'2023-07-20 00:00:00',1),(4,'the is a test address','2023-07-19','12345',6,1,12,123,3,'2023-07-20 00:00:00',1),(5,'I am cool','2023-07-18','12',4,1,12,12345,3,'2023-07-20 00:00:00',1),(6,'1','2023-07-20','1',7,1,7,1,3,'2023-07-20 00:00:00',1);
/*!40000 ALTER TABLE `cusromer_order` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `dealer_pricing_level`
-- 

DROP TABLE IF EXISTS `dealer_pricing_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealer_pricing_level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `discount_rate` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `dealer_pricing_level`
-- 

LOCK TABLES `dealer_pricing_level` WRITE;
/*!40000 ALTER TABLE `dealer_pricing_level` DISABLE KEYS */;
INSERT INTO `dealer_pricing_level` VALUES (1,'base',0.00),(2,'gold',0.10),(3,'gold plus',0.15),(4,'platinum',0.20);
/*!40000 ALTER TABLE `dealer_pricing_level` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `image`
-- 

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `small` varchar(255) NOT NULL,
  `medium` varchar(255) NOT NULL,
  `large` varchar(255) NOT NULL,
  `full` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_url_UNIQUE` (`small`),
  UNIQUE KEY `medium_UNIQUE` (`medium`),
  UNIQUE KEY `large_UNIQUE` (`large`),
  UNIQUE KEY `full_UNIQUE` (`full`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `image`
-- 

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `order_status`
-- 

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `order_status`
-- 

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (2,'invoiced'),(1,'on order');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `payment_type`
-- 

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `payment_type`
-- 

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'credit card');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `product`
-- 

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `part_number` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `weight` int NOT NULL,
  `length` int NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `part_number_UNIQUE` (`part_number`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `product`
-- 

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'sbl-4',100.00,5,5,5,5),(2,'sbl-2',200.00,5,5,5,5),(3,'SBL-6',300.00,5,5,5,5),(5,'sbl-9',400.00,5,5,5,5),(6,'data converter',100.00,5,5,5,5),(7,'thingamagig',100.00,5,5,5,5),(8,'sbl-2-DC',100.00,5,5,5,5),(9,'sbl-4SG',100.00,5,5,5,5),(10,'sbl-4A',100.00,5,5,5,5),(11,'sbl-4SGA',594.00,5,5,5,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `products_in_cart`
-- 

DROP TABLE IF EXISTS `products_in_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_in_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_1_idx` (`user_id`),
  KEY `fk_cart_2_idx` (`product_id`),
  CONSTRAINT `fk_cart_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `products_in_cart`
-- 

LOCK TABLES `products_in_cart` WRITE;
/*!40000 ALTER TABLE `products_in_cart` DISABLE KEYS */;
INSERT INTO `products_in_cart` VALUES (1,7,2,21),(2,7,1,6),(5,32,1,6),(46,36,2,8),(47,36,10,2),(48,36,8,7),(49,36,7,3),(50,36,5,100),(51,36,3,3),(52,36,1,1000),(63,36,11,1546),(64,36,6,1);
/*!40000 ALTER TABLE `products_in_cart` ENABLE KEYS */;
UNLOCK TABLES;

-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `branch_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_1_idx` (`branch_id`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- 
-- Dumping data for table `users`
-- 

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'t@t.com','$2y$10$ao/6LItqxbZgp4efoWX9YenHCZ/.dF4Td3c4dEnMU7vhvTs1WKG/W',1,'big guy'),(12,'h','$2y$10$Nd1X5DWehayA2kDZVMHaQeu/xXXKj0JcIEuGbmqZg9jrArHLbaGJu',5,'h'),(32,'s@s.s','$2y$10$ZIHb0ShYsnT592hGuqYoGujsV2B10QrE/JrF/65jzPVVe1X3DJPo6',3,'s'),(33,'d@d.d','$2y$10$wLDcpIn/a1Ii1IR5iGbSo.kiolvkgLOuXUOfzKfLmQfUQzAmHdN7.',3,'didaly'),(34,'r@r.r','$2y$10$BUn6RdlgyBKIRLMqAikAD.INgZzw3oilmFuKTZGx3KoOUoLXebhEO',3,'roger'),(35,'a@a.a','$2y$10$nm0LYMJ9DdbA/2PMAKayCuOQeE78UCMQ8Z.ElOiBUuyyEK.BOtydC',3,'a'),(36,'z@z.z','$2y$10$VtP.7QDVLLlq7Ly.TUO7meZtEML3FvjrWR7fywooqSe8HNhQLv6b2',4,'z');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31 17:29:22