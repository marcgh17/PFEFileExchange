USE [master]
GO
/****** Object:  Database [IntelligentBusSystem]    Script Date: 2/25/2015 6:51:36 PM ******/
CREATE DATABASE [IntelligentBusSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IntelligentBusSystem', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IntelligentBusSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IntelligentBusSystem_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IntelligentBusSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IntelligentBusSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IntelligentBusSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IntelligentBusSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [IntelligentBusSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IntelligentBusSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IntelligentBusSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IntelligentBusSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IntelligentBusSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IntelligentBusSystem] SET  MULTI_USER 
GO
ALTER DATABASE [IntelligentBusSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IntelligentBusSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IntelligentBusSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IntelligentBusSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [IntelligentBusSystem]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressLat] [float] NOT NULL,
	[AddressLong] [float] NOT NULL,
	[AddressDescription] [text] NULL,
	[StudentID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bus]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[BusID] [int] IDENTITY(1,1) NOT NULL,
	[BusNumber] [int] NULL,
	[BusModel] [nvarchar](50) NOT NULL,
	[BusCapacity] [int] NOT NULL,
	[BusMaxCapacity] [int] NOT NULL,
	[BusStatus] [nvarchar](50) NOT NULL,
	[BusLat] [float] NOT NULL,
	[BusLong] [float] NOT NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassTripCategory]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassTripCategory](
	[ClassID] [int] NOT NULL,
	[TripCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_ClassTripCategory] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[TripCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DailyTrip]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyTrip](
	[DailyTripID] [int] IDENTITY(1,1) NOT NULL,
	[DailyTripDate] [date] NOT NULL,
	[ScheduledTripID] [int] NULL,
	[BusID] [int] NOT NULL,
	[DriverID] [nvarchar](50) NOT NULL,
	[DailyTripStartTime] [time](7) NULL,
	[DailyTripEndTime] [time](7) NULL,
 CONSTRAINT [PK_DailyTrip] PRIMARY KEY CLUSTERED 
(
	[DailyTripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Driver]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverID] [nvarchar](50) NOT NULL,
	[DriverFirstName] [nvarchar](50) NOT NULL,
	[DriverLastName] [nvarchar](50) NOT NULL,
	[DriverPhoto] [text] NULL,
	[DriverThumbPhoto] [text] NULL,
	[DriverLat] [float] NULL,
	[DriverLong] [float] NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parent]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[ParentID] [nvarchar](50) NOT NULL,
	[ParentPassword] [nvarchar](50) NOT NULL,
	[ParentFirstName] [nvarchar](50) NOT NULL,
	[ParentLastName] [nvarchar](50) NOT NULL,
	[ParentNumber] [text] NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleME] [nvarchar](1) NOT NULL,
	[ScheduleDay] [nvarchar](2) NOT NULL,
	[ScheduleDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScheduledTrip]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduledTrip](
	[ScheduledTripID] [int] NOT NULL,
	[BusID] [int] NOT NULL,
	[DriverID] [nvarchar](50) NOT NULL,
	[TripCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_ScheduleTripCategory] PRIMARY KEY CLUSTERED 
(
	[ScheduledTripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[School]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[School](
	[SchoolName] [text] NOT NULL,
	[SchoolLat] [float] NOT NULL,
	[SchoolLong] [float] NOT NULL,
	[SchoolPhoto] [text] NULL,
	[SchoolLogo] [text] NULL,
	[SchoolPhoneNumber] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](50) NOT NULL,
	[StudentFirstName] [nvarchar](50) NOT NULL,
	[StudentLastName] [nvarchar](50) NOT NULL,
	[StudentGender] [nvarchar](1) NOT NULL,
	[StudentBirthdate] [date] NULL,
	[StudentPhoto] [text] NULL,
	[StudentThumbPhoto] [text] NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentDailyTrip]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDailyTrip](
	[DailyTripID] [int] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[StudentDailyTripStatus] [nvarchar](50) NULL,
	[StudentDailyTripCheckTime] [time](7) NULL,
	[StudentDailyTripOrder] [int] NULL,
	[StudentDailyTripLat] [float] NULL,
	[StudentDailyTripLong] [float] NULL,
 CONSTRAINT [PK_StudentDailyTrip] PRIMARY KEY CLUSTERED 
(
	[DailyTripID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentParent]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentParent](
	[StudentID] [nvarchar](50) NOT NULL,
	[ParentID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StudentParent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentScheduledTrip]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentScheduledTrip](
	[ScheduledTripID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[StudentScheduledTripOrder] [int] NOT NULL,
 CONSTRAINT [PK_StudentScheduledTrip] PRIMARY KEY CLUSTERED 
(
	[ScheduledTripID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[StudentID] [nvarchar](50) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[SubscriptionYN] [nvarchar](1) NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SUser]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUser](
	[SUserID] [nvarchar](50) NOT NULL,
	[SUserPassword] [nvarchar](50) NOT NULL,
	[SUserFirstName] [nvarchar](50) NOT NULL,
	[SUserLastName] [nvarchar](50) NOT NULL,
	[SUserRole] [nvarchar](50) NOT NULL,
	[SUserPhoto] [text] NULL,
	[SUserThumbPhoto] [text] NULL,
 CONSTRAINT [PK_SUser] PRIMARY KEY CLUSTERED 
(
	[SUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TripCategory]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripCategory](
	[TripCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[TripCategoryTime] [time](7) NOT NULL,
 CONSTRAINT [PK_TripCategory] PRIMARY KEY CLUSTERED 
(
	[TripCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebAppMenu]    Script Date: 2/25/2015 6:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WebAppMenu](
	[WebAppMenuID] [int] IDENTITY(1,1) NOT NULL,
	[WebAppMenuText] [varchar](100) NULL,
	[WebAppMenuURL] [text] NULL,
	[WebAppMenuParent] [int] NULL,
	[WebAppMenuPosition] [int] NULL,
	[WebAppMenuRole] [varchar](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (1, N'M', N'Mo', N'Monday Morning')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (2, N'E', N'Mo', N'Monday Evening')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (3, N'M', N'Tu', N'Tuesday Morning')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (4, N'E', N'Tu', N'Tuesday Evening')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (5, N'M', N'We', N'Wednesday Morning')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (6, N'E', N'We', N'Wednesday Evening')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (7, N'M', N'Th', N'Thursday Morning')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (8, N'E', N'Th', N'Thursday Evening')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (9, N'M', N'Fr', N'Friday Morning')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (10, N'E', N'Fr', N'Friday Evening')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (11, N'M', N'Sa', N'Saturday Morning')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (12, N'E', N'Sa', N'Saturday Evening')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (13, N'M', N'Su', N'Sunday Morning')
INSERT [dbo].[Schedule] ([ScheduleID], [ScheduleME], [ScheduleDay], [ScheduleDescription]) VALUES (14, N'E', N'Su', N'Sunday Evening')
SET IDENTITY_INSERT [dbo].[Schedule] OFF
INSERT [dbo].[School] ([SchoolName], [SchoolLat], [SchoolLong], [SchoolPhoto], [SchoolLogo], [SchoolPhoneNumber]) VALUES (N'Notre Dame de Louaize', 33.953443, 35.613089, N'/img/school/NDL_Photo.png', N'/img/school/NDL_Logo.png', N'09221262')
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'aaa', N'aaa', N'a', N'a', N'A', N'/img/Users/Screenshot_2013-05-19-22-42-44.png', NULL)
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'aaaa', N'a', N'a', N'a', N'A', N'/img/Users/a70e43c87-e78f-4a03-a883-aaf8b9abd146Screenshot_2013-05-24-22-05-47.png', NULL)
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'aaaaa', N'aa', N'a', N'a', N'A', N'/img/Users/addd722fc-f6ce-49a6-ade2-0b0c22a7e549Screenshot_2013-05-24-22-05-47.png', NULL)
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'aaag', N'aa', N'Ma', N'Gh', N'A', N'/img/Users/nophoto.png', NULL)
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'Admin', N'Admin', N'Marc', N'Ghossein', N'A', N'/img/Users/nophoto.png', NULL)
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'gg', N'gg', N'g', N'b', N'A', N'/img/Users/nophoto.png', NULL)
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'hodabay', N'hoda', N'Hoda', N'Baydoun', N'U', N'/img/Users/Screenshot_2013-03-14-20-15-06.png', NULL)
INSERT [dbo].[SUser] ([SUserID], [SUserPassword], [SUserFirstName], [SUserLastName], [SUserRole], [SUserPhoto], [SUserThumbPhoto]) VALUES (N'qq', N'qq', N'qq', N'qq', N'A', N'/img/Users/qqa4a34364-ba75-455a-9570-b9fe9cb137caIMG_0709.JPG', N'/img/Users/thumb_qqe7b0a860-f9d2-40b0-aa0c-f0fbeca7f931IMG_0709.JPG')
SET IDENTITY_INSERT [dbo].[WebAppMenu] ON 

INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (1, N'Accueil', N'WelcomePage.aspx', 0, 1, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (2, N'Chercher Un Vol', N'#', 0, 2, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (3, N'Arrivees', N'Arrivees.aspx', 2, 3, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (4, N'Departs', N'Departs.aspx', 2, 4, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (5, N'Partenaires', N'Compagnies.aspx', 0, 5, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (6, N'S''Identifier', N'Login.aspx', 0, 6, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (7, N'Mes Vols', N'Vol.aspx', 6, 7, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (8, N'Ajouter Un Vol', N'AjouterUnVol.aspx', 6, 8, NULL)
INSERT [dbo].[WebAppMenu] ([WebAppMenuID], [WebAppMenuText], [WebAppMenuURL], [WebAppMenuParent], [WebAppMenuPosition], [WebAppMenuRole]) VALUES (9, N'A Propos', N'Propos.aspx', 0, 9, NULL)
SET IDENTITY_INSERT [dbo].[WebAppMenu] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Student]
GO
ALTER TABLE [dbo].[ClassTripCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClassTripCategory_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[ClassTripCategory] CHECK CONSTRAINT [FK_ClassTripCategory_Class]
GO
ALTER TABLE [dbo].[ClassTripCategory]  WITH CHECK ADD  CONSTRAINT [FK_ClassTripCategory_TripCategory] FOREIGN KEY([TripCategoryID])
REFERENCES [dbo].[TripCategory] ([TripCategoryID])
GO
ALTER TABLE [dbo].[ClassTripCategory] CHECK CONSTRAINT [FK_ClassTripCategory_TripCategory]
GO
ALTER TABLE [dbo].[DailyTrip]  WITH CHECK ADD  CONSTRAINT [FK_DailyTrip_Bus] FOREIGN KEY([BusID])
REFERENCES [dbo].[Bus] ([BusID])
GO
ALTER TABLE [dbo].[DailyTrip] CHECK CONSTRAINT [FK_DailyTrip_Bus]
GO
ALTER TABLE [dbo].[DailyTrip]  WITH CHECK ADD  CONSTRAINT [FK_DailyTrip_Driver] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([DriverID])
GO
ALTER TABLE [dbo].[DailyTrip] CHECK CONSTRAINT [FK_DailyTrip_Driver]
GO
ALTER TABLE [dbo].[DailyTrip]  WITH CHECK ADD  CONSTRAINT [FK_DailyTrip_ScheduledTrip] FOREIGN KEY([ScheduledTripID])
REFERENCES [dbo].[ScheduledTrip] ([ScheduledTripID])
GO
ALTER TABLE [dbo].[DailyTrip] CHECK CONSTRAINT [FK_DailyTrip_ScheduledTrip]
GO
ALTER TABLE [dbo].[ScheduledTrip]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledTrip_Bus] FOREIGN KEY([BusID])
REFERENCES [dbo].[Bus] ([BusID])
GO
ALTER TABLE [dbo].[ScheduledTrip] CHECK CONSTRAINT [FK_ScheduledTrip_Bus]
GO
ALTER TABLE [dbo].[ScheduledTrip]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledTrip_Driver] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([DriverID])
GO
ALTER TABLE [dbo].[ScheduledTrip] CHECK CONSTRAINT [FK_ScheduledTrip_Driver]
GO
ALTER TABLE [dbo].[ScheduledTrip]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledTrip_TripCategory] FOREIGN KEY([ScheduledTripID])
REFERENCES [dbo].[TripCategory] ([TripCategoryID])
GO
ALTER TABLE [dbo].[ScheduledTrip] CHECK CONSTRAINT [FK_ScheduledTrip_TripCategory]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[StudentDailyTrip]  WITH CHECK ADD  CONSTRAINT [FK_StudentDailyTrip_DailyTrip] FOREIGN KEY([DailyTripID])
REFERENCES [dbo].[DailyTrip] ([DailyTripID])
GO
ALTER TABLE [dbo].[StudentDailyTrip] CHECK CONSTRAINT [FK_StudentDailyTrip_DailyTrip]
GO
ALTER TABLE [dbo].[StudentDailyTrip]  WITH CHECK ADD  CONSTRAINT [FK_StudentDailyTrip_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentDailyTrip] CHECK CONSTRAINT [FK_StudentDailyTrip_Student]
GO
ALTER TABLE [dbo].[StudentParent]  WITH CHECK ADD  CONSTRAINT [FK_StudentParent_Parent] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Parent] ([ParentID])
GO
ALTER TABLE [dbo].[StudentParent] CHECK CONSTRAINT [FK_StudentParent_Parent]
GO
ALTER TABLE [dbo].[StudentParent]  WITH CHECK ADD  CONSTRAINT [FK_StudentParent_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentParent] CHECK CONSTRAINT [FK_StudentParent_Student]
GO
ALTER TABLE [dbo].[StudentScheduledTrip]  WITH CHECK ADD  CONSTRAINT [FK_StudentScheduledTrip_ScheduledTrip] FOREIGN KEY([ScheduledTripID])
REFERENCES [dbo].[ScheduledTrip] ([ScheduledTripID])
GO
ALTER TABLE [dbo].[StudentScheduledTrip] CHECK CONSTRAINT [FK_StudentScheduledTrip_ScheduledTrip]
GO
ALTER TABLE [dbo].[StudentScheduledTrip]  WITH CHECK ADD  CONSTRAINT [FK_StudentScheduledTrip_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentScheduledTrip] CHECK CONSTRAINT [FK_StudentScheduledTrip_Student]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Schedule]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Student]
GO
ALTER TABLE [dbo].[TripCategory]  WITH CHECK ADD  CONSTRAINT [FK_TripCategory_Schedule] FOREIGN KEY([ScheduleID])
REFERENCES [dbo].[Schedule] ([ScheduleID])
GO
ALTER TABLE [dbo].[TripCategory] CHECK CONSTRAINT [FK_TripCategory_Schedule]
GO
USE [master]
GO
ALTER DATABASE [IntelligentBusSystem] SET  READ_WRITE 
GO
