CREATE DATABASE BTL_NGUYENMINHDUC
GO 
USE BTL_NGUYENMINHDUC

GO

CREATE TABLE tbl_Slide(
	[MaAnh] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](250) NULL,
	[TieuDe1] [nvarchar](250) NULL,
	[TieuDe2] [nvarchar](250) NULL,
	[MoTa1] [nvarchar](250) NULL,
	[MoTa2] [nvarchar](250) NULL,
	[MoTa3] [nvarchar](250) NULL,
	[MoTa4] [nvarchar](250) NULL,
	[HinhAnh] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

INSERT INTO tbl_Slide (TieuDe, TieuDe1, TieuDe2, MoTa1, MoTa2, MoTa3, MoTa4, HinhAnh)
VALUES
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/LAPTOP/Acer_Gaming_Nitro_5_AN515-44-R9JM.jpg'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/LAPTOP/Acer_Swift_3_SF313-53-518Y.png'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/LAPTOP/Acer_Swift_SF314-57G-53T1.jpg'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/LAPTOP/Asus_D409DA-EK152T.jpeg'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'img/LAPTOP/Asus_Gaming_ROG_Strix_G713QM-K4113T.jpg')

GO
-- Bảng Chi Tiết Hóa Đơn
CREATE TABLE tbl_ChiTietHoaDon (
    MaChiTietHoaDon int IDENTITY(1,1) not null,
    MaHoaDon int,
    MaSanPham int, 
    SoLuong int null,
    TongGia int ,
    CONSTRAINT PK_MaChiTietHoaDon PRIMARY KEY (MaChiTietHoaDon),
    CONSTRAINT FK_MaHoaDon_ChiTietHoaDon FOREIGN KEY (MaHoaDon) REFERENCES tbl_HoaDon(MaHoaDon),
    CONSTRAINT FK_MaSanPham_ChiTietHoaDon FOREIGN KEY (MaSanPham) REFERENCES tbl_SanPham(MaSanPham)
);


-- Bảng Hóa Đơn
CREATE TABLE tbl_HoaDon (
    MaHoaDon int IDENTITY(1,1) not null,
    TongGia int null,
    NgayTao datetime null,
    NgayDuyet datetime null,
    TenKhachHang NVARCHAR(50) not null,
    GioiTinh bit null,
    DiaChi nvarchar(250),
    SoDienThoai nvarchar(10),
	TrangThai bit null
    CONSTRAINT PK_MaHoaDon PRIMARY KEY (MaHoaDon)
);
GO

-- Bảng Sản Phẩm
CREATE TABLE tbl_SanPham (
    MaSanPham INT IDENTITY(1,1) CONSTRAINT PK_MSP PRIMARY KEY (MaSanPham) NOT NULL,
    TenSanPham NVARCHAR(50) NULL,
    MaLoaiHang INT NOT NULL,
    SoLuong INT NOT NULL,
    MoTa VARCHAR(100) NOT NULL,
    TrangThai BIT NULL,
    HinhAnh NVARCHAR(350) NULL -- Cột mới để lưu trữ dữ liệu hình ảnh
);

-- tạo bảng loại hàng 
CREATE TABLE tbl_LoaiHang (
    MaLoaiHang char(10) PRIMARY KEY not null,
    TenLoaiHang VARCHAR(50) not null, 
);
GO



-- Tạo bảng LoaiTaiKhoan để lưu danh sách loại tài khoản
CREATE TABLE LoaiTaiKhoan (
    LoaiTaiKhoanID int PRIMARY KEY,
    TenLoaiTaiKhoan nvarchar(50)
);

-- Tạo bảng tbl_TaiKhoan với khóa ngoại trỏ đến LoaiTaiKhoan
CREATE TABLE tbl_TaiKhoan (
    MaTaiKhoan int PRIMARY KEY,
    LoaiTaiKhoanID int, -- Khóa ngoại trỏ đến LoaiTaiKhoan
    TenTaiKhoan nvarchar(50),
    Matkhau nvarchar(50),
    Email nvarchar(50),  
    FOREIGN KEY (LoaiTaiKhoanID) REFERENCES LoaiTaiKhoan (LoaiTaiKhoanID)
);

-- Tạo bảng ChiTietTaiKhoan để lưu thông tin chi tiết về tài khoản
CREATE TABLE ChiTietTaiKhoan (
    MaChiTietTaiKhoan int PRIMARY KEY,
    MaTaiKhoan int, -- Khóa ngoại trỏ đến MaTaiKhoan trong tbl_TaiKhoan
    HoTen nvarchar(100),
    DiaChi nvarchar(200),
    SoDienThoai nvarchar(20),
    
    FOREIGN KEY (MaTaiKhoan) REFERENCES tbl_TaiKhoan (MaTaiKhoan)
);
INSERT INTO tbl_TaiKhoan VALUES
('1','1','admin','admin','duc56977@gmail.com'),
('2','1','user','user','duc26112@gmail.com')


-- tạo bảng nhân viên 
CREATE TABLE tbl_NhanVien (
    MaNhanVien char(10) not null CONSTRAINT PK_MNV PRIMARY KEY (MaNhanVien),
    TenNhanVien NVARCHAR(50) not null,
	GioiTinh NVARCHAR(10),
    DiaChi VARCHAR(100) not null ,
    SoDienThoai VARCHAR(15) not null,
	Email char(30) not null,
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


-- Thêm dữ liệu các loại tài khoản 
INSERT INTO LoaiTaiKhoan (LoaiTaiKhoanID, TenLoaiTaiKhoan)
VALUES (1, N'Admin'),
       (2, N'Người dùng');

-- Thêm dữ liệu vào bảng sản phẩm 
	SET IDENTITY_INSERT tbl_SanPham  ON;
INSERT INTO tbl_SanPham (MaSanPham, TenSanPham, MaLoaiHang, SoLuong, MoTa, TrangThai,HinhAnh)
VALUES
    (1, N'Máy tính ', '1', 100, 'Máy tính dành cho dân văn phòng ',1,'img/LAPTOP/Acer_Gaming_Nitro_5_AN515-44-R9JM.jpg'),
    (2, N'Máy tính ', '5', 100, 'Máy tính dành cho dân văn phòng ',1,'img/LAPTOP/Asus_D409DA-EK152T.jpeg'),
    (3, N'Máy tính ', '2', 50, 'Máy tính dành cho game thủ ',0,'img/LAPTOP/Acer_Swift_3_SF313-53-518Y.png'),
    (5, N'Điện Thoại ', '3', 75, 'Điện thoại Iphone 15',0,'img/LAPTOP/Acer_Swift_SF314-57G-53T1.jpg'),
    (6, N'Laptop', '4', 120, 'Laptop dành cho đồ họa',1,'img/LAPTOP/Asus_D409DA-EK152T.jpeg'),
    (4, N'Laptop', '4', 120, 'Laptop dành cho đồ họa',1,'img/LAPTOP/Asus_Gaming_ROG_Strix_G713QM-K4113T.jpg');
	SET IDENTITY_INSERT tbl_SanPham  OFF;

-- Thêm một bản ghi vào bảng tbl_HoaDon
		SET IDENTITY_INSERT tbl_HoaDon  ON;
INSERT INTO tbl_HoaDon (MaHoaDon, TongGia, NgayTao, NgayDuyet, TenKhachHang, GioiTinh, DiaChi, SoDienThoai, TrangThai)
VALUES
    (1, 1000, '2023-10-12', '2023-10-15', 'Manh Cuong', 0, 'Sai Gon', '1234567890', 1);
	SET IDENTITY_INSERT tbl_HoaDon  OFF;

-- Thêm một bản ghi vào bảng tbl_ChiTietHoaDon
	SET IDENTITY_INSERT tbl_ChiTietHoaDon  ON;
INSERT INTO tbl_ChiTietHoaDon (MaChiTietHoaDon , MaHoaDon, MaSanPham, SoLuong, TongGia)
VALUES (1, 1, 6, 4, 49500000 )
	SET IDENTITY_INSERT tbl_ChiTietHoaDon  OFF;

-- Thêm nhân viên 
INSERT INTO tbl_NhanVien (MaNhanVien, TenNhanVien, GioiTinh, DiaChi, SoDienThoai, Email)VALUES 
('NV001', 'Nguyen Van A', 'Nam', '123 Nguyen Du, Hanoi', '0123456789', 'nv.a@example.com'),
('NV002', 'Tran Thi B', N'Nữ', '456 Le Loi, Ho Chi Minh City', '0987654321', 'nv.b@example.com'),
('NV003', 'Pham Van C', 'Nam', '789 Nguyen Trai, Da Nang', '0369876543', 'nv.c@example.com'),
('NV004', 'Hoang Thi D', N'Nữ', '321 Tran Hung Dao, Hai Phong', '0543216789', 'nv.d@example.com'),
('NV005', 'Le Van E', 'Nam', '654 Nguyen Thi Minh Khai, Can Tho', '0765432109', 'nv.e@example.com'),
('NV006', 'Nguyen Thi F', N'Nữ', '987 Hoang Van Thu, Hue', '0912345678', 'nv.f@example.com'),
('NV007', 'Tran Van G', 'Nam', '258 Vo Thi Sau, Nha Trang', '0887654321', 'nv.g@example.com'),
('NV008', 'Pham Thi H', N'Nữ', '753 Le Lai, Da Lat', '0332145678', 'nv.h@example.com'),
('NV009', 'Hoang Van I', 'Nam', '159 Tran Phu, Quy Nhon', '0598765432', 'nv.i@example.com'),
('NV010', 'Le Thi J', N'Nữ', '852 Hoang Dieu, Vung Tau', '0945678901', 'nv.j@example.com');
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

select * from tbl_KhachHang




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

select * from tbl_KhachHang
exec SearchKhachHang 2,2,'',''

ALTER PROCEDURE SearchKhachHang
    @PageIndex INT,
    @PageSize INT,
    @TenKhachHang NVARCHAR(50),
    @DiaChi NVARCHAR(100)
AS
BEGIN
    -- Tạo bộ phận trang
    DECLARE @StartRow INT, @EndRow INT
    SET @StartRow = (@PageIndex - 1) * @PageSize + 1
    SET @EndRow = @StartRow + @PageSize - 1

    -- Tạo bảng tạm để lưu trữ kết quả
    CREATE TABLE #TempResult (
        MaKhachHang char(10),
        TenKhachHang NVARCHAR(50),
        GioiTinh NVARCHAR(10),
        DiaChi NVARCHAR(100),
        SoDienThoai NVARCHAR(10)
    )
    -- Tìm kiếm khách hàng theo tiêu chí
    INSERT INTO #TempResult (MaKhachHang, TenKhachHang, GioiTinh, DiaChi, SoDienThoai)
    SELECT MaKhachHang, TenKhachHang, GioiTinh, DiaChi, SoDienThoai
    FROM tbl_KhachHang
    WHERE (TenKhachHang LIKE '%' + @TenKhachHang + '%' OR @TenKhachHang IS NULL)
        AND (DiaChi LIKE '%' + @DiaChi + '%' OR @DiaChi IS NULL)

    -- Lấy tổng số bản ghi
    DECLARE @Total INT
    SET @Total = (SELECT COUNT(*) FROM #TempResult)

    -- Trả về kết quả phân trang
    SELECT *
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY MaKhachHang) AS RowNumber, *
        FROM #TempResult
    ) AS PagedResult
    WHERE RowNumber BETWEEN @StartRow AND @EndRow

    -- Xóa bảng tạm
    DROP TABLE #TempResult
END
EXEC SearchKhachHang 1,3,'Nguyen Van A','Hanoi'

create proc Proc_getkh 
@MaKhachHang nvarchar(10)
as
BEGIN
    select* FROM tbl_KhachHang WHERE MaKhachHang =@MaKhachHang
END
GO



/*Phan trang tim kiem kach hang*/
ALTER PROCEDURE Proc_KhachHang (
	@page_index  INT, 
	@page_size   INT,
	@ten_khach Nvarchar(50),
	@dia_chi varchar(100)
)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKhachHang ASC)) AS RowNumber, 
                              k.MaKhachHang,
							  k.TenKhachHang,
							  k.DiaChi,
							  k.GioiTinh,
							  k.SoDienThoai
                        INTO #Results1
                        FROM tbl_KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKhachHang like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1
						ORDER BY #Results1.MakhachHang asc
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKhachHang ASC)) AS RowNumber, 
                              k.MaKhachHang,
							  k.TenKhachHang,
							  k.DiaChi,
							  k.GioiTinh,
							  k.SoDienThoai
                        INTO #Results2
                        FROM tbl_KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKhachHang like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
        END;
    END;

	select * from tbl_KhachHang

	exec Proc_KhachHang 1,3,'Nguyen','Hanoi'

/-------------------------------------------------------nhan vien -----------------------------------------------------------/
/*Nhan vien */

/*Thủ tục thêm khách hàng */
CREATE PROC Proc_themnv
@MaNhanVien char(10),
@TenNhanVien Nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi Nvarchar(10),
@SoDienThoai varchar(15),
@Email char(30)
AS
BEGIN
    INSERT INTO tbl_NhanVien
    VALUES(  @MaNhanVien,@TenNhanVien,@GioiTinh,@DiaChi,@SoDienThoai,@Email)
END
GO
-----gọi thủ tục
exec Proc_themnv'NV012',N'NGUYEN HOANG MINH DUC','Nam','Ha noi','0987654321','duc611@gmail.com';
SELECT * FROM tbl_NhanVien

/*Sửa nhan vien  */
ALTER PROC Proc_suanv
@MaNhanVien char(10),
@TenNhanVien Nvarchar(50),
@GioiTinh nvarchar(10),
@DiaChi Nvarchar(10),
@SoDienThoai varchar(15),
@Email char(30)
AS
BEGIN
    UPDATE tbl_NhanVien SET TenNhanVien = @TenNhanVien, GioiTinh = @GioiTinh,DiaChi = @DiaChi, SoDienThoai = @SoDienThoai, Email = @Email
    WHERE MaNhanVien = @MaNhanVien
END
GO
-----gọi thủ tục sửa 
exec Proc_suanv 'NV012','Nguyen Hoang Minh Duc','Nam','Hung Yen','0123456789','duc123@gmail.com';
SELECT * FROM tbl_NhanVien

/*Xóa nhan vien  */
CREATE PROC Proc_xoanv
@MaNhanVien char(10)
AS
BEGIN
    DELETE FROM tbl_NhanVien WHERE MaNhanVien =@MaNhanVien
END
GO
----gọi thủ tục xoá mã khách “KH012”
exec Proc_xoanv 'NV012'


ALTER PROC SearchNhanVien
    @PageIndex INT,
    @PageSize INT,
    @TenNhanVien NVARCHAR(50),
    @DiaChi NVARCHAR(100)
AS
BEGIN
    -- Tạo bộ phận trang
    DECLARE @StartRow INT, @EndRow INT
    SET @StartRow = (@PageIndex - 1) * @PageSize + 1
    SET @EndRow = @StartRow + @PageSize - 1

    -- Tạo bảng tạm để lưu trữ kết quả
    CREATE TABLE #TempResult (
        MaNhanVien CHAR(10),
        TenNhanVien NVARCHAR(50),
        GioiTinh NVARCHAR(10),
        DiaChi NVARCHAR(100),
        SoDienThoai NVARCHAR(10),
		Email CHAR(30)
    )
    -- Tìm kiếm khách hàng theo tiêu chí
    INSERT INTO #TempResult (MaNhanVien, TenNhanVien, GioiTinh, DiaChi, SoDienThoai,Email)
    SELECT MaNhanVien, TenNhanVien, GioiTinh, DiaChi, SoDienThoai,Email
    FROM tbl_NhanVien
    WHERE (TenNhanVien LIKE '%' + @TenNhanVien + '%' OR @TenNhanVien IS NULL)
        AND (DiaChi LIKE '%' + @DiaChi + '%' OR @DiaChi IS NULL)

    -- Lấy tổng số bản ghi
    DECLARE @Total INT
    SET @Total = (SELECT COUNT(*) FROM #TempResult)

    -- Trả về kết quả phân trang
    SELECT *
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY MaNhanVien) AS RowNumber, *
        FROM #TempResult
    ) AS PagedResult
    WHERE RowNumber BETWEEN @StartRow AND @EndRow

    -- Xóa bảng tạm
    DROP TABLE #TempResult
END
EXEC SearchNhanVien 1,3,'Nguyen Van A','Hanoi'

/*Phan trang tim kiem kach hang*/
CREATE PROCEDURE Proc_NhanVien (
	@page_index  INT, 
	@page_size   INT,
	@ten_nhanvien Nvarchar(50),
	@dia_chi varchar(100)
)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenNhanVien ASC)) AS RowNumber, 
                              k.MaNhanVien,
							  k.TenNhanVien,
							  k.DiaChi,
							  k.GioiTinh,
							  k.SoDienThoai,
							  k.Email
                        INTO #Results1
                        FROM tbl_NhanVien AS k
					    WHERE  (@ten_nhanvien = '' Or k.TenNhanVien like N'%'+@ten_nhanvien+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1
						ORDER BY #Results1.MaNhanVien asc
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenNhanVien ASC)) AS RowNumber, 
                              k.MaNhanVien,
							  k.TenNhanVien,
							  k.DiaChi,
							  k.GioiTinh,
							  k.SoDienThoai,
							  k.Email
                        INTO #Results2
                        FROM tbl_NhanVien AS k
					    WHERE  (@ten_nhanvien = '' Or k.TenNhanVien like N'%'+@ten_nhanvien+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
        END;
    END;
	
create proc Proc_getnv 
@MaNhanVien char(10)
as
BEGIN
    select* FROM tbl_NhanVien WHERE MaNhanVien = @MaNhanVien
END
GO
select * from tbl_NhanVien
//----------------------------------------------------------------------- Product ----------------------------------------------------------------------

alter proc Proc_getsanpham
@MaSanPham char(10)
as
BEGIN
    select* FROM tbl_SanPham WHERE MaSanPham =@MaSanPham
END
GO

ALTER PROC Proc_getname
@TenSanPham nvarchar(50)
as 
begin 
	SELECT * FROM tbl_SanPham WHERE TenSanPham = @TenSanPham;
END
GO
select * from tbl_sanpham

EXEC Proc_getname @TenSanPham = N'Máy tính';

alter PROC Proc_themsanpham
@TenSanPham Nvarchar(50),
@MaLoaiHang int,
@SoLuong int,
@MoTa varchar(100)
AS
BEGIN
    INSERT INTO tbl_SanPham (TenSanPham, MaLoaiHang, SoLuong, MoTa)
    VALUES (@TenSanPham, @MaLoaiHang, @SoLuong, @MoTa)
END

exec Proc_themsanpham 4, N'May tinh bang', 5, 10, 'La may tinh danh cho dan ki thuat';

select * from tbl_sanpham
select * from tbl_HoaDon
select * from tbl_ChiTietHoaDon
select * from tbl_KhachHang

ALTER PROC Proc_Suasp
@MaSanPham int,
@TenSanPham Nvarchar(50),
@MaLoaiHang char(10),
@SoLuong int,
@MoTa varchar(100)
AS
BEGIN
    UPDATE tbl_SanPham SET TenSanPham = @TenSanPham, MaLoaiHang = @MaLoaiHang, SoLuong = @SoLuong, MoTa = @MoTa
    WHERE MaSanPham = @MaSanPham
END
-----gọi thủ tục sửa 
exec Proc_Suasp 11,N'Máy tính của dân IT','6','100',N'Máy tính này có nhiều thứ thật thú zị '

select * from tbl_SanPham


ALTER PROCEDURE Proc_SanPham (
	@page_index INT, 
	@page_size INT,
	@ten_sanpham Nvarchar(50)
)
AS
BEGIN
    DECLARE @RecordCount BIGINT;
    IF (@page_size <> 0)
    BEGIN
        SET NOCOUNT ON;
        SELECT
            (ROW_NUMBER() OVER (ORDER BY TenSanPham ASC)) AS RowNumber,
            sp.MaSanPham,
            sp.TenSanPham,
            sp.MaLoaiHang,
            sp.SoLuong,
            sp.MoTa
        INTO #Results1
        FROM tbl_SanPham AS sp
        WHERE (@ten_sanpham = '' OR sp.TenSanPham LIKE '%' + @ten_sanpham + '%');

        SELECT @RecordCount = COUNT(*)
        FROM #Results1;

        SELECT *,
            @RecordCount AS RecordCount
        FROM #Results1
        WHERE ROWNUMBER BETWEEN (@page_index - 1) * @page_size + 1
        AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
        OR @page_index = -1
        ORDER BY #Results1.TenSanPham ASC;

        DROP TABLE #Results1;
    END;
    ELSE
    BEGIN
        SET NOCOUNT ON;
        SELECT
            (ROW_NUMBER() OVER (ORDER BY TenSanPham ASC)) AS RowNumber,
            sp.MaSanPham,
            sp.TenSanPham,
            sp.MaLoaiHang,
            sp.SoLuong,
            sp.MoTa
        INTO #Results2
        FROM tbl_SanPham AS sp
        WHERE (@ten_sanpham = '' OR sp.TenSanPham LIKE '%' + @ten_sanpham + '%');

        SELECT @RecordCount = COUNT(*)
        FROM #Results2;

        SELECT *,
            @RecordCount AS RecordCount
        FROM #Results2;

        DROP TABLE #Results1;
    END;
END;

	select * from tbl_SanPham

	exec Proc_SanPham 1,3,N'Máy tính '

CREATE PROC Proc_xoasp
@MaSanPham nvarchar(10)
AS
BEGIN
    DELETE FROM tbl_SanPham WHERE MaSanPham =@MaSanPham
END
GO

exec Proc_xoasp 'SP006'

-----------------------------------------------------------------------------------------hoa don --------------------------------------------------------------------------------------------------------
-- get by id 
CREATE PROC Proc_sp_hoadon_get_by_id(@MaHoaDon int)
AS
    BEGIN
        SELECT h.*, 
        (
            SELECT c.*
            FROM tbl_ChiTietHoaDon AS c
            WHERE h.MaHoaDon = c.MaHoaDon FOR JSON PATH
        ) AS list_json_chitiethoadon
        FROM tbl_HoaDon AS h
        WHERE
		
		h.MaHoaDon = @MaHoaDon;
    END;
GO
-- create hóa đơn 
ALTER PROC Proc_sp_hoadon_create
(@TenKhachHang   NVARCHAR(50), 
 @GioiTinh		 bit, 
 @DiaChi		 NVARCHAR(250), 
 @TrangThai		 bit,  
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaHoaDon INT;
        INSERT INTO tbl_HoaDon
                (TenKhachHang, 
				 GioiTinh,
                 Diachi,  
                 TrangThai              
                )
                VALUES
                (@TenKhachHang, 
				 @GioiTinh,
                 @DiaChi, 
                 @TrangThai
                );

				SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitiethoadon IS NOT NULL)
                    BEGIN
                        INSERT INTO tbl_ChiTietHoaDon
						 (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia               
                        )
                    SELECT JSON_VALUE(p.value, '$.maSanPham'), 
                            @MaHoaDon, 
                            JSON_VALUE(p.value, '$.soLuong'), 
                            JSON_VALUE(p.value, '$.tongGia')    
                    FROM OPENJSON(@list_json_chitiethoadon) AS p;
                END;
        SELECT '';
    END;

	select * from tbl_SanPham
	select * from tbl_HoaDon
	select * from tbl_ChiTietHoaDon

-- update hóa đơn
CREATE  PROC Proc_sp_hoa_don_update
(@MaHoaDon        int, 
 @TenKhachHang    NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @TrangThai       bit,  
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE tbl_HoaDon
		SET
			TenKhachHang  = @TenKhachHang,
			Diachi = @Diachi,
			TrangThai = @TrangThai
		WHERE MaHoaDon = @MaHoaDon;
		
		IF(@list_json_chitiethoadon IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDon,
			  JSON_VALUE(p.value, '$.maHoaDon') as maHoaDon,
			  JSON_VALUE(p.value, '$.maSanPham') as maSanPham,
			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
			  JSON_VALUE(p.value, '$.tongGia') as tongGia,
			  JSON_VALUE(p.value, '$.status') AS status 
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitiethoadon) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO tbl_ChiTietHoaDon (
						  MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia ) 
			   SELECT
				  #Results.maSanPham,
				  @MaHoaDon,
				  #Results.soLuong,
				  #Results.tongGia			 
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE tbl_ChiTietHoaDon 
			  SET
				 SoLuong = #Results.soLuong,
				 TongGia = #Results.tongGia
			  FROM #Results 
			  WHERE  tbl_ChiTietHoaDon.MaChiTietHoaDon = #Results.MaChiTietHoaDon AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM tbl_ChiTietHoaDon C
			INNER JOIN #Results R
				ON C.MaChiTietHoaDon=R.MaChiTietHoaDon
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;
/---------------------------------------------------------- thong ke khach ---------------------------------------------------------

create PROC Proc_sp_thong_ke_khach (
			@page_index  INT, 
            @page_size   INT,
			@ten_khach Nvarchar(50),
			@fr_NgayTao datetime, 
			@to_NgayTao datetime
)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.TongGia,
							  h.NgayTao,
							  h.TenKhachHang,
							  h.Diachi
                        INTO #Results1
                        FROM tbl_HoaDon  h
						inner join tbl_ChiTietHoaDon c on c.MaHoaDon = h.MaHoaDon
						inner join tbl_SanPham s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKhachHang like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
                            AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))              
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.TongGia,
							  h.NgayTao,
							  h.TenKhachHang,
							  h.Diachi
                        INTO #Results2
                        FROM HoaDons  h
						inner join tbl_ChiTietHoaDon c on c.MaHoaDon = h.MaHoaDon
						inner join tbl_SanPham s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKhachHang like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))              
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2                        
                        DROP TABLE #Results2; 
        END;
    END;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE Proc_GetAllKhachHang
AS
BEGIN
    SELECT * FROM tbl_KhachHang;
END;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE Proc_GetAllNhanVien
AS
BEGIN
    SELECT * FROM tbl_NhanVien;
END;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE Proc_GetAllSanPham
AS
BEGIN
    SELECT * FROM tbl_SanPham;
END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*tai khoan */
ALTER PROCEDURE Proc_login(@taikhoan nvarchar(50), @matkhau nvarchar(50))
AS
    BEGIN
      SELECT  *
      FROM tbl_TaiKhoan
      where TenTaiKhoan= @taikhoan and MatKhau = @matkhau;
    END;

	exec Proc_login 'admin','admin';
	exec Proc_login 'user','user'


-- Xóa bảng hóa đơn 
ALTER PROC Proc_xoasp
@MaChiTietHoaDon int
AS
BEGIN
    DECLARE @MaHoaDonToDelete int
    SELECT @MaHoaDonToDelete = MaHoaDon FROM tbl_ChiTietHoaDon WHERE MaChiTietHoaDon = @MaChiTietHoaDon

    DELETE FROM tbl_ChiTietHoaDon WHERE MaChiTietHoaDon = @MaChiTietHoaDon
    DELETE FROM tbl_HoaDon WHERE MaHoaDon = @MaHoaDonToDelete
END
GO

select * from tbl_SanPham
select * from tbl_HoaDon
select * from tbl_ChiTietHoaDon

-- Tạo lấy sản phẩm bán chạy theo số lượng 
ALTER PROC Proc_getsanphambanchay
	@top int
AS
BEGIN
    -- Lấy ra các sản phẩm có số lượng lớn hơn 100
    SELECT Top(@top)* FROM tbl_SanPham WHERE SoLuong >= 100; 
END
---------------------------------------------------------------------------------------slide -----------------------------------------------

CREATE PROC GetSlides
AS
BEGIN
    SELECT * FROM tbl_Slide;
END;