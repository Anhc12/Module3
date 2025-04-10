create database QuanLyBanHang;
use QuanLyBanHang;

CREATE TABLE Customer (
    cID int PRIMARY KEY, -- Mã khách hàng, khóa chính
    cName VARCHAR(100) NOT NULL, -- Tên khách hàng, không được để trống
    cAge tinyint CHECK (cAge >= 0) -- Tuổi khách hàng, phải >= 0
);

CREATE TABLE Product (
    pID int PRIMARY KEY, -- Mã sản phẩm, khóa chính
    pName VARCHAR(100) NOT NULL, -- Tên sản phẩm, không được để trống
    pPrice int NOT NULL CHECK (pPrice >= 0) -- Giá sản phẩm, kiểu số thập phân, không âm
);

CREATE TABLE `Order` (
    oID int PRIMARY KEY, -- Mã hóa đơn, khóa chính
    cID int NOT NULL, -- Mã khách hàng, khóa ngoại
    oDate DATE NOT NULL, -- Ngày mua hàng
    oTotalPrice int NOT NULL CHECK (oTotalPrice >= 0), -- Tổng giá trị hóa đơn, không âm
    FOREIGN KEY (cID) REFERENCES Customer(cID) -- Khóa ngoại liên kết với bảng Customer
);

insert into Customer (cID, cName, cAge) valuefg
CREATE TABLE OrderDetail (
    oID VARCHAR(10), -- Mã hóa đơn, khóa chính và khóa ngoại
    pID VARCHAR(10), -- Mã sản phẩm, khóa chính và khóa ngoại
    odQTY INT NOT NULL CHECK (odQTY > 0), -- Số lượng sản phẩm, phải lớn hơn 0
    PRIMARY KEY (oID, pID), -- Khóa chính tổng hợp
    FOREIGN KEY (oID) REFERENCES `Order`(oID), -- Khóa ngoại liên kết với bảng Order
    FOREIGN KEY (pID) REFERENCES Product(pID) -- Khóa ngoại liên kết với bảng Product
);