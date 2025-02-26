USE [master]
GO
/****** Object:  Database [OnlineLearn]    Script Date: 11/29/2024 1:58:19 PM ******/
CREATE DATABASE [OnlineLearn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineLearn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineLearn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineLearn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\OnlineLearn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OnlineLearn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineLearn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineLearn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineLearn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineLearn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineLearn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineLearn] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineLearn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineLearn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineLearn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineLearn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineLearn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineLearn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineLearn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineLearn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineLearn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineLearn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineLearn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineLearn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineLearn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineLearn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineLearn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineLearn] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineLearn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineLearn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineLearn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineLearn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineLearn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineLearn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineLearn] SET QUERY_STORE = OFF
GO
USE [OnlineLearn]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MetaTitle] [varchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[UserID] [bigint] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[PublishedDate] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[Status] [bit] NULL,
	[ImageBlog] [nvarchar](500) NOT NULL,
	[CategoryBlogId] [bigint] NULL,
	[Likes] [bigint] NULL,
	[Views] [bigint] NULL,
	[Title] [nvarchar](500) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogComment]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogComment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CommentMsg] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[BlogID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[ParentID] [bigint] NULL,
 CONSTRAINT [PK_BlogComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CommentMsg] [nvarchar](max) NULL,
	[CommentDate] [datetime] NULL,
	[ProductID] [bigint] NULL,
	[UserID] [bigint] NULL,
	[ParentID] [bigint] NULL,
	[Rate] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[QuestionList] [varchar](200) NULL,
	[AnswerList] [varchar](200) NULL,
	[ProductID] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[TotalScore] [smallint] NULL,
	[Time] [smallint] NULL,
	[TotalQuestion] [smallint] NULL,
	[Type] [varchar](1) NULL,
	[Status] [bit] NULL,
	[QuestionEssay] [nvarchar](max) NULL,
	[UserList] [nvarchar](3000) NULL,
	[ScoreList] [varchar](200) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](50) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ViewCount] [int] NULL,
	[LinkVideo] [varchar](50) NULL,
	[ListType] [varchar](250) NULL,
	[ListFile] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](50) NULL,
	[ParentId] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](3000) NULL,
	[Content] [nvarchar](max) NULL,
	[Answer] [nvarchar](4000) NULL,
	[Type] [varchar](1) NULL,
	[ProductID] [bigint] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[UserID] [bigint] NOT NULL,
	[ExamID] [bigint] NOT NULL,
	[ResultQuiz] [varchar](300) NULL,
	[ResultEssay] [nvarchar](max) NULL,
	[StartDateQuiz] [varchar](300) NULL,
	[StartTimeQuiz] [varchar](20) NULL,
	[FinishTimeQuiz] [varchar](20) NULL,
	[StartTimeEssay] [varchar](20) NULL,
	[FinishTimeEssay] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Score] [varchar](10) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/29/2024 1:58:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](350) NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[ProductList] [nvarchar](250) NULL,
	[Role] [int] NULL,
	[Avatar] [nvarchar](350) NULL,
	[LastLogin] [datetime] NULL,
	[AboutMe] [nvarchar](1000) NULL,
	[UrlFacebook] [nvarchar](1000) NULL,
	[UrlYoutube] [nvarchar](1000) NULL,
	[UrlInstagram] [nvarchar](1000) NULL,
	[Education] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (1, N'studen-loan', N'Student Loan Survey: Many Owe $50K-plus', 4, N'Affronting imprudence do he he everything. Offered chiefly farther of my no colonel shyness. Such on help ye some door if in. Laughter proposal laughing any son law consider. Needed except up piqued an.

', CAST(N'2024-03-18T10:18:33.517' AS DateTime), CAST(N'2024-03-29T00:00:00.000' AS DateTime), 1, N'/assets/client/images/event/02.jpg', 1, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (2, N'Covid-19-and-the-college-experienced', N'How to make a college list', 4, N'Prospective students should start broadly and then narrow their list down to colleges that best fit their needs, experts say. Yet remarkably appearance get him his projection.', CAST(N'2024-03-17T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/08.jpg', 1, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (4, N'Covid-19-and-the-college-experienced', N'Never underestimate the influence of Eduport', 122, N'Prospective students should start broadly and then narrow their list', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/09.jpg', 2, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (7, N'Covid-19-and-the-college-experienced', N'Covid-19 and the college experienced', 122, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/03.jpg', 3, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (8, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (9, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (10, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (11, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (12, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (13, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (14, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (15, N'Campus-Support-for-First-Year-Students', N'Campus Support for First-Year Students', 4, N'Rooms oh fully taken by worse do. Points afraid but may end law. Points afraid but may end law', CAST(N'2024-03-19T10:18:33.517' AS DateTime), CAST(N'2024-03-19T10:18:33.517' AS DateTime), 1, N'/assets/client/images/event/05.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (21, N'Cristiano-Ronaldo-The-football-icon', N'Cristiano Ronaldo | The football icon', 4, N'<h2>Family and Birth&nbsp;</h2>

<p>Cristiano Ronaldo was born in Portugal on February 5, 1985, to Jose Dinis Aveiro and Maria Dolores dos Santos Aveiro in Funchal, Portugal. Ronaldo has a brother and two sisters and is the youngest of his siblings.</p>

<h2>Schooling&nbsp;</h2>

<p><img alt="Cristiano Ronaldo" src="https://ischoolconnect.com/blog/wp-content/uploads/2022/09/football.jpg" style="height:333px; width:500px" /></p>

<p>It&rsquo;s not how big you are it&rsquo;s about how big you play</p>

<p><ins><iframe frameborder="0" height="0" id="aswift_1" name="aswift_1" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-6393389268642197&amp;output=html&amp;h=186&amp;slotname=5354584598&amp;adk=383969155&amp;adf=3046447484&amp;pi=t.ma~as.5354584598&amp;w=730&amp;lmt=1710953297&amp;rafmt=11&amp;format=730x186&amp;url=https%3A%2F%2Fischoolconnect.com%2Fblog%2Fcristiano-ronaldo-the-football-icon%2F&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTUuMC4wIiwieDg2IiwiIiwiMTIyLjAuNjI2MS4xMjkiLG51bGwsMCxudWxsLCI2NCIsW1siQ2hyb21pdW0iLCIxMjIuMC42MjYxLjEyOSJdLFsiTm90KEE6QnJhbmQiLCIyNC4wLjAuMCJdLFsiR29vZ2xlIENocm9tZSIsIjEyMi4wLjYyNjEuMTI5Il1dLDBd&amp;dt=1710953297728&amp;bpp=1&amp;bdt=1341&amp;idt=253&amp;shv=r20240314&amp;mjsv=m202403140101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=4741092313462&amp;frm=20&amp;pv=1&amp;ga_vid=507249683.1710953298&amp;ga_sid=1710953298&amp;ga_hid=1906779201&amp;ga_fc=1&amp;u_tz=420&amp;u_his=3&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1032&amp;u_aw=1920&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=397&amp;ady=2538&amp;biw=1903&amp;bih=945&amp;scr_x=0&amp;scr_y=0&amp;eid=44759875%2C44759926%2C44759842%2C31081827%2C31081903%2C44795922%2C95320377%2C95321867%2C31078663%2C31078665%2C31078668%2C31078670&amp;oid=2&amp;pvsid=301918066725633&amp;tmod=1857970181&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Fwww.google.com%2F&amp;fc=1920&amp;brdim=1%2C1%2C1%2C1%2C1920%2C0%2C1918%2C1030%2C1920%2C945&amp;vis=1&amp;rsz=%7C%7CpeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=128&amp;bc=31&amp;bz=1&amp;td=1&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;dtd=256" width="730"></iframe></ins></p>

<p>Ronaldo was born into a low-income family and consequently never attended school. He was accused of throwing a chair at one of his school instructors when he was 14 years old, for which he was expelled. Ronaldo has loved football since he was a child and aspired to make a career, so he dropped out of school after being expelled. Ronaldo&rsquo;s family supported him in his decision to drop out.</p>
', CAST(N'2024-03-19T10:18:33.517' AS DateTime), NULL, 1, N'/Data/images/avatar/nat-callaghan-IEmaR3ecfuY-unsplash-816x459.jpg', 1, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (25, NULL, NULL, 4, N'<p>It was not to have the fairytale ending that many had hoped for but regardless, Cristiano Ronaldo&rsquo;s second spell at Manchester United should not be a chapter of regret.</p>

<p>Playing some outstanding football during what was a troubled spell for the Red Devils, the Portuguese superstar can be proud of what he achieved in his second stint at Old Trafford.</p>

<h2>A Hero&rsquo;s Welcome For United Icon</h2>

<p>There is little doubt it was at Manchester United where the Cristiano Ronaldo legacy really took shape and the forward was welcomed back to the club with open arms in August 2021. Ronaldo hit the ground running with a brace against Newcastle in his first game back, before scoring against the likes of West Ham United, Tottenham Hotspur, Arsenal, Norwich and a Burnley side that are 1/12 in the&nbsp;<a href="https://www.betfair.com/betting/football/english-premier-league/relegation-2023-24/mwe-924.363383743">odds on the Premier League relegation results</a>&nbsp;this season. The returning star was not just banging in the goals against teams in the English top flight but was also prolific in the Champions League in that 2021/22 season. During the group&nbsp;stages, the veteran striker scored in five consecutive Champions League games and finished the group stage with six goals in total to his name.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>A hip flexor issue did hinder his progress at some stages of the campaign but overall, on an individual basis, it really was an impressive start for Ronaldo, who showed he was still more than capable at the highest level. However, with United struggling as a side to keep up with rivals Manchester City and Liverpool on the Premier League table, all did not seem to be well behind the scenes in the Red Devils&rsquo; dressing room. Ronaldo returned to Old Trafford to try and help bring the good times back that he enjoyed during the successful spell for the club under manager Sir Alex Ferguson. However, he returned to a Manchester United side in a very different place and a somewhat&nbsp;<a href="https://www.theguardian.com/football/2021/nov/29/manchester-united-confirm-ralf-rangnick-as-interim-manager">fractured relationship with interim boss Ralf Rangnick</a>&nbsp;soon saw Ronaldo struggling for game time.</p>

<h2>Plenty Of Positives Still To Take From United Return</h2>

<p>Ultimately the arrival of Rangnick&rsquo;s replacement Erik Ten Hag saw Ronaldo&rsquo;s time at Old Trafford brought to an abrupt end. Despite finishing the club&rsquo;s top goalscorer the previous season, Ten Hag seemed to quickly decide Ronaldo was not in his plans going forward and the goal machine eventually moved on&nbsp;<a href="https://www.bbc.co.uk/sport/football/64155302">to Al Nassr on January 1st, 2023</a>. It brought to an end a turbulent chapter for Ronaldo and a chance for a new challenge to win silverware and grow the game in Saudi Arabia.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>While the second spell at Old Trafford for Ronaldo didn&rsquo;t end as he would have hoped, the former Real Madrid and Juventus star should be proud of his efforts. The five-time Ballon d&rsquo;Or winner brought a focal point to the United attack and was instrumental in the final third when other attacking players seemed to be out of form. The club&rsquo;s next generation of stars also got an opportunity to train and play with one of the best players the game has ever seen and will have learned plenty from working alongside him.</p>

<p>Ronaldo will go down as one of the greatest ever players to where the Manchester United shirt and his second spell at Old Trafford, while somewhat unsettled, still added to that legacy.</p>
', CAST(N'2024-03-19T10:18:33.517' AS DateTime), NULL, 1, N'/Data/images/avatar/nat-callaghan-IEmaR3ecfuY-unsplash-816x459.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (26, N'there-should-be-no-regrets-over-ronaldos-old-trafford-return', N'THERE SHOULD BE NO REGRETS OVER RONALDO’S OLD TRAFFORD RETURN', 4, N'<p>It was not to have the fairytale ending that many had hoped for but regardless, Cristiano Ronaldo&rsquo;s second spell at Manchester United should not be a chapter of regret.</p>

<p>Playing some outstanding football during what was a troubled spell for the Red Devils, the Portuguese superstar can be proud of what he achieved in his second stint at Old Trafford.</p>

<h2>A Hero&rsquo;s Welcome For United Icon</h2>

<p>There is little doubt it was at Manchester United where the Cristiano Ronaldo legacy really took shape and the forward was welcomed back to the club with open arms in August 2021. Ronaldo hit the ground running with a brace against Newcastle in his first game back, before scoring against the likes of West Ham United, Tottenham Hotspur, Arsenal, Norwich and a Burnley side that are 1/12 in the&nbsp;<a href="https://www.betfair.com/betting/football/english-premier-league/relegation-2023-24/mwe-924.363383743">odds on the Premier League relegation results</a>&nbsp;this season. The returning star was not just banging in the goals against teams in the English top flight but was also prolific in the Champions League in that 2021/22 season. During the group&nbsp;stages, the veteran striker scored in five consecutive Champions League games and finished the group stage with six goals in total to his name.</p>

<p>&nbsp;</p>

<p><iframe id="fitvid395650" src="https://www.youtube.com/embed/BqBvUnZZtYo?version=3&amp;rel=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;fs=1&amp;hl=en-US&amp;autohide=2&amp;wmode=transparent"></iframe></p>

<p>A hip flexor issue did hinder his progress at some stages of the campaign but overall, on an individual basis, it really was an impressive start for Ronaldo, who showed he was still more than capable at the highest level. However, with United struggling as a side to keep up with rivals Manchester City and Liverpool on the Premier League table, all did not seem to be well behind the scenes in the Red Devils&rsquo; dressing room. Ronaldo returned to Old Trafford to try and help bring the good times back that he enjoyed during the successful spell for the club under manager Sir Alex Ferguson. However, he returned to a Manchester United side in a very different place and a somewhat&nbsp;<a href="https://www.theguardian.com/football/2021/nov/29/manchester-united-confirm-ralf-rangnick-as-interim-manager">fractured relationship with interim boss Ralf Rangnick</a>&nbsp;soon saw Ronaldo struggling for game time.</p>

<h2>Plenty Of Positives Still To Take From United Return</h2>

<p>Ultimately the arrival of Rangnick&rsquo;s replacement Erik Ten Hag saw Ronaldo&rsquo;s time at Old Trafford brought to an abrupt end. Despite finishing the club&rsquo;s top goalscorer the previous season, Ten Hag seemed to quickly decide Ronaldo was not in his plans going forward and the goal machine eventually moved on&nbsp;<a href="https://www.bbc.co.uk/sport/football/64155302">to Al Nassr on January 1st, 2023</a>. It brought to an end a turbulent chapter for Ronaldo and a chance for a new challenge to win silverware and grow the game in Saudi Arabia.</p>

<p>&nbsp;</p>

<p><iframe id="fitvid774360" src="https://www.youtube.com/embed/j8TcR4ihSyE?version=3&amp;rel=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;fs=1&amp;hl=en-US&amp;autohide=2&amp;wmode=transparent"></iframe></p>

<p>While the second spell at Old Trafford for Ronaldo didn&rsquo;t end as he would have hoped, the former Real Madrid and Juventus star should be proud of his efforts. The five-time Ballon d&rsquo;Or winner brought a focal point to the United attack and was instrumental in the final third when other attacking players seemed to be out of form. The club&rsquo;s next generation of stars also got an opportunity to train and play with one of the best players the game has ever seen and will have learned plenty from working alongside him.</p>

<p>Ronaldo will go down as one of the greatest ever players to where the Manchester United shirt and his second spell at Old Trafford, while somewhat unsettled, still added to that legacy.</p>
', CAST(N'2024-03-21T00:16:15.527' AS DateTime), NULL, 1, N'/Data/images/avatar/nat-callaghan-IEmaR3ecfuY-unsplash-816x459.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (27, N'there-should-be-no-regrets-over-ronaldos-old-trafford-return', N'THERE SHOULD BE NO REGRETS OVER RONALDO’S OLD TRAFFORD RETURN', 4, N'<p>It was not to have the fairytale ending that many had hoped for but regardless, Cristiano Ronaldo&rsquo;s second spell at Manchester United should not be a chapter of regret.</p>

<p>Playing some outstanding football during what was a troubled spell for the Red Devils, the Portuguese superstar can be proud of what he achieved in his second stint at Old Trafford.</p>

<h2>A Hero&rsquo;s Welcome For United Icon</h2>

<p>There is little doubt it was at Manchester United where the Cristiano Ronaldo legacy really took shape and the forward was welcomed back to the club with open arms in August 2021. Ronaldo hit the ground running with a brace against Newcastle in his first game back, before scoring against the likes of West Ham United, Tottenham Hotspur, Arsenal, Norwich and a Burnley side that are 1/12 in the&nbsp;<a href="https://www.betfair.com/betting/football/english-premier-league/relegation-2023-24/mwe-924.363383743">odds on the Premier League relegation results</a>&nbsp;this season. The returning star was not just banging in the goals against teams in the English top flight but was also prolific in the Champions League in that 2021/22 season. During the group&nbsp;stages, the veteran striker scored in five consecutive Champions League games and finished the group stage with six goals in total to his name.</p>

<p>&nbsp;</p>

<p><iframe id="fitvid234125" src="https://www.youtube.com/embed/BqBvUnZZtYo?version=3&amp;rel=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;fs=1&amp;hl=en-US&amp;autohide=2&amp;wmode=transparent"></iframe></p>

<p>A hip flexor issue did hinder his progress at some stages of the campaign but overall, on an individual basis, it really was an impressive start for Ronaldo, who showed he was still more than capable at the highest level. However, with United struggling as a side to keep up with rivals Manchester City and Liverpool on the Premier League table, all did not seem to be well behind the scenes in the Red Devils&rsquo; dressing room. Ronaldo returned to Old Trafford to try and help bring the good times back that he enjoyed during the successful spell for the club under manager Sir Alex Ferguson. However, he returned to a Manchester United side in a very different place and a somewhat&nbsp;<a href="https://www.theguardian.com/football/2021/nov/29/manchester-united-confirm-ralf-rangnick-as-interim-manager">fractured relationship with interim boss Ralf Rangnick</a>&nbsp;soon saw Ronaldo struggling for game time.</p>

<h2>Plenty Of Positives Still To Take From United Return</h2>

<p>Ultimately the arrival of Rangnick&rsquo;s replacement Erik Ten Hag saw Ronaldo&rsquo;s time at Old Trafford brought to an abrupt end. Despite finishing the club&rsquo;s top goalscorer the previous season, Ten Hag seemed to quickly decide Ronaldo was not in his plans going forward and the goal machine eventually moved on&nbsp;<a href="https://www.bbc.co.uk/sport/football/64155302">to Al Nassr on January 1st, 2023</a>. It brought to an end a turbulent chapter for Ronaldo and a chance for a new challenge to win silverware and grow the game in Saudi Arabia.</p>

<p>&nbsp;</p>

<p><iframe id="fitvid763060" src="https://www.youtube.com/embed/j8TcR4ihSyE?version=3&amp;rel=1&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;fs=1&amp;hl=en-US&amp;autohide=2&amp;wmode=transparent"></iframe></p>

<p>While the second spell at Old Trafford for Ronaldo didn&rsquo;t end as he would have hoped, the former Real Madrid and Juventus star should be proud of his efforts. The five-time Ballon d&rsquo;Or winner brought a focal point to the United attack and was instrumental in the final third when other attacking players seemed to be out of form. The club&rsquo;s next generation of stars also got an opportunity to train and play with one of the best players the game has ever seen and will have learned plenty from working alongside him.</p>

<p>Ronaldo will go down as one of the greatest ever players to where the Manchester United shirt and his second spell at Old Trafford, while somewhat unsettled, still added to that legacy.</p>
', CAST(N'2024-03-21T00:32:55.117' AS DateTime), NULL, 1, N'/Data/images/avatar/nat-callaghan-IEmaR3ecfuY-unsplash-816x459.jpg', 4, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (28, N'khac-phuc-loi-google-chan-css-va-javascript', N'KHẮC PHỤC LỖI GOOGLE CHẶN CSS VÀ JAVASCRIPT', 4, N'<p>Trong h&ocirc;m qua, Google tự dưng đồng loạt gửi h&agrave;ng đống email đến để th&ocirc;ng b&aacute;o website đang chặn Google Bot truy cập c&aacute;c tập tin CSS v&agrave; Javascript. Tạm thời chưa n&oacute;i đến việc th&ocirc;ng b&aacute;o lỗi n&agrave;y l&agrave; đ&uacute;ng hay sai, m&agrave; ch&uacute;ng ta n&ecirc;n biết tại sao Google lại th&ocirc;ng b&aacute;o như vậy.</p>

<p>Google Bot truy cập v&agrave;o website theo thuật to&aacute;n ri&ecirc;ng của n&oacute;, nhưng ch&uacute;ng ta c&oacute; thể kiểm so&aacute;t việc lấy dữ liệu của n&oacute; th&ocirc;ng qua tập tin robots.txt đặt tại thư mục gốc của website. Do vậy,&nbsp; th&ocirc;ng b&aacute;o n&agrave;y c&oacute; nghĩa l&agrave; một hoặc c&aacute;c tập tin CSS/JS tr&ecirc;n website đang bị chặn bởi robots.txt n&ecirc;n Google Bot sẽ kh&ocirc;ng truy cập được. Hiện tượng n&agrave;y c&oacute; thể l&agrave; do bạn chặn thư mục n&agrave;o đ&oacute;.</p>

<p><strong>Li&ecirc;n quan</strong>:&nbsp;<a href="https://thachpham.com/seo/khong-nen-chan-google-bot-thu-thap-file-css-va-js.html">Kh&ocirc;ng n&ecirc;n chặn CSS v&agrave; JS với Google Bot</a></p>

<p>V&igrave; vậy để chắc chắn rằng ch&uacute;ng ta cho ph&eacute;p Google Bot truy cập c&aacute;c tập tin CSS v&agrave; Javascript th&igrave; chỉ cần khai b&aacute;o th&ecirc;m đoạn sau v&agrave;o robots.txt của website (chưa c&oacute; th&igrave; tạo).</p>

<p><a href="https://azdigi.com/" rel="noopener" target="_blank"><img alt="Khuyến mãi Black Friday" src="https://thachpham.com/wp-content/swift-ai/images/wp-content/uploads/2024/03/Hosting-o-cung-NVMe-gia-re-nhat-1200x1200-01-png.webp" style="height:1000px; width:1000px" title="Khắc phục lỗi Google chặn CSS và Javascript 15" /></a></p>

<pre>
Allow: /*.js$
Allow: /*.css$</pre>

<p>V&agrave; nếu đầy đủ hơn th&igrave; ta sẽ c&oacute;:</p>

<pre>
User-agent: *
Allow: /*.js$
Allow: /*.css$</pre>

<p>V&agrave; sau khi th&ecirc;m d&ograve;ng đ&oacute; v&agrave;o, bạn c&oacute; thể y&ecirc;n t&acirc;m rằng website m&igrave;nh kh&ocirc;ng c&ograve;n chặn Google Bot xem CSS v&agrave; JS tr&ecirc;n website nữa.</p>
', CAST(N'2024-03-21T11:31:04.087' AS DateTime), NULL, 1, N'/Data/images/blog/html-css-js-course-intro.jpg', 3, 0, 0, NULL)
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (29, N'123', N'123', 78, N'<p>Thinking about overseas adventure travel? Have you put any thought into the best places to go when it comes to overseas adventure travel? Nepal is one of the most popular places of all, when you visit this magical country you will have the best adventures right there at your doorstep. Only overseas adventure travel in Nepal will give you these kinds of opportunities so if this is not on your list of possible places to visit yet then now is the time to put it on there!</p>

<p>In Nepal your overseas adventure travel is going to be fascinating. You will get to see the Himalayan Mountains and experience all that the rich Nepalese culture has to offer. They are an amazing people who have managed to hang on to their own culture and beliefs longer than most other countries. When overseas adventure travel takes you to Nepal you will have the chance to see all of the fantastic and one of a kind lakes and forests and you can even spend days or weeks camping out in their forests with a specialized guide. And the waterfalls in Nepal are to die for, you will never see anything more gorgeous in your life as their waterfalls! This should be at the top of your overseas adventure travel destination list for sure!</p>

<p><img alt="" src="https://themewagon.github.io/sona/img/blog/blog-details/blog-details-1.jpg" /></p>

<p><img alt="" src="https://themewagon.github.io/sona/img/blog/blog-details/blog-details-2.jpg" /></p>

<p><img alt="" src="https://themewagon.github.io/sona/img/blog/blog-details/blog-details-3.jpg" /></p>

<h4>If you live in New York City</h4>

<p>You know all about the traffic there. Getting places is often next to impossible, even with the gazillion yellow cabs. If you&rsquo;re like me you often look with envy at those shiny limousines with their unformed drivers and wish you could sit in one. Well, you can. New York limo service is more affordable than you think, whether it&rsquo;s for Newark airport transportation, LaGuardia airport transportation, or to drive wherever you wish to go.</p>

<h4>Every time I hail a cab in New York City</h4>

<p>I hope I&rsquo;ll be lucky enough to get one that&rsquo;s halfway decent and that the driver actually speaks English. I have spent many anxious moments wondering if I ever get to my destination. Or whether I&rsquo;d get ripped off. Even if all goes well, I can&rsquo;t say I can remember many rides in New York cabs that were very pleasant. And given how much they cost by now, going with a limo makes ever more sense.</p>
', CAST(N'2024-06-04T21:54:33.213' AS DateTime), NULL, 1, N'/Data/images/HD-wallpaper-sanji-anime-one-piece-manga.jpg', 1, NULL, NULL, N'123')
INSERT [dbo].[Blog] ([Id], [MetaTitle], [Name], [UserID], [Content], [PublishedDate], [LastModified], [Status], [ImageBlog], [CategoryBlogId], [Likes], [Views], [Title]) VALUES (30, N'1231', N'312', 4, N'<h1>C&aacute;c Dịch Vụ Cộng Th&ecirc;m</h1>

<p>Thứ năm, 20/07/2023</p>

<table border="1" style="width:100%">
	<tbody>
		<tr>
			<td colspan="3"><strong>C&aacute;c dịch vụ cộng th&ecirc;m:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
			<td><strong>&nbsp;</strong></td>
			<td><strong>&nbsp;</strong></td>
		</tr>
		<tr>
			<td><strong>STT</strong></td>
			<td><strong>C&aacute;c dịch vụ</strong></td>
			<td><strong>Gi&aacute; cước</strong></td>
			<td colspan="2"><strong>Ghi ch&uacute;</strong></td>
		</tr>
		<tr>
			<td>1</td>
			<td>Bảo hiểm h&agrave;ng h&oacute;a</td>
			<td>&nbsp;&nbsp; 0.07% gi&aacute; trị khai gi&aacute;, tối thiểu 230,000đ</td>
			<td colspan="2">Giải quyết đền b&ugrave; theo quy định, hợp đồng của b&ecirc;n Bảo hiểm.</td>
		</tr>
		<tr>
			<td>2</td>
			<td>B&aacute;o ph&aacute;t</td>
			<td>&nbsp;&nbsp; 5.000 VNĐ/ bưu gửi</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>3</td>
			<td>Bi&ecirc;n bản b&agrave;n giao</td>
			<td>&nbsp;&nbsp; 10.000 VNĐ/ bưu gửi</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>4</td>
			<td>Ph&aacute;t đồng kiểm</td>
			<td>&nbsp;&nbsp; 1.000 VNĐ/đơn vị kiểm</td>
			<td colspan="2">Tối thiểu 30,000đ, tối đa 300,000đ</td>
		</tr>
		<tr>
			<td>5</td>
			<td>Ph&aacute;t tận tay người nhận</td>
			<td>&nbsp;&nbsp; 10.000 VNĐ/ bưu gửi</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>6</td>
			<td>Chuyển Tiếp</td>
			<td>Nội Tỉnh: 4,500đ/lần Li&ecirc;n Tỉnh: t&iacute;nh theo cước ph&aacute;t sinh từ điểm chuyển tiếp đến điểm ph&aacute;t theo dịch vụ</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>7</td>
			<td>Chuyển ho&agrave;n</td>
			<td>Thư = 50% cước chiều đi Hàng hóa = 80% cước chi&ecirc;̀u đi Bưu gửi tuyến Huyện x&atilde;, v&ugrave;ng xa 100% cước chiều đi</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>8</td>
			<td>Dịch vụ đ&oacute;ng g&oacute;i</td>
			<td>&nbsp;&nbsp; Theo thỏa thuận</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>9</td>
			<td>Ph&iacute; ph&aacute;t h&agrave;ng Si&ecirc;u thị ( chỉ &aacute;p dụng với hệ thống kho Si&ecirc;u thị, kh&ocirc;ng &aacute;p dụng với cửa h&agrave;ng, doanh nghiệp nằm trong si&ecirc;u thị)</td>
			<td>Trọng lượng &lt; 40kg: ph&iacute; 50,000đ Trọng lượng &gt; 40kg: ph&iacute; 100,000đ</td>
			<td colspan="2">Đ&atilde; bao gồm ph&iacute; đồng kiểm</td>
		</tr>
		<tr>
			<td>10</td>
			<td>H&agrave;ng nguy&ecirc;n ki&ecirc;n, nguy&ecirc;n khối từ 150kg trở l&ecirc;n</td>
			<td>H&agrave; Nội, Đ&agrave; Nẵng, Hồ Ch&iacute; Minh: 0đ C&aacute;c Tỉnh c&ograve;n lại: + 500đ/kg</td>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td>11</td>
			<td>Ph&iacute; h&agrave;ng qu&aacute; khổ: từ 1,5 m trở l&ecirc;n</td>
			<td>&Aacute;p dụng nh&acirc;n 1,5 lần&nbsp; đối với TL &lt; 50kg</td>
			<td colspan="2">K&iacute;ch thước tối đa 3m, trường hợp &gt; 3m thỏa thuận</td>
		</tr>
		<tr>
			<td>13</td>
			<td>Phụ ph&iacute; H&agrave;ng chất lỏng</td>
			<td>Cộng th&ecirc;m 800đ/kg</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td rowspan="2">14</td>
			<td rowspan="2">Ph&iacute; ph&aacute;t ng&agrave;y chủ nhật, ng&agrave;y lễ</td>
			<td colspan="3">Ph&aacute;t tại H&agrave; Nội, Đ&agrave; Nẵng, Hồ ch&iacute; minh:Ngo&agrave;i cước ch&iacute;nh,cộng th&ecirc;m 100.000vnđ/bill</td>
		</tr>
		<tr>
			<td colspan="3">Ph&aacute;t tại c&aacute;c tỉnh kh&aacute;c:Ngo&agrave;i cước ch&iacute;nh,cộng th&ecirc;m 200.000vnđ/bill</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>Share&nbsp;</p>

<ul>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
	<li>&nbsp;</li>
</ul>

<h2>B&agrave;i viết li&ecirc;n quan</h2>

<ul>
	<li><a href="https://newpost.vn/blogs/dich-vu/cac-dich-vu-cong-them">C&aacute;c Dịch Vụ Cộng Th&ecirc;m</a></li>
	<li><a href="https://newpost.vn/blogs/dich-vu/chuyen-phat-tiet-kiem">Chuyển Ph&aacute;t Tiết Kiệm</a></li>
	<li><a href="https://newpost.vn/blogs/dich-vu/cod">COD</a></li>
	<li><a href="https://newpost.vn/blogs/dich-vu/logistic-kho-van-hau-can">Logistic - Kho Vận - Hậu cần</a></li>
	<li><a href="https://newpost.vn/blogs/dich-vu/van-tai">Vận tải</a></li>
</ul>

<h2>Danh mục</h2>

<ul>
	<li><a href="https://newpost.vn/blogs/huong-dan" title="">Hướng dẫn</a></li>
	<li><a href="https://newpost.vn/blogs/tuyen-dung" title="">Tuyển dụng</a></li>
	<li><a href="https://newpost.vn/blogs/dich-vu" title="">Dịch vụ</a></li>
	<li><a href="https://newpost.vn/blogs/tin-tuc" title="">Tin tức</a></li>
</ul>

<h2>B&agrave;i viết mới</h2>

<p><a href="https://newpost.vn/blogs/tin-tuc/thong-bao-nghi-le-quoc-khanh-02-09-2024" title=""><img alt="" src="https://newpost.vn/storage/2-9-2024.png" title="" /></a></p>

<h3><a href="https://newpost.vn/blogs/tin-tuc/thong-bao-nghi-le-quoc-khanh-02-09-2024" title="">Th&ocirc;ng b&aacute;o nghỉ lễ Quốc Kh&aacute;nh 02-09-2024</a></h3>

<p><a href="https://newpost.vn/blogs/tin-tuc/thong-bao-thoi-gian-nghi-le-304-va-15-nam-2024" title=""><img alt="" src="https://newpost.vn/storage/30-4-2024.png" title="" /></a></p>

<h3><a href="https://newpost.vn/blogs/tin-tuc/thong-bao-thoi-gian-nghi-le-304-va-15-nam-2024" title="">TH&Ocirc;NG B&Aacute;O THỜI GIAN NGHỈ LỄ 30/4 V&Agrave; 1/5 NĂM 2024</a></h3>

<p><a href="https://newpost.vn/blogs/tin-tuc/thong-bao-nghi-le-gio-to-hung-vuong-nam-2024" title=""><img alt="" src="https://newpost.vn/storage/phamnhan/post/thumb-gio-to.png" title="" /></a></p>

<h3><a href="https://newpost.vn/blogs/tin-tuc/thong-bao-nghi-le-gio-to-hung-vuong-nam-2024" title="">TH&Ocirc;NG B&Aacute;O NGHỈ LỄ GIỖ TỔ H&Ugrave;NG VƯƠNG NĂM 2024</a></h3>

<p><a href="https://newpost.vn/blogs/tin-tuc/ha-giang-oi-hanh-trinh-chinh-phuc-cuc-bac-to-quoc" title=""><img alt="" src="https://newpost.vn/storage/phamnhan/post/ha-giang-oi-thumb.jpg" title="" /></a></p>

<h3><a href="https://newpost.vn/blogs/tin-tuc/ha-giang-oi-hanh-trinh-chinh-phuc-cuc-bac-to-quoc" title="">H&agrave; Giang Ơi - H&agrave;nh Tr&igrave;nh Chinh Phục Cực Bắc Tổ Quốc</a></h3>
', CAST(N'2024-08-23T08:34:54.387' AS DateTime), NULL, 0, N'/Data/images/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', 1, NULL, NULL, N'123')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogCategory] ON 

INSERT [dbo].[BlogCategory] ([Id], [Name], [CreateDate]) VALUES (1, N'Student life', CAST(N'2024-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[BlogCategory] ([Id], [Name], [CreateDate]) VALUES (2, N'Travel', CAST(N'2024-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[BlogCategory] ([Id], [Name], [CreateDate]) VALUES (3, N'Research', CAST(N'2024-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[BlogCategory] ([Id], [Name], [CreateDate]) VALUES (4, N'Sport', CAST(N'2024-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[BlogCategory] ([Id], [Name], [CreateDate]) VALUES (5, N'Marketing', CAST(N'2024-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[BlogCategory] ([Id], [Name], [CreateDate]) VALUES (6, N'Reseach', CAST(N'2024-03-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BlogCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogComment] ON 

INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (1, N'Siuuuuuuuuu', CAST(N'2024-03-22T13:56:05.503' AS DateTime), 15, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (2, N'1', CAST(N'2024-03-22T14:05:53.027' AS DateTime), 14, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (3, N'2', CAST(N'2024-03-22T14:05:55.187' AS DateTime), 14, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (4, N'3', CAST(N'2024-03-22T14:05:58.053' AS DateTime), 14, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (5, N'4', CAST(N'2024-03-22T14:06:00.587' AS DateTime), 14, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (6, N'2', CAST(N'2024-03-22T14:06:04.390' AS DateTime), 14, 122, 5)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (7, N'3', CAST(N'2024-03-22T14:06:07.287' AS DateTime), 14, 122, 6)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (8, N'3', CAST(N'2024-03-22T14:06:09.877' AS DateTime), 14, 122, 7)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (9, N'1', CAST(N'2024-03-22T14:06:42.387' AS DateTime), 26, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (10, N'2', CAST(N'2024-03-22T14:07:13.620' AS DateTime), 26, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (11, N'3', CAST(N'2024-03-22T14:07:29.440' AS DateTime), 26, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (12, N'2', CAST(N'2024-03-22T14:07:37.053' AS DateTime), 26, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (13, N'123321', CAST(N'2024-03-22T14:42:10.217' AS DateTime), 21, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (14, N'321123', CAST(N'2024-03-22T14:42:16.767' AS DateTime), 21, 122, 13)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (15, N'1', CAST(N'2024-03-22T16:26:05.683' AS DateTime), 2, 4, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (16, N'2', CAST(N'2024-03-22T16:26:08.430' AS DateTime), 2, 4, 15)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (17, N'3', CAST(N'2024-03-22T16:26:16.830' AS DateTime), 2, 4, 16)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (18, N'1', CAST(N'2024-03-22T16:27:07.143' AS DateTime), 2, 4, 16)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (19, N'1', CAST(N'2024-03-22T16:27:16.127' AS DateTime), 2, 4, 15)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (20, N'1', CAST(N'2024-03-22T16:27:19.783' AS DateTime), 2, 4, 15)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (21, N'1', CAST(N'2024-03-22T16:28:22.277' AS DateTime), 2, 4, 15)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (22, N'1', CAST(N'2024-03-22T16:28:34.077' AS DateTime), 2, 4, 15)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (23, N'1', CAST(N'2024-03-22T16:30:19.807' AS DateTime), 14, 4, 5)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (24, N'1', CAST(N'2024-03-22T16:30:24.080' AS DateTime), 14, 4, 6)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (25, N'1', CAST(N'2024-03-22T16:30:35.703' AS DateTime), 28, 4, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (26, N'2', CAST(N'2024-03-22T16:30:50.047' AS DateTime), 28, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (27, N'2', CAST(N'2024-03-22T16:30:54.317' AS DateTime), 28, 4, 25)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (28, N'3', CAST(N'2024-03-22T16:31:25.747' AS DateTime), 28, 4, 25)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (29, N'2', CAST(N'2024-03-22T16:32:41.567' AS DateTime), 28, 122, 25)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (30, N'a', CAST(N'2024-03-22T16:33:49.290' AS DateTime), 28, 122, 26)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (31, N'b', CAST(N'2024-03-22T16:33:52.417' AS DateTime), 28, 122, 26)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (32, N'Hay thế nhì', CAST(N'2024-03-25T09:11:43.250' AS DateTime), 7, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (33, N'Siu', CAST(N'2024-03-25T09:32:45.540' AS DateTime), 27, 122, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (34, N'1', CAST(N'2024-06-04T22:00:43.557' AS DateTime), 29, 78, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (35, N'2', CAST(N'2024-06-04T22:00:46.780' AS DateTime), 29, 78, 34)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (36, N'1', CAST(N'2024-06-04T22:00:52.217' AS DateTime), 29, 78, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (37, N'1', CAST(N'2024-06-04T22:01:19.600' AS DateTime), 29, 4, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (38, N'xcx', CAST(N'2024-08-23T08:35:24.040' AS DateTime), 28, 4, 0)
INSERT [dbo].[BlogComment] ([Id], [CommentMsg], [CommentDate], [BlogID], [UserID], [ParentID]) VALUES (39, N'fcdf', CAST(N'2024-08-23T08:35:27.070' AS DateTime), 28, 4, 27)
SET IDENTITY_INSERT [dbo].[BlogComment] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (1, N'2222', CAST(N'2024-12-12T00:00:00.000' AS DateTime), 43, 60, 1, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (2, N'ads', CAST(N'2024-03-08T00:08:41.917' AS DateTime), 62, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (3, N'ads', CAST(N'2024-03-08T00:08:42.583' AS DateTime), 62, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (4, N'dfd', CAST(N'2024-03-08T00:08:43.347' AS DateTime), 62, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (5, N'fdf', CAST(N'2024-03-08T00:08:44.463' AS DateTime), 62, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (6, N'QuÁ ĐẸP TRAI
', CAST(N'2024-03-08T00:09:45.393' AS DateTime), 62, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (7, N'BAO NHIÊU tiền ', CAST(N'2024-03-08T00:10:11.387' AS DateTime), 60, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (8, N'a', CAST(N'2024-03-08T00:10:39.187' AS DateTime), 60, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (9, N'a', CAST(N'2024-03-08T00:10:40.607' AS DateTime), 60, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (10, N'hay', CAST(N'2024-03-08T00:12:04.883' AS DateTime), 51, 78, 0, 4)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (11, N'hay', CAST(N'2024-03-08T00:12:06.973' AS DateTime), 51, 78, 0, 4)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (12, N'a', CAST(N'2024-03-08T00:14:26.103' AS DateTime), 57, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (13, N's', CAST(N'2024-03-08T00:18:04.947' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (14, N's', CAST(N'2024-03-08T00:18:05.347' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (15, N's', CAST(N'2024-03-08T00:18:05.773' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (16, N's', CAST(N'2024-03-08T00:18:05.960' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (17, N's', CAST(N'2024-03-08T00:18:06.167' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (18, N's', CAST(N'2024-03-08T00:18:06.313' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (19, N's', CAST(N'2024-03-08T00:18:06.483' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (20, N's', CAST(N'2024-03-08T00:18:06.660' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (21, N's', CAST(N'2024-03-08T00:18:07.170' AS DateTime), 62, 78, 2, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (22, N's', CAST(N'2024-03-08T00:20:40.407' AS DateTime), 57, 78, 12, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (23, N'a', CAST(N'2024-03-08T00:20:44.060' AS DateTime), 57, 78, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (24, N'huy', CAST(N'2024-03-08T00:20:52.247' AS DateTime), 57, 78, 0, 4)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (25, N's', CAST(N'2024-03-08T09:20:55.723' AS DateTime), 57, 78, 24, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (26, N's', CAST(N'2024-03-08T09:21:11.040' AS DateTime), 57, 78, 24, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (27, N's', CAST(N'2024-03-08T09:21:14.757' AS DateTime), 57, 78, 26, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (28, N's', CAST(N'2024-03-08T09:21:17.547' AS DateTime), 57, 78, 27, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (29, N'a cái đầu m :)', CAST(N'2024-03-12T01:48:43.983' AS DateTime), 57, 78, 12, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (30, N'khánh mõm', CAST(N'2024-03-19T15:54:54.323' AS DateTime), 57, 4, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (31, N'1', CAST(N'2024-03-22T02:20:52.877' AS DateTime), 61, 4, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (32, N'32', CAST(N'2024-03-22T02:20:57.033' AS DateTime), 61, 4, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (33, N'23', CAST(N'2024-03-22T02:21:05.837' AS DateTime), 61, 4, 32, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (34, N'2', CAST(N'2024-03-22T02:43:21.727' AS DateTime), 60, 4, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (35, N'2', CAST(N'2024-03-22T02:43:46.697' AS DateTime), 60, 4, 0, 4)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (36, N'load', CAST(N'2024-03-22T02:44:23.767' AS DateTime), 60, 4, 0, 4)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (37, N'1', CAST(N'2024-06-04T22:01:45.347' AS DateTime), 49, 4, 0, 5)
INSERT [dbo].[Comment] ([Id], [CommentMsg], [CommentDate], [ProductID], [UserID], [ParentID], [Rate]) VALUES (38, N'2', CAST(N'2024-06-04T22:01:52.867' AS DateTime), 49, 4, 37, 5)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([Id], [Name], [MetaTitle], [Code], [QuestionList], [AnswerList], [ProductID], [StartDate], [EndDate], [TotalScore], [Time], [TotalQuestion], [Type], [Status], [QuestionEssay], [UserList], [ScoreList]) VALUES (1, N'Hạnh phúc', N'YES', N'1', N'*2*4*5*6*8*', N'A,B,C,D', 60, CAST(N'2002-02-02T00:00:00.000' AS DateTime), CAST(N'2002-02-02T00:00:00.000' AS DateTime), 100, 10, 10, N'1', 1, N'', N'*120*', N'1')
INSERT [dbo].[Exam] ([Id], [Name], [MetaTitle], [Code], [QuestionList], [AnswerList], [ProductID], [StartDate], [EndDate], [TotalScore], [Time], [TotalQuestion], [Type], [Status], [QuestionEssay], [UserList], [ScoreList]) VALUES (2, N' Học Thử Trao đổi KH Khoá 21 Tricks', N'312312', N'31', N'*1*2*3*', N'ada', 37, CAST(N'2024-02-23T00:00:00.000' AS DateTime), CAST(N'2024-02-12T00:00:00.000' AS DateTime), 22, 123, 22, N'1', 1, N'', N'*120*', N'22')
INSERT [dbo].[Exam] ([Id], [Name], [MetaTitle], [Code], [QuestionList], [AnswerList], [ProductID], [StartDate], [EndDate], [TotalScore], [Time], [TotalQuestion], [Type], [Status], [QuestionEssay], [UserList], [ScoreList]) VALUES (3, N' Học Thử Trao đổi KH Khoá 21 Tricks', N'123', N'34', N'*1*2*3*', N'34', 36, CAST(N'2024-02-29T00:00:00.000' AS DateTime), CAST(N'2024-03-04T00:00:00.000' AS DateTime), 34, 34, 34, N'1', 1, N'', N'*120*', N'34')
INSERT [dbo].[Exam] ([Id], [Name], [MetaTitle], [Code], [QuestionList], [AnswerList], [ProductID], [StartDate], [EndDate], [TotalScore], [Time], [TotalQuestion], [Type], [Status], [QuestionEssay], [UserList], [ScoreList]) VALUES (4, N' Học Thử Trao đổi KH Khoá 21 Tricks2', N'23', N'34', N'*1*2*3*', N'A,B,C', 37, CAST(N'2024-02-22T00:00:00.000' AS DateTime), CAST(N'2024-02-24T00:00:00.000' AS DateTime), 20, 10, 12, N'2', 1, N'', N'*120*', N'23')
INSERT [dbo].[Exam] ([Id], [Name], [MetaTitle], [Code], [QuestionList], [AnswerList], [ProductID], [StartDate], [EndDate], [TotalScore], [Time], [TotalQuestion], [Type], [Status], [QuestionEssay], [UserList], [ScoreList]) VALUES (6, N'123', N'3113231', N'3113', N'*1*2*3*', N'313131', 40, CAST(N'2024-03-01T17:46:00.000' AS DateTime), CAST(N'2024-02-21T17:46:00.000' AS DateTime), 2313, 12, 123, N'2', 1, N'', N'*120*', N'2313')
INSERT [dbo].[Exam] ([Id], [Name], [MetaTitle], [Code], [QuestionList], [AnswerList], [ProductID], [StartDate], [EndDate], [TotalScore], [Time], [TotalQuestion], [Type], [Status], [QuestionEssay], [UserList], [ScoreList]) VALUES (7, N' Học Thử Trao đổi KH Khoá 21 Tricks', N'13213', N'123', N'*1*2*3*', N'12312', 60, CAST(N'2024-02-14T19:53:00.000' AS DateTime), CAST(N'2024-02-14T19:53:00.000' AS DateTime), 123, 123, 123, N'2', 1, N'', N'*120*', N'1')
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (43, N'30 tuyệt chiêu gia tăng doanh số', N'KD0001', N'30-tuyet-chieu-gia-tang-doanh-so', N'Trở thành chuyên gia bán hàng, tăng doanh số tức thì với 30 tuyệt chiêu đơn giản, dễ làm, thông minh của giảng viên Phạm Thành Long.', N'/Data/images/avatar/images.jpg', NULL, NULL, NULL, NULL, 2, N'<p><strong>Bạn c&oacute; biết:</strong></p>

<p>Doanh số b&aacute;n h&agrave;ng lu&ocirc;n l&agrave; mục ti&ecirc;u h&agrave;ng đầu của bất kỳ c&aacute; nh&acirc;n, doanh nghiệp kinh doanh bởi n&oacute; quyết định tới sự tồn tại v&agrave; ph&aacute;t triển của ch&iacute;nh c&aacute; nh&acirc;n, doanh nghiệp đ&oacute;.</p>

<p>Tuy nhi&ecirc;n, l&agrave;m c&aacute;ch n&agrave;o để gia tăng doanh số b&aacute;n h&agrave;ng lại l&agrave; một c&acirc;u hỏi kh&oacute;, thường trực đối với c&aacute;c nh&agrave; kinh doanh.</p>

<p>Ở ngo&agrave;i kia, đ&atilde; c&oacute; kh&ocirc;ng &iacute;t người học kinh doanh, doanh nghiệp th&agrave;nh c&ocirc;ng trong kinh doanh, tăng tỉ lệ chốt Sales, b&aacute;n h&agrave;ng, gia tăng doanh số, thu lợi nhuận cao. Hẳn l&agrave; họ nắm trong tay những b&iacute; quyết ri&ecirc;ng!</p>

<p><strong>B&iacute; quyết gia tăng doanh số l&agrave;?</strong></p>

<p>C&acirc;u trả lời đặt ra đ&oacute; l&agrave; b&iacute; quyết l&agrave; g&igrave;? Kh&oacute;a học &ldquo;<strong>30 Tuyệt chi&ecirc;u gia tăng doanh số ngay lập tức</strong>&rdquo; Của Diễn giả - Luật sư Phạm Th&agrave;nh Long sẽ chia sẻ tới bạn 30 tuyệt chi&ecirc;u, b&iacute; quyết để gi&uacute;p bạn gia tăng doanh số b&aacute;n h&agrave;ng nhanh ch&oacute;ng. 30 tuyệt chi&ecirc;u rất đơn giản, nhưng mang lại hiệu quả v&agrave; bạn c&oacute; thể dễ thực hiện.</p>

<p>Cụ thể, kh&oacute;a học n&agrave;y bao gồm &nbsp;34 b&agrave;i giảng, được chia l&agrave;m 5 phần học rất cụ thể, lộ tr&igrave;nh b&agrave;i giảng chi tiết từ cơ bản đến n&acirc;ng cao.</p>

<p>- &nbsp;Phần 1: Tổng quan</p>

<p>- &nbsp;Phần 2: Thu h&uacute;t kh&aacute;ch h&agrave;ng tiềm năng:&nbsp;Bạn sẽ được chia sẻ c&aacute;c c&aacute;ch để thu h&uacute;t kh&aacute;ch h&agrave;ng tiềm năng mua sản phẩm của m&igrave;nh như c&aacute;ch tặng qu&agrave; miễn ph&iacute;, chiến lược bể c&aacute;, chiến lược đuổi tiền của bạn, chiến lược tạo landing page.</p>

<p>- &nbsp;Phần 3: Tăng tỉ lệ chốt sales:&nbsp;Bạn n&ecirc;n c&aacute;c chiến lược tăng tỉ đặt cuộc hẹn, biết c&aacute;ch x&acirc;y dựng th&acirc;n t&igrave;nh, chuyển t&iacute;nh năng th&agrave;nh lợi &iacute;ch, x&aacute;c định USP, sử dụng c&acirc;u chuyện để tăng tỷ lệ b&aacute;n h&agrave;ng.</p>

<p>- &nbsp;Phần 4: B&iacute; quyết tăng doanh số tr&ecirc;n mỗi đơn h&agrave;ng</p>

<p>- Phần 5: Chiến lược x&acirc;y dựng Fan cuồng</p>

<p>Trong thời buổi kinh tế thị trường, cạnh tranh cao như hiện nay, nếu bạn c&ograve;n chần chừ, do dự th&igrave; ắt hẳn phần thắng sẽ rơi v&agrave;o tay kẻ kh&aacute;c. Ch&iacute;nh bởi vậy m&agrave; ngay b&acirc;y giờ bạn cần phải học chiến lược kinh doanh&nbsp;để nắm trọn t&igrave;nh h&igrave;nh thị trường trong tay.&nbsp;Nhanh tay đăng k&yacute; ngay kh&oacute;a học &ldquo;<strong>30 Tuyệt chi&ecirc;u gia tăng doanh số ngay lập tức</strong>&rdquo; để c&ugrave;ng nhau kh&aacute;m ph&aacute; v&agrave; th&agrave;nh c&ocirc;ng.<br />
&nbsp;</p>
', CAST(N'2024-02-26T14:52:57.250' AS DateTime), NULL, CAST(N'2024-03-14T10:43:14.493' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,1,1', N'Bài1*bài2*bài3*bài4*bài 5')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (44, N'Học giỏi Tiếng Anh toàn diện: Nghe, Nói, Đọc, Viết', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Học giỏi Tiếng Anh toàn diện: Nghe, Nói, Đọc, Viết', N'/Data/images/bafc0d7be783949e76ecafc58618485b.jpg', NULL, NULL, NULL, NULL, 4, N'<blockquote>
<p dir="ltr"><em><strong>Nội dung kh&oacute;a học</strong></em></p>

<p dir="ltr">Phần 1: Tăng 3000 từ vựng Tiếng Anh th&ocirc;ng dụng trong 30 ng&agrave;y</p>

<p dir="ltr">Phần 2: Chắc 10 ngữ ph&aacute;p Tiếng Anh th&ocirc;ng dụng nhất trong giao tiếp</p>

<p dir="ltr">Phần 3: Chiến lược học ph&aacute;t &acirc;m chuẩn Tiếng Anh</p>

<p dir="ltr">Phần 4: 4 Chiến lược để nghe được Tiếng Anh</p>

<p dir="ltr">Phần 5: 5 Chiến lược học phản xạ n&oacute;i Tiếng Anh</p>

<p dir="ltr">Phần 6: Chiến lược đọc Tiếng Anh hiểu nhanh</p>

<p dir="ltr">Phần 7: Kỹ thuật luyện viết Tiếng Anh cho người bận rộn.</p>

<p dir="ltr">C&ograve;n chần chừ g&igrave; m&agrave; kh&ocirc;ng nhanh tay đăng k&yacute; kh&oacute;a học ngoại ngữ&nbsp;<em><strong>Học giỏi Tiếng Anh to&agrave;n diện: Nghe, n&oacute;i, đọc, viết</strong></em>&nbsp;c&oacute; tại&nbsp;<em><strong>Unica.vn</strong></em>&nbsp;để c&oacute; thể chinh phục ng&ocirc;n ngữ tiếng Anh trong thời gian ngắn nhất.&nbsp;</p>
</blockquote>
', CAST(N'2024-02-26T14:54:46.543' AS DateTime), NULL, CAST(N'2024-02-29T21:57:50.340' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (45, N'Thiết kế Powerpoint chuyên nghiệp', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Khóa học thiết kế PowerPoint chuyên nghiệp giúp học viên trình bày, thiết kế các bài thuyết trình ấn tượng với những slide cuốn hút, lôi kéo khán giả.', N'/Data/images/chinh-phuc-excel-cong-so_m_1555576079.jpg', NULL, NULL, NULL, NULL, 3, N'<p><strong>Nội dung kh&oacute;a học PowerPoint c&oacute; g&igrave; đặc biệt:</strong></p>

<p>Với mục ti&ecirc;u x&acirc;y dựng nền tảng tư duy Logic khi thiết kế v&agrave; tr&igrave;nh chiếu PowerPoint, giảng vi&ecirc;n Trần Quang Vũ lu&ocirc;n ch&uacute; trọng kết hợp giữa c&aacute;c kiến thức l&yacute; v&agrave; b&agrave;i tập thực h&agrave;nh gi&uacute;p học vi&ecirc;n c&oacute; thể vừa học vừa ứng dụng hiệu quả.</p>

<p>Nội dung xuy&ecirc;n suốt của kh&oacute;a học l&agrave; những kiến thức chi tiết li&ecirc;n quan đến thiết kế những Slide sao cho ấn tượng v&agrave; chuy&ecirc;n nghiệp nhất. Từ c&aacute;ch lựa chọn Font chữ ph&ugrave; hợp, h&igrave;nh ảnh chất lượng cao cho đến kỹ năng cắt gh&eacute;p v&agrave; khởi tạo một Video khi l&agrave;m Slide. Tất cả sẽ được giảng vi&ecirc;n chia sẻ đầy đủ v&agrave; trọn vẹn trong kh&oacute;a học n&agrave;y.&nbsp;</p>

<p>D&ugrave; l&agrave; h&igrave;nh thức học Online nhưng nội dung kh&oacute;a học Powerpoint lu&ocirc;n được cập nhập li&ecirc;n tục h&agrave;ng th&aacute;ng để đảm bảo cung cấp tới học vi&ecirc;n lộ tr&igrave;nh gi&aacute;o &aacute;n chuẩn nhất. V&igrave; thế, bạn c&oacute; thể học li&ecirc;n tục mọi l&uacute;c, mọi nơi th&ocirc;ng qua thiết bị di động hoặc m&aacute;y t&iacute;nh c&oacute; kết nối Internet để dễ d&agrave;ng tiếp cận được những kiến thức từ cơ bản đến chuy&ecirc;n s&acirc;u m&agrave; giảng vi&ecirc;n chia sẻ trong kh&oacute;a học.&nbsp;</p>
', CAST(N'2024-02-26T15:15:10.970' AS DateTime), NULL, CAST(N'2024-03-14T08:44:52.057' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (46, N'Thành thạo Excel 2010 trong 3 giờ', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Với 3 giờ với 30 bài học online với Unica giúp bạn nắm được từ cơ bản đến nâng cao Các tính năng, hàm cơ bản trong excel giúp việc quản lý, bảo mật hiệu quả', N'/Data/images/thanh-thao-google-spredsheets_m_1561369930.jpg', NULL, NULL, NULL, NULL, 3, N'<p>C&oacute; phải bạn:</p>

<p>- Biết đến&nbsp;c&ocirc;ng cụ Excel&nbsp;nhưng chỉ dừng lại ở bước nhập dữ liệu cơ bản</p>

<p>- Gặp kh&oacute; khăn trong việc quản l&yacute; sổ s&aacute;ch, quản l&yacute; - xử l&yacute; số liệu trong c&ocirc;ng cụ Excel</p>

<p>- Kh&ocirc;ng biết c&aacute;ch tổ chức số liệu một c&aacute;ch khoa học nhanh ch&oacute;ng trong qu&aacute; tr&igrave;nh sử dụng Excel&nbsp;</p>

<p>- Kh&ocirc;ng biết c&aacute;ch tổng hợp b&aacute;o c&aacute;o kết quả bằng c&aacute;c c&ocirc;ng thức h&agrave;m để tối ưu c&ocirc;ng việc</p>

<p>- Cần một phương ph&aacute;p, một lộ tr&igrave;nh học tin học văn ph&ograve;ng online nhanh ch&oacute;ng - linh động -&nbsp;hiệu quả&nbsp;v&agrave; ứng dụng được ngay v&agrave;o c&ocirc;ng việc của bạn một c&aacute;ch tốt nhất.</p>

<p>Ng&agrave;y nay, Excel 2010 ch&iacute;nh l&agrave; c&ocirc;ng cụ xử l&yacute; th&ocirc;ng tin - số liệu được&nbsp; to&agrave;n thế giới sử dụng, đặc biệt l&agrave; trong c&ocirc;ng việc y&ecirc;u cầu cần xử l&yacute; - quản l&yacute; nhanh số liệu th&ocirc;ng tin như văn ph&ograve;ng, kiểm to&aacute;n,...&nbsp;</p>

<p>Vậy th&igrave; đ&acirc;y&nbsp;ch&iacute;nh l&agrave; ch&igrave;a kh&oacute;a th&agrave;nh c&ocirc;ng m&agrave; bạn đang đi t&igrave;m: kh&oacute;a học trực tuyến&nbsp;<strong>&quot;Th&agrave;nh thạo Excel 2010 trong 03 giờ&quot;&nbsp;</strong>của giảng vi&ecirc;n đ&agrave;o tạo C&ocirc;ng nghệ th&ocirc;ng tin L&ecirc; Quang Hải.</p>

<p>Kh&oacute;a học c&oacute; lộ tr&igrave;nh học được chia l&agrave;m 5 phần học với c&aacute;c chủ đề nhỏ v&agrave; mục đ&iacute;ch ứng dụng kh&aacute;c nhau. Kiến thức&nbsp;đi từ cơ bản nhất như sử dụng v&agrave; thao t&aacute;c l&agrave;m việc với Excel 2010 cho đến kiến thức n&acirc;ng cao c&oacute; thể&nbsp;ứng dụng ngay v&agrave;o thực tế th&ocirc;ng qua c&aacute;c b&agrave;i tập c&oacute; trong kh&oacute;a học. Do vậy kh&oacute;a học ph&ugrave; hợp với tất cả mọi người, bất cứ ai c&oacute; nhu cầu t&igrave;m học c&ocirc;ng cụ Excel 2010 c&oacute; lộ tr&igrave;nh r&otilde; r&agrave;ng, b&agrave;n bản, chi tiết v&agrave; hiệu quả nhất.</p>

<p>Với nội dung b&agrave;i học được chia nhỏ theo từng t&iacute;nh năng kết hợp với phương ph&aacute;p thực h&agrave;nh trực quan, giảng vi&ecirc;n L&ecirc; Quang Hải sẽ gi&uacute;p c&aacute;c bạn c&oacute; thể&nbsp;nắm vững c&aacute;c kiến thức v&agrave; t&iacute;nh năng cơ bản nh&acirc;́t của Microsoft Excel 2010 với thời gian nhanh nh&acirc;́t chỉ trong 3 giờ, đ&ecirc;̉&nbsp;bạn nhanh ch&oacute;ng vận dụng th&agrave;nh thạo c&aacute;c h&agrave;m t&iacute;nh cơ bản v&agrave;o c&ocirc;ng việc xử l&yacute; - quản l&yacute; số liệu th&ocirc;ng tin một c&aacute;ch hiệu quả&nbsp;v&agrave; tối ưu nhất về cả hiệu suất c&ocirc;ng việc v&agrave; thời gian ho&agrave;n th&agrave;nh, c&aacute;ch mẹo tin học văn ph&ograve;ng Excel,&nbsp;c&aacute;ch bảo mật file Excel, c&aacute;ch ứng dụng kiến thức trong kh&oacute;a học v&agrave;o thực tế,...</p>

<p>Tham gia ngay kh&oacute;a học&nbsp;<strong>&quot;Th&agrave;nh thạo Excel 2010 trong 03 giờ&quot;</strong>&nbsp;để nhanh ch&oacute;ng th&ocirc;ng thạo v&agrave; trở th&agrave;nh bậc thầy xử l&yacute; số liệu với Microsoft Excel 2010 đỉnh cao!</p>
', CAST(N'2024-02-26T15:16:08.860' AS DateTime), NULL, CAST(N'2024-03-14T08:45:00.697' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (47, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/images/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 3, N'<p><strong>C&oacute; phải bạn l&agrave;:</strong></p>

<p>- Sinh vi&ecirc;n đại học v&agrave; muốn gi&agrave;nh giải cao trong MOS WORD 2010&nbsp;</p>

<p>- Sinh vi&ecirc;n năm ba, năm cuối cần giải ph&aacute;p l&agrave;m b&agrave;i tiểu luận, luận &aacute;n, đồ &aacute;n sao cho c&oacute; h&igrave;nh thức chuy&ecirc;n nghiệp v&agrave; nhanh ch&oacute;ng</p>

<p>- Đang đi t&igrave;m việc v&agrave; muốn l&agrave;m đẹp CV để g&acirc;y ấn tượng tốt với nh&agrave; tuyển dụng</p>

<p>- Nh&acirc;n vi&ecirc;n văn ph&ograve;ng muốn học tin học văn ph&ograve;ng online để cải thiện&nbsp;v&agrave; n&acirc;ng cao hơn hiệu suất c&ocirc;ng việc</p>

<p>- Bất cứ ai muốn học MOS Word 2010 để hiểu biết hơn về c&ocirc;ng cụ soạn thảo văn bản Word v&agrave; n&acirc;ng cao kỹ năng tin học của m&igrave;nh.</p>

<p>Vậy th&igrave; đ&acirc;y ch&iacute;nh l&agrave; giải ph&aacute;p m&agrave; bạn đang t&igrave;m kiếm:&nbsp;Kh&oacute;a học trực tuyến<strong>&nbsp;&quot;B&iacute; quyết luyện thi Mos Word 2010 tr&ecirc;n 900 điểm&quot;</strong>&nbsp;của giảng vi&ecirc;n Đặng Thanh Tr&uacute;c.</p>

<p>Với nội dung kh&oacute;a học được bi&ecirc;n soạn v&agrave; ph&acirc;n chia th&agrave;nh c&aacute;c lộ tr&igrave;nh - phần học tương ứng, học vi&ecirc;n sẽ được t&igrave;m hiểu to&agrave;n bộ kiến thức về c&ocirc;ng cụ Microsoft Word 2010 từ cơ bản nhất cho đến c&aacute;c kiến thức n&acirc;ng cao để ho&agrave;n thiện hơn kiến thức v&agrave; kỹ năng tin học của bản th&acirc;n.</p>

<p>Kh&oacute;a học được chia th&agrave;nh 8 phần học, trong mỗi phần học giảng vi&ecirc;n kh&ocirc;ng chỉ cung cấp kiến thức l&yacute; thuyết m&agrave; c&ograve;n&nbsp;hướng dẫn chi tiết c&aacute;c thao t&aacute;c&nbsp;để thực hiện kiến thức tốt nhất&nbsp;theo ti&ecirc;u ch&iacute; &quot;Học đi đ&ocirc;i với h&agrave;nh&quot;. Đặc biệt phần cuối&nbsp;của kh&oacute;a học&nbsp;ch&iacute;nh l&agrave; Luyện v&agrave; giải đề thi trực tiếp tr&ecirc;n Gmetrix l&agrave; phần học hay nhất. Với 8 b&agrave;i giảng l&agrave; 8 chủ đề xuất hiện trong b&agrave;i thi MOS Word 2010, c&ugrave;ng với sự hướng dẫn chi tiết đầy đủ của thầy Tr&uacute;c chắc chắn học vi&ecirc;n sau khi học word cơ bản v&agrave; thực h&agrave;nh th&agrave;nh thạo to&agrave;n bộ kiến thức trong kh&oacute;a học sẽ&nbsp;đạt 900+ MOS Word 2010 một c&aacute;ch dễ d&agrave;ng.</p>

<p><strong>Kh&oacute;a học n&agrave;y c&oacute; sự kh&aacute;c biệt g&igrave; so với c&aacute;c kh&oacute;a học c&ugrave;ng chủ đề kh&aacute;c:&nbsp;</strong></p>

<p>- Tiếp cận trực tiếp v&agrave; ch&iacute;nh x&aacute;c đề thi</p>

<p>- Cam kết đạt 900 điểm trở l&ecirc;n</p>

<p>- Được hỗ trợ trả lời v&agrave; giải đ&aacute;p mọi thắc mắc nhanh ch&oacute;ng</p>

<p>- B&agrave;i tập thực tế, b&aacute;m s&aacute;t chủ đề thi Mos</p>

<p>- Hướng dẫn b&iacute; quyết đạt điểm cao trong kỳ thi</p>

<p>Tham gia ngay kh&oacute;a học&nbsp;<strong>&quot;B&iacute; quyết luyện thi Mos Word 2010 tr&ecirc;n 900 điểm&quot;&nbsp;</strong>để tự tin đạt 900+ MOS Word 2010 với ng&ocirc;n ngữ tiếng Anh n&agrave;o!</p>
', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, CAST(N'2024-03-14T08:45:08.080' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (48, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/images/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 3, N'<p><strong>C&oacute; phải bạn l&agrave;:</strong></p>', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, CAST(N'2024-03-14T08:45:14.097' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (49, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (50, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (51, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (52, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, CAST(N'2024-02-29T22:34:46.013' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (53, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (54, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (55, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (56, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (57, N'Làm chủ Word 2016 từ cơ bản đến nâng cao', N'Beginer', N'lam-chu-word-2016-tu-co-ban-den-nang-cao', N'Làm chủ Word 2016 từ cơ bản đến nâng cao giúp bạn tự tin làm chủ phần mềm Word 2016, nâng cao kỹ năng tin học văn phòng, tự tin thi chứng chỉ', N'/Data/files/khoahoc/lam-chu-word-2016-tu-co-ban-den-nang-cao_jpg_m_1708682263.jpg', NULL, NULL, NULL, NULL, 1, N'', CAST(N'2024-02-26T15:17:30.800' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,0,0,0,0', N'0,0,0,0,0')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (60, N'2311', N'23123', N'3131', N'1232312', N'/Data/files/khoahoc/1602055970_pham-thanh-long-la-ai-5.jpg', NULL, NULL, NULL, NULL, 1, N'<p>123</p>
', CAST(N'2024-02-28T19:40:19.093' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'1', N'1')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (61, N'Cách sống để ai cũng yêu quý|Phạm Thành Long', N'KD0002', N'cach-song-de-ai-cung-yeu-cuoc-song', N'Cách sống để ai cũng yêu quý: Giúp đỡ chính bản thân mình trở nên giàu có thành công|Phạm Thành Long', N'/Data/images/images.jpg', NULL, NULL, NULL, NULL, 2, N'<p>Trong video ng&agrave;y h&ocirc;m nay t&ocirc;i sẽ chia sẻ b&iacute; quyết để sống m&agrave; ai cũng y&ecirc;u qu&yacute; bạn bằng c&aacute;ch gi&uacute;p đỡ ch&iacute;nh bản th&acirc;n m&igrave;nh trở n&ecirc;n th&agrave;nh c&ocirc;ng v&agrave; gi&agrave;u c&oacute;. Nghe c&oacute; vẻ m&acirc;u thuẫn&nbsp;</p>
', CAST(N'2024-02-28T21:46:47.140' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'0,1', N'Bài 1: Cách sống để ai cũng yêu quý*Bài2')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (62, N'Tư duy ngược biến Tiktok trở thành cỗ máy kiếm tiền cho bạn | Phạm Thành Long', N'KD0003', N'tu-duy-nguoc-bien-tiktok-thanh-co-may-kiem-tien', N' Phát triển kinh doanh Trong  ong hiệu cá nhân trên TikTok.', N'/Data/images/images.jpg', NULL, NULL, NULL, NULL, 2, N'<p>Trong thời đại số h&oacute;a hiện nay, TikTok kh&ocirc;ng chỉ l&agrave; một nền tảng giải tr&iacute; m&agrave; c&ograve;n mở ra cơ hội kiếm tiền online cho nhiều người, đặc biệt l&agrave; những ai muốn b&aacute;n h&agrave;ng TikTok Shop hoặc x&acirc;y dựng thương hiệu c&aacute; nh&acirc;n tr&ecirc;n TikTok. Trong video n&agrave;y, t&ocirc;i, Phạm Th&agrave;nh Long sẽ chia sẻ c&aacute;ch tiếp cận &quot;tư duy ngược&quot; gi&uacute;p bạn tận dụng tối đa khả năng n&agrave;y. 1. Tư Duy Ngược - Ch&igrave;a Kh&oacute;a Th&agrave;nh C&ocirc;ng tr&ecirc;n TikTok Thay v&igrave; theo đuổi những xu hướng ch&oacute;ng v&aacute;nh, t&ocirc;i khuy&ecirc;n rằng bạn n&ecirc;n tập trung v&agrave;o việc tạo ra nội dung &quot;forever green&quot; - những video c&oacute; gi&aacute; trị l&acirc;u d&agrave;i, kh&ocirc;ng vi phạm đạo đức hay bản quyền. Đ&acirc;y ch&iacute;nh l&agrave; nền tảng vững chắc để x&acirc;y dựng thương hiệu c&aacute; nh&acirc;n hoặc thương hiệu shop tr&ecirc;n TikTok. 2. Marketing TikTok: Nghệ Thuật B&aacute;n H&agrave;ng v&agrave; X&acirc;y Dựng Thương Hiệu Đối với những người mới bắt đầu b&aacute;n h&agrave;ng TikTok, việc hiểu v&agrave; &aacute;p dụng đ&uacute;ng c&aacute;ch c&aacute;c nguy&ecirc;n tắc của video marketing TikTok l&agrave; rất quan trọng. Nội dung video cần thiết kế sao cho g&acirc;y dựng được sự kết nối với kh&aacute;n giả, từ đ&oacute; n&acirc;ng cao khả năng chuyển đổi từ người xem sang kh&aacute;ch h&agrave;ng. 3. B&aacute;n H&agrave;ng TikTok Shop Hiệu Quả Khi b&aacute;n h&agrave;ng qua TikTok Shop, điều quan trọng l&agrave; phải ch&uacute; trọng v&agrave;o chất lượng sản phẩm v&agrave; c&aacute;ch thể hiện sản phẩm qua video. H&atilde;y đảm bảo rằng bạn cung cấp đủ th&ocirc;ng tin, h&igrave;nh ảnh r&otilde; r&agrave;ng v&agrave; thu h&uacute;t, tạo n&ecirc;n l&yacute; do thuyết phục kh&aacute;n giả muốn mua h&agrave;ng.</p>
', CAST(N'2024-02-28T21:53:49.310' AS DateTime), NULL, CAST(N'2024-02-29T22:35:56.590' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, N'0,1,1,1,1,1', N'Bài 1: Tư duy ngược biến Tiktok trở thành cỗ máy kiếm tiền cho bạn*Bài 2 :Tài liệu *Bài 3 : Tài liệu 2 * Bài 4 *Bài 5 ')
INSERT [dbo].[Product] ([Id], [Name], [Code], [MetaTitle], [Description], [Image], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescriptions], [Status], [ViewCount], [LinkVideo], [ListType], [ListFile]) VALUES (63, N'Cristiano Ronaldo: Hành Trình Từ Một Cậu Bé Madeira Đến Ngôi Sao Bóng Đá Thế Giới
', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (1, N'Công nghệ thông tin ', N'cong-nghe-thong-tin', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (2, N'Kinh Doanh ', N'kinh-doanh', NULL, 2, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (3, N'Tin học văn phòng', N'tin-hoc-van-phong', NULL, 3, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (4, N'Ngoại Ngữ', N'ngoai-ngu', NULL, 4, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (5, N'Marketing', N'marketing', NULL, 5, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Name], [MetaTitle], [ParentId], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ShowOnHome]) VALUES (6, N'Phòng the', N'phong-the', NULL, 6, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [Name], [Content], [Answer], [Type], [ProductID], [Status]) VALUES (2, N'Sinh nhật Huy ngày bao nhiêu ?', N'20**24**25**27', N'A', N'1', 31, 1)
INSERT [dbo].[Question] ([Id], [Name], [Content], [Answer], [Type], [ProductID], [Status]) VALUES (4, N'Abc', N'20**24**25**27', N'A', N'1', 31, 1)
INSERT [dbo].[Question] ([Id], [Name], [Content], [Answer], [Type], [ProductID], [Status]) VALUES (5, N'Bac', N'20**24**25**27', N'A', N'1', 31, 1)
INSERT [dbo].[Question] ([Id], [Name], [Content], [Answer], [Type], [ProductID], [Status]) VALUES (6, N'222', N'20**24**25**27', N'A', N'1', 31, 1)
INSERT [dbo].[Question] ([Id], [Name], [Content], [Answer], [Type], [ProductID], [Status]) VALUES (8, N'Cấu trúc cơ bản của một tài liệu HTML là gì?', N'Cấu trúc cơ bản của một tài liệu HTML bao gồm những phần nào?** <head> và <body>** <header> và <footer>**<title> và <body>**<head> và <main>', N'A', N'1', 31, 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Result] ([UserID], [ExamID], [ResultQuiz], [ResultEssay], [StartDateQuiz], [StartTimeQuiz], [FinishTimeQuiz], [StartTimeEssay], [FinishTimeEssay], [Status], [Score]) VALUES (120, 1, N'1A,2B,3B,4B,5C', N'<p>hay qu&aacute;</p>
', N'04/12/2024', N'2:30', N'2:30', NULL, N'2:30', 1, N'')
INSERT [dbo].[Result] ([UserID], [ExamID], [ResultQuiz], [ResultEssay], [StartDateQuiz], [StartTimeQuiz], [FinishTimeQuiz], [StartTimeEssay], [FinishTimeEssay], [Status], [Score]) VALUES (120, 2, N'1B', N'<p>Abc2123123</p>
', N'04/12/2024', N'9:17', N'9:17', NULL, N'9:17', 1, N'')
INSERT [dbo].[Result] ([UserID], [ExamID], [ResultQuiz], [ResultEssay], [StartDateQuiz], [StartTimeQuiz], [FinishTimeQuiz], [StartTimeEssay], [FinishTimeEssay], [Status], [Score]) VALUES (120, 6, N'1B', N'<p>huy</p>
', N'04/12/2024', N'2:28', N'2:28', NULL, N'2:28', 0, N'0')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (4, N'admin', N'1234', N'Huy Đình ', N'123', N'huygoku37@gmail.com', N'0328758801', CAST(N'2024-01-22T10:18:33.517' AS DateTime), N'AdminAdmin', CAST(N'2024-08-23T08:32:56.493' AS DateTime), N'User change avatar', 1, N'2,2,1', 1, N'/Data/images/images.jpg', CAST(N'2024-08-23T08:37:08.247' AS DateTime), N'"Xin chào! Tôi là một lập trình viên sáng tạo, yêu thích thách thức và luôn ham học hỏi. Đam mê công nghệ và sẵn lòng chia sẻ kiến thức của mình."







', N'https://www.facebook.com/dinhhuyy2012/', N'https://www.youtube.com/channel/UCYHf_qh7wWqntRHv43q30og', N'https://www.instagram.com/huypd_2012/', N'FPTU Education')
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (50, N'city', N'city', N'city2', N'citycc', N'city@gmail.com', N'0978403446', CAST(N'2024-01-21T23:15:54.797' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (60, N'adc', N'adc', N'adc', N'adc', N'adc', N'2323232', CAST(N'2024-01-22T10:18:33.517' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (63, N'ahuypd', N' ahuypd', N' ahuypd', N' ahuypd', N' ahuypd', N' ahuypd', CAST(N'2024-01-22T13:15:45.253' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (77, N'2', N'2222', N'33', N'2', N'', N'', CAST(N'2024-02-02T16:10:46.213' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (78, N'user2', N'user2', N'user2', N'232', N'huygoku37@gmail.com', N'32', CAST(N'2024-02-02T16:16:46.740' AS DateTime), NULL, CAST(N'2024-06-04T21:27:58.053' AS DateTime), N'User change avatar', 1, NULL, 2, N'/Data/images/images.jpg', CAST(N'2024-06-04T22:01:08.340' AS DateTime), NULL, N'https://www.facebook.com/dinhhuyy2012/', N'11111', N'https://www.facebook.com/dinhhuyy2012/', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (79, N'user4', N'user4', N'user4', N'', N'', N'', CAST(N'2024-02-02T16:20:22.240' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (80, N'2345', N'232323', N'gsgdsfg', N'', N'', N'', CAST(N'2024-02-02T16:28:09.300' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (81, N'2345', N'232323', N'gsgdsfg', N'', N'', N'', CAST(N'2024-02-02T16:28:09.830' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (82, N'user6', N'user6', N'user6', N'', N'', N'', CAST(N'2024-02-02T16:28:51.517' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (84, N'user12', N'user12', N'user12', N'', N'', N'', CAST(N'2024-02-02T16:31:16.820' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (85, N'123', N'1', N'12323', N'', N'', N'', CAST(N'2024-02-03T23:45:38.373' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (86, N'123', N'1', N'12323', N'', N'', N'', CAST(N'2024-02-03T23:45:40.367' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (116, N'11', N'111', N'1', N'1321', N'12', N'3123', CAST(N'2024-02-24T17:48:53.603' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (118, N'123', N'123', N'11321', N'21', N'3', N'2113', CAST(N'2024-02-28T19:39:55.200' AS DateTime), NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (119, N'huypd', N'123456', NULL, NULL, N'huypd@gmail.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (120, N'huypd1', N'123456', NULL, NULL, N'huypd2@gmail.com', NULL, CAST(N'2024-03-13T09:45:55.473' AS DateTime), N'User SignUp', CAST(N'2024-04-09T09:55:23.980' AS DateTime), N'User change avatar', 1, NULL, 2, N'/Data/images/avatar/images%20(1).jpg', CAST(N'2024-04-12T01:07:22.067' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (121, N'anhhuy', N'123456', NULL, NULL, N'huypd11@gmail.com', NULL, CAST(N'2024-03-13T20:39:11.820' AS DateTime), N'User SignUp', NULL, NULL, 1, NULL, 2, NULL, CAST(N'2024-03-13T20:39:11.820' AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [ProductList], [Role], [Avatar], [LastLogin], [AboutMe], [UrlFacebook], [UrlYoutube], [UrlInstagram], [Education]) VALUES (122, N'minhngoc', N'123456', N'minhngoc', N'Phúc yên', N'leminhngoc@gmail.com', N'0969591202', CAST(N'2024-03-15T00:52:51.670' AS DateTime), N'User SignUp', CAST(N'2024-03-25T00:00:00.000' AS DateTime), N'Change info profile', 1, NULL, 2, N'/Data/images/avatar/430123654_3579770075670012_5806851361636190043_n.jpg', CAST(N'2024-04-02T16:00:27.747' AS DateTime), N'Phúc yên', NULL, NULL, NULL, N'HANU')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF__Blog__Likes__503BEA1C]  DEFAULT ((0)) FOR [Likes]
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF__Blog__Views__51300E55]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Blog] FOREIGN KEY([Id])
REFERENCES [dbo].[Blog] ([Id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Blog]
GO
USE [master]
GO
ALTER DATABASE [OnlineLearn] SET  READ_WRITE 
GO
