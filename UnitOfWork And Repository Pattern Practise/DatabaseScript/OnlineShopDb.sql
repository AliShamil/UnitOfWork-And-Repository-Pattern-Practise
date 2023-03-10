USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 9.02.2023 18:40:32 ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9.02.2023 18:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9.02.2023 18:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NULL,
	[Price] [money] NULL,
	[Quantity] [smallint] NULL,
	[Rating] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 9.02.2023 18:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Rate] [float] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Beverages')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Condiments')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Confections')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Dairy Products')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Grains/Cereals')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Meat/Poultry')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Produce')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'Seafood')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (1, N'Chai', 1, 18.0000, 39, 4.8)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (2, N'Chang', 1, 19.0000, 17, 4.5)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (3, N'Aniseed Syrup', 2, 10.0000, 13, 4)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (4, N'Chef Anton''s Cajun Seasoning', 2, 22.0000, 53, 3.9)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (5, N'Chef Anton''s Gumbo Mix', 2, 21.3500, 0, 5)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (6, N'Grandma''s Boysenberry Spread', 2, 25.0000, 120, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (7, N'Uncle Bob''s Organic Dried Pears', 7, 30.0000, 15, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (8, N'Northwoods Cranberry Sauce', 2, 40.0000, 6, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (9, N'Mishi Kobe Niku', 6, 97.0000, 29, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (10, N'Ikura', 8, 31.0000, 31, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (11, N'Queso Cabrales', 4, 21.0000, 22, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (12, N'Queso Manchego La Pastora', 4, 38.0000, 86, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (13, N'Konbu', 8, 6.0000, 24, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (14, N'Tofu', 7, 23.2500, 35, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (15, N'Genen Shouyu', 2, 15.5000, 39, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (16, N'Pavlova', 3, 17.4500, 29, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (17, N'Alice Mutton', 6, 39.0000, 0, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (18, N'Carnarvon Tigers', 8, 62.5000, 42, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (19, N'Teatime Chocolate Biscuits', 3, 9.2000, 25, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (20, N'Sir Rodney''s Marmalade', 3, 81.0000, 40, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (21, N'Sir Rodney''s Scones', 3, 10.0000, 3, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (22, N'Gustaf''s Knackebrod', 5, 21.0000, 104, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (23, N'Tunnbrod', 5, 9.0000, 61, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (24, N'Guarana Fantastica', 1, 4.5000, 20, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (25, N'NuNuCa Nu?-Nougat-Creme', 3, 14.0000, 76, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (26, N'Gumbar Gummibarchen', 3, 31.2300, 15, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (27, N'Schoggi Schokolade', 3, 43.9000, 49, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (28, N'Rossle Sauerkraut', 7, 45.6000, 26, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (29, N'Thuringer Rostbratwurst', 6, 123.7900, 0, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (30, N'Nord-Ost Matjeshering', 8, 25.8900, 10, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (31, N'Gorgonzola Telino', 4, 12.5000, 0, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (32, N'Mascarpone Fabioli', 4, 32.0000, 9, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (33, N'Geitost', 4, 2.5000, 112, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (34, N'Sasquatch Ale', 1, 14.0000, 111, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (35, N'Steeleye Stout', 1, 18.0000, 20, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (36, N'Inlagd Sill', 8, 19.0000, 112, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (37, N'Gravad lax', 8, 26.0000, 11, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (38, N'Cote de Blaye', 1, 263.5000, 17, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (39, N'Chartreuse verte', 1, 18.0000, 69, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (40, N'Boston Crab Meat', 8, 18.4000, 123, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (41, N'Jack''s New England Clam Chowder', 8, 9.6500, 85, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (42, N'Singaporean Hokkien Fried Mee', 5, 14.0000, 26, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (43, N'Ipoh Coffee', 1, 46.0000, 17, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (44, N'Gula Malacca', 2, 19.4500, 27, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (45, N'Rogede sild', 8, 9.5000, 5, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (46, N'Spegesild', 8, 12.0000, 95, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (47, N'Zaanse koeken', 3, 9.5000, 36, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (48, N'Chocolade', 3, 12.7500, 15, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (49, N'Maxilaku', 3, 20.0000, 10, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (50, N'Valkoinen suklaa', 3, 16.2500, 65, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (51, N'Manjimup Dried Apples', 7, 53.0000, 20, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (52, N'Filo Mix', 5, 7.0000, 38, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (53, N'Perth Pasties', 6, 32.8000, 0, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (54, N'Tourtiere', 6, 7.4500, 21, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (55, N'Pate chinois', 6, 24.0000, 115, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (56, N'Gnocchi di nonna Alice', 5, 38.0000, 21, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (57, N'Ravioli Angelo', 5, 19.5000, 36, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (58, N'Escargots de Bourgogne', 8, 13.2500, 62, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (59, N'Raclette Courdavault', 4, 55.0000, 79, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (60, N'Camembert Pierrot', 4, 34.0000, 19, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (61, N'Sirop d''erable', 2, 28.5000, 113, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (62, N'Tarte au sucre', 3, 49.3000, 17, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (63, N'Vegie-spread', 2, 43.9000, 24, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (64, N'Wimmers gute Semmelknodel', 5, 33.2500, 22, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (65, N'Louisiana Fiery Hot Pepper Sauce', 2, 21.0500, 76, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (66, N'Louisiana Hot Spiced Okra', 2, 17.0000, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (67, N'Laughing Lumberjack Lager', 1, 14.0000, 52, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (68, N'Scottish Longbreads', 3, 12.5000, 6, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (69, N'Gudbrandsdalsost', 4, 36.0000, 26, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (70, N'Outback Lager', 1, 15.0000, 15, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (71, N'Flotemysost', 4, 21.5000, 26, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (72, N'Mozzarella di Giovanni', 4, 34.8000, 14, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (73, N'Rod Kaviar', 8, 15.0000, 101, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (74, N'Longlife Tofu', 7, 10.0000, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (75, N'Rhonbrau Klosterbier', 1, 7.7500, 125, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (76, N'Lakkalikoori', 1, 18.0000, 57, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (77, N'Original Frankfurter grune So?e', 2, 13.0000, 32, NULL)
INSERT [dbo].[Products] ([Id], [Name], [CategoryID], [Price], [Quantity], [Rating]) VALUES (82, N'Valik', 1, 1235.0000, 7, 5)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (9, 3, 3)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (10, 2, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (11, 2, 4)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (12, 3, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (13, 1, 4)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (14, 1, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (15, 1, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (16, 1, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (17, 1, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (18, 5, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (19, 82, 5)
INSERT [dbo].[Ratings] ([Id], [ProductId], [Rate]) VALUES (20, 1, 5)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_CategoryId] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_CategoryId]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_ProductId]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [CHK_Rate] CHECK  (([Rate]>=(0) AND [Rate]<=(5)))
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [CHK_Rate]
GO
/****** Object:  StoredProcedure [dbo].[AddRating]    Script Date: 9.02.2023 18:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRating]
	@productid AS int,
	@rate AS float
AS
BEGIN
	BEGIN TRAN RatingMark

	BEGIN
	INSERT INTO Ratings(ProductId,Rate)
VALUES (@productid,@rate);
	IF(@@ERROR != 0)
	BEGIN
		ROLLBACK TRAN RatingMark
	END
	ELSE
	BEGIN
		UPDATE Products
		SET Rating = (
			SELECT Round(CAST(SUM(Rate) AS float) / COUNT(*),1)
			FROM Ratings
			WHERE Ratings.ProductId = @productid
		)
		WHERE Id = @productid
		IF(@@ERROR != 0)
			BEGIN
				ROLLBACK TRAN RatingMark
			END
		ELSE
			BEGIN
				COMMIT TRAN RatingMark
			END

		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddProduct]    Script Date: 9.02.2023 18:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_AddProduct]
	@name AS nvarchar(40),
	@categoryId AS int,
	@price AS money,
	@quantity AS smallint
AS
BEGIN
	BEGIN TRAN AddPr

	BEGIN
INSERT INTO Products([Name],CategoryID,Price,Quantity)
VALUES (@name,@categoryId,@price,@quantity);
	IF(@@ERROR != 0)
		BEGIN
			ROLLBACK TRAN AddPr
		END
	ELSE
		BEGIN
			COMMIT TRAN AddPr
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RemoveProduct]    Script Date: 9.02.2023 18:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_RemoveProduct]
	@productid AS int
AS
BEGIN
	BEGIN TRAN DeletePr

	BEGIN
	DELETE FROM Ratings WHERE ProductId = @productid;
	IF(@@ERROR != 0)
	BEGIN
		ROLLBACK TRAN DeletePr
	END
	ELSE
	BEGIN
		DELETE FROM Products WHERE Id = @productid;
		IF(@@ERROR != 0)
			BEGIN
				ROLLBACK TRAN DeletePr
			END
		ELSE
			BEGIN
				COMMIT TRAN DeletePr
			END

		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProduct]    Script Date: 9.02.2023 18:40:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_UpdateProduct]
	@productId AS int,
	@name AS nvarchar(40),
	@categoryId AS int,
	@price AS money,
	@quantity AS smallint
AS
BEGIN
	BEGIN TRAN UpdatePr

	BEGIN
	UPDATE Products
	SET Name = @name, CategoryID = @categoryId, Price = @price,Quantity = @quantity
	WHERE Id = @productId;

	IF(@@ERROR != 0)
		BEGIN
			ROLLBACK TRAN UpdatePr
		END
	ELSE
		BEGIN
			COMMIT TRAN UpdatePr
		END
	END
END
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
