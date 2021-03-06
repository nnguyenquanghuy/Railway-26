DROP DATABASE IF EXISTS Testing_Exam_1;
CREATE DATABASE Testing_Exam_1;
USE Testing_Exam_1;

CREATE TABLE CUSTOMER (
CustomerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Name` NVARCHAR(50) NOT NULL,
phone VARCHAR(10) NOT NULL,
Email VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
Note VARCHAR(50)
);

CREATE TABLE CAR (
CarID TINYINT PRIMARY KEY,
Maker ENUM ('HONDA', 'TOYOTA', 'NISSAN'),
Model VARCHAR(20) NOT NULL,
`Year` DATE,
Color ENUM ('black', 'white', 'yellow'),
note VARCHAR(100) NOT NULL
);

CREATE TABLE CAR_ORDER (
OrderID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CustomerID TINYINT,
CarID TINYINT,
Amount TINYINT,
SalePrice VARCHAR(100),
OrderDate DATE,
DeliveryDate DATE,
DeliveryAddress VARCHAR(50),
Staus ENUM ('đã đặt hàng', 'đã giao', 'đã hủy') DEFAULT 'đã đặt hàng',
Note VARCHAR(100)
);
