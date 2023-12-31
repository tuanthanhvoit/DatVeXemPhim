USE [master]
GO
/****** Object:  Database [QLPhim]    Script Date: 07/02/2014 10:32:41 ******/
CREATE DATABASE [QLPhim] ON  PRIMARY 
( NAME = N'QLPhim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLPhim.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLPhim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLPhim_log.LDF' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLPhim] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLPhim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLPhim] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLPhim] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLPhim] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLPhim] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLPhim] SET ARITHABORT OFF
GO
ALTER DATABASE [QLPhim] SET AUTO_CLOSE ON
GO
ALTER DATABASE [QLPhim] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLPhim] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLPhim] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLPhim] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLPhim] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLPhim] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLPhim] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLPhim] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLPhim] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLPhim] SET  ENABLE_BROKER
GO
ALTER DATABASE [QLPhim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLPhim] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLPhim] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLPhim] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLPhim] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLPhim] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLPhim] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLPhim] SET  READ_WRITE
GO
ALTER DATABASE [QLPhim] SET RECOVERY FULL
GO
ALTER DATABASE [QLPhim] SET  MULTI_USER
GO
ALTER DATABASE [QLPhim] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLPhim] SET DB_CHAINING OFF
GO
USE [QLPhim]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[HoTen] [nvarchar](max) NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DienThoai] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON
INSERT [dbo].[UserProfile] ([UserId], [UserName], [HoTen], [GioiTinh], [NgaySinh], [DienThoai], [DiaChi], [Email]) VALUES (1, N'honghanh', N'lehonghanh', 0, CAST(0x0000811E00000000 AS DateTime), N'0123456789', NULL, N'lehonghanh62@gmail.com')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
/****** Object:  Table [dbo].[Raps]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raps](
	[RapId] [int] IDENTITY(1,1) NOT NULL,
	[TenRap] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RapId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Raps] ON
INSERT [dbo].[Raps] ([RapId], [TenRap], [DiaChi]) VALUES (1, N'GLX KINH DƯƠNG VƯƠNG', N'718bis Kinh Dương Vương, Q6, TpHCM.')
INSERT [dbo].[Raps] ([RapId], [TenRap], [DiaChi]) VALUES (2, N'GLX NGUYỄN DU', N'116 Nguyễn Du, Quận 1, Tp.HCM')
INSERT [dbo].[Raps] ([RapId], [TenRap], [DiaChi]) VALUES (3, N'GLX NGUYỄN TRÃI', N'230 Nguyễn Trãi, Quận 1, Tp.HCM')
INSERT [dbo].[Raps] ([RapId], [TenRap], [DiaChi]) VALUES (4, N'GLX TÂN BÌNH', N'246 Nguyễn Hồng Đào, Q.TB, Tp.HCM')
SET IDENTITY_INSERT [dbo].[Raps] OFF
/****** Object:  Table [dbo].[Phongs]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phongs](
	[PhongId] [int] IDENTITY(1,1) NOT NULL,
	[RapId] [int] NOT NULL,
	[TenPhong] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PhongId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Phongs] ON
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (1, 1, N'A')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (2, 1, N'B')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (3, 1, N'C')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (4, 1, N'D')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (5, 1, N'E')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (6, 2, N'A')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (7, 2, N'B')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (8, 2, N'C')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (9, 2, N'D')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (10, 2, N'E')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (11, 3, N'A')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (12, 3, N'B')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (13, 3, N'C')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (14, 3, N'D')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (15, 3, N'E')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (16, 4, N'A')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (17, 4, N'B')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (18, 4, N'C')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (19, 4, N'D')
INSERT [dbo].[Phongs] ([PhongId], [RapId], [TenPhong]) VALUES (20, 4, N'E')
SET IDENTITY_INSERT [dbo].[Phongs] OFF
/****** Object:  Table [dbo].[DangPhims]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangPhims](
	[DangPhimId] [int] IDENTITY(1,1) NOT NULL,
	[TenDang] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[DangPhimId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DangPhims] ON
INSERT [dbo].[DangPhims] ([DangPhimId], [TenDang]) VALUES (1, N'2D - Phụ Đề')
INSERT [dbo].[DangPhims] ([DangPhimId], [TenDang]) VALUES (2, N'2D - Lồng Tiếng')
INSERT [dbo].[DangPhims] ([DangPhimId], [TenDang]) VALUES (3, N'3D - Phụ Đề')
INSERT [dbo].[DangPhims] ([DangPhimId], [TenDang]) VALUES (4, N'3D - Lồng Tiếng')
SET IDENTITY_INSERT [dbo].[DangPhims] OFF
/****** Object:  Table [dbo].[Ghes]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ghes](
	[GheId] [int] IDENTITY(1,1) NOT NULL,
	[LoaiGhe] [bit] NOT NULL,
	[DayGhe] [nvarchar](max) NULL,
	[SoGhe] [int] NOT NULL,
	[GiaTien] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GheId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ghes] ON
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (1, 0, N'A', 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (2, 0, N'A', 2, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (3, 0, N'A', 3, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (4, 0, N'A', 4, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (5, 0, N'A', 5, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (6, 0, N'A', 6, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (7, 0, N'A', 7, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (8, 0, N'A', 8, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (9, 0, N'B', 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (10, 0, N'B', 2, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (11, 0, N'B', 3, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (12, 0, N'B', 4, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (13, 0, N'B', 5, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (14, 0, N'B', 6, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (15, 0, N'B', 7, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (16, 0, N'B', 8, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (17, 0, N'B', 9, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (18, 0, N'B', 10, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (19, 0, N'C', 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (20, 0, N'C', 2, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (21, 1, N'C', 3, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (22, 1, N'C', 4, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (23, 1, N'C', 5, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (24, 1, N'C', 6, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (25, 1, N'C', 7, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (26, 1, N'C', 8, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (27, 0, N'C', 9, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (28, 0, N'C', 10, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (29, 0, N'D', 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (30, 1, N'D', 2, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (31, 1, N'D', 3, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (32, 1, N'D', 4, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (33, 1, N'D', 5, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (34, 1, N'D', 6, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (35, 1, N'D', 7, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (36, 1, N'D', 8, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (37, 1, N'D', 9, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (38, 0, N'D', 10, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (39, 0, N'E', 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (40, 0, N'E', 2, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (41, 1, N'E', 3, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (42, 1, N'E', 4, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (43, 1, N'E', 5, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (44, 1, N'E', 6, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (45, 1, N'E', 7, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (46, 1, N'E', 8, CAST(170000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (47, 0, N'E', 9, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (48, 0, N'E', 10, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (49, 0, N'F', 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (50, 0, N'F', 2, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (51, 0, N'F', 3, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (52, 0, N'F', 4, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (53, 0, N'F', 5, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (54, 0, N'F', 6, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (55, 0, N'F', 7, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Ghes] ([GheId], [LoaiGhe], [DayGhe], [SoGhe], [GiaTien]) VALUES (56, 0, N'F', 8, CAST(120000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Ghes] OFF
/****** Object:  Table [dbo].[DichVus]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVus](
	[DichVuId] [int] IDENTITY(1,1) NOT NULL,
	[TenDichVu] [nvarchar](max) NULL,
	[GiaTien] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DichVuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'member')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A35B015423BF AS DateTime), NULL, 1, NULL, 0, N'APGvNlsYnGtnE9uKqii9lDSprnliWYQg9IguhenHRyrpuo4Qj7ta8BdvuroJWZP+rg==', CAST(0x0000A35B015423BF AS DateTime), N'', NULL, NULL)
/****** Object:  Table [dbo].[LoaiPhims]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhims](
	[LoaiPhimId] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoaiPhimId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoaiPhims] ON
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (1, N'Hành Động')
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (2, N'Khoa Học Viễn Tưởng')
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (3, N'Phiêu Lưu')
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (4, N'Tình Cảm Lãng Mạng')
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (5, N'Tiểu Thuyết')
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (6, N'Hài Hước')
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (7, N'Hoạt Hình')
INSERT [dbo].[LoaiPhims] ([LoaiPhimId], [TenLoai]) VALUES (8, N'Tâm Lý')
SET IDENTITY_INSERT [dbo].[LoaiPhims] OFF
/****** Object:  Table [dbo].[XuatChieus]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuatChieus](
	[XuatChieuId] [int] IDENTITY(1,1) NOT NULL,
	[GioBatDau] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[XuatChieuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[XuatChieus] ON
INSERT [dbo].[XuatChieus] ([XuatChieuId], [GioBatDau]) VALUES (1, CAST(0x0700E49F89790000 AS Time))
SET IDENTITY_INSERT [dbo].[XuatChieus] OFF
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 2)
/****** Object:  Table [dbo].[DatVes]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatVes](
	[DatveId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ThanhTien] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DatveId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phims]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phims](
	[PhimId] [int] IDENTITY(1,1) NOT NULL,
	[LoaiPhimId] [int] NOT NULL,
	[DangPhimId] [int] NOT NULL,
	[TenPhim] [nvarchar](max) NULL,
	[AnhDaiDien] [nvarchar](max) NULL,
	[MoTaPhim] [nvarchar](max) NULL,
	[ThoiLuong] [int] NOT NULL,
	[LinkTrailer] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PhimId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Phims] ON
INSERT [dbo].[Phims] ([PhimId], [LoaiPhimId], [DangPhimId], [TenPhim], [AnhDaiDien], [MoTaPhim], [ThoiLuong], [LinkTrailer]) VALUES (1, 7, 3, N'BÍ KÍP LUYỆN RỒNG ( 3D LỒNG TIẾNG)', N'movie/How_to_train_your_Dragon_300(1).jpg', N'Bí Kíp Luyện Rồng 2 - How To Train Your Dragon 2 là phần thứ hai ly kỳ của bộ ba tác phẩm sử thi, bộ phim tái hiện lại lại thế giới giả tưởng của Hiccup (Baruchel) và Toothless (Răng Sún) năm năm sau đó. Toothless (Răng Sún) và Hiccup sẽ trở lại cho cuộc phiêu lưu lớn hơn, và cũng không thiếu những tràn cười cùng những trận đánh đầy kịch tính. Cuộc phiêu lưu mới dẫn họ đến việc phát hiện ra một hang đá bí mật mà ở đó có hàng trăm con rồng hoang dã mới và bí ẩn Dragon Rider. Và rồi họ bị cuốn vào một cuộc chiến để bảo vệ hòa bình. Hiccup (Baruchel) và Toothless (Răng Sún) phải đoàn kết đứng lên cho những gì họ tin tưởng và phải thừa nhận rằng chỉ có cùng nhau họ có sức mạnh để thay đổi tương lai của cả hai.', 120, N'https://www.youtube.com/watch?v=bCv1DV0VxCk')
INSERT [dbo].[Phims] ([PhimId], [LoaiPhimId], [DangPhimId], [TenPhim], [AnhDaiDien], [MoTaPhim], [ThoiLuong], [LinkTrailer]) VALUES (5, 7, 1, N'BÍ KÍP LUYỆN RỒNG', N'movie/How_to_train_your_Dragon_300(1).jpg', N'Bí Kíp Luyện Rồng 2 - How To Train Your Dragon 2 là phần thứ hai ly kỳ của bộ ba tác phẩm sử thi, bộ phim tái hiện lại lại thế giới giả tưởng của Hiccup (Baruchel) và Toothless (Răng Sún) năm năm sau đó. Toothless (Răng Sún) và Hiccup sẽ trở lại cho cuộc phiêu lưu lớn hơn, và cũng không thiếu những tràn cười cùng những trận đánh đầy kịch tính. Cuộc phiêu lưu mới dẫn họ đến việc phát hiện ra một hang đá bí mật mà ở đó có hàng trăm con rồng hoang dã mới và bí ẩn Dragon Rider. Và rồi họ bị cuốn vào một cuộc chiến để bảo vệ hòa bình. Hiccup (Baruchel) và Toothless (Răng Sún) phải đoàn kết đứng lên cho những gì họ tin tưởng và phải thừa nhận rằng chỉ có cùng nhau họ có sức mạnh để thay đổi tương lai của cả hai.', 120, N'https://www.youtube.com/watch?v=bCv1DV0VxCk')
INSERT [dbo].[Phims] ([PhimId], [LoaiPhimId], [DangPhimId], [TenPhim], [AnhDaiDien], [MoTaPhim], [ThoiLuong], [LinkTrailer]) VALUES (6, 1, 4, N'TIÊN HẮC ÁM - MALEFICENT', N'movie/Maleficent_300.jpg', N'Câu chuyện cổ tích về nàng công chúa Aurora nay sẽ được kể lại qua một góc nhìn mới, từ một góc nhìn phản diện sẽ khiến tất cả trong chúng ta mở ra được một câu chuyện cổ tích mới.', 120, N'https://www.youtube.com/watch?v=H3LKQcLI7ls')
INSERT [dbo].[Phims] ([PhimId], [LoaiPhimId], [DangPhimId], [TenPhim], [AnhDaiDien], [MoTaPhim], [ThoiLuong], [LinkTrailer]) VALUES (8, 1, 3, N'TIÊN HẮC ÁM - MALEFICENT', N'movie/Maleficent_300.jpg', N'Câu chuyện cổ tích về nàng công chúa Aurora nay sẽ được kể lại qua một góc nhìn mới, từ một góc nhìn phản diện sẽ khiến tất cả trong chúng ta mở ra được một câu chuyện cổ tích mới.', 120, N'https://www.youtube.com/watch?v=H3LKQcLI7ls')
INSERT [dbo].[Phims] ([PhimId], [LoaiPhimId], [DangPhimId], [TenPhim], [AnhDaiDien], [MoTaPhim], [ThoiLuong], [LinkTrailer]) VALUES (9, 1, 3, N'X-MEN: DAYS OF FUTURE PAST', N'movie/Xmen_300(1).jpg', N'Nhóm người đột biến gửi Người sói (Wolverine) về quá khứ trong một nỗ lực tuyệt vọng để thay đổi lịch sử và ngăn chặn một sự kiện mà kết quả của nó có thể gây diệt vong cho cả người thường và người đột biến.', 120, N'https://www.youtube.com/watch?v=pK2zYHWDZKo')
INSERT [dbo].[Phims] ([PhimId], [LoaiPhimId], [DangPhimId], [TenPhim], [AnhDaiDien], [MoTaPhim], [ThoiLuong], [LinkTrailer]) VALUES (10, 1, 4, N'X-MEN: DAYS OF FUTURE PAST', N'movie/Xmen_300(1).jpg', N'Nhóm người đột biến gửi Người sói (Wolverine) về quá khứ trong một nỗ lực tuyệt vọng để thay đổi lịch sử và ngăn chặn một sự kiện mà kết quả của nó có thể gây diệt vong cho cả người thường và người đột biến.', 120, N'https://www.youtube.com/watch?v=pK2zYHWDZKo')
SET IDENTITY_INSERT [dbo].[Phims] OFF
/****** Object:  Table [dbo].[PhatHanhPhims]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhatHanhPhims](
	[PhatHanhPhimId] [int] IDENTITY(1,1) NOT NULL,
	[PhimId] [int] NOT NULL,
	[RapId] [int] NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhatHanhPhimId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PhatHanhPhims] ON
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (1, 9, 1, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (2, 10, 1, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (4, 6, 1, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (5, 6, 2, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (6, 6, 3, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (7, 6, 4, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (8, 8, 1, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (9, 8, 2, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (10, 8, 3, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (11, 8, 4, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (12, 1, 2, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (13, 1, 4, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (14, 5, 2, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
INSERT [dbo].[PhatHanhPhims] ([PhatHanhPhimId], [PhimId], [RapId], [NgayBatDau], [NgayKetThuc]) VALUES (15, 5, 4, CAST(0x0000A35000000000 AS DateTime), CAST(0x0000A38D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[PhatHanhPhims] OFF
/****** Object:  Table [dbo].[ChiTietDichVus]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDichVus](
	[ChiTietDichVuId] [int] IDENTITY(1,1) NOT NULL,
	[DichVuId] [int] NOT NULL,
	[DatVeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChiTietDichVuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichChieus]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichChieus](
	[LichChieuId] [int] IDENTITY(1,1) NOT NULL,
	[PhatHanhPhimId] [int] NOT NULL,
	[NgayChieu] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LichChieuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LichChieus] ON
INSERT [dbo].[LichChieus] ([LichChieuId], [PhatHanhPhimId], [NgayChieu]) VALUES (1, 1, CAST(0x0000A35000000000 AS DateTime))
INSERT [dbo].[LichChieus] ([LichChieuId], [PhatHanhPhimId], [NgayChieu]) VALUES (2, 1, CAST(0x0000A35100000000 AS DateTime))
INSERT [dbo].[LichChieus] ([LichChieuId], [PhatHanhPhimId], [NgayChieu]) VALUES (3, 1, CAST(0x0000A35200000000 AS DateTime))
INSERT [dbo].[LichChieus] ([LichChieuId], [PhatHanhPhimId], [NgayChieu]) VALUES (4, 1, CAST(0x0000A35300000000 AS DateTime))
INSERT [dbo].[LichChieus] ([LichChieuId], [PhatHanhPhimId], [NgayChieu]) VALUES (5, 1, CAST(0x0000A35400000000 AS DateTime))
INSERT [dbo].[LichChieus] ([LichChieuId], [PhatHanhPhimId], [NgayChieu]) VALUES (6, 1, CAST(0x0000A35500000000 AS DateTime))
INSERT [dbo].[LichChieus] ([LichChieuId], [PhatHanhPhimId], [NgayChieu]) VALUES (7, 1, CAST(0x0000A35600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[LichChieus] OFF
/****** Object:  Table [dbo].[ChiTietLichChieus]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLichChieus](
	[ChiTietLichChieuId] [int] IDENTITY(1,1) NOT NULL,
	[LichChieuId] [int] NOT NULL,
	[PhongId] [int] NOT NULL,
	[XuatChieuId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChiTietLichChieuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietLichChieus] ON
INSERT [dbo].[ChiTietLichChieus] ([ChiTietLichChieuId], [LichChieuId], [PhongId], [XuatChieuId]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ChiTietLichChieus] ([ChiTietLichChieuId], [LichChieuId], [PhongId], [XuatChieuId]) VALUES (2, 7, 1, 1)
SET IDENTITY_INSERT [dbo].[ChiTietLichChieus] OFF
/****** Object:  Table [dbo].[Ves]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ves](
	[VeId] [int] IDENTITY(1,1) NOT NULL,
	[GheId] [int] NOT NULL,
	[ChiTietLichChieuId] [int] NOT NULL,
	[TinhTrangGhe] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ves] ON
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (1, 1, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (2, 2, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (3, 3, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (4, 4, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (5, 5, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (6, 6, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (7, 7, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (8, 8, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (9, 9, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (10, 10, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (11, 11, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (12, 12, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (13, 13, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (14, 14, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (15, 15, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (16, 16, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (17, 17, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (18, 18, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (19, 19, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (20, 20, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (21, 21, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (22, 22, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (23, 23, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (24, 24, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (25, 25, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (26, 26, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (27, 27, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (28, 28, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (29, 29, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (30, 30, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (31, 31, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (32, 32, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (33, 33, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (34, 34, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (35, 35, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (36, 36, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (37, 37, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (38, 38, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (39, 39, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (40, 40, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (41, 41, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (42, 42, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (43, 43, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (44, 44, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (45, 45, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (46, 46, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (47, 47, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (48, 48, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (49, 49, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (50, 50, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (51, 51, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (52, 52, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (53, 53, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (54, 54, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (55, 55, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (56, 56, 1, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (57, 1, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (58, 2, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (59, 3, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (60, 4, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (61, 5, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (62, 6, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (63, 7, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (64, 8, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (65, 9, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (66, 10, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (67, 11, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (68, 12, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (69, 13, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (70, 14, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (71, 15, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (72, 16, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (73, 17, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (74, 18, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (75, 19, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (76, 20, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (77, 21, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (78, 22, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (79, 23, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (80, 24, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (81, 25, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (82, 26, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (83, 27, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (84, 28, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (85, 29, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (86, 30, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (87, 31, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (88, 32, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (89, 33, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (90, 34, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (91, 35, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (92, 36, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (93, 37, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (94, 38, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (95, 39, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (96, 40, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (97, 41, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (98, 42, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (99, 43, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (100, 44, 2, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (101, 45, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (102, 46, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (103, 47, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (104, 48, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (105, 49, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (106, 50, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (107, 51, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (108, 52, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (109, 53, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (110, 54, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (111, 55, 2, 0)
INSERT [dbo].[Ves] ([VeId], [GheId], [ChiTietLichChieuId], [TinhTrangGhe]) VALUES (112, 56, 2, 0)
SET IDENTITY_INSERT [dbo].[Ves] OFF
/****** Object:  Table [dbo].[ChiTietVes]    Script Date: 07/02/2014 10:32:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietVes](
	[ChiTietVeId] [int] IDENTITY(1,1) NOT NULL,
	[VeId] [int] NOT NULL,
	[DatVeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChiTietVeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__webpages___IsCon__5070F446]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
/****** Object:  Default [DF__webpages___Passw__5165187F]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
/****** Object:  ForeignKey [DatVe_UserProfile]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[DatVes]  WITH CHECK ADD  CONSTRAINT [DatVe_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DatVes] CHECK CONSTRAINT [DatVe_UserProfile]
GO
/****** Object:  ForeignKey [DangPhim_Phims]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[Phims]  WITH CHECK ADD  CONSTRAINT [DangPhim_Phims] FOREIGN KEY([DangPhimId])
REFERENCES [dbo].[DangPhims] ([DangPhimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phims] CHECK CONSTRAINT [DangPhim_Phims]
GO
/****** Object:  ForeignKey [LoaiPhim_Phims]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[Phims]  WITH CHECK ADD  CONSTRAINT [LoaiPhim_Phims] FOREIGN KEY([LoaiPhimId])
REFERENCES [dbo].[LoaiPhims] ([LoaiPhimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phims] CHECK CONSTRAINT [LoaiPhim_Phims]
GO
/****** Object:  ForeignKey [Phim_PhatHanhPhims]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[PhatHanhPhims]  WITH CHECK ADD  CONSTRAINT [Phim_PhatHanhPhims] FOREIGN KEY([PhimId])
REFERENCES [dbo].[Phims] ([PhimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhatHanhPhims] CHECK CONSTRAINT [Phim_PhatHanhPhims]
GO
/****** Object:  ForeignKey [Rap_PhatHanhPhims]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[PhatHanhPhims]  WITH CHECK ADD  CONSTRAINT [Rap_PhatHanhPhims] FOREIGN KEY([RapId])
REFERENCES [dbo].[Raps] ([RapId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhatHanhPhims] CHECK CONSTRAINT [Rap_PhatHanhPhims]
GO
/****** Object:  ForeignKey [ChiTietDichVu_DatVe]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[ChiTietDichVus]  WITH CHECK ADD  CONSTRAINT [ChiTietDichVu_DatVe] FOREIGN KEY([DatVeId])
REFERENCES [dbo].[DatVes] ([DatveId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDichVus] CHECK CONSTRAINT [ChiTietDichVu_DatVe]
GO
/****** Object:  ForeignKey [DichVu_ChiTietDichVus]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[ChiTietDichVus]  WITH CHECK ADD  CONSTRAINT [DichVu_ChiTietDichVus] FOREIGN KEY([DichVuId])
REFERENCES [dbo].[DichVus] ([DichVuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDichVus] CHECK CONSTRAINT [DichVu_ChiTietDichVus]
GO
/****** Object:  ForeignKey [PhatHanhPhim_LichChieus]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[LichChieus]  WITH CHECK ADD  CONSTRAINT [PhatHanhPhim_LichChieus] FOREIGN KEY([PhatHanhPhimId])
REFERENCES [dbo].[PhatHanhPhims] ([PhatHanhPhimId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LichChieus] CHECK CONSTRAINT [PhatHanhPhim_LichChieus]
GO
/****** Object:  ForeignKey [LichChieu_ChiTietLichChieus]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[ChiTietLichChieus]  WITH CHECK ADD  CONSTRAINT [LichChieu_ChiTietLichChieus] FOREIGN KEY([LichChieuId])
REFERENCES [dbo].[LichChieus] ([LichChieuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietLichChieus] CHECK CONSTRAINT [LichChieu_ChiTietLichChieus]
GO
/****** Object:  ForeignKey [Phong_ChiTietLichChieus]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[ChiTietLichChieus]  WITH CHECK ADD  CONSTRAINT [Phong_ChiTietLichChieus] FOREIGN KEY([PhongId])
REFERENCES [dbo].[Phongs] ([PhongId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietLichChieus] CHECK CONSTRAINT [Phong_ChiTietLichChieus]
GO
/****** Object:  ForeignKey [XuatChieu_ChiTietLichChieus]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[ChiTietLichChieus]  WITH CHECK ADD  CONSTRAINT [XuatChieu_ChiTietLichChieus] FOREIGN KEY([XuatChieuId])
REFERENCES [dbo].[XuatChieus] ([XuatChieuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietLichChieus] CHECK CONSTRAINT [XuatChieu_ChiTietLichChieus]
GO
/****** Object:  ForeignKey [ChiTietLichChieu_Ves]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[Ves]  WITH CHECK ADD  CONSTRAINT [ChiTietLichChieu_Ves] FOREIGN KEY([ChiTietLichChieuId])
REFERENCES [dbo].[ChiTietLichChieus] ([ChiTietLichChieuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ves] CHECK CONSTRAINT [ChiTietLichChieu_Ves]
GO
/****** Object:  ForeignKey [Ghe_Ves]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[Ves]  WITH CHECK ADD  CONSTRAINT [Ghe_Ves] FOREIGN KEY([GheId])
REFERENCES [dbo].[Ghes] ([GheId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ves] CHECK CONSTRAINT [Ghe_Ves]
GO
/****** Object:  ForeignKey [ChiTietVe_DatVe]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[ChiTietVes]  WITH CHECK ADD  CONSTRAINT [ChiTietVe_DatVe] FOREIGN KEY([DatVeId])
REFERENCES [dbo].[DatVes] ([DatveId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietVes] CHECK CONSTRAINT [ChiTietVe_DatVe]
GO
/****** Object:  ForeignKey [Ve_ChiTietVes]    Script Date: 07/02/2014 10:32:43 ******/
ALTER TABLE [dbo].[ChiTietVes]  WITH CHECK ADD  CONSTRAINT [Ve_ChiTietVes] FOREIGN KEY([VeId])
REFERENCES [dbo].[Ves] ([VeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietVes] CHECK CONSTRAINT [Ve_ChiTietVes]
GO
