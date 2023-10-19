CREATE DATABASE BTL_NGUYENMINHDUC
GO 
USE BTL_NGUYENMINHDUC
GO
-- Bảng Chi Tiết Hóa Đơn
CREATE TABLE tbl_ChiTietHoaDon (
    MaChiTietHoaDon int IDENTITY(1,1) not null,
    MaHoaDon int ,
    MaSanPham char(10), 
    SoLuong int,
    TongGia decimal(18, 0),
    CONSTRAINT PK_MaChiTietHoaDon PRIMARY KEY (MaChiTietHoaDon),
    CONSTRAINT FK_MaHoaDon_ChiTietHoaDon FOREIGN KEY (MaHoaDon) REFERENCES tbl_HoaDon(MaHoaDon),
    CONSTRAINT FK_MaSanPham_ChiTietHoaDon FOREIGN KEY (MaSanPham) REFERENCES tbl_SanPham(MaSanPham)
);

-- Bảng Hóa Đơn
CREATE TABLE tbl_HoaDon (
    MaHoaDon int IDENTITY(1,1) not null,
    TongGia decimal(18, 0) not null,
    NgayTao datetime null,
    NgayDuyet datetime null,
    TenKhachHang NVARCHAR(50) not null,
    GioiTinh nvarchar(10),
    DiaChi nvarchar(250),
    SoDienThoai nvarchar(10),
	TrangThai bit null
    CONSTRAINT PK_MaHoaDon PRIMARY KEY (MaHoaDon)
);
GO



-- Bảng Sản Phẩm
CREATE TABLE tbl_SanPham (
    MaSanPham char(10) CONSTRAINT PK_MSP PRIMARY KEY (MaSanPham) not null,
    TenHang NVARCHAR(50) null,
    MaLoaiHang char(10) not null,
    SoLuong INT not null,
    MoTa VARCHAR(100) not null
);
GO
ALTER TABLE tbl_SanPham
ADD TrangThai bit null;


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
GO

-- Thêm dữ liệu các loại tài khoản 
INSERT INTO LoaiTaiKhoan (LoaiTaiKhoanID, TenLoaiTaiKhoan)
VALUES (1, N'Admin'),
       (2, N'Người dùng');

-- Thêm dữ liệu vào bảng sản phẩm 
INSERT INTO tbl_SanPham (MaSanPham, TenHang, MaLoaiHang, SoLuong, MoTa, TrangThai)
VALUES
    ('SP001', N'Máy tính ', 'LH001', 100, N'Máy tính dành cho dân văn phòng ',1),
    ('SP002', N'Máy tính ', 'LH002', 50, N'Máy tính dành cho game thủ ',0),
    ('SP003', N'Điện Thoại ', 'LH001', 75, N'Điện thoại Iphone 15',0),
    ('SP004', N'Laptop', 'LH003', 120, N'Laptop dành cho đồ họa',1);

	DELETE FROM tbl_SanPham;

-- Thêm một bản ghi vào bảng tbl_HoaDon
INSERT INTO tbl_HoaDon (MaHoaDon, TongGia, NgayTao, NgayDuyet, TenKhachHang, GioiTinh, DiaChi, SoDienThoai, TrangThai)
VALUES
    (1, 1000, '2023-10-12', '2023-10-15', N'Manh Cuong', N'Nam', N'Sai Gon', N'1234567890', 1);


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

ALTER PROCEDURE Proc_login(@taikhoan nvarchar(50), @matkhau nvarchar(50))
AS
    BEGIN
      SELECT  *
      FROM tbl_TaiKhoan
      where TenTaiKhoan= @taikhoan and MatKhau = @matkhau;
    END;

	exec Proc_login 'admin','admin';
	exec Proc_login 'user','user'



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


//----------------------------------------------------------------------- Product ----------------------------------------------------------------------

alter proc Proc_getsanpham
@MaSanPham char(10)
as
BEGIN
    select* FROM tbl_SanPham WHERE MaSanPham =@MaSanPham
END
GO


CREATE PROC Proc_themsanpham
@MaSanPham char(10),
@TenHang Nvarchar(50),
@MaLoaiHang char(10),
@SoLuong int,
@MoTa varchar(100)
AS
BEGIN
    INSERT INTO tbl_SanPham
    VALUES(  @MaSanPham,@TenHang,@MaLoaiHang,@SoLuong,@MoTa)
END
GO
exec Proc_themsanpham'SP005',N'Máy tính bảng ','LH005','10',N'Là máy tính phù hợp cho những tác vụ giải trí';

CREATE PROC Proc_Suasp
@MaSanPham char(10),
@TenHang Nvarchar(50),
@MaLoaiHang char(10),
@SoLuong int,
@MoTa varchar(100)
AS
BEGIN
    UPDATE tbl_SanPham SET MaSanPham = @MaSanPham, TenHang = @TenHang, MaLoaiHang = @MaLoaiHang, SoLuong = @SoLuong,MoTa = @MoTa
    WHERE MaSanPham = @MaSanPham
END
GO
-----gọi thủ tục sửa 
exec Proc_Suasp'SP005',N'Máy tính của dân IT','LH005','100',N'Máy tính này có nhiều thứ thật thú zị '

select * from tbl_SanPham


ALTER PROCEDURE Proc_SanPham (
	@page_index  INT, 
	@page_size   INT,
	@ten_hang Nvarchar(50)
)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenHang ASC)) AS RowNumber, 
                              sp.MaSanPham,
							  sp.TenHang,
							  sp.MaLoaiHang,
							  sp.SoLuong,
							  sp.MoTa
                        INTO #Results1
                        FROM tbl_SanPham AS sp
					    WHERE  (@ten_hang = '' Or sp.TenHang like N'%'+	@ten_hang+'%')                  
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1
						ORDER BY #Results1.TenHang asc
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenHang ASC)) AS RowNumber, 
                              sp.MaSanPham,
							  sp.TenHang,
							  sp.MaLoaiHang,
							  sp.SoLuong,
							  sp.MoTa
                        INTO #Results2
                        FROM tbl_SanPham AS sp
					    WHERE  (@ten_hang = '' Or sp.TenHang like N'%'+@ten_hang+'%')             
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
        END;
    END;

	select * from tbl_SanPham

	exec Proc_SanPham 1,2,N'Máy tính '

CREATE PROC Proc_xoasp
@MaSanPham nvarchar(10)
AS
BEGIN
    DELETE FROM tbl_SanPham WHERE MaSanPham =@MaSanPham
END
GO

exec Proc_xoasp 'SP006'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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




CREATE PROC Proc_sp_hoadon_create
(@TenKhachHang   NVARCHAR(50), 
@GioiTinh nvarchar(50), 
 @DiaChi  NVARCHAR(250), 
 @TrangThai  bit,  
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


--CREATE PROCEDURE Proc_sp_hoa_don_update
--(@MaHoaDon        int, 
-- @TenKH              NVARCHAR(50), 
-- @Diachi          NVARCHAR(250), 
-- @TrangThai         bit,  
-- @list_json_chitiethoadon NVARCHAR(MAX)
--)
--AS
--    BEGIN
--		UPDATE HoaDons
--		SET
--			TenKH  = @TenKH ,
--			Diachi = @Diachi,
--			TrangThai = @TrangThai
--		WHERE MaHoaDon = @MaHoaDon;
		
--		IF(@list_json_chitiethoadon IS NOT NULL) 
--		BEGIN
--			 -- Insert data to temp table 
--		   SELECT
--			  JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDon,
--			  JSON_VALUE(p.value, '$.maHoaDon') as maHoaDon,
--			  JSON_VALUE(p.value, '$.maSanPham') as maSanPham,
--			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
--			  JSON_VALUE(p.value, '$.tongGia') as tongGia,
--			  JSON_VALUE(p.value, '$.status') AS status 
--			  INTO #Results 
--		   FROM OPENJSON(@list_json_chitiethoadon) AS p;
		 
--		 -- Insert data to table with STATUS = 1;
--			INSERT INTO ChiTietHoaDons (MaSanPham, 
--						  MaHoaDon,
--                          SoLuong, 
--                          TongGia ) 
--			   SELECT
--				  #Results.maSanPham,
--				  @MaHoaDon,
--				  #Results.soLuong,
--				  #Results.tongGia			 
--			   FROM  #Results 
--			   WHERE #Results.status = '1' 
			
--			-- Update data to table with STATUS = 2
--			  UPDATE ChiTietHoaDons 
--			  SET
--				 SoLuong = #Results.soLuong,
--				 TongGia = #Results.tongGia
--			  FROM #Results 
--			  WHERE  ChiTietHoaDons.maChiTietHoaDon = #Results.maChiTietHoaDon AND #Results.status = '2';
			
--			-- Delete data to table with STATUS = 3
--			DELETE C
--			FROM ChiTietHoaDons C
--			INNER JOIN #Results R
--				ON C.maChiTietHoaDon=R.maChiTietHoaDon
--			WHERE R.status = '3';
--			DROP TABLE #Results;
--		END;
--        SELECT '';
--    END;