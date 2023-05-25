-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: agrimarket
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `AddressID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `AddressName` varchar(128) NOT NULL DEFAULT (_utf8mb4''),
  `AddressPhone` varchar(12) NOT NULL DEFAULT (_utf8mb4''),
  `Default` int NOT NULL DEFAULT (1),
  PRIMARY KEY (`AddressID`),
  KEY `FK_Address_User` (`UserID`),
  CONSTRAINT `FK_Address_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('Ad01','A01','Ngồ Quyền','0123456789',1),('Ad02','S01','Ngồ Quyền','08654852462',1),('Ad03','S03','Ngồ Quyền','0274525845',1),('Ad04','S05','Ngồ Quyền','0512369756',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitem` (
  `CartItemID` int NOT NULL AUTO_INCREMENT,
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `ProductID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `Quantity` int NOT NULL DEFAULT (0),
  `SumPrice` decimal(18,2) DEFAULT '0.00',
  PRIMARY KEY (`CartItemID`),
  KEY `FK_CartItem_User` (`UserID`),
  KEY `FK_CartItem_Product` (`ProductID`),
  CONSTRAINT `FK_CartItem_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CartItem_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (1,'A01','P01',2,2000.00),(2,'A01','P02',3,405.00),(3,'A01','P03',4,1160.00),(4,'A01','P04',5,3175.00),(5,'A01','P06',6,1248.00),(9,'A01','P05',7,553.00),(14,'A01','P08',8,1856.00),(36,'S01','P03',3,870.00),(37,'S01','P010',3,672.00),(38,'S01','P01',1,1000.00),(39,'U1684438321','P03',5,1450.00),(44,'U1684437841','P01',14,14000.00),(50,'U1684437841','P02',4,540.00);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cartitem_BEFORE_INSERT` BEFORE INSERT ON `cartitem` FOR EACH ROW BEGIN
SET NEW.SumPrice = NEW.Quantity * (SELECT ProductPrice FROM product WHERE ProductID = NEW.ProductID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cartitem_BEFORE_UPDATE` BEFORE UPDATE ON `cartitem` FOR EACH ROW BEGIN
    SET NEW.SumPrice = NEW.Quantity * (SELECT ProductPrice FROM product WHERE ProductID = NEW.ProductID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `CategoryName` varchar(128) NOT NULL DEFAULT (_utf8mb4''),
  `CategorySlug` varchar(254) NOT NULL DEFAULT (_utf8mb4''),
  `CategoryIcon` varchar(50) NOT NULL DEFAULT (_utf8mb4''),
  `CategoryActive` int NOT NULL DEFAULT (1),
  `CategoryCreatedAt` datetime DEFAULT NULL,
  `CategoryUpdatedAt` datetime DEFAULT NULL,
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  PRIMARY KEY (`CategoryID`),
  KEY `FK_Category_Users` (`UserID`),
  CONSTRAINT `FK_Category_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('C01','Hạt giống','','C01.png',1,NULL,NULL,'A01'),('C02','Thuốc trừ sâu','','C02.png',1,NULL,NULL,'A01'),('C03','Thuốc diệt nấm','','C03.png',1,NULL,NULL,'A01'),('C04','Thuốc tăng trưởng','','C04.png',1,NULL,NULL,'A01'),('C05','Thuốc diệt cỏ','','C05.png',1,NULL,NULL,'A01'),('C06','Máy móc, công cụ','','C06.png',1,NULL,NULL,'A01');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `ProductID` varchar(24) NOT NULL,
  `UserID` varchar(24) NOT NULL,
  `Favorite_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`UserID`),
  KEY `favorite_ibfk_2` (`UserID`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES ('P01','U1684437841','2023-05-23 10:00:00'),('P02','U1684437841',NULL),('P03','U1684437841',NULL),('P04','U1684437841',NULL);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `favorite_BEFORE_INSERT` BEFORE INSERT ON `favorite` FOR EACH ROW BEGIN
	SET NEW.Favorite_Time = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `ImageID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `ProductID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `ImageUrl` varchar(50) NOT NULL DEFAULT (_utf8mb4''),
  `ImageDescription` varchar(128) NOT NULL DEFAULT (_utf8mb4''),
  PRIMARY KEY (`ImageID`),
  KEY `FK_Image_Product` (`ProductID`),
  CONSTRAINT `FK_Image_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('imgP01-1','P01','P01-1.png','imgP01'),('imgP01-2','P01','P01-2.png','imgP01'),('imgP01-3','P01','P01-3.png','imgP01'),('imgP010-1','P010','P10-1.png',''),('imgP02-1','P02','P02-1.png',''),('imgP02-2','P02','P02-2.png',''),('imgP02-3','P02','P02-3.png',''),('imgP03-1','P03','P03-1.png',''),('imgP04-1','P04','P04-1.png',''),('imgP04-2','P04','P04-2.png',''),('imgP05-1','P05','P05-1.png',''),('imgP05-2','P05','P05-2.png',''),('imgP06-1','P06','P06-1.png',''),('imgP06-2','P06','P06-2.png',''),('imgP07-1','P07','P07-1.png',''),('imgP08-1','P08','P08-1.png',''),('imgP09-1','P09','P09-1.png',''),('imgP09-2','P09','P09-2.png','');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `OrderDetailID` int NOT NULL AUTO_INCREMENT,
  `ProductID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `OrderID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `OrderDetailQuantity` int NOT NULL DEFAULT (0),
  `OrderDetailSumPrice` decimal(18,2) NOT NULL DEFAULT '0.00',
  `OrderDetailNote` decimal(18,2) NOT NULL DEFAULT (0),
  `OrderDetailPriceOfProduct` int DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `FK_OrderDetail_Orders` (`OrderID`),
  KEY `FK_OrderDetail_Product` (`ProductID`),
  CONSTRAINT `FK_OrderDetail_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `FK_OrderDetail_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,'P02','O1684986397164',4,540.00,0.00,135),(2,'P01','O1684986397164',14,14000.00,0.00,1000),(3,'P02','O1684986502531',4,540.00,0.00,135),(4,'P01','O1684986502531',14,14000.00,0.00,1000);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `Total` decimal(18,2) NOT NULL DEFAULT (0),
  `Date` datetime DEFAULT NULL,
  `Address` varchar(24) DEFAULT '',
  `PhoneNumber` varchar(12) DEFAULT NULL,
  `Status` varchar(50) DEFAULT '',
  `OrdersCreatedAt` datetime DEFAULT NULL,
  `OrdersUpdatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('O1684986120434','U1684437841',14540.00,NULL,'','','Chờ xác nhận','2023-05-25 10:42:00','2023-05-25 11:00:40'),('O1684986397164','U1684437841',14540.00,NULL,'','','Chờ xác nhận','2023-05-25 10:46:37','2023-05-25 11:00:40'),('O1684986502531','U1684437841',14540.00,NULL,'','','Chờ xác nhận','2023-05-25 10:48:22','2023-05-25 11:00:40');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_BEFORE_INSERT` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
	SET NEW.OrdersCreatedAt = NOW();
	SET NEW.Status = "Chờ xác nhận";
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_BEFORE_UPDATE` BEFORE UPDATE ON `orders` FOR EACH ROW BEGIN
	SET NEW.OrdersUpdatedAt = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `PostId` varchar(24) NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Published_date` date DEFAULT NULL,
  `Author` varchar(24) NOT NULL,
  PRIMARY KEY (`PostId`),
  KEY `Author` (`Author`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`Author`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES ('P001','Bệnh mướp đắng: Nhận biết và quản lý để có một vụ thu hoạch khỏe mạnh','Mướp đắng ( Momordica charantia ) hay còn gọi là mướp đắng ,là một loại cây nho nhiệt đới và cận nhiệt đới được trồng rộng rãi để lấy quả ăn được. Đây là một loại cây rau quan trọng ở nhiều khu vực trên thế giới, bao gồm cả Ấn Độ. Nó thuộc họ bầu bí bao gồm một số loại rau thường được trồng khác như dưa chuột, bí ngô, bí và dưa. Giống như các loại cây họ bầu bí khác, mướp đắng cũng dễ bị nhiễm một số loại bệnh có thể gây thiệt hại đáng kể về năng suất nếu không được quản lý hiệu quả. Bệnh của nó có thể do vi khuẩn, nấm, vi rút và các mầm bệnh khác gây ra và có thể ảnh hưởng đến tất cả các bộ phận của cây, bao gồm lá, thân, hoa và quả. Quản lý hiệu quả các bệnh này bao gồm sự hiểu biết về các bệnh ảnh hưởng đến cây trồng, các triệu chứng của chúng và các phương pháp kiểm soát chúng.','2023-03-30','A01');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `ProductName` varchar(254) NOT NULL DEFAULT (_utf8mb4''),
  `ProductPrice` int NOT NULL,
  `ProductDescription` varchar(8000) NOT NULL DEFAULT '',
  `ProductSlug` varchar(254) NOT NULL DEFAULT (_utf8mb4''),
  `ProductActive` int NOT NULL DEFAULT (1),
  `ProductQuantity` int NOT NULL DEFAULT (0),
  `ProductCreatedAt` datetime DEFAULT NULL,
  `ProductUpdatedAt` datetime DEFAULT NULL,
  `ProductImageDefault` varchar(50) DEFAULT NULL,
  `CategoryID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `Rating` float DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_Product_Category` (`CategoryID`),
  KEY `FK_Product_Users` (`UserID`),
  CONSTRAINT `FK_Product_Category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `FK_Product_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P01','HẠT CÀ CHUA SAAHO TO 325',1000,'<h1>ĐẶC TRƯNG: Chịu nhiệt tốt: Loại cây này có khả năng chịu nhiệt tốt, không bị hỏng do thời tiết nóng.</h1>\n<h1>Trái cây cứng: Trái cây của loại cây này có độ cứng tốt.</h1>\n<h1>Tiềm năng sản lượng cao: Loại cây này có khả năng sinh trưởng và sản xuất trái cây với năng suất cao.</h1>\n<h1>ĐẶC ĐIỂM</h1>\n<h1>Sản lượng: Sản lượng trung bình: 25-40 tấn/acre&nbsp;</h1>\n<h1>(tuỳ thuộc vào mùa và phương pháp canh tác).</h1>\n<h1>Kích thước: Hình tròn.</h1>\n<h1>Hình dạng: Hình tròn phẳng, màu xanh đều.</h1>\n<h1>Trọng lượng: 80-100g.</h1>','',1,1000,'1999-01-01 00:00:00','2023-05-25 00:42:23','P01-1.png','C01','S01',4.5),('P010','THUỐC CỎ SEMPRA',224,'Thuốc diệt cỏ Sempra là loại thuốc diệt cỏ đầu tiên được giới thiệu ở Ấn Độ bởi Dhanuka Agritech Ltd để kiểm soát hiệu quả Cyperus rotundus.','',1,186,'1999-01-01 00:00:00','1999-01-01 00:00:00','P10-1.png','C05','S01',4),('P02','SURABHI CORIANDER',135,'Surabhi là giống rau mùi mạnh mẽ có tiềm năng năng suất tuyệt vời. Thích hợp cho nhiều vết cắt với lá rất hấp dẫn, to, sáng bóng, có mùi thơm. Là giống ra muộn nên có thể trồng quanh năm.','',1,164,'1999-01-01 00:00:00','1999-01-01 00:00:00','P02-1.png','C01','S01',5),('P03','HẠT GIỐNG DƯA CHUA LAI KRISH F1',290,'Lần Thu Hoạch Đầu Tiên- 30-35 Ngày, Số lượng hạt giống trên mỗi mẫu Anh-0,180-0,250 kg, Khoảng cách gieo hạt giữa hàng và luống-4-6 feet, Khoảng cách gieo hạt giữa các cây-1,5-2 feet','',1,1290,'1999-01-01 00:00:00','1999-01-01 00:00:00','P03-1.png','C01','S01',5),('P04','TIẾP XÚC THUỐC CÔN TRÙNG',635,'BASF Exponus là một loại thuốc diệt côn trùng mang tính cách mạng mang đến cho bạn sức mạnh đối với những loài côn trùng khó tính.','',1,546,'1999-01-01 00:00:00','1999-01-01 00:00:00','P04-1.png','C02','S01',5),('P05','THUỐC CÔN TRÙNG TAFGOR (DIMETHOATE 30% EC), KIỂM SOÁT SÂU RÂU VÀ SÂU MÚT',79,'Tafgor thuộc nhóm Organophosphate. Nó có hiệu quả cao trong việc kiểm soát sâu bướm và sâu bướm.','',1,598,'1999-01-01 00:00:00','1999-01-01 00:00:00','P05-1.png','C02','S01',5),('P06','THUỐC CÔN TRÙNG CORAGEN (CHLORANTRANILIPROLE 18,5% SC)',208,'Thuốc trừ sâu Coragen® là một loại thuốc trừ sâu Anthranilic diamide Broad Spectrum ở dạng đậm đặc huyền phù.','',1,200,'1999-01-01 00:00:00','1999-01-01 00:00:00','P06-1.png','C02','S01',5),('P07','Thuốc diệt nấm SAAF (CARBENDAZIM 12% + MANCOZEB 63% WP) KIỂM SOÁT BỆNH MỤN THÙ, SỮA BỤNG VÀ BỆNH RUST',80,'Một loại thuốc diệt nấm cổ điển đã được chứng minh với hành động tiếp xúc và có hệ thống. Chế độ diệt nấm hành động kép đáng tin cậy và được sử dụng rộng rãi nhất','',1,255,'1999-01-01 00:00:00','1999-01-01 00:00:00','P07-1.png','C03','S01',5),('P08','PHÂN BÓN VI LƯỢNG MULTIPLEX KRANTI',232,'Chứa các chất dinh dưỡng thiết yếu cho cây trồng (Chính, Phụ và Vi lượng). Hầu hết các chất dinh dưỡng ở dạng chelate.','',1,222,'1999-01-01 00:00:00','1999-01-01 00:00:00','P08-1.png','C04','S01',5),('P09','THUỐC CỎ ROUNDUP',186,'Thuốc diệt cỏ Roundup là sản phẩm chủ đạo trong lĩnh vực kinh doanh hóa chất nông nghiệp của Monsanto.','',1,186,'1999-01-01 00:00:00','2023-01-01 00:00:00','P09-1.png','C05','S01',4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `product_BEFORE_INSERT` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
DECLARE gettimestamp INT;
    SELECT UNIX_TIMESTAMP(CURRENT_TIMESTAMP()) INTO gettimestamp;
    SET NEW.ProductID = CONCAT('P', gettimestamp);
	SET NEW.ProductCreatedAt = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `product_BEFORE_UPDATE` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN
	SET NEW.ProductUpdatedAt = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `RatingID` int NOT NULL AUTO_INCREMENT,
  `ProductID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `Rating` int DEFAULT NULL,
  `Comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`RatingID`),
  KEY `ProductID` (`ProductID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `rating_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (2,'P01','U1684437841',4,'Hi mọi người',NULL),(3,'P01','U1684437841',5,'5551214',NULL);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_product_rating` AFTER INSERT ON `rating` FOR EACH ROW BEGIN
  UPDATE product SET Rating = (
    SELECT AVG(Rating) FROM rating WHERE ProductID = NEW.ProductID
  ) WHERE ProductID = NEW.ProductID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_product_rating_update` AFTER UPDATE ON `rating` FOR EACH ROW BEGIN
  UPDATE product SET Rating = (
    SELECT AVG(Rating) FROM rating WHERE ProductID = NEW.ProductID
  ) WHERE ProductID = NEW.ProductID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `UserName` varchar(128) NOT NULL DEFAULT (_utf8mb4''),
  `Password` varchar(128) NOT NULL DEFAULT (_utf8mb4''),
  `FullName` varchar(128) NOT NULL DEFAULT (_utf8mb4''),
  `Email` varchar(128) NOT NULL DEFAULT (_utf8mb4''),
  `Phone` varchar(12) NOT NULL DEFAULT (_utf8mb4''),
  `Avatar` varchar(50) NOT NULL DEFAULT (_utf8mb4''),
  `Role` int NOT NULL DEFAULT (1),
  `IsActive` int NOT NULL DEFAULT (1),
  `RefreshToken` text,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserName_UNIQUE` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('A01','admin','admin','admin','admin@gmail.com','0123456789','',3,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7IlVzZXJJRCI6IkEwMSIsIlVzZXJOYW1lIjoiYWRtaW4iLCJSb2xlIjozLCJGdWxsTmFtZSI6ImFkbWluIn0sImlhdCI6MTY4NDkxNzQyMywiZXhwIjoxNzE2NDUzNDIzfQ.fDi80zI2nxGODE_mFTe-LtE-FZjzQ5konLeVrvXAXBY'),('S01','sell','sell','sell','sell@gmail.com','08654852462','',2,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7IlVzZXJJRCI6IlMwMSIsIlVzZXJOYW1lIjoic2VsbCIsIlJvbGUiOjIsIkZ1bGxOYW1lIjoic2VsbCJ9LCJpYXQiOjE2ODQ5MzcwNDIsImV4cCI6MTcxNjQ3MzA0Mn0.zNN8erB3NhgtVbPJJFH1oeGxDQ5LAAPl8Zg6oXO-6ZA'),('S02','sell2','sell2','sell','sell2@gmail.com','0523452542','',2,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7IlVzZXJJRCI6IlMwMiIsIlVzZXJOYW1lIjoic2VsbDIiLCJSb2xlIjoyLCJGdWxsTmFtZSI6InNlbGwifSwiaWF0IjoxNjg0OTM1ODg1LCJleHAiOjE3MTY0NzE4ODV9.93439ze0xjsFa4SusU6wWCteOWCmAcKC2ziNpdQtiK8'),('S03','sell3','sell3','sell','sell3@gmail.com','0274525845','',2,1,NULL),('S04','sell4','sell4','sell','sell4@gmail.com','0956842357','',2,1,NULL),('S05','sell5','sell5','sell','sell5@gmail.com','0512369756','',2,0,NULL),('U1684437841','abc','abc','abc','abc','0192301293','',1,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7IlVzZXJJRCI6IlUxNjg0NDM3ODQxIiwiVXNlck5hbWUiOiJhYmMiLCJSb2xlIjoxLCJGdWxsTmFtZSI6ImFiYyJ9LCJpYXQiOjE2ODQ5NTQwNTAsImV4cCI6MTcxNjQ5MDA1MH0.fOQY1TECqTepMK-fi90VkPFHHc74iulXSlT0Lf9ProY'),('U1684438321','abc31','abc','abc32','abc','24234234','',1,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7IlVzZXJJRCI6IlUxNjg0NDM4MzIxIiwiVXNlck5hbWUiOiJhYmMzMSIsIlBhc3N3b3JkIjoiYWJjIiwiRnVsbE5hbWUiOiJhYmMzMiIsIkVtYWlsIjoiYWJjIiwiUGhvbmUiOiIyNDIzNDIzNCIsIkF2YXRhciI6IiIsIlJvbGUiOjEsIklzQWN0aXZlIjoxLCJSZWZyZXNoVG9rZW4iOm51bGx9LCJpYXQiOjE2ODQ0MzgzMjEsImV4cCI6MTcxNTk3NDMyMX0.xN161yAhPg0EeA1Z9Oqkb59taw43m8llkvKrF6sn2c0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `generate_user_id` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    DECLARE gettimestamp INT;
    SELECT UNIX_TIMESTAMP(CURRENT_TIMESTAMP()) INTO gettimestamp;
    IF NEW.Role = 3 THEN
        SET NEW.UserID = CONCAT('A', gettimestamp);
    ELSEIF NEW.Role = 2 THEN
        SET NEW.UserID = CONCAT('S', gettimestamp);
    ELSEIF NEW.Role = 1 THEN
        SET NEW.UserID = CONCAT('U', gettimestamp);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-25 11:16:49
