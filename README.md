# bai_tap_02

### Họ và tên : Vũ Thị Ánh Tuyết - K235480106078

### Lớp : K59.KMT.K01

# *BÀI KIỂM TRA SÔ 2 *

# Phần 1 : Thiết kế và Khởi tạo cấu trúc dữ liệu 

#### 1.1. Khởi tạo bảng . E chọn đề tài quản lí thư viện vào tạo database với tên [Tên dự án]_[Mã sv] ( QuanLyThuVien_K235480106078)

<img width="1915" height="1079" alt="image" src="https://github.com/user-attachments/assets/08e234c1-a4a5-437e-b247-86ea2eedb2fb" />

#### 1.2 Tạo 4 bảng có quan hệ với nhau .Yêu cầu :

  - Sử dụng đa dạng các kiểu dữ liệu (Số nguyên, số thực, chuỗi ký tự Unicode, ngày tháng, tiền tệ, ...).

  - Áp dụng đúng quy tắc đặt tên (BướuLạcĐà).

  - Sử dụng cặp ngoặc [ ] để bọc tên bảng và tên trường trong script khởi tạo.

  - Có giải thích chỗ nào là PK, chỗ nào là FK, trường nào có ràng buộc cứng CK
 
  ``` sql
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
```
  <img width="1898" height="1056" alt="image" src="https://github.com/user-attachments/assets/bb80dc5d-abd1-47da-a270-13615e933849" />

Chú thích : Ảnh này cho thấy tôi đã tạo 4 bảng thành công và đúng theo kiểu dữ liệu yêu cầu

Ngoài ra, e có dùng lệnh insert để thêm dữ liệu mẫu .

``` sql
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
```

# Phần 2 :Xây dựng FUNCTION .

### 2.1.Hãy cho biết trong SQL Server có những loại function build_in (hàm có sẵn) nào, nêu 1 vài system function build_in mà em tìm hiểu được (ko cần nhiều, cần đặc sắc theo góc nhìn của em), cho SQL khai thác các hàm đó.

Built_in Function là hàm có sẵn trong SQL SEVER, dùng để xử lí dữ liệu nhanh mà không cần tự viết.

Một số built_in function phổ biến như : string functions ( xử lí chuỗi ), date functions (xử lí ngày tháng ), Aggregate functions (tính tổng hợp ), System functions ( lấy thông tin hệ thống ) .... Một số built_in function đặc sắc theo góc nhìn của em :

- GETDATE() _ lấy ngày giờ hiện tại:
  ``` sql
  SELECT GETDATE() AS [NgayHienTai]
  ```
  <img width="1895" height="1069" alt="image" src="https://github.com/user-attachments/assets/c76c92f6-fa9a-47d4-ad76-9511e9768dfb" />
Chú thích : Ảnh này cho thấy tôi đã khai thác hàm GETDATE() thành công.

- UPPER() _ Viết hoa chuỗi.
 ```sql
  SELECT UPPER([TenSinhVien]) AS [TenInHoa]
  FROM [SinhVien]
  ```
<img width="1911" height="1061" alt="image" src="https://github.com/user-attachments/assets/2fcc6f87-ff81-4931-ac6f-81af5d7eaa57" />
 Chú Thích : Ảnh này cho thấy tôi đã khai thác thành công hàm UPPER.

 - DATEDIFF() _Tính khoảng cách thời gian.
  ``` sql
      SELECT [MaPhieu],
      DATEDIFF(DAY,[NgayMuon],[NgayTra]) AS [SoNgayMuon]
      FROM [PhieuMuon]
```
   <img width="1898" height="1062" alt="image" src="https://github.com/user-attachments/assets/7cd7388d-154a-4f5b-a6bb-f65334562efc" />

Chú thích : Ảnh này cho thấy tôi đã khai thác thành công hàm DATEDIFF.


### 2.2.Hàm do người dùng tự viết trong SQL thường mang mục đích gì? Nó có những loại nào? Mỗi loại thường được dùng khi nào? Tại sao có nhiều system function rồi mà vẫn cần tự viết fn riêng?

* MỤC ĐÍCH :
  - Tái sử dụng logic nhiều lần.
  - Code gọn hơn , xử lí nghiệp vụ riêng của bài toán.
  - Dễ bảo trì , nâng cấp.
  - Chuẩn hóa thao tác tính toán.
* Có system function rồi vẫn cần tự viết fn riêng là vì hàm có sãn chỉ xử lí chung chung, bài toán thực tế cần logic riêng. ví dụ như tính tiền phạt trả
  muộn, liệt kê sách còn hàng... những việc này phải tự viết function.
  
* Các loại tự viết trong SQL :
  
  - Scalar Function : trả về 1 giá trị thường dùng khi tính toán 1 kết quả.
    
  - Inline Table-Valued Function : trả về 1 bảng ( 1 SELECT) thường dùng khi lọc danh sách đơn giản.
    
  - MuLti-statement TVF : trả về 1 bảng (nhiều bước xử lí ) thường dùng khi logic phức tạp.
  

#### 2.2.1. Viết 01 Scalar Function (Hàm trả về một giá trị): Đưa ra 1 logic cho cơ sở dữ liệu của em, mà cần dùng đến function này. (SV TỰ NGHĨ RA YÊU CẦU CỦA HÀM VÀ VIẾT HÀM GIẢI QUYẾT NÓ)
```sql
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
```
<img width="1911" height="1060" alt="image" src="https://github.com/user-attachments/assets/34932d59-30f2-4c8f-81e2-ef6519e6ca28" />
Chú thích: Ảnh này đã cho thấy em đã tạo Scalar Function thành công.

Sau khi đã có hàm, em đã viết câu lệnh sql khai thác hàm đó.
```sql
SELECT
    [MaPhieu],
    dbo.[Fn_TinhSoNgayMuon]([MaPhieu]) AS [SoNgayMuon]
FROM [PhieuMuon]
GO
```
<img width="1906" height="1077" alt="image" src="https://github.com/user-attachments/assets/4b924de0-fb76-4e74-97bb-9b9fffb48ad9" />
Chú thích : Ảnh này đã cho thấy em viết câu lệnh sql khai thác hàm thành công.


#### 2.2.2.Viết 01 Inline Table-Valued Function: Trả về danh sách các bản ghi theo một điều kiện lọc cụ thể (SV TỰ NGHĨ RA YÊU CẦU CỦA HÀM VÀ VIẾT HÀM GIẢI QUYẾT NÓ)
```sql
CREATE FUNCTION [Fn_DanhSachSachConNhieu]
(
    @SoLuongToiThieu INT
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
```
<img width="1914" height="1078" alt="image" src="https://github.com/user-attachments/assets/b43e7a66-8375-47be-adbb-6488d292f258" />
Chú thích : Ảnh này cho thấy e đã tạo hàm thành công.

Sau khi đã có hàm, em sẽ viết câu lệnh sql khai thác hàm.
```sql
SELECT *
FROM dbo.[Fn_DanhSachSachConNhieu](10)
GO
```
<img width="1908" height="1077" alt="image" src="https://github.com/user-attachments/assets/32c78613-2c48-4d35-850c-7f2ce16d442c" />
Chú thích : Ảnh này cho thấy tôi đã khai thác hàm thành công.

#### 2.2.3.Viết 01 Multi-statement Table-Valued Function: Thực hiện xử lý logic phức tạp bên trong (có sử dụng biến bảng) trước khi trả về kết quả. (SV TỰ NGHĨ RA YÊU CẦU CỦA HÀM VÀ VIẾT HÀM GIẢI QUYẾT NÓ)
```sql
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
```
<img width="1914" height="1071" alt="image" src="https://github.com/user-attachments/assets/ae08c8a7-ae26-402d-8b37-40dfc5df1fe1" />
Chú thích: Ảnh này cho thấy em đã tạo hàm thành công.

Sau khi đã có hàm, em sẽ khai thác hàm.
```sql
SELECT *
FROM dbo.[Fn_ThongKeMuonTheoSinhVien]()
GO
```
<img width="1912" height="1078" alt="image" src="https://github.com/user-attachments/assets/12121c0a-e6ea-49a9-9aea-6119ef049170" />
Chú thích: Ảnh này cho thấy em đã khai thác hàm thành công.


# Phần 3: Xây dựng Store Procedure.

* Trong SQL Server có rất nhiều System Store Procedure (SP hệ thống), thường nằm trong database ```master``` , dùng để quản trị hệ thống, kiểm tra metadata, backup, security...
  
* Một số SP tiêu biểu như :
 
  - sp_help : dùng để xem thông tin của bảng, kiểu dữ liệu, cột,khóa...
    
  - sp_rename : dùng để đổi tên bảng hoặc cột.
    
  - sp_tables : dùng để liệt kê bảng trong database.
    
  - sp_databases : dùng để xem danh sách databases.
    
### 3.1.Viết 01 Store Procedure đơn giản để thực hiện lệnh INSERT hoặc UPDATE dữ liệu, có kiểm tra điều kiện logic (SV TỰ NGHĨ RA YÊU CẦU CỦA SP VÀ VIẾT SP GIẢI QUYẾT NÓ).

* Yêu cầu:
  
  - Không trùng mã phiếu.
    
  - Sinh viên phải tồn tại .
    
  - Sách phải tồn tại.
    
  - Số lượng mượn > 0.
```sql
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
```
<img width="1910" height="1075" alt="image" src="https://github.com/user-attachments/assets/07cd4e50-208d-400c-8cca-e6ffdedbb9cc" />
Chú thích :Ảnh này cho thấy em đã tạo SP và dùng lệnh insert thành công

Sau đó, em sẽ viết lệnh giải quyết SP.
```sql
EXEC [Sp_ThemPhieuMuon]
N'999',
N'1956210100',
N'PLDC',
1,
'2024-01-01',
'2024-01-05',
50000
GO
```
<img width="1903" height="1079" alt="image" src="https://github.com/user-attachments/assets/955ca225-5e72-4f8b-9b73-0f374ce718aa" />
Chú thích : Ảnh này cho thấy em đã giải quyết được .

### 3.2.Viết 01 Store Procedure có sử dụng tham số OUTPUT để trả về một giá trị tính toán (SV TỰ NGHĨ RA YÊU CẦU CỦA SP VÀ VIẾT SP GIẢI QUYẾT NÓ, SP NÀY CÓ DÙNG THAM SỐ LOẠI OUTPUT).
* Yêu cầu : Tính tổng tiền cọc của 1 sinh viên.
  ```sql
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
`
 <img width="1906" height="1062" alt="image" src="https://github.com/user-attachments/assets/5964359c-1102-411c-a76b-87a827faa750" />
Chú thích : Ảnh này cho thấy em đã tạo được SP có tham số loại Output thành công.

Tiếp theo em sẽ giải quyết yêu cầu.

```sql
  DECLARE @Tong MONEY
  EXEC [Sp_TongTienCoc]
  N'1956210100',
  @Tong OUTPUT
  PRINT @Tong
  GO
```
<img width="1897" height="1072" alt="image" src="https://github.com/user-attachments/assets/7bf2b0ac-f73d-4bd6-9760-175132ecddd4" />
Chú thích : Ảnh này cho thấy em đã giải quyết thành công.

### 3.3.Viết 01 Store Procedure trả về một tập kết quả (Result set) từ lệnh SELECT sau khi đã join nhiều bảng. (SV TỰ NGHĨ RA YÊU CẦU CỦA SP VÀ VIẾT SP GIẢI QUYẾT NÓ)
```sql
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
```
<img width="1911" height="1078" alt="image" src="https://github.com/user-attachments/assets/ab88da8d-16c7-4a1e-9e26-2ffe237f6d92" />
Chú thích : Ảnh này cho thấy em đã set join nhiều bảng thành công.

Sau đó em sẽ khai thác để cho trả về 1 tập kết quả.
```sql
EXEC [Sp_DanhSachMuonSach]
GO
```
<img width="1904" height="1073" alt="image" src="https://github.com/user-attachments/assets/87773643-ddbd-46a6-b7ed-57396bbbdc71" />
Chú thích : Ảnh này cho thấy em đã khai hác trả về 1 tập kết quả.

* Yêu cầu : Hiện thị danh sách sinh viên mượn quá hạn.
```sql
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
```
<img width="1908" height="1071" alt="image" src="https://github.com/user-attachments/assets/b2494b24-4582-456e-9ba5-0e7fc88365b0" />
Chú thích : Ảnh này cho thấy em đã giải quyết được yêu cầu tự mình đề ra.
