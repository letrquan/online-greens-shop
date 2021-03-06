USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 10/30/2021 7:47:35 PM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment', N'ON'
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 10/30/2021 7:47:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/30/2021 7:47:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderdetailID] [nchar](10) NOT NULL,
	[orderID] [int] NULL,
	[productID] [nchar](10) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[statusID] [nchar](10) NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderdetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 10/30/2021 7:47:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[email] [nvarchar](50) NULL,
	[userID] [nchar](10) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nchar](10) NULL,
	[totalMoney] [money] NULL,
	[orderDate] [datetime] NULL,
	[statusID] [nchar](10) NOT NULL,
	[paymentStatus] [nchar](10) NULL,
	[orderID] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 10/30/2021 7:47:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nchar](10) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[categoryID] [nchar](10) NOT NULL,
	[marketPrice] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[image] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 10/30/2021 7:47:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [nchar](10) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 10/30/2021 7:47:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nchar](10) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 10/30/2021 7:47:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nchar](10) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleID] [nchar](10) NOT NULL,
	[phone] [nchar](10) NOT NULL,
	[address] [nvarchar](100) NULL,
	[statusID] [nchar](10) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'1         ', N'Khoai')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'2         ', N'Rau')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'3         ', N'Muop')
GO
INSERT [dbo].[tblOrderDetail] ([orderdetailID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'12        ', 2, N'1         ', 1, 29000.0000, N'1         ')
INSERT [dbo].[tblOrderDetail] ([orderdetailID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'14        ', 4, N'1         ', 1, 29000.0000, N'1         ')
INSERT [dbo].[tblOrderDetail] ([orderdetailID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'22        ', 2, N'2         ', 1, 26000.0000, N'1         ')
INSERT [dbo].[tblOrderDetail] ([orderdetailID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'23        ', 3, N'2         ', 9, 26000.0000, N'1         ')
INSERT [dbo].[tblOrderDetail] ([orderdetailID], [orderID], [productID], [quantity], [price], [statusID]) VALUES (N'24        ', 4, N'2         ', 1, 26000.0000, N'1         ')
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID], [paymentStatus], [orderID]) VALUES (N'quan@gmail.com', N'manh      ', N'ok', N'0983005749', 26000.0000, CAST(N'2021-10-30T10:03:14.617' AS DateTime), N'1         ', N'paid      ', 1)
INSERT [dbo].[tblOrders] ([email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID], [paymentStatus], [orderID]) VALUES (N'quan1@gmail.com', N'manh      ', N'okchua', N'0983005749', 55000.0000, CAST(N'2021-10-30T10:06:46.350' AS DateTime), N'1         ', N'paid      ', 2)
INSERT [dbo].[tblOrders] ([email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID], [paymentStatus], [orderID]) VALUES (N'quan2@gmail.com', N'zain      ', N'ok', N'0983005749', 234000.0000, CAST(N'2021-10-30T11:16:32.327' AS DateTime), N'1         ', N'paid      ', 3)
INSERT [dbo].[tblOrders] ([email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID], [paymentStatus], [orderID]) VALUES (N'quan2@gmail.com', N'zain      ', N'ok', N'0983005749', 55000.0000, CAST(N'2021-10-30T11:19:14.137' AS DateTime), N'1         ', N'paid      ', 4)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [marketPrice], [quantity], [createDate], [image]) VALUES (N'1         ', N'Khoai Lang Nhật Ruột Vàng', N'Xuất xứ: giống Nhật, trồng tại Việt Nam

Khoai lang Nhật có hình dạng củ thuôn dài, lớp vỏ mỏng màu tím và thịt màu vàng mật. 
Sau khi chế biến, khoai lang Nhật dẻo, bùi và có vị thơm ngọt.', N'1         ', 29000.0000, 9, CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'https://salt.tikicdn.com/cache/200x200/ts/product/78/63/f0/fd6756c44413d8daea9cfa454ed8111a.png.webp')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [marketPrice], [quantity], [createDate], [image]) VALUES (N'2         ', N'Rau muống', N'Với sản phẩm tươi sống, trọng lượng thực tế có thể chênh lệch khoảng +-20%.
Đặt hàng giao ngay nội thành Hồ Chí Minh
Cam kết bình ổn giá
Rau củ tươi lấy tận gốc tại vườn.
Trọng lượng: 1kg
Rau muống là loại giống cây thân thảo, mọc bò trên mặt nước hoặc trên đất bùn. Rau muống có thân dài, rỗng. Với giống rau muống mọc bò dưới nước, tại mỗi khớp sẽ có rễ ngắn bám xung quanh thân cây. Giá trị dinh dưỡng có trong rau muống gồm có vitamin A, B, C, canxi, phospho, các chất dinh dưỡng và đặc biệt là hàm lượng chất sắt dồi dào, phù hợp với những người có thể trạng thiếu sắt, muốn bổ sung thêm sắt.', N'2         ', 26000.0000, 9, CAST(N'2021-10-30T00:00:00.000' AS DateTime), N'https://salt.tikicdn.com/cache/200x200/ts/product/44/f3/08/d97c251eca4f914f5d664f78fb0b1459.png.webp')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [marketPrice], [quantity], [createDate], [image]) VALUES (N'3         ', N'Mồng tơi', N'Với sản phẩm tươi sống, trọng lượng thực tế có thể chênh lệch khoảng +-20%.
Đặt hàng giao ngay nội thành Hồ Chí Minh
Cam kết bình ổn giá
Rau củ tươi lấy tận gốc tại vườn.
Trọng lượng: 1kg
Trong rau mồng tơi có các chất như: Vitamin C, A, PP, B1, B2; Pectin; Saponin; Polysaccharide; Tinh bột; Chất đạm và béo; canxi; Sắt; Nước và Folate rất tốt cho cơ thể con người và giàu dinh dưỡng.', N'2         ', 26000.0000, 10, CAST(N'2021-10-30T08:08:53.853' AS DateTime), N'https://salt.tikicdn.com/cache/200x200/ts/product/79/2a/c0/eeffdc74c9fa5a1fd66f8508ba9ec756.png.webp')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [marketPrice], [quantity], [createDate], [image]) VALUES (N'4         ', N'Cải ngọt', N'Với sản phẩm tươi sống, trọng lượng thực tế có thể chênh lệch khoảng +-20%.
Đặt hàng giao ngay nội thành Hồ Chí Minh
Cam kết bình ổn giá
Rau củ tươi lấy tận gốc tại vườn.
Trọng lượng: 1kg
Có thể nói, rau cải là một trong những loại thực phẩm đã quá quen thuộc với mâm cơm Việt.
“Họ hàng” nhà rau cải vô cùng đa dạng, cải thìa, cải xoong, cải bẹ, cải rổ…. và đương nhiên không thể thiếu “người anh em” cải ngọt.
Họ nhà cải sở hữu rất nhiều lợi ích và cải ngọt cũng không ngoại lệ.', N'2         ', 25000.0000, 10, CAST(N'2021-10-30T08:10:56.750' AS DateTime), N'https://salt.tikicdn.com/cache/200x200/ts/product/db/ac/c0/afc7e18807e001eb5bf4f7ae9f21acb8.png.webp')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [marketPrice], [quantity], [createDate], [image]) VALUES (N'5         ', N'Bắp cải', N'Với sản phẩm tươi sống, trọng lượng thực tế có thể chênh lệch khoảng +-20%.

TIKI NGON là gì? Tìm hiểu thêm tại đây.

Đặt hàng giao ngay nội thành Hồ Chí Minh.

Cam kết bình ổn giá.

Rau củ tươi lấy tận gốc tại vườn.

Bắp cải tươi ngon mỗi ngày, giàu vitamin A, C, K, B2, B6, calcium, sắt, mangan, folat, cũng như nhiều thành phần hoạt chất có ảnh hưởng tốt đối với sức khỏe', N'2         ', 42000.0000, 10, CAST(N'2021-10-30T08:11:40.083' AS DateTime), N'https://salt.tikicdn.com/cache/200x200/ts/product/cd/e8/33/c11039d1ddae2bb29e2896350ae0c21e.png.webp')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [marketPrice], [quantity], [createDate], [image]) VALUES (N'6         ', N'Mướp Hương Đà Lạt', N'Với sản phẩm tươi sống, trọng lượng thực tế có thể chênh lệch khoảng 10%.

TIKI NGON là gì? Tìm hiểu thêm tại đây

Xuất xứ: Đà Lạt

Mướp chứa nhiều nước, protid, chất xơ, canxi, photpho, sắt, beta-caroten, B1, B6, B2, C…
Có tác dụng sáng mắt, hỗ trợ sức khỏe tim mạch, giải nhiệt, ngăn ngừa tiểu đường
Có thể dùng để nấu canh cùng với rau ngót, mồng tơi, hến,…', N'3         ', 16000.0000, 10, CAST(N'2021-10-30T08:12:28.320' AS DateTime), N'https://salt.tikicdn.com/cache/200x200/ts/product/1a/dd/b0/da8a6573387cf75638ca872d23ee363a.png.webp')
INSERT [dbo].[tblProducts] ([productID], [productName], [description], [categoryID], [marketPrice], [quantity], [createDate], [image]) VALUES (N'7         ', N'Khoai tây', N'Với sản phẩm tươi sống, trọng lượng thực tế có thể chênh lệch khoảng +-20%.

TIKI NGON là gì? Tìm hiểu thêm tại đây.

Đặt hàng giao ngay nội thành Hồ Chí Minh.

Cam kết bình ổn giá.

Rau củ tươi lấy tận gốc tại vườn.

Khoai Tây là loại củ chứa nhiều chất dinh dưỡng.
Đây là loại rau củ ít calo, không có chất béo và cholestrerol, hàm lượng vitamin cao và là nguồn cung cấp kali, vitamin B6 và chất xơ thô tuyệt vời.
Khoai Tây có thể rất chế biến được nhiều món như có thể luộc ăn để cung cấp năng lượng, dùng làm salad, dùng để nấu canh hay có thể thái nhỏ và đem rán.', N'1         ', 39500.0000, 10, CAST(N'2021-10-30T08:13:04.523' AS DateTime), N'https://salt.tikicdn.com/cache/200x200/ts/product/3b/79/f8/b9bf706c34c132316f64664882ba874f.png.webp')
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'1         ', N'AD')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'2         ', N'US')
GO
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'1         ', N'true')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'2         ', N'false')
GO
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [roleID], [phone], [address], [statusID], [createDate]) VALUES (N'manh      ', N'manh', N'2', N'2         ', N'1         ', N'phuong Tam Phuoc, TP Bien Hoa', N'2         ', CAST(N'2021-10-30T09:18:43.387' AS DateTime))
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [roleID], [phone], [address], [statusID], [createDate]) VALUES (N'sa        ', N'quan', N'1', N'1         ', N'1         ', N'b12/k82', N'1         ', CAST(N'2021-10-30T08:16:39.700' AS DateTime))
INSERT [dbo].[tblUser] ([userID], [fullName], [password], [roleID], [phone], [address], [statusID], [createDate]) VALUES (N'zain      ', N'quan', N'1', N'2         ', N'1         ', N'1', N'1         ', CAST(N'2021-10-30T09:08:38.077' AS DateTime))
GO
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [df_createDateUser]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProducts]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblStatus]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblStatus]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUser]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategory]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
