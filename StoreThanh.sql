USE [master]
GO
/****** Object:  Database [TestStore]    Script Date: 11/26/2024 6:47:23 PM ******/
CREATE DATABASE [TestStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestStore] SET RECOVERY FULL 
GO
ALTER DATABASE [TestStore] SET  MULTI_USER 
GO
ALTER DATABASE [TestStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestStore', N'ON'
GO
ALTER DATABASE [TestStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestStore]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 11/26/2024 6:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[username] [varchar](255) NOT NULL,
	[address] [varchar](255) NULL,
	[customer_name] [varchar](255) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](255) NOT NULL,
	[phonenumber] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 11/26/2024 6:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_date] [date] NULL,
	[total_amount] [numeric](18, 2) NULL,
	[username] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice_details]    Script Date: 11/26/2024 6:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_details](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[line_total] [numeric](10, 2) NULL,
	[quantity] [int] NULL,
	[unit_price] [numeric](10, 2) NULL,
	[invoice_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_details]    Script Date: 11/26/2024 6:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_details](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[screen] [nvarchar](255) NULL,
	[os] [varchar](255) NULL,
	[rear_camera] [nvarchar](255) NULL,
	[front_camera] [nvarchar](255) NULL,
	[cpu] [nvarchar](255) NULL,
	[ram] [varchar](255) NULL,
	[storage] [varchar](255) NULL,
	[battery_capacity] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2024 6:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](100) NULL,
	[brand] [nvarchar](100) NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[selling_price] [decimal](10, 2) NOT NULL,
	[import_price] [decimal](10, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[img] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[manufacture] [nvarchar](255) NULL,
	[gift] [nvarchar](255) NULL,
	[policy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[customers] ([username], [address], [customer_name], [email], [password], [phonenumber]) VALUES (N'thanh', N'HCM', N'Nhat Thanh', N'thanhcaiken@gmail.com', N'123', N'023123124')
INSERT [dbo].[customers] ([username], [address], [customer_name], [email], [password], [phonenumber]) VALUES (N'thanh1', N'123', N'123', N'123@fasf.coma', N'123', N'123')
INSERT [dbo].[customers] ([username], [address], [customer_name], [email], [password], [phonenumber]) VALUES (N'thanh12', N'123', N'123', N'123@fasf.co', N'123', N'123')
GO
SET IDENTITY_INSERT [dbo].[invoice] ON 

INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (23, CAST(N'2024-11-05' AS Date), CAST(78000000.00 AS Numeric(18, 2)), N'thanh1')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (24, CAST(N'2024-11-05' AS Date), CAST(22000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (25, CAST(N'2024-11-05' AS Date), CAST(13900000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (26, CAST(N'2024-11-05' AS Date), CAST(24000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (27, CAST(N'2024-11-05' AS Date), CAST(11000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (28, CAST(N'2024-11-05' AS Date), CAST(26000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (29, CAST(N'2024-11-05' AS Date), CAST(12000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (30, CAST(N'2024-11-05' AS Date), CAST(12000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (31, CAST(N'2024-11-05' AS Date), CAST(26900000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (32, CAST(N'2024-11-05' AS Date), CAST(37000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (33, CAST(N'2024-11-05' AS Date), CAST(40900000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (34, CAST(N'2024-11-05' AS Date), CAST(35000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (35, CAST(N'2024-11-09' AS Date), CAST(12000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (36, CAST(N'2024-11-11' AS Date), CAST(11000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (37, CAST(N'2024-11-26' AS Date), CAST(36000000.00 AS Numeric(18, 2)), N'thanh')
INSERT [dbo].[invoice] ([invoice_id], [invoice_date], [total_amount], [username]) VALUES (38, CAST(N'2024-11-26' AS Date), CAST(2900000.00 AS Numeric(18, 2)), N'thanh')
SET IDENTITY_INSERT [dbo].[invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[invoice_details] ON 

INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (1, NULL, 1, CAST(12000000.00 AS Numeric(10, 2)), 30, 2)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (2, NULL, 1, CAST(2900000.00 AS Numeric(10, 2)), 31, 3)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (3, NULL, 2, CAST(24000000.00 AS Numeric(10, 2)), 31, 2)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (4, CAST(15000000.00 AS Numeric(10, 2)), 1, CAST(15000000.00 AS Numeric(10, 2)), 32, 1)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (5, CAST(44000000.00 AS Numeric(10, 2)), 2, CAST(22000000.00 AS Numeric(10, 2)), 32, 5)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (6, CAST(12000000.00 AS Numeric(10, 2)), 1, CAST(12000000.00 AS Numeric(10, 2)), 33, 2)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (7, CAST(11000000.00 AS Numeric(10, 2)), 1, CAST(11000000.00 AS Numeric(10, 2)), 33, 5)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (8, CAST(15000000.00 AS Numeric(10, 2)), 1, CAST(15000000.00 AS Numeric(10, 2)), 33, 1)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (9, CAST(2900000.00 AS Numeric(10, 2)), 1, CAST(2900000.00 AS Numeric(10, 2)), 33, 3)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (10, CAST(26000000.00 AS Numeric(10, 2)), 1, CAST(26000000.00 AS Numeric(10, 2)), 34, 4)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (11, CAST(9000000.00 AS Numeric(10, 2)), 1, CAST(9000000.00 AS Numeric(10, 2)), 34, 15)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (12, CAST(12000000.00 AS Numeric(10, 2)), 1, CAST(12000000.00 AS Numeric(10, 2)), 35, 2)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (13, CAST(11000000.00 AS Numeric(10, 2)), 1, CAST(11000000.00 AS Numeric(10, 2)), 36, 5)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (14, CAST(11000000.00 AS Numeric(10, 2)), 1, CAST(11000000.00 AS Numeric(10, 2)), 37, 5)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (15, CAST(25000000.00 AS Numeric(10, 2)), 1, CAST(25000000.00 AS Numeric(10, 2)), 37, 1)
INSERT [dbo].[invoice_details] ([detail_id], [line_total], [quantity], [unit_price], [invoice_id], [product_id]) VALUES (16, CAST(2900000.00 AS Numeric(10, 2)), 1, CAST(2900000.00 AS Numeric(10, 2)), 38, 3)
SET IDENTITY_INSERT [dbo].[invoice_details] OFF
GO
SET IDENTITY_INSERT [dbo].[product_details] ON 

INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (1, 1, N'6.1 inch', N'Android 13', N'200MP', N'12MP', N'Exynos 2200', N'8GB', N'256GB', N'4000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (2, 3, N'6.1 inch', N'Android 13', N'200MP', N'12MP', N'Exynos 2200', N'8GB', N'256GB', N'4000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (3, 4, N'6.7 inch', N'iOS 16', N'48MP', N'12MP', N'A16 Bionic', N'6GB', N'128GB', N'3279mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (4, 5, N'6.36 inch', N'Android 13', N'50MP', N'32MP', N'Snapdragon 8 Gen 2', N'12GB', N'256GB', N'5000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (5, 16, N'6.7 inch', N'iOS 16', N'48MP', N'32MP', N'A16 Bionic', N'6GB', N'128GB', N'4000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (6, 15, N'6.7 inch', N'iOS 16', N'48MP', N'32MP', N'A16 Bionic', N'6GB', N'128GB', N'4000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (7, 18, N'6.7 inch', N'iOS 16', N'48MP', N'32MP', N'A16 Bionic', N'6GB', N'128GB', N'4000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (15, 17, N'6.1 inch', N'Android 13', N'25MP', N'25MP', N'Snapdragon 8 Gen 2', N'8GB', N'128GB', N'5000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (16, 19, N'6.1 inch', N'Android 13', N'48MP', N'32MP', N'Snapdragon 8 Gen 2', N'8GB', N'256GB', N'5000mAh')
INSERT [dbo].[product_details] ([detail_id], [product_id], [screen], [os], [rear_camera], [front_camera], [cpu], [ram], [storage], [battery_capacity]) VALUES (17, 2, N'6.1 inch', N'Android 13', N'48MP', N'32MP', N'Snapdragon 8 Gen 2', N'8GB', N'256GB', N'5000mAh')
SET IDENTITY_INSERT [dbo].[product_details] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (1, N'Điện thoại', N'Apple', N'Iphone 15 Pro Max', N'Ðiện thoại thông minh cao cấp với camera 200MP.', CAST(25000000.00 AS Decimal(10, 2)), CAST(13000000.00 AS Decimal(10, 2)), 50, N'https://cdn.tgdd.vn/Products/Images/42/305658/iphone-15-pro-max-gold-thumbnew-600x600.jpg', CAST(N'2024-10-22T10:55:00.720' AS DateTime), N'Mỹ', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (2, N'Điện thoại', N'Samsung', N'Galaxy Z Filip6', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(12000000.00 AS Decimal(10, 2)), CAST(14000000.00 AS Decimal(10, 2)), 100, N'https://cdn.tgdd.vn/Products/Images/42/320722/samsung-galaxy-z-flip6-xanh-thumbn-600x600.jpg', CAST(N'2024-10-22T10:57:18.977' AS DateTime), N'Hàn Quốc', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (3, N'Điện thoại', N'Samsung', N'Galaxy S23', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(2900000.00 AS Decimal(10, 2)), CAST(25000000.00 AS Decimal(10, 2)), 100, N'https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-green-thumbnew-600x600.jpg', CAST(N'2024-10-22T11:03:01.703' AS DateTime), N'Hàn Quốc', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (4, N'Điện thoại', N'Apple', N'iPhone 16 ProMax', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(26000000.00 AS Decimal(10, 2)), CAST(23000000.00 AS Decimal(10, 2)), 50, N'https://cdn.tgdd.vn/Products/Images/42/329143/iphone-16-pro-titan-tu-nhien.png', CAST(N'2024-10-22T11:03:01.703' AS DateTime), N'Mỹ', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (5, N'Điện thoại', N'Samsung', N' Galaxy A6', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(11000000.00 AS Decimal(10, 2)), CAST(8000000.00 AS Decimal(10, 2)), 75, N'https://cdn.tgdd.vn/Products/Images/42/322096/samsung-galaxy-a55-5g-xanh-thumb-1-600x600.jpg', CAST(N'2024-10-22T11:03:01.703' AS DateTime), N'Hàn Quốc', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (15, N'Điện thoại', N'Apple', N'Iphone 11 ', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(9000000.00 AS Decimal(10, 2)), CAST(5000000.00 AS Decimal(10, 2)), 50, N'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-600x600.jpg', CAST(N'2024-10-22T10:55:00.720' AS DateTime), N'Mỹ', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (16, N'Điện thoại', N'Apple', N'iPhone 13', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(14000000.00 AS Decimal(10, 2)), CAST(12000000.00 AS Decimal(10, 2)), 30, N'https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-xanh-la-thumb-new-600x600.jpg', CAST(N'2024-10-22T10:55:00.720' AS DateTime), N'Mỹ', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (17, N'Điện thoại', N'Xiaomi', N'Xiaomi 13 Pro', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(18000000.00 AS Decimal(10, 2)), CAST(15000000.00 AS Decimal(10, 2)), 40, N'https://cdn.tgdd.vn/Products/Images/42/322069/xiaomi-redmi-note-13-purple-thumb-600x600.jpg', CAST(N'2024-10-22T10:55:00.720' AS DateTime), N'Trung Quốc', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (18, N'Điện thoại', N'Apple', N'iPhone 16', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(16000000.00 AS Decimal(10, 2)), CAST(14000000.00 AS Decimal(10, 2)), 35, N'https://cdn.tgdd.vn/Products/Images/42/329149/iphone-16-pro-max-sa-mac-thumb-600x600.jpg', CAST(N'2024-10-22T10:55:00.720' AS DateTime), N'Mỹ', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
INSERT [dbo].[Products] ([product_id], [category], [brand], [name], [description], [selling_price], [import_price], [stock], [img], [created_at], [manufacture], [gift], [policy]) VALUES (19, N'Điện thoại', N'Samsung', N'Galaxy S23', N'Ðiện thoại thông minh cao cấp vơii camera 200MP.', CAST(14000000.00 AS Decimal(10, 2)), CAST(12000000.00 AS Decimal(10, 2)), 25, N'https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-green-thumbnew-600x600.jpg', CAST(N'2024-10-22T10:55:00.720' AS DateTime), N'Mỹ', N'Tai nghe, bộ sạc', N'30 ngày đổi trả')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK7lb83ut91y4ccwnhko94hgi1x] FOREIGN KEY([username])
REFERENCES [dbo].[customers] ([username])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK7lb83ut91y4ccwnhko94hgi1x]
GO
ALTER TABLE [dbo].[invoice_details]  WITH CHECK ADD  CONSTRAINT [FK87amsiu6x8ipeij8jc37uovhu] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[invoice_details] CHECK CONSTRAINT [FK87amsiu6x8ipeij8jc37uovhu]
GO
ALTER TABLE [dbo].[invoice_details]  WITH CHECK ADD  CONSTRAINT [FKo0dqvf2jst7x5jhw5wv8f41h4] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[invoice] ([invoice_id])
GO
ALTER TABLE [dbo].[invoice_details] CHECK CONSTRAINT [FKo0dqvf2jst7x5jhw5wv8f41h4]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
USE [master]
GO
ALTER DATABASE [TestStore] SET  READ_WRITE 
GO
