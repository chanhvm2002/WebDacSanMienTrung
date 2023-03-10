USE [master]
GO
/****** Object:  Database [g12shop]    Script Date: 11/8/2022 6:18:33 PM ******/
CREATE DATABASE [g12shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'g12shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\g12shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'g12shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\g12shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [g12shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [g12shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [g12shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [g12shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [g12shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [g12shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [g12shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [g12shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [g12shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [g12shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [g12shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [g12shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [g12shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [g12shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [g12shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [g12shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [g12shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [g12shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [g12shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [g12shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [g12shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [g12shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [g12shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [g12shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [g12shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [g12shop] SET  MULTI_USER 
GO
ALTER DATABASE [g12shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [g12shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [g12shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [g12shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [g12shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [g12shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [g12shop] SET QUERY_STORE = OFF
GO
USE [g12shop]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[hashPassword] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[isEnabled] [bit] NOT NULL,
	[authProvider] [varchar](15) NULL,
	[resetPasswordToken] [varchar](30) NULL,
	[verificationCode] [varchar](64) NULL,
	[createdDate] [datetime] NOT NULL,
	[imgUrl] [varchar](255) NULL,
	[roleId] [bigint] NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[isDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderId] [bigint] NULL,
	[productId] [bigint] NULL,
	[price] [decimal](12, 3) NOT NULL,
	[quantity] [int] NOT NULL,
	[statusOrder] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[accountId] [bigint] NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[statusOrder] [nvarchar](255) NOT NULL,
	[createdDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_images](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[productId] [bigint] NULL,
	[imgName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_reviews]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_reviews](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[productId] [bigint] NULL,
	[description] [ntext] NULL,
	[accountId] [bigint] NULL,
	[createdDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_types]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[slug] [nchar](50) NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_product_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[categoryId] [bigint] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](12, 3) NOT NULL,
	[imgName] [varchar](255) NOT NULL,
	[description] [ntext] NOT NULL,
	[discount] [int] NULL,
	[slug] [varchar](255) NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[productTypeId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/8/2022 6:18:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accounts] ON 

INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (9, N'adm', N'admin', N'$2a$10$7YIj5SGLAAev58xzTj6y3Owj/0e9ZVBZy9Hoc0nXxeysm8wovQUY6', N'adminn12@dacsanmientrung.com', 1, NULL, NULL, NULL, CAST(N'2022-10-27T16:43:24.587' AS DateTime), N'adm.png', 1, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (10, N'minhtq', N'Trịnh Quốc Minh', N'$2a$10$7YIj5SGLAAev58xzTj6y3Owj/0e9ZVBZy9Hoc0nXxeysm8wovQUY6', N'minhtq@gmail.com', 1, NULL, NULL, NULL, CAST(N'2022-10-27T16:44:08.067' AS DateTime), N'minh.png', 1, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (11, N'duyhm', N'Hoàng Minh Duy', N'$2a$10$7YIj5SGLAAev58xzTj6y3Owj/0e9ZVBZy9Hoc0nXxeysm8wovQUY6', N'duyhm@gmail.com', 1, NULL, NULL, NULL, CAST(N'2022-10-27T16:44:29.397' AS DateTime), N'duy.png', 1, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (12, N'thaimx', N'Mai Xuân Thái', N'$2a$10$7YIj5SGLAAev58xzTj6y3Owj/0e9ZVBZy9Hoc0nXxeysm8wovQUY6', N'thaimx@gmail.com', 1, NULL, NULL, NULL, CAST(N'2022-10-27T16:44:46.940' AS DateTime), N'thai.png', 1, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (13, N'lamnh', N'Nguyễn Hùng Lâm', N'$2a$10$7YIj5SGLAAev58xzTj6y3Owj/0e9ZVBZy9Hoc0nXxeysm8wovQUY6', N'lamnh@gmai.com', 1, NULL, NULL, NULL, CAST(N'2022-10-27T16:45:30.873' AS DateTime), N'lam.png', 1, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (14, N'tanln', N'Lâm Nhựt Tân', N'$2a$10$7YIj5SGLAAev58xzTj6y3Owj/0e9ZVBZy9Hoc0nXxeysm8wovQUY6', N'tanln@gmail.com', 1, NULL, NULL, NULL, CAST(N'2022-10-27T16:45:53.413' AS DateTime), N'tan.png', 1, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (15, N'lapnd', N'Nguyễn Duy Lập', N'$2a$10$7YIj5SGLAAev58xzTj6y3Owj/0e9ZVBZy9Hoc0nXxeysm8wovQUY6', N'lapnd@gmail.com', 1, NULL, NULL, NULL, CAST(N'2022-10-27T16:46:25.940' AS DateTime), N'lap.png', 1, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (17, N'nguyen', N'Phạm Lê Vũ Nguyên', N'vunguyen', N'nguyen@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:47:06.233' AS DateTime), N'nguyen.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (18, N'thuan', N'Nguyễn Đức Thuận', N'ducthuan', N'thuan@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:47:37.580' AS DateTime), N'thuan.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (19, N'kiet', N'Lê Văn Anh Kiệt', N'anhkiet', N'kiet@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:48:44.480' AS DateTime), N'kiet.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (20, N'dat', N'Phạm Minh Đạt', N'minhdat', N'dat@gamil.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:49:09.900' AS DateTime), N'dat.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (21, N'vu', N'Lê Trường Vũ', N'truongvu', N'vu@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:49:30.860' AS DateTime), N'vu.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (22, N'quan', N'Nguyễn Minh Quân', N'minhquan', N'quan@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:49:52.203' AS DateTime), N'quan.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (23, N'chi', N'Trần Công Chí', N'congchi', N'chi@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:50:11.440' AS DateTime), N'chi.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (24, N'phat', N'Nguyễn Quang Phát', N'quanphat', N'phat@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:50:28.337' AS DateTime), N'phat.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (25, N'an', N'Phạm Minh An', N'minhan', N'anh@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:50:47.187' AS DateTime), N'an.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (26, N'binh', N'Nguyễn Khánh Bình', N'khanhbinh', N'binh@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:51:10.227' AS DateTime), N'binh.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (27, N'khanh', N'Lê Duy Khánh', N'duykhanh', N'khanh@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:51:44.377' AS DateTime), N'khanh.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (28, N'pha', N'Nguyễn Minh Pha', N'minhpha', N'pha@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:52:06.907' AS DateTime), N'pha.png', 2, 0)
INSERT [dbo].[accounts] ([id], [username], [fullname], [hashPassword], [email], [isEnabled], [authProvider], [resetPasswordToken], [verificationCode], [createdDate], [imgUrl], [roleId], [isDeleted]) VALUES (29, N'nhut', N'Lý Minh Nhựt', N'minhnhut', N'nhut@gmail.com', 0, NULL, NULL, NULL, CAST(N'2022-10-27T16:52:27.920' AS DateTime), N'nhut.png', 2, 0)
SET IDENTITY_INSERT [dbo].[accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (1, N'Thanh Hoá', N'thanh-hoa', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (2, N'Nghệ An', N'nghe-an', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (3, N'Hà Tĩnh', N'ha-tinh', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (4, N'Quảng Bình', N'quang-binh', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (5, N'Quảng Trị', N'quang-tri', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (6, N'Thừa Thiên - Huế', N'thua-thien-hue', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (7, N'Kon Tum', N'kon-tum', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (8, N'Gia Lai', N'gia-lai', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (9, N'Đắk Lắk', N'dak-lak', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (10, N'Đắk Nông', N'dak-nong', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (11, N'Lâm Đồng', N'lam-dong', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (12, N'Đà Nẵng', N'da-nang', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (13, N'Quảng Nam', N'quang-nam', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (14, N'Quảng Ngãi', N'quang-ngai', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (15, N'Bình Định', N'binh-dinh', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (16, N'Phú Yên', N'phu-yen', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (17, N'Khánh Hoà', N'khanh-hoa', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (18, N'Ninh Thuận', N'ninh-thuan', 0)
INSERT [dbo].[categories] ([id], [name], [slug], [isDeleted]) VALUES (19, N'Bình Thuận', N'binh-thuan', 0)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[product_reviews] ON 

INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (1, 4, N'Ngon', 11, CAST(N'2022-11-04T17:30:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (2, 4, N'Cho xin cái địa chỉ', 10, CAST(N'2022-11-04T08:00:00.000' AS DateTime))

INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (3, 5, N'Mì quảng hấp dẫn quá chuẩn vị miền Trung luôn', 9, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (4, 5, N'Món ngon, nước lèo vừa ăn, đầy đủ gia vị', 12, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (5, 6, N'Nem nướng có vị nem nướng', 13, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (6, 6, N'Rất ngon đã ăn nhiều lần rồi sẽ ủng hộ tiếp', 14, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (7, 7, N'Bánh xèo ngon nhưng nước mắm hơi mặn', 15, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (8, 7, N'Banh ngon giòn, đóng gói ổn', 16, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (9, 8, N'Bánh canh ngon nhứt nách luôn ạ', 17, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (10, 8, N'Tuyệt vời ông mặt trời', 18, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (11, 9, N'Cơm gà nhiều, miếng gà siêu to khổng lồ', 19, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (12, 9, N'Cơm ngon hợp giá tiền', 20, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (13, 10, N'Bánh ngon dữ thần mèn đét ơi, mai mốt ủng hộ tiếp', 12, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (14, 10, N'Bánh ít gất ngon 50 cho quán luôn', 22, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (15, 11, N'Bánh đạp có vị bánh đập =))', 23, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (16, 11, N'Bánh ngon quá', 24, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (17, 12, N'Gỏi cá mai ngon có hương thơm rất tuyệt', 25, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (18, 12, N'Gỏi ngon mềm xen lẫn vị chua cay', 26, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (19, 15, N'Quá đỉnh chua chua dai dai', 27, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (20, 15, N'Hương vị thơm ngon, bíu ti phun', 28, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (21, 16, N'Bún cá ngon, cá rất là tươi luôn', 29, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (22, 16, N'Tuyệt vời ông mặt trời', 9, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (23, 17, N'Bánh bột lọc dai ngon, nước mắm vừa ăn', 10, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (24, 17, N'Đồ ăn vừa khẩu vị nên không có gì để nói rồi', 11, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (25, 18, N'Ngonnnnnn, nhưng rau hơi ít', 12, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (26, 18, N'Ngon, nem ổn', 13, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (27, 19, N'Sứa giòn dai dai ăn đã cái miệng, mình sẽ ủng hộ nghennn', 14, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (28, 19, N'Ngon lắm khách quen của quán, mọi người nên mua ăn thử nha', 15, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (29, 20, N'Bánh căn ăn lúc nào cũng ngon không bị ngán', 16, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (30, 20, N'Món ăn ngon khỏi phải chê sẽ ủng hộ tiếp', 10, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (31, 21, N'Cao lầu ngon vãi chưởng', 17, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (32, 21, N'Cho xin cái địa chỉ', 18, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (33, 22, N'Có lúc ngon có lúc không ngon', 19, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (34, 22, N'Nhìn chung là ăn được, giá hơi cao tí', 20, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (35, 23, N'Cháu lương thơm ngon, chuẩn vị', 21, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (36, 23, N'Cáu lương không tanh, 10 điểm 10 điểm', 22, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (37, 24, N'Nước lẩu có vị khá ngon', 23, CAST(N'2022-11-04T08:00:00.000' AS DateTime))
INSERT [dbo].[product_reviews] ([id], [productId], [description], [accountId], [createdDate]) VALUES (38, 24, N'Lẩu ngon, cá tươi, rau đầy đủ', 24, CAST(N'2022-11-04T08:00:00.000' AS DateTime))


SET IDENTITY_INSERT [dbo].[product_reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[product_types] ON 

INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (1, N'Lẩu', N'lau                                               ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (2, N'Bún', N'bun                                               ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (5, N'Cơm', N'com                                               ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (6, N'Mì', N'mi                                                ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (7, N'Bánh', N'banh                                              ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (9, N'Gỏi', N'goi                                               ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (10, N'Nem', N'nem                                               ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (11, N'Cháo', N'chao                                              ', 0)
INSERT [dbo].[product_types] ([id], [name], [slug], [isDeleted]) VALUES (12, N'Hải Sản', N'hai-san                                           ', 0)
SET IDENTITY_INSERT [dbo].[product_types] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (4, N'Bún bò Huế', 1, 50, CAST(50000.000 AS Decimal(12, 3)), N'bun-bo-hue.png', N'Bún bò Huế', NULL, N'bun-bo-hue', 0, 2)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (5, N'Mì Quảng', 2, 12, CAST(45000.000 AS Decimal(12, 3)), N'mi-quang.png', N'Mì Quảng', 20, N'mi-quang', 0, 6)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (6, N'Nem nướng', 3, 25, CAST(60000.000 AS Decimal(12, 3)), N'nem-nuong.png', N'Nem nướng', NULL, N'nem-nuong', 0, 10)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (7, N'Bánh xèo', 4, 20, CAST(40000.000 AS Decimal(12, 3)), N'banh-xeo.png', N'Bánh xèo', NULL, N'banh-xeo', 0, 7)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (8, N'Bánh canh hẹ Phú Yên', 5, 14, CAST(45000.000 AS Decimal(12, 3)), N'banh-canh-he.png', N'Bánh canh', NULL, N'banh-canh-he', 0, 7)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (9, N'Cơm gà Tam Kỳ', 6, 35, CAST(55000.000 AS Decimal(12, 3)), N'com-ga-tam-ky.png', N'Cơm gà', NULL, N'com-ga-tam-ky', 0, 5)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (10, N'Bánh ít lá gai', 7, 16, CAST(35000.000 AS Decimal(12, 3)), N'banh-it-la-gai.png', N'Bánh ít', 20, N'banh-it-la-gai', 0, 7)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (11, N'Bánh đập', 8, 22, CAST(25000.000 AS Decimal(12, 3)), N'banh-dap.png', N'Bánh đập', NULL, N'banh-dap', 0, 7)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (12, N'Gỏi cá mai', 9, 15, CAST(55000.000 AS Decimal(12, 3)), N'goi-ca-mai.png', N'Gỏi cá mai', NULL, N'goi-ca-mai', 0, 9)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (15, N'Mực rim me', 10, 26, CAST(60000.000 AS Decimal(12, 3)), N'muc-rim-me.png', N'Mực rim me', NULL, N'muc-rim-me', 0, 12)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (16, N'Bún cá dầm', 11, 25, CAST(50000.000 AS Decimal(12, 3)), N'bun-ca-dam.png', N'Bún cá dầm', NULL, N'bun-ca-dam', 0, 2)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (17, N'Bánh bột lọc Huế', 12, 60, CAST(35000.000 AS Decimal(12, 3)), N'banh-bot-loc.png', N'Bánh bột lọc', NULL, N'banh-bot-loc', 0, 7)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (18, N'Nem chợ Huyền', 13, 55, CAST(45000.000 AS Decimal(12, 3)), N'nem-cho-huyen.png', N'Nem chợ Huyền', 50, N'nem-cho-huyen', 0, 10)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (19, N'Bún sứa Nha Trang', 14, 55, CAST(45000.000 AS Decimal(12, 3)), N'bun-sua-nha-trang.png', N'Bún sứa', NULL, N'bun-sua-nha-trang', 0, 2)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (20, N'Bánh căn', 15, 35, CAST(30000.000 AS Decimal(12, 3)), N'banh-can.png', N'Bánh căn', NULL, N'banh-can', 0, 7)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (21, N'Cao lầu', 16, 30, CAST(65000.000 AS Decimal(12, 3)), N'cao-lau.png', N'Cao lầu', 10, N'cao-lau', 0, 6)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (22, N'Cơm hến', 17, 22, CAST(55000.000 AS Decimal(12, 3)), N'com-hen.png', N'Cơm hến', NULL, N'com-hen', 0, 5)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (23, N'Cháo lươn', 18, 15, CAST(60000.000 AS Decimal(12, 3)), N'chao-luon.png', N'Cháo lươn', NULL, N'chao-luon', 0, 11)
INSERT [dbo].[products] ([id], [name], [categoryId], [quantity], [price], [imgName], [description], [discount], [slug], [isDeleted], [productTypeId]) VALUES (24, N'Lẩu cá Phan Thiết', 19, 30, CAST(60000.000 AS Decimal(12, 3)), N'lau-ca-phan-thiet.png', N'Lẩu cá', NULL, N'lau-ca-phan-thiet', 0, 1)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__accounts__AB6E61646568BFCC]    Script Date: 11/8/2022 6:18:33 PM ******/
ALTER TABLE [dbo].[accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__accounts__F3DBC57235D49281]    Script Date: 11/8/2022 6:18:33 PM ******/
ALTER TABLE [dbo].[accounts] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__products__32DD1E4C4FFCEC2D]    Script Date: 11/8/2022 6:18:33 PM ******/
ALTER TABLE [dbo].[products] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__roles__72E12F1B39F9527B]    Script Date: 11/8/2022 6:18:33 PM ******/
ALTER TABLE [dbo].[roles] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT ((0)) FOR [isEnabled]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[accounts] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[product_types] ADD  CONSTRAINT [DF_Product_types_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[product_images]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[product_reviews]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[accounts] ([id])
GO
ALTER TABLE [dbo].[product_reviews]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([productTypeId])
REFERENCES [dbo].[product_types] ([id])
GO
USE [master]
GO
ALTER DATABASE [g12shop] SET  READ_WRITE 
GO
