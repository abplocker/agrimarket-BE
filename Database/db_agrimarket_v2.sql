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
  `CartItemID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `ProductID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `Quantity` int NOT NULL DEFAULT (0),
  `SumPrice` decimal(18,2) NOT NULL DEFAULT (0),
  PRIMARY KEY (`CartItemID`),
  KEY `FK_CartItem_Product` (`ProductID`),
  KEY `FK_CartItem_User` (`UserID`),
  CONSTRAINT `FK_CartItem_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `FK_CartItem_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES ('C001','A01','P01',1,0.00),('C002','A01','P02',1,0.00),('C003','A01','P03',1,0.00),('C004','A01','P04',1,0.00),('C009','A01','P05',1,0.00);
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `category` VALUES ('C01','Hạt giống','','C01.png',1,NULL,NULL,'A01'),('C02','Thuốc trừ sâu','','C02.png',1,NULL,NULL,'A01'),('C03','Thuốc diệt nấm','','C03.png',1,NULL,NULL,'A01'),('C04','Thuốc tăng trưởng','','C04.png',1,NULL,NULL,'A01'),('C05','Thuốc diệt cỏ','','C05.png',1,NULL,NULL,'A01');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
  `OrderDetailID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `ProductID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `OrderID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `OrderDetailQuantity` int NOT NULL DEFAULT (0),
  `OrderDetailPrice` decimal(18,2) NOT NULL DEFAULT (0),
  `OrderDetailNote` decimal(18,2) NOT NULL DEFAULT (0),
  PRIMARY KEY (`OrderDetailID`),
  KEY `FK_OrderDetail_Product` (`ProductID`),
  KEY `FK_OrderDetail_Orders` (`OrderID`),
  CONSTRAINT `FK_OrderDetail_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `FK_OrderDetail_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
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
  `AddressID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `Status` varchar(50) NOT NULL DEFAULT (_utf8mb4''),
  `OrdersCreatedAt` datetime DEFAULT NULL,
  `OrdersUpdatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_Orders_Address` (`AddressID`),
  CONSTRAINT `FK_Orders_Address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`)
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
  `ProductPrice` varchar(254) NOT NULL DEFAULT (_utf8mb4''),
  `ProductDescription` varchar(586) NOT NULL DEFAULT (_utf8mb4''),
  `ProductSlug` varchar(254) NOT NULL DEFAULT (_utf8mb4''),
  `ProductActive` int NOT NULL DEFAULT (1),
  `ProductQuantity` int NOT NULL DEFAULT (0),
  `ProductCreatedAt` datetime DEFAULT NULL,
  `ProductUpdatedAt` datetime DEFAULT NULL,
  `ProductImageDefault` varchar(50) DEFAULT NULL,
  `CategoryID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
  `UserID` varchar(24) NOT NULL DEFAULT (_utf8mb4''),
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
INSERT INTO `product` VALUES ('P01','HẠT CÀ CHUA SAAHO TO 325','1000','ĐẶC TRƯNG: nhà máy xác định, Tốt Ở lại màu xanh lá cây, tán lá màu xanh đậm, Bộ tản nhiệt tốt, Trái Cây Chắc Rất Tốt, Tiềm năng năng suất cao','',1,1000,NULL,NULL,'P01-1.png','C01','S01'),('P010','THUỐC CỎ SEMPRA','224','Thuốc diệt cỏ Sempra là loại thuốc diệt cỏ đầu tiên được giới thiệu ở Ấn Độ bởi Dhanuka Agritech Ltd để kiểm soát hiệu quả Cyperus rotundus.','',0,186,NULL,NULL,'P10-1.png','C05','S02'),('P02','SURABHI CORIANDER','135','Surabhi là giống rau mùi mạnh mẽ có tiềm năng năng suất tuyệt vời. Thích hợp cho nhiều vết cắt với lá rất hấp dẫn, to, sáng bóng, có mùi thơm. Là giống ra muộn nên có thể trồng quanh năm.','',1,164,NULL,NULL,'P02-1.png','C01','S03'),('P03','HẠT GIỐNG DƯA CHUA LAI KRISH F1','290','Lần Thu Hoạch Đầu Tiên- 30-35 Ngày, Số lượng hạt giống trên mỗi mẫu Anh-0,180-0,250 kg, Khoảng cách gieo hạt giữa hàng và luống-4-6 feet, Khoảng cách gieo hạt giữa các cây-1,5-2 feet','',1,1290,NULL,NULL,'P03-1.png','C01','S04'),('P04','TIẾP XÚC THUỐC CÔN TRÙNG','635','BASF Exponus là một loại thuốc diệt côn trùng mang tính cách mạng mang đến cho bạn sức mạnh đối với những loài côn trùng khó tính.','',1,546,NULL,NULL,'P04-1.png','C02','S02'),('P05','THUỐC CÔN TRÙNG TAFGOR (DIMETHOATE 30% EC), KIỂM SOÁT SÂU RÂU VÀ SÂU MÚT','79','Tafgor thuộc nhóm Organophosphate. Nó có hiệu quả cao trong việc kiểm soát sâu bướm và sâu bướm.','',1,598,NULL,NULL,'P05-1.png','C02','S01'),('P06','THUỐC CÔN TRÙNG CORAGEN (CHLORANTRANILIPROLE 18,5% SC)','208','Thuốc trừ sâu Coragen® là một loại thuốc trừ sâu Anthranilic diamide Broad Spectrum ở dạng đậm đặc huyền phù.','',1,200,NULL,NULL,'P06-1.png','C02','S05'),('P07','Thuốc diệt nấm SAAF (CARBENDAZIM 12% + MANCOZEB 63% WP) KIỂM SOÁT BỆNH MỤN THÙ, SỮA BỤNG VÀ BỆNH RUST','80','Một loại thuốc diệt nấm cổ điển đã được chứng minh với hành động tiếp xúc và có hệ thống. Chế độ diệt nấm hành động kép đáng tin cậy và được sử dụng rộng rãi nhất','',1,255,NULL,NULL,'P07-1.png','C03','S05'),('P08','PHÂN BÓN VI LƯỢNG MULTIPLEX KRANTI','232','Chứa các chất dinh dưỡng thiết yếu cho cây trồng (Chính, Phụ và Vi lượng). Hầu hết các chất dinh dưỡng ở dạng chelate.','',1,222,NULL,NULL,'P08-1.png','C04','S01'),('P09','THUỐC CỎ ROUNDUP','186','Thuốc diệt cỏ Roundup là sản phẩm chủ đạo trong lĩnh vực kinh doanh hóa chất nông nghiệp của Monsanto.','',1,186,NULL,NULL,'P09-1.png','C05','S02');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('A01','admin','admin','admin','admin@gmail.com','0123456789','',3,1),('S01','sell','sell','sell','sell@gmail.com','08654852462','',2,1),('S02','sell2','sell2','sell','sell2@gmail.com','0523452542','',2,1),('S03','sell3','sell3','sell','sell3@gmail.com','0274525845','',2,1),('S04','sell4','sell4','sell','sell4@gmail.com','0956842357','',2,1),('S05','sell5','sell5','sell','sell5@gmail.com','0512369756','',2,1),('U0013','string10','string10','User 03','string3','string4','string5',1,1);
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

-- Dump completed on 2023-05-09  9:22:45
