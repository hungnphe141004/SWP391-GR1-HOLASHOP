USE [master]
GO
/****** Object:  Database [HOLASHOP2]    Script Date: 3/29/2022 5:18:08 PM ******/
CREATE DATABASE [HOLASHOP2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HOLASHOP2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIEU\MSSQL\DATA\HOLASHOP2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HOLASHOP2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.HIEU\MSSQL\DATA\HOLASHOP2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HOLASHOP2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HOLASHOP2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HOLASHOP2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HOLASHOP2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HOLASHOP2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HOLASHOP2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HOLASHOP2] SET ARITHABORT OFF 
GO
ALTER DATABASE [HOLASHOP2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HOLASHOP2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HOLASHOP2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HOLASHOP2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HOLASHOP2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HOLASHOP2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HOLASHOP2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HOLASHOP2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HOLASHOP2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HOLASHOP2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HOLASHOP2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HOLASHOP2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HOLASHOP2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HOLASHOP2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HOLASHOP2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HOLASHOP2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HOLASHOP2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HOLASHOP2] SET RECOVERY FULL 
GO
ALTER DATABASE [HOLASHOP2] SET  MULTI_USER 
GO
ALTER DATABASE [HOLASHOP2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HOLASHOP2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HOLASHOP2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HOLASHOP2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HOLASHOP2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HOLASHOP2', N'ON'
GO
ALTER DATABASE [HOLASHOP2] SET QUERY_STORE = OFF
GO
USE [HOLASHOP2]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[UserID] [varchar](200) NULL,
	[ProductID] [varchar](200) NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[CommentDate] [date] NULL,
	[CommentDetail] [varchar](2000) NULL,
	[ProductId] [varchar](200) NULL,
 CONSTRAINT [PK__Feedback__3214EC2754D60106] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ShipInfoID] [int] NULL,
	[UserID] [varchar](200) NULL,
	[Status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupAccount]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupAccount](
	[gid] [int] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_GroupAccount_1] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupFeature]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFeature](
	[gid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_GroupFeature] PRIMARY KEY CLUSTERED 
(
	[gid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](200) NULL,
	[OrderID] [int] NULL,
	[Content] [nvarchar](1000) NULL,
	[status] [int] NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK__Notifica__3214EC272F5A7B62] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[ProductID] [varchar](200) NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK__Order_De__3214EC27C6486F59] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](200) NULL,
	[TotalPrice] [int] NULL,
	[Note] [nvarchar](2000) NULL,
	[Status] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK__Orders__3214EC278B5CB2EA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](200) NOT NULL,
	[ProductName] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[OriginalPrice] [int] NULL,
	[SellPrice] [int] NULL,
	[SalePercent] [int] NULL,
	[SubCategoryID] [int] NULL,
	[SellerID] [varchar](200) NULL,
	[Amount] [int] NULL,
	[StatusID] [int] NULL,
	[BrandID] [int] NULL,
	[height] [float] NULL,
	[width] [float] NULL,
	[weight] [float] NULL,
 CONSTRAINT [PK__Product__B40CC6ED33E4BEFA] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImg]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImg](
	[ProductID] [varchar](200) NULL,
	[ProductImgURL] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](1000) NULL,
	[ShipPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipInfo]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [int] NOT NULL,
	[CustomerName] [nvarchar](1000) NOT NULL,
	[ShippingAddress] [nvarchar](1000) NOT NULL,
	[ShipCityID] [int] NOT NULL,
	[PhoneNum] [varchar](20) NOT NULL,
	[Note] [nvarchar](2000) NULL,
	[Delivered] [bit] NOT NULL,
	[Shipper] [varchar](100) NULL,
	[f0] [bit] NOT NULL,
 CONSTRAINT [PK__ShipInfo__3214EC2766D938E5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipStatus]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [nvarchar](255) NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddress]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](200) NULL,
	[ShipName] [nvarchar](500) NULL,
	[ShipAddress] [nvarchar](1000) NULL,
	[ShipCityID] [int] NULL,
	[PhoneNum] [varchar](20) NULL,
 CONSTRAINT [PK__UserAddr__3214EC276D40E3AE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](150) NOT NULL,
	[Password] [varchar](1000) NOT NULL,
	[email] [nvarchar](1000) NULL,
	[RoleID] [int] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 3/29/2022 5:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (1, N'Local')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (2, N'Homemade')
INSERT [dbo].[Brand] ([BrandID], [BrandName]) VALUES (3, N'Unknown')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Food')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Drink')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Medical')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Others')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (2, N'Aurora', N'littemice@gmail.com', CAST(N'2022-03-03' AS Date), N'Wish i could get out of this shit place', N'1')
INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (7, N'Kaidou', N'kaidouthestrongest@gmail.com', CAST(N'2022-03-04' AS Date), N'quite strong', N'6')
INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (8, N'z', N'z@gmail.com', CAST(N'2022-03-04' AS Date), N'kha la xuong xau', N'9')
INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (9, N'kkkkkkkk', N'kkkkkkkkkkkk@gmail.com', CAST(N'2022-03-06' AS Date), N'fffffffffffff', N'2')
INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (10, N'dahlia', N'dahlia@gmail.com', CAST(N'2022-03-10' AS Date), N'delecious', N'1')
INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (11, N'ssas', N'dd@gmail.com', CAST(N'2022-03-11' AS Date), N'hhhhhhhaaaa', N'1')
INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (1011, N'Mot Con Vit', N'hieunguyenkhac14@gmail.com', CAST(N'2022-03-11' AS Date), N'Bread is a staple food prepared from a dough of flour (usually wheat) and water, usually by baking. Throughout recorded history and around the world, it has been an important part of many cultures'' diet. It is one of the oldest human-made foods, having been', N'1')
INSERT [dbo].[Comment] ([ID], [Name], [Email], [CommentDate], [CommentDetail], [ProductId]) VALUES (1012, N's', N'foreverfromis9@gmail.com', CAST(N'2022-03-28' AS Date), N'ssss', N'12')
SET IDENTITY_INSERT [dbo].[Comment] OFF
INSERT [dbo].[Feature] ([fid], [url]) VALUES (1, N'/adminlist')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (2, N'/admindelete')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (3, N'/adminadd')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (4, N'/adminupdate')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (5, N'/cart')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (6, N'/addtocart')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (7, N'/UserController')
INSERT [dbo].[Feature] ([fid], [url]) VALUES (8, N'/shiplist')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (1, N'admin')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (2, N'seller1')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'abc')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'haku1404')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'test')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'test2')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'test3')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'test4')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'Tuan')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (3, N'xyz')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (4, N'ship1')
INSERT [dbo].[GroupAccount] ([gid], [username]) VALUES (4, N'ship2')
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 1)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 2)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 3)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 4)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 5)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 6)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 7)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (1, 8)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 5)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 6)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (2, 7)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (3, 5)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (3, 6)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (3, 7)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (4, 5)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (4, 6)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (4, 7)
INSERT [dbo].[GroupFeature] ([gid], [fid]) VALUES (4, 8)
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (1, 1018, N'12', N'Trà xanh C2 vị chanh', 150000, 2)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (2, 1018, N'13', N'Thuốc hen xuyễn Seretide Evohaler', 320000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (3, 1019, N'1', N'Bread', 10000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (4, 1019, N'11', N'Trà xanh 0 độ', 150000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (5, 1017, N'1', N'Bread', 10000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (6, 1017, N'12', N'Trà xanh C2 vị chanh', 150000, 3)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (7, 1017, N'10', N'Thịt heo hầm VISSAN đóng hộp 150gram', 35000, 2)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (8, 1017, N'11', N'Trà xanh 0 độ', 150000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (9, 1017, N'12', N'Trà xanh C2 vị chanh', 150000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (10, 1017, N'13', N'Thuốc hen xuyễn Seretide Evohaler', 320000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (11, 1017, N'12', N'Trà xanh C2 vị chanh', 150000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12, 1017, N'14', N'Khẩu trang y tế Famapro', 80000, 1)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (13, 1023, N'4', N'Water', 10000, 4)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (14, 1023, N'11', N'Trà xanh 0 độ', 150000, 2)
INSERT [dbo].[Order_Detail] ([ID], [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (15, 1023, N'12', N'Trà xanh C2 vị chanh', 150000, 1)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([ID], [Name]) VALUES (1, N'Pending')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1015, N'3', 10000, N'', 1, CAST(N'2022-03-28T11:16:49.880' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1016, N'3', 2950000, N'', 1, CAST(N'2022-03-28T11:17:05.423' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1017, N'4', 250000, N'fsdfdsdsfdsffd', 1, CAST(N'2022-03-28T23:02:04.067' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1018, N'8', 620000, N'test', 1, CAST(N'2022-03-28T23:12:21.870' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1019, N'11', 160000, N'tuan', 1, CAST(N'2022-03-28T23:41:26.270' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1020, N'4', 460000, N'note', 1, CAST(N'2022-03-29T11:51:53.327' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1021, N'4', 690000, N'Note', 1, CAST(N'2022-03-29T16:22:24.810' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1022, N'4', 230000, N'xxxxxxx', 1, CAST(N'2022-03-29T16:28:22.290' AS DateTime))
INSERT [dbo].[Orders] ([ID], [UserID], [TotalPrice], [Note], [Status], [Date]) VALUES (1023, N'12', 490000, N'Note', 1, CAST(N'2022-03-29T16:35:47.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'1', N'Bread', N'Bread is a staple food prepared from a dough of flour (usually wheat) and water, usually by baking. Throughout recorded history and around the world, it has been an important part of many cultures'' diet. It is one of the oldest human-made foods, having been of significance since the dawn of agriculture, and plays an essential role in both religious rituals and secular culture.', 7000, 10000, 23, 1, N'3', 100, 2, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'10', N'Thịt heo hầm VISSAN đóng hộp 150gram', N'Thịt heo hầm Vissan đóng hộp 150gr được làm từ các thành phần như thịt heo, muối, đường, hành, tỏi, nước màu caramen, chất điều vị... Sản phẩm có hương vị thơm ngon đậm mùi thịt heo hầm, phù hợp sử dụng hàng ngày trong gia đình.
Thịt heo hầm Vissan đóng hộp 150gr là sản phẩm đến từ thương hiệu nổi tiếng Vissan, được sản xuất theo công nghệ hiện đại nên đảm bảo chất lượng và an toàn vệ sinh thực phẩm. Thịt heo hầm Vissan cung cấp nguồn dinh dưỡng cho cả gia đình, có thể ăn kèm với cơm hoặc ăn kèm với salad, bánh mì.', 40000, 35000, 5, 1, N'2', 90, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'11', N'Trà xanh 0 độ', N'Trà xanh 0 độ 500ml/ 24  chai / thùng', 160000, 150000, 0, 2, N'2', 120, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'12', N'Trà xanh C2 vị chanh', N'Trà xanh C2 hương chanh chai 360ml/ 24 chai / thùng', 160000, 150000, 0, 2, N'2', 240, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'13', N'Thuốc hen xuyễn Seretide Evohaler', N'
Thuốc xịt hen phế quản Seretide Evohaler 25/250', 325000, 320000, 0, 3, N'2', 560, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'14', N'Khẩu trang y tế Famapro', N'Khẩu trang y tế 4 lớp bảo vệ bạn khỏi vi khuẩn và vi-rút', 90000, 80000, 0, 4, N'2', 80, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'15', N'Khẩu trang y tế Niva', N'Khẩu trang y tế Niva N95 25 chiếc/ hộp', 45000, 40000, 0, 4, N'2', 50, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'16', N'Xà phòng Life Bouy', N'Xà phòng tắm rửa tay LifeBouy tiêu diệt vi  khuẩn gây hại', 14000, 12000, 0, 4, N'2', 77, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'17', N'Mì ăn liền Hảo Hảo', N'Thùng 30 gói mì ăn liền hảo hảo', 115000, 110000, 0, 1, N'2', 59, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'18', N'Phở bò Vifon', N'Phở bò vifon đậm chất Việt Nam', 20000, 20000, 0, 1, N'2', 32, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'19', N'Bình nước uống Aqua', N'Sản phẩm: Nước uống AQUA Water 20l, Loại nước: Nước tinh khiết, Nhà sản xuất: Công ty Trường Phát Đạt, Dung tích: Bình 20 Lít', 25000, 25000, 0, 2, N'2', 15, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'2', N'Medical Protective Clothing', N'Personal protective equipment (PPE) is protective clothing, helmets, goggles, or other garments or equipment designed to protect the wearer''s body from injury or infection.', 120000, 150000, 15, 3, N'2', 100, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'20', N'Kit Xét Nghiệm Covid-19 Việt Á', N'Kit test nhanh covid-19 cho 50 người', 550000, 525000, 5, 3, N'2', 500, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'21', N'Cháo Gấu Đỏ', N'Thùng Cháo Gấu Đỏ 50 gói x 50g Vị Gà Thịt Bằm - Cháo gà', 10000, 10000, 0, 1, N'2', 27, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'22', N'Unknown', N'test1', 10, 30, 10, 1, N'1', 111, 1, 1, 1, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'23', N'Unknown', N'test1', 10, 30, 10, 1, N'1', 111, 1, 1, 1, 1, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'3', N'N95 Mask', N'A mask is an object normally worn on the face, typically for protection, disguise, performance, or entertainment. Masks have been used since antiquity for both ceremonial and practical purposes, as well as in the performing arts and for entertainment. They are usually worn on the face, although they may also be positioned for effect elsewhere on the wearer''s body.', 15000, 20000, 0, 3, N'2', 100, 1, 2, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'4', N'Water', N'Water (chemical formula H2O) is an inorganic, transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earth''s hydrosphere and the fluids of all known living organisms. It is vital for all known forms of life, even though it provides no calories or organic nutrients. Its chemical formula, H2O, indicates that each of its molecules contains one oxygen and two hydrogen atoms, connected by covalent bonds.', 8000, 10000, 0, 2, N'2', 100, 1, 2, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'5', N'Hand Sanitizer', N'A substance for making your hands clean and free from bacteria or viruses, or a bottle of this substance', 25000, 30000, 0, 3, N'2', 100, 1, 2, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'6', N'Bột giặt Omo', N'Thương hiệu : OMO Sử dụng : Giặt tay Nơi sản xuất : Việt Nam Mùi hương : Tinh dầu thơm nồng nàn Hòa tan, thấm sâu vào từng sợi vải giúp xoáy bay vết bẩn', 205000, 200000, 0, 4, N'2', 150, 1, 3, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'7', N'Bột giặt Tide', N'Trắng đột phá dễ dàng với Bột giặt Tide. 
Công thức đánh bay vết bẩn nhanh chóng. 
Bột giặt Tide tan nhanh gấp 5 lần so với Bột giặt thông thường.
 Sản phẩm có khả năng giặt sạch nhanh chóng; đánh tan mọi vết bẩn; giúp quần áo trắng sáng hơn.
 Hương thơm dịu nhẹ.', 175000, 170000, 0, 4, N'2', 300, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'8', N'Pate gan  heo Hạ Long', N'Gồm thịt heo, gan heo,...được chọn lựa kĩ càng, quy trình chế biến được kiểm tra nghiêm ngặt, không lẫn tạp chất hóa học độc hại, luôn mang đến chất lượng tốt nhất cho người tiêu dùng. Pate gan heo Hạ Long hộp 170g đóng hộp nhỏ gọn, tiện lợi sử dụng trong gia đình hoặc mang đi du lịch, dã ngoại.', 25000, 20000, 0, 1, N'2', 260, 1, 1, 0, 0, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Description], [OriginalPrice], [SellPrice], [SalePercent], [SubCategoryID], [SellerID], [Amount], [StatusID], [BrandID], [height], [width], [weight]) VALUES (N'9', N'Hộp trứng gà V-Food', N'Cung cấp nhiều chất dinh dưỡng tốt cho cơ thể Đảm bảo an toàn vệ sinh thực phẩm Có thể chế biến thành nhiều món ăn ngon', 22500, 20000, 0, 1, N'2', 140, 1, 1, 0, 0, 0)
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'2', N'Image/Medial-Protective-Clothing.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'3', N'Image/N95-Mask.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'4', N'Image/Water.png')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'5', N'Image/Hand-Sanitizer.png')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'6', N'Image/botgiatomo.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'7', N'Image/BotgiatTide.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'8', N'Image/pate-gan-ha-long.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'9', N'Image/TrunggaVfood.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'10', N'Image/ThitheohamVissan.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'11', N'Image/traxanh0do.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'12', N'Image/traxanhc2.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'13', N'Image/Thuochenxuyen.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'14', N'Image/khautrangfamapro.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'15', N'Image/KhautrangNiva.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'16', N'Image/xaphonglifebouy.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'20', N'Image/kitxetnghiemvieta.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'17', N'Image/mianlienhaohao.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'18', N'Image/phobo.jpg')
INSERT [dbo].[ProductImg] ([ProductID], [ProductImgURL]) VALUES (N'19', N'Image/NuocuongAqua.jpg')
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([StatusID], [StatusName]) VALUES (1, N'Available')
INSERT [dbo].[ProductStatus] ([StatusID], [StatusName]) VALUES (2, N'StopBusiness')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Seller')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Customer')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Shipper')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Ship] ON 

INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (1, N'An Giang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (2, N'Ba Ria - Vung Tau', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (3, N'Bac Lieu', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (4, N'Bac Can', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (5, N'Bac Giang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (6, N'Bac Ninh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (7, N'Ben Tre', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (8, N'Binh Duong', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (9, N'Binh Dinh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (10, N'Binh Phuoc', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (11, N'Binh Thuan', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (12, N'Ca Mau', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (13, N'Cao Bang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (14, N'Can Tho ', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (15, N'Da Nang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (16, N'Dak Lak', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (17, N'Dak Nong', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (18, N'Dien Bien', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (19, N'Dong Nai', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (20, N'Dong Thap', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (21, N'Gia Lai', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (22, N'Ha Giang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (23, N'Ha Nam', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (24, N'Ha Noi', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (25, N'Ha Tinh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (26, N'Hai Duong', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (27, N'Hai Phong', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (28, N'Hoa Binh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (29, N'Ho Chi Minh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (30, N'Hau Giang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (31, N'Hung Yen', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (32, N'Khanh Hoa', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (33, N'Kien Giang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (34, N'Kon Tum', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (35, N'Lai Chau', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (36, N'Lao Cai', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (37, N'Lang Son', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (38, N'Lam Dong', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (39, N'Long An', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (40, N'Nam Dinh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (41, N'Nghe An', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (42, N'Ninh Binh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (43, N'Ninh Thuan', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (44, N'Phu Tho', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (45, N'Phu Yen', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (46, N'Quang Binh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (47, N'Quang Nam', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (48, N'Quang Ngai', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (49, N'Quang Ninh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (50, N'Quang Tri', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (51, N'Soc Trang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (52, N'Son La', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (53, N'Tay Ninh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (54, N'Thai Binh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (55, N'Thai Nguyen', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (56, N'Thanh Hoa', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (57, N'Thua Thien Hue', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (58, N'Tien Giang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (59, N'Tra Vinh', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (60, N'Tuyen Quang', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (61, N'Vinh Long', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (62, N'Vinh Phuc', 30000)
INSERT [dbo].[Ship] ([id], [CityName], [ShipPrice]) VALUES (63, N'Yen Bai', 30000)
SET IDENTITY_INSERT [dbo].[Ship] OFF
SET IDENTITY_INSERT [dbo].[ShipInfo] ON 

INSERT [dbo].[ShipInfo] ([ID], [Order_ID], [CustomerName], [ShippingAddress], [ShipCityID], [PhoneNum], [Note], [Delivered], [Shipper], [f0]) VALUES (35, 1018, N'test', N'test', 8, N'0956434543', N'test', 1, N'ship1', 1)
INSERT [dbo].[ShipInfo] ([ID], [Order_ID], [CustomerName], [ShippingAddress], [ShipCityID], [PhoneNum], [Note], [Delivered], [Shipper], [f0]) VALUES (36, 1019, N'Tuan', N'Ha Dong', 13, N'0957234241', N'tuan', 1, N'ship1', 1)
INSERT [dbo].[ShipInfo] ([ID], [Order_ID], [CustomerName], [ShippingAddress], [ShipCityID], [PhoneNum], [Note], [Delivered], [Shipper], [f0]) VALUES (37, 1017, N'Haku Ichi', N'Ha Noi', 57, N'(+84) 987643124', N'note', 1, N'ship1', 0)
INSERT [dbo].[ShipInfo] ([ID], [Order_ID], [CustomerName], [ShippingAddress], [ShipCityID], [PhoneNum], [Note], [Delivered], [Shipper], [f0]) VALUES (38, 1017, N'Nguyen Khac Hieu', N'Ha Noi', 12, N'(+84) 987643124', N'Note', 1, N'ship1', 1)
INSERT [dbo].[ShipInfo] ([ID], [Order_ID], [CustomerName], [ShippingAddress], [ShipCityID], [PhoneNum], [Note], [Delivered], [Shipper], [f0]) VALUES (39, 1017, N'Tuan', N'Ha Dong', 13, N'0957234241', N'xxxxxxx', 1, N'ship1', 1)
INSERT [dbo].[ShipInfo] ([ID], [Order_ID], [CustomerName], [ShippingAddress], [ShipCityID], [PhoneNum], [Note], [Delivered], [Shipper], [f0]) VALUES (40, 1023, N'Test', N'Ha Noi', 24, N'0983737171', N'Note', 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[ShipInfo] OFF
SET IDENTITY_INSERT [dbo].[ShipStatus] ON 

INSERT [dbo].[ShipStatus] ([ID], [Name]) VALUES (1, N'Delivering')
SET IDENTITY_INSERT [dbo].[ShipStatus] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (1, N'Food', 1)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (2, N'Drink', 2)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (3, N'Medical', 3)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (4, N'Mask', 3)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (5, N'Others', 4)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[UserAddress] ON 

INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (1, N'4', N'Haku Ichi', N'Ha Noi', 1, N'(+84) 987643124')
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (2, N'1', N'Seller1', N'England', 2, N'9282828282')
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (3, N'5', N'Seller2', N'Can Tho', 20, N'0219281811')
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (4, N'2', N'Admin', N'Da Nang', 26, N'029282281')
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (5, N'3', N'Zeus', N'Sao Hoa nha cung', 1, N'2121132213213')
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (6, N'6', N'', N'', NULL, N'')
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (7, N'7', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (8, N'8', N'test', N'test', NULL, N'32131232131')
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (9, N'9', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (10, N'10', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (11, N'11', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (12, N'12', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (13, N'13', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (14, N'14', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserAddress] ([ID], [UserID], [ShipName], [ShipAddress], [ShipCityID], [PhoneNum]) VALUES (15, N'15', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserAddress] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (3, N'abc', N'abc', N'abc@gmail.com', 3, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (5, N'admin', N'123', N'admin@gmail.com', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (4, N'haku1404', N'hieu1404', N'haku1404@gmail.com', 3, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (1, N'seller1', N'123', N'seller1@gmail.com', 2, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (2, N'seller2', N'123', N'seller2@gmail.com', 2, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (6, N'ship1', N'321', N'ship1@gmail.com', 4, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (7, N'ship2', N'123', N'ship2@gmail.com', 4, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (8, N'test', N'test', N'test@gmail.com', 3, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (13, N'test2', N'test2', N'test2@gmail.com', 3, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (10, N'test3', N'test3', N'test3@gmail.com', 3, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (12, N'test4', N'123', N'ew@gmail.com', 3, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (11, N'Tuan', N'123', N'halonghl99@gmail.com', 3, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [email], [RoleID], [StatusID]) VALUES (14, N'xyz', N'123', N'xyz@gmail.com', 3, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserStatus] ON 

INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (1, N'Active')
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (2, N'Locked')
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (3, N'Gmail Login')
INSERT [dbo].[UserStatus] ([ID], [StatusName]) VALUES (4, N'Unverified')
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [productID_in_cart] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [productID_in_cart]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK__Delivery__ShipIn__5CD6CB2B] FOREIGN KEY([ShipInfoID])
REFERENCES [dbo].[ShipInfo] ([ID])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK__Delivery__ShipIn__5CD6CB2B]
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Role] FOREIGN KEY([gid])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Role]
GO
ALTER TABLE [dbo].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Users] FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Users]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Feature]
GO
ALTER TABLE [dbo].[GroupFeature]  WITH CHECK ADD  CONSTRAINT [FK_GroupFeature_Role] FOREIGN KEY([gid])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[GroupFeature] CHECK CONSTRAINT [FK_GroupFeature_Role]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [OrderID_in_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [OrderID_in_Orders]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Orders] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Orders]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [productID_in_order_detail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [productID_in_order_detail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [statusID_in_order_status] FOREIGN KEY([Status])
REFERENCES [dbo].[Order_Status] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [statusID_in_order_status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [BrandID_in_Brand] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [BrandID_in_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [product_in_subCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [product_in_subCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [StatusID_in_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ProductStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [StatusID_in_Status]
GO
ALTER TABLE [dbo].[ProductImg]  WITH CHECK ADD  CONSTRAINT [ProductImg_ID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImg] CHECK CONSTRAINT [ProductImg_ID]
GO
ALTER TABLE [dbo].[ShipInfo]  WITH CHECK ADD  CONSTRAINT [order_id_in_ship_info] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[ShipInfo] CHECK CONSTRAINT [order_id_in_ship_info]
GO
ALTER TABLE [dbo].[ShipInfo]  WITH CHECK ADD  CONSTRAINT [ship_city_in_ship_info] FOREIGN KEY([ShipCityID])
REFERENCES [dbo].[Ship] ([id])
GO
ALTER TABLE [dbo].[ShipInfo] CHECK CONSTRAINT [ship_city_in_ship_info]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [CategoryID]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [ship_city_in_ship_address] FOREIGN KEY([ShipCityID])
REFERENCES [dbo].[Ship] ([id])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [ship_city_in_ship_address]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [Status_ID_in_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[UserStatus] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [Status_ID_in_Status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK__Product__SalePer__3A81B327] CHECK  (([SalePercent]>=(0) AND [SalePercent]<=(100)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK__Product__SalePer__3A81B327]
GO
USE [master]
GO
ALTER DATABASE [HOLASHOP2] SET  READ_WRITE 
GO
