-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbms_project
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `username` varchar(255) DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `past_orders`
--

DROP TABLE IF EXISTS `past_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `past_orders` (
  `username` varchar(255) DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `boughtOn` date DEFAULT NULL,
  `orderId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `past_orders`
--

LOCK TABLES `past_orders` WRITE;
/*!40000 ALTER TABLE `past_orders` DISABLE KEYS */;
INSERT INTO `past_orders` VALUES ('sarthak_123',1,2,'2020-11-23','44468536599480470000'),('sarthak_123',2,1,'2020-11-23','44468536599480470000'),('sarthak_123',1,2,'2020-11-23','46049540662290235000'),('sarthak_123',1,2,'2020-11-23','16436979691697727000'),('sarthak_123',2,1,'2020-11-23','16436979691697727000'),('sarthak_123',1,1,'2020-11-23','71444184168039300000'),('sarthak_123',1,2,'2020-11-23','75073532853418330000'),('sarthak_123',1,1,'2020-11-23','78036103139307670000'),('sarthak_123',1,2,'2020-11-23','17811248119772238000'),('sarthak_123',1,2,'2020-11-23','61778395537454700000'),('sarthak_123',1,2,'2020-11-23','57033338206193140000'),('sarthak_123',1,1,'2020-11-23','71806821755263295000'),('sarthak_123',1,1,'2020-11-23','6893596012124115000'),('sarthak_123',1,2,'2020-11-23','62807223402652300000'),('sarthak_123',1,1,'2020-11-23','68384145347453430000'),('sarthak_123',1,1,'2020-11-23','79781708062032280000'),('sarthak_123',1,1,'2020-11-23','66470730996937695000'),('sarthak_123',1,1,'2020-11-23','93855588927015000000'),('sarthak_123',1,1,'2020-11-23','93188050058206920000'),('sarthak_123',1,1,'2020-11-23','51422832574742960000'),('sarthak_123',1,1,'2020-11-23','86181161321973650000'),('sarthak_123',1,1,'2020-11-23','94891383995482670000'),('sarthak_123',1,2,'2020-11-23','59641859523703270000'),('sarthak_123',1,2,'2020-11-23','60162963852435915000'),('sarthak_123',1,1,'2020-11-23','73155056210682880000'),('sarthak_123',1,1,'2020-11-23','2396606653615141000'),('sarthak_123',1,1,'2020-11-23','65343883379319200000'),('sarthak_123',1,2,'2020-11-23','97038833192596230000'),('sarthak_123',1,2,'2020-11-23','82458304495430070000'),('sarthak_123',1,1,'2020-11-23','59635444266135405000'),('sarthak_123',2,1,'2020-11-23','59635444266135405000'),('sarthak_123',1,2,'2020-11-23','86106405847479420000'),('sarthak_123',1,2,'2020-11-23','82739182759750400000'),('sarthak_123',2,1,'2020-11-23','82739182759750400000'),('Ishant124',1,2,'2020-11-23','23405339190257110000'),('Ishant124',2,1,'2020-11-23','23405339190257110000'),('Ishant124',1,2,'2020-11-23','36393741578019734000'),('Ishant124',3,2,'2020-11-23','36393741578019734000'),('Ishant124',4,2,'2020-11-23','36393741578019734000'),('Ishant124',5,1,'2020-11-23','36393741578019734000'),('Ishant124',7,1,'2020-11-23','36393741578019734000'),('Ishant124',8,1,'2020-11-23','36393741578019734000'),('sarthak_123',2,2,'2020-11-23','41492316571370180000'),('sarthak_123',3,2,'2020-11-23','41492316571370180000'),('sarthak_123',4,1,'2020-11-23','41492316571370180000'),('sarthak_123',6,2,'2020-11-23','41492316571370180000'),('sarthak_123',10,2,'2020-11-23','41492316571370180000'),('sarthak123',1,1,'2020-11-23','22616272920124870000'),('sarthak123',5,2,'2020-11-23','22616272920124870000'),('sarthak123',9,3,'2020-11-23','22616272920124870000');
/*!40000 ALTER TABLE `past_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productId` int DEFAULT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productRating` int DEFAULT NULL,
  `productURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Camera',199.99,4,'https://cdn.shopify.com/s/files/1/0070/7032/files/camera_56f176e3-ad83-4ff8-82d8-d53d71b6e0fe.jpg?v=1527089512'),(2,'Bag',99.99,3,'https://img.pixelz.com/blog/using-product-images-on-ecommerce-site/ecommerce-sites1.jpg?w=1000'),(3,'DSLR',1000,5,'https://images.unsplash.com/photo-1596265371388-43edbaadab94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'),(4,'Laptop',1199.99,4,'https://images.unsplash.com/photo-1592839962050-030ef9221225?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80'),(5,'SunGlasses',199.99,4,'https://images.unsplash.com/photo-1589782182703-2aaa69037b5b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80'),(6,'USB Drive',10.99,2,'https://images.unsplash.com/photo-1589447388175-ac47d31be950?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80'),(7,'Coffee Mug',12.99,3,'https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),(8,'Coffee Mug',10.99,4,'https://res.cloudinary.com/dxivtqnri/image/upload/c_fill,f_auto,g_auto,h_563,q_50,w_750/v1564048383/Inner_image_1.jpg'),(9,'Journal',5.99,4,'https://res-3.cloudinary.com/dxivtqnri/image/upload/c_fill,f_auto,g_auto,h_563,q_100,w_750/v1598528718/notebook_HPI_Printo_home_carousel.jpg'),(10,'Cap',7.99,5,'https://res.cloudinary.com/dxivtqnri/image/upload/c_fill,f_auto,g_auto,h_563,q_100,w_750/v1574233289/Line_caps_Grey.jpg'),(11,'Headphones',120.99,3,'https://res.cloudinary.com/dxivtqnri/image/upload/c_fill,f_auto,g_auto,h_563,q_100,w_750/v1576729957/UG_-_Bass_Pro_2.jpg'),(12,'Pen',4.99,4,'https://res.cloudinary.com/dxivtqnri/image/upload/c_fill,f_auto,g_auto,h_563,q_100,w_750/v1575522608/801_SN_GP_Roller_Pen_1.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2020-11-23 18:28:21
