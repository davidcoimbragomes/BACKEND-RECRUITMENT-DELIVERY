USE [master]
GO
/****** Object:  Database [bliss]    Script Date: 20/05/2018 16:22:55 ******/
CREATE DATABASE [bliss]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bliss', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\bliss.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bliss_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\bliss_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bliss] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bliss].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bliss] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bliss] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bliss] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bliss] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bliss] SET ARITHABORT OFF 
GO
ALTER DATABASE [bliss] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bliss] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bliss] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bliss] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bliss] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bliss] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bliss] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bliss] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bliss] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bliss] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bliss] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bliss] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bliss] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bliss] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bliss] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bliss] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bliss] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bliss] SET RECOVERY FULL 
GO
ALTER DATABASE [bliss] SET  MULTI_USER 
GO
ALTER DATABASE [bliss] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bliss] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bliss] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bliss] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bliss] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bliss] SET QUERY_STORE = OFF
GO
USE [bliss]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [bliss]
GO
/****** Object:  Table [dbo].[rel_question_choices]    Script Date: 20/05/2018 16:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rel_question_choices](
	[questionID] [int] NOT NULL,
	[choiceID] [int] NOT NULL,
	[votes] [int] NOT NULL,
 CONSTRAINT [PK_rel_question_choices] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC,
	[choiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_choices]    Script Date: 20/05/2018 16:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_choices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[choice] [varchar](300) NULL,
 CONSTRAINT [PK_tbl_choices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_question]    Script Date: 20/05/2018 16:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](300) NULL,
	[image_url] [varchar](300) NULL,
	[thumb_url] [varchar](300) NULL,
	[published_at] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (1, 1, 1)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (1, 2, 2)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (1, 3, 3)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (2, 1, 11)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (2, 2, 12)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (2, 3, 13)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (6, 2, 12)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (6, 3, 13)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (6, 5, 11)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (7, 2, 12)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (7, 3, 13)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (7, 6, 11)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (8, 7, 11)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (8, 8, 12)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (8, 9, 13)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (9, 10, 11)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (9, 11, 12)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (9, 12, 13)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (10, 13, 11)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (10, 14, 12)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (10, 15, 13)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (1004, 13, 11)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (1004, 14, 12)
INSERT [dbo].[rel_question_choices] ([questionID], [choiceID], [votes]) VALUES (1004, 15, 13)
SET IDENTITY_INSERT [dbo].[tbl_choices] ON 

INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (1, N'Swift')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (2, N'Python')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (3, N'Objective-C')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (4, N'Ruby')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (5, N'Angular')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (6, N'C')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (7, N'C2')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (8, N'Python2')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (9, N'Objective-C2')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (10, N'green')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (11, N'red')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (12, N'orange')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (13, N'dog')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (14, N'cat')
INSERT [dbo].[tbl_choices] ([ID], [choice]) VALUES (15, N'fish')
SET IDENTITY_INSERT [dbo].[tbl_choices] OFF
SET IDENTITY_INSERT [dbo].[tbl_question] ON 

INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (1, N'Favourite programming language?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (2, N'Favourite programming language2?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (3, N'Favourite programming language3?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (4, N'Favourite programming language2?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-18T22:07:48.453' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (5, N'Favourite programming languageAngular?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-18T22:36:38.773' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (6, N'Favourite programming languageAngular?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-18T22:38:49.900' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (7, N'Favourite programming language C?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-18T22:43:25.153' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (8, N'Favourite programming language C3?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-20T16:18:31.750' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (9, N'Favourite color?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-19T01:13:16.417' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (10, N'Favourite pet?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-19T18:43:27.160' AS DateTime))
INSERT [dbo].[tbl_question] ([ID], [question], [image_url], [thumb_url], [published_at]) VALUES (1004, N'Favourite pet?', N'https://dummyimage.com/600x400/000/fff.png&text=question+1+image+(600x400)', N'https://dummyimage.com/120x120/000/fff.png&text=question+1+image+(120x120)', CAST(N'2018-05-20T16:17:37.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_question] OFF
ALTER TABLE [dbo].[rel_question_choices]  WITH CHECK ADD  CONSTRAINT [FK_rel_question_choices_tbl_choices] FOREIGN KEY([choiceID])
REFERENCES [dbo].[tbl_choices] ([ID])
GO
ALTER TABLE [dbo].[rel_question_choices] CHECK CONSTRAINT [FK_rel_question_choices_tbl_choices]
GO
ALTER TABLE [dbo].[rel_question_choices]  WITH CHECK ADD  CONSTRAINT [FK_rel_question_choices_tbl_question] FOREIGN KEY([questionID])
REFERENCES [dbo].[tbl_question] ([ID])
GO
ALTER TABLE [dbo].[rel_question_choices] CHECK CONSTRAINT [FK_rel_question_choices_tbl_question]
GO
USE [master]
GO
ALTER DATABASE [bliss] SET  READ_WRITE 
GO
