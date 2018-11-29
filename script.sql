USE [BANSACH]
GO
/****** Object:  User [admin]    Script Date: 11/29/2018 1:57:24 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  UserDefinedFunction [dbo].[fc_CheckAccount]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[fc_CheckAccount](@TenDangNhap varchar(10)) Returns Bit
As
Begin
	Declare @Result bit;
	If (Exists (Select * From Account acc Where acc.TenDangNhap = @TenDangNhap))
		Set @Result = 0;
	Else
		Set @Result = 1;
	Return @Result;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_CreateCartId]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fc_CreateCartId]() returns varchar(10)
As
Begin
	Declare @MaHoaDon varchar(10), @Count int = 0;
	Select @Count = COUNT(MaHoadon) From HoaDon
	Set @MaHoaDon = 'cart' + RIGHT('00000' + Convert(varchar, @Count + 1), 5);
	return @MaHoaDon;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_getAllBook]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-->Lấy thông tin tất cả sách
CREATE Function [dbo].[fc_getAllBook]() Returns @KetQua Table(
	MaSach varchar(10),
	TenSach nvarchar(255),
	GiaBan int,
	TenTheLoai nvarchar(255),
	TenNXB nvarchar(255),
	TenTacGia nvarchar(255),
	MoTa ntext,
	DanhGia real
)
As
Begin
	Declare @MaTheLoai varchar(10), @MaNXB varchar(10), @MaTacGia varchar(10);
	Insert Into @KetQua
		Select MaSach, TenSach, GiaBan, [dbo].fc_getCategoryById(MaTheLoai), [dbo].fc_getNxbById(MaNXB), 
			[dbo].fc_getAuthorById(MaTacGia), MoTa, DanhGia From Books b
	Return;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_GetAllCommentOfBook]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fc_GetAllCommentOfBook](@MaSach varchar(10)) Returns @KetQua Table(
	TenTaiKhoan nvarchar(255),
	NoiDung ntext,
	ThoiGian varchar(20)
)
As
Begin
	Insert Into @KetQua
		Select dbo.fc_GetNameOfAccount(TenDangNhap), NoiDung, dbo.fc_GetTimeComment(ThoiGian) 
			From Comment Where (@MaSach = MaSach) And (TenTaiKhoan Is Null)
	Insert Into @KetQua
		Select TenTaiKhoan, NoiDung, dbo.fc_GetTimeComment(ThoiGian) 
			From Comment Where (@MaSach = MaSach) And (TenDangNhap Is Null)
	Return;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_getAuthorById]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-->Lấy tên tác giả
Create Function [dbo].[fc_getAuthorById](@MaTacGia varchar(10)) Returns nvarchar(255)
As
Begin
	Declare @TenTacGia nvarchar(255) = null;
	Select @TenTacGia = TenTacGia From TacGia Where MaTacGia = @MaTacGia
	return @TenTacGia;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_getBookById]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-->Lấy thông tin sách
CREATE Function [dbo].[fc_getBookById](@MaSach varchar(10)) Returns @KetQua Table (
	MaSach varchar(10),
	TenSach nvarchar(255),
	GiaBan int,
	TenTheLoai nvarchar(255),
	TenNXB nvarchar(255),
	TenTacGia nvarchar(255),
	MoTa ntext,
	DanhGia real
)
As
Begin
	Declare @MaTheLoai varchar(10), @MaNXB varchar(10), @MaTacGia varchar(10);
	Insert Into @KetQua(MaSach, TenSach, GiaBan, MoTa, DanhGia)
		Select MaSach, TenSach, GiaBan, MoTa, DanhGia From Books b Where MaSach = @MaSach

	Select @MaTheLoai = MaTheLoai, @MaNXB = MaNXB, @MaTacGia = MaTacGia From Books Where MaSach = @MaSach
	Update @KetQua Set 
		TenTheLoai = [dbo].fc_getCategoryById(@MaTheLoai),
		TenNXB = [dbo].fc_getNxbById(@MaNXB),
		TenTacGia = [dbo].fc_getAuthorById(@MaTacGia)
	Where MaSach = @MaSach;

	Return;
End	 
GO
/****** Object:  UserDefinedFunction [dbo].[fc_getCategoryById]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-->Lấy tên thể loại
Create Function [dbo].[fc_getCategoryById](@MaTheLoai varchar(10)) Returns nvarchar(255)
As
Begin
	Declare @TenTheLoai nvarchar(255) = null;
	Select @TenTheLoai = TenTheLoai From TheLoai Where MaTheLoai = @MaTheLoai
	return @TenTheLoai;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_getImageById]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-->Lấy đường dẫn của hình ảnh
CREATE Function [dbo].[fc_getImageById](@MaAnh varchar(10), @MaSach varchar(10)) Returns @KetQua Table (
	MaAnh varchar(10),
	DuongDan varchar(50)
)
As
Begin
	If (@MaAnh Is Null)
		Insert Into @KetQua
			Select MaAnh, DuongDan From [Image] Where @MaSach = MaSach
	Else if (@MaSach Is Null)
		Insert into @KetQua
			Select MaAnh, DuongDan From [Image] Where @MaAnh = MaAnh
	Else
		Insert into @KetQua
			Select MaAnh, DuongDan From [Image] Where @MaAnh = MaAnh And @MaSach = MaSach
	Return;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_GetInformation]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[fc_GetInformation](@TenDangNhap varchar(10)) Returns @KetQua Table(
	TenTaiKhoan nvarchar(255),
	ChucVu nvarchar(30)
)
As
Begin
	Insert Into @KetQua
		Select TenTaiKhoan, TenChucVu From CT_Account acc, ChucVu cv
			Where acc.TenDangNhap = @TenDangNhap And acc.MaChucVu = cv.MaChucVu 
	Return;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_GetNameOfAccount]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fc_GetNameOfAccount](@TenDangNhap varchar(10)) Returns nvarchar(255)
As
Begin
	Declare @TenTaiKhoan nvarchar(255);
	Select @TenTaiKhoan = TenTaiKhoan From CT_Account Where @TenDangNhap = TenDangNhap
	If (@TenTaiKhoan IS NULL) Set @TenTaiKhoan = 'unknown';
	Return @TenTaiKhoan;
End 
GO
/****** Object:  UserDefinedFunction [dbo].[fc_getNxbById]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-->Lấy tên nxb
Create Function [dbo].[fc_getNxbById](@MaNXB varchar(10)) Returns nvarchar(255)
As
Begin
	Declare @TenNXB nvarchar(255) = null;
	Select @TenNXB = TenNXB From NXB Where MaNXB = @MaNXB
	return @TenNXB;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_GetTimeComment]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fc_GetTimeComment](@ThoiGianBinhLuan datetime) Returns varchar(8)
As
Begin
	Declare @TimeLv1 int = dbo.fc_GetTimeCommentLv1(@ThoiGianBinhLuan);
	If (@TimeLv1 <= 0)
	Begin
		Declare @TimeLv2 varchar(8) = dbo.fc_GetTimeCommentLv2(@ThoiGianBinhLuan);
		Return @TimeLv2;
	End
	Return @TimeLv1;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_GetTimeCommentLv1]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fc_GetTimeCommentLv1](@ThoiGianBinhLuan datetime) Returns int
As
Begin
	Declare @KhoangCach int, @ThoiGianHienTai datetime;
	Select @KhoangCach = ABS(DATEDIFF(Day, @ThoiGianBinhLuan, GETDATE()));
	Return @KhoangCach;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_GetTimeCommentLv2]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[fc_GetTimeCommentLv2](@ThoiGianBinhLuan datetime) Returns varchar(8)
As
Begin
	Declare @KhoangCach int, @ThoiGianHienTai datetime;
	Select @KhoangCach = ABS(DATEDIFF(SECOND, Convert(Time, @ThoiGianBinhLuan), Convert(Time, GETDATE())));
	
	Declare @Time varchar(8), @Gio int, @Phut int, @Giay int;
	Set @Gio = @KhoangCach/3600;
	Set @KhoangCach = @KhoangCach - @Gio*3600;
	Set @Phut = @KhoangCach/60;
	Set @Giay = @KhoangCach - @Phut*60;
	Set @Time = Right('00' + Convert(varchar, @Gio), 2) + ':' + Right('00' + Convert(varchar, @Phut), 2) + ':' + Right('00' + Convert(varchar, @Giay), 2);
	Return @Time;
End
GO
/****** Object:  UserDefinedFunction [dbo].[fc_Login]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [dbo].[fc_Login](@TenDangNhap varchar(10), @MatKhau varchar(50)) Returns bit
As
Begin
	Declare @Result bit;
	If (Exists (Select * From Account Where TenDangNhap = @TenDangNhap And MatKhau = @MatKhau))
		Set @Result = 1;
	Else
		Set @Result = 0;

	Return @Result;
End
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/29/2018 1:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[TenDangNhap] [varchar](10) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangTin]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangTin](
	[MaTin] [varchar](10) NOT NULL,
	[NoiDung] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[MaSach] [varchar](10) NOT NULL,
	[TenSach] [nvarchar](255) NOT NULL,
	[GiaBan] [int] NOT NULL,
	[MaTheLoai] [varchar](10) NULL,
	[MaNXB] [varchar](10) NULL,
	[MaTacGia] [varchar](10) NULL,
	[MoTa] [ntext] NULL,
	[DanhGia] [real] NOT NULL,
 CONSTRAINT [PK__Books__B235742D2DF5B74E] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [varchar](10) NOT NULL,
	[TenChucVu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__ChucVu__D46395339F82DF7B] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[TenDangNhap] [varchar](10) NULL,
	[TenTaiKhoan] [nvarchar](255) NULL,
	[MaSach] [varchar](10) NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[ThoiGian] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Account]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Account](
	[TenDangNhap] [varchar](10) NOT NULL,
	[TenTaiKhoan] [nvarchar](255) NOT NULL,
	[MaChucVu] [varchar](10) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HoaDon](
	[MaSach] [varchar](10) NOT NULL,
	[MaHoaDon] [varchar](10) NOT NULL,
	[Soluong] [int] NOT NULL,
	[Gia] [int] NOT NULL,
 CONSTRAINT [PK__CT_HoaDo__B235742D31F3E5FB] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoadon] [varchar](10) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[NgayIn] [datetime] NOT NULL,
	[MaTaiKhoan] [varchar](10) NULL,
	[TenNguoiMua] [ntext] NULL,
	[DiaChi] [ntext] NOT NULL,
	[SDT] [varchar](11) NOT NULL,
 CONSTRAINT [PK__HoaDon__BB58D11D2D5268E2] PRIMARY KEY CLUSTERED 
(
	[MaHoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[MaAnh] [varchar](10) NOT NULL,
	[MaSach] [varchar](10) NOT NULL,
	[DuongDan] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NXB]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB](
	[MaNXB] [varchar](10) NOT NULL,
	[TenNXB] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__NXB__3A19482C7E108163] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [varchar](10) NOT NULL,
	[TenTacGia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__TacGia__F24E67567FE92CD9] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTheLoai] [varchar](10) NOT NULL,
	[TenTheLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongKeThuChi]    Script Date: 11/29/2018 1:57:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeThuChi](
	[MaHoaDon] [varchar](10) NOT NULL,
	[TienThanhToan] [int] NOT NULL,
 CONSTRAINT [PK_ThongKeThuChi] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  CONSTRAINT [DF_Books_DanhGia]  DEFAULT ((5.0)) FOR [DanhGia]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK__Books__MaNXB__45F365D3] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NXB] ([MaNXB])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK__Books__MaNXB__45F365D3]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK__Books__MaTacGia__46E78A0C] FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK__Books__MaTacGia__46E78A0C]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_TheLoai] FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[TheLoai] ([MaTheLoai])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_TheLoai]
GO
ALTER TABLE [dbo].[CT_Account]  WITH CHECK ADD  CONSTRAINT [FK_CT_Account_Account] FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[Account] ([TenDangNhap])
GO
ALTER TABLE [dbo].[CT_Account] CHECK CONSTRAINT [FK_CT_Account_Account]
GO
ALTER TABLE [dbo].[CT_Account]  WITH CHECK ADD  CONSTRAINT [FK_CT_Account_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[CT_Account] CHECK CONSTRAINT [FK_CT_Account_ChucVu]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__CT_HoaDon__Soluo__3F466844] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoadon])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK__CT_HoaDon__Soluo__3F466844]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CT_HoaDon_Books] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Books] ([MaSach])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [FK_CT_HoaDon_Books]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Books] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Books] ([MaSach])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Books]
GO
ALTER TABLE [dbo].[ThongKeThuChi]  WITH CHECK ADD  CONSTRAINT [FK_ThongKeThuChi_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoadon])
GO
ALTER TABLE [dbo].[ThongKeThuChi] CHECK CONSTRAINT [FK_ThongKeThuChi_HoaDon]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBookToCart]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_AddBookToCart](@MaSach varchar(10), @MaHoaDon varchar(10), @SoLuong int, @Gia int)
As
Begin
	Insert Into CT_HoaDon Values(@MaSach, @MaHoaDon, @SoLuong, @Gia);
	Return;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCart]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_AddCart](@MaHoaDon varchar(10) output, @MaTaiKhoan varchar(10), @TenNguoiMua ntext, @DiaChi ntext, @SDT varchar(11))
As
Begin
	Set @MaHoaDon = dbo.fc_CreateCartId();
	Insert Into HoaDon Values(@MaHoaDon, 0, GETDATE(), @MaTaiKhoan, @TenNguoiMua, @DiaChi, @SDT);
	return;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCommentToBook]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_AddCommentToBook](@TenDangNhap varchar(10), @TenTaiKhoan nvarchar(255), @MaSach varchar(10), @NoiDung ntext)
As
Begin
	Declare @ThoiGian DateTime = GETDATE();
	If (@TenDangNhap Is Null)
		Insert Into Comment Values (NULL, @TenTaiKhoan, @MaSach, @NoiDung, @ThoiGian);
	Else
		Insert Into Comment Values (@TenDangNhap, NULL, @MaSach, @NoiDung, @ThoiGian);
	Return;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaAnh]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ChinhSuaAnh]
	@MaAnh varchar(10),
	@MaSach varchar(10),
	@DuongDan varchar(50)
As
Begin
	Update [Image] Set DuongDan = @DuongDan
		Where @MaAnh = MaAnh And @MaSach = MaSach;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaDanhGiaSach]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChinhSuaDanhGiaSach](@MaSach varchar(10), @DanhGiaMoi real)
AS
BEGIN
	Declare @DanhGiaCu real;
	Select @DanhGiaCu = DanhGia From Books Where MaSach = @MaSach
	Set @DanhGiaMoi = (@DanhGiaMoi + @DanhGiaCu)/2;
	Update Books Set DanhGia = @DanhGiaMoi
		Where MaSach = @MaSach
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaSach]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_ChinhSuaSach]
	@MaSach varchar(10),
	@TenSach nvarchar(255), 
	@Gia int, 
	@TheLoai nvarchar(50), 
	@NXB nvarchar(50), 
	@TacGia nvarchar(50), 
	@MoTa ntext
As
Begin
	Declare @MaTheLoai_Moi varchar(10), @MaTheLoai_Cu varchar(10), 
		@MaNXB_Moi varchar(10), @MaNXB_Cu varchar(10), 
		@MaTacGia_Moi varchar(10), @MaTacGia_Cu varchar(10);

	-->Mã NXB
	Select @MaNXB_Moi = NXB.MaNXB From NXB Where @NXB = NXB.TenNXB;
	Select @MaNXB_Cu = b.MaNXB From Books b Where @MaSach = b.MaSach;

	-->Mã Thể loại
	Select @MaTheLoai_Moi = tl.MaTheLoai From TheLoai tl Where @TheLoai = tl.TenTheLoai;
	Select @MaTheLoai_Cu = b.MaTheLoai From Books b Where @MaSach = b.MaSach;

	-->Mã tác giả
	Select @MaTacGia_Moi = au.MaTacGia From TacGia au Where @TacGia = au.TenTacGia;
	Select @MaTacGia_Cu = b.MaTacGia From Books b Where @MaSach = b.MaSach;

	-->Kiểm tra thay đổi dữ liệu của khóa ngoại, đảm bảo mã mới phải khác null
	if (@MaNXB_Moi Is Null) Exec sp_ThemNXB @MaNXB_Moi output, @NXB;
	if (@MaTacGia_Moi Is Null) Exec sp_ThemTacGia @MaTacGia_Moi output, @TacGia;
	if (@MaTheLoai_Moi Is Null) Exec sp_ThemTheLoai @MatheLoai_Moi output, @TheLoai;

	-->Tiến hành update
	Update Books Set TenSach = @TenSach, GiaBan = @Gia, MaTheLoai = @MaTheLoai_Moi,
			MaNXB = @MaNXB_Moi, MaTacGia = @MaTacGia_Moi
		Where MaSach = @MaSach;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_Signup]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[sp_Signup](@TenDangNhap varchar(10), @MatKhau varchar(50), @TenTaiKhoan nvarchar(255), @Email varchar(50))
As
Begin
	Insert Into Account Values(@TenDangNhap, @MatKhau, @Email);
	Insert Into CT_Account Values(@TenDangNhap, @TenTaiKhoan, 'cv02');
	Return;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_TaoMaSach]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_TaoMaSach]
	@MaSach varchar(10) output
As
Begin
	Declare @CountRow int;

	-->Đếm số lượng dòng đã có trong bảng
	Select @CountRow = COUNT(MaSach) From Books

	-->Tạo Mã NXB mới theo số lượng dòng đã có
	Set @MaSach = 's' + RIGHT('00000' + CAST((@CountRow + 1) As varchar(5)), 5);
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemAnh]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-->Thêm ảnh mới vào db
CREATE Procedure [dbo].[sp_ThemAnh]
	@MaAnh varchar(10) output,
	@MaSach varchar(10),
	@DuongDan varchar(50)
As
Begin
	Declare @CountRow int;

	-->Đếm số lượng dòng đã có trong bảng
	Select @CountRow = COUNT(MaAnh) From [Image]

	-->Tạo Mã NXB mới theo số lượng dòng đã có
	Select @MaAnh = 'img' + RIGHT('00000' + CAST((@CountRow + 1) As varchar(5)), 5);

	Insert Into [Image]
		Values(@MaAnh, @MaSach, @DuongDan);
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNXB]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ThemNXB]
	@MaNXB varchar(10) output,
	@TenNXB nvarchar(50)
As
Begin
	Declare @CountRow int;

	-->Đếm số lượng dòng đã có trong bảng
	Select @CountRow = COUNT(MaNXB) From NXB

	-->Tạo Mã NXB mới theo số lượng dòng đã có
	Select @MaNXB = 'nxb' + RIGHT('00000' + CAST((@CountRow + 1) As varchar(5)), 5);

	-->Thêm nxb mới vào bảng
	Insert Into NXB Values(@MaNXB, @TenNXB);
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSach]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ThemSach]
	@MaSach varchar(10),
	@TenSach nvarchar(255),
	@Gia int,
	@MaTheLoai varchar(10),
	@MaNXB varchar(10),
	@MaTacGia varchar(10),
	@MoTa ntext
As
Begin
	Insert Into Books 
		Values(@MaSach, @TenSach, @Gia, @MaTheLoai, @MaNXB, @MaTacGia, @MoTa);
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSachMoi]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-->Thêm sách mới vào db, thông tin truyền vào chưa tối giản
CREATE Procedure [dbo].[sp_ThemSachMoi]
	@MaSach varchar(10) output,
	@TenSach nvarchar(255), 
	@Gia int, 
	@TheLoai nvarchar(50), 
	@NXB nvarchar(50), 
	@TacGia nvarchar(50), 
	@MoTa ntext
As
Begin
	Declare @MaNXB varchar(10) = null, @MaTheLoai varchar(10) = null, @MaTacGia varchar(10) = null;
	Select @MaNXB = NXB.MaNXB From NXB Where @NXB = NXB.TenNXB;
	Select @MaTheLoai = tl.MaTheLoai From TheLoai tl Where @TheLoai = tl.TenTheLoai;
	Select @MaTacGia = au.MaTacGia From TacGia au Where @TacGia = au.TenTacGia;

	if (@MaNXB is Null) Exec sp_ThemNXB @MaNXB output, @NXB;
	if (@MaTheLoai is Null) Exec sp_ThemTheLoai @MaTheLoai output, @TheLoai;
	if (@MaTacGia is Null) Exec sp_ThemTacGia @MaTacGia output, @TacGia;

	Exec sp_TaoMaSach @MaSach output;
	Exec sp_ThemSach @MaSach, @TenSach, @Gia, @MaTheLoai, @MaNXB, @MaTacGia, @MoTa;
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemTacGia]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_ThemTacGia]
	@MaTacGia varchar(10) output,
	@TacGia nvarchar(50)
As
Begin
	Declare @CountRow int;

	-->Đếm số lượng dòng đã có trong bảng
	Select @CountRow = COUNT(MaTacGia) From TacGia;

	-->Tạo Mã thể loại mới theo số lượng dòng đã có
	Select @MaTacGia = 'au' + RIGHT('00000' + CAST((@CountRow + 1) As varchar(5)), 5);

	-->Thêm thể loại mới vào bảng
	Insert Into TacGia Values(@MaTacGia, @TacGia);
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemTheLoai]    Script Date: 11/29/2018 1:57:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_ThemTheLoai]
	@MaTheLoai varchar(10) output,
	@TheLoai nvarchar(50)
As
Begin
	Declare @CountRow int;

	-->Đếm số lượng dòng đã có trong bảng
	Select @CountRow = COUNT(MaTheLoai) From TheLoai

	-->Tạo Mã thể loại mới theo số lượng dòng đã có
	Select @MaTheLoai = 'type' + RIGHT('00000' + CAST((@CountRow + 1) As varchar(5)), 5);

	-->Thêm thể loại mới vào bảng
	Insert Into TheLoai Values(@MaTheLoai, @TheLoai);
End
GO
