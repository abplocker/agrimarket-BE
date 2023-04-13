USE Agrimarket;

INSERT INTO users (UserID, UserName, Password, FullName, Email, Phone, IsActive, Avatar, Role)
	VALUES	('A01', 'admin', 'admin', 'admin', 'admin@gmail.com', '0123456789', 1 , '', 3),
			('U01', 'user', 'user', 'user', 'user@gmail.com', '012365897', 1, '', 1),
            ('S01', 'sell', 'sell', 'sell', 'sell@gmail.com', '08654852462', 1, '', 2),
            ('S02', 'sell2', 'sell2', 'sell', 'sell2@gmail.com', '0523452542', 1, '', 2),
			('S03', 'sell3', 'sell3', 'sell', 'sell3@gmail.com', '0274525845', 1, '', 2),
            ('S04', 'sell4', 'sell4', 'sell', 'sell4@gmail.com', '0956842357', 1, '', 2),
            ('S05', 'sell5', 'sell5', 'sell', 'sell5@gmail.com', '0512369756', 1, '', 2);
            
 INSERT INTO Category (CategoryID, CategoryName, CategorySlug, CategoryIcon, CategoryActive, CategoryCreatedAt, CategoryUpdatedAt, UserID)
	VALUES	('C01','Hạt Giống', '', '', 1, null , null , 'A01'),
			('C02','THUỐC CÔN TRÙNG', '', '', 1, null ,null , 'A01'),
			('C03','Thuốc diệt nấm', '', '', 1, null,null , 'A01'),
            ('C04','Thúc đẩy tăng trưởng', '', '', 1,null ,null , 'A01'),
            ('C05','Thuốc diệt cỏ', '', '', 1,null ,null , 'A01');
            
INSERT INTO Product (ProductID, ProductName, ProductPrice, ProductDescription, ProductSlug, ProductActive, ProductQuantity, ProductCreatedAt, ProductUpdatedAt, CategoryID, UserID)
	VALUES	('P01', 'HẠT CÀ CHUA SAAHO TO 325', 1000, 'ĐẶC TRƯNG: nhà máy xác định, Tốt Ở lại màu xanh lá cây, tán lá màu xanh đậm, Bộ tản nhiệt tốt, Trái Cây Chắc Rất Tốt, Tiềm năng năng suất cao', '', 1, 1000 , null, null, 'C01', 'S01'),
			('P02', 'SURABHI CORIANDER', 135, 'Surabhi là giống rau mùi mạnh mẽ có tiềm năng năng suất tuyệt vời. Thích hợp cho nhiều vết cắt với lá rất hấp dẫn, to, sáng bóng, có mùi thơm. Là giống ra muộn nên có thể trồng quanh năm.', '', 1, 164 , null, null, 'C01', 'S03'),
            ('P03', 'HẠT GIỐNG DƯA CHUA LAI KRISH F1', 290, 'Lần Thu Hoạch Đầu Tiên- 30-35 Ngày, Số lượng hạt giống trên mỗi mẫu Anh-0,180-0,250 kg, Khoảng cách gieo hạt giữa hàng và luống-4-6 feet, Khoảng cách gieo hạt giữa các cây-1,5-2 feet', '', 1, 1290 , null, null, 'C01', 'S04'),
            ('P04', 'TIẾP XÚC THUỐC CÔN TRÙNG', 635, 'BASF Exponus là một loại thuốc diệt côn trùng mang tính cách mạng mang đến cho bạn sức mạnh đối với những loài côn trùng khó tính.', '', 1, 546 , null, null, 'C02', 'S02'),
            ('P05', 'THUỐC CÔN TRÙNG TAFGOR (DIMETHOATE 30% EC), KIỂM SOÁT SÂU RÂU VÀ SÂU MÚT', 79, 'Tafgor thuộc nhóm Organophosphate. Nó có hiệu quả cao trong việc kiểm soát sâu bướm và sâu bướm.', '', 1, 598 , null, null, 'C02', 'S01'),
            ('P06', 'THUỐC CÔN TRÙNG CORAGEN (CHLORANTRANILIPROLE 18,5% SC)', 208, 'Thuốc trừ sâu Coragen® là một loại thuốc trừ sâu Anthranilic diamide Broad Spectrum ở dạng đậm đặc huyền phù.', '', 1, 200 , null, null, 'C02', 'S05'),
			('P07', 'Thuốc diệt nấm SAAF (CARBENDAZIM 12% + MANCOZEB 63% WP) KIỂM SOÁT BỆNH MỤN THÙ, SỮA BỤNG VÀ BỆNH RUST', 80, 'Một loại thuốc diệt nấm cổ điển đã được chứng minh với hành động tiếp xúc và có hệ thống. Chế độ diệt nấm hành động kép đáng tin cậy và được sử dụng rộng rãi nhất', '', 1, 255 , null, null, 'C03', 'S05'),
            ('P08', 'PHÂN BÓN VI LƯỢNG MULTIPLEX KRANTI', 232, 'Chứa các chất dinh dưỡng thiết yếu cho cây trồng (Chính, Phụ và Vi lượng). Hầu hết các chất dinh dưỡng ở dạng chelate.', '', 1, 222 , null, null, 'C04', 'S01'),
            ('P09', 'THUỐC CỎ ROUNDUP', 186, 'Thuốc diệt cỏ Roundup là sản phẩm chủ đạo trong lĩnh vực kinh doanh hóa chất nông nghiệp của Monsanto.', '', 1, 186 , null, null, 'C05', 'S02'),
            ('P010', 'THUỐC CỎ SEMPRA', 224, 'Thuốc diệt cỏ Sempra là loại thuốc diệt cỏ đầu tiên được giới thiệu ở Ấn Độ bởi Dhanuka Agritech Ltd để kiểm soát hiệu quả Cyperus rotundus.', '', 0, 186 , null, null, 'C05', 'S02');
INSERT INTO Image (ImageID, ProductID, ImageUrl, ImageDescription)
	VALUES	();
    
INSERT INTO Address (AddressID, UserID, AddressName, AddressPhone, `Default`)
	VALUES	('Ad01', 'A01', 'Ngồ Quyền', '0123456789', 1),
			('Ad02', 'S01', 'Ngồ Quyền', '08654852462', 1),
            ('Ad03', 'S03', 'Ngồ Quyền', '0274525845', 1),
            ('Ad04', 'S05', 'Ngồ Quyền', '0512369756', 1);
    
INSERT INTO Orders (OrderID, UserID, Total, Date, AddressID, Status, OrdersCreatedAt, OrdersUpdatedAt)
	VALUES	();
    
INSERT INTO OrderDetail (OrderDetailID, ProductID, OrderID, OrderDetailQuantity, OrderDetailPrice, OrderDetailNote)
	VALUES	();
    
INSERT INTO CartItem (CartItemID, UserID, ProductID, Quantity, SumPrice)
	VALUES	();