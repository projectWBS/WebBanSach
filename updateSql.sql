USE [BANSACH]
GO

ALTER TABLE Comment ADD DanhGia int;
ALTER TABLE Comment ADD  CONSTRAINT [DF_Comment_DanhGia]  DEFAULT ((5)) FOR [DanhGia]
GO

ALTER Procedure [dbo].[sp_AddCommentToBook](@TenDangNhap varchar(10), @TenTaiKhoan nvarchar(255), @MaSach varchar(10), @NoiDung ntext, @DanhGia int)
As
Begin
	Declare @ThoiGian DateTime = GETDATE();
	If (@TenDangNhap Is Null)
		Insert Into Comment Values (NULL, @TenTaiKhoan, @MaSach, @NoiDung, @ThoiGian, @DanhGia);
	Else
		Insert Into Comment Values (@TenDangNhap, NULL, @MaSach, @NoiDung, @ThoiGian, @DanhGia);
	Return;
End
GO

ALTER Function [dbo].[fc_GetAllCommentOfBook](@MaSach varchar(10)) Returns @KetQua Table(
	TenTaiKhoan nvarchar(255),
	NoiDung ntext,
	ThoiGian varchar(20),
	DanhGia int
)
As
Begin
	Insert Into @KetQua
		Select dbo.fc_GetNameOfAccount(TenDangNhap), NoiDung, dbo.fc_GetTimeComment(ThoiGian), DanhGia 
			From Comment Where (@MaSach = MaSach) And (TenTaiKhoan Is Null)
	Insert Into @KetQua
		Select TenTaiKhoan, NoiDung, dbo.fc_GetTimeComment(ThoiGian), DanhGia 
			From Comment Where (@MaSach = MaSach) And (TenDangNhap Is Null)
	Return;
End