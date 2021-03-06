USE [master]
GO
/****** Object:  Database [sportiroda]    Script Date: 2021. 12. 30. 18:15:28 ******/
CREATE DATABASE [sportiroda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sportiroda', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\sportiroda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sportiroda_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\sportiroda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sportiroda] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sportiroda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sportiroda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sportiroda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sportiroda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sportiroda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sportiroda] SET ARITHABORT OFF 
GO
ALTER DATABASE [sportiroda] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sportiroda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sportiroda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sportiroda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sportiroda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sportiroda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sportiroda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sportiroda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sportiroda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sportiroda] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sportiroda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sportiroda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sportiroda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sportiroda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sportiroda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sportiroda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sportiroda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sportiroda] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sportiroda] SET  MULTI_USER 
GO
ALTER DATABASE [sportiroda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sportiroda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sportiroda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sportiroda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sportiroda] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sportiroda] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sportiroda] SET QUERY_STORE = OFF
GO
USE [sportiroda]
GO
/****** Object:  Table [dbo].[tipus]    Script Date: 2021. 12. 30. 18:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipus](
	[tipus_id] [int] IDENTITY(1,1) NOT NULL,
	[nev] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[tipus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nevezes]    Script Date: 2021. 12. 30. 18:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nevezes](
	[nevezes_id] [int] IDENTITY(1,1) NOT NULL,
	[verseny_id] [int] NULL,
	[versenyzo_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[nevezes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[verseny]    Script Date: 2021. 12. 30. 18:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[verseny](
	[verseny_id] [int] IDENTITY(1,1) NOT NULL,
	[tipus_id] [int] NULL,
	[nevezesi_dij] [int] NULL,
	[datum] [date] NULL,
	[kezdesido] [time](7) NULL,
	[szintido] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[verseny_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[versenyzo]    Script Date: 2021. 12. 30. 18:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[versenyzo](
	[versenyzo_id] [int] IDENTITY(1,1) NOT NULL,
	[nev] [varchar](30) NULL,
	[szuldatum] [date] NULL,
	[nem] [int] NULL,
	[email] [varchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[versenyzo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[OsszesAdat]    Script Date: 2021. 12. 30. 18:15:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OsszesAdat]
AS
SELECT        dbo.nevezes.nevezes_id, dbo.versenyzo.nev AS vnev, YEAR({ fn CURDATE() }) - YEAR(dbo.versenyzo.szuldatum) AS szuldatum, CASE WHEN dbo.versenyzo.nem = 1 THEN 'férfi' ELSE 'nő' END AS nem, dbo.tipus.nev, 
                         dbo.verseny.datum, dbo.verseny.kezdesido, dbo.verseny.szintido, dbo.verseny.nevezesi_dij, dbo.versenyzo.email
FROM            dbo.nevezes INNER JOIN
                         dbo.verseny ON dbo.nevezes.verseny_id = dbo.verseny.verseny_id INNER JOIN
                         dbo.tipus ON dbo.verseny.tipus_id = dbo.tipus.tipus_id INNER JOIN
                         dbo.versenyzo ON dbo.nevezes.versenyzo_id = dbo.versenyzo.versenyzo_id
GO
SET IDENTITY_INSERT [dbo].[nevezes] ON 

INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (1, 1, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (2, 1, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (3, 1, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (4, 1, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (5, 1, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (6, 1, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (7, 1, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (8, 1, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (9, 1, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (10, 1, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (11, 1, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (12, 1, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (13, 1, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (14, 1, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (15, 1, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (16, 1, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (17, 1, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (18, 1, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (19, 1, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (20, 1, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (21, 1, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (22, 1, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (23, 1, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (24, 1, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (25, 1, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (26, 1, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (27, 1, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (28, 1, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (29, 1, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (30, 1, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (31, 2, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (32, 2, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (33, 2, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (34, 2, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (35, 2, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (36, 2, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (37, 2, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (38, 2, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (39, 2, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (40, 2, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (41, 2, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (42, 2, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (43, 2, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (44, 2, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (45, 2, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (46, 2, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (47, 2, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (48, 2, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (49, 2, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (50, 2, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (51, 2, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (52, 2, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (53, 2, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (54, 2, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (55, 2, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (56, 2, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (57, 2, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (58, 2, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (59, 2, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (60, 2, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (61, 2, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (62, 2, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (63, 2, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (64, 3, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (65, 3, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (66, 3, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (67, 3, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (68, 3, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (69, 3, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (70, 3, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (71, 3, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (72, 3, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (73, 3, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (74, 3, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (75, 3, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (76, 3, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (77, 3, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (78, 3, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (79, 3, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (80, 3, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (81, 3, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (82, 3, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (83, 3, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (84, 3, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (85, 3, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (86, 3, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (87, 3, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (88, 3, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (89, 3, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (90, 3, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (91, 3, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (92, 3, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (93, 3, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (94, 3, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (95, 3, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (96, 4, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (97, 4, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (98, 4, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (99, 4, 3)
GO
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (100, 4, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (101, 4, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (102, 4, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (103, 4, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (104, 4, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (105, 4, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (106, 4, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (107, 4, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (108, 4, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (109, 4, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (110, 4, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (111, 4, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (112, 4, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (113, 4, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (114, 4, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (115, 4, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (116, 4, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (117, 4, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (118, 4, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (119, 4, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (120, 4, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (121, 4, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (122, 4, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (123, 4, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (124, 4, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (125, 4, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (126, 4, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (127, 4, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (128, 5, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (129, 5, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (130, 5, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (131, 5, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (132, 5, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (133, 5, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (134, 5, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (135, 5, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (136, 5, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (137, 5, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (138, 5, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (139, 5, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (140, 5, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (141, 5, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (142, 5, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (143, 5, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (144, 5, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (145, 5, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (146, 5, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (147, 5, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (148, 5, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (149, 5, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (150, 5, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (151, 5, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (152, 5, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (153, 5, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (154, 5, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (155, 5, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (156, 5, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (157, 5, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (158, 5, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (159, 6, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (160, 6, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (161, 6, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (162, 6, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (163, 6, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (164, 6, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (165, 6, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (166, 6, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (167, 6, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (168, 6, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (169, 6, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (170, 6, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (171, 6, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (172, 6, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (173, 6, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (174, 6, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (175, 6, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (176, 6, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (177, 6, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (178, 6, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (179, 6, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (180, 6, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (181, 6, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (182, 6, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (183, 6, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (184, 6, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (185, 6, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (186, 6, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (187, 6, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (188, 6, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (189, 6, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (190, 6, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (191, 7, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (192, 7, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (193, 7, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (194, 7, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (195, 7, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (196, 7, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (197, 7, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (198, 7, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (199, 7, 30)
GO
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (200, 7, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (201, 7, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (202, 7, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (203, 7, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (204, 7, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (205, 7, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (206, 7, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (207, 7, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (208, 7, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (209, 7, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (210, 7, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (211, 7, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (212, 7, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (213, 7, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (214, 7, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (215, 7, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (216, 7, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (217, 7, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (218, 7, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (219, 7, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (220, 7, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (221, 7, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (222, 8, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (223, 8, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (224, 8, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (225, 8, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (226, 8, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (227, 8, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (228, 8, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (229, 8, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (230, 8, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (231, 8, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (232, 8, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (233, 8, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (234, 8, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (235, 8, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (236, 8, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (237, 8, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (238, 8, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (239, 8, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (240, 8, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (241, 8, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (242, 8, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (243, 8, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (244, 8, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (245, 8, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (246, 8, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (247, 8, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (248, 8, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (249, 8, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (250, 8, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (251, 8, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (252, 8, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (253, 8, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (254, 9, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (255, 9, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (256, 9, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (257, 9, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (258, 9, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (259, 9, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (260, 9, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (261, 9, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (262, 9, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (263, 9, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (264, 9, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (265, 9, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (266, 9, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (267, 9, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (268, 9, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (269, 9, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (270, 9, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (271, 9, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (272, 9, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (273, 9, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (274, 9, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (275, 9, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (276, 9, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (277, 9, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (278, 9, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (279, 9, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (280, 9, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (281, 9, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (282, 9, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (283, 9, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (284, 9, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (285, 10, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (286, 10, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (287, 10, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (288, 10, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (289, 10, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (290, 10, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (291, 10, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (292, 10, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (293, 10, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (294, 10, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (295, 10, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (296, 10, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (297, 10, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (298, 10, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (299, 10, 29)
GO
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (300, 10, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (301, 10, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (302, 10, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (303, 10, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (304, 10, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (305, 10, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (306, 10, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (307, 10, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (308, 10, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (309, 10, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (310, 10, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (311, 11, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (312, 11, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (313, 11, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (314, 11, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (315, 11, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (316, 11, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (317, 11, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (318, 11, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (319, 11, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (320, 11, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (321, 11, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (322, 11, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (323, 11, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (324, 11, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (325, 11, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (326, 11, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (327, 11, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (328, 11, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (329, 11, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (330, 11, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (331, 11, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (332, 11, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (333, 11, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (334, 11, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (335, 11, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (336, 11, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (337, 11, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (338, 11, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (339, 11, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (340, 11, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (341, 11, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (342, 11, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (343, 12, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (344, 12, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (345, 12, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (346, 12, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (347, 12, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (348, 12, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (349, 12, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (350, 12, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (351, 12, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (352, 12, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (353, 12, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (354, 12, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (355, 12, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (356, 12, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (357, 12, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (358, 12, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (359, 12, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (360, 12, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (361, 12, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (362, 12, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (363, 12, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (364, 12, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (365, 12, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (366, 12, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (367, 12, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (368, 12, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (369, 12, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (370, 12, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (371, 12, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (372, 12, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (373, 12, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (374, 12, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (375, 12, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (376, 12, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (377, 13, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (378, 13, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (379, 13, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (380, 13, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (381, 13, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (382, 13, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (383, 13, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (384, 13, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (385, 13, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (386, 13, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (387, 13, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (388, 13, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (389, 13, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (390, 13, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (391, 13, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (392, 13, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (393, 13, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (394, 13, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (395, 13, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (396, 13, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (397, 13, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (398, 13, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (399, 13, 31)
GO
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (400, 13, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (401, 13, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (402, 13, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (403, 13, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (404, 13, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (405, 13, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (406, 13, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (407, 13, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (408, 14, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (409, 14, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (410, 14, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (411, 14, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (412, 14, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (413, 14, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (414, 14, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (415, 14, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (416, 14, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (417, 14, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (418, 14, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (419, 14, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (420, 14, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (421, 14, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (422, 14, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (423, 14, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (424, 14, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (425, 14, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (426, 14, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (427, 14, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (428, 14, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (429, 14, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (430, 14, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (431, 14, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (432, 14, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (433, 14, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (434, 14, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (435, 14, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (436, 14, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (437, 14, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (438, 14, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (439, 14, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (440, 15, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (441, 15, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (442, 15, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (443, 15, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (444, 15, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (445, 15, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (446, 15, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (447, 15, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (448, 15, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (449, 15, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (450, 15, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (451, 15, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (452, 15, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (453, 15, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (454, 15, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (455, 15, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (456, 15, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (457, 15, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (458, 15, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (459, 15, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (460, 15, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (461, 15, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (462, 15, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (463, 15, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (464, 15, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (465, 15, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (466, 15, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (467, 15, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (468, 15, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (469, 15, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (470, 15, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (471, 16, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (472, 16, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (473, 16, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (474, 16, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (475, 16, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (476, 16, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (477, 16, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (478, 16, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (479, 16, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (480, 16, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (481, 16, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (482, 16, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (483, 16, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (484, 16, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (485, 16, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (486, 16, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (487, 16, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (488, 16, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (489, 16, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (490, 16, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (491, 16, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (492, 16, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (493, 16, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (494, 16, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (495, 16, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (496, 16, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (497, 16, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (498, 16, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (499, 16, 27)
GO
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (500, 16, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (501, 16, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (502, 16, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (503, 16, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (504, 16, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (505, 17, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (506, 17, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (507, 17, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (508, 17, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (509, 17, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (510, 17, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (511, 17, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (512, 17, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (513, 17, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (514, 17, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (515, 17, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (516, 17, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (517, 17, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (518, 17, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (519, 17, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (520, 17, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (521, 17, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (522, 17, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (523, 17, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (524, 17, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (525, 17, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (526, 17, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (527, 17, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (528, 17, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (529, 17, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (530, 17, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (531, 17, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (532, 17, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (533, 17, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (534, 17, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (535, 17, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (536, 17, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (537, 17, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (538, 17, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (539, 18, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (540, 18, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (541, 18, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (542, 18, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (543, 18, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (544, 18, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (545, 18, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (546, 18, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (547, 18, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (548, 18, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (549, 18, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (550, 18, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (551, 18, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (552, 18, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (553, 18, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (554, 18, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (555, 18, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (556, 18, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (557, 18, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (558, 18, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (559, 18, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (560, 18, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (561, 18, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (562, 18, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (563, 18, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (564, 18, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (565, 18, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (566, 18, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (567, 18, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (568, 18, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (569, 18, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (570, 18, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (571, 19, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (572, 19, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (573, 19, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (574, 19, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (575, 19, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (576, 19, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (577, 19, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (578, 19, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (579, 19, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (580, 19, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (581, 19, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (582, 19, 8)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (583, 19, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (584, 19, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (585, 19, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (586, 19, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (587, 19, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (588, 19, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (589, 19, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (590, 19, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (591, 19, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (592, 19, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (593, 19, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (594, 19, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (595, 19, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (596, 19, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (597, 19, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (598, 19, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (599, 19, 9)
GO
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (600, 19, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (601, 19, 10)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (602, 19, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (603, 20, 7)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (604, 20, 21)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (605, 20, 14)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (606, 20, 33)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (607, 20, 6)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (608, 20, 1)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (609, 20, 12)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (610, 20, 15)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (611, 20, 31)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (612, 20, 28)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (613, 20, 25)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (614, 20, 36)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (615, 20, 34)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (616, 20, 22)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (617, 20, 29)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (618, 20, 35)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (619, 20, 20)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (620, 20, 3)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (621, 20, 18)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (622, 20, 27)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (623, 20, 11)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (624, 20, 32)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (625, 20, 30)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (626, 20, 17)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (627, 20, 16)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (628, 20, 5)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (629, 20, 19)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (630, 20, 13)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (631, 20, 4)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (632, 20, 23)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (633, 20, 9)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (634, 20, 24)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (635, 20, 26)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (636, 20, 2)
INSERT [dbo].[nevezes] ([nevezes_id], [verseny_id], [versenyzo_id]) VALUES (637, 20, 8)
SET IDENTITY_INSERT [dbo].[nevezes] OFF
GO
SET IDENTITY_INSERT [dbo].[tipus] ON 

INSERT [dbo].[tipus] ([tipus_id], [nev]) VALUES (1, N'Kerékpár')
INSERT [dbo].[tipus] ([tipus_id], [nev]) VALUES (2, N'Maraton')
INSERT [dbo].[tipus] ([tipus_id], [nev]) VALUES (3, N'Tájfutás')
INSERT [dbo].[tipus] ([tipus_id], [nev]) VALUES (4, N'Úszás')
INSERT [dbo].[tipus] ([tipus_id], [nev]) VALUES (5, N'Triatlon')
SET IDENTITY_INSERT [dbo].[tipus] OFF
GO
SET IDENTITY_INSERT [dbo].[verseny] ON 

INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (1, 2, 4000, CAST(N'2013-03-11' AS Date), CAST(N'12:00:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (2, 5, 4000, CAST(N'2013-04-05' AS Date), CAST(N'14:30:00' AS Time), CAST(N'05:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (3, 1, 7500, CAST(N'2013-04-18' AS Date), CAST(N'14:30:00' AS Time), CAST(N'04:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (4, 3, 3000, CAST(N'2013-04-20' AS Date), CAST(N'09:30:00' AS Time), CAST(N'05:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (5, 4, 5500, CAST(N'2013-04-22' AS Date), CAST(N'09:30:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (6, 5, 4000, CAST(N'2013-04-24' AS Date), CAST(N'14:30:00' AS Time), CAST(N'05:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (7, 1, 5500, CAST(N'2013-05-20' AS Date), CAST(N'15:30:00' AS Time), CAST(N'05:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (8, 5, 5500, CAST(N'2013-06-17' AS Date), CAST(N'08:00:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (9, 4, 9000, CAST(N'2013-06-27' AS Date), CAST(N'12:00:00' AS Time), CAST(N'04:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (10, 3, 4000, CAST(N'2013-07-07' AS Date), CAST(N'15:30:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (11, 3, 10000, CAST(N'2013-07-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'04:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (12, 3, 8500, CAST(N'2013-07-17' AS Date), CAST(N'13:00:00' AS Time), CAST(N'05:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (13, 5, 4000, CAST(N'2013-07-18' AS Date), CAST(N'09:00:00' AS Time), CAST(N'04:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (14, 2, 5500, CAST(N'2013-08-07' AS Date), CAST(N'12:00:00' AS Time), CAST(N'05:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (15, 4, 8000, CAST(N'2013-08-12' AS Date), CAST(N'10:30:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (16, 2, 3500, CAST(N'2013-08-19' AS Date), CAST(N'11:30:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (17, 5, 8000, CAST(N'2013-08-20' AS Date), CAST(N'09:00:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (18, 2, 4000, CAST(N'2013-09-12' AS Date), CAST(N'14:30:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (19, 4, 7000, CAST(N'2013-09-20' AS Date), CAST(N'15:00:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (20, 5, 5500, CAST(N'2014-03-20' AS Date), CAST(N'15:30:00' AS Time), CAST(N'05:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (21, 3, 4000, CAST(N'2014-04-21' AS Date), CAST(N'12:30:00' AS Time), CAST(N'05:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (22, 1, 4000, CAST(N'2014-05-15' AS Date), CAST(N'13:00:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (23, 2, 3000, CAST(N'2014-05-24' AS Date), CAST(N'11:00:00' AS Time), CAST(N'05:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (24, 5, 5000, CAST(N'2014-07-22' AS Date), CAST(N'13:30:00' AS Time), CAST(N'04:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (25, 5, 8500, CAST(N'2014-07-24' AS Date), CAST(N'08:30:00' AS Time), CAST(N'04:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (26, 2, 9500, CAST(N'2014-07-26' AS Date), CAST(N'14:30:00' AS Time), CAST(N'05:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (27, 1, 5000, CAST(N'2014-07-28' AS Date), CAST(N'15:30:00' AS Time), CAST(N'04:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (28, 1, 7000, CAST(N'2014-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'04:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (29, 2, 9000, CAST(N'2014-09-02' AS Date), CAST(N'14:30:00' AS Time), CAST(N'04:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (30, 2, 4500, CAST(N'2014-09-03' AS Date), CAST(N'14:30:00' AS Time), CAST(N'04:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (31, 1, 6000, CAST(N'2015-03-01' AS Date), CAST(N'11:00:00' AS Time), CAST(N'04:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (32, 2, 10000, CAST(N'2015-03-24' AS Date), CAST(N'13:30:00' AS Time), CAST(N'04:15:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (33, 5, 9000, CAST(N'2015-04-03' AS Date), CAST(N'13:00:00' AS Time), CAST(N'04:00:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (34, 3, 9500, CAST(N'2015-04-10' AS Date), CAST(N'10:30:00' AS Time), CAST(N'05:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (35, 2, 9000, CAST(N'2015-04-26' AS Date), CAST(N'15:30:00' AS Time), CAST(N'05:30:00' AS Time))
INSERT [dbo].[verseny] ([verseny_id], [tipus_id], [nevezesi_dij], [datum], [kezdesido], [szintido]) VALUES (36, 4, 4500, CAST(N'2015-05-04' AS Date), CAST(N'10:00:00' AS Time), CAST(N'05:15:00' AS Time))
SET IDENTITY_INSERT [dbo].[verseny] OFF
GO
SET IDENTITY_INSERT [dbo].[versenyzo] ON 

INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (1, N'Tóth Tamás', CAST(N'1970-08-17' AS Date), 1, N'toth.tamas@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (2, N'Andrási Mátyás', CAST(N'1967-05-20' AS Date), 1, N'andrasi.matyas@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (3, N'Halmosi Petra', CAST(N'1970-07-12' AS Date), 0, N'halmosip@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (4, N'Braun István', CAST(N'1980-05-18' AS Date), 1, N'brauni@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (5, N'Verpeléti Anikó', CAST(N'1968-05-26' AS Date), 0, N'verpeletia@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (6, N'Krasznai Zsuzsanna', CAST(N'1975-09-12' AS Date), 0, N'krasznai.zsuzsanna@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (7, N'Gőgösi Sámuel', CAST(N'1993-03-12' AS Date), 1, N'gogosis@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (8, N'Békési Lajos', CAST(N'1971-03-26' AS Date), 1, N'bekesi.lajos@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (9, N'Gőgösi Zsolt', CAST(N'1980-03-07' AS Date), 1, N'gogosi.zsolt35@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (10, N'Fazekas Dávid', CAST(N'1966-08-02' AS Date), 1, N'fazekasd@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (11, N'Hegyi Örs', CAST(N'1985-06-27' AS Date), 1, N'hegyi.ors@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (12, N'Megyeri Edina', CAST(N'1969-08-15' AS Date), 0, N'megyerie@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (13, N'Madarász Tamás', CAST(N'1977-04-10' AS Date), 1, N'madaraszt@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (14, N'Fekete Marietta', CAST(N'1972-03-17' AS Date), 0, N'fekete.marietta@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (15, N'Molnár Adrián', CAST(N'1973-06-05' AS Date), 1, N'molnara@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (16, N'Zoltai Györgyi', CAST(N'1967-04-26' AS Date), 0, N'zoltaig@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (17, N'Fazekas Katalin', CAST(N'1978-05-05' AS Date), 0, N'fazekas.katalin30@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (18, N'Solymos Bettina', CAST(N'1972-03-13' AS Date), 0, N'solymos.bettina@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (19, N'Vállas Fanny', CAST(N'1973-05-22' AS Date), 0, N'vallas.fanny35@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (20, N'Kaleczky Gergely', CAST(N'1989-03-13' AS Date), 1, N'kaleczkyg@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (21, N'Csiszér Zita', CAST(N'1978-07-06' AS Date), 0, N'csiszer.zita@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (22, N'Zsiday Pál', CAST(N'1974-03-02' AS Date), 1, N'zsiday.pal42@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (23, N'Madarász Dóra', CAST(N'1971-06-23' AS Date), 0, N'madarasz.dora@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (24, N'Szűcs Olga', CAST(N'1994-06-12' AS Date), 0, N'szucso@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (25, N'Nyúzó István', CAST(N'1966-04-01' AS Date), 1, N'nyuzo.istvan@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (26, N'Cseszneki Ferenc', CAST(N'1992-03-07' AS Date), 1, N'cseszneki.ferenc@budapestmarathon.h')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (27, N'Kertész Nikolett', CAST(N'1983-06-01' AS Date), 0, N'kerteszn45@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (28, N'Lukács Fanny', CAST(N'1967-07-22' AS Date), 0, N'lukacsf@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (29, N'Varga Edina', CAST(N'1991-09-14' AS Date), 0, N'vargae@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (30, N'Békési Gergely', CAST(N'1972-04-25' AS Date), 1, N'bekesig22@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (31, N'Zsolnai Kálmán', CAST(N'1974-07-04' AS Date), 1, N'zsolnaik@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (32, N'Guttmann Barbara', CAST(N'1992-07-23' AS Date), 0, N'guttmannb@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (33, N'Andrási Ákos', CAST(N'1974-07-14' AS Date), 1, N'andrasia@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (34, N'Gőgösi Zoltán', CAST(N'1978-09-19' AS Date), 1, N'gogosiz@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (35, N'Nagy Zsuzsanna', CAST(N'1966-08-12' AS Date), 0, N'nagy.zsuzsanna@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (36, N'Hegyi Szimonetta', CAST(N'1991-05-23' AS Date), 0, N'hegyi.szimonetta23@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (37, N'Baranyai Judit', CAST(N'1992-05-18' AS Date), 0, N'baranyai.judit@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (38, N'Zsolnai Linda', CAST(N'1976-07-15' AS Date), 0, N'zsolnai.linda@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (39, N'Kaló Attila', CAST(N'1973-09-05' AS Date), 1, N'kalo.attila@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (40, N'Illovszki Rita', CAST(N'1970-06-26' AS Date), 0, N'illovszki.rita@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (41, N'Csala János', CAST(N'1971-08-02' AS Date), 1, N'csala.janos56@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (42, N'Csikós István', CAST(N'1980-08-18' AS Date), 1, N'csikos.istvan@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (43, N'Fazekas Eleonóra', CAST(N'1975-05-18' AS Date), 0, N'fazekase@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (44, N'Nyúzó Sámuel', CAST(N'1975-09-16' AS Date), 1, N'nyuzos30@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (45, N'Szekeres Sámuel', CAST(N'1968-09-04' AS Date), 1, N'szekeress11@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (46, N'Madarász Gergely', CAST(N'1976-08-03' AS Date), 1, N'madarasz.gergely@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (47, N'Zsiday Tibor', CAST(N'1994-06-12' AS Date), 1, N'zsidayt@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (48, N'Krasznai Dávid', CAST(N'1970-07-05' AS Date), 1, N'krasznai.david59@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (49, N'Balogh Tímea', CAST(N'1971-09-20' AS Date), 0, N'balogh.timea@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (50, N'Kovács Sándor', CAST(N'1986-08-20' AS Date), 1, N'kovacs.sandor@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (51, N'Bethlen Tímea', CAST(N'1993-03-03' AS Date), 0, N'bethlent@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (52, N'Vállas Gábor', CAST(N'1975-07-11' AS Date), 1, N'vallas.gabor@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (53, N'Nyúzó Miklós', CAST(N'1994-05-17' AS Date), 1, N'nyuzom@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (54, N'Lukács Csilla', CAST(N'1974-07-26' AS Date), 0, N'lukacs.csilla@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (55, N'Nyúzó Csilla', CAST(N'1991-03-07' AS Date), 0, N'nyuzoc@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (56, N'Magyar Fanny', CAST(N'1970-06-01' AS Date), 0, N'magyar.fanny30@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (57, N'Kaló Katalin', CAST(N'1974-05-04' AS Date), 0, N'kalo.katalin@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (58, N'Megyeri József', CAST(N'1966-03-28' AS Date), 1, N'megyerij@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (59, N'Koczka Klaudia', CAST(N'1969-04-07' AS Date), 0, N'koczkak@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (60, N'Fási Dóra', CAST(N'1992-07-21' AS Date), 0, N'fasid@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (61, N'Szekeres Zsolt', CAST(N'1983-07-11' AS Date), 1, N'szekeres.zsolt@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (62, N'Fekete Lídia', CAST(N'1965-07-15' AS Date), 0, N'feketel@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (63, N'Kertész Sámuel', CAST(N'1970-06-28' AS Date), 1, N'kertesz.samuel@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (64, N'Cseszneki Sámuel', CAST(N'1973-08-02' AS Date), 1, N'cseszneki.samuel@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (65, N'Csiszér Balázs', CAST(N'1992-03-16' AS Date), 1, N'csiszer.balazs@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (66, N'Nagy Lívia', CAST(N'1983-09-11' AS Date), 0, N'nagy.livia@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (67, N'Eszes István', CAST(N'1992-05-28' AS Date), 1, N'eszes.istvan@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (68, N'Zsolnai Andrea', CAST(N'1974-09-09' AS Date), 0, N'zsolnai.andrea@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (69, N'Kelemen Lilla', CAST(N'1981-07-19' AS Date), 0, N'kelemen.lilla@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (70, N'Koczka Dóra', CAST(N'1984-06-21' AS Date), 0, N'koczkad44@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (71, N'Bethlen István', CAST(N'1979-05-17' AS Date), 1, N'bethlen.istvan@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (72, N'Hegyi Dénes', CAST(N'1991-05-13' AS Date), 1, N'hegyi.denes@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (73, N'Kabai Balázs', CAST(N'1985-03-27' AS Date), 1, N'kabai.balazs@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (74, N'Solymos Ferenc', CAST(N'1982-07-01' AS Date), 1, N'solymos.ferenc@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (75, N'Keller Balázs', CAST(N'1966-03-23' AS Date), 1, N'keller.balazs@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (76, N'Guttmann Adrián', CAST(N'1972-05-07' AS Date), 1, N'guttmann.adrian36@budapestmarathon.')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (77, N'Illovszki Lajos', CAST(N'1982-06-11' AS Date), 1, N'illovszkil@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (78, N'Balogh Dénes', CAST(N'1985-05-15' AS Date), 1, N'baloghd@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (79, N'Jászai Kálmán', CAST(N'1979-05-06' AS Date), 1, N'jaszaik53@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (80, N'Baranyai Buda', CAST(N'1992-03-03' AS Date), 1, N'baranyaib@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (81, N'Vállas Tamás', CAST(N'1968-07-01' AS Date), 1, N'vallast@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (82, N'Fazekas Buda', CAST(N'1988-07-12' AS Date), 1, N'fazekas.buda@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (83, N'Fási Buda', CAST(N'1980-03-15' AS Date), 1, N'fasib@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (84, N'Kaló Csilla', CAST(N'1991-07-23' AS Date), 0, N'kaloc@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (85, N'Balogh Gábor', CAST(N'1985-05-17' AS Date), 1, N'baloghg15@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (86, N'Halmosi Ádám', CAST(N'1967-03-14' AS Date), 1, N'halmosia@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (87, N'Kovács Balázs', CAST(N'1984-06-12' AS Date), 1, N'kovacsb@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (88, N'Megyeri László', CAST(N'1978-09-06' AS Date), 1, N'megyeri.laszlo46@budapestmarathon.h')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (89, N'Zsikla Emília', CAST(N'1986-05-25' AS Date), 0, N'zsiklae@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (90, N'Békési Tibor', CAST(N'1989-07-28' AS Date), 1, N'bekesit@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (91, N'Cseszneki Dávid', CAST(N'1972-04-25' AS Date), 1, N'cseszneki.david27@budapestmarathon.')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (92, N'Kányádi Bettina', CAST(N'1975-04-24' AS Date), 0, N'kanyadib@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (93, N'Keller János', CAST(N'1993-09-27' AS Date), 1, N'keller.janos@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (94, N'Tóth Dóra', CAST(N'1978-04-19' AS Date), 0, N'toth.dora@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (95, N'Kelemen Mariann', CAST(N'1991-03-09' AS Date), 0, N'kelemen.mariann@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (96, N'Veres Ferenc', CAST(N'1985-03-15' AS Date), 1, N'veresf@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (97, N'Horkai Nikolett', CAST(N'1978-03-16' AS Date), 0, N'horkai.nikolett@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (98, N'Gellért Géza', CAST(N'1974-04-28' AS Date), 1, N'gellertg@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (99, N'Illovszki Etelka', CAST(N'1992-05-08' AS Date), 0, N'illovszki.etelka@gmail.com')
GO
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (100, N'Szűcs Dávid', CAST(N'1983-09-04' AS Date), 1, N'szucs.david@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (101, N'Kabai Gabriella', CAST(N'1988-05-25' AS Date), 0, N'kabai.gabriella@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (102, N'Kovács Julianna', CAST(N'1990-05-02' AS Date), 0, N'kovacs.julianna@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (103, N'Herczeg József', CAST(N'1981-07-11' AS Date), 1, N'herczegj@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (104, N'Varga Fanny', CAST(N'1965-07-23' AS Date), 0, N'varga.fanny@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (105, N'Nagy Viktor', CAST(N'1965-03-27' AS Date), 1, N'nagy.viktor37@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (106, N'Herczeg László', CAST(N'1980-09-17' AS Date), 1, N'herczeg.laszlo@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (107, N'Eszes Bettina', CAST(N'1967-08-03' AS Date), 0, N'eszesb@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (108, N'Csala Edina', CAST(N'1986-04-28' AS Date), 0, N'csala.edina24@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (109, N'Nagy Zsanett', CAST(N'1994-07-13' AS Date), 0, N'nagy.zsanett@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (110, N'Tóth Marietta', CAST(N'1978-03-09' AS Date), 0, N'toth.marietta58@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (111, N'Darázs Barbara', CAST(N'1989-09-07' AS Date), 0, N'darazs.barbara@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (112, N'Zsiday Andrea', CAST(N'1973-07-03' AS Date), 0, N'zsidaya@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (113, N'Csoó Buda', CAST(N'1967-09-18' AS Date), 1, N'csoo.buda17@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (114, N'Bódog Ilona', CAST(N'1979-06-15' AS Date), 0, N'bodogi@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (115, N'Balogh Kálmán', CAST(N'1969-05-13' AS Date), 1, N'baloghk@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (116, N'Krasznai Sámuel', CAST(N'1980-07-10' AS Date), 1, N'krasznais@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (117, N'Guttmann József', CAST(N'1991-08-03' AS Date), 1, N'guttmann.jozsef12@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (118, N'Madarász Éva', CAST(N'1980-08-12' AS Date), 0, N'madarasze@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (119, N'Latorczai Dénes', CAST(N'1987-04-06' AS Date), 1, N'latorczaid@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (120, N'Latorczai Olga', CAST(N'1984-03-25' AS Date), 0, N'latorczai.olga@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (121, N'Kabai Dénes', CAST(N'1974-03-28' AS Date), 1, N'kabai.denes@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (122, N'Horkai Olga', CAST(N'1979-04-23' AS Date), 0, N'horkaio@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (123, N'Bethlen Edina', CAST(N'1984-06-18' AS Date), 0, N'bethlene55@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (124, N'Veres Tamás', CAST(N'1993-03-19' AS Date), 1, N'veres.tamas21@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (125, N'Kertész Helga', CAST(N'1992-08-16' AS Date), 0, N'kertesz.helga@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (126, N'Kelemen Miklós', CAST(N'1975-04-08' AS Date), 1, N'kelemen.miklos@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (127, N'Horkai Edina', CAST(N'1973-04-11' AS Date), 0, N'horkai.edina@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (128, N'Turai Ferenc', CAST(N'1966-08-17' AS Date), 1, N'turai.ferenc@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (129, N'Megyeri Nikolett', CAST(N'1976-09-25' AS Date), 0, N'megyerin@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (130, N'Zsiday Marietta', CAST(N'1990-08-26' AS Date), 0, N'zsiday.marietta23@budapestmarathon.')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (131, N'Erdei Adrián', CAST(N'1984-03-27' AS Date), 1, N'erdei.adrian@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (132, N'Cseszneki Zita', CAST(N'1968-05-22' AS Date), 0, N'csesznekiz@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (133, N'Molnár Lehel', CAST(N'1972-07-25' AS Date), 1, N'molnar.lehel@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (134, N'Jászai Bence', CAST(N'1975-08-09' AS Date), 1, N'jaszai.bence@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (135, N'Illovszki Pál', CAST(N'1978-03-10' AS Date), 1, N'illovszkip14@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (136, N'Zsiday Roland', CAST(N'1988-05-02' AS Date), 1, N'zsiday.roland@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (137, N'Fazekas Julianna', CAST(N'1969-08-16' AS Date), 0, N'fazekasj@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (138, N'Zsikla János', CAST(N'1976-04-18' AS Date), 1, N'zsiklaj@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (139, N'Kalló Emília', CAST(N'1979-08-20' AS Date), 0, N'kallo.emilia@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (140, N'Eszes Péter', CAST(N'1987-07-27' AS Date), 1, N'eszesp55@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (141, N'Solymos Etelka', CAST(N'1986-09-25' AS Date), 0, N'solymos.etelka@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (142, N'Bethlen Ádám', CAST(N'1992-09-14' AS Date), 1, N'bethlena@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (143, N'Nyúzó Nikolett', CAST(N'1977-03-27' AS Date), 0, N'nyuzo.nikolett@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (144, N'Nagy Ferenc', CAST(N'1978-06-20' AS Date), 1, N'nagyf@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (145, N'Zoltai Helga', CAST(N'1976-07-17' AS Date), 0, N'zoltai.helga18@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (146, N'Csoó Eleonóra', CAST(N'1974-06-04' AS Date), 0, N'csoo.eleonora18@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (147, N'Keller Klaudia', CAST(N'1965-09-16' AS Date), 0, N'kellerk@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (148, N'Keller Anikó', CAST(N'1994-06-10' AS Date), 0, N'keller.aniko@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (149, N'Gellért Tímea', CAST(N'1979-06-19' AS Date), 0, N'gellert.timea@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (150, N'Vállas Györgyi', CAST(N'1994-08-25' AS Date), 0, N'vallasg@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (151, N'Tóth Örs', CAST(N'1971-07-09' AS Date), 1, N'totho@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (152, N'Krasznai Marietta', CAST(N'1977-08-07' AS Date), 0, N'krasznai.marietta@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (153, N'Veres Linda', CAST(N'1966-09-01' AS Date), 0, N'veres.linda28@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (154, N'Veres Petra', CAST(N'1991-04-20' AS Date), 0, N'veresp@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (155, N'Kaleczky Judit', CAST(N'1966-09-03' AS Date), 0, N'kaleczkyj@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (156, N'Halmosi Györgyi', CAST(N'1984-07-01' AS Date), 0, N'halmosig@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (157, N'Latorczai Edina', CAST(N'1970-05-28' AS Date), 0, N'latorczai.edina@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (158, N'Andrási Eleonóra', CAST(N'1979-04-26' AS Date), 0, N'andrasie@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (159, N'Kányádi Dávid', CAST(N'1981-09-13' AS Date), 1, N'kanyadi.david@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (160, N'Bódog Rita', CAST(N'1983-04-09' AS Date), 0, N'bodog.rita@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (161, N'Szűcs Örs', CAST(N'1986-05-26' AS Date), 1, N'szucso@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (162, N'Szekeres János', CAST(N'1969-07-27' AS Date), 1, N'szekeres.janos@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (163, N'Kiss Örs', CAST(N'1966-08-12' AS Date), 1, N'kiss.ors@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (164, N'Kovács Lívia', CAST(N'1977-05-24' AS Date), 0, N'kovacsl57@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (165, N'Vörös Zsuzsanna', CAST(N'1987-05-15' AS Date), 0, N'voros.zsuzsanna27@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (166, N'Madarász Barbara', CAST(N'1981-09-17' AS Date), 0, N'madaraszb42@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (167, N'Békési Tibor', CAST(N'1985-06-10' AS Date), 1, N'bekesi.tibor@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (168, N'Ambrus Sándor', CAST(N'1974-06-06' AS Date), 1, N'ambruss@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (169, N'Kelemen Péter', CAST(N'1979-09-19' AS Date), 1, N'kelemenp@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (170, N'Szekeres Julianna', CAST(N'1974-08-16' AS Date), 0, N'szekeres.julianna@budapestmarathon.')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (171, N'Varga Róbert', CAST(N'1980-05-02' AS Date), 1, N'vargar45@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (172, N'Halmosi Mátyás', CAST(N'1971-07-06' AS Date), 1, N'halmosi.matyas@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (173, N'Baranyai Zsuzsanna', CAST(N'1989-03-10' AS Date), 0, N'baranyaiz@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (174, N'Józsa Helga', CAST(N'1965-05-23' AS Date), 0, N'jozsa.helga@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (175, N'Tolnai Bálint', CAST(N'1983-04-12' AS Date), 1, N'tolnai.balint@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (176, N'Gellért András', CAST(N'1975-03-05' AS Date), 1, N'gellerta@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (177, N'Kovács István', CAST(N'1983-09-19' AS Date), 1, N'kovacsi@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (178, N'Herczeg Mátyás', CAST(N'1983-05-18' AS Date), 1, N'herczegm@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (179, N'Fekete Tibor', CAST(N'1989-07-28' AS Date), 1, N'fekete.tibor@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (180, N'Kovács Györgyi', CAST(N'1986-04-28' AS Date), 0, N'kovacsg@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (181, N'Molnár Zsolt', CAST(N'1971-09-19' AS Date), 1, N'molnar.zsolt@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (182, N'Tóth Katalin', CAST(N'1988-09-26' AS Date), 0, N'toth.katalin@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (183, N'Keller Kitty', CAST(N'1969-04-22' AS Date), 0, N'kellerk@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (184, N'Guttmann András', CAST(N'1981-03-12' AS Date), 1, N'guttmann.andras@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (185, N'Horkai Mátyás', CAST(N'1973-06-05' AS Date), 1, N'horkai.matyas@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (186, N'Madarász Dénes', CAST(N'1992-09-17' AS Date), 1, N'madarasz.denes@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (187, N'Zsiday Adrián', CAST(N'1989-04-16' AS Date), 1, N'zsidaya@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (188, N'Zsolnai Lívia', CAST(N'1994-03-21' AS Date), 0, N'zsolnai.livia@budapestmarathon.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (189, N'Tóth Attila', CAST(N'1987-03-23' AS Date), 1, N'toth.attila@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (190, N'Csoó Zoltán', CAST(N'1981-03-20' AS Date), 1, N'csooz@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (191, N'Baranyai Bettina', CAST(N'1978-09-21' AS Date), 0, N'baranyaib39@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (192, N'Gellért József', CAST(N'1971-05-05' AS Date), 1, N'gellert.jozsef@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (193, N'Fekete Etelka', CAST(N'1988-04-06' AS Date), 0, N'fekete.etelka@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (194, N'Fási Mariann', CAST(N'1981-09-23' AS Date), 0, N'fasi.mariann21@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (195, N'Kaleczky Marietta', CAST(N'1972-05-06' AS Date), 0, N'kaleczky.marietta40@budapestmaratho')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (196, N'Zsiday Bettina', CAST(N'1970-09-03' AS Date), 0, N'zsidayb@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (197, N'Józsa Attila', CAST(N'1983-05-27' AS Date), 1, N'jozsa.attila@gmail.com')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (198, N'Zsiday Gábor', CAST(N'1971-09-27' AS Date), 1, N'zsidayg@freemail.hu')
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (199, N'Vállas Örs', CAST(N'1970-03-05' AS Date), 1, N'vallaso@gmail.com')
GO
INSERT [dbo].[versenyzo] ([versenyzo_id], [nev], [szuldatum], [nem], [email]) VALUES (200, N'Molnár Lajos', CAST(N'1993-06-14' AS Date), 1, N'molnarl@budapestmarathon.hu')
SET IDENTITY_INSERT [dbo].[versenyzo] OFF
GO
ALTER TABLE [dbo].[nevezes]  WITH CHECK ADD  CONSTRAINT [FK_nevezes_verseny] FOREIGN KEY([verseny_id])
REFERENCES [dbo].[verseny] ([verseny_id])
GO
ALTER TABLE [dbo].[nevezes] CHECK CONSTRAINT [FK_nevezes_verseny]
GO
ALTER TABLE [dbo].[nevezes]  WITH CHECK ADD  CONSTRAINT [FK_nevezes_versenyzo] FOREIGN KEY([versenyzo_id])
REFERENCES [dbo].[versenyzo] ([versenyzo_id])
GO
ALTER TABLE [dbo].[nevezes] CHECK CONSTRAINT [FK_nevezes_versenyzo]
GO
ALTER TABLE [dbo].[verseny]  WITH CHECK ADD  CONSTRAINT [FK_verseny_tipus] FOREIGN KEY([tipus_id])
REFERENCES [dbo].[tipus] ([tipus_id])
GO
ALTER TABLE [dbo].[verseny] CHECK CONSTRAINT [FK_verseny_tipus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "nevezes"
            Begin Extent = 
               Top = 168
               Left = 613
               Bottom = 281
               Right = 783
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tipus"
            Begin Extent = 
               Top = 222
               Left = 116
               Bottom = 318
               Right = 286
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "verseny"
            Begin Extent = 
               Top = 183
               Left = 350
               Bottom = 374
               Right = 520
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "versenyzo"
            Begin Extent = 
               Top = 249
               Left = 907
               Bottom = 404
               Right = 1077
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OsszesAdat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OsszesAdat'
GO
USE [master]
GO
ALTER DATABASE [sportiroda] SET  READ_WRITE 
GO
