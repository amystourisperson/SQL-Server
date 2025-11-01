CREATE DATABASE QLYHANG;
 
 GO

 USE QLYHANG;

 GO

 CREATE TABLE VatTu(
	MaVT INT IDENTITY PRIMARY KEY,
	TenVT NVARCHAR(100) NOT NULL,
	DVTinh NVARCHAR(100) NOT NULL,
	SLCon INT NOT NULL DEFAULT(0)
 )
 GO


 CREATE TABLE HDBan(
	MaHD INT IDENTITY PRIMARY KEY,
	NgayXuat DATETIME NOT NULL DEFAULT(GETDATE()),
	HoTenKhach NVARCHAR(100) NOT NULL
	)
 GO


 CREATE TABLE HangXuat(
	MaHD INT NOT NULL,
	MaVT INT NOT NULL,  
	DonGia INT DEFAULT(0),
	SlBan INT NOT NULL DEFAULT(0),
	PRIMARY KEY(MaHD, MaVT),
	FOREIGN KEY(MaHD) REFERENCES dbo.HDBan(MaHD),  --FOREIGN la khoa ngoai
	FOREIGN KEY(MaVT) REFERENCES dbo.VatTu(MaVT)  --REFERENCES la tham chieu den VatTu (thuoc tinh MaVT)
)

GO

INSERT INTO [dbo].[VatTu] ([TenVT], [DVTinh], [SLCon]) VALUES('Vat tu 1', 'Thung', 23)
INSERT INTO [dbo].[VatTu] ([TenVT], [DVTinh], [SLCon]) VALUES('Vat tu 2', 'Chiec', 21)
INSERT INTO [dbo].[VatTu] ([TenVT], [DVTinh], [SLCon]) VALUES('Vat tu 3', 'Bao', 43)
INSERT INTO [dbo].[VatTu] ([TenVT], [DVTinh], [SLCon]) VALUES('Vat tu 4', 'Tui', 93)
GO

INSERT INTO [dbo].[HDBan] ([NgayXuat], [HoTenKhach]) VALUES ('09-02-2017', 'Nguyen Van Hoang')
INSERT INTO [dbo].[HDBan] ([NgayXuat], [HoTenKhach]) VALUES ('08-01-2019', 'Nguyen Thi Ngoc')
INSERT INTO [dbo].[HDBan] ([NgayXuat], [HoTenKhach]) VALUES ('02-02-2019', 'Tran Van Hoang')
INSERT INTO [dbo].[HDBan] ([NgayXuat], [HoTenKhach]) VALUES ('02-03-2017', 'Nguyen Hoang Duong')
GO

INSERT INTO [dbo].[HangXuat] ([MaHD], [MaVT], [DonGia], [SlBan]) VALUES (121, 22, 2000, 5)
INSERT INTO [dbo].[HangXuat] ([MaHD], [MaVT], [DonGia], [SlBan]) VALUES (34, 44, 2020, 9)
INSERT INTO [dbo].[HangXuat] ([MaHD], [MaVT], [DonGia], [SlBan]) VALUES (232, 21, 1920, 2)
INSERT INTO [dbo].[HangXuat] ([MaHD], [MaVT], [DonGia], [SlBan]) VALUES (424, 323, 44000, 7)
GO

SELECT * FROM dbo.HangXuat;
SELECT * FROM dbo.HDBan;
SELECT * FROM dbo.VatTu;