CREATE DATABASE Agrimarket;

USE Agrimarket;

CREATE TABLE Users(
    UserID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    UserName VARCHAR(128) NOT NULL DEFAULT (''),
    Password VARCHAR(128) NOT NULL DEFAULT (''),
    FullName VARCHAR(128) NOT NULL DEFAULT (''),
    Email VARCHAR(128) NOT NULL DEFAULT (''),
    Phone VARCHAR(12) NOT NULL DEFAULT (''),
    Avatar VARCHAR(50) NOT NULL DEFAULT (''),
    Role INT NOT NULL DEFAULT ((1)),
    IsActive INT NOT NULL DEFAULT ((1))
);


CREATE TABLE Category(
    CategoryID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    CategoryName VARCHAR(128) NOT NULL DEFAULT (''),
    CategorySlug VARCHAR(254) NOT NULL DEFAULT (''),
    CategoryIcon VARCHAR(50) NOT NULL DEFAULT (''),
    CategoryActive INT NOT NULL DEFAULT ((1)),
    CategoryCreatedAt DATETIME NULL,
    CategoryUpdatedAt DATETIME NULL,
    UserID VARCHAR(24) NOT NULL DEFAULT (''),
    CONSTRAINT FK_Category_Users
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE TABLE Product(
    ProductID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    ProductName VARCHAR(254) NOT NULL DEFAULT (''),
    ProductPrice VARCHAR(254) NOT NULL DEFAULT (''),
    ProductDescription  VARCHAR(586) NOT NULL DEFAULT (''),
    ProductSlug VARCHAR(254) NOT NULL DEFAULT (''),
    ProductActive INT NOT NULL DEFAULT ((1)),
    ProductQuantity INT NOT NULL DEFAULT ((0)),
    ProductCreatedAt DATETIME,
    ProductUpdatedAt DATETIME,
    CategoryID VARCHAR(24) NOT NULL DEFAULT (''),
    UserID VARCHAR(24) NOT NULL DEFAULT (''),
    CONSTRAINT FK_Product_Category
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    CONSTRAINT FK_Product_Users
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Image(
    ImageID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    ProductID VARCHAR(24) NOT NULL DEFAULT (''),
    ImageUrl VARCHAR(50) NOT NULL DEFAULT (''),
    ImageDescription VARCHAR(128) NOT NULL DEFAULT (''),
    CONSTRAINT FK_Image_Product
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Address(
    AddressID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    UserID VARCHAR(24) NOT NULL DEFAULT (''),
    AddressName VARCHAR(128) NOT NULL DEFAULT (''),
    AddressPhone VARCHAR(12) NOT NULL DEFAULT (''),
    `Default` INT NOT NULL DEFAULT ((1)),
    CONSTRAINT FK_Address_User
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Orders(
    OrderID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    UserID VARCHAR(24) NOT NULL DEFAULT (''),
    Total NUMERIC(18,2) NOT NULL DEFAULT ((0)),
    Date DATETIME,
    AddressID VARCHAR(24) NOT NULL DEFAULT (''),
    Status VARCHAR(50) NOT NULL DEFAULT (''),
    OrdersCreatedAt DATETIME,
    OrdersUpdatedAt DATETIME,
    CONSTRAINT FK_Orders_Address
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);


CREATE TABLE OrderDetail(
    OrderDetailID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    ProductID VARCHAR(24) NOT NULL DEFAULT (''),
    OrderID VARCHAR(24) NOT NULL DEFAULT (''),
    OrderDetailQuantity INT NOT NULL DEFAULT ((0)),
    OrderDetailPrice NUMERIC(18,2) NOT NULL DEFAULT ((0)),
    OrderDetailNote NUMERIC(18,2) NOT NULL DEFAULT ((0)),
    CONSTRAINT FK_OrderDetail_Product
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT FK_OrderDetail_Orders
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE CartItem(
    CartItemID VARCHAR(24) NOT NULL DEFAULT ('') PRIMARY KEY,
    UserID VARCHAR(24) NOT NULL DEFAULT (''),
    ProductID VARCHAR(24) NOT NULL DEFAULT (''),
    Quantity INT NOT NULL DEFAULT ((0)),
    SumPrice NUMERIC(18,2) NOT NULL DEFAULT ((0)),
    CONSTRAINT FK_CartItem_Product
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    CONSTRAINT FK_CartItem_User
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
); 

