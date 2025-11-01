-- Tạo cơ sở dữ liệu
CREATE DATABASE QLSV;
GO

-- Sử dụng cơ sở dữ liệu vừa tạo
USE QLSV;
GO

-- 1. Bảng Sinh viên
CREATE TABLE SV (
    MaSV CHAR(10) PRIMARY KEY NOT NULL,
    TenSV NVARCHAR(30) NOT NULL,
    Que NVARCHAR(50)
);
GO

-- 2. Bảng Môn học
CREATE TABLE MON (
    MaMH CHAR(10) PRIMARY KEY NOT NULL,
    TenMH NVARCHAR(50) NOT NULL,
    SoTC INT CHECK (SoTC > 0)
);
GO

-- 3. Bảng Kết quả
CREATE TABLE KQ (
    MaSV CHAR(10) NOT NULL,
    MaMH CHAR(10) NOT NULL,
    Diem DECIMAL(4,2) CHECK (Diem BETWEEN 0 AND 10),
    CONSTRAINT PK_KQ PRIMARY KEY (MaSV, MaMH),
    CONSTRAINT FK_KQ_SV FOREIGN KEY (MaSV) REFERENCES SV(MaSV),
    CONSTRAINT FK_KQ_MON FOREIGN KEY (MaMH) REFERENCES MON(MaMH)
);
GO

-- Thêm dữ liệu mẫu
INSERT INTO SV (MaSV, TenSV, Que) VALUES
('SV01', N'Nguyễn An', N'Hà Nội'),
('SV02', N'Trần Bình', N'Hải Phòng'),
('SV03', N'Lê Chi', N'Nam Định');
GO

INSERT INTO MON (MaMH, TenMH, SoTC) VALUES
('MH01', N'Cơ sở dữ liệu', 3),
('MH02', N'Lập trình C++', 4),
('MH03', N'Mạng máy tính', 3);
GO

INSERT INTO KQ (MaSV, MaMH, Diem) VALUES
('SV01', 'MH01', 8.5),
('SV01', 'MH02', 7.0),
('SV02', 'MH03', 9.0),
('SV03', 'MH01', 6.5);
GO

-- Kiểm tra dữ liệu
SELECT * FROM SV;
SELECT * FROM MON;
SELECT * FROM KQ;
