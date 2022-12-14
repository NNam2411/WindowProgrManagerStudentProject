CREATE DATABASE QLSV 
GO

USE QLSV

GO

/****** Object:  Database [QLSV]    Script Date: 02/06/2022 7:16:19 CH ******/
CREATE DATABASE [QLSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLSV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLSV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [QLSV] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [QLSV] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [QLSV] SET ARITHABORT OFF 
GO

ALTER DATABASE [QLSV] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [QLSV] SET  DISABLE_BROKER 
GO

ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [QLSV] SET RECOVERY FULL 
GO

ALTER DATABASE [QLSV] SET  MULTI_USER 
GO

ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [QLSV] SET DB_CHAINING OFF 
GO

ALTER DATABASE [QLSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [QLSV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [QLSV] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [QLSV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [QLSV] SET QUERY_STORE = OFF
GO

ALTER DATABASE [QLSV] SET  READ_WRITE 
GO


CREATE TABLE [dbo].[Course](
	[id] [int] NOT NULL,
	[label] [nvarchar](100) NULL,
	[period] [int] NULL,
	[description] [text] NULL,
	[semester] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[hr](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](20) NULL,
	[password] [nchar](20) NULL,
	[email] [varchar](50) NULL,
	[f_name] [nchar](30) NULL,
	[l_name] [nchar](30) NULL,
	[fimage] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](20) NULL,
	[password] [nchar](20) NULL,
	[email] [varchar](50) NOT NULL,
	[f_name] [nchar](30) NULL,
	[l_name] [nchar](30) NULL,
	[fimage] [image] NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [CK_login_email] CHECK  (([email] like '%_@%_._%'))
GO

ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [CK_login_email]
GO


CREATE TABLE [dbo].[MyContact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](10) NULL,
	[lname] [varchar](10) NULL,
	[group_id] [int] NULL,
	[phone] [nchar](15) NULL,
	[email] [varchar](50) NULL,
	[address] [text] NULL,
	[pic] [image] NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_MyContact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[MyContact]  WITH CHECK ADD  CONSTRAINT [FK_MyContact_hr_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[hr] ([Id])
GO

ALTER TABLE [dbo].[MyContact] CHECK CONSTRAINT [FK_MyContact_hr_userid]
GO

ALTER TABLE [dbo].[MyContact]  WITH CHECK ADD  CONSTRAINT [FK_MyContact_MyGroup_groupid] FOREIGN KEY([group_id])
REFERENCES [dbo].[MyGroup] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[MyContact] CHECK CONSTRAINT [FK_MyContact_MyGroup_groupid]
GO

ALTER TABLE [dbo].[MyContact]  WITH CHECK ADD  CONSTRAINT [CK_MyContact_email] CHECK  (([email] like '%_@%_._%'))
GO

ALTER TABLE [dbo].[MyContact] CHECK CONSTRAINT [CK_MyContact_email]
GO


CREATE TABLE [dbo].[MyGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](30) NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_MyGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MyGroup]  WITH CHECK ADD  CONSTRAINT [FK_MyGroup_hr_userid] FOREIGN KEY([userid])
REFERENCES [dbo].[hr] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[MyGroup] CHECK CONSTRAINT [FK_MyGroup_hr_userid]
GO


CREATE TABLE [dbo].[score](
	[studentid] [int] NOT NULL,
	[courseid] [int] NOT NULL,
	[score] [float] NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[courseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Course_id] FOREIGN KEY([courseid])
REFERENCES [dbo].[Course] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[score] CHECK CONSTRAINT [FK_Score_Course_id]
GO

ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [FK_Score_std_id] FOREIGN KEY([studentid])
REFERENCES [dbo].[std] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[score] CHECK CONSTRAINT [FK_Score_std_id]
GO


CREATE TABLE [dbo].[std](
	[id] [int] NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[bdate] [date] NULL,
	[gender] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[picture] [image] NULL,
 CONSTRAINT [PK_std] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

