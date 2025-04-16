USE Hospital_Management
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Bảng Nhân viên y tế
CREATE TABLE [dbo].[NhanVienYTe](
    [MaNhanVien] [char](5) NOT NULL,
    [HoTen] [nvarchar](50) NOT NULL,
    [ChucVu] [nvarchar](30) NULL,
    [BangCap] [nvarchar](30) NULL,
    [PhongBan] [nvarchar](30) NULL,
    [LichLamViec] [nvarchar](100) NULL,
    [SoDienThoai] [char](10) NULL,
    [CanCuoc] [char](12) NULL,
    [MaKhoa] [char](50) NULL
     CONSTRAINT [PK_NhanVienYTe] PRIMARY KEY CLUSTERED 
(
    [MaNhanVien] ASC
)
) 
GO

-- Bảng Bác sĩ
CREATE TABLE [dbo].[BacSi](
    [MaBacSi] [char](5) NOT NULL,
    [HoTen] [nvarchar](50) NOT NULL,
    [MaKhoa] [char](5) NULL,
    [BangCap] [nvarchar](50) NULL,
    [KinhNghiem] [nvarchar](100) NULL,
    [SoDienThoai] [char](10) NULL,
    [MaHoSoBenhAn] [char](10) NULL,
 CONSTRAINT [PK_BacSi] PRIMARY KEY CLUSTERED 
(
    [MaBacSi] ASC
)
) 
GO

-- Bảng Bệnh nhân
CREATE TABLE [dbo].[BenhNhan](
    [MaBenhNhan] [char](10) NOT NULL,
    [HoTen] [nvarchar](50) NOT NULL,
    [NgaySinh] [date] NULL,
    [GioiTinh] [nvarchar](10) NULL,
    [DiaChi] [nvarchar](100) NULL,
    [SoDienThoai] [char](10) NULL,
    [CanCuoc] [char](12) NULL,
    [MaKhoa] [char](5) NULL,
    [MaBaoHiemYTe] [char](15) NULL,
    [HoSoBenhAn] [nvarchar](200) NULL,
    [MaPhong] [char](5) NULL,
 CONSTRAINT [PK_BenhNhan] PRIMARY KEY CLUSTERED 
(
    [MaBenhNhan] ASC
)
) 
GO

-- Bảng Lịch hẹn
CREATE TABLE [dbo].[LichHen](
    [MaLichHen] [char](10) NOT NULL,
    [MaBenhNhan] [char](10) NOT NULL,
    [MaBacSi] [char](5) NOT NULL,
    [NgayHen] [datetime] NOT NULL,
    [ThoiGianHen] [nvarchar](20) NULL,
    [TrangThai] [nvarchar](20) NULL,
     CONSTRAINT [PK_LichHen] PRIMARY KEY CLUSTERED 
(
    [MaLichHen] ASC
)
) 
GO

-- Bảng Hồ sơ bệnh án
CREATE TABLE [dbo].[HoSoBenhAn](
    [MaHoSo] [char](10) NOT NULL,
    [MaBenhNhan] [char](10) NOT NULL,
    [MaBacSi] [char](5) NULL,
    [NgayKham] [date] NULL,
    [ChuanDoan] [nvarchar](200) NULL,
    [DieuTri] [nvarchar](200) NULL,
    [MaBaoHiem] [char](15) NULL,
     CONSTRAINT [PK_HoSoBenhAn] PRIMARY KEY CLUSTERED 
(
    [MaHoSo] ASC
)
) 
GO

-- Bảng Bảo hiểm y tế
CREATE TABLE [dbo].[BaoHiemYTe](
    [MaBaoHiem] [char](15) NOT NULL,
    [LoaiBaoHiem] [nvarchar](50) NULL,
    [NgayHetHan] [date] NULL,
 CONSTRAINT [PK_BaoHiemYTe] PRIMARY KEY CLUSTERED 
(
    [MaBaoHiem] ASC
)
) 
GO

-- Bảng Phòng
CREATE TABLE [dbo].[Phong](
    [MaPhong] [char](5) NOT NULL,
    [TenPhong] [nvarchar](30) NULL,
    [LoaiPhong] [nvarchar](30) NULL,
    [SoGiuong] [int] NULL,
    [TinhTrang] [nvarchar](50) NULL
     CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
    [MaPhong] ASC
)
) 
GO

-- Bảng Hóa đơn
CREATE TABLE [dbo].[HoaDon](
    [MaHoaDon] [char](10) NOT NULL,
    [MaBenhNhan] [char](10) NOT NULL,
    [NgayLap] [date] NULL,
    [TongTien] [decimal](12, 2) NULL,
    [TrangThaiThanhToan] [nvarchar](20) NULL,
    [PhuongThucThanhToan] [nvarchar](30) NULL,
    [MaHoSo] [char](10) NULL
     CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
    [MaHoaDon] ASC
)
) 
GO

-- Bảng Đơn thuốc
CREATE TABLE [dbo].[DonThuoc](
    [MaDonThuoc] [char](10) NOT NULL,
    [MaBenhNhan] [char](10) NOT NULL,
    [MaBacSi] [char](5) NOT NULL,
    [NgayKe] [date] NULL,
    [LieuLuong] [nvarchar](100) NULL,
    [CongDung] [nvarchar](200) NULL,
    [Gia] [decimal](10, 2) NULL,
 CONSTRAINT [PK_DonThuoc] PRIMARY KEY CLUSTERED 
(
    [MaDonThuoc] ASC
)
) 
GO

-- Bảng Thuốc
CREATE TABLE [dbo].[Thuoc](
    [MaThuoc] [char](5) NOT NULL,
    [TenThuoc] [nvarchar](50) NOT NULL,
    [SoLuong] [int] NULL,
    [HanSuDung] [date] NULL,
    [CongDung] [nvarchar](200) NULL,
    [Gia] [decimal](10, 2) NULL,
    [LieuLuong] [nvarchar](100) NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
    [MaThuoc] ASC
)
) 
GO

-- Bảng Chi tiết đơn thuốc
CREATE TABLE [dbo].[CT_DonThuoc](
    [MaDonThuoc] [char](10) NOT NULL,
    [MaThuoc] [char](5) NOT NULL,
    [SoLuong] [int] NULL,
    [DonGia] [decimal](10, 2) NULL,
    [ThanhTien] [decimal](12, 2) NULL,
 CONSTRAINT [PK_CT_DonThuoc] PRIMARY KEY CLUSTERED 
(
    [MaDonThuoc] ASC,
    [MaThuoc] ASC
)
) 
GO

-- Bảng Thanh toán
-- Bảng Thanh toán
CREATE TABLE [dbo].[ThanhToan](
    [MaThanhToan] [char](10) NOT NULL,
    [MaHoaDon] [char](10) NOT NULL,
    [NgayThanhToan] [date] NULL,
    [SoTien] [decimal](12, 2) NULL,
    [TinhTrang] [nvarchar](30) NULL,
    [MaPhong] [char](5) NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
    [MaThanhToan] ASC
)
)
GO
-- Bảng Thiết Bị Y Tế
CREATE TABLE [dbo].[ThietBiYTe](
    [MaThietBi] [char](10) NOT NULL,
    [TenThietBi] [nvarchar](100) NOT NULL,
    [LoaiThietBi] [nvarchar](50),
    [TinhTrang] [nvarchar](50),
    [MaPhong] [char](5),  -- Changed from char(10) to char(5) to match Phong table
    CONSTRAINT [PK_ThietBiYTe] PRIMARY KEY CLUSTERED ([MaThietBi]),
    CONSTRAINT [FK_ThietBiYTe_Phong] FOREIGN KEY ([MaPhong]) REFERENCES [dbo].[Phong]([MaPhong])
)
GO
-- Bảng trung gian
CREATE TABLE [dbo].[BN_BS](
    [MaBenhNhan] [char](10),
    [MaBacSi] [char](5),
    [NgayKham] DATE,
    [KetQua] NVARCHAR(255),
    PRIMARY KEY ([MaBenhNhan], [MaBacSi])
)
GO

CREATE TABLE [dbo].[DT_T](
    [MaDonThuoc] [char](10),
    [MaThuoc] [char](10),
    [SoLuong] INT,
    [Gia] MONEY,
    PRIMARY KEY ([MaDonThuoc], [MaThuoc])
)
GO

CREATE TABLE [dbo].[TB_NVYT](
    [MaThietBi] [char](10),
    [MaNhanVienYTe] [char](5),
    [ThoiGianSuDung] DATETIME,
    PRIMARY KEY ([MaThietBi], [MaNhanVienYTe])
)
GO

CREATE TABLE [dbo].[BS_ThietBiYTe](
    [MaBacSi] [char](5),
    [MaThietBi] [char](10),
    PRIMARY KEY ([MaBacSi], [MaThietBi])
)
GO

CREATE TABLE [dbo].[NVYT_P](
    [MaNhanVienYTe] [char](5),
    [MaPhong] [char](10),
    [ThoiGianQuanLy] DATETIME,
    PRIMARY KEY ([MaNhanVienYTe], [MaPhong])
)
GO

CREATE TABLE [dbo].[HSBA_BS](
    [MaHoSoBenhAn] [char](10),
    [MaBacSi] [char](5),
    [QuanLy] NVARCHAR(100),
    [KetQua] NVARCHAR(255),
    PRIMARY KEY ([MaHoSoBenhAn], [MaBacSi])
)
GO

CREATE TABLE [dbo].[DT_HD](
    [MaHoaDon] [char](10),
    [MaDonThuoc] [char](10),
    [DonGia] MONEY,
    [SoLuong] INT,
    [ThanhTien] MONEY,
    PRIMARY KEY ([MaHoaDon], [MaDonThuoc])
)
GO	
-- Tạo quan hệ giữa các bảng
ALTER TABLE [dbo].[BenhNhan] WITH CHECK ADD CONSTRAINT [FK_BenhNhan_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO

ALTER TABLE [dbo].[BenhNhan] WITH CHECK ADD CONSTRAINT [FK_BenhNhan_BaoHiemYTe] FOREIGN KEY([MaBaoHiemYTe])
REFERENCES [dbo].[BaoHiemYTe] ([MaBaoHiem])
GO

ALTER TABLE [dbo].[LichHen] WITH CHECK ADD CONSTRAINT [FK_LichHen_BenhNhan] FOREIGN KEY([MaBenhNhan])
REFERENCES [dbo].[BenhNhan] ([MaBenhNhan])
GO

ALTER TABLE [dbo].[LichHen] WITH CHECK ADD CONSTRAINT [FK_LichHen_BacSi] FOREIGN KEY([MaBacSi])
REFERENCES [dbo].[BacSi] ([MaBacSi])
GO

ALTER TABLE [dbo].[HoSoBenhAn] WITH CHECK ADD CONSTRAINT [FK_HoSoBenhAn_BenhNhan] FOREIGN KEY([MaBenhNhan])
REFERENCES [dbo].[BenhNhan] ([MaBenhNhan])
GO

ALTER TABLE [dbo].[HoSoBenhAn] WITH CHECK ADD CONSTRAINT [FK_HoSoBenhAn_BacSi] FOREIGN KEY([MaBacSi])
REFERENCES [dbo].[BacSi] ([MaBacSi])
GO

ALTER TABLE [dbo].[HoSoBenhAn] WITH CHECK ADD CONSTRAINT [FK_HoSoBenhAn_Thuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO

ALTER TABLE [dbo].[Phong] WITH CHECK ADD CONSTRAINT [FK_Phong_NhanVienYTe] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVienYTe] ([MaNhanVien])
GO

ALTER TABLE [dbo].[HoaDon] WITH CHECK ADD CONSTRAINT [FK_HoaDon_BenhNhan] FOREIGN KEY([MaBenhNhan])
REFERENCES [dbo].[BenhNhan] ([MaBenhNhan])
GO

ALTER TABLE [dbo].[HoaDon] WITH CHECK ADD CONSTRAINT [FK_HoaDon_DonThuoc] FOREIGN KEY([MaDonThuoc])
REFERENCES [dbo].[DonThuoc] ([MaDonThuoc])
GO

ALTER TABLE [dbo].[DonThuoc] WITH CHECK ADD CONSTRAINT [FK_DonThuoc_BenhNhan] FOREIGN KEY([MaBenhNhan])
REFERENCES [dbo].[BenhNhan] ([MaBenhNhan])
GO

ALTER TABLE [dbo].[DonThuoc] WITH CHECK ADD CONSTRAINT [FK_DonThuoc_BacSi] FOREIGN KEY([MaBacSi])
REFERENCES [dbo].[BacSi] ([MaBacSi])
GO

ALTER TABLE [dbo].[CT_DonThuoc] WITH CHECK ADD CONSTRAINT [FK_CT_DonThuoc_DonThuoc] FOREIGN KEY([MaDonThuoc])
REFERENCES [dbo].[DonThuoc] ([MaDonThuoc])
GO

ALTER TABLE [dbo].[CT_DonThuoc] WITH CHECK ADD CONSTRAINT [FK_CT_DonThuoc_Thuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO

ALTER TABLE [dbo].[ThanhToan] WITH CHECK ADD CONSTRAINT [FK_ThanhToan_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO

ALTER TABLE [dbo].[ThanhToan] WITH CHECK ADD CONSTRAINT [FK_ThanhToan_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO

-- Chèn dữ liệu mẫu vào các bảng
-- Bảng Nhân viên y tế
INSERT [dbo].[NhanVienYTe] ([MaNhanVien], [HoTen], [ChucVu], [BangCap], [PhongBan], [LichLamViec], [SoDienThoai], [CanCuoc]) VALUES (N'NV001', N'Nguyễn Thị Hương', N'Y tá', N'Đại học Điều dưỡng', N'Khoa Nội', N'Thứ 2-6: 7h-15h', N'0901234567', N'Nhân viên giỏi, 5 năm kinh nghiệm')
INSERT [dbo].[NhanVienYTe] ([MaNhanVien], [HoTen], [ChucVu], [BangCap], [PhongBan], [LichLamViec], [SoDienThoai], [CanCuoc]) VALUES (N'NV002', N'Trần Văn Minh', N'Kỹ thuật viên', N'Cao đẳng Y tế', N'Khoa Xét nghiệm', N'Thứ 2-6: 8h-17h', N'0912345678', N'Kỹ năng xét nghiệm tốt')
INSERT [dbo].[NhanVienYTe] ([MaNhanVien], [HoTen], [ChucVu], [BangCap], [PhongBan], [LichLamViec], [SoDienThoai], [CanCuoc]) VALUES (N'NV003', N'Lê Thị Anh', N'Y tá', N'Đại học Điều dưỡng', N'Khoa Ngoại', N'Thứ 3-7: 7h-15h', N'0923456789', N'Chuyên điều dưỡng sau phẫu thuật')
INSERT [dbo].[NhanVienYTe] ([MaNhanVien], [HoTen], [ChucVu], [BangCap], [PhongBan], [LichLamViec], [SoDienThoai], [CanCuoc]) VALUES (N'NV004', N'Phạm Văn Hải', N'Hộ lý', N'Trung cấp Y tế', N'Khoa Cấp cứu', N'Thứ 2-6: 19h-7h', N'0934567890', N'Nhân viên chăm chỉ')
INSERT [dbo].[NhanVienYTe] ([MaNhanVien], [HoTen], [ChucVu], [BangCap], [PhongBan], [LichLamViec], [SoDienThoai], [CanCuoc]) VALUES (N'NV005', N'Hoàng Thị Mai', N'Y tá trưởng', N'Thạc sĩ Điều dưỡng', N'Khoa Nhi', N'Thứ 2-6: 8h-17h', N'0945678901', N'10 năm kinh nghiệm, chuyên khoa nhi')
GO

-- Bảng Bác sĩ
INSERT [dbo].[BacSi] ([MaBacSi], [HoTen], [MaKhoa], [BangCap], [KinhNghiem], [MaHoSoBenhAn]) VALUES (N'BS001', N'Nguyễn Văn An', N'Tim mạch', N'Tiến sĩ Y khoa', N'15 năm kinh nghiệm', NULL)
INSERT [dbo].[BacSi] ([MaBacSi], [HoTen], [MaKhoa], [BangCap], [KinhNghiem], [MaHoSoBenhAn]) VALUES (N'BS002', N'Trần Thị Bình', N'Nhi khoa', N'Thạc sĩ Y khoa', N'8 năm kinh nghiệm', NULL)
INSERT [dbo].[BacSi] ([MaBacSi], [HoTen], [MaKhoa], [BangCap], [KinhNghiem], [MaHoSoBenhAn]) VALUES (N'BS003', N'Lê Văn Cường', N'Ngoại khoa', N'Tiến sĩ Y khoa', N'12 năm kinh nghiệm', NULL)
INSERT [dbo].[BacSi] ([MaBacSi], [HoTen], [MaKhoa], [BangCap], [KinhNghiem], [MaHoSoBenhAn]) VALUES (N'BS004', N'Phạm Thị Dung', N'Da liễu', N'Bác sĩ chuyên khoa I', N'6 năm kinh nghiệm', NULL)
INSERT [dbo].[BacSi] ([MaBacSi], [HoTen], [MaKhoa], [BangCap], [KinhNghiem], [MaHoSoBenhAn]) VALUES (N'BS005', N'Hoàng Văn Đức', N'Thần kinh', N'Tiến sĩ Y khoa', N'20 năm kinh nghiệm', NULL)
GO

-- Bảng Bảo hiểm y tế
INSERT [dbo].[BaoHiemYTe] ([MaBaoHiem], [LoaiBaoHiem], [NgayHetHan]) VALUES (N'BH001         ', N'Bảo hiểm xã hội', CAST(N'2026-12-31' AS Date))
INSERT [dbo].[BaoHiemYTe] ([MaBaoHiem], [LoaiBaoHiem], [NgayHetHan]) VALUES (N'BH002         ', N'Bảo hiểm y tế cơ bản', CAST(N'2025-06-30' AS Date))
INSERT [dbo].[BaoHiemYTe] ([MaBaoHiem], [LoaiBaoHiem], [NgayHetHan]) VALUES (N'BH003         ', N'Bảo hiểm y tế hộ gia đình', CAST(N'2025-12-31' AS Date))
INSERT [dbo].[BaoHiemYTe] ([MaBaoHiem], [LoaiBaoHiem], [NgayHetHan]) VALUES (N'BH004         ', N'Bảo hiểm y tế tự nguyện', CAST(N'2026-03-31' AS Date))
INSERT [dbo].[BaoHiemYTe] ([MaBaoHiem], [LoaiBaoHiem], [NgayHetHan]) VALUES (N'BH005         ', N'Bảo hiểm y tế toàn diện', CAST(N'2027-01-31' AS Date))
GO

-- Bảng Phòng
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [LoaiPhong], [SoGiuong], [TinhTrang]) VALUES (N'P001 ', N'Phòng 101', N'Phòng thường', 4, N'NV001')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [LoaiPhong], [SoGiuong], [TinhTrang]) VALUES (N'P002 ', N'Phòng 102', N'Phòng VIP', 1, N'NV003')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [LoaiPhong], [SoGiuong], [TinhTrang]) VALUES (N'P003 ', N'Phòng 201', N'Phòng thường', 6, N'NV004')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [LoaiPhong], [SoGiuong], [TinhTrang]) VALUES (N'P004 ', N'Phòng 202', N'Phòng VIP', 1, N'NV005')
INSERT [dbo].[Phong] ([MaPhong], [TenPhong], [LoaiPhong], [SoGiuong], [TinhTrang]) VALUES (N'P005 ', N'Phòng 301', N'Phòng đôi', 2, N'NV002')
GO

-- Bảng Bệnh nhân
INSERT [dbo].[BenhNhan] ([MaBenhNhan], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [CanCuoc] ,[MaBaoHiemYTe], [HoSoBenhAn], [MaPhong]) VALUES (N'BN0001    ', N'Nguyễn Văn Nam', CAST(N'1980-05-15' AS Date), N'Nam', N'123 Nguyễn Trãi, Q1, TP.HCM', N'0901111222', NULL, N'BH001         ', N'Tiền sử bệnh tim', N'P001 ')
INSERT [dbo].[BenhNhan] ([MaBenhNhan], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [CanCuoc] , [MaBaoHiemYTe], [HoSoBenhAn], [MaPhong]) VALUES (N'BN0002    ', N'Trần Thị Hoa', CAST(N'1992-08-20' AS Date), N'Nữ', N'456 Lê Lợi, Q5, TP.HCM', N'0912222333', NULL, N'BH002         ', N'Tiền sử dị ứng thuốc', N'P002 ')
INSERT [dbo].[BenhNhan] ([MaBenhNhan], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai],[CanCuoc] , [MaBaoHiemYTe], [HoSoBenhAn], [MaPhong]) VALUES (N'BN0003    ', N'Lê Văn Đức', CAST(N'1975-12-10' AS Date), N'Nam', N'789 Võ Văn Tần, Q3, TP.HCM', N'0923333444', NULL, N'BH003         ', N'Tiền sử phẫu thuật ruột thừa', N'P001 ')
INSERT [dbo].[BenhNhan] ([MaBenhNhan], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [CanCuoc] , [MaBaoHiemYTe], [HoSoBenhAn], [MaPhong]) VALUES (N'BN0004    ', N'Phạm Thị Mai', CAST(N'2000-03-25' AS Date), N'Nữ', N'101 Điện Biên Phủ, Bình Thạnh, TP.HCM', N'0934444555', NULL, N'BH004         ', N'Không có tiền sử bệnh', N'P003 ')
INSERT [dbo].[BenhNhan] ([MaBenhNhan], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SoDienThoai], [CanCuoc] , [MaBaoHiemYTe], [HoSoBenhAn], [MaPhong]) VALUES (N'BN0005    ', N'Hoàng Văn Bình', CAST(N'1965-07-30' AS Date), N'Nam', N'202 Nguyễn Văn Cừ, Q5, TP.HCM', N'0945555666', NULL, N'BH005         ', N'Tiền sử bệnh tiểu đường', N'P004 ')
GO

-- Bảng Thuốc
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [SoLuong], [HanSuDung], [CongDung], [Gia], [LieuLuong]) VALUES (N'T001 ', N'Paracetamol', 1000, CAST(N'2026-12-31' AS Date), N'Giảm đau, hạ sốt', CAST(2000.00 AS Decimal(10, 2)), N'1-2 viên/lần, 3-4 lần/ngày')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [SoLuong], [HanSuDung], [CongDung], [Gia], [LieuLuong]) VALUES (N'T002 ', N'Amoxicillin', 500, CAST(N'2026-06-30' AS Date), N'Kháng sinh', CAST(5000.00 AS Decimal(10, 2)), N'1 viên/lần, 2 lần/ngày')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [SoLuong], [HanSuDung], [CongDung], [Gia], [LieuLuong]) VALUES (N'T003 ', N'Omeprazole', 300, CAST(N'2027-01-31' AS Date), N'Giảm acid dạ dày', CAST(3500.00 AS Decimal(10, 2)), N'1 viên/ngày, trước bữa sáng')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [SoLuong], [HanSuDung], [CongDung], [Gia], [LieuLuong]) VALUES (N'T004 ', N'Cetirizine', 400, CAST(N'2026-10-31' AS Date), N'Kháng histamine, chống dị ứng', CAST(4000.00 AS Decimal(10, 2)), N'1 viên/ngày')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [SoLuong], [HanSuDung], [CongDung], [Gia], [LieuLuong]) VALUES (N'T005 ', N'Metformin', 200, CAST(N'2026-09-30' AS Date), N'Điều trị tiểu đường', CAST(6000.00 AS Decimal(10, 2)), N'1 viên/lần, 2 lần/ngày, sau bữa ăn')
GO
-- Bảng Lịch hẹn
INSERT [dbo].[LichHen] ([MaLichHen], [MaBenhNhan], [MaBacSi], [NgayHen], [ThoiGianHen], [TrangThai]) VALUES (N'LH0001', N'BN0001    ', N'BS001', CAST(N'2023-05-15 00:00:00' AS DateTime), N'09:00', N'Đã xác nhận')
INSERT [dbo].[LichHen] ([MaLichHen], [MaBenhNhan], [MaBacSi], [NgayHen], [ThoiGianHen], [TrangThai]) VALUES (N'LH0002', N'BN0002    ', N'BS002', CAST(N'2023-05-16 00:00:00' AS DateTime), N'10:30', N'Đã xác nhận')
INSERT [dbo].[LichHen] ([MaLichHen], [MaBenhNhan], [MaBacSi], [NgayHen], [ThoiGianHen], [TrangThai]) VALUES (N'LH0003', N'BN0003    ', N'BS003', CAST(N'2023-05-20 00:00:00' AS DateTime), N'14:00', N'Chờ xác nhận')
INSERT [dbo].[LichHen] ([MaLichHen], [MaBenhNhan], [MaBacSi], [NgayHen], [ThoiGianHen], [TrangThai]) VALUES (N'LH0004', N'BN0004    ', N'BS004', CAST(N'2023-05-22 00:00:00' AS DateTime), N'15:30', N'Đã xác nhận')
INSERT [dbo].[LichHen] ([MaLichHen], [MaBenhNhan], [MaBacSi], [NgayHen], [ThoiGianHen], [TrangThai]) VALUES (N'LH0005', N'BN0005    ', N'BS005', CAST(N'2023-05-25 00:00:00' AS DateTime), N'08:00', N'Chờ xác nhận')
GO

-- Bảng Đơn thuốc
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [MaBenhNhan], [MaBacSi], [NgayKe], [LieuLuong], [CongDung], [Gia]) VALUES (N'DT0001    ', N'BN0001    ', N'BS001', CAST(N'2023-05-15' AS Date), N'Theo hướng dẫn trên vỉ thuốc', N'Điều trị viêm họng', CAST(75000.00 AS Decimal(10, 2)))
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [MaBenhNhan], [MaBacSi], [NgayKe], [LieuLuong], [CongDung], [Gia]) VALUES (N'DT0002    ', N'BN0002    ', N'BS002', CAST(N'2023-05-16' AS Date), N'Theo hướng dẫn trên vỉ thuốc', N'Điều trị viêm phế quản', CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [MaBenhNhan], [MaBacSi], [NgayKe], [LieuLuong], [CongDung], [Gia]) VALUES (N'DT0003    ', N'BN0003    ', N'BS003', CAST(N'2023-05-20' AS Date), N'3 lần/ngày sau khi ăn', N'Giảm đau sau chấn thương', CAST(45000.00 AS Decimal(10, 2)))
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [MaBenhNhan], [MaBacSi], [NgayKe], [LieuLuong], [CongDung], [Gia]) VALUES (N'DT0004    ', N'BN0004    ', N'BS004', CAST(N'2023-05-22' AS Date), N'1 viên/ngày', N'Điều trị dị ứng da', CAST(60000.00 AS Decimal(10, 2)))
INSERT [dbo].[DonThuoc] ([MaDonThuoc], [MaBenhNhan], [MaBacSi], [NgayKe], [LieuLuong], [CongDung], [Gia]) VALUES (N'DT0005    ', N'BN0005    ', N'BS005', CAST(N'2023-05-25' AS Date), N'2 lần/ngày sau bữa ăn', N'Điều trị tiểu đường', CAST(180000.00 AS Decimal(10, 2)))
GO

-- Bảng Chi tiết đơn thuốc
INSERT [dbo].[CT_DonThuoc] ([MaDonThuoc], [MaThuoc], [SoLuong], [DonGia], [ThanhTien]) VALUES (N'DT0001    ', N'T002 ', 10, CAST(5000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(12, 2)))
INSERT [dbo].[CT_DonThuoc] ([MaDonThuoc], [MaThuoc], [SoLuong], [DonGia], [ThanhTien]) VALUES (N'DT0001    ', N'T001 ', 10, CAST(2000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(12, 2)))
INSERT [dbo].[CT_DonThuoc] ([MaDonThuoc], [MaThuoc], [SoLuong], [DonGia], [ThanhTien]) VALUES (N'DT0002    ', N'T002 ', 20, CAST(5000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(12, 2)))
INSERT [dbo].[CT_DonThuoc] ([MaDonThuoc], [MaThuoc], [SoLuong], [DonGia], [ThanhTien]) VALUES (N'DT0002    ', N'T003 ', 5, CAST(3500.00 AS Decimal(10, 2)), CAST(17500.00 AS Decimal(12, 2)))
INSERT [dbo].[CT_DonThuoc] ([MaDonThuoc], [MaThuoc], [SoLuong], [DonGia], [ThanhTien]) VALUES (N'DT0003    ', N'T001 ', 15, CAST(2000.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(12, 2)))
INSERT [dbo].[CT_DonThuoc] ([MaDonThuoc], [MaThuoc], [SoLuong], [DonGia], [ThanhTien]) VALUES (N'DT0004    ', N'T004 ', 15, CAST(4000.00 AS Decimal(10, 2)), CAST(60000.00 AS Decimal(12, 2)))
INSERT [dbo].[CT_DonThuoc] ([MaDonThuoc], [MaThuoc], [SoLuong], [DonGia], [ThanhTien]) VALUES (N'DT0005    ', N'T005 ', 30, CAST(6000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(12, 2)))
GO

-- Bảng Hóa đơn
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaBenhNhan], [NgayLap], [TongTien], [TrangThaiThanhToan], [PhuongThucThanhToan], [MaHoSo]) VALUES (N'HD0001    ', N'BN0001    ', CAST(N'2023-05-15' AS Date), CAST(125000.00 AS Decimal(12, 2)), N'Đã thanh toán', N'Tiền mặt', N'HS0001    ')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaBenhNhan], [NgayLap], [TongTien], [TrangThaiThanhToan], [PhuongThucThanhToan], [MaHoSo]) VALUES (N'HD0002    ', N'BN0002    ', CAST(N'2023-05-16' AS Date), CAST(170000.00 AS Decimal(12, 2)), N'Đã thanh toán', N'Chuyển khoản', N'HS0002    ')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaBenhNhan], [NgayLap], [TongTien], [TrangThaiThanhToan], [PhuongThucThanhToan], [MaHoSo]) VALUES (N'HD0003    ', N'BN0003    ', CAST(N'2023-05-20' AS Date), CAST(95000.00 AS Decimal(12, 2)), N'Chưa thanh toán', NULL, N'HS0003    ')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaBenhNhan], [NgayLap], [TongTien], [TrangThaiThanhToan], [PhuongThucThanhToan], [MaHoSo]) VALUES (N'HD0004    ', N'BN0004    ', CAST(N'2023-05-22' AS Date), CAST(110000.00 AS Decimal(12, 2)), N'Đã thanh toán', N'Thẻ tín dụng', N'HS0004    ')
INSERT [dbo].[HoaDon] ([MaHoaDon], [MaBenhNhan], [NgayLap], [TongTien], [TrangThaiThanhToan], [PhuongThucThanhToan], [MaHoSo]) VALUES (N'HD0005    ', N'BN0005    ', CAST(N'2023-05-25' AS Date), CAST(230000.00 AS Decimal(12, 2)), N'Chưa thanh toán', NULL, NULL)
GO

-- Bảng Thanh toán
INSERT [dbo].[ThanhToan] ([MaThanhToan], [MaHoaDon], [NgayThanhToan], [SoTien], [TinhTrang], [MaPhong]) VALUES (N'TT0001    ', N'HD0001    ', CAST(N'2023-05-15' AS Date), CAST(125000.00 AS Decimal(12, 2)), N'Hoàn thành', N'P001 ')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [MaHoaDon], [NgayThanhToan], [SoTien], [TinhTrang], [MaPhong]) VALUES (N'TT0002    ', N'HD0002    ', CAST(N'2023-05-16' AS Date), CAST(170000.00 AS Decimal(12, 2)), N'Hoàn thành', N'P002 ')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [MaHoaDon], [NgayThanhToan], [SoTien], [TinhTrang], [MaPhong]) VALUES (N'TT0003    ', N'HD0004    ', CAST(N'2023-05-22' AS Date), CAST(110000.00 AS Decimal(12, 2)), N'Hoàn thành', N'P003 ')
GO

-- Bảng Thiết Bị Y Tế
INSERT [dbo].[ThietBiYTe] ([MaThietBi], [TenThietBi], [LoaiThietBi], [TinhTrang], [MaPhong]) VALUES (N'TB0001    ', N'Máy siêu âm', N'Thiết bị chẩn đoán', N'Hoạt động tốt', N'P001 ')
INSERT [dbo].[ThietBiYTe] ([MaThietBi], [TenThietBi], [LoaiThietBi], [TinhTrang], [MaPhong]) VALUES (N'TB0002    ', N'Máy X-quang', N'Thiết bị chẩn đoán', N'Hoạt động tốt', N'P002 ')
INSERT [dbo].[ThietBiYTe] ([MaThietBi], [TenThietBi], [LoaiThietBi], [TinhTrang], [MaPhong]) VALUES (N'TB0003    ', N'Máy theo dõi nhịp tim', N'Thiết bị theo dõi', N'Đang bảo trì', N'P003 ')
INSERT [dbo].[ThietBiYTe] ([MaThietBi], [TenThietBi], [LoaiThietBi], [TinhTrang], [MaPhong]) VALUES (N'TB0004    ', N'Máy đo huyết áp', N'Thiết bị theo dõi', N'Hoạt động tốt', N'P004 ')
INSERT [dbo].[ThietBiYTe] ([MaThietBi], [TenThietBi], [LoaiThietBi], [TinhTrang], [MaPhong]) VALUES (N'TB0005    ', N'Máy thở', N'Thiết bị hỗ trợ', N'Hoạt động tốt', N'P005 ')
GO

-- Dữ liệu cho các bảng trung gian
-- Bảng BN_BS
INSERT [dbo].[BN_BS] ([MaBenhNhan], [MaBacSi], [NgayKham], [KetQua]) VALUES (N'BN0001    ', N'BS001', CAST(N'2023-05-15' AS Date), N'Cần theo dõi thêm')
INSERT [dbo].[BN_BS] ([MaBenhNhan], [MaBacSi], [NgayKham], [KetQua]) VALUES (N'BN0002    ', N'BS002', CAST(N'2023-05-16' AS Date), N'Khám định kỳ sau 1 tháng')
INSERT [dbo].[BN_BS] ([MaBenhNhan], [MaBacSi], [NgayKham], [KetQua]) VALUES (N'BN0003    ', N'BS003', CAST(N'2023-05-20' AS Date), N'Cần tái khám sau 2 tuần')
INSERT [dbo].[BN_BS] ([MaBenhNhan], [MaBacSi], [NgayKham], [KetQua]) VALUES (N'BN0004    ', N'BS004', CAST(N'2023-05-22' AS Date), N'Đã hết bệnh')
INSERT [dbo].[BN_BS] ([MaBenhNhan], [MaBacSi], [NgayKham], [KetQua]) VALUES (N'BN0005    ', N'BS005', CAST(N'2023-05-25' AS Date), N'Cần theo dõi hàng tháng')
GO

-- Bảng DT_T
INSERT [dbo].[DT_T] ([MaDonThuoc], [MaThuoc], [SoLuong], [Gia]) VALUES (N'DT0001    ', N'T001      ', 10, 20000)
INSERT [dbo].[DT_T] ([MaDonThuoc], [MaThuoc], [SoLuong], [Gia]) VALUES (N'DT0001    ', N'T002      ', 10, 50000)
INSERT [dbo].[DT_T] ([MaDonThuoc], [MaThuoc], [SoLuong], [Gia]) VALUES (N'DT0002    ', N'T002      ', 20, 100000)
INSERT [dbo].[DT_T] ([MaDonThuoc], [MaThuoc], [SoLuong], [Gia]) VALUES (N'DT0002    ', N'T003      ', 5, 17500)
INSERT [dbo].[DT_T] ([MaDonThuoc], [MaThuoc], [SoLuong], [Gia]) VALUES (N'DT0003    ', N'T001      ', 15, 30000)
GO

-- Bảng TB_NVYT
INSERT [dbo].[TB_NVYT] ([MaThietBi], [MaNhanVienYTe], [ThoiGianSuDung]) VALUES (N'TB0001    ', N'NV001', CAST(N'2023-05-15 09:00:00' AS DateTime))
INSERT [dbo].[TB_NVYT] ([MaThietBi], [MaNhanVienYTe], [ThoiGianSuDung]) VALUES (N'TB0002    ', N'NV002', CAST(N'2023-05-16 10:30:00' AS DateTime))
INSERT [dbo].[TB_NVYT] ([MaThietBi], [MaNhanVienYTe], [ThoiGianSuDung]) VALUES (N'TB0003    ', N'NV003', CAST(N'2023-05-17 14:00:00' AS DateTime))
INSERT [dbo].[TB_NVYT] ([MaThietBi], [MaNhanVienYTe], [ThoiGianSuDung]) VALUES (N'TB0004    ', N'NV004', CAST(N'2023-05-18 15:30:00' AS DateTime))
INSERT [dbo].[TB_NVYT] ([MaThietBi], [MaNhanVienYTe], [ThoiGianSuDung]) VALUES (N'TB0005    ', N'NV005', CAST(N'2023-05-19 08:00:00' AS DateTime))
GO

-- Bảng BS_ThietBiYTe
INSERT [dbo].[BS_ThietBiYTe] ([MaBacSi], [MaThietBi]) VALUES (N'BS001', N'TB0001    ')
INSERT [dbo].[BS_ThietBiYTe] ([MaBacSi], [MaThietBi]) VALUES (N'BS002', N'TB0002    ')
INSERT [dbo].[BS_ThietBiYTe] ([MaBacSi], [MaThietBi]) VALUES (N'BS003', N'TB0003    ')
INSERT [dbo].[BS_ThietBiYTe] ([MaBacSi], [MaThietBi]) VALUES (N'BS004', N'TB0004    ')
INSERT [dbo].[BS_ThietBiYTe] ([MaBacSi], [MaThietBi]) VALUES (N'BS005', N'TB0005    ')
GO

-- Bảng NVYT_P
INSERT [dbo].[NVYT_P] ([MaNhanVienYTe], [MaPhong], [ThoiGianQuanLy]) VALUES (N'NV001', N'P001      ', CAST(N'2023-01-01 00:00:00' AS DateTime))
INSERT [dbo].[NVYT_P] ([MaNhanVienYTe], [MaPhong], [ThoiGianQuanLy]) VALUES (N'NV002', N'P002      ', CAST(N'2023-01-01 00:00:00' AS DateTime))
INSERT [dbo].[NVYT_P] ([MaNhanVienYTe], [MaPhong], [ThoiGianQuanLy]) VALUES (N'NV003', N'P003      ', CAST(N'2023-01-01 00:00:00' AS DateTime))
INSERT [dbo].[NVYT_P] ([MaNhanVienYTe], [MaPhong], [ThoiGianQuanLy]) VALUES (N'NV004', N'P004      ', CAST(N'2023-01-01 00:00:00' AS DateTime))
INSERT [dbo].[NVYT_P] ([MaNhanVienYTe], [MaPhong], [ThoiGianQuanLy]) VALUES (N'NV005', N'P005      ', CAST(N'2023-01-01 00:00:00' AS DateTime))
GO

-- Bảng HSBA_BS
INSERT [dbo].[HSBA_BS] ([MaHoSoBenhAn], [MaBacSi], [QuanLy], [KetQua]) VALUES (N'HS0001    ', N'BS001', N'Theo dõi điều trị', N'Đã khỏi')
INSERT [dbo].[HSBA_BS] ([MaHoSoBenhAn], [MaBacSi], [QuanLy], [KetQua]) VALUES (N'HS0002    ', N'BS002', N'Theo dõi điều trị', N'Đang theo dõi')
INSERT [dbo].[HSBA_BS] ([MaHoSoBenhAn], [MaBacSi], [QuanLy], [KetQua]) VALUES (N'HS0003    ', N'BS003', N'Theo dõi điều trị', N'Đang điều trị')
INSERT [dbo].[HSBA_BS] ([MaHoSoBenhAn], [MaBacSi], [QuanLy], [KetQua]) VALUES (N'HS0004    ', N'BS004', N'Theo dõi điều trị', N'Đã khỏi')
GO

-- Bảng DT_HD
INSERT [dbo].[DT_HD] ([MaHoaDon], [MaDonThuoc], [DonGia], [SoLuong], [ThanhTien]) VALUES (N'HD0001    ', N'DT0001    ', 70000, 1, 70000)
INSERT [dbo].[DT_HD] ([MaHoaDon], [MaDonThuoc], [DonGia], [SoLuong], [ThanhTien]) VALUES (N'HD0002    ', N'DT0002    ', 117500, 1, 117500)
INSERT [dbo].[DT_HD] ([MaHoaDon], [MaDonThuoc], [DonGia], [SoLuong], [ThanhTien]) VALUES (N'HD0003    ', N'DT0003    ', 30000, 1, 30000)
INSERT [dbo].[DT_HD] ([MaHoaDon], [MaDonThuoc], [DonGia], [SoLuong], [ThanhTien]) VALUES (N'HD0004    ', N'DT0004    ', 60000, 1, 60000)
INSERT [dbo].[DT_HD] ([MaHoaDon], [MaDonThuoc], [DonGia], [SoLuong], [ThanhTien]) VALUES (N'HD0005    ', N'DT0005    ', 180000, 1, 180000)
GO

-- Bảng Hồ sơ bệnh án
INSERT [dbo].[HoSoBenhAn] ([MaHoSo], [MaBenhNhan], [MaBacSi], [NgayKham], [ChuanDoan], [DieuTri]) VALUES (N'HS0001    ', N'BN0001    ', N'BS001', CAST(N'2023-01-15' AS Date), N'Viêm họng', N'Uống thuốc kháng sinh', N'Đã khỏi', N'T002 ')
INSERT [dbo].[HoSoBenhAn] ([MaHoSo], [MaBenhNhan], [MaBacSi], [NgayKham], [ChuanDoan], [DieuTri]) VALUES (N'HS0002    ', N'BN0002    ', N'BS002', CAST(N'2023-02-20' AS Date), N'Viêm phế quản', N'Uống thuốc kháng sinh và nghỉ ngơi', N'Đang theo dõi', N'T002 ')
INSERT [dbo].[HoSoBenhAn] ([MaHoSo], [MaBenhNhan], [MaBacSi], [NgayKham], [ChuanDoan], [DieuTri]) VALUES (N'HS0003    ', N'BN0003    ', N'BS003', CAST(N'2023-03-10' AS Date), N'Gãy xương tay', N'Bó bột, nghỉ ngơi', N'Đang điều trị', N'T001 ')
INSERT [dbo].[HoSoBenhAn] ([MaHoSo], [MaBenhNhan], [MaBacSi], [NgayKham], [ChuanDoan], [DieuTri]) VALUES (N'HS0004    ', N'BN0004    ', N'BS004', CAST(N'2023-04-05' AS Date), N'Dị ứng da', N'Thuốc kháng histamine', N'Đã khỏi', N'T004 ')

