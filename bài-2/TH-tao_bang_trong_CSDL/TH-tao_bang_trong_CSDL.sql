create table HocSinh(
mahs varchar(20) primary key,
tenhs varchar(50),
ngaysinh datetime,
lop varchar(20),
gt varchar(20)

);
CREATE TABLE MonHoc(
 MaMH VARCHAR(20) PRIMARY KEY,
 TenMH VARCHAR(50),
 MaGV VARCHAR(20)

);

CREATE TABLE BangDiem(
 MaHS VARCHAR(20),
 MaMH VARCHAR(20),
 DiemThi INT,
 NgayKT DATETIME,
 PRIMARY KEY (MaHS, MaMH),
 FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
 FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

CREATE TABLE GiaoVien(
 MaGV VARCHAR(20) PRIMARY KEY,
 TenGV VARCHAR(20),
 SDT VARCHAR(10)
);

alter table MonHoc add constraint FK_MaGV foreign key(MaGV) references GiaoVien(MaGV);