USE [master]
GO
/****** Object:  Database [SWPDB]    Script Date: 31/10/2021 11:34:03 ******/
CREATE DATABASE [SWPDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWPDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SWPDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SWPDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SWPDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SWPDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWPDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWPDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWPDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWPDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWPDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWPDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWPDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWPDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWPDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWPDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWPDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWPDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWPDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWPDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWPDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWPDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWPDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWPDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWPDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWPDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWPDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWPDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWPDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWPDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWPDB] SET  MULTI_USER 
GO
ALTER DATABASE [SWPDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWPDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWPDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWPDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWPDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SWPDB]
GO
/****** Object:  Table [dbo].[account]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](30) NULL,
	[role] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bill]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bill](
	[billID] [int] IDENTITY(1,1) NOT NULL,
	[transID] [varchar](20) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[date] [date] NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [varchar](100) NOT NULL,
	[postalCode] [nvarchar](10) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[amount] [float] NOT NULL,
	[content] [text] NOT NULL,
	[bank] [nchar](10) NOT NULL,
	[fullname] [nvarchar](50) NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](20) NULL,
	[img] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contract]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contract](
	[contractID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[startDate] [date] NULL,
	[expiredDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[contractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[genre]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[songID] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[songID] ASC,
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[listDetail]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listDetail](
	[playlistID] [int] NOT NULL,
	[songID] [int] NOT NULL,
 CONSTRAINT [PK_listDetail] PRIMARY KEY CLUSTERED 
(
	[playlistID] ASC,
	[songID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[playlist]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[playlist](
	[playlistID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[playlistName] [varchar](30) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[playlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[singer]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[singer](
	[singerID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[info] [text] NULL,
	[img] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[singerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[song]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[song](
	[songID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[img] [text] NULL,
	[uri] [text] NULL,
	[likeCount] [int] NULL,
	[addDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[songID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[songOf]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songOf](
	[songID] [int] NOT NULL,
	[singerID] [int] NOT NULL,
 CONSTRAINT [PK_songOf] PRIMARY KEY CLUSTERED 
(
	[songID] ASC,
	[singerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 31/10/2021 11:34:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[username] [varchar](30) NOT NULL,
	[fullName] [varchar](50) NULL,
	[email] [varchar](30) NULL,
	[status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'diep', N'123', N'user')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'long', N'123', N'admin')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'son', N'456', N'user')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'tra', N'123', N'user')
INSERT [dbo].[account] ([username], [password], [role]) VALUES (N'viet', N'123', N'user')
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([billID], [transID], [username], [date], [phone], [address], [postalCode], [city], [country], [amount], [content], [bank], [fullname]) VALUES (9, N'202110202', N'viet', CAST(N'2021-10-20' AS Date), N'0934998386', N'22 Lang Ha Dong Da Ha Noi', N'100000', N'Ha Noi', N'VN', 180000, N'Thanh toan MSW', N'NCB       ', N'Viet Long Nguyen')
INSERT [dbo].[bill] ([billID], [transID], [username], [date], [phone], [address], [postalCode], [city], [country], [amount], [content], [bank], [fullname]) VALUES (10, N'202110203', N'long', CAST(N'2021-10-20' AS Date), N'0934998386', N'22 Lang Ha Dong Da Ha Noi', N'100000', N'Ha Noi', N'VN', 180000, N'Thanh toan MSW', N'NCB       ', N'Nguyen Long')
INSERT [dbo].[bill] ([billID], [transID], [username], [date], [phone], [address], [postalCode], [city], [country], [amount], [content], [bank], [fullname]) VALUES (11, N'202110204', N'tra', CAST(N'2021-10-20' AS Date), N'0934998386', N'22 Lang Ha Dong Da Ha Noi', N'100000', N'Ha Noi', N'VN', 180000, N'Thanh toan MSW', N'NCB       ', N'Thanh Tra')
SET IDENTITY_INSERT [dbo].[bill] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (1, N'Pop', N'https://res.cloudinary.com/longfpt/image/upload/v1633680636/img/Frame_3_xnrqut.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (2, N'Mood', N'https://res.cloudinary.com/longfpt/image/upload/v1633680636/img/Frame_5_kqqguw.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (3, N'Hip-Hop', N'https://res.cloudinary.com/longfpt/image/upload/v1633680636/img/Frame_4_t9w8w9.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (4, N'Indie', N'https://res.cloudinary.com/longfpt/image/upload/v1633680637/img/Frame_2g2_owwe3t.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (5, N'R&B', N'https://res.cloudinary.com/longfpt/image/upload/v1633680636/img/Frame_6_iej5hd.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (6, N'Rock', N'https://res.cloudinary.com/longfpt/image/upload/v1633680637/img/Frame_7_klon2e.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (7, N'Anime', N'https://res.cloudinary.com/longfpt/image/upload/v1633680637/img/m3_hftgxx.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (8, N'Party', N'https://res.cloudinary.com/longfpt/image/upload/v1633680638/img/m7_xfqzpg.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (9, N'Concert', N'https://res.cloudinary.com/longfpt/image/upload/v1633680637/img/m4_ujdbex.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (10, N'Gaming', N'https://res.cloudinary.com/longfpt/image/upload/v1633680636/img/Frame_1g1_1_aswzll.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (11, N'Chill', N'https://res.cloudinary.com/longfpt/image/upload/v1633680638/img/m5_g8cvq3.png')
INSERT [dbo].[category] ([categoryID], [categoryName], [img]) VALUES (12, N'Christmas', N'https://res.cloudinary.com/longfpt/image/upload/v1633680638/img/m6_qu5jvr.png')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[contract] ON 

INSERT [dbo].[contract] ([contractID], [username], [startDate], [expiredDate]) VALUES (6, N'viet', CAST(N'2021-10-20' AS Date), CAST(N'2021-11-19' AS Date))
INSERT [dbo].[contract] ([contractID], [username], [startDate], [expiredDate]) VALUES (7, N'long', CAST(N'2021-10-20' AS Date), CAST(N'2021-11-19' AS Date))
INSERT [dbo].[contract] ([contractID], [username], [startDate], [expiredDate]) VALUES (8, N'tra', CAST(N'2021-10-20' AS Date), CAST(N'2021-11-19' AS Date))
SET IDENTITY_INSERT [dbo].[contract] OFF
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (4, 1)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (5, 1)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (6, 1)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (7, 5)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (8, 5)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (9, 1)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (10, 1)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (11, 5)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (12, 1)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (13, 4)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (14, 4)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (15, 1)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (16, 4)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (17, 4)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (18, 2)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (19, 4)
INSERT [dbo].[genre] ([songID], [categoryID]) VALUES (25, 4)
INSERT [dbo].[listDetail] ([playlistID], [songID]) VALUES (1, 5)
INSERT [dbo].[listDetail] ([playlistID], [songID]) VALUES (1, 13)
INSERT [dbo].[listDetail] ([playlistID], [songID]) VALUES (10, 19)
SET IDENTITY_INSERT [dbo].[playlist] ON 

INSERT [dbo].[playlist] ([playlistID], [username], [playlistName], [description]) VALUES (1, N'long', N'My Favorite', N'When you like a song, it''s added here')
INSERT [dbo].[playlist] ([playlistID], [username], [playlistName], [description]) VALUES (7, N'tra', N'My Favorite', N'When you like a song, it''s added here')
INSERT [dbo].[playlist] ([playlistID], [username], [playlistName], [description]) VALUES (8, N'viet', N'My Favorite', N'When you like a song, it''s added here')
INSERT [dbo].[playlist] ([playlistID], [username], [playlistName], [description]) VALUES (9, N'son', N'My Favorite', N'When you like a song, it''s added here')
INSERT [dbo].[playlist] ([playlistID], [username], [playlistName], [description]) VALUES (10, N'long', N'test playlist', N'my new list')
INSERT [dbo].[playlist] ([playlistID], [username], [playlistName], [description]) VALUES (12, N'tra', N'Test Playlist', N'just a test')
SET IDENTITY_INSERT [dbo].[playlist] OFF
SET IDENTITY_INSERT [dbo].[singer] ON 

INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (3, N'My Anh', N'N/A', N'https://avatar-ex-swe.nixcdn.com/song/2021/07/06/7/a/3/0/1625546730475_640.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (4, N'Khac Hung', N'N/A', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2018/10/03/6/d/2/f/1538535901848_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (5, N'Chillies', N'A Boy Band', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2020/07/22/f/1/f/9/1595414808364_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (6, N'Van Mai Huong', N'Neu nhu ngay em buoc den...', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2021/01/22/9/6/7/5/1611280199069_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (7, N'Binz', N'Vietnamese rapper from SpaceSpeakers', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2019/09/12/c/3/c/7/1568253936065_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (8, N'Juky San', N'N/A', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2021/02/17/a/3/2/1/1613561860337_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (9, N'Soobin Hoang Son', N'Chot nhan ra anh da danh mat...', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2019/09/05/d/9/5/e/1567670108816_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (10, N'Vu', N'A Vietnamese famous indie music composer/singer', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2020/07/17/2/0/e/d/1594980595388_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (11, N'Kimmese', N'Female Rapper from Ha Noi', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2016/01/25/4/1/1/7/1453715840638_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (12, N'Lukas Graham', N'I don''t really have any clue about him', N'https://billboardvn.vn/wp-content/uploads/2021/07/billboard-vn-Picture1.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (13, N'Ngot', N'Ngot is a Vietnamese indie pop band consisting of 4 members Vu Dinh Trong Thang, Nguyen Chi Hung, Phan Viet Hoang and Nguyen Hung Nam Anh.', N'https://kenh14cdn.com/thumb_w/660/2019/12/22/artboard-1-copy-6-15770337384481151658079.png')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (14, N'Son Tung MTP', N'A Vietnamese singer-songwriter and actor', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2021/05/12/7/d/c/b/1620802736418_600.jpg')
INSERT [dbo].[singer] ([singerID], [name], [info], [img]) VALUES (15, N'Thinh Suy', N'Thinh... Suy Nghi', N'https://avatar-ex-swe.nixcdn.com/singer/avatar/2020/08/07/7/0/2/a/1596787281509_600.jpg')
SET IDENTITY_INSERT [dbo].[singer] OFF
SET IDENTITY_INSERT [dbo].[song] ON 

INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (4, N'Real love', N'https://static.yeah1.com/uploads/editors/26/2021/07/30/gGOSwwQVwszafKF3HJAHQ5klSWXu3ji7KSJhqttP.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021179/music/Reallove_nqnulm.mp3', 101, CAST(N'2021-11-12 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (5, N'Co Em Doi Bong Vui', N'https://images.genius.com/5822e08274e4684b00a177ff3ef2f33e.551x551x1.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021174/music/Chillies_vffte2.mp3', 200, CAST(N'2021-11-07 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (6, N'Huong', N'https://avatar-ex-swe.nixcdn.com/song/share/2021/01/22/7/e/7/0/1611280899564.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021177/music/Huong_feni5c.mp3', 100, CAST(N'2021-11-01 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (7, N'GENE', N'https://tudienwiki.com/wp-content/uploads/2020/09/Binz.png', N'https://res.cloudinary.com/longfpt/video/upload/v1633021174/music/GENE_y68tkk.mp3', 100, CAST(N'2021-11-04 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (8, N'Krazy', N'https://avatar-nct.nixcdn.com/mv/2018/02/02/a/5/2/9/1517539425061_640.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021174/music/Krazy_bhfowu.mp3', 100, CAST(N'2021-11-13 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (9, N'Phai Chang Em Da Yeu', N'https://i1.sndcdn.com/artworks-zEUVw9b46Eu9qGYe-eATUzg-t500x500.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021178/music/Phaichangemdayeu_xgy3av.mp3', 100, CAST(N'2021-11-13 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (10, N'Thang Nam', N'https://cdnmedia.thethaovanhoa.vn/Upload/3uPkfvAxvuOpUQrmKeiDaA/files/2021/08/B/22/playah_Fotor.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021180/music/Thangnam_klnu5o.mp3', 100, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (11, N'They Said', N'https://i.ytimg.com/vi/XdBsAXOxYfo/hqdefault.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021179/music/TheySaid_needva.mp3', 100, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (12, N'La Lung', N'https://avatar-ex-swe.nixcdn.com/song/2018/01/26/1/8/9/0/1516930244148_640.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021178/music/LaLung-Vu-4749614_yyibs8.mp3', 100, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (13, N'Mot Giac Mo', N'https://avatar-ex-swe.nixcdn.com/song/2020/06/19/b/8/9/9/1592536720854_640.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021178/music/MotGiacMoFeatKimmese-VU-6302480_smaciw.mp3', 100, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (14, N'Buoc Qua Mua Co Don', N'https://avatar-ex-swe.nixcdn.com/song/2020/12/11/4/0/f/e/1607643612541_640.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021175/music/BuocQuaMuaCoDon-Vu-6879419_ydw3fk.mp3', 100, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (15, N'Happy For You', N'https://avatar-ex-swe.nixcdn.com/song/2021/07/01/c/9/4/d/1625134149838_640.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021174/music/HappyForYouFeatVu-LukasGraham-7041245_ct9uzd.mp3', 100, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (16, N'Da Tung La', N'https://avatar-ex-swe.nixcdn.com/song/2020/05/04/c/b/3/a/1588557397730_640.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633021174/music/DaTungLa-VU-6286897_smbb9e.mp3', 100, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (17, N'Cho', N'https://i1.sndcdn.com/artworks-000245117642-dqn8mo-t500x500.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633681076/music/Ng%E1%BB%8Dt_-_Cho_qdum1a.mp3', 100, CAST(N'2021-11-13 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (18, N'Chung Ta Cua Hien Tai', N'https://res.cloudinary.com/longfpt/image/upload/v1633681615/img/ab67616d0000b2735888c34015bebbf123957f6d_httdkp.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633681936/music/chung-ta-cua-hien-tai-audio-son-tung-m-tp_sh3wwo.mp3', 500, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (19, N'Chuyen Rang', N'https://data.chiasenhac.com/data/cover/126/125351.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1633681934/music/Chuy%E1%BB%87n_R%E1%BA%B1ng_swit4p.mp3', 200, CAST(N'2021-11-11 13:23:44.000' AS DateTime))
INSERT [dbo].[song] ([songID], [name], [img], [uri], [likeCount], [addDate]) VALUES (25, N'Vung Ky Uc', N'https://avatar-ex-swe.nixcdn.com/song/2020/05/14/c/6/d/9/1589425750636_640.jpg', N'https://res.cloudinary.com/longfpt/video/upload/v1635522654/music/VungKyUc-Chillies-6278528_sqkswm.mp3', 0, CAST(N'2021-10-29 23:17:43.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[song] OFF
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (4, 3)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (4, 4)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (5, 5)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (6, 6)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (7, 7)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (8, 7)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (9, 8)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (10, 9)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (11, 7)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (12, 10)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (13, 10)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (13, 11)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (14, 10)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (15, 10)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (15, 12)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (16, 10)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (17, 13)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (18, 14)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (19, 15)
INSERT [dbo].[songOf] ([songID], [singerID]) VALUES (25, 5)
INSERT [dbo].[user] ([username], [fullName], [email], [status]) VALUES (N'diep', N'Ngoc Diep', N'diep@gmail.com', N'normal')
INSERT [dbo].[user] ([username], [fullName], [email], [status]) VALUES (N'long', N'Nguyen Long', N'long@gmail.com', N'premium')
INSERT [dbo].[user] ([username], [fullName], [email], [status]) VALUES (N'son', N'Nguyen Minh Son', N'son@gmail.com', N'normal')
INSERT [dbo].[user] ([username], [fullName], [email], [status]) VALUES (N'tra', N'Thanh Tra', N'tra@gmail.com', N'premium')
INSERT [dbo].[user] ([username], [fullName], [email], [status]) VALUES (N'viet', N'Viet Long Nguyen', N'viet@gmail.com', N'premium')
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [FK_bill_user] FOREIGN KEY([username])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [FK_bill_user]
GO
ALTER TABLE [dbo].[contract]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[genre]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[category] ([categoryID])
GO
ALTER TABLE [dbo].[genre]  WITH CHECK ADD FOREIGN KEY([songID])
REFERENCES [dbo].[song] ([songID])
GO
ALTER TABLE [dbo].[listDetail]  WITH CHECK ADD  CONSTRAINT [FK__listDetai__songI__30F848ED] FOREIGN KEY([songID])
REFERENCES [dbo].[song] ([songID])
GO
ALTER TABLE [dbo].[listDetail] CHECK CONSTRAINT [FK__listDetai__songI__30F848ED]
GO
ALTER TABLE [dbo].[listDetail]  WITH CHECK ADD  CONSTRAINT [FK_listDetail] FOREIGN KEY([playlistID])
REFERENCES [dbo].[playlist] ([playlistID])
GO
ALTER TABLE [dbo].[listDetail] CHECK CONSTRAINT [FK_listDetail]
GO
ALTER TABLE [dbo].[playlist]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[user] ([username])
GO
ALTER TABLE [dbo].[songOf]  WITH CHECK ADD FOREIGN KEY([singerID])
REFERENCES [dbo].[singer] ([singerID])
GO
ALTER TABLE [dbo].[songOf]  WITH CHECK ADD FOREIGN KEY([songID])
REFERENCES [dbo].[song] ([songID])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user] FOREIGN KEY([username])
REFERENCES [dbo].[account] ([username])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user]
GO
USE [master]
GO
ALTER DATABASE [SWPDB] SET  READ_WRITE 
GO
