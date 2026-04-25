
CREATE TABLE [Sach]
(
    [MaSach] NVARCHAR(50) NOT NULL,
    [TenSach] NVARCHAR(100) NOT NULL,
    [TacGia] NVARCHAR(100) NOT NULL,
    [NgayXuatBan] DATE,
    [NhaXuatBan] NVARCHAR(100),
    [TheLoai] NVARCHAR(50) NOT NULL,
    [SoLuong] INT NOT NULL,
    [GiaTien] MONEY NOT NULL,

    CONSTRAINT [Pk_Sach] PRIMARY KEY ([MaSach]),
    CONSTRAINT [Ck_Sach_SoLuong] CHECK ([SoLuong] >= 0),
    CONSTRAINT [Ck_Sach_GiaTien] CHECK ([GiaTien] >= 0)
);
GO

CREATE TABLE [Lop]
(
    [MaLop] NVARCHAR(50) NOT NULL,
    [TenKhoa] NVARCHAR(100) NOT NULL,
    [TenLop] NVARCHAR(100) NOT NULL,

    CONSTRAINT [Pk_Lop] PRIMARY KEY ([MaLop])
);
GO

CREATE TABLE [SinhVien]
(
    [MaSinhVien] NVARCHAR(50) NOT NULL,
    [TenSinhVien] NVARCHAR(100) NOT NULL,
    [NgaySinh] DATE NOT NULL,
    [SoDienThoai] VARCHAR(15),
    [MaLop] NVARCHAR(50) NOT NULL,
    [Tuoi] INT NOT NULL,

    CONSTRAINT [Pk_SinhVien] PRIMARY KEY ([MaSinhVien]),

    CONSTRAINT [Fk_SinhVien_Lop]
        FOREIGN KEY ([MaLop])
        REFERENCES [Lop]([MaLop])
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT [Ck_SinhVien_Tuoi]
        CHECK ([Tuoi] BETWEEN 18 AND 30)
);
GO

CREATE TABLE [PhieuMuon]
(
    [MaPhieu] NVARCHAR(50) NOT NULL,
    [MaSinhVien] NVARCHAR(50) NOT NULL,
    [MaSach] NVARCHAR(50) NOT NULL,
    [SoLuongMuon] INT NOT NULL,
    [NgayMuon] DATE NOT NULL,
    [NgayTra] DATE NOT NULL,
    [TienCoc] MONEY NULL,

    CONSTRAINT [Pk_PhieuMuon] PRIMARY KEY ([MaPhieu]),

    CONSTRAINT [Fk_PhieuMuon_SinhVien]
        FOREIGN KEY ([MaSinhVien])
        REFERENCES [SinhVien]([MaSinhVien])
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT [Fk_PhieuMuon_Sach]
        FOREIGN KEY ([MaSach])
        REFERENCES [Sach]([MaSach])
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT [Ck_PhieuMuon_SoLuongMuon]
        CHECK ([SoLuongMuon] > 0),

    CONSTRAINT [Ck_PhieuMuon_NgayTra]
        CHECK ([NgayTra] >= [NgayMuon])
);
GO


-- BẢNG SACH

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'Mac1',N'Triết học 1',N'Đại học Văn hóa','2016-01-01',N'Giáo dục',N'Sách',50,50000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'Mac2',N'Triết học 2',N'Đại học Văn hóa','2016-01-01',N'Giáo dục',N'Báo',40,45000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'Mac3',N'Triết học 3',N'Đại học Xã hội','2017-01-01',N'Văn học',N'Tạp chí',30,55000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'C++',N'Ngôn ngữ lập trình C',N'Đại học Công nghệ','2017-01-01',N'Kỹ thuật',N'Luận văn',20,120000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'Logic',N'Logic học đại cương',N'Đại học Luật','2018-01-01',N'Tổng hợp',N'Sách',25,65000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'PLDC',N'Pháp luật đại cương',N'Đại học Luật TPHCM','2014-01-01',N'Chính trị',N'Báo',15,70000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'KTMT',N'Kiến trúc máy tính',N'Đại học Kỹ thuật','2000-01-01',N'Kỹ thuật',N'Tạp chí',10,150000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'CSDL',N'Cơ sở dữ liệu',N'Đại học Thông tin','2009-01-01',N'Thông tin',N'Luận văn',35,130000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'MMT',N'Mạng máy tính',N'Đại học Khoa học','2007-01-01',N'Tự nhiên',N'Sách',25,140000)

INSERT INTO [Sach] ([MaSach],[TenSach],[TacGia],[NgayXuatBan],[NhaXuatBan],[TheLoai],[SoLuong],[GiaTien])
VALUES (N'TKW',N'Thiết kế web',N'Đại học Tự nhiên','2016-01-01',N'Khoa học',N'Tạp chí',15,110000)

-- BẢNG LOP

INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'QLTT1',N'TVTTH',N'Quản lý thông tin A')
INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'QLTT2',N'TVTTH',N'Quản lý thông tin B')
INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'TTTV1',N'TVTTH',N'Thông tin thư viện A')
INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'TTTV2',N'TVTTH',N'Thông tin thư viện B')
INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'NVP',N'NNP',N'Ngữ văn Pháp')
INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'NVA',N'NNA',N'Ngữ văn Anh')
INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'BC1',N'BCTT',N'Báo chí truyền thông 1')
INSERT INTO [Lop] ([MaLop],[TenKhoa],[TenLop]) VALUES (N'BC2',N'BCTT',N'Báo chí truyền thông 2')

-- BẢNG SINHVIEN

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210100',N'Nguyễn Minh Tuấn','2001-02-17','0372591035',N'QLTT1',19)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210104',N'Trần Cao Hoàng Thân','2001-10-30','0965062716',N'QLTT2',19)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210120',N'Giang Quốc Dũng','2001-01-11','0965062717',N'TTTV1',19)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210084',N'Phan Bá Nghị','2000-01-30','0965062718',N'TTTV2',20)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210102',N'Tạ Thị Diệu Thắm','2001-06-01','0914099822',N'BC1',19)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210109',N'Phạm Thu Trang','2001-12-06','0965062710',N'BC2',19)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210052',N'Nguyễn Ngọc Dịu Dịu','2001-05-02','0965062711',N'TTTV2',19)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210101',N'Người Lạ Vô Danh','2000-01-01','0965062712',N'NVA',20)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210001',N'Nguyễn Tuấn','1999-07-12','0965062713',N'QLTT1',21)

INSERT INTO [SinhVien] ([MaSinhVien],[TenSinhVien],[NgaySinh],[SoDienThoai],[MaLop],[Tuoi])
VALUES (N'1956210999',N'Trương Hoàng','2001-02-18','0965062714',N'QLTT2',19)


-- BẢNG PHIEUMUON

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'112',N'1956210100',N'PLDC',1,'2018-12-27','2018-12-27',50000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'212',N'1956210104',N'Logic',2,'2018-12-28','2018-12-30',60000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'346',N'1956210120',N'KTMT',3,'2018-12-26','2019-01-05',70000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'412',N'1956210084',N'C++',1,'2018-12-25','2019-01-06',50000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'125',N'1956210052',N'CSDL',4,'2018-12-24','2019-01-07',80000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'61',N'1956210102',N'Mac1',2,'2018-12-22','2019-01-08',55000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'71',N'1956210109',N'Mac2',1,'2018-12-23','2019-01-09',45000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'851',N'1956210101',N'Mac3',3,'2018-12-21','2019-01-10',60000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'912',N'1956210001',N'MMT',2,'2018-12-20','2019-01-11',65000)

INSERT INTO [PhieuMuon] ([MaPhieu],[MaSinhVien],[MaSach],[SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc])
VALUES (N'180',N'1956210999',N'TKW',3,'2018-12-27','2019-01-01',55000)
GO 


-- =====================================
-- PHẦN 2: FUNCTION
-- =====================================
SELECT GETDATE() AS [NgayHienTai]
GO

SELECT UPPER([TenSinhVien]) AS [TenInHoa]
FROM [SinhVien]
GO

SELECT [MaPhieu],
       DATEDIFF(DAY,[NgayMuon],[NgayTra]) AS [SoNgayMuon]
FROM [PhieuMuon]
GO

-- 1. Scalar Function---
CREATE FUNCTION [Fn_TinhSoNgayMuon]
(
    @MaPhieu NVARCHAR(50)
)
RETURNS INT
AS
BEGIN
    DECLARE @SoNgay INT

    SELECT @SoNgay = DATEDIFF(DAY,[NgayMuon],[NgayTra])
    FROM [PhieuMuon]
    WHERE [MaPhieu] = @MaPhieu

    RETURN @SoNgay
END
GO
--- Khai thác---
SELECT
    [MaPhieu],
    dbo.[Fn_TinhSoNgayMuon]([MaPhieu]) AS [SoNgayMuon]
FROM [PhieuMuon]
GO

---2. INLINE TABLE-VALUED FUNCTION---
CREATE FUNCTION [Fn_DanhSachSachConNhieu]
(
    @SoLuongToiThieu INT = 20
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        [MaSach],
        [TenSach],
        [SoLuong],
        [GiaTien]
    FROM [Sach]
    WHERE [SoLuong] >= @SoLuongToiThieu
)
GO

---Khai thác--
SELECT *
FROM dbo.[Fn_DanhSachSachConNhieu](10)
GO

---3.MULTI-STATEMENT TABLE FUNCTION---

CREATE FUNCTION [Fn_ThongKeMuonTheoSinhVien]()
RETURNS @KetQua TABLE
(
    [MaSinhVien] NVARCHAR(50),
    [TenSinhVien] NVARCHAR(100),
    [TongSoLuongMuon] INT
)
AS
BEGIN
    INSERT INTO @KetQua
    SELECT
        sv.[MaSinhVien],
        sv.[TenSinhVien],
        SUM(pm.[SoLuongMuon])
    FROM [SinhVien] sv
    JOIN [PhieuMuon] pm
        ON sv.[MaSinhVien] = pm.[MaSinhVien]
    GROUP BY
        sv.[MaSinhVien],
        sv.[TenSinhVien]

    RETURN
END
GO
 
---khai thác---
SELECT *
FROM dbo.[Fn_ThongKeMuonTheoSinhVien]()
GO

---PHẦN 3 :Store Procedure ----
-------------------------------
---3.1.Store Procedure INSERT----
CREATE PROCEDURE [Sp_ThemPhieuMuon]
    @MaPhieu NVARCHAR(50),
    @MaSinhVien NVARCHAR(50),
    @MaSach NVARCHAR(50),
    @SoLuongMuon INT,
    @NgayMuon DATE,
    @NgayTra DATE,
    @TienCoc MONEY
AS
BEGIN
    IF EXISTS (SELECT 1 FROM [PhieuMuon] WHERE [MaPhieu] = @MaPhieu)
    BEGIN
        PRINT N'Mã phiếu đã tồn tại'
        RETURN
    END

    IF NOT EXISTS (SELECT 1 FROM dbo.[SinhVien] WHERE dbo.[SinhVien].[MaSinhVien] = @MaSinhVien)
    BEGIN
        PRINT N'Sinh viên không tồn tại'
        RETURN
    END

    IF NOT EXISTS (SELECT 1 FROM [Sach] WHERE [MaSach] = @MaSach)
    BEGIN
        PRINT N'Sách không tồn tại'
        RETURN
    END

    IF @SoLuongMuon <= 0
    BEGIN
        PRINT N'Số lượng phải > 0'
        RETURN
    END

    INSERT INTO [PhieuMuon]
    VALUES
    (
        @MaPhieu,@MaSinhVien,@MaSach,
        @SoLuongMuon,@NgayMuon,@NgayTra,@TienCoc
    )

    PRINT N'Thêm thành công'
END
GO
---khai thác---
EXEC [Sp_ThemPhieuMuon]
N'999',
N'1956210100',
N'PLDC',
1,
'2024-01-01',
'2024-01-05',
50000
GO

---3.2.Store Procedure có OUTPUT---
CREATE PROCEDURE [Sp_TongTienCoc]
    @MaSinhVien NVARCHAR(50),
    @TongTien MONEY OUTPUT
AS
BEGIN
    SELECT @TongTien = ISNULL(SUM([TienCoc]),0)
    FROM [PhieuMuon]
    WHERE [MaSinhVien] = @MaSinhVien
END
GO

---Khai Thác---
DECLARE @Tong MONEY

EXEC [Sp_TongTienCoc]
N'1956210100',
@Tong OUTPUT

PRINT @Tong
GO

---3.3.Procedure trả về Result Set JOIN nhiều bảng---
CREATE PROCEDURE [Sp_DanhSachMuonSach]
AS
BEGIN
    SELECT
        pm.[MaPhieu],
        sv.[TenSinhVien],
        l.[TenLop],
        s.[TenSach],
        pm.[SoLuongMuon],
        pm.[NgayMuon],
        pm.[NgayTra],
        pm.[TienCoc]
    FROM [PhieuMuon] pm
    JOIN [SinhVien] sv
        ON pm.[MaSinhVien] = sv.[MaSinhVien]
    JOIN [Lop] l
        ON sv.[MaLop] = l.[MaLop]
    JOIN [Sach] s
        ON pm.[MaSach] = s.[MaSach]
END
GO
---khai thác--
EXEC [Sp_DanhSachMuonSach]
GO

---Hiển thị danh sách sinh viên mượn sách quá hạn--
CREATE PROCEDURE [Sp_SinhVienMuonQuaHan]
AS
BEGIN
    SELECT
        sv.[MaSinhVien],
        sv.[TenSinhVien],
        l.[TenLop],
        s.[TenSach],
        pm.[NgayMuon],
        pm.[NgayTra],
        DATEDIFF(DAY, pm.[NgayTra], GETDATE()) AS [SoNgayTre]
    FROM [PhieuMuon] pm
    JOIN [SinhVien] sv
        ON pm.[MaSinhVien] = sv.[MaSinhVien]
    JOIN [Lop] l
        ON sv.[MaLop] = l.[MaLop]
    JOIN [Sach] s
        ON pm.[MaSach] = s.[MaSach]
    WHERE pm.[NgayTra] < GETDATE()
END
GO
EXEC [Sp_SinhVienMuonQuaHan]
GO

---Phần 4 :TRIGGER---

---4.1.Tạo TRIGGER---
CREATE TRIGGER [Trg_KiemTraVaGiamSoLuongSach]
ON [PhieuMuon]
INSTEAD OF INSERT
AS
BEGIN
   
    IF EXISTS
    (
        SELECT 1
        FROM inserted i
        JOIN [Sach] s
            ON i.[MaSach] = s.[MaSach]
        WHERE i.[SoLuongMuon] > s.[SoLuong]
    )
    BEGIN
        RAISERROR (N'Sách không đủ số lượng để cho mượn!',16,1)
        RETURN
    END

    -- Nếu hợp lệ thì thêm phiếu mượn
    INSERT INTO [PhieuMuon]
    (
        [MaPhieu],[MaSinhVien],[MaSach],
        [SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc]
    )
    SELECT
        [MaPhieu],[MaSinhVien],[MaSach],
        [SoLuongMuon],[NgayMuon],[NgayTra],[TienCoc]
    FROM inserted

    -- Giảm số lượng sách
    UPDATE s
    SET s.[SoLuong] = s.[SoLuong] - i.[SoLuongMuon]
    FROM [Sach] s
    JOIN inserted i
        ON s.[MaSach] = i.[MaSach]
END
GO

----Khai thác hiện thị số lượng có giảm---
INSERT INTO [PhieuMuon]
VALUES
(N'833',N'1956210100',N'PLDC',2,'2024-01-01','2024-01-05',50000)
GO
SELECT * FROM [Sach]
GO
---Test khi không đủ số lượng báo lỗi--
INSERT INTO [PhieuMuon]
VALUES
(N'1000',N'1956210100',N'KTMT',50,'2024-01-01','2024-01-05',50000)
GO

---4.2.Test Trigger---
CREATE TRIGGER [Trg_A_To_B]
ON [PhieuMuon]
AFTER INSERT
AS
BEGIN
    UPDATE s
    SET s.[GiaTien] = s.[GiaTien] + 1000
    FROM [Sach] s
    JOIN inserted i
        ON s.[MaSach] = i.[MaSach]
END
GO

CREATE TRIGGER [Trg_B_To_A]
ON [Sach]
AFTER UPDATE
AS
BEGIN
    UPDATE pm
    SET pm.[TienCoc] = pm.[TienCoc] + 1000
    FROM [PhieuMuon] pm
    JOIN inserted i
        ON pm.[MaSach] = i.[MaSach]
END
GO

INSERT INTO [PhieuMuon]
VALUES (N'TEST01',N'1956210100',N'PLDC',1,'2024-01-01','2024-01-02',1000)
GO

---Phần 5: CURSOR---

---5.1.Tạo CURSOR---
DECLARE @MaPhieu NVARCHAR(50)
DECLARE @SoLuong INT
DECLARE @NgayMuon DATE
DECLARE @NgayTra DATE
DECLARE @SoNgay INT

DECLARE Cur_Phieu CURSOR FOR
SELECT [MaPhieu],[SoLuongMuon],[NgayMuon],[NgayTra]
FROM [PhieuMuon]

OPEN Cur_Phieu

FETCH NEXT FROM Cur_Phieu
INTO @MaPhieu,@SoLuong,@NgayMuon,@NgayTra

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SoNgay = DATEDIFF(DAY,@NgayMuon,@NgayTra)

    IF @SoLuong > 2
        PRINT N'Phiếu ' + @MaPhieu + N' mượn nhiều sách'

    IF @SoNgay > 7
        PRINT N'Phiếu ' + @MaPhieu + N' trả trễ'

    FETCH NEXT FROM Cur_Phieu
    INTO @MaPhieu,@SoLuong,@NgayMuon,@NgayTra
END

CLOSE Cur_Phieu
DEALLOCATE Cur_Phieu
GO

---5.2.Không dùng CURSOR---
SELECT
    [MaPhieu],
    [SoLuongMuon],
    DATEDIFF(DAY,[NgayMuon],[NgayTra]) AS [SoNgay]
FROM [PhieuMuon]
WHERE [SoLuongMuon] > 2
   OR DATEDIFF(DAY,[NgayMuon],[NgayTra]) > 7
GO
---So sánh tốc độ--
SET STATISTICS TIME ON
GO


---5.3. Ý tưởng---

DECLARE @TenSinhVien NVARCHAR(100)
DECLARE @MaPhieu NVARCHAR(50)
DECLARE @NgayTra DATE
DECLARE @SoNgayTre INT
DECLARE @TienPhat MONEY

DECLARE Cur_QuaHan CURSOR FOR
SELECT sv.[TenSinhVien], pm.[MaPhieu], pm.[NgayTra]
FROM [PhieuMuon] pm
JOIN [SinhVien] sv
ON pm.[MaSinhVien] = sv.[MaSinhVien]

OPEN Cur_QuaHan

FETCH NEXT FROM Cur_QuaHan
INTO @TenSinhVien,@MaPhieu,@NgayTra

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SoNgayTre = DATEDIFF(DAY,@NgayTra,GETDATE())
    SET @TienPhat = @SoNgayTre * 5000

    SELECT
        @TenSinhVien AS TenSinhVien,
        @MaPhieu AS MaPhieu,
        @SoNgayTre AS SoNgayTre,
        @TienPhat AS TienPhat

    FETCH NEXT FROM Cur_QuaHan
    INTO @TenSinhVien,@MaPhieu,@NgayTra
END

CLOSE Cur_QuaHan
DEALLOCATE Cur_QuaHan
GO