CREATE DATABASE BTL_NGUYENMINHDUC
GO 
USE BTL_NGUYENMINHDUC
GO

-- tạo bảng loại hàng 
CREATE TABLE tbl_LoaiHang (
    MaLoaiHang char(10) PRIMARY KEY not null,
    TenLoaiHang VARCHAR(50) not null, 
);
GO
-- tạo bảng hàng hóa 
CREATE TABLE tbl_HangHoa (
    MaHang char(10) CONSTRAINT PK_MH PRIMARY KEY (MaHang) not null,
    TenHang NVARCHAR(50) null,
    MaLoaiHang char(10) not null,
    SoLuong INT not null,
    DonGiaNhap FLOAT not null,
	DonGiaBan float not null,
	MoTa VARCHAR(100)not null
    FOREIGN KEY (MaLoaiHang) REFERENCES tbl_LoaiHang(MaLoaiHang) on delete cascade on update cascade,
);
GO
-- tạo bảng nhân viên 
CREATE TABLE tbl_NhanVien (
    MaNhanVien char(10) not null CONSTRAINT PK_MNV PRIMARY KEY (MaNhanVien),
    TenNhanVien NVARCHAR(50) not null,
	GioiTinh NVARCHAR(10),
    DiaChi VARCHAR(100) not null,
    SoDienThoai VARCHAR(15) not null ,
	Email char(30) not null,
    NgaySinh DATE not null,
);
GO
-- tạo bảng khách hàng 
CREATE TABLE tbl_KhachHang (
    MaKhachHang char(10) CONSTRAINT PK_MKH PRIMARY KEY (MaKhachHang) not null,
    TenKhachHang NVARCHAR(50) null,	
	GioiTinh NVARCHAR(10) not null,
    DiaChi VARCHAR(100) not null,
    SoDienThoai VARCHAR(10) not null CONSTRAINT chk_SoDienThoai CHECK(SoDienThoai LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
);
GO
-- tạo bảng hóa đơn bán 
CREATE TABLE tbl_HoaDonBan (
    MaHoaDonBan INT PRIMARY KEY not null,
    MaNhanVien char(10) not null,
    NgayBan DATE not null,
    MaKhachHang char(10) not null,
	TongTien FLOAT not null,
    FOREIGN KEY (MaNhanVien) REFERENCES tbl_NhanVien(MaNhanVien) on delete cascade on update cascade,
    FOREIGN KEY (MaKhachHang) REFERENCES tbl_KhachHang(MaKhachHang)on delete cascade on update cascade,
);
GO
-- chi tiết hóa đơn bán 
CREATE TABLE tbl_ChiTietHoaDonBan (
    MaHoaDonBan INT not null,
    MaHang char(10)not null,
    SoLuong INT not null,
    DonGia FLOAT not null,
	GiamGia FLOAT not null,
    ThanhTien FLOAT not null,
    PRIMARY KEY (MaHoaDonBan, MaHang) ,
    FOREIGN KEY (MaHoaDonBan) REFERENCES tbl_HoaDonBan(MaHoaDonBan) on delete cascade on update cascade,
    FOREIGN KEY (MaHang) REFERENCES tbl_HangHoa(MaHang) on delete cascade on update cascade,
);
GO

-- Thêm nhân viên 
INSERT INTO tbl_NhanVien (MaNhanVien, TenNhanVien, GioiTinh, DiaChi, SoDienThoai, Email, NgaySinh)VALUES 
('NV001', 'Nguyen Van A', 'Nam', '123 Nguyen Du, Hanoi', '0123456789', 'nv.a@example.com', '2000-01-01'),
('NV002', 'Tran Thi B', N'Nữ', '456 Le Loi, Ho Chi Minh City', '0987654321', 'nv.b@example.com', '1995-05-10'),
('NV003', 'Pham Van C', 'Nam', '789 Nguyen Trai, Da Nang', '0369876543', 'nv.c@example.com', '1998-12-25'),
('NV004', 'Hoang Thi D', N'Nữ', '321 Tran Hung Dao, Hai Phong', '0543216789', 'nv.d@example.com', '1992-07-15'),
('NV005', 'Le Van E', 'Nam', '654 Nguyen Thi Minh Khai, Can Tho', '0765432109', 'nv.e@example.com', '1994-03-05'),
('NV006', 'Nguyen Thi F', N'Nữ', '987 Hoang Van Thu, Hue', '0912345678', 'nv.f@example.com', '1997-09-20'),
('NV007', 'Tran Van G', 'Nam', '258 Vo Thi Sau, Nha Trang', '0887654321', 'nv.g@example.com', '1990-11-30'),
('NV008', 'Pham Thi H', N'Nữ', '753 Le Lai, Da Lat', '0332145678', 'nv.h@example.com', '1993-08-18'),
('NV009', 'Hoang Van I', 'Nam', '159 Tran Phu, Quy Nhon', '0598765432', 'nv.i@example.com', '1999-02-28'),
('NV010', 'Le Thi J', N'Nữ', '852 Hoang Dieu, Vung Tau', '0945678901', 'nv.j@example.com', '1996-06-08');
GO
-- Thêm khách hàng 
INSERT INTO tbl_KhachHang (MaKhachHang, TenKhachHang, GioiTinh, DiaChi, SoDienThoai)
VALUES
    ('KH001', 'Nguyen Van A', 'Nam', '123 Nguyen Du, Hanoi', '0123456789'),
    ('KH002', 'Tran Thi B', N'Nữ', '456 Le Loi, Ho Chi Minh City', '0987654321'),
    ('KH003', 'Pham Van C', 'Nam', '789 Nguyen Trai, Da Nang', '0369876543'),
    ('KH004', 'Hoang Thi D', N'Nữ', '321 Tran Hung Dao, Hai Phong', '0543216789'),
    ('KH005', 'Le Van E', 'Nam', '654 Nguyen Thi Minh Khai, Can Tho', '0765432109'),
    ('KH006', 'Nguyen Thi F', N'Nữ', '987 Hoang Van Thu, Hue', '0912345678'),
    ('KH007', 'Tran Van G', 'Nam', '258 Vo Thi Sau, Nha Trang', '0887654321'),
    ('KH008', 'Pham Thi H', N'Nữ', '753 Le Lai, Da Lat', '0332145678'),
    ('KH009', 'Hoang Van I', 'Nam', '159 Tran Phu, Quy Nhon', '0598765432'),
    ('KH010', 'Le Thi J', N'Nữ', '852 Hoang Dieu, Vung Tau', '0945678901');
GO
INSERT INTO tbl_LoaiHang (MaLoaiHang, TenLoaiHang)
VALUES 
    ('LH001', 'Laptop'),
    ('LH002', N'Desktop'),
    ('LH003', N'Phu kien'),
    ('LH004', N'Linh kien'),
	('LH005', N'May in'),
    ('LH006', N'May scan'),
    ('LH007', N'May chieu'),
    ('LH008', N'Thiet be lưu tru'),
    ('LH009', N'Phan mem'),
    ('LH010', N'Gaming');
GO
INSERT INTO tbl_HangHoa (MaHang, TenHang, MaLoaiHang, SoLuong, DonGiaNhap,DonGiaBan,MoTa)
VALUES 
('HH001', 'Laptop Dell', 'LH001', 10, 20000000, 25000000,'Laptop'),
('HH002', 'Laptop Asus', 'LH002', 20, 15000000,250000000,'Laptop'),
('HH003', 'Laptop Acer', 'LH003', 20, 15000000,20000000,'Laptop'),
('HH004', 'Laptop Hp', 'LH004', 20, 15000000,20000000,'Laptop'),
('HH005', 'Laptop Dell', 'LH005', 20, 15000000,20000000,'Laptop'),
('HH006', 'Laptop Macbook', 'LH006', 20, 15000000,20000000,'Laptop'),
('HH007', 'Laptop Acer', 'LH007', 20, 15000000,20000000,'Laptop'),
('HH008', 'Laptop Macbook', 'LH008', 20, 15000000,20000000,'Laptop'),
('HH009', 'Laptop Samsung', 'LH009', 20, 15000000,20000000,'Laptop'),
('HH010', 'Laptop Macbook', 'LH010', 20, 15000000,20000000,'Laptop');

GO
INSERT INTO tbl_HoaDonBan (MaHoaDonBan, MaNhanVien, NgayBan, MaKhachHang,TongTien) VALUES
(1, 'NV001', '2023-05-23', 'KH001', 5000000),
(2,'NV002', '2023-05-20', 'KH002', 10000000),
(3, 'NV003', '2023-05-21', 'KH003', 5000000),
(4, 'NV004', '2023-05-22', 'KH004', 4000000),
(5, 'NV005', '2023-05-19', 'KH005', 4000000),
(6, 'NV006', '2023-05-17', 'KH006', 40000000),
(7, 'NV007', '2023-05-15', 'KH007', 60000000),
(8, 'NV008', '2023-05-12', 'KH008', 20000000),
(9, 'NV009', '2023-05-12', 'KH009', 30000000),
(10, 'NV010', '2023-05-12', 'KH010', 8000000);
GO
INSERT INTO tbl_ChiTietHoaDonBan (MaHoaDonBan, MaHang, SoLuong, DonGia,GiamGia,ThanhTien)
VALUES
(1, 'HH001', 10, 27000000,0, 10*27000000),
(2, 'HH002', 20, 12000000,0, 20*12000000),
(3, 'HH003', 30, 13000000,0, 30*13000000),
(4, 'HH004', 100, 12000000,0, 100*12000000),
(5, 'HH005', 15, 12000000,0, 15*12000000),
(6, 'HH006', 10, 18000000,0, 10*18000000),
(7, 'HH007', 20, 12000000,0, 20*12000000),
(8, 'HH008', 30, 12000000,0, 30*12000000),
(9, 'HH009', 100, 12000000,0, 100*12000000),
(10, 'HH010', 15, 10000000,0, 15*10000000);
GO

/*Thủ tục thêm khách hàng */
CREATE PROC Proc_themkh
@MaKhachHang char(10),
@TenKhachHang Nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi Nvarchar(10),
@SoDienThoai varchar(15)
AS
BEGIN
    INSERT INTO tbl_KhachHang
    VALUES(  @MaKhachHang,@TenKhachHang,@GioiTinh,@DiaChi,@SoDienThoai)
END
GO
-----gọi thủ tục
exec Proc_themkh'KH012',N'Le Thi Thuy Duong','Nu',N'Ha noi','0987654321';
SELECT * FROM tbl_KhachHang

/*Sửa khách hàng */
CREATE PROC Proc_suakh
@MaKhachHang char(10),
@TenKhachHang Nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi Nvarchar(10),
@SoDienThoai varchar(15)
AS
BEGIN
    UPDATE tbl_KhachHang SET TenKhachHang = @TenKhachHang, GioiTinh = @GioiTinh,DiaChi = @DiaChi, SoDienThoai = @SoDienThoai
    WHERE MaKhachHang = @MaKhachHang
END
GO
-----gọi thủ tục sửa 
exec Proc_suakh 'KH012',N'Nguyen Hoang Minh Duc','Nam',N'Hung Yen ','0123456789'
SELECT * FROM tbl_KhachHang

/*Xóa khách hàng */
CREATE PROC Proc_xoakh
@MaKhachHang nvarchar(10)
AS
BEGIN
    DELETE FROM tbl_KhachHang WHERE MaKhachHang =@MaKhachHang
END
GO
----gọi thủ tục xoá mã khách “KH012”
exec Proc_xoakh 'KH012'
SELECT * FROM tbl_KhachHang

/*Tim kiem khach hang*/
CREATE PROC Proc_tkkh
@TUKHOA NVARCHAR(50)
AS
BEGIN
    SELECT * FROM tbl_KhachHang WHERE tbl_KhachHang.TenKhachHang = @TUKHOA OR TenKhachHang LIKE @TUKHOA OR SoDienThoai LIKE @TUKHOA OR TenKhachHang LIKE '%'+@TUKHOA+'%'
END
GO
----gọi thủ tục tìm kiếm có họ “Nguyen”
exec Proc_tkkh 'Nguyen'