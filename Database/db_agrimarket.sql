-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2023 at 10:39 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_agrimarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` varchar(24) NOT NULL,
  `UserID` varchar(24) NOT NULL DEFAULT '',
  `AddressName` varchar(128) NOT NULL DEFAULT '',
  `AddressPhone` varchar(12) NOT NULL DEFAULT '',
  `Defaults` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `CartItemID` varchar(24) NOT NULL,
  `UserID` varchar(24) NOT NULL DEFAULT '',
  `ProductID` varchar(24) NOT NULL DEFAULT '',
  `Quantity` int(1) NOT NULL DEFAULT 0,
  `SumPrice` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` varchar(24) NOT NULL,
  `CategoryName` varchar(128) NOT NULL DEFAULT '',
  `CategorySlug` varchar(254) NOT NULL DEFAULT '',
  `CategoryIcon` varchar(50) NOT NULL DEFAULT '',
  `CategoryActive` int(1) NOT NULL DEFAULT 1,
  `CategoryCreatedAt` datetime DEFAULT NULL,
  `CategoryUpdatedAt` datetime DEFAULT NULL,
  `UserID` varchar(24) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`, `CategorySlug`, `CategoryIcon`, `CategoryActive`, `CategoryCreatedAt`, `CategoryUpdatedAt`, `UserID`) VALUES
('C01', 'Hạt Giống', '', '', 1, NULL, NULL, 'A01'),
('C02', 'THUỐC CÔN TRÙNG', '', '', 1, NULL, NULL, 'A01'),
('C03', 'Thuốc diệt nấm', '', '', 1, NULL, NULL, 'A01'),
('C04', 'Thúc đẩy tăng trưởng', '', '', 1, NULL, NULL, 'A01'),
('C05', 'Thuốc diệt cỏ', '', '', 1, NULL, NULL, 'A01');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `ImageID` varchar(24) NOT NULL,
  `ProductID` varchar(24) NOT NULL DEFAULT '',
  `ImageUrl` varchar(50) NOT NULL DEFAULT '',
  `ImageDescription` varchar(128) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderDetailID` varchar(24) NOT NULL,
  `ProductID` varchar(24) NOT NULL DEFAULT '',
  `OrderID` varchar(24) NOT NULL DEFAULT '',
  `OrderDetailQuantity` int(1) NOT NULL DEFAULT 0,
  `OrderDetailPrice` decimal(18,2) NOT NULL DEFAULT 0.00,
  `OrderDetailNote` decimal(18,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(24) NOT NULL,
  `UserID` varchar(24) NOT NULL DEFAULT '',
  `Total` decimal(18,2) NOT NULL DEFAULT 0.00,
  `Date` datetime DEFAULT NULL,
  `AddressID` varchar(24) NOT NULL DEFAULT '',
  `Status` varchar(50) NOT NULL DEFAULT '',
  `OrdersCreatedAt` datetime DEFAULT NULL,
  `OrdersUpdatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` varchar(24) NOT NULL,
  `ProductName` varchar(254) NOT NULL DEFAULT '''''',
  `ProductPrice` varchar(254) NOT NULL DEFAULT '''''',
  `ProductDescription` varchar(586) NOT NULL DEFAULT '''''',
  `ProductSlug` varchar(254) NOT NULL DEFAULT '''''',
  `ProductActive` int(1) NOT NULL DEFAULT 0,
  `ProductQuantity` int(1) NOT NULL DEFAULT 0,
  `ProductCreatedAt` datetime DEFAULT NULL,
  `ProductUpdatedAt` datetime DEFAULT NULL,
  `ProductExpiraAt` datetime DEFAULT NULL,
  `CategoryID` varchar(24) NOT NULL DEFAULT '''''''''''''',
  `UserID` varchar(24) NOT NULL DEFAULT ''''''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `ProductPrice`, `ProductDescription`, `ProductSlug`, `ProductActive`, `ProductQuantity`, `ProductCreatedAt`, `ProductUpdatedAt`, `ProductExpiraAt`, `CategoryID`, `UserID`) VALUES
('P01', 'HẠT CÀ CHUA SAAHO TO 325', '1000', 'ĐẶC TRƯNG: nhà máy xác định, Tốt Ở lại màu xanh lá cây, tán lá màu xanh đậm, Bộ tản nhiệt tốt, Trái Cây Chắc Rất Tốt, Tiềm năng năng suất cao', '', 1, 1000, NULL, NULL, NULL, 'C01', 'S01'),
('P010', 'THUỐC CỎ SEMPRA', '224', 'Thuốc diệt cỏ Sempra là loại thuốc diệt cỏ đầu tiên được giới thiệu ở Ấn Độ bởi Dhanuka Agritech Ltd để kiểm soát hiệu quả Cyperus rotundus.', '', 0, 186, NULL, NULL, NULL, 'C05', 'S02'),
('P02', 'SURABHI CORIANDER', '135', 'Surabhi là giống rau mùi mạnh mẽ có tiềm năng năng suất tuyệt vời. Thích hợp cho nhiều vết cắt với lá rất hấp dẫn, to, sáng bóng, có mùi thơm. Là giống ra muộn nên có thể trồng quanh năm.', '', 1, 164, NULL, NULL, NULL, 'C01', 'S03'),
('P03', 'HẠT GIỐNG DƯA CHUA LAI KRISH F1', '290', 'Lần Thu Hoạch Đầu Tiên- 30-35 Ngày, Số lượng hạt giống trên mỗi mẫu Anh-0,180-0,250 kg, Khoảng cách gieo hạt giữa hàng và luống-4-6 feet, Khoảng cách gieo hạt giữa các cây-1,5-2 feet', '', 1, 1290, NULL, NULL, NULL, 'C01', 'S04'),
('P04', 'TIẾP XÚC THUỐC CÔN TRÙNG', '635', 'BASF Exponus là một loại thuốc diệt côn trùng mang tính cách mạng mang đến cho bạn sức mạnh đối với những loài côn trùng khó tính.', '', 1, 546, NULL, NULL, NULL, 'C02', 'S02'),
('P05', 'THUỐC CÔN TRÙNG TAFGOR (DIMETHOATE 30% EC), KIỂM SOÁT SÂU RÂU VÀ SÂU MÚT', '79', 'Tafgor thuộc nhóm Organophosphate. Nó có hiệu quả cao trong việc kiểm soát sâu bướm và sâu bướm.', '', 1, 598, NULL, NULL, NULL, 'C02', 'S01'),
('P06', 'THUỐC CÔN TRÙNG CORAGEN (CHLORANTRANILIPROLE 18,5% SC)', '208', 'Thuốc trừ sâu Coragen® là một loại thuốc trừ sâu Anthranilic diamide Broad Spectrum ở dạng đậm đặc huyền phù.', '', 1, 200, NULL, NULL, NULL, 'C02', 'S05'),
('P07', 'Thuốc diệt nấm SAAF (CARBENDAZIM 12% + MANCOZEB 63% WP) KIỂM SOÁT BỆNH MỤN THÙ, SỮA BỤNG VÀ BỆNH RUST', '80', 'Một loại thuốc diệt nấm cổ điển đã được chứng minh với hành động tiếp xúc và có hệ thống. Chế độ diệt nấm hành động kép đáng tin cậy và được sử dụng rộng rãi nhất', '', 1, 255, NULL, NULL, NULL, 'C03', 'S05'),
('P08', 'PHÂN BÓN VI LƯỢNG MULTIPLEX KRANTI', '232', 'Chứa các chất dinh dưỡng thiết yếu cho cây trồng (Chính, Phụ và Vi lượng). Hầu hết các chất dinh dưỡng ở dạng chelate.', '', 1, 222, NULL, NULL, NULL, 'C04', 'S01'),
('P09', 'THUỐC CỎ ROUNDUP', '186', 'Thuốc diệt cỏ Roundup là sản phẩm chủ đạo trong lĩnh vực kinh doanh hóa chất nông nghiệp của Monsanto.', '', 1, 186, NULL, NULL, NULL, 'C05', 'S02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` varchar(24) NOT NULL,
  `UserName` varchar(128) NOT NULL DEFAULT '',
  `Password` varchar(128) NOT NULL DEFAULT '',
  `FullName` varchar(128) NOT NULL DEFAULT '',
  `Email` varchar(128) NOT NULL DEFAULT '',
  `Phone` varchar(12) NOT NULL DEFAULT '',
  `Avatar` varchar(50) NOT NULL DEFAULT '',
  `Role` int(1) NOT NULL DEFAULT 1,
  `IsActive` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Password`, `FullName`, `Email`, `Phone`, `Avatar`, `Role`, `IsActive`) VALUES
('A01', 'admin', 'admin', 'admin', 'admin@gmail.com', '0123456789', '', 3, 1),
('S01', 'sell', 'sell', 'sell', 'sell@gmail.com', '08654852462', '', 2, 1),
('S02', 'sell2', 'sell2', 'sell', 'sell2@gmail.com', '0523452542', '', 2, 1),
('S03', 'sell3', 'sell3', 'sell', 'sell3@gmail.com', '0274525845', '', 2, 1),
('S04', 'sell4', 'sell4', 'sell', 'sell4@gmail.com', '0956842357', '', 2, 1),
('S05', 'sell5', 'sell5', 'sell', 'sell5@gmail.com', '0512369756', '', 2, 1),
('U01', 'user', 'user', 'user', 'user@gmail.com', '012365897', '', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Address_User` (`UserID`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`CartItemID`),
  ADD KEY `FK_CartItem_Product` (`ProductID`),
  ADD KEY `FK_CartItem_User` (`UserID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `FK_Category_Users` (`UserID`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ImageID`),
  ADD KEY `FK_Image_Product` (`ProductID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `FK_OrderDetail_Product` (`ProductID`),
  ADD KEY `FK_OrderDetail_Orders` (`OrderID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Address` (`AddressID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Product_Category` (`CategoryID`),
  ADD KEY `FK_Product_Users` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_Address_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `FK_CartItem_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `FK_CartItem_User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_Category_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_Image_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `FK_OrderDetail_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `FK_OrderDetail_Product` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Orders_Address` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_Product_Category` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  ADD CONSTRAINT `FK_Product_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
