-- Tạo cơ sở dữ liệu
CREATE DATABASE QLBanHang;
GO

-- Sử dụng cơ sở dữ liệu vừa tạo
USE QLBanHang;
GO

-- 1. Bảng Công Ty
CREATE TABLE CongTy (
    MaCT CHAR(10) PRIMARY KEY NOT NULL,
    TenCT NVARCHAR(50) NOT NULL,
    TrangThai NVARCHAR(20),
    ThanhPho NVARCHAR(30)
);
GO

-- 2. Bảng Sản Phẩm
CREATE TABLE SanPham (
    MaSP CHAR(10) PRIMARY KEY NOT NULL,
    TenSP NVARCHAR(50) NOT NULL UNIQUE,  -- Tên sản phẩm phải duy nhất
    MauSac NVARCHAR(20) DEFAULT N'Đỏ',   -- Màu sắc mặc định là "Đỏ"
    Gia DECIMAL(10,2) CHECK (Gia > 0),
    SoLuongCo INT CHECK (SoLuongCo >= 0)
);
GO

-- 3. Bảng Cung Ứng
CREATE TABLE CungUng (
    MaCT CHAR(10) NOT NULL,
    MaSP CHAR(10) NOT NULL,
    SoLuongBan INT CHECK (SoLuongBan > 0),   -- Số lượng bán > 0
    CONSTRAINT PK_CungUng PRIMARY KEY (MaCT, MaSP),
    CONSTRAINT FK_CungUng_CongTy FOREIGN KEY (MaCT) REFERENCES CongTy(MaCT),
    CONSTRAINT FK_CungUng_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
GO

-- Thêm dữ liệu mẫu
INSERT INTO CongTy (MaCT, TenCT, TrangThai, ThanhPho) VALUES
('CT01', N'Công ty Alpha', N'Đang hoạt động', N'Hà Nội'),
('CT02', N'Công ty Beta', N'Tạm ngưng', N'Hồ Chí Minh');
GO

INSERT INTO SanPham (MaSP, TenSP, Gia, SoLuongCo) VALUES
('SP01', N'Máy tính xách tay', 15000000, 10),
('SP02', N'Chuột không dây', 250000, 50),
('SP03', N'Bàn phím cơ', 1200000, 30);
GO

INSERT INTO CungUng (MaCT, MaSP, SoLuongBan) VALUES
('CT01', 'SP01', 3),
('CT01', 'SP02', 10),
('CT02', 'SP03', 5);
GO

-- Kiểm tra dữ liệu
SELECT * FROM CongTy;
SELECT * FROM SanPham;
SELECT * FROM CungUng;
